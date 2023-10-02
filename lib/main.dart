import 'package:flutter/material.dart';
import 'package:notjusttodoapp/provider/filter_provider.dart';
import 'package:notjusttodoapp/provider/task_provider.dart';
import 'package:notjusttodoapp/provider/theme_provider.dart';
import 'package:notjusttodoapp/views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TaskProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FilterProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.tealAccent,  
        primaryColorDark: Colors.white54,      
      ),
      themeMode: theme.currentTheme(),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'To-Do App'),
    );
  }
}
