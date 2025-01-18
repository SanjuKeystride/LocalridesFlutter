import 'package:flutter/material.dart';
import 'package:newtestproject/Screens/review.dart';

class BookingConfirmationScreen extends StatefulWidget {
  @override
  _BookingConfirmationScreenState createState() =>
      _BookingConfirmationScreenState();
}

class _BookingConfirmationScreenState
    extends State<BookingConfirmationScreen> {
  int shippingOption = 1; // 0: Pickup, 1: Shipping
  String selectedDates = "Wed, 15 March - Tue, 21 March";

  void _editDates() async {
    String? newDates = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Dates"),
          content: TextFormField(
            initialValue: selectedDates,
            decoration: InputDecoration(labelText: "Enter new dates"),
            onChanged: (value) {
              selectedDates = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, null),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, selectedDates),
              child: Text("Save"),
            ),
          ],
        );
      },
    );

    if (newDates != null && newDates.isNotEmpty) {
      setState(() {
        selectedDates = newDates;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking confirmation"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Rental Section
              _buildSectionTitle("Your rental"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'https://plus.unsplash.com/premium_photo-1661902088031-65384085a4c4?q=80&w=2971&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mountain Bike",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text("200 W 47th St, NY • 1.4 miles"),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            SizedBox(width: 4),
                            Text("4.9 (482 reviews)"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSectionTitle("Dates"),
                  TextButton(
                    onPressed: _editDates,
                    child: Text(
                      "Edit",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
              Text(selectedDates),
              Divider(thickness: 1, height: 32),

              // Shipping Options
              _buildSectionTitle("Shipping options"),
              ListTile(
                title: Text("I will pick up the item"),
                leading: Radio(
                  value: 0,
                  groupValue: shippingOption,
                  onChanged: (value) {
                    setState(() {
                      shippingOption = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("I want the item shipped"),
                leading: Radio(
                  value: 1,
                  groupValue: shippingOption,
                  onChanged: (value) {
                    setState(() {
                      shippingOption = value!;
                    });
                  },
                ),
              ),
              if (shippingOption == 1)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Review()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Add delivery address",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              Divider(thickness: 1, height: 32),

              // Total Section
              _buildSectionTitle("Your total"),
              _buildRow("Discount", "- \$29"),
              _buildRow("Subtotal", "\$148"),
              _buildRow("Service fee", "\$5"),
              Divider(thickness: 1, height: 32),

              // Payment Section
              _buildSectionTitle("Pay with"),
              ListTile(
                leading: Icon(Icons.credit_card, size: 28),
                title: Text("**** 4812"),
                trailing: Icon(Icons.chevron_right),
              ),
              Divider(thickness: 1, height: 32),

              // Required Section
              _buildSectionTitle("Required before booking"),
              _buildRequirementItem(
                Icons.phone,
                "Add a phone number",
                "Required to confirm your booking.",
                    () {},
              ),
              _buildRequirementItem(
                Icons.badge,
                "Validate your ID",
                "Required to confirm your booking.",
                    () {},
              ),
              Divider(thickness: 1, height: 32),

              // Rules Section
              _buildSectionTitle("Rules"),
              Text(
                "Please read and accept the rules before proceeding with your booking.",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text("Confirm and pay"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildRequirementItem(
      IconData icon, String title, String subtitle, VoidCallback onPressed) {
    return ListTile(
      leading: Icon(icon, size: 28),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightGreen,
        ),
        child: Text("Add"),
      ),
    );
  }
}


