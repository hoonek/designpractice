import 'package:flutter/material.dart';
//
class DrawMenuLogout extends StatelessWidget {
  const DrawMenuLogout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '모달 바텀 시트',
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('닫기'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Text('모달 바텀 시트 열기'),
          ),
        ],
      ),
    );
  }
}
