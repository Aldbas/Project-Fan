import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  var now = DateTime.now();
  var formatNormal = DateFormat('E, MMM dd');

  @override
Widget build(BuildContext context) {

    var date = formatNormal.format(now);

  return Container(
      child: Wrap(
//        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => subtractDate()),
          MaterialButton(
            padding: EdgeInsets.all(0.0),
            height: 2.0,
              minWidth: 1.0,
              child: Text(date,
                  style: TextStyle(color:date == formatNormal.format(DateTime.now())? Colors.amber : Colors.white,)),
            onPressed: null),
          IconButton(icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
          onPressed: () => addDate())
        ],
      ));
  }

  subtractDate() {
    setState(() {
      now = now.subtract(Duration(days: 1));
    });
  }

  addDate() {
    setState(() {
      now = now.add(Duration(days: 1));
    });
  }
}