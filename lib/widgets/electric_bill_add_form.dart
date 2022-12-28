import 'package:ebills/models/electric_bill.dart';
import 'package:ebills/providers/electric_bills.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../settings/constants.dart';

class ElectricBillAddForm extends StatefulWidget {
  const ElectricBillAddForm({Key? key}) : super(key: key);

  @override
  State<ElectricBillAddForm> createState() => _ElectricBillAddFormState();
}

class _ElectricBillAddFormState extends State<ElectricBillAddForm> {
  final _formKey = GlobalKey<FormState>();

  final _isLoading = false;

  late String _title;
  late String _name;
  late String _collectorName;
  late double _unitNow;
  late double _unitPrev;
  late double _rate;
  late double _amount;
  late num _charge;
  late double _due;
  late double _advance;

  final _nameFocusNode = FocusNode();
  final _unitNowFocusNode = FocusNode();
  final _unitPrevFocusNode = FocusNode();
  final _rateFocusNode = FocusNode();
  final _amountFocusNode = FocusNode();
  final _chargeFocusNode = FocusNode();
  final _dueFocusNode = FocusNode();
  final _advanceFocusNode = FocusNode();
  final _collectorNameFocusNode = FocusNode();

  void _handleSubmit() {
    dynamic newElectricBill = {
      "title": _title,
      "name": _name,
      "unitNow": _unitNow,
      "unitPrev": _unitPrev,
      "rate": _rate,
      "amount": _amount,
      "charge": _charge,
      "due": _due,
      "advance": _advance,
      "collectorName": _collectorName,
    };

    ElectricBills electricBills = ElectricBills();
    electricBills.addElectricBill(newElectricBill);
  }

  @override
  Widget build(BuildContext context) {
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
                      initialValue: '2022 Dec',
                      decoration: const InputDecoration(labelText: 'Title'),
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
                      decoration:
                          const InputDecoration(labelText: 'Payer Name'),
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
                      initialValue: '24560.00',
                      decoration:
                          const InputDecoration(labelText: 'Unit Previous'),
                      focusNode: _unitPrevFocusNode,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter previous unit';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _unitPrev = double.parse(value);
                        });
                      },
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(_unitNowFocusNode),
                    ),
                    // -- Unit previous

                    // -- Unit now
                    TextFormField(
                      initialValue: '26733.00',
                      decoration: const InputDecoration(labelText: 'Unit Now'),
                      focusNode: _unitNowFocusNode,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter unit now';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _unitNow = double.parse(value);
                        });
                      },
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(_rateFocusNode),
                    ),
                    // -- Unit now

                    // -- Unit rate
                    TextFormField(
                      initialValue: '7.5',
                      decoration: const InputDecoration(labelText: 'Rate'),
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
                          _rate = double.parse(value);
                        });
                      },
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(_advanceFocusNode),
                    ),
                    // -- Unit rate

                    // -- Due
                    TextFormField(
                      initialValue: '765.00',
                      decoration: const InputDecoration(labelText: 'Due'),
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
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(_amountFocusNode),
                    ),
                    // -- Due

                    // -- Advance
                    TextFormField(
                      initialValue: '1000.00',
                      decoration: const InputDecoration(labelText: 'Advance'),
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
                        initialValue: '20.00',
                        decoration: const InputDecoration(labelText: 'Charge'),
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
                        }),
                    // -- Charge

                    // -- Amount
                    TextFormField(
                      initialValue: '1432.00',
                      decoration: const InputDecoration(labelText: 'Amount'),
                      focusNode: _amountFocusNode,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
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
                      onFieldSubmitted: (_) {},
                    ),
                    // -- Amount

                    // -- Collector name
                    TextFormField(
                      initialValue: 'Maria Doe',
                      decoration: const InputDecoration(labelText: 'Amount'),
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
                      onFieldSubmitted: (_) {},
                    ),
                    // -- Amount

                    const SizedBox(
                      height: spaceExtraLarge,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
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
