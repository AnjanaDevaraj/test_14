// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class MovieCard extends StatelessWidget {
//   final String title;
//   final String genre;
//   final DateTime? date;
//   final String imageUrl;
//   final String director;
//   final String starring;
//   final String url;
//
//   MovieCard({super.key,
//     required this.title,
//     required this.genre,
//     this.date,
//     required this.imageUrl,
//     required this.director,
//     required this.starring,
//     required this.url});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             height: 200,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               image: DecorationImage(
//                   image: NetworkImage(
//                     imageUrl,
//                   ),
//                   fit: BoxFit.cover),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Column(
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(
//                     fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("$starring | ${DateFormat('dd/MM/yyyy')
//                       .format(date!)
//                       .toString() ?? ""}"),
//                   IconButton(
//                       onPressed: () {
//                         String newsShare = "$title \n \n $genre \n \n $url";
//                         Provider.of<HomeScreenController>(
//                             context, listen: false).shareText(
//                             textToShare: newsShare);
//                       },
//                       icon: const Icon(Icons.share))
//                 ],
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
