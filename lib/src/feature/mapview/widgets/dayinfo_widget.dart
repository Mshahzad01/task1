// import 'package:flutter/material.dart';
// import 'package:horizontalcalender/horizontalcalendar.dart';



// class Myclinder extends StatelessWidget {
//   const Myclinder({super.key});

//   @override
//   Widget build(BuildContext context) {

//     final FixedExtentScrollController itemController =
//         FixedExtentScrollController();
//     return Scaffold(

//       appBar: AppBar(
//         title: Text("clinder"),
//       ),

//       body:  Container(
//         height: 200,
//         width: MediaQuery.of(context).size.width,
//         padding: EdgeInsets.all(10.0),
//         child: HorizontalCalendar(DateTime.now(),
//             width: MediaQuery.of(context).size.width*.25,
//             height: 100,
//           //  selectedDateStyle: TextStyle(),
//             selectionColor: Colors.red,
//             itemController: itemController)),
//     );
//   }
    
//   }



import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AutoMonthUpdateScroller extends StatefulWidget {
  const AutoMonthUpdateScroller({super.key});

  @override
  State<AutoMonthUpdateScroller> createState() => _AutoMonthUpdateScrollerState();
}

class _AutoMonthUpdateScrollerState extends State<AutoMonthUpdateScroller> {
  DateTime selectedDate = DateTime.now();
  late ScrollController _scrollController;
  List<DateTime> allDays = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_handleScroll);
    _generateDaysForThreeMonths();
  }

  void _generateDaysForThreeMonths() {
    DateTime start = DateTime(DateTime.now().year, DateTime.now().month - 1, 1);
    DateTime end = DateTime(DateTime.now().year, DateTime.now().month + 2, 0);

    allDays = [];
    for (int i = 0; i <= end.difference(start).inDays; i++) {
      allDays.add(start.add(Duration(days: i)));
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final todayIndex = allDays.indexWhere((d) =>
          d.year == DateTime.now().year &&
          d.month == DateTime.now().month &&
          d.day == DateTime.now().day);

      if (todayIndex != -1) {
        _scrollController.jumpTo(todayIndex * 60.0); // approx item width
      }
    });
  }

  void _handleScroll() {
    int index = (_scrollController.offset / 60.0).floor();

    if (index >= 0 && index < allDays.length) {
      DateTime currentVisible = allDays[index];
      if (currentVisible.month != selectedDate.month) {
        setState(() {
          selectedDate = currentVisible;
        });
      }
    }
  }

  InlineSpan formatDayWithSuperscript(int day, bool isToday) {
    String suffix;
    if (day >= 11 && day <= 13) {
      suffix = 'th';
    } else {
      switch (day % 10) {
        case 1:
          suffix = 'st';
          break;
        case 2:
          suffix = 'nd';
          break;
        case 3:
          suffix = 'rd';
          break;
        default:
          suffix = 'th';
      }
    }

    return TextSpan(
      text: day.toString(),
      style: TextStyle(
        fontSize: 10,
        color: isToday ? Colors.orange : Colors.white,
      ),
      children: [
        WidgetSpan(
          alignment: PlaceholderAlignment.top,
          child: Transform.translate(
            offset: const Offset(1, -5),
            child: Text(
              suffix,
              style: TextStyle(
                fontSize: 8,
                color: isToday ? Colors.orange : Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentMonth = DateFormat.MMMM().format(selectedDate);
    final today = DateTime.now();

    return Container(
    //  color: Colors.black87,
      height: 80,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 8),
            child: Text(
              currentMonth,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),

          Container(
            width: 1,
            height: 40,
            color: Colors.white30,
          ),

          const SizedBox(width: 10),

          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: allDays.length,
              itemBuilder: (context, index) {
                final date = allDays[index];
                final isToday = DateUtils.isSameDay(date, today);
                final dayName = DateFormat.E().format(date);

                return GestureDetector(
                  onTap: () {
                    if (date.day == 1) {
                      setState(() {
                        selectedDate = date;
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          dayName,
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        const SizedBox(height: 4),
                        RichText(
                          text: formatDayWithSuperscript(date.day, isToday),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
