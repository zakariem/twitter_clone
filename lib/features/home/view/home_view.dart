import 'package:appwrite_toturial/constants/ui_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  static route() => MaterialPageRoute(builder: (context) => HomeView());

  HomeView({super.key});

  final appBar = UiContants.appBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: appBar,
      body: const Center(
        child: Text('Home View'),
      ),
    );
  }
}
