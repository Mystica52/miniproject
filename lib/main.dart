import 'package:expense_tracker/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import './routing.dart';
import 'homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox("expense_tracker");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionData(),
      builder: (context, child) => const MaterialApp(
        title: 'Expense Tracker',
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        onGenerateRoute: RouteGenerator.generateRoute,
        home: HomePage(),
      ),
    );
  }
}
