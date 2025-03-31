import 'package:flutter/material.dart';

class FlexPage extends StatefulWidget {
  const FlexPage({super.key});

  @override
  State<FlexPage> createState() => _FlexPageState();
}

class _FlexPageState extends State<FlexPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flexible 예제"),
      ),
      body: Row(
        children: [
          Flexible(
              flex: 1,
              child : Container(
                color: Colors.lightBlue,
                height: 200,
              )
          ),
          Flexible(
              flex: 1,
              child : Container(
                color: Colors.yellow,

              )
          )
        ],
      ),
    );
  }
}