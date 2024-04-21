import 'package:designpractice/requestforreview/requestforreview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class EnterReview extends StatefulWidget {
  const EnterReview({Key? key}) : super(key: key);

  @override
  _EnterReviewState createState() => _EnterReviewState();
}

class _EnterReviewState extends State<EnterReview> {
  TextEditingController _projectEditingController = TextEditingController();
  TextEditingController _locationEditingController = TextEditingController();
  TextEditingController _purposeEditingController = TextEditingController();
  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _spaceEditingController = TextEditingController();
  String _userInput = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> RequestForReview()),
            );
          },
        ),
        title: Text('검토 의뢰 작성'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '프로젝트',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xff87857a),
                  ),
                ),
              ],
            ),
            TextField(
              controller: _projectEditingController,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffe6e3dd), // 변경하려는 색상
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Text(
              '위치',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xff87857a),
              ),
            ),

            TextField(
              controller: _locationEditingController,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffe6e3dd), // 변경하려는 색상
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Text(
              '목적',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xff87857a),
              ),
            ),

            TextField(
              controller: _purposeEditingController,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffe6e3dd), // 변경하려는 색상
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Text(
              '신청인',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xff87857a),
              ),
            ),

            TextField(
              controller: _nameEditingController,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffe6e3dd), // 변경하려는 색상
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Text(
              '면적',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xff87857a),
              ),
            ),

            TextField(
              controller: _spaceEditingController,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffe6e3dd), // 변경하려는 색상
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _projectEditingController.dispose();
    _locationEditingController.dispose();
    _purposeEditingController.dispose();
    _nameEditingController.dispose();
    _spaceEditingController.dispose();
    super.dispose();
  }
}
