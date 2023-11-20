import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safeway/services/auth_service.dart';
import 'package:safeway/widgets/meu_aplicativo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBOQPc4i9aAGNhby6v0U44WqmKyCtwi3jM",
          appId: "1:547452124387:android:9f9a05c40c601457cc99d6",
          messagingSenderId: "547452124387",
          projectId: "safeway-b6119"));

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AuthService()),
  ], child: const MeuAplicativo()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
