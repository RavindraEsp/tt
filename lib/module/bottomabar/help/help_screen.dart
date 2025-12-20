import 'package:book_your_truck/utilities/style_utility.dart';
import 'package:book_your_truck/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  int expandedIndex = 0;

  final List<FaqItem> faqList = [
    FaqItem(
      question: "What is this app for?",
      answer:
          "This app connects individuals and businesses who need to transport goods with available truck drivers. You can easily post your shipment.",
    ),
    FaqItem(
      question: "How are the prices determined?",
      answer:
          "Prices are calculated based on distance, load weight, truck type, and current availability.",
    ),
    FaqItem(
      question: "How do I book a truck?",
      answer:
          "Simply post your shipment details, choose a suitable truck, and confirm your booking.",
    ),
    FaqItem(
      question: "How do I place an order?",
      answer:
          "After selecting a truck, review your details and proceed to place the order.",
    ),
    FaqItem(
      question: "Can I negotiate the price with the driver?",
      answer:
          "Yes, negotiation options may be available depending on the driver.",
    ),
    FaqItem(
      question: "How do I pay for the booking?",
      answer: "You can pay securely using available in-app payment methods.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: commonAppBar(title: "Help"),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          final isExpanded = expandedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                expandedIndex = isExpanded ? -1 : index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Question Row
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          faqList[index].question,
                          style: StyleUtility.manropeSemiBold16Color19191A,
                        ),
                      ),
                      AnimatedRotation(
                        turns: isExpanded ? 0.5 : 0,
                        duration: const Duration(milliseconds: 200),
                        child: const Icon(Icons.keyboard_arrow_down),
                      ),
                    ],
                  ),

                  /// Answer
                  if (isExpanded) ...[
                    const SizedBox(height: 12),
                    Text(
                      faqList[index].answer,
                      style: StyleUtility.manropeRegular14Color8D98AF,
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Model
class FaqItem {
  final String question;
  final String answer;

  FaqItem({required this.question, required this.answer});
}
