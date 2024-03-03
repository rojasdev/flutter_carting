import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizPage createState() => _QuizPage();
}

class _QuizPage extends State<QuizPage> {
  Map<String, dynamic> data = {};

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    // Load JSON data from the asset file
    String jsonString = await rootBundle.loadString('data.json');
    setState(() {
      // Parse JSON string to a Map
      data = json.decode(jsonString)['quiz'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Quiz Example'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          String category = data.keys.elementAt(index);
          Map<String, dynamic> categoryData = data[category];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  category,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: categoryData.length,
                itemBuilder: (BuildContext context, int index) {
                  String question = categoryData.keys.elementAt(index);
                  Map<String, dynamic> questionData = categoryData[question];

                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(questionData['question']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var option in questionData['options'])
                            Text(option),
                        ],
                      ),
                      // Add more widgets to display other properties as needed
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
