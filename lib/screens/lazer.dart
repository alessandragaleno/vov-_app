import 'package:flutter/material.dart';
import 'package:idoso_app/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: LazerScreen(),
    );
  }
}

class LazerScreen extends StatelessWidget {
  final List<TaskItem> tasks = [
    TaskItem('Música', 'lib/assets/images/musica.jpg', 'Músicas e danças para descontrair o paciente'),
    TaskItem('Exercicios de Relaxamento', 'lib/assets/images/exercicio.png', 'Manter a saúde fisica do paciente'),
    TaskItem('Aulas ou Tutoriais', 'lib/assets/images/aulas_tutoriais.jpg', 'Aulas e Tutoriais pensadas para melhorar o conehcimento do paciente'),
    TaskItem('Jogos', 'lib/assets/images/jogos.jpeg', 'Em horarios livres, jogos divertidos para grupos de idosos'),
    TaskItem('Eventos e Atividades Locais', 'lib/assets/images/aulas_tutoriais.jpg', 'Projetos e mentorias pensadas para melhorar a vida do paciente'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lazer do Paciente'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Ícone de seta para voltar
          onPressed: () {
            Navigator.pop(context); // Fecha a tela atual e volta para a anterior
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // Exibindo uma coluna
            crossAxisSpacing: 10, // Espaçamento horizontal
            mainAxisSpacing: 10, // Espaçamento vertical
            childAspectRatio: 9 / 1, // Proporção de cada item
          ),
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return GestureDetector(
              onTap: () {
                // Exemplo de ação ao clicar
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Tarefa: ${task.title}'),
                    content: Text(task.description),
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
                        child: Image.network(
                          task.imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        task.title,
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
    );
  }
}

class TaskItem {
  final String title;
  final String imagePath;
  final String description;

  TaskItem(this.title, this.imagePath, this.description);
}
