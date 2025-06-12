import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task2/model/user.dart';
import 'providers/user_provider.dart';
import 'views/user_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());

  runApp(
    ChangeNotifierProvider(create: (_) => UserProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User FetchData',
      debugShowCheckedModeBanner: false,
      home: UserScreen(),
    );
  }
}
