import 'package:flutter/material.dart';
import 'package:simple_login_app/screens/drawer/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: const CustomDrawer(),
      appBar: AppBar(
        toolbarHeight: 70.0,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.menu),
          ),
        ),
      ),
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final String user = 'user';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Welcome, $user!'),
    );
  }
}
