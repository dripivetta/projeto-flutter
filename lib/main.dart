import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tg/presentation/pages/home/home_page.dart';
import 'package:tg/presentation/pages/onboarding/onboarding.dart';
import 'package:tg/presentation/pages/cadastro_vendedor/cadastro_vendedor.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.blue,
      ),
      home: const Onboarding(),
    );
  }
}

