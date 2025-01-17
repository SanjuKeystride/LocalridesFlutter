import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Profile',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: () {
              // Add share functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.star_border, color: Colors.black),
            onPressed: () {
              // Add favorite functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.flag, color: Colors.black),
            onPressed: () {
              // Add flag/report functionality here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Custom Tab Bar Section
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey[200], // Background color for the tab container
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                _buildTab('Profile', 0),
                _buildTab('Items', 1),
                _buildTab('Reviews', 2),
              ],
            ),
          ),

          // Tab Content Section
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    bool isSelected = _selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index; // Update selected tab index
          });
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFFDFF6CC) : Colors.transparent, // Highlight for selected tab
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, // Bold text for selected tab
              color: isSelected ? Colors.black : Colors.grey, // Change text color based on selection
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedIndex) {
      case 0: // Profile Tab Content
        return _buildProfileContent();
      case 1: // Items Tab Content
        return _buildItemsContent();
      case 2: // Reviews Tab Content
        return _buildReviewsContent();
      default:
        return Center(child: Text('Content Not Found'));
    }
  }

  Widget _buildProfileContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1509378817418-b70cdf9bd38b?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Replace with actual image URL
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'John Doe',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Color(0xFFEFEAF5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.verified,
                                  size: 14,
                                  color: Colors.purple,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Verified user',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.purple,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 20),
                          SizedBox(width: 4),
                          Text(
                            '4.9 (482 reviews)',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Exceptuer sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(thickness: 1, color: Colors.grey[300]),

            // Location and Availability Section
            Row(
              children: [
                Icon(Icons.location_on, size: 20, color: Colors.grey),
                SizedBox(width: 8),
                Text('New York', style: TextStyle(fontSize: 14)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.home, size: 20, color: Colors.grey),
                SizedBox(width: 8),
                Text('200 W 47th St', style: TextStyle(fontSize: 14)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 20, color: Colors.grey),
                SizedBox(width: 8),
                Text('Available from Mon to Fri', style: TextStyle(fontSize: 14)),
              ],
            ),
            SizedBox(height: 20),
            Divider(thickness: 1, color: Colors.grey[300]),

            // Other Rental Information Section
            Text(
              'Other rental information',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.local_shipping, color: Colors.orange),
              title: Text(
                'This item can be shipped if the destination is within 5 miles',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.security, color: Colors.orange),
              title: Text(
                'User must be verified',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ),

            SizedBox(height: 20),
            Divider(thickness: 1, color: Colors.grey[300]),

            // Related Services Section
            Text(
              'Related services',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Exceptuer sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim.',
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 10),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.directions_bike, color: Colors.purple),
              title: Text(
                'Learn Trail Biking',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.cleaning_services, color: Colors.purple),
              title: Text(
                'How to clean a Bike',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsContent() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        _buildItemCard(
          imageUrl: 'https://images.unsplash.com/photo-1509378817418-b70cdf9bd38b?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Bicycle - Fixie',
          price: '\$12 USD per day',
          rating: 4.9,
          location: '200 W 47th St, NY',
          distance: '1.4 miles',
        ),
        _buildItemCard(
          imageUrl: 'https://images.unsplash.com/photo-1509378817418-b70cdf9bd38b?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'Mountain Bike',
          price: '\$22 USD per day',
          rating: 4.6,
          location: '200 W 47th St, NY',
          distance: '1.4 miles',
        ),
        _buildItemCard(
          imageUrl: 'https://images.unsplash.com/photo-1509378817418-b70cdf9bd38b?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          title: 'BMX',
          price: '\$11 USD per day',
          rating: 4.6,
          location: '200 W 47th St, NY',
          distance: '1.4 miles',
        ),
      ],
    );
  }

  Widget _buildItemCard({
    required String imageUrl,
    required String title,
    required String price,
    required double rating,
    required String location,
    required String distance,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Item Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imageUrl,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Favorite Star Icon
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      Icons.star_border,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: () {
                      // Add "favorite" functionality here
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            // Item Title and Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    SizedBox(width: 4),
                    Text(
                      '$rating',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 4),
            // Price
            Text(
              price,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 8),
            // Location and Distance
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    location,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.directions_walk, size: 16, color: Colors.grey[600]),
                SizedBox(width: 4),
                Text(
                  distance,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewsContent() {
    return Center(
      child: Text(
        'Reviews Content Goes Here',
        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
      ),
    );
  }
}
