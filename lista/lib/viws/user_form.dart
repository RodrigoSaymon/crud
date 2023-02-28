import 'package:flutter/material.dart';
import 'package:lista/models/user.dart';
import 'package:lista/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  UserForm({Key? key}) : super(key: key);

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user == null) {
      return;
    } else {
      _formData['id'] = user.id ?? '';
      _formData['nome'] = user.nome.toString();
      _formData['email'] = user.email.toString();
      _formData['avatarUrl'] = user.avatarUrl.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User?;

    if (user != null) {
      _loadFormData(user);
      print(user.nome);
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final isValid = _form.currentState!.validate();

                if (isValid) {
                  _form.currentState!.save();
                  Provider.of<Users>(context, listen: false).put(User(
                    id: _formData['id'],
                    nome: _formData['nome'].toString(),
                    email: _formData['email'].toString(),
                    avatarUrl: _formData['avatrUrl'].toString(),
                  ));
                  Navigator.of(context).pop();
                }
              },
              icon: Icon(Icons.save))
        ],
        title: const Text('Formulario de Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  initialValue: _formData['nome'],
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'nome invalido';
                    }
                    if (value.trim().length < 3) {
                      return 'nome muito pequeno';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['nome'] = value.toString(),
                ),
                TextFormField(
                  initialValue: _formData['email'],
                  decoration: InputDecoration(labelText: 'E-mail'),
                  onSaved: (value) => _formData['email'] = value.toString(),
                ),
                TextFormField(
                  initialValue: _formData['avatarUrl'],
                  decoration: InputDecoration(labelText: 'URL do avatar'),
                  onSaved: (value) => _formData['avatarUrl'] = value.toString(),
                )
              ],
            )),
      ),
    );
  }
}
