import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:offline_comment/bloc/login_bloc/login_state.dart';
import 'package:offline_comment/bloc/register_bloc/register_state.dart';
import 'package:offline_comment/core/rooter/rooter.dart';
import 'package:offline_comment/view/auth/register_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_comment/view/auth/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => RegisterCubit(),
    ),
     BlocProvider(
      create: (context) => LoginCubit(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.router.onGenerate,
      debugShowCheckedModeBanner: false,
      initialRoute: 'register',
    );
  }
}
