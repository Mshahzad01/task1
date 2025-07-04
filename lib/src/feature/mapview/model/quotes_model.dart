class QuotesModel {
  final int sent;
  final int won;
  final int potentialclint;

  QuotesModel({
    required this.sent,
    required this.won,
    required this.potentialclint,
  });

  QuotesModel copyWith({
    int? sent,
    int? won,
    int? potentialclint,
  }) {
    return QuotesModel(
      sent: sent ?? this.sent,
      won: won ?? this.won,
      potentialclint: potentialclint ?? this.potentialclint,
    );
  }
}




final List  <QuotesModel>  quotesinfo = [
QuotesModel(sent: 2, won: 5, potentialclint: 300)





];