import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';

class AuthPage extends NyStatefulWidget {
  final Controller controller = Controller();
  AuthPage({Key? key}) : super(key: key);
  
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends NyState<AuthPage> {

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
        
      ),
      body: SafeArea(
         child: Container(),
      ),
    );
  }
}
