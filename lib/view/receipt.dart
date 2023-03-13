import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:printing/printing.dart';
import 'package:intl/date_symbol_data_local.dart';

class FlightReceipt extends StatelessWidget {
  final String? passengerName;
  final String? seatNumber;
  final String? airlineName;
  final String? flightNumber;
  final String? departureCity;
  final String? arrivalCity;
  final String? departureTime;
  final String? price;

  const FlightReceipt({
    super.key,
    required this.passengerName,
    required this.seatNumber,
    required this.airlineName,
    required this.flightNumber,
    required this.departureCity,
    required this.arrivalCity,
    required this.departureTime,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    print(seatNumber);
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
    initializeDateFormatting('id', null); // initialize Indonesian locale

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiket Kuitansi'),
      ),
      body: ListView.builder(
          itemCount: int.parse(seatNumber!),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        airlineName!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        flightNumber!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Kota keberangkatan',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            departureCity!,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Kota Tujuan:',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            arrivalCity!,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Waktu Berangkat:',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            departureTime!,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Nama Penumpang :',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            passengerName!,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          Text(
                            formatter.format(double.parse(price!)),
                            style: const TextStyle(fontSize: 20.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0), // set the margin value
                  child: SizedBox(
                    width: 20.0,
                    // margin: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      // onPressed: () => addButton(),
                      onPressed: () {
                        print("dsadsad");
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 30, 109, 174), // set the background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // set the border radius
                        ),
                      ),
                      child: const Text('Cetak Tiket'),
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
