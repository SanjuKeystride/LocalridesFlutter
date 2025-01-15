import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.location_on, color: Colors.grey),
            SizedBox(width: 5),
            Text(
              "Now · 200 W 47th St",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.grey),
          ],
        ),
        actions: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightGreenAccent.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0,
            ),
            onPressed: () {},
            icon: Icon(Icons.add, color: Colors.black),
            label: Text(
              "New",
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Search Bar
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search for anything",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                // Filter Button
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade200,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.filter_alt, color: Colors.black),
                    onPressed: () {
                      // Handle filter button tap
                      print("Filter button tapped");
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryChip(label: "Water sports"),
                  SizedBox(width: 10,),
                  CategoryChip(label: "Bicycles"),
                  SizedBox(width: 10,),
                  CategoryChip(label: "Vehicles"),
                  SizedBox(width: 10,),
                  CategoryChip(label: "More"),
                  SizedBox(width: 10,),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView(
              children: [
                RentalCard(
                  title: "Bicycle - Fixie",
                  price: "\$12 USD per day",
                  rating: 4.9,
                  distance: "1.4 miles",
                  imageUrl: "https://hips.hearstapps.com/hmg-prod/images/ride-mountain-bikes-raab-660c3f3e9a17c.jpg?crop=1.00xw:0.846xh;0,0.0337xh&resize=2048:*",
                  location: "United States", // Placeholder image
                ),
                RentalCard(
                  title: "Mountain Bike",
                  price: "\$22 USD per day",
                  rating: 4.6,
                  distance: "1.4 miles",
                  imageUrl: "https://www.firefoxbikes.com/dw/image/v2/BGQH_PRD/on/demandware.static/-/Sites-HeroFirefox-Library/default/dwd7c0a487/blog_images/mtb_Blog/MTB-BLOG-4.jpg?sh=659&sfrm=jpg&q=70",
                  location: "United States", // Placeholder image

                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[200], // Light grey background
        currentIndex: _currentIndex, // Currently selected tab
        selectedItemColor: Colors.black, // Highlight color for selected tab
        unselectedItemColor: Colors.grey, // Subtle color for unselected tabs
        onTap: _onTabTapped, // Update index on tab tap
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: "Rentals"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Inbox"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;

  const CategoryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.grey, // Matches the text color in your screenshot
          fontSize: 14.0, // Adjust the font size as needed
        ),
      ),
    );
  }
}



class RentalCard extends StatelessWidget {
  final String title;
  final String price;
  final double rating;
  final String distance;
  final String location;
  final String imageUrl;

  const RentalCard({
    required this.title,
    required this.price,
    required this.rating,
    required this.distance,
    required this.location,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 2, // Add a subtle shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with rounded corners
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Stack(
              children: [
                Image.network(
                  imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.star_border),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and rating row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(
                          rating.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 4),
                // Price
                Text(
                  price,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                SizedBox(height: 8),
                // Location and distance row
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(location, style: TextStyle(color: Colors.grey[600])),
                    SizedBox(width: 16),
                    Icon(Icons.directions_walk, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(distance, style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


