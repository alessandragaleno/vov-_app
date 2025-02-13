import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

 void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contatos do Idoso',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ContactsListScreen(),
    );
  }
}

class Contact {
  final String name;
  final String phone;
  final String relationship;

  Contact({required this.name, required this.phone, required this.relationship});
}

class ContactsListScreen extends StatefulWidget {
  @override
  _ContactsListScreenState createState() => _ContactsListScreenState();
}

class _ContactsListScreenState extends State<ContactsListScreen> {
  List<Contact> contacts = [];

  void _addContact(Contact contact) {
    setState(() {
      contacts.add(contact);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos do Idoso'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              title: Text(contact.name),
              subtitle: Text('${contact.relationship} - ${contact.phone}'),
              trailing: Icon(Icons.call),
              onTap: () {
                // Aqui pode-se adicionar uma ação de ligar ou mais detalhes
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddContactScreen(
                onAddContact: _addContact,
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddContactScreen extends StatefulWidget {
  final Function(Contact) onAddContact;

  AddContactScreen({required this.onAddContact});

  @override
  _AddContactScreenState createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _relationshipController = TextEditingController();

  void _saveContact() {
    final String name = _nameController.text;
    final String phone = _phoneController.text;
    final String relationship = _relationshipController.text;

    if (name.isEmpty || phone.isEmpty || relationship.isEmpty) {
      return;
    }

    final newContact = Contact(
      name: name,
      phone: phone,
      relationship: relationship,
    );

    widget.onAddContact(newContact);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Contato'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Telefone'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: _relationshipController,
              decoration: InputDecoration(labelText: 'Relacionamento'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveContact,
              child: Text('Salvar Contato'),
            ),
          ],
        ),
      ),
    );
  }
}
