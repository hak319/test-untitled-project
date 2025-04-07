import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // fruits 리스트를 hyundai 리스트로 수정
  final List<String> hyundai = ["아반떼", "쏘나타", "그랜저", "아이오닉5", "아이오닉6"];
  final TextEditingController _controller =
  TextEditingController(); // Corrected this line
  String text = ""; // Declare text as a string

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hyundai 리스트 예제"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                            hintText: "아이템입력", border: OutlineInputBorder()),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        text =
                            _controller.text.trim(); // Correct the assignment
                        if (text.isNotEmpty) {
                          setState(() {
                            hyundai.add(text); // Add to hyundai list
                            _controller.clear(); // Clear the input after adding
                          });
                        }
                      },
                      child: const Text("추가"))
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                  itemCount: hyundai.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.edit),
                      title: Text(hyundai[index]), // Use hyundai list
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                '${hyundai[index]}를 선택했어요!'))); // Show selected car
                      },
                      onLongPress: () {
                        setState(() {
                          hyundai
                              .removeAt(index); // Remove item from hyundai list
                        });

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                '${hyundai[index]}를 삭제했어요!'))); // Show deletion message
                      },
                    );
                  }),
            )
          ],
        ));
  }
}
  