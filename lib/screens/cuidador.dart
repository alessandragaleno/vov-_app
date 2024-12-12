import 'package:flutter/material.dart';
import 'cuidador_conect.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CadastroIdosoCuidScreen(),
    );
  }
}

class CadastroIdosoCuidScreen extends StatefulWidget {
  @override
  _CadastroIdosoCuidScreenState createState() =>
      _CadastroIdosoCuidScreenState();
}

class _CadastroIdosoCuidScreenState extends State<CadastroIdosoCuidScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Você possui alguma formação ou experiência em cuidados com idosos?',
      'options': [
        'Não possuo',
        'Sim, possui conhecimento básico',
        'Sim, possuo conhecimento intermediário',
        'Sim, possuo conhecimento avançado'
      ],
      'answers': [true, false, false, false, false],
    },
  ];

  int _currentQuestionIndex = 0;



  @override
  Widget build(BuildContext context) {
    // Obtendo as dimensões da tela
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final currentQuestion = questions[_currentQuestionIndex]; // Pergunta atual

    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fundo_cadastro.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: screenHeight * 0.6, // Define a altura como 60% da altura da tela
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 100.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Exibição da pergunta e opções
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          currentQuestion['question'], // Pergunta atual
                          style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0), // Cor do texto
                            fontFamily: 'Helvetica', // Fonte personalizada
                            fontSize: 25, // Tamanho do texto conforme necessário
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ...currentQuestion['options'].asMap().entries.map((entry) {
                        int idx = entry.key;
                        String option = entry.value;
                        return CheckboxListTile(
                          title: Text(option),
                          value: currentQuestion['answers'][idx], // Alterado para 'answers'
                          onChanged: (bool? value) {
                            setState(() {
                              currentQuestion['answers'][idx] = value!; // Alterado
                            });
                          },
                          activeColor: const Color.fromARGB(255, 2, 122, 14), // Cor verde para o Checkbox selecionado
                          checkColor: Colors.white, // Cor do ícone do Checkbox
                        );
                      }).toList(),
                      SizedBox(height: 10.0),
                      // Navigation adicionado
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            // chamada da outra página
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                          backgroundColor: const Color.fromARGB(255, 2, 122, 14), // Cor verde do botão
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: Text(
                          'Próxima',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 7.0), // espaço entre botões
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
