import 'package:flutter/material.dart';

void main() {
  runApp(const Assign1App());
}

class Assign1App extends StatelessWidget {
  const Assign1App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 2 - Three Tabs Shopping',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const ShopHomePage(),
    );
  }
}

class ShopHomePage extends StatefulWidget {
  const ShopHomePage({Key? key}) : super(key: key);

  @override
  State<ShopHomePage> createState() => _ShopHomePageState();
}

class _ShopHomePageState extends State<ShopHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Shared cart counts for two products
  int suitCount = 0;
  int shoeCount = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int get totalItems => suitCount + shoeCount;

  void addSuit() {
    setState(() {
      suitCount += 1;
    });
  }

  void addShoe() {
    setState(() {
      shoeCount += 1;
    });
  }

  void deleteAll() {
    setState(() {
      suitCount = 0;
      shoeCount = 0;
    });
  }

  Widget cartTabWithBadge() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 6),
          child: Text('Cart', style: TextStyle(fontSize: 16)),
        ),
        if (totalItems > 0)
          Positioned(
            right: -6,
            top: -6,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
              child: Center(
                child: Text(
                  '$totalItems',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Three Tab Shopping'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.purpleAccent,
              tabs: [
                const Tab(text: 'Suit'),
                const Tab(text: 'Shoe'),
                Tab(child: cartTabWithBadge()),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ProductPage(
            title: 'Suit',
            price: 820,
            imageUrl:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Black_suit_icon.png/240px-Black_suit_icon.png',
            onAdd: addSuit,
          ),
          ProductPage(
            title: 'Shoe',
            price: 1290,
            imageUrl:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/High_heels_icon.png/240px-High_heels_icon.png',
            onAdd: addShoe,
          ),
          CartPage(
            suitCount: suitCount,
            shoeCount: shoeCount,
            suitPrice: 820,
            shoePrice: 1290,
            onDeleteAll: deleteAll,
          ),
        ],
      ),
    );
  }
}

class ProductPage extends StatelessWidget {
  final String title;
  final int price;
  final String imageUrl;
  final VoidCallback onAdd;

  const ProductPage({
    Key? key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF9EEF5),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$title $price baht', style: const TextStyle(fontSize: 28)),
              const SizedBox(height: 16),
              // Network image used to avoid asset setup. Replace with local asset if desired.
              Image.network(imageUrl, height: 180, fit: BoxFit.contain),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onAdd,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'ADD TO CART',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final int suitCount;
  final int shoeCount;
  final int suitPrice;
  final int shoePrice;
  final VoidCallback onDeleteAll;

  const CartPage({
    Key? key,
    required this.suitCount,
    required this.shoeCount,
    required this.suitPrice,
    required this.shoePrice,
    required this.onDeleteAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final suitTotal = suitCount * suitPrice;
    final shoeTotal = shoeCount * shoePrice;
    final total = suitTotal + shoeTotal;

    return Container(
      color: const Color(0xFFF9EEF5),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Suit $suitPrice x $suitCount = $suitTotal baht',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 8),
              Text(
                'Shoe $shoePrice x $shoeCount = $shoeTotal baht',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 12),
              Text('Total = $total baht', style: const TextStyle(fontSize: 22)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onDeleteAll,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('DELETE ALL', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
