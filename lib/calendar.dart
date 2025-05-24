import 'package:damelife_sample2/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(CalendarApp());
}

class CalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalendarHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalendarHomePage extends StatefulWidget {
  @override
  _CalendarHomePageState createState() => _CalendarHomePageState();
}

class _CalendarHomePageState extends State<CalendarHomePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  Map<DateTime, List<String>> _events = {};
  bool _isYearView = false; // toggle between normal month view and year view

  @override
  void initState() {
    super.initState();
    _loadHolidaysForYear(_focusedDay.year);
  }

  // Returns holidays with the year replaced each time called for any year
  Map<DateTime, List<String>> _getPhilippineHolidays(int year) {
    return {
      DateTime(year, 1, 1): ['New Year\'s Day'],
      DateTime(year, 4, 9): ['Araw ng Kagitingan'],
      DateTime(year, 5, 1): ['Labor Day'],
      DateTime(year, 6, 12): ['Independence Day'],
      DateTime(year, 8, 21): ['Ninoy Aquino Day'],
      DateTime(year, 8, 26): ['National Heroes Day'], // Approx
      DateTime(year, 11, 1): ['All Saints\' Day'],
      DateTime(year, 11, 30): ['Bonifacio Day'],
      DateTime(year, 12, 25): ['Christmas Day'],
      DateTime(year, 12, 30): ['Rizal Day'],
    };
  }

  void _loadHolidaysForYear(int year) {
    final holidays = _getPhilippineHolidays(year);
    // Remove previous year holidays first
    _events.removeWhere((key, value) =>
        key.year == year ||
        _getPhilippineHolidays(key.year).keys.any((holKey) =>
            holKey.year == key.year && holKey.month == key.month && holKey.day == key.day));
    setState(() {
      _events.addAll(holidays);
    });
  }

  List<String> _getEventsForDay(DateTime day) {
    return _events[DateTime(day.year, day.month, day.day)] ?? [];
  }

  List<MapEntry<DateTime, List<String>>> _getHolidaysForMonth(DateTime month) {
    return _events.entries
        .where((entry) =>
            entry.key.year == month.year && entry.key.month == month.month)
        .toList();
  }

  void _addEvent(DateTime day) async {
    TextEditingController controller = TextEditingController();
    TimeOfDay selectedTime = TimeOfDay.now();

    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: Text("Add Event", style: TextStyle(color: const Color.fromARGB(255, 29, 29, 29))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Event name',
                  labelStyle: TextStyle(color: const Color.fromARGB(255, 42, 42, 42)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: const Color.fromARGB(255, 39, 39, 39)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: const Color.fromARGB(255, 33, 33, 33)),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 230, 230, 230),
                ),
                child: Text("Select Time", style: TextStyle(color: const Color.fromARGB(255, 0, 43, 4)),),
                onPressed: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (time != null) selectedTime = time;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                  "Cancel", style: TextStyle(color: const Color.fromARGB(255, 50, 50, 50))),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 232, 232, 232),
              ),
              child: Text("Save",style: TextStyle(color: const Color.fromARGB(255, 0, 43, 4)),),
              onPressed: () {
                Navigator.pop(context, {
                  'title': controller.text.trim(),
                  'time': selectedTime,
                });
              },
            ),
          ],
        );
      },
    );

    if (result != null && result['title'].isNotEmpty) {
      final key = DateTime(day.year, day.month, day.day);
      setState(() {
        _events.update(key, (existing) => [...existing, result['title']],
            ifAbsent: () => [result['title']]);
      });
    }
  }

  Widget _buildEventCard(String text) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      child: ListTile(
        leading: Icon(Icons.event),
        title: Text(text),
        subtitle: Text(
          DateFormat('EEEE, MMM d').format(_selectedDay),
          style: TextStyle(color: const Color.fromARGB(255, 0, 53, 4)),
        ),
      ),
    );
  }

  Widget _buildHolidayCard(DateTime date, String name) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      elevation: 2,
      color: const Color.fromARGB(255, 232, 232, 232),
      child: ListTile(
        leading: Icon(Icons.flag, color: const Color.fromARGB(255, 0, 82, 5)),
        title: Text(name, style: TextStyle(color: Colors.green.shade900)),
        subtitle: Text(
          DateFormat('MMMM d, yyyy').format(date),
          style: TextStyle(color: const Color.fromARGB(255, 0, 56, 3)),
        ),
      ),
    );
  }

  Widget _buildSingleMonthCalendar(DateTime monthDate, double itemWidth) {
    final year = monthDate.year;
    final month = monthDate.month;

    final firstDayOfMonth = DateTime(year, month, 1);
    final lastDayOfMonth = DateTime(year, month + 1, 0);
    final daysInMonth = lastDayOfMonth.day;

    int firstWeekday = firstDayOfMonth.weekday;

    List<TableRow> rows = [];

    final weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    rows.add(TableRow(
      children: weekdays
          .map((day) => Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    day,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade700,
                        fontSize: 10),
                  ),
                ),
              ))
          .toList(),
    ));

    int dayCounter = 1;
    int blankCellsBefore = firstWeekday - 1;

    for (int week = 0; week < 6; week++) {
      List<Widget> dayWidgets = [];

      for (int weekdayIndex = 0; weekdayIndex < 7; weekdayIndex++) {
        int dayIndex = week * 7 + weekdayIndex;

        if (dayIndex < blankCellsBefore || dayCounter > daysInMonth) {
          dayWidgets.add(Container(height: 20));
        } else {
          final dayDate = DateTime(year, month, dayCounter);
          bool isSelected = dayDate.year == _selectedDay.year &&
              dayDate.month == _selectedDay.month &&
              dayDate.day == _selectedDay.day;

          bool isToday = dayDate.year == DateTime.now().year &&
              dayDate.month == DateTime.now().month &&
              dayDate.day == DateTime.now().day;

          dayWidgets.add(
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                setState(() {
                  _selectedDay = dayDate;
                  _focusedDay = dayDate;
                  _calendarFormat = CalendarFormat.month;
                  _isYearView = false;
                  // Load holidays for selected year
                  _loadHolidaysForYear(dayDate.year);
                });
              },
              child: Container(
                height: 20,
                margin: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.green.shade700
                      : isToday
                          ? Colors.greenAccent.shade400
                          : null,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  dayCounter.toString(),
                  style: TextStyle(
                    fontSize: 10,
                    color: isSelected
                        ? Colors.white
                        : isToday
                            ? Colors.green.shade900
                            : Colors.black,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
          dayCounter++;
        }
      }

      rows.add(TableRow(children: dayWidgets));

      if (dayCounter > daysInMonth) break;
    }

    return Container(
      width: itemWidth,
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green.shade300),
        borderRadius: BorderRadius.circular(8),
        color: Colors.green.shade50,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 56, 3),
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              DateFormat.MMMM().format(monthDate),
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
            ),
          ),
          Table(
            defaultColumnWidth: FlexColumnWidth(),
            children: rows,
          ),
        ],
      ),
    );
  }

  Widget _buildYearFullCalendar(BuildContext context) {
    final months = List<DateTime>.generate(
      12,
      (index) => DateTime(_focusedDay.year, index + 1, 1),
    );

    final double totalHorizontalPadding = 16 * 2 + 8 * 2 * 3;
    final double itemWidth =
        (MediaQuery.of(context).size.width - totalHorizontalPadding) / 3;

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: months.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.1,
      ),
      itemBuilder: (context, index) {
        return _buildSingleMonthCalendar(months[index], itemWidth);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final holidaysThisMonth = _getHolidaysForMonth(_focusedDay);

    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 50, bottom: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [ Color.fromARGB(255, 1, 135, 1),
          Color.fromARGB(255, 0, 64, 1),
          Color.fromARGB(255, 0, 34, 5),],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                SizedBox(width: 16,),
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> menu()));},
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Academic Calendar",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 48),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    final selectedMonth =
                        await _showMonthPicker(context, _focusedDay.month);
                    if (selectedMonth != null) {
                      setState(() {
                        _focusedDay = DateTime(
                            _focusedDay.year, selectedMonth, _focusedDay.day);
                        _calendarFormat = CalendarFormat.month;
                        _isYearView = false;
                        _loadHolidaysForYear(_focusedDay.year);
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 48, 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      DateFormat.MMMM().format(_focusedDay),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () async {
                    final selectedYear =
                        await _showYearPicker(context, _focusedDay.year);
                    if (selectedYear != null) {
                      setState(() {
                        _focusedDay = DateTime(
                            selectedYear, _focusedDay.month, _focusedDay.day);
                        _calendarFormat = CalendarFormat.month;
                        _isYearView = false;
                        _loadHolidaysForYear(selectedYear);
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 80, 4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _focusedDay.year.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1,),
          Expanded(
            child: _isYearView
                ? _buildYearFullCalendar(context)
                : Column(
                    children: [
                      SizedBox(height: 10),
                      TableCalendar(
                        firstDay: DateTime.utc(1970, 1, 1),
                        lastDay: DateTime.utc(2100, 12, 31),
                        focusedDay: _focusedDay,
                        calendarFormat: _calendarFormat,
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },
                        eventLoader: _getEventsForDay,
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                          });
                          _addEvent(selectedDay);
                        },
                        onPageChanged: (focusedDay) {
                          setState(() {
                            _focusedDay = focusedDay;
                            _loadHolidaysForYear(focusedDay.year);
                          });
                        },
                        onFormatChanged: (format) {
                          setState(() {
                            _calendarFormat = format;
                          });
                        },
                        calendarStyle: CalendarStyle(
                          todayDecoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 176, 47),
                            shape: BoxShape.circle,
                          ),
                          selectedDecoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 82, 4),
                            shape: BoxShape.circle,
                          ),
                          markerDecoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 49, 3),
                            shape: BoxShape.circle,
                          ),
                        ),
                        headerVisible: false,
                      ),
                      Divider(height: 1,),
                      if (holidaysThisMonth.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Holidays This Month',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade800,
                            ),
                          ),
                        ),
                        
                      Expanded(
                        child: ListView(
                          children: [
                            ..._getEventsForDay(_selectedDay)
                                .map(_buildEventCard)
                                .toList(),
                            ...holidaysThisMonth
                                .map((entry) =>
                                    _buildHolidayCard(entry.key, entry.value.first))
                                .toList(),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Future<int?> _showYearPicker(BuildContext context, int initialYear) async {
    final years = List<int>.generate(100, (i) => 1970 + i);

    return showDialog<int>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: Text(
            "Select Year",
            style: TextStyle( color: const Color.fromARGB(255, 0, 60, 4),),
          ),
          children: years
              .map((year) => SimpleDialogOption(
                    child: Text(
                      year.toString(),
                      style: TextStyle(
                          color: year == initialYear
                               ? const Color.fromARGB(255, 0, 127, 13)
                              : const Color.fromARGB(255, 79, 79, 79)),
                    ),
                    onPressed: () => Navigator.pop(context, year),
                  ))
              .toList(),
        );
      },
    );
  }

  Future<int?> _showMonthPicker(BuildContext context, int initialMonth) async {
    final months = List<int>.generate(12, (index) => index + 1);

    return showDialog<int>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: Text(
            "Select Month",
            style: TextStyle(color: const Color.fromARGB(255, 0, 60, 4)),
          ),
          children: months
              .map((month) => SimpleDialogOption(
                    child: Text(
                      DateFormat.MMMM().format(DateTime(0, month)),
                      style: TextStyle(
                          color: month == initialMonth
                              ? const Color.fromARGB(255, 0, 127, 13)
                              : const Color.fromARGB(255, 79, 79, 79)),
                    ),
                    onPressed: () => Navigator.pop(context, month),
                  ))
              .toList(),
        );
      },
    );
  }
}
