import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenSate();
}

class _OrderScreenSate extends State<OrderScreen> {
  // final List<String> _dropdownValues = ['London', 'Munich'];
  late List<Map<String, dynamic>> _dropdownValues;
  @override
  void initState() {
    super.initState();
    _dropdownValues = [
      {
        "id": "1101",
        "province_id": "11",
        "name": "KABUPATEN SIMEULUE",
        "alt_name": "KABUPATEN SIMEULUE",
        "latitude": 2.61667,
        "longitude": 96.08333
      },
      {
        "id": "1102",
        "province_id": "11",
        "name": "KABUPATEN ACEH SINGKIL",
        "alt_name": "KABUPATEN ACEH SINGKIL",
        "latitude": 2.41667,
        "longitude": 97.91667
      }
    ];
  }

  var _selectedValue = 'Pilih Kota';

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
                      errorStyle: const TextStyle(
                          color: Colors.redAccent, fontSize: 16.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(31, 12, 1, 1),
                        fontFamily: "verdana_regular",
                      ),
                      value: _selectedValue,
                      isExpanded: true,
                      isDense: true,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedValue = newValue!;
                        });
                      },
                      items: _dropdownValues
                          .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    value,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            );
                          } as DropdownMenuItem<String> Function(
                              Map<String, dynamic> e))
                          .toList(),
                    ),
                  ),
                );
              },
            ),
          )),
        ));
  }
}
