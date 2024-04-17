import 'package:designpractice/start%20screen/test.dart';
import 'package:flutter/material.dart';
import '../progress/progressuser.dart';


class SelectOption extends StatelessWidget {
  const SelectOption({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '원하는 항목을 \n 선택해주세요',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Color(0xff333333),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                List<String> titles = ['인허가 진행현황', '검토의뢰'];
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProgressUser(),
                        ),
                      );
                    } else if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Test(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: 80,
                    margin: EdgeInsets.all(5),
                    child: Text(
                      titles[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xfff3f1ea),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
