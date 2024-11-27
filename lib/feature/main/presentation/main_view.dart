import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_vm.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late final vm = context.read<MainViewModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MobileStarterKit"),
      ),
    );
  }
}
