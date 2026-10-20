import 'package:flutter/material.dart';

import 'custom_button.dart';

class EventCard extends StatelessWidget {
  final Map<String, dynamic> event;
  final VoidCallback onDetailPressed;

  const EventCard({
    super.key,
    required this.event,
    required this.onDetailPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isFree = event['price'] == 'Gratis';

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // THUMBNAIL
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              event['image'],
              width: double.infinity,
              height: 170,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 170,
                  color: const Color(0xFFE9E7FA),
                  child: const Icon(
                    Icons.event,
                    size: 55,
                    color: Color(0xFF6558D3),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // KATEGORI DAN HARGA
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFEDFF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        event['category'],
                        style: const TextStyle(
                          color: Color(0xFF6558D3),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const Spacer(),

                    Text(
                      event['price'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: isFree
                            ? Colors.green.shade700
                            : Colors.deepOrange.shade700,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Text(
                  event['title'],
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF20243A),
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      size: 17,
                      color: Color(0xFF77798B),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      event['date'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 7),

                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 17,
                      color: Color(0xFF77798B),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      event['location'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                Row(
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      size: 15,
                      color: Colors.green,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        event['status'],
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black54,
                        ),
                      ),
                    ),

                    CustomButton(
                      text: 'Lihat Detail',
                      type: CustomButtonType.primary,
                      onPressed: onDetailPressed,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
