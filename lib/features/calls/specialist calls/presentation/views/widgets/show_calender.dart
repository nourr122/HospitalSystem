import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ShowCalender extends StatefulWidget {
  const ShowCalender({super.key, required this.initialDate});
  final DateTime initialDate;

  @override
  State<ShowCalender> createState() => _ShowCalenderState();
}

class _ShowCalenderState extends State<ShowCalender> {
  late DateTime _focusedDay;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = widget.initialDate;
    _selectedDay = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all((MediaQuery.of(context).size.height) / 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: (MediaQuery.of(context).size.height) / 81),
          TableCalendar(
            daysOfWeekHeight: (MediaQuery.of(context).size.height) / 40,
            focusedDay: _focusedDay,
            firstDay: DateTime(2000),
            lastDay: DateTime(2100),
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });

              Navigator.pop(context, selectedDay);
            },
            calendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.sunday,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            calendarStyle: CalendarStyle(
              selectedTextStyle: const TextStyle(color: Color(0xff097FFF)),
              selectedDecoration: const BoxDecoration(
                color: Color(0xffE0EFFF),
                shape: BoxShape.circle,
              ),
              todayTextStyle: const TextStyle(color: Color(0xff097FFF)),
              todayDecoration: BoxDecoration(
                color: Colors.white.withOpacity(.1),
                shape: BoxShape.circle,
              ),
            defaultTextStyle: const TextStyle(color: Colors.black),
            weekendTextStyle: const TextStyle(color: Colors.black),
            ),

          ),
        ],
      ),
    );
  }
}
