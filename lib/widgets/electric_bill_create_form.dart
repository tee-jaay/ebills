import 'package:flutter/material.dart';

import '../settings/constants.dart';
import '../models/electric_bill.dart';

class ElectricBillCreateForm extends StatefulWidget {
  const ElectricBillCreateForm({Key? key}) : super(key: key);

  @override
  State<ElectricBillCreateForm> createState() => _ElectricBillCreateFormState();
}

class _ElectricBillCreateFormState extends State<ElectricBillCreateForm> {
  final _formKey = GlobalKey<FormState>();

  var _isInit = true;
  var _isLoading = false;

  final _nameFocusNode = FocusNode();

  var _newElectricbill = ElectricBill(
      id: '',
      name: '',
      collectorName: '',
      title: '',
      unitNow: '',
      unitPrev: '',
      rate: '',
      amount: '',
      charge: '',
      due: '',
      advance: '');

  var _initialValues = {
    'title': '',
    'name': '',
    'unit_now': '',
    'unit_prev': '',
    'unit_rate': '',
    'charge': '',
    'due': '',
    'advance': '',
    'amount': '',
    'paid_date': '',
    'collector_name': '',
  };

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  initialValue: _initialValues['title'],
                  decoration: InputDecoration(labelText: 'Title'),
                  onSaved: (newValue) {},
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_nameFocusNode),
                ),
                TextFormField(
                  initialValue: _initialValues['name'],
                  decoration: InputDecoration(labelText: 'Payer Name'),
                  focusNode: _nameFocusNode,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter payer name';
                    }
                    return null;
                  },
                  onSaved: (newValue) {},
                  // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_nameFocusNode),
                ),
                const SizedBox(
                  height: spaceExtraLarge,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          );
  }
}
