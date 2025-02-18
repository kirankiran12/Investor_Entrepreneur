import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:investorentrepreneur/screen/home/filter/provider/filter_provider.dart';
import 'package:investorentrepreneur/splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ExpansionTileState(),)
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Splashscreen(),
       
      ),
    );
  }
}
