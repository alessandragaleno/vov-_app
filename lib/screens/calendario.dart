import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
  }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AgendaScreen(),
    );
  }
}
class AgendaScreen extends StatefulWidget {
  @override
  _AgendaScreenState createState() => _AgendaScreenState();
  }
class _AgendaScreenState extends State<AgendaScreen> {
  final DateTime _selecteDay  = DateTime.now();
  final Map<DateTime, List<String>> _events = {
    DateTime.now(): ['Tomar Caverdilol', 'Tomar Metformina', 'Tomar Enalapril' 'Hidroginástica'],
};

@override
Widget build(BuildContext context) {
  final String dayOfMonth = DateFormat('d').format(_selecteDay);
  final String dayOfWeek = DateFormat('EEE').format(_selecteDay);
  final String monthAndYear = DateFormat('MMM').format(_selecteDay);

  return Scaffold(
    appBar: AppBar(
      title: Text(''),
      centerTitle: true,
    ),

