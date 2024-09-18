import 'package:flutter/material.dart';

import 'package:flutter_isolate_lab/pages/lab1_page.dart';
import 'package:flutter_isolate_lab/pages/lab2_page.dart';
import 'package:flutter_isolate_lab/pages/lab3_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Labs"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Text("1"),
            title: const Text("Large JSON Parsing"),
            onTap: () {
              final route = MaterialPageRoute(builder: (_) => const Lab1Page());

              Navigator.of(context).push(route);
            },
          ),
          ListTile(
            leading: const Text("2"),
            title: const Text("Large JSON Parsing with `compute` Function"),
            onTap: () {
              final route = MaterialPageRoute(builder: (_) => const Lab2Page());

              Navigator.of(context).push(route);
            },
          ),
          ListTile(
            leading: const Text("3"),
            title: const Text("Large JSON Parsing with `Isolate.run`"),
            onTap: () {
              final route = MaterialPageRoute(builder: (_) => const Lab3Page());

              Navigator.of(context).push(route);
            },
          ),
        ],
      ),
    );
  }
}
