import 'package:date_field/date_field.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:trab_4_mobile/user_model.dart';

import 'UserProvider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserModel _user = UserModel();
  bool isManager = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: <Widget>[
                Center(
                  child: const Text(
                    'Save The Date',
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Nome Completo', icon: Icon(Icons.person)),
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Campo obrigatório';
                    } else if (name.trim().split(' ').length <= 1) {
                      return 'Preencha com seu nome completo';
                    }
                    return null;
                  },
                  onSaved: (name) => _user.name = name!,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'E-mail', icon: Icon(Icons.mail)),
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  onSaved: (email) => _user.email = email!,
                ),
                const SizedBox(
                  height: 16,
                ),
                DateTimeFormField(
                  decoration: const InputDecoration(
                      labelText: 'Data de nascimento', icon: Icon(Icons.cake)),
                  mode: DateTimeFieldPickerMode.date,
                  validator: (birthday) {
                    if (birthday == null) {
                      return 'Campo obrigatória!';
                    }
                    if (!birthday.isBefore(DateTime.now().add(new Duration(days: 18 * 365 )))) {
                      return 'Você deve ser maior de 18!';
                    }
                    return null;
                  },
                  onSaved: (birthday) => _user.birthday = birthday!,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Senha', icon: Icon(Icons.lock)),
                  obscureText: true,
                  validator: (pass) {
                    if (pass!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  onSaved: (pass) => _user.password = pass!,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Repita a Senha', icon: Icon(Icons.lock)),
                  obscureText: true,
                  validator: (pass) {
                    if (pass!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  onSaved: (pass) => _user.confirmPassword = pass!,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  child: RaisedButton(
                    color: Colors.red,
                    disabledColor:
                        Theme.of(context).primaryColor.withAlpha(100),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: Colors.red)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        if (_user.password != _user.confirmPassword) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('Senhas não coincidem!'),
                            backgroundColor: Colors.red,
                          ));
                          return;
                        }
                        context.read<UserProvider>().createNewUser(
                            _user,
                            (e) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content:
                                    Text('Erro ao cadastrar novo usuário: $e'),
                                backgroundColor: Colors.red,
                              ));
                            },
                            () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Usuário criado com sucesso!'),
                                backgroundColor: Colors.green[800],
                              ));
                              Navigator.pop(context);
                            });
                      }
                    },
                    child: const Text(
                      'Criar Conta',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  child: RaisedButton(
                    color: Colors.blue,
                    disabledColor:
                        Theme.of(context).primaryColor.withAlpha(100),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: Colors.blue)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Voltar',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
