import 'package:flutter/material.dart';
import 'package:my_app/api/api_profile.dart';
import '../models/profile.dart';
import '../component/ProfileItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final List<BannerItem> bannerItems = [
    BannerItem(
      title: 'Jakarta',
      description: 'Description 1',
      imageUrl:
          'https://www.jakarta.go.id/uploads/contents/content--20210113071032.JPG',
    ),
    BannerItem(
      title: 'Surabaya',
      description: 'Description 2',
      imageUrl:
          'https://ecs7.tokopedia.net/blog-tokopedia-com/uploads/2018/04/Wisata-Malam-Surabaya.jpg',
    ),
    BannerItem(
      title: 'Bandung',
      description: 'Description 3',
      imageUrl:
          'https://awsimages.detik.net.id/community/media/visual/2022/07/20/kota-bandung_43.jpeg?w=1200',
    )
  ];
  List<Profile>? profiles;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    ApiService apiService = ApiService();
    profiles = await apiService.getProfiles();
    if (profiles != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              border: InputBorder.none,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ),
        body: Visibility(
            visible: isLoading,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: Column(children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 10, top: 10),
                child: const Text(
                  "Daftar Kota",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(31, 17, 9, 9)),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bannerItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 300,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(bannerItems[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            bannerItems[index].title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            bannerItems[index].description,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                //color: Colors.white,
                child: ListView.builder(
                    itemCount: profiles?.length,
                    itemBuilder: (context, index) {
                      return ProfileItem(
                          imgUrl: profiles![index].avatar,
                          title: profiles![index].first_name,
                          subtitle: profiles![index].email);
                    }),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 30, 109, 174), // set the background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // set the border radius
                    ),
                  ),
                  child: const Text('Simpan'),
                ),
              ),
            ])));
  }
}

class BannerItem {
  final String title;
  final String description;
  final String imageUrl;

  BannerItem({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
