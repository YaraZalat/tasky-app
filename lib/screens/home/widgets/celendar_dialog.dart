import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../auth/widgets/materialButtonWidget.dart';

class CustomCalendarDialog extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const CustomCalendarDialog({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  State<CustomCalendarDialog> createState() => _CustomCalendarDialogState();
}

class _CustomCalendarDialogState extends State<CustomCalendarDialog> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  @override
  void initState() {
    _focusedDay = widget.selectedDate;
    _selectedDay = widget.selectedDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2000, 1, 1),
              lastDay: DateTime.utc(2100, 12, 31),
              selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: CalendarStyle(
                defaultTextStyle: const TextStyle(color: Colors.white),
                weekendTextStyle: const TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(6),
                ),
                selectedDecoration: BoxDecoration(
                  color: Color(0xff7A4EF3),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(6),
                ),
                defaultDecoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(6),
                ),
                weekendDecoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekendStyle: TextStyle(color: Colors.red),
                weekdayStyle: TextStyle(color: Colors.black),
              ),
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: MaterialButtonWidget(
                    title: 'Save',
                    ontap: () {
                      widget.onDateSelected(_selectedDay);
                      Navigator.pop(context);
                    },
                  ),
                ),

                SizedBox(width: 10,),
                Expanded(
                  child: MaterialButtonWidget(
                    title: 'Cancel',
                    ontap: () {
                      Navigator.pop(context);
                    },
                    background: Colors.transparent,
                    textColor: Color(0xff5F33E1),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
