import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Map<String, dynamic>> items = const [
    {
      "title": "Bicycle - Fixie",
      "price": 12,
      "unit": "USD per day",
      "location": "200 W 47th St, NY",
      "distance": 1.4,
      "rating": 4.9,
      "image":
      "https://images.unsplash.com/photo-1517694712202-14dd9538aa97?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400"
    },
    {
      "title": "Mountain Bike",
      "price": 22,
      "unit": "USD per day",
      "location": "200 W 47th St, NY",
      "distance": 1.4,
      "rating": 4.6,
      "image":
      "https://images.unsplash.com/photo-1562317867-b38e5ac64a2f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400"
    },
    {
      "title": "Fishing Rod",
      "price": 10,
      "unit": "USD per day",
      "location": "200 W 47th St, NY",
      "distance": 1.4,
      "rating": 4.9,
      "image":
      "https://images.unsplash.com/photo-1567306226416-28f0efdc88ce?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400"
    },
  ];

  List<Map<String, dynamic>> filteredItems = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    // Initialize filteredItems with all items
    filteredItems = items;
  }

  void _filterItems(String query) {
    setState(() {
      searchQuery = query;
      filteredItems = items
          .where((item) =>
          item["title"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              // Search bar
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200], // Light background color
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey, // Search icon color
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: _filterItems,
                          decoration: const InputDecoration(
                            hintText: "Search", // Placeholder text
                            border: InputBorder.none, // No underline
                          ),
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              // Cancel button
              TextButton(
                onPressed: () {
                  setState(() {
                    searchQuery = "";
                    filteredItems = items; // Reset the list
                  });
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.black, // Text color for "Cancel"
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          final item = filteredItems[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  child: Image.network(
                    item["image"],
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item["title"],
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 16.0,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                item["rating"].toString(),
                                style: const TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "\$${item['price']} ${item['unit']}",
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 16.0,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            item["location"],
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.directions_walk,
                            size: 16.0,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            "${item['distance']} miles",
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
