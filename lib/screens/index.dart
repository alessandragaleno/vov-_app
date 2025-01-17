import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OptionsScreen(),
    );
  }
}

class OptionsScreen extends StatelessWidget {
  final List<OptionItem> options = [
    OptionItem('calendario', 'lib/assets/images/calendario.png'),
    OptionItem('Meu paciente', 'lib/assets/images/pacinete.png'),
    OptionItem('comunidade', 'lib/assets/images/comunidade.png'),
    OptionItem('Lazer', 'lib/assets/images/lazer.png'),
    OptionItem('Dicas', 'lib/assets/images/Dicas.png'),
    OptionItem('Direitos dos Idosos', 'lib/assets/images/direitos.jpeg'),
    OptionItem('Lembretes', 'lib/assets/images/lembretes.png'),
    OptionItem('Vagas', 'lib/assets/images/vagas.png'),
    OptionItem('Consulta Médica Online', 'lib/assets/iamges/consulta.png'),
    OptionItem('Usuario', 'lib/assets/images/usuario.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column( // Corrigido de "Colunm" para "Column"
        children: <Widget>[
          // cabeçalho com saudação, imagem e botão de emergência
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('lib/assets/images/usuario.png'), // Corrigido a chamada do AssetImage
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Olá, Usuário', // Corrigido o nome "Usúario" para "Usuário"
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Bem Vindo!',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Ação do botão de emergência
                    print('Botão de emergência Pressionado');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    'Emergência',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          // Barra de pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Pesquise aqui...',
                prefixIcon: Icon(Icons.search), // Corrigido a chamada do ícone
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                // Lógica de busca (options)
                print('Texto digitado: $value');
              },
            ),
          ),
          SizedBox(height: 10),
          // lista de opções (GridView)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // número de colunas
                  crossAxisSpacing: 10, // Espaçamento horizontal
                  mainAxisSpacing: 10, // Espaçamento vertical
                  childAspectRatio: 9 / 1, // proporção de container
                ),
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final option = options[index];
                  return GestureDetector(
                    onTap: () {
                      // Ação ao clicar no container
                      print('Clicou em: ${option.title}'); // Corrigido o uso da interpolação de string
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Ação'),
                          content: Text('Você clicou em ${option.title}'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Ok'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // Sombra em x e y
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(2.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
              child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                option.imagePath,
                                fit: BoxFit.cover,
                            ),
                          ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            option.title,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OptionItem {
  final String title;
  final String imagePath;

  OptionItem(this.title, this.imagePath);
}
