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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (value) {
              if (value == 'companyInfo') {
                _showCompanyInfoDialog(context);
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 'companyInfo',
                child: Text('Company Info'),
              ),
            ],
          ),
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: provider.results.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading:  Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Colors.grey[200],
                                  child: Icon(Icons.arrow_drop_up_outlined),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  provider.results[index].voting.toString() ?? "",
                                  maxLines: 1,
                                  //overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 4),
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Colors.grey[200],
                                  child: Icon(Icons.arrow_drop_down_outlined),
                                ),
                              ],
                            ),
                        title: Expanded(
                          child: Row(
                            children: [
                              Image.network(
                                  provider.results[index].poster.toString() ?? ""),
                              SizedBox(width: 6,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    provider.results[index].title.toString() ?? "",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                      "Genre: ${provider.results[index].genre.toString() ?? ""}",
                                      style: TextStyle(fontSize: 18)),
                                  Text(
                                    "Director: ${provider.results[index].director.toString() ?? ""}",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    "Starring: ${provider.results[index].stars.toString() ?? ""}",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${provider.results[index].stars.toString() ?? ""} | ",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        "${provider.results[index].language.toString() ?? ""} | ",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        "${provider.results[index].releasedDate.toString() ?? ""}",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${provider.results[index].pageViews.toString() ?? ""} views | ",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.blue),
                                      ),
                                      Text(
                                        "Voted by ${provider.results[index].pageViews.toString() ?? ""} People",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ],
                              )

                            ],
                          ),
                        ),
                        // trailing: SizedBox(
                        //   height: MediaQuery.of(context).size.height*0.3,
                        //   width: MediaQuery.of(context).size.width*0.3,
                        //   child:
                        //   Column(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         provider.results[index].title.toString() ?? "",
                        //         style: TextStyle(fontSize: 24),
                        //       ),
                        //       Text(
                        //           "Genre: ${provider.results[index].genre.toString() ?? ""}",
                        //           style: TextStyle(fontSize: 18)),
                        //       Text(
                        //         "Director: ${provider.results[index].director.toString() ?? ""}",
                        //         style: TextStyle(fontSize: 18),
                        //       ),
                        //       Text(
                        //         "Starring: ${provider.results[index].stars.toString() ?? ""}",
                        //         style: TextStyle(fontSize: 18),
                        //       ),
                        //       Row(
                        //         children: [
                        //           Text(
                        //             "${provider.results[index].stars.toString() ?? ""} | ",
                        //             style: TextStyle(fontSize: 18),
                        //           ),
                        //           Text(
                        //             "${provider.results[index].language.toString() ?? ""} | ",
                        //             style: TextStyle(fontSize: 18),
                        //           ),
                        //           Text(
                        //             "${provider.results[index].releasedDate.toString() ?? ""}",
                        //             style: TextStyle(fontSize: 18),
                        //           ),
                        //         ],
                        //       ),
                        //       Row(
                        //         children: [
                        //           Text(
                        //             "${provider.results[index].pageViews.toString() ?? ""} views | ",
                        //             style: TextStyle(
                        //                 fontSize: 18, color: Colors.blue),
                        //           ),
                        //           Text(
                        //             "Voted by ${provider.results[index].pageViews.toString() ?? ""} People",
                        //             style: TextStyle(
                        //                 fontSize: 18, color: Colors.blue),
                        //           ),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ),
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
            ),
          );
        },
      ),
    );
  }

  void _showCompanyInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Company Info'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Company: Geeksynergy Technologies Pvt Ltd'),
              Text('Address: Sanjayanagar, Bengaluru-56'),
              Text('Phone: XXXXXXXXX09'),
              Text('Email: XXXXXX@gmail.com'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
