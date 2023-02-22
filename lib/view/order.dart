import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String? _selectedValue;

  final List<String> _dropdownValues = ['London', 'Munich'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Dropdown Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Select a departure city:'),
            DropdownButton<String>(
              value: _selectedValue,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedValue = newValue;
                });
              },
              items: _dropdownValues
                  .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                  .toList(),
            ),
            const SizedBox(height: 16),
            if (_selectedValue != null) Text('You selected $_selectedValue.'),
          ],
        ),
      ),
    );
  }
}
