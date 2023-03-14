import 'package:flutter/material.dart';
import 'package:my_app/view/home.dart';
import 'package:my_app/view/profile.dart';
import 'package:my_app/view/expand.dart';
import 'package:my_app/pages/order.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: const [
            HomeScreen(),
            OrderScreen(),
            ExpandScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 32.0,
              height: 32.0,
              child: Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 32.0,
              height: 32.0,
              child: Icon(Icons.online_prediction_sharp),
            ),
            label: 'Pemesanan',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 32.0,
              height: 32.0,
              child: Icon(Icons.ac_unit),
            ),
            label: 'Pengeluaran',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 32.0,
              height: 32.0,
              child: Icon(Icons.account_box_rounded),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
