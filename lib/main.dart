import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: _TabsNonScrollableDemo(),
      ),
    );
  }
}

class _TabsNonScrollableDemo extends StatefulWidget {
  @override
  TabsNonScrollableDemoState createState() => TabsNonScrollableDemoState();
}

class TabsNonScrollableDemoState extends State<_TabsNonScrollableDemo>
    with SingleTickerProviderStateMixin, RestorationMixin {
  late TabController _tabController;

  final RestorableInt tabIndex = RestorableInt(0);

  @override
  String get restorationId => 'tab_non_scrollable_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController.index = tabIndex.value;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() {
        tabIndex.value = _tabController.index;
      });
    });
  }

  void _save() {

  }

  void _openSettings() {
    
  }

  @override
  void dispose() {
    _tabController.dispose();
    tabIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = ['Home','Affirmations', 'Exercises', 'Progress'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'App Name',
          textAlign: TextAlign.center,
        ),
        leading: IconButton(onPressed: _openSettings, icon: Icon(Icons.settings)),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          tabs: [
            for (final tab in tabs) Tab(text: tab),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 3),
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('daily affirmation'),
                      IconButton(onPressed: _save, icon: Icon(Icons.bookmark)),
                    ],
                  ),
                )
              ],
            )
          ),
          Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 3),
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('daily affirmation'),
                      IconButton(onPressed: _save, icon: Icon(Icons.bookmark)),
                    ],
                  ),
                )
              ],
            )
          ),
          Center(
            child: Image.network(
	            'https://img.freepik.com/premium-photo/bubble-soap-ballons-shot-macro_1161029-1404.jpg?w=996',
	            width: 150,
	            height: 150,
	          ),
          ),
          Center(
            child: Image.network(
	            'https://r2.erweima.ai/imgcompressed/compressed_349a89ee5f5b2aa8ad1e18ef2e079453.webp',
	            width: 150,
	            height: 150,
	          ),
          ),
        ],
      ),
    );
  }
}
