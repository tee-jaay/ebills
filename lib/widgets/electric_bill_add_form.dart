import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'center_progress.dart';
import '../settings/constants.dart';
import '../providers/electric_bills.dart';
import '../screens/electric_bill/electric_bill_list_screen.dart';
import 'show_snack_bar_msg.dart';

class ElectricBillAddForm extends StatefulWidget {
  const ElectricBillAddForm({Key? key}) : super(key: key);

  @override
  State<ElectricBillAddForm> createState() => _ElectricBillAddFormState();
}

class _ElectricBillAddFormState extends State<ElectricBillAddForm> {
  final _formKey = GlobalKey<FormState>();

  final _isLoading = false;

  late String _title = '';
  late String _name = '';
  late String _collectorName = '';
  late num _unitNow = 0;
  late num _unitPrev = 0;
  late double _unitRate = 0.0;
  late double _amount = 0.0;
  late double _charge = 0.0;
  late double _due = 0.0;
  late double _advance = 0.0;
  late String _paidDate = '';

  final _nameFocusNode = FocusNode();
  final _unitNowFocusNode = FocusNode();
  final _unitPrevFocusNode = FocusNode();
  final _rateFocusNode = FocusNode();
  final _amountFocusNode = FocusNode();
  final _chargeFocusNode = FocusNode();
  final _dueFocusNode = FocusNode();
  final _advanceFocusNode = FocusNode();
  final _collectorNameFocusNode = FocusNode();
  final _paidDateFocusNode = FocusNode();

  void _handleSubmit() {
    dynamic newElectricBill = {
      "title": _title,
      "name": _name,
      "unitNow": _unitNow,
      "unitPrev": _unitPrev,
      "unitRate": _unitRate,
      "amount": _amount,
      "charge": _charge,
      "due": _due,
      "advance": _advance,
      "collectorName": _collectorName,
      "paidDate": _paidDate,
      "fileUrl": "",
      "imageUrl": "",
    };

    ElectricBills electricBills = ElectricBills();
    electricBills.addElectricBill(newElectricBill).then((value) {
      if (value == 201) {
        ShowSnackBarMsg.showSnackBarMsg(
            context, 'Add success', Colors.green);
        Navigator.pushNamed(context, ElectricBillListScreen.routeName);
      } else {
        if (kDebugMode) {
          print('Adding error occurred');
        }
      }
      return value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const CenterProgress()
        : Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(spaceMedium),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Title
                    TextFormField(
                      initialValue: '2022 Dec',
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        icon: Icon(Icons.text_format),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _title = value;
                        });
                      },
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(_nameFocusNode),
                    ),
                    // --- Title

                    // --- Payer name
                    TextFormField(
                      initialValue: 'Jhon Doe',
                      decoration: const InputDecoration(
                        labelText: 'Payer Name',
                        icon: Icon(Icons.person),
                      ),
                      focusNode: _nameFocusNode,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter payer name';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _name = value;
                        });
                      },
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(_unitPrevFocusNode),
                    ),
                    // --- Payer name

                    // -- Unit previous
                    TextFormField(
                      initialValue: '24567',
                      decoration: const InputDecoration(
                        labelText: 'Unit Previous',
                        icon: Icon(Icons.ac_unit),
                      ),
                      focusNode: _unitPrevFocusNode,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter previous unit';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _unitPrev = num.parse(value);
                        });
                      },
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(_unitNowFocusNode),
                    ),
                    // -- Unit previous

                    // -- Unit now
                    TextFormField(
                      initialValue: '26733',
                      decoration: const InputDecoration(
                        labelText: 'Unit Now',
                        icon: Icon(Icons.ad_units),
                      ),
                      focusNode: _unitNowFocusNode,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter unit now';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _unitNow = num.parse(value);
                        });
                      },
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(_rateFocusNode),
                    ),
                    // -- Unit now

                    // -- Unit rate
                    TextFormField(
                      initialValue: '7.5',
                      decoration: const InputDecoration(
                        labelText: 'Rate',
                        icon: Icon(Icons.currency_bitcoin),
                      ),
                      focusNode: _rateFocusNode,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter rate';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _unitRate = double.parse(value);
                        });
                      },
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(_dueFocusNode),
                    ),
                    // -- Unit rate

                    // -- Due
                    TextFormField(
                      initialValue: '765.00',
                      decoration: const InputDecoration(
                        labelText: 'Due',
                        icon: Icon(Icons.memory),
                      ),
                      focusNode: _dueFocusNode,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter due';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _due = double.parse(value);
                        });
                      },
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(_advanceFocusNode),
                    ),
                    // -- Due

                    // -- Advance
                    TextFormField(
                      initialValue: '1000.00',
                      decoration: const InputDecoration(
                        labelText: 'Advance',
                        icon: Icon(Icons.money),
                      ),
                      focusNode: _advanceFocusNode,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter advance';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _advance = double.parse(value);
                        });
                      },
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(_chargeFocusNode),
                    ),
                    // -- Advance

                    // -- Charge
                    TextFormField(
                      initialValue: '20.00',
                      decoration: const InputDecoration(
                        labelText: 'Charge',
                        icon: Icon(Icons.power),
                      ),
                      focusNode: _chargeFocusNode,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter charge';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _charge = double.parse(value);
                        });
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_amountFocusNode);
                      },
                    ),
                    // -- Charge

                    // -- Amount
                    TextFormField(
                      initialValue: '1432.00',
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                        icon: Icon(Icons.adb),
                      ),
                      focusNode: _amountFocusNode,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter amount';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _amount = double.parse(value);
                        });
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_collectorNameFocusNode);
                      },
                    ),
                    // -- Amount

                    // -- Collector name
                    TextFormField(
                      initialValue: 'Maria Doe',
                      decoration: const InputDecoration(
                        labelText: 'Collector\'s Name',
                        icon: Icon(Icons.woman),
                      ),
                      focusNode: _collectorNameFocusNode,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter collector name';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _collectorName = value;
                        });
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_paidDateFocusNode);
                      },
                    ),
                    // -- Collector name

                    // -- Paid date
                    TextFormField(
                      initialValue: '11-12-2022',
                      decoration: const InputDecoration(
                        labelText: 'Paid Date',
                        icon: Icon(Icons.calendar_month),
                      ),
                      focusNode: _paidDateFocusNode,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter paid date';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _paidDate = value;
                        });
                      },
                      onFieldSubmitted: (_) {},
                    ),
                    // -- Paid date

                    const SizedBox(
                      height: spaceExtraLarge,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(content: Text('Processing Data')),
                          // );
                          _handleSubmit();
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
