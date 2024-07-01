import 'package:flutter/material.dart';
import 'package:localization/app_localizations.dart';
import 'package:localization/pages/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home".translate(context)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (ctx, animation, secondaryAnimation) =>
                      const SettingsPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0, 1);
                    const end = Offset.zero;
                    final slideTween = Tween(begin: begin, end: end);
                    const curve = Curves.ease;
                    final curveTween = CurveTween(curve: curve);

                    final tween = slideTween.chain(curveTween);
                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                ),
              );
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      drawer: const Drawer(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "hello".translate(context),
              style: const TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            const Text(
              "This text is not translatable.",
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
