
class AppBarInfoModel {
  final String earnings;
  final String totalClients;

  AppBarInfoModel({
    required this.earnings,
    required this.totalClients,
  });

  factory AppBarInfoModel.fromMap(Map<String, dynamic> map) {
    return AppBarInfoModel(
      earnings: map['earnings'] ?? '0',
      totalClients: map['totalClients'] ?? '0',
    );
  }
}












