class ElectricBill {
  String? id;
  String? name;
  String? collectorName;
  String? title;
  String? unitNow;
  String? unitPrev;
  String? unitRate;
  String? amount;
  String? charge;
  String? due;
  String? advance;

  ElectricBill({
    required this.id,
    required this.name,
    required this.collectorName,
    required this.title,
    required this.unitNow,
    required this.unitPrev,
    required this.unitRate,
    required this.amount,
    required this.charge,
    required this.due,
    required this.advance,
  });
}
