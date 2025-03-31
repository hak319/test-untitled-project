import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}




class _InputPageState extends State<InputPage> {

  final TextEditingController _controller = TextEditingController();
  String _message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('이름 입력 예제'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                  labelText: "이름을 입력하세요",
                  border: OutlineInputBorder()
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _message = "${_controller.text}님, 반가워요!";
                  });
                },
                child: Text("확인")
            ),
            Text(
              _message,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}