import 'package:flutter/material.dart';

class Week6Ex5 extends StatelessWidget {
  const Week6Ex5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cooking Recipes',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: false,

        backgroundColor: const Color.fromARGB(255, 61, 43, 128),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Papaya Salad',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.orange,
                      border: Border.all(color: Colors.black),
                      // borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Thai green papaya salad (Som Tum) features shredded green papaya as the base, pounded with garlic, Thai bird's eye chilies, long beans, cherry tomatoes, peanuts, and dried shrimp (optional) in a mortar and pestle. The dressing is a tangy and savory mix of lime juice, fish sauce, palm sugar, and tamarind paste, creating a sweet, sour, salty, and spicy flavor profile.",
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 20),

                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Image.asset('assets/images/salad.jpg'),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 24),
                          Icon(Icons.star, color: Colors.orange, size: 24),
                          Icon(Icons.star, color: Colors.orange, size: 24),
                          Icon(Icons.star, color: Colors.orange, size: 24),
                          Icon(Icons.star_half, color: Colors.orange, size: 24),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("3128 reviews")],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.schedule, size: 30),
                              Text('PREP :'),
                              Text("5 mins"),
                            ],
                          ),

                          Column(
                            children: [
                              Icon(Icons.timer, size: 30),
                              Text('COOK :'),
                              Text("10 mins"),
                            ],
                          ),

                          Column(
                            children: [
                              Icon(Icons.dinner_dining, size: 30),
                              Text('FEEDS :'),
                              Text("1-3"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
