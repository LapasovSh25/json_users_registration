// import 'dart:io';

// import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:offline_comment/service/home_service.dart';

// class HomeRepository {
//   Box? currencyBox;

//   UserService testService = UserService();

//   Future<dynamic> getCurrency() async {
//     return await testService.().then((dynamic response) async {
//       if (response is List) {
//         await openBox();
//         await putToBox(response);
//         if (response.isEmpty) {
//           return "Currency ma'lumotlari hali yaratilmagan";
//         } else {
//           return currencyBox;
//         }
//       } else {
//         return response;
//       }
//     });
//   }

//   Future<void> openBox() async {
//     Directory appDocDir = await getApplicationDocumentsDirectory();
//     Hive.init(appDocDir.path);
//     currencyBox = await Hive.openBox("currencyBox");
//   }

//   // static Future<void> registerAdapter() async {
//   //   Hive.registerAdapter();
//   // }

//   Future<void> putToBox(List users) async {
//     await currencyBox!.clear();
//     for (int i = 0; i < users.length; i++) {
//       await currencyBox!.add(users[i]);
//     }
//   }
// }
