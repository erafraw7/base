import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'ui/main_page.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(
    SplashApp(
      onInitializationComplete: () {
        runMainApp();
      },
    ),
  );
}

void runMainApp() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fow",
      theme: ThemeData(),
      home: MainPage(),
    );
  }
}

class SplashApp extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashApp({
    Key? key,
    required this.onInitializationComplete,
  }) : super(key: key);

  @override
  _SplashAppState createState() => _SplashAppState();
}

class _SplashAppState extends State<SplashApp> {
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initializeAsyncDependencies();
  }

  Future<void> _initializeAsyncDependencies() async {
    // >>> initialize async dependencies <<<
    // >>> register favorite dependency manager <<<
    // >>> reap benefits <<<
    await Hive.initFlutter();
    await Hive.openBox('settings');
    Future.delayed(
      Duration(milliseconds: 2000),
      () => widget.onInitializationComplete(),
    );
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      title: "Fow",
      theme: ThemeData(),
      home: Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print('${bloc.runtimeType} $change');
    super.onChange(bloc, change);
  }
}
