import 'package:flutter/material.dart';

class Appconstants{
   static String apiUrl ='http://koolmindapps.com/khomes/api/v1/auth/login';
  static String token = 'abc123';
    static const height10 = SizedBox(
    height: 10,
  );
  static const height20 = SizedBox(
    height: 20,
  );
  static const height30 = SizedBox(
    height: 30,
  );
  static height(context) {
    return MediaQuery.of(context).size.height;
  }

  static width(context) {
    return MediaQuery.of(context).size.width;
  }
}