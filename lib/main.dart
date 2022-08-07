import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ticketing_system/authentication/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'const.dart';
import 'firebase_options.dart';
// import 'package:movie_ticket_app/const.dart';
// import 'package:movie_ticket_app/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Ticket app ',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
