

// class ChartModel {


//   final double revenue;
//   final int booking;

//  final List<ChartDataModel> chartDataModel; 



//   ChartModel({required this.revenue,required this.booking,required this.chartDataModel});
// }





// class ChartDataModel {

//   final DateTime date;
//   final double value;

//   ChartDataModel({required this.date, required this.value,});
// }


//   List<ChartModel>  dumydata =[
//     ChartModel(
//       revenue: 500, 
//       booking: 20, 
//       chartDataModel:  bookingDayData)

//   ];


class ChartDataModel {
  final DateTime date;
  final double value;

  ChartDataModel({required this.date, required this.value});
}

class ChartModel {
  final double revenue;
  final int booking;

  final List<ChartDataModel> dayData;
  final List<ChartDataModel> weekData;
  final List<ChartDataModel> monthData;

  ChartModel({
    required this.revenue,
    required this.booking,
    required this.dayData,
    required this.weekData,
    required this.monthData,
  });
}







List<ChartDataModel> bookingDayData = [

  ChartDataModel(date: DateTime.now().subtract(const Duration(days: 5)), value: 2),
  ChartDataModel(date: DateTime.now().subtract(const Duration(days: 4)), value: 1),
  ChartDataModel(date: DateTime.now().subtract(const Duration(days: 3)), value: 0),
  ChartDataModel(date: DateTime.now(), value: 0),
];


List<ChartDataModel> revenueDayData = [
  ChartDataModel(date: DateTime.now().subtract(const Duration(days: 6)), value: 1),
  ChartDataModel(date: DateTime.now().subtract(const Duration(days: 5)), value: 2),
  ChartDataModel(date: DateTime.now().subtract(const Duration(days: 4)), value: 1),
  ChartDataModel(date: DateTime.now().subtract(const Duration(days: 3)), value: 0),

];


List<ChartDataModel> revenueWeekData = [
  ChartDataModel(date: DateTime.now().subtract(const Duration(days: 6)), value: 1),


];

List<ChartDataModel> revenueMonthData= [
  ChartDataModel(date: DateTime.now().subtract(const Duration(days: 6)), value: 1),
  ChartDataModel(date: DateTime.now().subtract(const Duration(days: 5)), value: 2),

];


List<ChartDataModel> bookingWeekData = [
  ChartDataModel(date: DateTime.now().subtract(const Duration(days: 6)), value: 1),
  ChartDataModel(date: DateTime.now().subtract(const Duration(days: 5)), value: 2),

];


List<ChartDataModel> bookingMonthData = [
  ChartDataModel(date: DateTime.now().subtract(const Duration(days: 6)), value: 1),
  ChartDataModel(date: DateTime.now().subtract(const Duration(days: 5)), value: 2),

];








