import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarioPage extends StatefulWidget {
  @override
  _CalendarioPageState createState() => _CalendarioPageState();
}

class _CalendarioPageState extends State<CalendarioPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final Map<DateTime, List<Color>> _eventos = {
    DateTime(DateTime.now().year, 10, 2): [Colors.purple],
    DateTime(DateTime.now().year, 10, 3): [Colors.lightBlue],
    DateTime(DateTime.now().year, 10, 15): [Colors.amber],
    DateTime(DateTime.now().year, 10, 30): [Colors.purple],
    DateTime(DateTime.now().year, 10, 31): [Colors.lightBlue],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendario Academico'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TableCalendar(
              firstDay: DateTime(2020),
              lastDay: DateTime(2030),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              eventLoader: _getEventsForDay,
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                weekendTextStyle: TextStyle(color: Colors.red),
                markerDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
                formatButtonShowsNext: false,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildLegendItem('Inicio de módulo', Colors.lightBlue),
                _buildLegendItem('Finalización de módulo', Colors.purple),
                _buildLegendItem('Descanso pedagógico', Colors.yellow),
                _buildLegendItem('Feriado', Colors.red),
                _buildLegendItem('Fecha límite de pago',
                    const Color.fromARGB(255, 231, 213, 159)),
              ],
            ),
          ),
        ],
      ),
    );
  }
  List<Color> _getEventsForDay(DateTime day) {
    return _eventos[day] ?? [];
  }
  Widget _buildLegendItem(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          color: color,
        ),
        SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}
