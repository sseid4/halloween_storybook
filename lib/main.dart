import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(length: 4, child: _TabsNonScrollableDemo()),
    );
  }
}

class _TabsNonScrollableDemo extends StatefulWidget {
  @override
  __TabsNonScrollableDemoState createState() => __TabsNonScrollableDemoState();
}

class __TabsNonScrollableDemoState extends State<_TabsNonScrollableDemo>
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
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        tabIndex.value = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    tabIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = ['🎃 Pumpkins', '👻 Ghosts', '🧙‍♀️ Witches', '👹 Monsters'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text(
          'Halloween Storybook 🎃',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.orange,
          tabs: [for (final tab in tabs) Tab(text: tab)],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab 1: Pumpkin Theme
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange[100]!, Colors.orange[50]!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40), // Top spacing
                      Text('🎃', style: TextStyle(fontSize: 100)),
                      SizedBox(height: 20),
                      Text(
                        'Welcome to the Pumpkin Patch!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange[800],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Colors.orange[50],
                              title: Row(
                                children: [Text('🎃 Spooky Alert! 🎃')],
                              ),
                              content: Text(
                                'Boo! You\'ve entered the haunted pumpkin patch! '
                                'The pumpkins are watching you... 👀',
                                style: TextStyle(color: Colors.orange[800]),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text(
                                    'Escape! 🏃‍♂️',
                                    style: TextStyle(color: Colors.orange[700]),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                        ),
                        child: Text('Pick a Pumpkin 🎃'),
                      ),
                      SizedBox(height: 40), // Bottom spacing
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Tab 2: Ghost Theme
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey[200]!, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40), // Top spacing
                      Text('👻', style: TextStyle(fontSize: 100)),
                      SizedBox(height: 20),
                      Text(
                        'Ghostly Encounters',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Whisper to the spirits... 👻',
                            labelStyle: TextStyle(color: Colors.grey[600]),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[700]!),
                            ),
                            prefixIcon: Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Boo! Can you see us floating around? 👻✨',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 40), // Bottom spacing
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Tab 3: Witch Theme
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple[200]!, Colors.purple[100]!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20), // Reduced top spacing
                      Text('🧙‍♀️', style: TextStyle(fontSize: 100)),
                      SizedBox(height: 20),
                      Text(
                        'Witch\'s Magical Lair',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[800],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.purple[700],
                              content: Text(
                                '✨ Magic spell cast! 🔮 Power bubbles! 🧪',
                                style: TextStyle(fontSize: 14),
                              ),
                              duration: Duration(seconds: 3),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple[700],
                          foregroundColor: Colors.white,
                        ),
                        child: Text('Cast a Spell ✨'),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '🔮 Potions brewing... 🧪 Spells ready... ⭐',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.purple[700],
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20), 
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Tab 4: Monster Theme
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red[200]!, Colors.red[100]!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text('👹', style: TextStyle(fontSize: 80)),
                      Text(
                        'Monster\'s Den',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[800],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(16),
                    children: [
                      Card(
                        elevation: 6,
                        color: Colors.red[50],
                        child: ListTile(
                          leading: Text(
                            '🧛‍♂️',
                            style: TextStyle(fontSize: 30),
                          ),
                          title: Text(
                            'Count Dracula',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[800],
                            ),
                          ),
                          subtitle: Text(
                            'Vampire from Transylvania - Loves blood and hates garlic',
                          ),
                        ),
                      ),
                      Card(
                        elevation: 6,
                        color: Colors.red[50],
                        child: ListTile(
                          leading: Text('🐺', style: TextStyle(fontSize: 30)),
                          title: Text(
                            'Werewolf',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[800],
                            ),
                          ),
                          subtitle: Text(
                            'Transforms under full moon - Howls at midnight',
                          ),
                        ),
                      ),
                      Card(
                        elevation: 6,
                        color: Colors.red[50],
                        child: ListTile(
                          leading: Text(
                            '🧟‍♂️',
                            style: TextStyle(fontSize: 30),
                          ),
                          title: Text(
                            'Zombie',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[800],
                            ),
                          ),
                          subtitle: Text(
                            'Walks slowly but never gives up - Loves brains',
                          ),
                        ),
                      ),
                      Card(
                        elevation: 6,
                        color: Colors.red[50],
                        child: ListTile(
                          leading: Text('🕷️', style: TextStyle(fontSize: 30)),
                          title: Text(
                            'Giant Spider',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[800],
                            ),
                          ),
                          subtitle: Text(
                            'Spins webs in dark corners - Eight legs of terror',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '🦇 Welcome to Halloween Storybook 🦇',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
