import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: ReviewScreen(),
    );
  }
}

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  List<Map<String, dynamic>> reviews = [
    {
      'name': 'Patricia',
      'rating': 4,
      'time': DateTime.now().subtract(Duration(days: 3)), // 3 days ago
      'review': 'Exceptuer sint occaecat cupidatat non proident.',
      'image': 'https://randomuser.me/api/portraits/women/1.jpg'
    },
    {
      'name': 'Jess',
      'rating': 5,
      'time': DateTime.now().subtract(Duration(hours: 2)), // 2 hours ago
      'review': 'Exceptuer sint occaecat cupidatat non proident.',
      'image': 'https://randomuser.me/api/portraits/men/1.jpg'
    },
    {
      'name': 'Ben',
      'rating': 3,
      'time': DateTime.now().subtract(Duration(days: 7)), // 1 week ago
      'review': 'Exceptuer sint occaecat cupidatat non proident.',
      'image': 'https://randomuser.me/api/portraits/men/2.jpg'
    },
    {
      'name': 'John',
      'rating': 2,
      'time': DateTime.now().subtract(Duration(days: 1)), // 1 day ago
      'review': 'Exceptuer sint occaecat cupidatat non proident.',
      'image': 'https://randomuser.me/api/portraits/men/3.jpg'
    },
  ];

  String sortBy = 'Newest';

  void sortReviews() {
    setState(() {
      if (sortBy == 'Newest') {
        reviews.sort((a, b) => b['time'].compareTo(a['time']));
      } else if (sortBy == 'Oldest') {
        reviews.sort((a, b) => a['time'].compareTo(b['time']));
      } else if (sortBy == 'Highest Rating') {
        reviews.sort((a, b) => b['rating'].compareTo(a['rating']));
      } else if (sortBy == 'Lowest Rating') {
        reviews.sort((a, b) => a['rating'].compareTo(b['rating']));
      }
    });
  }

  String formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${difference.inDays ~/ 7} weeks ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Reviews',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'All reviews',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 18),
                        SizedBox(width: 4),
                        Text(
                          '4.9 (482 reviews)',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                DropdownButton<String>(
                  value: sortBy,
                  underline: SizedBox(),
                  items: ['Newest', 'Oldest', 'Highest Rating', 'Lowest Rating']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      sortBy = value!;
                      sortReviews();
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.grey[300],
                            backgroundImage: NetworkImage(review['image']),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      review['name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      formatTime(review['time']),
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: List.generate(
                                    review['rating'],
                                        (index) => Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  review['review'],
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.grey[300], thickness: 1),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
