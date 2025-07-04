
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:task1/src/constant/textstyle.dart';

import '../model/chart_model.dart';


class BookingChartCard extends StatefulWidget {
  final double  value;
  
  final String title;
  final double percentageChange;
  final List<ChartDataModel> monthData;
  final List<ChartDataModel> weekData;
  final List<ChartDataModel> dayData;

  const BookingChartCard({

    
    super.key,
    
    required this.value,
    required this.percentageChange,
    required this.monthData,
    required this.weekData,
    required this.dayData, required this.title,
  });

  @override
  State<BookingChartCard> createState() => _BookingChartCardState();
}

class _BookingChartCardState extends State<BookingChartCard> {
  String _selectedTab = 'Day';

  List<ChartDataModel> get selectedData {
    switch (_selectedTab) {
      case 'Week':
        return widget.weekData;
      case 'Day':
        return widget.dayData;
      case 'Month':
      default:
        return widget.monthData;
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = selectedData;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 05,vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1D26),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title, style: AppTextStyles.name),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${widget.percentageChange >= 0 ? '+' : ''}${widget.percentageChange.toStringAsFixed(1)}%",
                    style: TextStyle(
                      color: widget.percentageChange >= 0 ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),




                  Text("${widget.value}",style:  TextStyle(
                    color: Colors.white,
                    fontFamily: 'Myfonts',
                    fontWeight: FontWeight.bold
                  ),),
                  const Text('Last 30 days', style: TextStyle(color: Colors.white60, fontSize: 12)),
                ],
              ),


           
            ],
          ),
          const SizedBox(height: 16),

          // Tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ['Day', 'Week', 'Month'].map((tab) {
              final selected = _selectedTab == tab;
              return GestureDetector(
                onTap: () {
                  setState(() => _selectedTab = tab);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: selected ? Colors.black : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(tab, style: TextStyle(color: selected ? Colors.white : Colors.white70)),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),

 
          SizedBox(
            height: 150,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true, horizontalInterval: 1, drawVerticalLine: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        if (index < 0 || index >= data.length) return const SizedBox();
                        final date = data[index].date;
                        return Text(DateFormat('d').format(date), style: const TextStyle(color: Colors.white, fontSize: 10));
                      },
                      reservedSize: 22,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Text(value.toInt().toString(), style: const TextStyle(color: Colors.white70, fontSize: 10));
                      },
                      reservedSize: 28,
                    ),
                  ),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      for (int i = 0; i < data.length; i++) FlSpot(i.toDouble(), data[i].value)
                    ],
                    isCurved: true,
                    color: Colors.white,
                    barWidth: 3,
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.white.withOpacity(0.2),
                    ),
                    dotData: FlDotData(show: false),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}






