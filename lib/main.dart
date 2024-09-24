

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screen/tabs.dart';


final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark
  ,seedColor:const Color.fromARGB(255, 24, 72, 126)

  ),

);

void main (){
  runApp(const ProviderScope(child:  App()
  ));
}


class App extends StatelessWidget {
  const App ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home:const TabsScreen(),
    );
  }
}