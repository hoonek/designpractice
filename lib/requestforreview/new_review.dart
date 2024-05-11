import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designpractice/requestforreview/requestforreview.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../model/model_review.dart';

class Review {
  final String project;
  final String local;
  final String purpose;
  final String name;
  final String space;

  Review({
    required this.project,
    required this.local,
    required this.purpose,
    required this.name,
    required this.space,
  });
}


class NewReview extends StatefulWidget {
  const NewReview({Key? key}) : super(key: key);

  @override
  _NewReviewState createState() => _NewReviewState();
}

class _NewReviewState extends State<NewReview> {
  final TextEditingController _projectEditingController = TextEditingController();
  final TextEditingController _locationEditingController = TextEditingController();
  final TextEditingController _purposeEditingController = TextEditingController();
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _spaceEditingController = TextEditingController();
  bool _areAllFieldsFilled = false;

  @override
  void initState() {
    super.initState();
    _projectEditingController.addListener(_checkFields);
    _locationEditingController.addListener(_checkFields);
    _purposeEditingController.addListener(_checkFields);
    _nameEditingController.addListener(_checkFields);
    _spaceEditingController.addListener(_checkFields);
  }

  void _checkFields() {
    setState(() {
      _areAllFieldsFilled =
          _projectEditingController.text.isNotEmpty &&
              _locationEditingController.text.isNotEmpty &&
              _purposeEditingController.text.isNotEmpty &&
              _nameEditingController.text.isNotEmpty &&
              _spaceEditingController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RequestForReview()),
            );
          },
        ),
        title: const Text('검토 의뢰 작성'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
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
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              onChanged: (_) => _checkFields(),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffe6e3dd), // 변경하려는 색상
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '위치',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xff87857a),
              ),
            ),
            TextField(
              controller: _locationEditingController,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              onChanged: (_) => _checkFields(),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffe6e3dd), // 변경하려는 색상
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '목적',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xff87857a),
              ),
            ),
            TextField(
              controller: _purposeEditingController,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              onChanged: (_) => _checkFields(),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffe6e3dd), // 변경하려는 색상
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '신청인',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xff87857a),
              ),
            ),
            TextField(
              controller: _nameEditingController,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              onChanged: (_) => _checkFields(),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffe6e3dd), // 변경하려는 색상
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '면적',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xff87857a),
              ),
            ),
            TextField(
              controller: _spaceEditingController,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              onChanged: (_) => _checkFields(),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffe6e3dd), // 변경하려는 색상
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async{
                      if (_areAllFieldsFilled) {
                        final id = Uuid().v4();
                        ModelReview modelreview = ModelReview(
                          id: id,
                          project: _projectEditingController.text,
                          location: _locationEditingController.text,
                          purpose: _purposeEditingController.text,
                          name: _nameEditingController.text,
                          space: _spaceEditingController.text,
                        );
                        await FirebaseFirestore.instance.collection('review').doc(modelreview.project).set(modelreview.toJson());
                        Navigator.pop(context, modelreview);
                      } else {
                        // 필드가 하나 이상 비어있는 경우
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('입력 오류'),
                              content: const Text('모든 필드를 작성해주세요.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('확인'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(4),
                      backgroundColor: _areAllFieldsFilled ? const Color(0xff9e8477) : const Color(0xffe1d9d5), // 필드가 모두 채워져 있으면 검은색, 아니면 회색
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      '저장',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
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
