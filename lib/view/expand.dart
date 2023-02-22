import 'package:flutter/material.dart';

class ExpandScreen extends StatefulWidget {
  const ExpandScreen({Key? key}) : super(key: key);

  @override
  State<ExpandScreen> createState() => _ExpandScreenSate();
}

class _ExpandScreenSate extends State<ExpandScreen> {
  String? _selectedValue;

  final List<String> _dropdownValues = ['London', 'Munich'];

  final TextEditingController departureController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 15, top: 10, right: 15),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Card(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FormField<String>(
              builder: (FormFieldState<String> state) {
                const Text('Select a departure city:');
                return InputDecorator(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(12, 10, 20, 20),
                      // labelText: "hi",
                      // labelStyle: textStyle,
                      // labelText: _dropdownValue == null
                      //     ? 'Where are you from'
                      //     : 'From',
                      // errorText: _errorBank,
                      errorStyle: const TextStyle(
                          color: Colors.redAccent, fontSize: 16.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black12,
                        fontFamily: "verdana_regular",
                      ),
                      hint: const Text(
                        "Pilih Kota Keberangkatan",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontFamily: "verdana_regular",
                        ),
                      ),
                      value: _selectedValue,
                      isExpanded: true,
                      isDense: true,
                      onChanged: (value) {},
                      // onChanged: () {
                      //   // setState(() {
                      //   //   _bankChoose = newValue.bank_name;
                      //   // });
                      // },
                      items: _dropdownValues
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Text(value),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
          )),
        ));
  }
}

class BankListDataModel {
  String bank_name;
  String bank_logo;
  BankListDataModel(this.bank_name, this.bank_logo);
}
