import 'package:flutter/material.dart';
import 'package:lista/componets/user_tile.dart';

import 'package:lista/provider/users.dart';
import 'package:lista/viws/user_form.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/formulario');
                },
                icon: Icon(Icons.add))
          ],
          title: const Text('Lista de Usuarios'),
        ),
        body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (context, index) => UserTile(users.byIndex(index)),
        ));
  }
}
