import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show Supabase;
import 'tab_bar_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  final _future = Supabase.instance.client.from("noteapp").select();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          controller: controller,
          tabs: [
            Tab(
              text: 'Note',
            ),
            Tab(
              text: 'Favorite',
            ),
            Tab(
              text: 'Loked',
            )
          ],
        ),
        title: const Text("SupaNote"),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.delete_forever),
          )
        ],
      ),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          noteScreeView(_future),
          noteScreeView(_future),
          noteScreeView(_future)
        ],
      ),
    );
  }
}
