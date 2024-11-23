import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class ThemeController extends GetxController {
  var isThemeLight = true.obs;

  void toggleTheme() => isThemeLight.value = !isThemeLight.value;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return Obx(() => GetMaterialApp(
          home: Home(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 237, 5, 21)),
            appBarTheme: AppBarTheme(centerTitle: true, elevation: 2),
          ),
          darkTheme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.yellow, brightness: Brightness.dark)),
          themeMode: themeController.isThemeLight.value
              ? ThemeMode.light
              : ThemeMode.dark,
        ));
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("My homepage"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            padding: EdgeInsets.only(right: 50),
          ),
          IconButton(
            onPressed: () {
              themeController.toggleTheme();
            },
            icon: Obx(() => Icon(
                  themeController.isThemeLight.value
                      ? Icons.toggle_off
                      : Icons.toggle_on,
                )),
            padding: EdgeInsets.only(right: 20),
          )
        ],
      ),
      drawer: const Drawer(
        child: UserAccountsDrawerHeader(
          accountName: Text("Han"),
          accountEmail: Text("hannah@gmail.com"),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(100),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Container(
              height: 300,
              width: 300,
              color: Colors.yellow,
            )
          ],
        ),
      ),
    );
  }
}

class IconBtn extends StatelessWidget {
  final IconData icon;
  final Color colour;
  final double size;

  const IconBtn(
      {super.key,
      required this.icon,
      this.colour = Colors.deepPurple,
      this.size = 32});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: colour,
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
          size: size,
        ),
      ),
    );
  }
}
