import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("버튼 페이지"),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () => print("Elevated Button"),
                  child: const Text("Elevated버튼")
              ),
            ),
            Center(
              child: TextButton(
                  onPressed: () => print("text Button"),
                  child: const Text("Text버튼")
              ),
            ),
            Center(
              child: OutlinedButton(
                  onPressed: () => print("outline Button"),
                  child: const Text("outline버튼")
              ),
            )
          ],
        ),
      ),
    );
  }
}
