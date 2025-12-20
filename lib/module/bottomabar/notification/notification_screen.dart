import 'package:book_your_truck/utilities/style_utility.dart';
import 'package:book_your_truck/utilities/text_size_utility.dart';
import 'package:book_your_truck/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:commonAppBar(title: "Notification"),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: const [
            NotificationTile(
              icon: Icons.local_shipping,
              iconColor: Colors.orange,
              title: "Communication",
              description: "Call your driver directly for pickup coordination.",
              time: "2 days ago",
            ),
            NotificationTile(
              icon: Icons.location_on,
              iconColor: Colors.deepOrange,
              title: "Delivery",
              description: "Your goods have reached the destination safely",
              time: "6 days ago",
            ),
            NotificationTile(
              icon: Icons.payment,
              iconColor: Colors.blue,
              title: "Payment",
              description:
                  "Booking confirmed. Payment pending. Pay now to proceed",
              time: "9 days ago",
            ),
            NotificationTile(
              icon: Icons.track_changes,
              iconColor: Colors.green,
              title: "Tracking & Updates",
              description: "Your shipment is on the move. Track live 🚚📍",
              time: "13 days ago",
            ),
            NotificationTile(
              icon: Icons.event_available,
              iconColor: Colors.orange,
              title: "Booking Confirmed",
              description:
                  "Truck assigned. Get ready for pickup on 22 Apr, 10:00 AM",
              time: "4 days ago",
            ),
            NotificationTile(
              icon: Icons.payment,
              iconColor: Colors.blue,
              title: "Payment",
              description:
                  "Booking confirmed. Payment pending. Pay now to proceed",
              time: "9 days ago",
            ),
            NotificationTile(
              icon: Icons.local_shipping,
              iconColor: Colors.orange,
              title: "Communication",
              description: "Call your driver directly for pickup coordination.",
              time: "2 days ago",
            ),
        
            NotificationTile(
              icon: Icons.local_shipping,
              iconColor: Colors.orange,
              title: "Communication",
              description: "Call your driver directly for pickup coordination.",
              time: "2 days ago",
            ),
            NotificationTile(
              icon: Icons.location_on,
              iconColor: Colors.deepOrange,
              title: "Delivery",
              description: "Your goods have reached the destination safely",
              time: "6 days ago",
            ),
            NotificationTile(
              icon: Icons.payment,
              iconColor: Colors.blue,
              title: "Payment",
              description:
              "Booking confirmed. Payment pending. Pay now to proceed",
              time: "9 days ago",
            ),
            NotificationTile(
              icon: Icons.track_changes,
              iconColor: Colors.green,
              title: "Tracking & Updates",
              description: "Your shipment is on the move. Track live 🚚📍",
              time: "13 days ago",
            ),
            NotificationTile(
              icon: Icons.event_available,
              iconColor: Colors.orange,
              title: "Booking Confirmed",
              description:
              "Truck assigned. Get ready for pickup on 22 Apr, 10:00 AM",
              time: "4 days ago",
            ),
            NotificationTile(
              icon: Icons.payment,
              iconColor: Colors.blue,
              title: "Payment",
              description:
              "Booking confirmed. Payment pending. Pay now to proceed",
              time: "9 days ago",
            ),
            NotificationTile(
              icon: Icons.local_shipping,
              iconColor: Colors.orange,
              title: "Communication",
              description: "Call your driver directly for pickup coordination.",
              time: "2 days ago",
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;
  final String time;

  const NotificationTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor),
          ),

          const SizedBox(width: 12),

          /// Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: StyleUtility.manropeBold14Color1A2530.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(time, style: StyleUtility.manropeMedium10Color6E6E6E),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: StyleUtility.manropeMedium10Color6E6E6E.copyWith(
                    fontSize: TextSizeUtility.textSize14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
