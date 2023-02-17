import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // const MyApp({super.key});
  int counter = 1;

  var faker = Faker();

  final List<Color> myColor = [Colors.red];

  @override
  Widget build(BuildContext context) {
    // layer screen
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.purpleAccent,
        // body:
        // ListView.separated(
        //     itemBuilder: (context, index) {
        //       return Container(
        //         height: 100,
        //         width: 300,
        //         color: myColor[index],
        //       );
        //     },
        //     itemCount: myColor.length,
        //     separatorBuilder: (context, index) {
        //       return Divider(
        //         color: myColor[index],
        //       );
        //     }),
        // ListView.builder(
        // itemCount: 100,
        // itemBuilder: (context, index) {
        //   return ChatItam(
        //       imgUrl: "https://picsum.photos/id/$index/200/300",
        //       title: faker.person.name(),
        //       subtitle: faker.lorem.sentence());
        // },
        // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(counter.toString(), style: const TextStyle(fontSize: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter--;
                    });
                    print(counter);
                  },
                  child: const Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                    print(counter);
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),

        appBar: AppBar(
          title: const Text("My Apps"),
        ),
      ),
    );
  }
}

class ChatItam extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String subtitle;
  const ChatItam(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imgUrl),
        ),
        trailing: const Text("10:00 Am"));
  }
}
