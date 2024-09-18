import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_isolate_lab/models/model.dart';

class Lab3Page extends StatefulWidget {
  const Lab3Page({super.key});

  @override
  State<Lab3Page> createState() => _Lab3PageState();
}

class _Lab3PageState extends State<Lab3Page> {
  List<Model> models = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Large JSON Parsing with `Isolate.run`"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                models = [];
              });
            },
            icon: const Icon(Icons.restore),
          )
        ],
      ),
      body: Column(
        children: [
          const LinearProgressIndicator(),
          Expanded(
            child: ListView.builder(
              itemCount: models.length,
              itemBuilder: (_, index) {
                final model = models[index];

                return ListTile(
                  title: Text(model.id),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getModels().then((models) {
            setState(() {
              this.models = models;
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<List<Model>> getModels() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    final List<Model> models = await Isolate.run<List<Model>>(() {
      final List<Object?> data = jsonDecode(jsonString) as List<Object?>;
      return data.cast<Map<String, Object?>>().map(Model.fromJson).toList();
    });
    return models;
  }
}
