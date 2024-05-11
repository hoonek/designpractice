import 'dart:async';

import 'package:designpractice/const/color.dart';
import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

import '../const/text_style.dart';

final ValueNotifier<String?> vnUserName = ValueNotifier(null);
final ValueNotifier<List<int>> vnListInt = ValueNotifier([1, 2, 3]);

class ProgressUser extends StatefulWidget {
  const ProgressUser({super.key});

  @override
  State<ProgressUser> createState() => _ProgressUserState();
}

class _ProgressUserState extends State<ProgressUser> {
  @override
  Widget build(BuildContext context) {
    debugPrint("리빌드1");

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: LinearProgressBar(
                  maxSteps: 9,
                  progressType: LinearProgressBar.progressTypeLinear,
                  currentStep: 3,
                  progressColor: colorPrimary,
                  backgroundColor: colorBlack,
                  dotsAxis: Axis.horizontal,
                  // OR Axis.vertical
                  dotsSpacing: const EdgeInsets.only(right: 10), // also can use any EdgeInsets.
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 100,
                //color: Colors.blue.withOpacity(0.6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      8,
                      (index) => Column(
                            children: [
                              Icon(Icons.circle, color: index < 3 ? colorBlack : colorGray500),
                              const Text(
                                'aaa',
                                style: TS.s15w500(colorBlack),
                              ),
                            ],
                          )),
                ),
              ),
            ],
          ),
          ValueListenableBuilder(
            valueListenable: vnUserName,
            builder: (context, userName, child) {
              debugPrint("리빌드2");
              return Text(
                userName ?? 'null 입니다',
                style: TS.s15w500(colorBlack),
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: vnListInt,
            builder: (context, listInt, child) {
              debugPrint("리빌드3");
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  listInt.length,
                  (index) => Text(
                    listInt[index].toString(),
                    style: TS.s15w500(colorBlack),
                  ),
                ),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              vnUserName.value = 'd';
              //debugPrint("test : ${vnUserName.value}");
            },
            child: Text("테스트 1"),
          ),
          ElevatedButton(
            onPressed: () {
              // vnListInt.value = vnListInt.value..add(4);
              // 이거는 같음 플러터 기준에서 주소값 첫번쨰배열 기준으로 인식하기 떄문에 4를 추가해도 리빌드 안됌
              // vnListInt.value = [1, 2, 3, 4];
              // vnListInt.value = List.from(vnListInt.value);
              vnListInt.value = vnListInt.value;
            },
            child: Text("테스트 2"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {});
            },
            child: Text("Setstate"),
          )
        ],
      ),
    );
  }
}
