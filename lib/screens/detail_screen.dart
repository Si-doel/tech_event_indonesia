// ignore_for_file: unnecessary_underscores

import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> event;
  final String namaEvent;
  final String hargaEvent;

  const DetailScreen({
    super.key,
    required this.event,
    required this.namaEvent,
    required this.hargaEvent,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7FB),
        title: const Text(
          'Detail Event',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF20243A),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                event['image'] ?? '',
                height: 210,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 210,
                  color: const Color(0xFFE9E7FA),
                  child: const Center(
                    child: Icon(
                      Icons.event,
                      size: 60,
                      color: Color(0xFF6558D3),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              event['category'] ?? '-',
              style: const TextStyle(
                color: Color(0xFF6558D3),
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              namaEvent,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF20243A),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _info(Icons.calendar_month, 'Tanggal', event['date']),
                  _info(Icons.location_on, 'Lokasi', event['location']),
                  _info(Icons.payments, 'Harga', hargaEvent),
                  _info(Icons.check_circle_outline, 'Status', event['status']),
                ],
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: 'Kembali ke Daftar Event',
                type: CustomButtonType.secondary,
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _info(IconData icon, String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF6558D3)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '$label: ${value ?? '-'}',
              style: const TextStyle(fontSize: 14, color: Color(0xFF20243A)),
            ),
          ),
        ],
      ),
    );
  }
}
