import 'package:flutter/material.dart';
import 'package:flutter_data_driven/domain/model/engineering/error_event.dart';
import 'package:flutter_data_driven/domain/model/engineering/log_event.dart';
import 'package:flutter_data_driven/domain/model/product/experience_event.dart';
import 'package:flutter_data_driven/flutter_data_driven.dart';
import 'package:flutter_data_driven_app/di/service_locator.dart';

import 'page_3.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<StatefulWidget> createState() {
    return Page2State();
  }
}

class Page2State extends State<Page2> {
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();
  final DataDriven _dataDriven = ServiceLocator.instance.dataDriven;
  @override
  void initState() {
    try {
      throw Exception("exemplo de exception");
    } on Exception catch (e) {
      _dataDriven.track(ErrorEvent(
          identifier: "example_error",
          exception: e,
          message: e.toString(),
          stacktrace: e.toString()));
    }

    _dataDriven
        .track(PageViewEvent(identifier: "page_2", pageTitle: "Pagina 2"));

    _dataDriven.track(LogEvent(
        identifier: "log_page_1",
        logType: LogType.info,
        message: "Log da Pagina 1"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela 2'),
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
                // Ação ao clicar no botão
                String text1 = firstController.text;
                String text2 = secondController.text;

                _dataDriven.track(InteractionEvent(
                    identifier: "click_page_2",
                    pageTitle: "Pagina 2",
                    interaction: "Clique da Pagina 2 $text1 $text2"));

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Page3()),
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
