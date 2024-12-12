import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela de Conexão"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Gostaria de conectar agora ao seu paciente?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
             SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Ação ao pressionar "Sim, conectar"
                  print('Sim, conectar');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  backgroundColor: const Color.fromARGB(255, 2, 122, 14), // cor do botão
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                // Ação ao pressionar "Sim, conectar agora"
              child: Text('Sim, conectar',
              style: TextStyle(fontSize: 18.0, color: Colors.white)),
            ),
              ),
            SizedBox(height: 10),
            // Botão "Não, conectar"
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Ação ao pressionar "Não, conectar"
                  print('Não, Continuar');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  backgroundColor: const Color.fromARGB(255, 2, 122, 14), // cor do botão
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text(
                  'Não, Continuar',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
