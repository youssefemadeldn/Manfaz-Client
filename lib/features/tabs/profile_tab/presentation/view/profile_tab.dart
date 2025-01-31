import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfileTab extends StatelessWidget {
  final Color primaryColor = Color(0xFF0068FF);

  ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            // Profile Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, color: Colors.white, size: 40),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "profile_tab.name".tr(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star_border,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Text(
                        "profile_tab.not_verified".tr(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            // Wallet Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("profile_tab.wallet".tr(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Icon(Icons.account_balance_wallet_outlined,
                          color: Colors.grey),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("profile_tab.balance".tr(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Spacer(),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () {},
                        icon: Icon(Icons.add, color: Colors.white),
                        label: Text("profile_tab.add".tr(),
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Divider(),
                  ListTile(
                    title: Text(
                      "profile_tab.delivery_balance".tr(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "profile_tab.balance".tr(),
                    ),
                    trailing: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12)),
                      child: Text("profile_tab.new".tr(),
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.directions_car, color: Colors.grey),
                    title: Text("profile_tab.orders".tr()),
                    trailing: Text("profile_tab.orders_count".tr(),
                        style: TextStyle(color: primaryColor, fontSize: 16)),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.grey),
                    title: Text("profile_tab.saved_addresses".tr()),
                    trailing: Text("profile_tab.less_than".tr(args: ['1']),
                        style: TextStyle(color: primaryColor)),
                  ),
                  ListTile(
                    leading: Icon(Icons.star_border, color: Colors.grey),
                    title: Text("profile_tab.ratings".tr()),
                    trailing: Text("profile_tab.less_than".tr(args: ['0']),
                        style: TextStyle(color: primaryColor)),
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.chat_bubble_outline, color: Colors.grey),
                    title: Text("profile_tab.user_notes".tr()),
                    trailing: Text("profile_tab.less_than".tr(args: ['0']),
                        style: TextStyle(color: primaryColor)),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.add, color: Colors.white),
                    label: Text("profile_tab.add_coupon".tr(),
                        style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 15),
                  Divider(),
                  ListTile(
                    title: Text("profile_tab.customer_support".tr()),
                    trailing: Icon(Icons.help_outline, color: Colors.grey),
                  ),
                  ListTile(
                    title: Text("profile_tab.corporate_offers".tr()),
                    trailing: Icon(Icons.business_center_outlined,
                        color: Colors.grey),
                  ),
                  ListTile(
                    title: Text("profile_tab.settings".tr()),
                    trailing: Icon(Icons.settings, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
