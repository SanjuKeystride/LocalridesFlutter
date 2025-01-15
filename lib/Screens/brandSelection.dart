import 'package:flutter/material.dart';
import 'package:newtestproject/Screens/galleryScreen.dart';

class BrandSelector extends StatefulWidget {
  @override
  _BrandSelectorState createState() => _BrandSelectorState();
}

class _BrandSelectorState extends State<BrandSelector> {
  // List of all brands
  final List<String> brands = [
    "Dell",
    "Apple",
    "EcoWave",
    "TechNest",
    "FlavorFusion",
    "GadgetGuru",
    "StyleSphere",
    "FitLife",
    "HomeHaven",
    "PetPalace",
    "TravelTrove",
    "CleanGreen",
    "ArtisanCrafts",
    "SmartSips",
  ];

  // List of selected brands
  List<String> selectedBrands = ["Dell", "Apple", "EcoWave"];

  // Function to toggle selection
  void toggleSelection(String brand) {
    setState(() {
      if (selectedBrands.contains(brand)) {
        selectedBrands.remove(brand);
      } else {
        selectedBrands.add(brand);
      }
    });
  }

  // Function to show bottom sheet
  void showBrandSelectorBottomSheet(BuildContext context) {
    double safeAreaHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double sheetHeight = safeAreaHeight * 0.8; // Adjust the multiplier for the desired height

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: sheetHeight, // Set the height of the bottom sheet
            child: Column(
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select or Search for Brands",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Search bar
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search for brands",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (query) {
                    // Optional: implement search filtering if needed
                  },
                ),
                SizedBox(height: 10),
                // Scrollable list of brands inside ListView
                Expanded(
                  child: ListView.builder(
                    itemCount: brands.length + 1, // Adding one for the Done button
                    itemBuilder: (context, index) {
                      if (index == brands.length) {
                        // Done Button at the end
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FilledButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> GalleryScreen()));
                            },
                            child: Text("Done"),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 48),
                              backgroundColor: Colors.lightGreenAccent,
                            ),
                          ),
                        );
                      } else {
                        final brand = brands[index];
                        return CheckboxListTile(
                          title: Text(brand),
                          value: selectedBrands.contains(brand),
                          onChanged: (bool? value) {
                            toggleSelection(brand);
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // Open the bottom sheet immediately after the widget is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showBrandSelectorBottomSheet(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container()), // Empty container as the screen will be replaced by the bottom sheet
    );
  }
}
