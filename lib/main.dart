import 'package:flutter/material.dart';

import 'package:investorentrepreneur/screen/home/filter/screen/filterscreen.dart';
import 'package:investorentrepreneur/screen/home/filter/provider/filter_provider.dart';
import 'package:investorentrepreneur/screen/home/homescreen.dart';
import 'package:investorentrepreneur/screen/jobs/screen/apply_to_tangent_screen.dart';
import 'package:investorentrepreneur/screen/jobs/screen/job_filter_screen.dart';
import 'package:investorentrepreneur/screen/jobs/screen/jobs_screen.dart';
import 'package:investorentrepreneur/screen/podcast/podcastcategory.dart';

import 'package:investorentrepreneur/splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';


void main() {
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
        // home: const JobFilterScreen(),
      ),
    );
  }
}
