import 'package:flutter/material.dart';
import 'package:my_app/api/api_profile.dart';
import '../models/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
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
        body: Visibility(
      visible: isLoading,
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      child: ListView.builder(
          itemCount: profiles?.length,
          itemBuilder: (context, index) {
            return Container(
              child: Text(profiles![index].email,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            );
          }),
    ));
  }
}
