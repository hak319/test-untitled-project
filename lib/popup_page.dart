import 'package:flutter/material.dart';

class PopupPage extends StatefulWidget {
  const PopupPage({super.key});

  @override
  State<PopupPage> createState() => _PopupPageState();
}

class _PopupPageState extends State<PopupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('팝업 페이지'),
      ),
      body: Center(
        child: TextButton(
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (BuildContext con) {
                    return AlertDialog(
                      title: const Text("Dialog Title"),
                        content: const Text("Dialog content"),
                            actions:[
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("Cloase"),
                            )
                      ],
                    );
                  }
              );
            },
            child: const Text("팝업버튼")),
      ),
    );
  }
}


