import 'package:api_calling_bloc/Bloc/phone_bloc.dart';
import 'package:api_calling_bloc/Repository/phone_detail_repository.dart';
import 'package:api_calling_bloc/UI/Screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => phone_detail_repository(),
      child: BlocProvider(
        create: (context) =>
            phone_bloc(context.read<phone_detail_repository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: HomePage(),
        ),
      ),
    );
  }
}
