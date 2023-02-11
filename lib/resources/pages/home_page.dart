import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/home_controller.dart';
import 'package:nylo_framework/nylo_framework.dart';

class HomePage extends NyStatefulWidget {
  static final String path = "/";
  final HomeController controller = HomeController();
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends NyState<HomePage> {
  List<String> selectedLanguages = [];

  @override
  init() async {
    super.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("appTitle".tr()),
        actions: [
          IconButton(
            onPressed: widget.controller.logout,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
