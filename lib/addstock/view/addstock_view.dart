import 'package:flutter/material.dart';

class AddStockView extends StatelessWidget {
  AddStockView({Key? key}) : super(key: key);

  final currentDate = '${DateTime.now()}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Stock')),
      body: Column(
        children: [
          Text(currentDate),
          const TextField(
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ],
      ),
    );
  }
}
