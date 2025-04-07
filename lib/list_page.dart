import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // hyundai 리스트 선언
  List<String> hyundai = [];
  final TextEditingController _controller = TextEditingController(); // 입력 컨트롤러
  String text = ""; // 텍스트 변수

  @override
  void initState() {
    // Corrected the method name to 'initState'
    super.initState();
    _loadhyundai();
  }

  void _loadhyundai() async {
    final prefs = await SharedPreferences.getInstance();
    final saveData = prefs.getStringList("hyundai");
    if (saveData != null) {
      setState(() {
        hyundai = saveData;
      });
    }
  }

  void _savehyundai() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList("hyundai", hyundai); // Added missing semicolon
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hyundai 리스트"),
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
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    text = _controller.text.trim(); // 텍스트 입력 후 저장
                    if (text.isNotEmpty) {
                      setState(() {
                        hyundai.add(text); // hyundai 리스트에 아이템 추가
                        _controller.clear(); // 입력 필드 초기화
                      });
                      _savehyundai();
                    }
                  },
                  child: const Text("추가"),
                )
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
                              decoration:
                              const InputDecoration(hintText: "새로운 이름 입력"),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context), // 취소
                                child: const Text("취소"),
                              ),
                              TextButton(
                                onPressed: () {
                                  final newText = _editController.text.trim();
                                  if (newText.isNotEmpty) {
                                    setState(() {
                                      hyundai[index] = newText; // 아이템 수정
                                    });
                                    _savehyundai();
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
                    final deletedItem =
                    hyundai[index]; // Save the deleted item before removal
                    setState(() {
                      hyundai.removeAt(index); // 아이템 삭제
                    });
                    _savehyundai();

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            '$deletedItem를 삭제했어요!')) // Corrected the SnackBar message
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
