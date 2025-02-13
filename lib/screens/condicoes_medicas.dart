import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Condicoes Medicas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ConditionsListScreen(),
    );
  }
}

class MedicalCondition {
  final String name;
  final String description;
  final String symptoms;
  final String treatment;

  MedicalCondition({
    required this.name,
    required this.description,
    required this.symptoms,
    required this.treatment,
  });
}

class ConditionsListScreen extends StatefulWidget {
  @override
  _ConditionsListScreenState createState() => _ConditionsListScreenState();
}

class _ConditionsListScreenState extends State<ConditionsListScreen> {
  List<MedicalCondition> conditions = [];

  void _addCondition(MedicalCondition condition) {
    setState(() {
      conditions.add(condition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Condições Médicas'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: conditions.length,
        itemBuilder: (context, index) {
          final condition = conditions[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              title: Text(condition.name),
              subtitle: Text(condition.description),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConditionDetailScreen(condition: condition),
                  ),
                );
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
              builder: (context) => AddConditionScreen(onAddCondition: _addCondition),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ConditionDetailScreen extends StatelessWidget {
  final MedicalCondition condition;

  ConditionDetailScreen({required this.condition});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(condition.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Descrição:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(condition.description),
            SizedBox(height: 16),
            Text(
              'Sintomas:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(condition.symptoms),
            SizedBox(height: 16),
            Text(
              'Tratamento:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(condition.treatment),
          ],
        ),
      ),
    );
  }
}

class AddConditionScreen extends StatefulWidget {
  final Function(MedicalCondition) onAddCondition;

  AddConditionScreen({required this.onAddCondition});

  @override
  _AddConditionScreenState createState() => _AddConditionScreenState();
}

class _AddConditionScreenState extends State<AddConditionScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _symptomsController = TextEditingController();
  final TextEditingController _treatmentController = TextEditingController();

  void _saveCondition() {
    final String name = _nameController.text;
    final String description = _descriptionController.text;
    final String symptoms = _symptomsController.text;
    final String treatment = _treatmentController.text;

    if (name.isEmpty || description.isEmpty || symptoms.isEmpty || treatment.isEmpty) {
      return;
    }

    final newCondition = MedicalCondition(
      name: name,
      description: description,
      symptoms: symptoms,
      treatment: treatment,
    );

    widget.onAddCondition(newCondition);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Condição Médica'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome da Condição'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Descrição'),
              maxLines: 4,
            ),
            TextField(
              controller: _symptomsController,
              decoration: InputDecoration(labelText: 'Sintomas'),
            ),
            TextField(
              controller: _treatmentController,
              decoration: InputDecoration(labelText: 'Tratamento'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveCondition,
              child: Text('Salvar Condição'),
            ),
          ],
        ),
      ),
    );
  }
}
