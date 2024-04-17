import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              height: 100,
              color: Colors.black,

              child: Expanded(
                child: Column(
                      children: [
                        Text('hello')
                      ],
                    ),
              ),
            ),
          ),
        
        ],

      ),
    );
  }
}
