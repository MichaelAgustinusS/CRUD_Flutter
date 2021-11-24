import 'package:NilaiAkm/providers/nilai_provider.dart';
import 'package:NilaiAkm/screens/nilai_akm.dart';
import 'package:NilaiAkm/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NilaiProvider()),
        StreamProvider(create: (context)=> firestoreService.getNilai()),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: NilaiAkm(),
      )
    );
  }
}
