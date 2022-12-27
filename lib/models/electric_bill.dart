class ElectricBill {
  String? id;
  String? name;
  String? collectorName;
  String? title;
  String? unitNow;
  String? unitPrev;
  String? rate;
  String? amount;
  String? charge;
  String? due;
  String? advance;
  //DateTime? paidDate;

  ElectricBill({
    required this.id,
    required this.name,
    required this.collectorName,
    required this.title,
    required this.unitNow,
    required this.unitPrev,
    required this.rate,
    required this.amount,
    required this.charge,
    required this.due,
    required this.advance,
   // required this.paidDate,
  });
}
