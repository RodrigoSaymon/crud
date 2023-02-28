import 'package:flutter/material.dart';
import 'package:lista/provider/users.dart';
import 'package:lista/viws/user_form.dart';
import 'package:lista/viws/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Users(),
        )
      ],
      child: (MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => UserList(),
          '/formulario': (context) => UserForm(),
        },
        // home:  UserList(),
      )),
    );
  }
}
