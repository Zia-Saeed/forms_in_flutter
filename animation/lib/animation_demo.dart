import 'package:animation/implicit_transition.dart';
import 'package:flutter/material.dart';

class CategoryMeals {
  const CategoryMeals({
    required this.id,
    required this.title,
    this.color = Colors.yellow,
  });
  final String id;
  final String title;
  final Color color;
}

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({super.key});
  @override
  State<StatefulWidget> createState() {
    return _AnimationDemoState();
  }
}

class _AnimationDemoState extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  final _card_list = const [
    CategoryMeals(
      id: 'c1',
      title: 'Italian',
      color: Colors.purple,
    ),
    CategoryMeals(
      id: 'c2',
      title: 'Quick & Easy',
      color: Colors.red,
    ),
    CategoryMeals(
      id: 'c3',
      title: 'Hamburgers',
      color: Colors.orange,
    ),
    CategoryMeals(
      id: 'c4',
      title: 'German',
      color: Colors.amber,
    ),
    CategoryMeals(
      id: 'c5',
      title: 'Light & Lovely',
      color: Colors.blue,
    ),
    CategoryMeals(
      id: 'c6',
      title: 'Exotic',
      color: Colors.green,
    ),
    CategoryMeals(
      id: 'c7',
      title: 'Breakfast',
      color: Colors.lightBlue,
    ),
    CategoryMeals(
      id: 'c8',
      title: 'Asian',
      color: Colors.lightGreen,
    ),
    CategoryMeals(
      id: 'c9',
      title: 'French',
      color: Colors.pink,
    ),
    CategoryMeals(
      id: 'c10',
      title: 'Summer',
      color: Colors.teal,
    ),
  ];

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
      lowerBound: 0,
      upperBound: 1,
    );
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        actions: [
          IconButton(
            onPressed: () {
              print("tap is running");
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ImpliAnimation(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: animationController,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            for (final cat in _card_list)
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ImpliAnimation(),
                    ),
                  );
                },
                child: Card(
                  color: cat.color,
                  child: Text(
                    cat.title,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
          ],
        ),
        builder: (context, child) => SlideTransition(
          position: Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0))
              .animate(
            CurvedAnimation(
              parent: animationController,
              curve: Curves.easeInCirc,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
