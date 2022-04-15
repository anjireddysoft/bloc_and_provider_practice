import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _currentDate2 = DateTime.now();
  TextEditingController dateController = TextEditingController();
  DateTime _targetDateTime = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Create event",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "When will the event take place?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              cursorColor: Colors.grey,
              enableInteractiveSelection: false,
              controller: dateController,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  //  filled: true,
                  labelText: "Select start date",
                  labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  suffixIcon: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context, builder: (builder) => showCalendar()
                          //   showUI(context)

                          );
                    },
                    icon: Icon(Icons.calendar_today_outlined),
                    color: Colors.grey,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget showCalendar() {
    return StatefulBuilder(
      builder: (BuildContext context,  setState) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select start date",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1e1c24)),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: Container(
                  //  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Colors.grey.shade300)),
                  //  height: 300,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      _currentMonth,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffa4a3a3)),
                                    ),
                                  )),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _targetDateTime = DateTime(
                                          _targetDateTime.year,
                                          _targetDateTime.month - 1);
                                      _currentMonth =
                                          DateFormat.yMMM().format(
                                              _targetDateTime);
                                    });
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios_sharp,
                                    size: 15,
                                    color: Color(0xff58c4c6),
                                  )),
                              IconButton(
                                  onPressed: () {
                                    setState((){
                                      _targetDateTime = DateTime(
                                          _targetDateTime.year,
                                          _targetDateTime.month + 1);
                                      _currentMonth =
                                          DateFormat.yMMM().format(
                                              _targetDateTime);
                                    });
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                    color: Color(0xff58c4c6),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      Expanded(
                        child: Container(
                          child: CalendarCarousel(
                            //  prevDaysTextStyle: TextStyle(color: Colors.black),
                            daysTextStyle: TextStyle(color: Color(0xffa4a3a3)),
                            //   nextDaysTextStyle: TextStyle(color: Colors.green),
                            //   prevMonthDayBorderColor: Colors.blue,
                            //  thisMonthDayBorderColor: Colors.grey,
                            //    nextMonthDayBorderColor: Colors.green,
                            todayTextStyle: TextStyle(
                                color: Colors.greenAccent),
                            //   dayButtonColor: Colors.black,
                            dayPadding: 2,
                            onCalendarChanged: (DateTime date) {
                              this.setState(() {
                                _targetDateTime = date;
                                _currentMonth =
                                    DateFormat.yMMM().format(_targetDateTime);
                              });
                            },
                            //   todayBorderColor: Colors.blue,
                            //  todayButtonColor: Colors.yellow,
                            // dayButtonColor: Colors.black,
                            //   selectedDayButtonColor: Colors.red,
                            selectedDayButtonColor: Colors.grey.shade200,
                            weekdayTextStyle:
                            TextStyle(color: Color(0xffa4a3a3), fontSize: 16),
                            weekendTextStyle: TextStyle(
                                color: Color(0xffa4a3a3)),
                            showOnlyCurrentMonthDate: true,
                            showHeader: false,
                            //  width: 300,
                            //  height: 200,,

                            headerTextStyle: TextStyle(
                                color: Color(0xffa4a3a3),
                                fontWeight: FontWeight.bold),
                            selectedDateTime: _currentDate2,
                            targetDateTime: _targetDateTime,
                            onDayPressed: (DateTime dateTime, List) {
                              setState(() {
                                _currentDate2 = dateTime;
                                dateController.text =
                                    DateFormat('EEEE, d MMM, yyyy')
                                        .format(dateTime);
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );

      }
    );
  }
}
