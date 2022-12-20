class EBill {
  late String month;
  late String unit;
  late String rate;
  late String amount;
  late DateTime date;

  EBill({
    required this.month,
    required this.unit,
    required this.rate,
    required this.amount,
    required this.date,
  });

  // Declare local class for ebills
  List<EBill> _ebills = [];

  // Fetch and set ebills data
  Future<void> fetchAllEbills() async {
    print('fetch all ebills');
    return;
  }

  // Add ebills data
  Future<void> addEbill() async {
    print('add an ebill');
    return;
  }

  // Show single ebill
  Future<void> showEbill(String id) async {
    print(id);
    return;
  }

  // Update ebills data
  Future<void> updateEbill(String id) async {
    print(id);
    return;
  }

  // Delete ebills data
  Future<void> deleteEbill(String id) async {
    print(id);
    return;
  }
}
