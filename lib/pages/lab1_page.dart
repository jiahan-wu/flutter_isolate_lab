import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_isolate_lab/models/model.dart';

class Lab1Page extends StatefulWidget {
  const Lab1Page({super.key});

  @override
  State<Lab1Page> createState() => _Lab1PageState();
}

class _Lab1PageState extends State<Lab1Page> {
  List<Model> models = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Large JSON Parsing"),
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
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          getModels().then((models) {
            setState(() {
              this.models = models;
            });
          });
        },
      ),
    );
  }

  Future<List<Model>> getModels() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    final List<Object?> data = jsonDecode(jsonString) as List<Object?>;
    return data.cast<Map<String, Object?>>().map(Model.fromJson).toList();
  }
}
