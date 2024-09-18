import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_isolate_lab/models/model.dart';

class Lab2Page extends StatefulWidget {
  const Lab2Page({super.key});

  @override
  State<Lab2Page> createState() => _Lab2PageState();
}

class _Lab2PageState extends State<Lab2Page> {
  List<Model> models = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Large JSON Parsing with `compute` Function"),
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
    final List<Model> models = await compute((jsonString) {
      final List<Object?> data = jsonDecode(jsonString) as List<Object?>;
      return data.cast<Map<String, Object?>>().map(Model.fromJson).toList();
    }, jsonString);
    return models;
  }
}
