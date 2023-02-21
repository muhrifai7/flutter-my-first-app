// import 'package:flutter/material.dart';
// import 'package:faker/faker.dart';

// class Dashboard extends StatelessWidget {
//   final faker = Faker();
//   final List<Color> myColor = [Colors.red];

//   Dashboard({super.key});
//   @override
//   Widget build(BuildContext context) {
//     // layer screen
//     return MaterialApp(
//       // debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         // backgroundColor: Colors.purpleAccent,
//         body:
//             // ListView.separated(
//             //     itemBuilder: (context, index) {
//             //       return Container(
//             //         height: 100,
//             //         width: 300,
//             //         color: myColor[index],
//             //       );
//             //     },
//             //     itemCount: myColor.length,
//             //     separatorBuilder: (context, index) {
//             //       return Divider(
//             //         color: myColor[index],
//             //       );
//             //     }),
//             ListView.builder(
//           itemCount: 100,
//           itemBuilder: (context, index) {
//             return ChatItam(
//                 imgUrl: "https://picsum.photos/id/$index/200/300",
//                 title: faker.person.name(),
//                 subtitle: faker.lorem.sentence());
//           },
//         ),
//         appBar: AppBar(
//           title: const Text("My Apps"),
//         ),
//       ),
//     );
//   }
// }

// class ChatItam extends StatelessWidget {
//   final String imgUrl;
//   final String title;
//   final String subtitle;
//   const ChatItam(
//       {super.key,
//       required this.imgUrl,
//       required this.title,
//       required this.subtitle});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//         title: Text(title),
//         subtitle: Text(subtitle),
//         leading: CircleAvatar(
//           backgroundImage: NetworkImage(imgUrl),
//         ),
//         trailing: const Text("10:00 Am"));
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(const Dashboard());
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.dvr),
          //   label: 'dashboard',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
