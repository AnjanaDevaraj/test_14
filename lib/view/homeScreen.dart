import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_mar14/utilites/customTextButton.dart';

import '../providers/homeProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).callForMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: provider.results.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.grey[200],
                            child: Icon(Icons.arrow_drop_down_outlined),
                          ),
                          SizedBox(height: 4),
                          Text(
                            provider.results[index].voting.toString() ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 4),
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.grey[200],
                            child: Icon(Icons.arrow_drop_up_outlined),
                          ),
                        ],
                      ),
                      title: Image.network(provider.results[index].poster.toString()??""),
                      trailing: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(provider.results[index].title.toString()??""),
                            Text("Genre: ${provider.results[index].genre.toString()??""}"),
                            Text("Director: ${provider.results[index].director.toString()??""}"),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: CustomTextButton(
                        onPressed: () {
                          // Add your onPressed action here
                        },
                        height: 50,
                        text: "Watch Trailer",
                        color: Colors.blue,
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 0.8,
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
