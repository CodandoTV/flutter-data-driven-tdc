import 'package:flutter/material.dart';
import 'package:flutter_data_driven/domain/model/product/experience_event.dart';

import 'di/service_locator.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<StatefulWidget> createState() {
    return Page3State();
  }
}

class Page3State extends State<Page3> {
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();

  @override
  void initState() {
    ServiceLocator.instance.dataDriven
        .track(PageViewEvent(identifier: "page_3", pageTitle: "Pagina 3"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela 3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
            Text('Ultima pagina'),
          ],
        ),
      ),
    );
  }
}
