// import 'dart:async';
// import 'dart:io';

// class HttpExceptionHandler implements Exception {
//   final String message;
//   HttpExceptionHandler(this.message);

//   factory HttpExceptionHandler.from(Exception e) {
//     if (e is SocketException) {
//       return HttpExceptionHandler("No internet connection");
//     } else if (e is HttpException) {
//       return HttpExceptionHandler("Failed to load data");
//     } else if (e is FormatException) {
//       return HttpExceptionHandler("Invalid JSON data");
//     } else if (e is TimeoutException) {
//       return HttpExceptionHandler("Request Time out");
//     } else {
//       return HttpExceptionHandler("An unknown error occured");
//     }
//   }

//   @override
//   String toString() {
//     return message;
//   }
// }
