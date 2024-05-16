import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/bloc/search/search_bloc.dart';
import 'package:todo_app/src/bloc/todo/todo_bloc.dart';
import 'package:todo_app/src/constants/theme/theme_light_dark.dart';
import 'package:todo_app/src/ui/auth/login.dart';
import 'package:todo_app/src/ui/todo/todo_main.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = TodoTheme.lightTheme;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TodoBloc()),
        BlocProvider(create: (_) => SearchBloc()),
      ],
      child: MaterialApp(
        theme: currentTheme,
        home: const TodoMainUi()
      ),
    );
  }
}
