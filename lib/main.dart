import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:pok_ful/core/constants/router/router.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      onGenerateRoute: RouterGenerator.router.onGenerate,
      initialRoute: '/',
      

      
      debugShowCheckedModeBanner: false,

    );
  }
}
