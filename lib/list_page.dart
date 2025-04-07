import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // hyundai 리스트 선언
  final List<String> hyundai = ["아반떼", "쏘나타", "그랜저", "아이오닉5", "아이오닉6"];
  final TextEditingController _controller = TextEditingController(); // 입력 컨트롤러
  String text = ""; // 텍스트 변수

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
                            hintText: "차종입력", border: OutlineInputBorder()),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        text = _controller.text.trim(); // 텍스트 입력 후 저장
                        if (text.isNotEmpty) {
                          setState(() {
                            hyundai.add(text); // hyundai 리스트에 아이템 추가
                            _controller.clear(); // 입력 필드 초기화
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
                      title: Text(hyundai[index]), // hyundai 리스트에서 텍스트 표시
                      onTap: () {
                        // 아이템 수정 다이얼로그
                        final TextEditingController _editController =
                        TextEditingController(text: hyundai[index]);

                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("아이템수정"),
                                content: TextField(
                                  controller: _editController,
                                  decoration: const InputDecoration(
                                      hintText: "새로운 이름 입력"),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context), // 취소
                                    child: const Text("취소"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      final newText =
                                      _editController.text.trim();
                                      if (newText.isNotEmpty) {
                                        setState(() {
                                          hyundai[index] = newText; // 아이템 수정
                                        });
                                      }
                                      Navigator.pop(context);
                                    },
                                    child: const Text("저장"),
                                  ),
                                ],
                              );
                            });
                      },
                      onLongPress: () {
                        setState(() {
                          hyundai.removeAt(index); // 아이템 삭제
                        });

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                            Text('${hyundai[index]}를 삭제했어요!'))); // 삭제 알림
                      },
                    );
                  }),
            ),
          ],
        ));
  }
}
