import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(length: 5, child: _TabsNonScrollableDemo()),
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
    _tabController = TabController(initialIndex: 0, length: 5, vsync: this);
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
    final tabs = [
      '🎃 Pumpkins',
      '👻 Ghosts',
      '🧙‍♀️ Witches',
      '👹 Monsters',
      '🎮 Spooky Game',
    ];

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
          // Tab 5: Interactive Halloween Game
          HalloweenGameTab(),
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

// Halloween Game Tab with Interactive Elements
class HalloweenGameTab extends StatefulWidget {
  @override
  _HalloweenGameTabState createState() => _HalloweenGameTabState();
}

class _HalloweenGameTabState extends State<HalloweenGameTab>
    with TickerProviderStateMixin {
  late List<AnimationController> _animationControllers;
  late List<Animation<Offset>> _animations;
  late Timer _gameTimer;

  bool _gameStarted = false;
  bool _gameWon = false;
  int _score = 0;

  final List<GameItem> _gameItems = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    _gameItems.clear();
    _animationControllers = [];
    _animations = [];

    // Create spooky game items
    final items = [
      GameItem('👻', 'Ghost', isWinningItem: false, isTrap: true),
      GameItem('🎃', 'Pumpkin', isWinningItem: false, isTrap: false),
      GameItem('🧙‍♀️', 'Witch', isWinningItem: false, isTrap: true),
      GameItem('🦇', 'Bat', isWinningItem: false, isTrap: false),
      GameItem('🕷️', 'Spider', isWinningItem: false, isTrap: true),
      GameItem('💀', 'Skull', isWinningItem: false, isTrap: true),
      GameItem('🕸️', 'Web', isWinningItem: false, isTrap: false),
      GameItem(
        '🌙',
        'Moon',
        isWinningItem: true,
        isTrap: false,
      ), // Winning item
    ];

    _gameItems.addAll(items);

    // Create animation controllers for each item
    for (int i = 0; i < _gameItems.length; i++) {
      final controller = AnimationController(
        duration: Duration(seconds: 3 + _random.nextInt(4)),
        vsync: this,
      );

      final animation = Tween<Offset>(
        begin: Offset(
          _random.nextDouble() * 2 - 1,
          _random.nextDouble() * 2 - 1,
        ),
        end: Offset(_random.nextDouble() * 2 - 1, _random.nextDouble() * 2 - 1),
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

      _animationControllers.add(controller);
      _animations.add(animation);

      controller.repeat(reverse: true);
    }

    // Start background music timer
    _startBackgroundEffects();
  }

  void _startBackgroundEffects() {
    _gameTimer = Timer.periodic(Duration(seconds: 8), (timer) {
      if (_gameStarted && !_gameWon) {
        _playBackgroundSound();
      }
    });
  }

  void _playBackgroundSound() {
    // Play spooky background sounds using SystemSound
    SystemSound.play(SystemSoundType.click);
  }

  void _playJumpScareSound() {
    // Play jump scare sound
    SystemSound.play(SystemSoundType.alert);
    HapticFeedback.heavyImpact();
  }

  void _playSuccessSound() {
    // Play success sound
    SystemSound.play(SystemSoundType.click);
    HapticFeedback.lightImpact();
  }

  void _onItemTapped(int index) {
    if (_gameWon) return;

    final item = _gameItems[index];

    if (item.isWinningItem) {
      // Player found the correct item!
      _playSuccessSound();
      setState(() {
        _gameWon = true;
        _score += 100;
      });
      _showWinDialog();
    } else if (item.isTrap) {
      // Player hit a trap!
      _playJumpScareSound();
      _showTrapDialog(item.emoji);
      setState(() {
        _score = (_score - 10).clamp(0, 1000);
      });
    } else {
      // Regular item
      SystemSound.play(SystemSoundType.click);
      setState(() {
        _score += 5;
      });
    }
  }

  void _showWinDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.orange[50],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('🎉 You Found It! 🎉')],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '🌙 Congratulations! 🌙',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'You found the magical moon among all the spooky creatures!',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Final Score: $_score points',
              style: TextStyle(fontSize: 18, color: Colors.orange[800]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: _resetGame, child: Text('Play Again 🎮')),
        ],
      ),
    );
  }

  void _showTrapDialog(String emoji) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.red[50],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('💀 TRAP! 💀')],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              emoji,
              style: TextStyle(fontSize: 60),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Boo! You hit a trap!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              'Lost 10 points! Keep looking for the magical moon! 🌙',
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Continue 💪'),
          ),
        ],
      ),
    );
  }

  void _resetGame() {
    Navigator.of(context).pop(); // Close dialog

    for (var controller in _animationControllers) {
      controller.dispose();
    }
    _gameTimer.cancel();

    setState(() {
      _gameWon = false;
      _score = 0;
    });

    _initializeGame();
  }

  void _startGame() {
    setState(() {
      _gameStarted = true;
    });

    // Shuffle items for new game
    _gameItems.shuffle();
  }

  @override
  void dispose() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    _gameTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.grey[900]!],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Game Header
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    '🎮 Spooky Halloween Hunt 🎮',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  if (!_gameStarted)
                    Column(
                      children: [
                        Text(
                          'Find the magical moon 🌙 among the spooky creatures!',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Watch out for traps! 💀',
                          style: TextStyle(
                            color: Colors.red[300],
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _startGame,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.black,
                          ),
                          child: Text('Start Hunt! 🎯'),
                        ),
                      ],
                    )
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Score: $_score',
                          style: TextStyle(color: Colors.orange, fontSize: 18),
                        ),
                        if (_gameWon)
                          Text(
                            '🎉 Winner! 🎉',
                            style: TextStyle(color: Colors.green, fontSize: 18),
                          ),
                        ElevatedButton(
                          onPressed: _resetGame,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            foregroundColor: Colors.white,
                          ),
                          child: Text('Reset 🔄'),
                        ),
                      ],
                    ),
                ],
              ),
            ),

            // Game Area
            if (_gameStarted)
              Expanded(
                child: Stack(
                  children: List.generate(_gameItems.length, (index) {
                    return AnimatedBuilder(
                      animation: _animations[index],
                      builder: (context, child) {
                        return Positioned(
                          left:
                              (MediaQuery.of(context).size.width / 2) +
                              _animations[index].value.dx * 150,
                          top:
                              (MediaQuery.of(context).size.height / 2) +
                              _animations[index].value.dy * 200,
                          child: GestureDetector(
                            onTap: () => _onItemTapped(index),
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: _gameItems[index].isTrap
                                    ? Colors.red.withValues(alpha: 0.1)
                                    : _gameItems[index].isWinningItem
                                    ? Colors.yellow.withValues(alpha: 0.3)
                                    : Colors.blue.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: _gameItems[index].isWinningItem
                                      ? Colors.yellow
                                      : Colors.white.withValues(alpha: 0.3),
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.3),
                                    blurRadius: 8,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  _gameItems[index].emoji,
                                  style: TextStyle(fontSize: 32),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
              )
            else
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('🌙', style: TextStyle(fontSize: 100)),
                      SizedBox(height: 20),
                      Text(
                        'Ready for a spooky adventure?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Game Item Model
class GameItem {
  final String emoji;
  final String name;
  final bool isWinningItem;
  final bool isTrap;

  GameItem(
    this.emoji,
    this.name, {
    required this.isWinningItem,
    required this.isTrap,
  });
}
