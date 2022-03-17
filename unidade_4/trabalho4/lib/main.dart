
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trab_4_mobile/SignIn.dart';
import 'package:provider/provider.dart';

import 'UserProvider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Save The Date',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: SignInPage(),
      ),
    );
  }
}

