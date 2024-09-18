import 'package:flutter/material.dart';
import 'package:flutter_data_driven_app/di/service_locator.dart';
import 'package:flutter_data_driven_app/page_2.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<StatefulWidget> createState() {
    return Page1State();
  }
}

class Page1State extends State<Page1> {
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();

  @override
  void initState() {
    try {
      throw Exception("exemplo de exception");
    } catch (e) {
      ServiceLocator.instance.dataDog.error(e.toString());
      ServiceLocator.instance.dynatrace.errorAction(e.toString());
    }

    ServiceLocator.instance.firebase.sendAnalyticsEvent("tela 1");
    ServiceLocator.instance.segment.screen("screen 1");
    ServiceLocator.instance.dynatrace.enterAction("tela 01");
    ServiceLocator.instance.appsFlyer.logEvent("01 tela");

    ServiceLocator.instance.dataDog.info("Log da tela 1");
    ServiceLocator.instance.dynatrace.logAction("Log 1");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: firstController,
              decoration: const InputDecoration(
                labelText: 'Primeiro Campo de Texto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: secondController,
              decoration: const InputDecoration(
                labelText: 'Segundo Campo de Texto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                String text1 = firstController.text;
                String text2 = secondController.text;

                ServiceLocator.instance.firebase
                    .sendAnalyticsEvent("Clique no botão $text1 $text2");
                ServiceLocator.instance.segment.event("Clicou $text1 $text2");
                ServiceLocator.instance.dynatrace
                    .enterAction("Olha o clique $text1 $text2");
                ServiceLocator.instance.appsFlyer
                    .logEvent("Foi clicado $text1 $text2");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Page2()),
                );
              },
              child: const Text('Próxima pagina'),
            ),
          ],
        ),
      ),
    );
  }
}
