import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<DateTime> _dueDates = [
    DateTime(2024, 04, 18), 
    DateTime(2024, 04, 23),
    DateTime(2024,04,2), 
    DateTime(2024,05,2),
  ];

 List<Map<String, String>> books = [
      {
        'name': 'Book 1',
        'author': 'Author 1',
        'takenDate': '01/04/2024',
        'returnDate': '15/04/2024',
      },
      {
        'name': 'Book 2',
        'author': 'Author 2',
        'takenDate': '03/04/2024',
        'returnDate': '18/04/2024',
      },
      // Add more books as needed
    ];

  
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff99baff),
    body: 
    SafeArea(
      child: 
    Column( 
      crossAxisAlignment: CrossAxisAlignment.start ,
      children: [
    Padding(
      padding: EdgeInsets.symmetric(vertical: 30,horizontal: 0),

      child :Container(
        color: const Color.fromRGBO(255, 255, 255, 1) ,
        height: 40,
        width : 500 ,
        padding: EdgeInsets.only(left: 25,top: 3),
        child: Text("LibNotif." , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.w600)),
      ),
    ),
  
  SizedBox(height: 20,width: 500,),
   Padding(padding: EdgeInsets.only(left: 25),
    child:     Text ("Upcoming Due Dates" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold)),),
  SizedBox(height: 20,width: 20,),
    
    Padding(padding: EdgeInsets.only(left: 25),
    child: 
    Container(
      color: Colors.white,
      height: 400,
      width: 332,

    //calendar

child: TableCalendar<DateTime>(
                  firstDay: DateTime(DateTime.now().year - 1),
                  lastDay: DateTime(DateTime.now().year + 10),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    DateTime normalizedDay = DateTime(day.year,day.month,day.day);
                    return _dueDates.contains(normalizedDay);
                  },
                  // Use defaultBuilder for due date highlighting
                  calendarBuilders: CalendarBuilders(
                    selectedBuilder: (context, date, events) {
                      if (_dueDates.contains(date))
                       { 
                        return Container(
                          margin: const EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      } else {
                        return null; // Return null for non-due dates
                      }
                    
                    },
                    
  ),
),



    )
    ),
      SizedBox(height: 20,width: 500,),
   Padding(padding: EdgeInsets.only(left: 25),
    child:     Text ("Book History" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold)),),
  SizedBox(height: 20,width: 20,),

  //book history

  ListView.builder(itemCount: books.length,
  itemBuilder: (context, index) {
    return Padding(padding: EdgeInsets.all(8),
    child: Row(
      children: <Widget>[
        SizedBox(width: 10,),
        Expanded(child: Column( 
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: <Widget>[
         Text('Name: ${books[index]['name']}'),
                        Text('Author: ${books[index]['author']}'),
                        Text('Taken Date: ${books[index]['takenDate']}'),
                        Text('Return Date: ${books[index]['returnDate']}'),
          
      ],
      
      ))]
    ),
      
    );
  },
  
  )
  

    ]
    )
    )
    
    );

    
  }
}
