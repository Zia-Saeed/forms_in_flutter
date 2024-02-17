import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_practise/provider/provider_example.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});
  @override
  ConsumerState<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello"),
        ),
        body: Column(
          children: [
            Text(
              ref.watch(stateCount).length.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(stateCount.notifier).addElement("hello");
              },
              child: const Text("Press me"),
            ),
          ],
        ),
      ),
    );
  }
}
