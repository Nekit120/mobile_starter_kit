import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'main_view.dart';
import 'main_vm.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => MainViewModel(),
      child: const MainView(),
    );
  }
}
