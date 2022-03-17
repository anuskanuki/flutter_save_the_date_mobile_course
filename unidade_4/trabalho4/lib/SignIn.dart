import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trab_4_mobile/signup_page.dart';
import 'package:trab_4_mobile/user_model.dart';

import 'Home.dart';
import 'UserProvider.dart';

class SignInPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserModel _user = UserModel();

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
                  // enabled: !userProvider.isLoading,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    icon: Icon(Icons.email),
                  ),
                  initialValue: 'repolho@gmail.com',
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
                TextFormField(
                  // enabled: !userProvider.isLoading,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    icon: Icon(Icons.lock),
                  ),
                  initialValue: '123456',
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
                  height: 30,
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
                      side: BorderSide(color: Colors.red),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        context.read<UserProvider>().connect(
                            user: _user,
                            onFail: (e) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Falha ao entrar: $e'),
                                backgroundColor: Colors.red,
                              ));
                            },
                            onSuccess: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => HomePage()));
                            });
                      }
                    },
                    child: const Text(
                      'ENTRAR',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignUpPage()));
                      },
                      child: const Text('Novo usuário? Cadastre-se',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              decoration: TextDecoration.underline))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
