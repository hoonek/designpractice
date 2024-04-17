import 'package:flutter/material.dart';
import '../etc/drawermenu.dart';

class ProgressUser extends StatefulWidget {
  const ProgressUser({super.key});

  @override
  _ProgressUserState createState() => _ProgressUserState();
}

class _ProgressUserState extends State<ProgressUser> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            '인허가 진행 현황',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xff333333),
            ),
          ),
        ),
        toolbarHeight: 52,
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: Icon(Icons.menu),
            ),
          ),
        ],
      ),
      endDrawer: DrawerMenu(),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text('인허가'),
          SizedBox(height: 20),

        ],
      ),
    );
  }
}
