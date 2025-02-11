import 'package:flutter/material.dart';
import 'agenda_paciente.dart';
import 'calendario.dart';
import 'lazer.dart';
import 'compras.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OptionsScreen(),
      routes: {
        '/calendario': (context) => AgendaScreen(),
        '/agenda_paciente': (context) => PacienteScreen(),
        '/lazer': (context) => LazerScreen(),
        '/compras': (context) => MarketplaceScreen(),
      },
    );
  }
}

class OptionsScreen extends StatelessWidget {
  final List<OptionItem> options = [
    OptionItem('calendario', 'lib/assets/images/calendario.png'),
    OptionItem('Meu paciente', 'lib/assets/images/paciente.png'),
    OptionItem('comunidade', 'lib/assets/images/comunidade.png'),
    OptionItem('Lazer', 'lib/assets/images/lazer.png'),
    OptionItem('Compras', 'lib/assets/images/compras.png'),
    OptionItem('Dicas', 'lib/assets/images/Dicas.png'),
    OptionItem('Direitos dos Idosos', 'lib/assets/images/direitos.jpeg'),
    OptionItem('Lembretes', 'lib/assets/images/lembretes.png'),
    OptionItem('Vagas', 'lib/assets/images/vagas.png'),
    OptionItem('Consulta Médica Online', 'lib/assets/images/consulta.png'),
    OptionItem('Usuario', 'lib/assets/images/usuario.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          // Cabeçalho com saudação, imagem e botão de emergência
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('lib/assets/images/usuario.png'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Olá, Usuário',
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
                prefixIcon: Icon(Icons.search),
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
          
          // Lista de opções (GridView)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // Número de colunas
                  crossAxisSpacing: 10, // Espaçamento horizontal
                  mainAxisSpacing: 10, // Espaçamento vertical
                  childAspectRatio: 9 / 1, // Proporção de container
                ),
                itemCount: options.length, // Corrigido para usar a quantidade de opções
                itemBuilder: (context, index) {
                  final option = options[index];
                  return GestureDetector(
                    onTap: () {
                      switch (option.title) {
                        case 'Calendario':
                          Navigator.pushNamed(context, '/calendario');
                          break;
                        case 'Agenda do Paciente':
                          Navigator.pushNamed(context, '/agenda_paciente');
                          break;
                        case 'Lazer':
                          Navigator.pushNamed(context, '/lazer');
                          break;
                        case 'Compras':
                          Navigator.pushNamed(context, '/compras');
                          break;
                        default:
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Erro'),
                              content: Text('Página não encontrada para ${option.title}'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                      }
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
                      padding: EdgeInsets.all(8.0),
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
                          SizedBox(width: 15),
                          Expanded(
                            child: Text(
                              option.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
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
