import 'package:flutter/material.dart';
import 'package:safeway/pages/login_page.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  // ignore: prefer_final_fields
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 25, top: 24),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (LoginPage())),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ))),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                Column(children: [
                  Container(
                      height: 500,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("carrousel_1.png"),
                          fit: BoxFit.contain,
                        ),
                      )),
                  Container(
                      padding: const EdgeInsets.only(left: 25, bottom: 24),
                      child: const Text(
                          "Conheça o Safeway, o app que te ajuda a se manter seguro todos os dias e em qualquer lugar!",
                          style: TextStyle(color: Colors.white, fontSize: 25)))
                ]),
                Column(children: [
                  Container(
                      height: 500,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("carrousel_2.png"),
                          fit: BoxFit.contain,
                        ),
                      )),
                  Container(
                      padding: const EdgeInsets.only(left: 25, bottom: 24),
                      child: const Text(
                          "Basta criar uma conta e colocar seu destino, nós te guiaremos pelo caminho mais seguro possível.",
                          style: TextStyle(color: Colors.white, fontSize: 25)))
                ]),
                Column(children: [
                  Container(
                      height: 500,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("carrousel_3.png"),
                          fit: BoxFit.contain,
                        ),
                      )),
                  Container(
                      padding: const EdgeInsets.only(left: 25, bottom: 24),
                      child: const Text(
                          "Está em dúvida de onde morar? Nós iremos te ajudar com isso! ",
                          style: TextStyle(color: Colors.white, fontSize: 25)))
                ]),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          _buildIndicators(),
        ],
      ),
    );
  }

  Widget _buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(3, (int index) {
        return Container(
          width: 20.0,
          height: 150.0,
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index
                ? const Color.fromARGB(255, 114, 33, 243)
                : const Color.fromARGB(255, 153, 125, 197),
          ),
        );
      }),
    );
  }
}
