// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safeway/pages/home_page.dart';
import 'package:safeway/pages/login_page.dart';
import 'package:safeway/services/auth_service.dart';

class AuthCheck extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  AuthCheck({Key? key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading)
      // ignore: curly_braces_in_flow_control_structures
      return loading();
    else if (auth.usuario == null)
      // ignore: curly_braces_in_flow_control_structures
      return LoginPage();
    else
      // ignore: curly_braces_in_flow_control_structures
      return const HomePage();
  }

  loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
