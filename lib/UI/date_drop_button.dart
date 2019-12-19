import 'package:flutter/material.dart';

class DatePickerDropDown extends StatefulWidget {
  @override
  _DatePickerDropDownState createState() => _DatePickerDropDownState();
}

class _DatePickerDropDownState extends State<DatePickerDropDown> {
  String dropDownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.blue[900]
      ),
      child: DropdownButton<String>(
        value: dropDownValue,
        onChanged: (String newValue) {
          setState(() {
            dropDownValue = newValue;
          });
          print(newValue);
        },
        items: <String>['One', 'Two', 'Three', 'Four'].map<DropdownMenuItem<String>>((String value){
          return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(color: Colors.white)),
          );
      }).toList(),
      ),
    );
  }
}