import 'package:flutter/material.dart';

import 'userPage/user_page.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: UserPage(),
    );
  }
}
