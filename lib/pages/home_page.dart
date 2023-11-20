import 'package:flutter/material.dart';
import 'package:safeway/pages/login_page.dart';
import 'package:safeway/services/auth_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: prefer_final_fields

  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        // Adicione o ícone do botão de sanduíche aqui
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                // Abra o Drawer quando o botão de sanduíche for pressionado
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        // Adicione os itens do menu lateral aqui
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              // ignore: sort_child_properties_last
              child: Container(
                  padding: const EdgeInsets.all(100),
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage("logo.png"),
                      fit: BoxFit.contain,
                    ),
                  )),
            ),
            ListTile(
              // ignore: prefer_const_constructors
              title: Text("Traçar Rota",
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              onTap: () {
                // Adicione a lógica para o Item 1 aqui
              },
            ),
            ListTile(
              // ignore: prefer_const_constructors
              title: Text("Obter a versão Premium",
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              onTap: () {
                // Adicione a lógica para o Item 1 aqui
              },
            ),
            ListTile(
              // ignore: prefer_const_constructors
              title: Text("Logout",
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              onTap: () {
                setState(() => auth.usuario = null);
                context.read<AuthService>().logout();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => (LoginPage())),
                );
              },
            ),
          ],
        ),
      ),
      // ignore: prefer_const_constructors
      body: Center(
        // ignore: prefer_const_constructors
        child: Container(
            height: 1000,
            decoration: const BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage("mapa.png"),
                fit: BoxFit.contain,
              ),
            )),
      ),
    );
  }
}
