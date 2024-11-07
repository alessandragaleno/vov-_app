import 'package:flutter/material.dart';
import 'cad_nome.dart'; //  chamada do cad_nome 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleLogin(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    // Validação simples
    if (email == "Teste" && password == "1234") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CadastroNomeScreen()),
      );
     } else{//  chamada do cad_nome
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login ou senha incorretos.')),
      );
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login feito com sucesso! $email')),
    );
  }

  void handleRecoverPassword(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Recuperar senha pressionada')),
    );
  }

  void handleLoginGoogle(BuildContext context) {
    // Aqui você pode adicionar a lógica de login com Google
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login via Google pressionado')),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                image: AssetImage('lib/assets/images/velhinho.jpeg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.05,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'lib/assets/images/logo_app.png',
                height: 70.0,
              ),
            ),
          ),
          // Seção de login posicionada na parte interior
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              // Define a altura como 60% da altura da tela; ajuste conforme necessário
              height: screenHeight * 0.5,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 5.0,
                  blurRadius: 10,
                  offset: Offset(0, -3),
                ),
                ],
              ),
              // ignore: prefer_const_literals_to_create_immutables
            
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Campo DE email
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Color.fromARGB(115, 136, 135, 135)),
                      ),
                      prefixIcon: Icon(Icons.email, color: Colors.grey),
                    ),
                  ),
                   SizedBox(height: 7.0),
                  // Campo de senha
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: const Color.fromARGB(115, 136, 135, 135)),
                      ),
                      prefixIcon: Icon(Icons.lock, color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 7.0),
                  // opção de senha
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => handleRecoverPassword(context),
                      child: Text(
                        'Recuperar Senha',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ),
                  SizedBox(height: 7.0),
                  // Botão de login
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => handleLogin(context),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        backgroundColor: const Color.fromARGB(255, 2, 122, 144), // cor do botão
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: Text(
                        'Entrar',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 7.0),
                  // opção de entrar com o google
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () => handleLoginGoogle(context),
                      icon: Image.asset(
                        'lib/assets/images/google.png', // Adicione um ícone do Google no diretório de assets
                        height: 24.0,
                        width: 24.0,
                      ),
                      label: Text(
                        'Entrar com Google',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        side: BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 7.0),
                  // Barra inferior com Registro
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Não tem conta?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navegar para a tela de registro
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Navegar para Registro')),
                          );
                        },
                        child: Text(
                          'Registre-se aqui',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
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
