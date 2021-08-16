import 'dart:async';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime currentDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      width: width / 0.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          // color: Colors.cyan,
          border: Border.all(color: Colors.green)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ElevatedButton.icon(
            onPressed: () => _selectDate(context),
            icon: Icon(Icons.calendar_today),
            label: Text('Date Of Birth'),
          ),
          SizedBox(width: 20),
          Text(
              '${currentDate.day}/${currentDate.month}/${currentDate.year}'
                  .toString(),
              style: TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
