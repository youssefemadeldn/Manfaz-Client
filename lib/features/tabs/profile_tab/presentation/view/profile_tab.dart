import 'package:flutter/material.dart';
import 'package:manfaz/core/theme/app_colors.dart';
import 'package:manfaz/core/theme/app_styles.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey[600],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // User Details Fields
            buildField("User Name", "John Doe"),
            buildField("Phone Number", "+1 123 2456 789"),
            buildField("Country", "United States"),
            buildField("Street Address", "123 Main Street"),
            // buildField("City", "Los Angeles"),
            // buildField("State", "California"),
            // buildField("ZIP/Postal Code", "90001"),
            buildField("Language", "English"),
            buildField("Gender", "Male"),
            SizedBox(height: 20),
            // Save Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                onPressed: () {
                  // Button pressed action
                },
                child: Text("Save Profile",
                    style: AppStyles.buttonText.copyWith(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to Build Field
  Widget buildField(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[100],
            ),
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditMode = false; // Toggle between display and edit modes

  // Mock data for display state
  String userName = "John Doe";
  String phoneNumber = "+1 123 2456 789";
  String country = "United States";
  String streetAddress = "123 Main Street";
  String city = "Los Angeles";
  String state = "California";
  String zipCode = "90001";
  String language = "English";
  String gender = "Male";

  // Controllers for edit state
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController streetAddressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize controllers with existing data
    userNameController.text = userName;
    phoneController.text = phoneNumber;
    streetAddressController.text = streetAddress;
    cityController.text = city;
    stateController.text = state;
    zipCodeController.text = zipCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? "Edit Profile" : "Profile"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back action
            Navigator.pop(context);
          },
        ),
        actions: [
          if (!isEditMode)
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  isEditMode = true;
                });
              },
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.grey[600],
                      ),
                    ),
                    if (isEditMode)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // User Details
              isEditMode
                  ? buildEditableField("User Name", userNameController)
                  : buildDisplayField("User Name", userName),
              isEditMode
                  ? buildEditableField("Phone Number", phoneController)
                  : buildDisplayField("Phone Number", phoneNumber),
              buildDisplayField("Country", country),
              isEditMode
                  ? buildEditableField("Street Address", streetAddressController)
                  : buildDisplayField("Street Address", streetAddress),
              isEditMode
                  ? buildEditableField("City", cityController)
                  : buildDisplayField("City", city),
              isEditMode
                  ? buildEditableField("State", stateController)
                  : buildDisplayField("State", state),
              isEditMode
                  ? buildEditableField("ZIP/Postal Code", zipCodeController)
                  : buildDisplayField("ZIP/Postal Code", zipCode),
              isEditMode
                  ? buildDropdownField("Language", language, ["English", "Spanish", "French"])
                  : buildDisplayField("Language", language),
              isEditMode
                  ? buildDropdownField("Gender", gender, ["Male", "Female", "Other"])
                  : buildDisplayField("Gender", gender),
              SizedBox(height: 20),
              // Save or Edit Button
              if (isEditMode)
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    ),
                    onPressed: () {
                      setState(() {
                        // Save data
                        userName = userNameController.text;
                        phoneNumber = phoneController.text;
                        streetAddress = streetAddressController.text;
                        city = cityController.text;
                        state = stateController.text;
                        zipCode = zipCodeController.text;

                        isEditMode = false;
                      });
                    },
                    child: Text("Save Profile"),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Display field for static data
  Widget buildDisplayField(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  // Editable field for input
  Widget buildEditableField(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 4),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
        ],
      ),
    );
  }

  // Dropdown field for editable state
  Widget buildDropdownField(String title, String currentValue, List<String> options) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 4),
          DropdownButtonFormField<String>(
            value: currentValue,
            items: options.map((option) {
              return DropdownMenuItem(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                if (title == "Language") {
                  language = value!;
                } else if (title == "Gender") {
                  gender = value!;
                }
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
        ],
      ),
    );
  }
}

*/
