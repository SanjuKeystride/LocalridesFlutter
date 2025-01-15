import 'package:flutter/material.dart';
import 'package:newtestproject/Screens/brandSelection.dart';



class filter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Filter Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                isScrollControlled: true,
                builder: (context) => FilterContent(),
              );
            },
            child: Text('Show Filters'),
          ),
        ),
      ),
    );
  }
}

class FilterContent extends StatefulWidget {
  @override
  _FilterContentState createState() => _FilterContentState();
}

class _FilterContentState extends State<FilterContent> {
  String selectedSortOption = "Price low to high";
  double radius = 2.0;
  List<String> selectedBrands = ["Dell", "Apple", "Brand name here"];
  bool isAvailableToday = true;
  bool isDeliveryAvailable = false;

  final List<String> sortOptions = [
    "Price low to high",
    "Price high to low",
    "Best reviewed"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Filters",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Sort By Section
          Text(
            "Sort by",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "Choose how you want items to be displayed.",
            style: TextStyle(color: Colors.grey),
          ),
          Column(
            children: sortOptions.map((option) {
              return RadioListTile(
                title: Text(option),
                value: option,
                groupValue: selectedSortOption,
                onChanged: (value) {
                  setState(() {
                    selectedSortOption = value as String;
                  });
                },
              );
            }).toList(),
          ),
          Divider(),

          // Distance Away Section
          Text(
            "Distance away",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "Set the maximum distance to find items near you.",
            style: TextStyle(color: Colors.grey),
          ),
          Slider(
            value: radius,
            min: 1,
            max: 10,
            divisions: 9,
            label: "${radius.toInt()} miles",
            onChanged: (value) {
              setState(() {
                radius = value;
              });
            },
          ),
          Divider(),

          // Brands Section
          Text(
            "Brands",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "Filter items by selecting specific brands.",
            style: TextStyle(color: Colors.grey),
          ),
          Wrap(
            spacing: 8,
            children: selectedBrands.map((brand) {
              return Chip(
                label: Text(brand),
                onDeleted: () {
                  setState(() {
                    selectedBrands.remove(brand);
                  });
                },
              );
            }).toList(),
          ),
          Divider(),

          // Other Options
          Text(
            "Other options",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "Customize your search with additional filters.",
            style: TextStyle(color: Colors.grey),
          ),
          SwitchListTile(
            title: Text("Available today"),
            subtitle: Text("Only show items available for immediate pickup."),
            value: isAvailableToday,
            onChanged: (value) {
              setState(() {
                isAvailableToday = value;
              });
            },
          ),
          SwitchListTile(
            title: Text("Delivery available"),
            subtitle: Text("Include items that can be delivered to you."),
            value: isDeliveryAvailable,
            onChanged: (value) {
              setState(() {
                isDeliveryAvailable = value;
              });
            },
          ),
          SizedBox(height: 16),

          // Footer Buttons
          Row(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    // Reset all filters
                    selectedSortOption = "Price low to high";
                    radius = 2.0;
                    selectedBrands = [];
                    isAvailableToday = false;
                    isDeliveryAvailable = false;
                  });
                },
                child: Text(
                  "Clear all",
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Handle apply action
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> BrandSelector()));
                  print("Filters applied.");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Show 127 items"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}