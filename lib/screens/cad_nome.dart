import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CadastroNomeScreen(),
    );
  }
}
/*class TelasCadastro extends StatefulWidget {
  @override
  _TelasCadastroState createState() => _TelasCadastroState();
}*/
/*class _TelasCadastroState extends State<TelasCadastro> {
  bool showFirstContainer = true;
  void toggleContainer() {
    setState(() {
      showFirstContainer = !showFirstContainer;
    });
  }
}*/

// Tela de conclusão
class ConclusaoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro Concluído"),
      ),
      body: Center(
        child: Text(
          "Parabéns! Você concluiu o cadastro.",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
// Tela de cadastro que solicita o nome do usuário
class CadastroNomeScreen extends StatefulWidget {
  @override
  _CadastroNomeScreenState createState() => _CadastroNomeScreenState();
}

class _CadastroNomeScreenState extends State<CadastroNomeScreen> {
  // Controlador para o campo de texto
  final TextEditingController _nomeController = TextEditingController(); //add essas linhas abaixo
  final TextEditingController _dataNascimentoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();

  // Etapa atual do fluxo de cadastro
  int _etapaAtual = 0;

  // Função para avançar para a próxima etapa
  void _proximaEtapa() {
    setState(() {
      _etapaAtual++;
    });

  //VAMOS SUBSTITUIR ISSO:
  // Função para validar e salvar o nome
  //void _salvarNome() {
  //  final nome = _nomeController.text;
  //POR ISSO:
  // Função para salvar e concluir o cadastro
  void _concluirCadastro() {
    final nome = _nomeController.text;
    final dataNascimento = _dataNascimentoController.text;
    final email = _emailController.text;
    final telefone = _telefoneController.text;

    if (nome.isNotEmpty && dataNascimento.isNotEmpty && email.isNotEmpty && telefone.isNotEmpty) {
      print("Cadastro concluído!");
      print("Nome: $nome");
      print("Data de nascimento: $dataNascimento");
      print("Email: $email");
      print("Telefone: $telefone");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ConclusaoScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Por favor, preencha todos os campos")),
      );
    }
  }
/*
    // Verifica se o nome não está vazio
    if (nome.isNotEmpty) {
      // Aqui você pode salvar o nome e navegar para a próxima tela
      print("Nome salvo: $nome");
      // Navegar para a próxima etapa do cadastro (exemplo)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProximaTela()),
      );
    } else {
      // Exibe uma mensagem de erro se o nome estiver vazio
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Por favor, insira seu nome")),
      );
    }*/
  }
  @override
  Widget build(BuildContext context) {
    // Obtendo as dimensões da tela
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/principal.jpeg'),
                fit: BoxFit.fill, // Ajusta a imagem para cobrir toda a tela
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              // Define a altura como 60% da altura da tela; ajuste conforme necessário
              height: screenHeight * 0.90,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
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
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 200.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //foi adicionado
                    children: [
                      if (_etapaAtual == 0) ...[
                      //Texto
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                        'Vamos começar o seu cadastro! Como você se chama?',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'Helvetica', // Define a fonte personalizada
                          fontSize: 25, // Tamanho do texto (ajuste conforme necessário)
                          ),
                          textAlign: TextAlign.center,
                         ),
                        ),         
            TextField(
              controller: _nomeController, // Controlador do campo de texto
              style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Digite seu nome',
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: const Color.fromARGB(255, 2, 122, 14)),
                          ),
                        ),
                      ),            
                      SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _proximaEtapa, //modificar
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            backgroundColor: const Color.fromARGB(255, 2, 122, 14), // Cor do botão
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: Text(
                            'Continuar',
                            style: TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 1.0),
                    ]
                        //foi adicionado
                        else if (_etapaAtual == 1) ...[
                          //Texto
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                        'Insira sua data de nascimento',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'Helvetica', // Define a fonte personalizada
                          fontSize: 25, // Tamanho do texto (ajuste conforme necessário)
                          ),
                          textAlign: TextAlign.center,
                         ),
                        ),         
            TextField(
              controller: _dataNascimentoController, // Controlador do campo de texto
              style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: '00/00/0000',
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: const Color.fromARGB(255, 2, 122, 14)),
                          ),
                        ),
                      ),            
                      SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _proximaEtapa,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            backgroundColor: const Color.fromARGB(255, 2, 122, 14), // Cor do botão
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: Text(
                            'Continuar',
                            style: TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 1.0),
                        ]
                        else if (_etapaAtual == 2) ...[
                          //Texto
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                        'Insira seu email',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'Helvetica', // Define a fonte personalizada
                          fontSize: 25, // Tamanho do texto (ajuste conforme necessário)
                          ),
                          textAlign: TextAlign.center,
                         ),
                        ),         
            TextField(
              controller: _emailController, // Controlador do campo de texto
              style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'nome@email.com',
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: const Color.fromARGB(255, 2, 122, 14)),
                          ),
                        ),
                      ),            
                      SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed:  _proximaEtapa,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            backgroundColor: const Color.fromARGB(255, 2, 122, 14), // Cor do botão
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: Text(
                            'Continuar',
                            style: TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 1.0),
                        ]
                        else if (_etapaAtual == 3) ...[
                          //Texto
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                        'Insira seu telefone',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'Helvetica', // Define a fonte personalizada
                          fontSize: 25, // Tamanho do texto (ajuste conforme necessário)
                          ),
                          textAlign: TextAlign.center,
                         ),
                        ),         
            TextField(
              controller: _telefoneController, // Controlador do campo de texto
              style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: '(xx)90000-0000',
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: const Color.fromARGB(255, 2, 122, 14)),
                          ),
                        ),
                      ),            
                      SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _proximaEtapa,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            backgroundColor: const Color.fromARGB(255, 2, 122, 14), // Cor do botão
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: Text(
                            'Continuar',
                            style: TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 1.0),
                        ]
                        else if (_etapaAtual == 4) ...[
              Text("por favor selecione a opção que melhor descreve você:"),
              SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                   onPressed: _proximaEtapa,
                    child: Text("Sou idoso e possuo cuidador."),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _etapaAtual = 0; // Reinicia o fluxo de cadastro
                      });
                    },
                    child: Text("Sou idoso."),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Volta para a tela anterior
                    },
                    child: Text("Sou cuidador"),
                  ),
                ],
              ),
            ],

                    ]
                      ),
                  ),
                ),
              ),
            ),
        ]
      )
    );
  }
}// Próxima tela do cadastro (exemplo)
class ProximaTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Próxima Etapa"),
      ),
      body: Center(
        child: Text(
          "Bem-vindo à próxima etapa do cadastro!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

