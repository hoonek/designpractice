import 'package:designpractice/model/modelopinion.dart';
import 'package:flutter/material.dart';
import 'package:designpractice/requestforreview/requestforreviewuser.dart';
import '../model/modelreview.dart';

class EditReview extends StatefulWidget {

  final ModelReview modelReview;

  const EditReview({Key? key, required this.modelReview}) : super(key: key);

  @override
  State<EditReview> createState() => _EditReviewState();
}

class _EditReviewState extends State<EditReview> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RequestForReviewUser()),
            );
          },
        ),
        title: const Text('검토 현황'),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20, top:8, bottom: 8),
                  child: Text(
                    '검토의견',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff333333),
                    ),
                  ),
                ),
              ),

              Container(
                width: 335,
                height: 131,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xfff4f1ea),
                ),
                child:
                const Text(
                  'dd'
                ),

              ),

              SizedBox(height: 20),

              Text(
                '프로젝트',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xff87857a),
                ),
              ),
              TextField(
                controller: TextEditingController(text: widget.modelReview.project),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 20),

              Text(
                '위치',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xff87857a),
                ),
              ),
              TextField(
                controller: TextEditingController(text: widget.modelReview.location),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 20),

              Text(
                '목적',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xff87857a),
                ),
              ),
              TextField(
                controller: TextEditingController(text: widget.modelReview.purpose),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 20),

              Text(
                '신청인',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xff87857a),
                ),
              ),
              TextField(
                controller: TextEditingController(text: widget.modelReview.name),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 20),

              Text(
                '면적',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xff87857a),
                ),
              ),
              TextField(
                controller: TextEditingController(text: widget.modelReview.space),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
