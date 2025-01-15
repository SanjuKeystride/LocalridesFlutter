import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  final List<String> imageUrls = [
    // Replace these with your actual image URLs
    'https://plus.unsplash.com/premium_photo-1661902088031-65384085a4c4?q=80&w=2971&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1487113991643-86bfb4c9de2d?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1682125270920-39b89bb20867?q=80&w=3000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1509378817418-b70cdf9bd38b?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1535031936019-9d7b045a0bde?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: Icon(Icons.star_border)),
          IconButton(onPressed: () {}, icon: Icon(Icons.flag)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AspectRatio(
                aspectRatio: 4 / 3, // Adjust based on desired aspect ratio
                child: Image.network(
                  imageUrls[0],
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    return progress == null
                        ? child
                        : Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1 / 1, // Square image
                      child: Image.network(
                        imageUrls[1],
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) {
                          return progress == null
                              ? child
                              : Center(child: CircularProgressIndicator());
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.network(
                        imageUrls[2],
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) {
                          return progress == null
                              ? child
                              : Center(child: CircularProgressIndicator());
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  imageUrls[3],
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    return progress == null
                        ? child
                        : Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              SizedBox(height: 8),
              AspectRatio(
                aspectRatio: 3 / 2,
                child: Image.network(
                  imageUrls[4],
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    return progress == null
                        ? child
                        : Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


