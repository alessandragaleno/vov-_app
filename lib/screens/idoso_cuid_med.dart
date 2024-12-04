import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MedicationScreen(),
    );
  }
}

class MedicationScreen extends StatefulWidget {
  @override
  _MedicationScreenState createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen> {
  List<Map<String, dynamic>> medications = <Map<String, dynamic>>[
    <String, dynamic>{'name': '', 'time': '', 'dosage': '', 'unit': 'ml'},
  ];
  final List<String> units = <String>['ml', 'comprimido'];

  @override
  Widget build(BuildContext context) {
    // Obtenha as dimensões da tela
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // imagem de fundo
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/principal.jpg'),
                fit: BoxFit.fill, // Ajusta a imagem para cobrir toda a tela
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              //Define a altura como 60% da altura da tela; ajuste conforme necessário
              height: screenHeight * 0.90,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ...medications.map<Row>((Map<String, dynamic> medication) {
                        int index = medications.indexOf(medication);
                        return Row(
                          children: <Widget>[
                            // Nome do remédio
                            Flexible(
                              flex: 2,
                              child: TextField(
                                style: TextStyle(color: Colors.black, fontSize: 11),
                                decoration: InputDecoration(
                                  hintText: 'Remédio',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: BorderSide(color: Color.fromARGB(115, 136, 135, 135)),
                                  ),
                                ),
                                onChanged: (String value) => medication['name'] = value,
                              ),
                            ),
                            SizedBox(width: 8), // Espaço entre os campos

                            // Horário
                            Flexible(
                              flex: 2,
                              child: TextField(
                                style: TextStyle(color: Colors.black, fontSize: 11),
                                decoration: InputDecoration(
                                  hintText: '00:00',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: BorderSide(color: Color.fromARGB(115, 136, 135, 135)),
                                  ),
                                ),
                                onChanged: (String value) => medication['time'] = value,
                              ),
                            ),
                            SizedBox(width: 8), // Espaço entre os campos

                            // Dosagem
                            Flexible(
                              flex: 2,
                              child: TextField(
                                style: TextStyle(color: Colors.black, fontSize: 11),
                                decoration: InputDecoration(
                                  hintText: '0',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: BorderSide(color: Color.fromARGB(115, 136, 135, 135)),
                                  ),
                                ),
                                onChanged: (String value) => medication['dosage'] = value,
                              ),
                            ),
                            SizedBox(width: 8), // Espaço entre os campos

                            // Tipo de Dosagem
                            Flexible(
                              flex: 3,
                              child: DropdownButtonFormField<String>(
                                value: medication['unit'],
                                onChanged: (String? newValue) {
                                  setState(() {
                                    medication['unit'] = newValue!;
                                  });
                                },
                                items: units.map<DropdownMenuItem<String>>((String unit) {
                                  return DropdownMenuItem<String>(
                                    value: unit,
                                    child: Text(unit),
                                  );
                                }).toList(),
                                decoration: InputDecoration(labelText: 'Unidade'),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            medications.add(<String, dynamic>{'name': '', 'time': '', 'dosage': '', 'unit': 'comprimido'});
                          });
                        },
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {}, // Alterar aqui
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            backgroundColor: const Color.fromARGB(255, 2, 122, 14), // cor de botão
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: Text(
                            'Próximo',
                            style: TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ),
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
