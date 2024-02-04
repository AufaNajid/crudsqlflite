
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_database/db/db_helper.dart';
import 'package:local_database/pages/create/binding.dart';
import 'package:local_database/pages/create/create.dart';
import 'package:local_database/pages/home/bindings.dart';
import 'package:local_database/pages/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      initialBinding: HomeBindings(),
      getPages: [
        GetPage(
            name: "/", page: () => const HomePage(), binding: HomeBindings()),
        GetPage(
            name: "/create", page: () => const CreatePage(), binding: CreateBinding())
      ],
    );
  }
}