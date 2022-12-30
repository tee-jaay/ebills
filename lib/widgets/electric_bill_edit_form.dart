import 'package:flutter/material.dart';

import '../settings/constants.dart';
import '../providers/electric_bills.dart';
import '../screens/electric_bill/electric_bill_list_screen.dart';

class ElectricBillEditForm extends StatefulWidget {
  late String? title;
  late String? name;
  late String? collectorName;
  late String? unitNow;
  late String? unitPrev;
  late String? unitRate;
  late String? amount;
  late String? charge;
  late String? due;
  late String? advance;
  late String? paidDate;
  ElectricBillEditForm({
    required this.title,
    required this.name,
    required this.collectorName,
    required this.unitNow,
    required this.unitPrev,
    required this.unitRate,
    required this.amount,
    required this.charge,
    required this.due,
    required this.advance,
    required this.paidDate,
    Key? key}) : super(key: key);

  @override
  State<ElectricBillEditForm> createState() => _ElectricBillEditFormState();
}

class _ElectricBillEditFormState extends State<ElectricBillEditForm> {
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
    };

    ElectricBills electricBills = ElectricBills();
    electricBills.addElectricBill(newElectricBill).then((value) {
      if (value == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
            'Entry add success',
            style: TextStyle(color: Colors.green),
          )),
        );
        Navigator.pushNamed(context, ElectricBillListScreen.routeName);
      } else {
        print('Adding error occurred');
      }
      return value;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.title);
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
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
                      initialValue: widget.title,
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
                      initialValue: widget.name,
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
                      initialValue: widget.unitPrev,
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
                      initialValue: widget.unitNow,
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
                      initialValue: widget.unitRate,
                      decoration: const InputDecoration(
                        labelText: 'Rate',
                        icon: Icon(Icons.currency_bitcoin),
                      ),
                      focusNode: _rateFocusNode,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
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
                      initialValue: widget.due,
                      decoration: const InputDecoration(
                        labelText: 'Due',
                        icon: Icon(Icons.memory),
                      ),
                      focusNode: _dueFocusNode,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
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
                      initialValue: widget.advance,
                      decoration: const InputDecoration(
                        labelText: 'Advance',
                        icon: Icon(Icons.money),
                      ),
                      focusNode: _advanceFocusNode,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
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
                      initialValue: widget.charge,
                      decoration: const InputDecoration(
                        labelText: 'Charge',
                        icon: Icon(Icons.power),
                      ),
                      focusNode: _chargeFocusNode,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
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
                      initialValue: widget.amount,
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
                      initialValue: widget.collectorName,
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
                      initialValue: widget.paidDate,
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
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.green,
                        ),
                      ),
                      child: Text('Update',),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
