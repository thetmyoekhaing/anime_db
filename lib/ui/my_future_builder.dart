// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MyFutureBuilder extends StatelessWidget {
//   RxBool isLoading;
//   Future<void> futureFunc;
//   Widget dataWidget;
//   MyFutureBuilder(
//       {super.key,
//       required this.isLoading,
//       required this.futureFunc,
//       required this.dataWidget});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: futureFunc,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           return isLoading.value
//               ? const Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : Container();
//         } else if (snapshot.connectionState == ConnectionState.done) {
//           return dataWidget;
//         } else {
//           return Center(
//             child: Text(
//               snapshot.error.toString(),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
