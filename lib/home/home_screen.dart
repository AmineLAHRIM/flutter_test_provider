import 'package:flutter/material.dart';
import 'package:flutter_test_provider/home/home_controller.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Logger().i('HomeScreen init');
    return ChangeNotifierProvider(
      create: (_) => HomeController(),
      child: LayoutBuilder(builder: (context, _) {
        Logger().v('ChangeNotifierProvider build');
        return const Scaffold(
          body: SafeArea(
            child: BodyView(),
          ),
        );
      }),
    );
  }
}

class BodyView extends StatelessWidget {
  const BodyView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Logger().i('BodyView build');
    return Column(
      children: [
        Text(
          context.select((HomeController value) => '${value.a}'),
        ),
        Builder(builder: (context) {
          Logger().i('Text B build');
          return Text(
            context.select((HomeController value) => '${value.b}'),
          );
        }),
        Builder(builder: (context) {
          Logger().i('Text User build');
          final user = context.select((HomeController value) => value.user);
          return Text(user.name);
        }),
        ElevatedButton(
          onPressed: () {
            context.read<HomeController>().onIncrementA();
            Navigator.of(context).pushNamed('/home');
          },
          child: const Text('onIncrementA'),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<HomeController>().onIncrementB();
          },
          child: const Text('onIncrementB'),
        )
      ],
    );
  }
}
