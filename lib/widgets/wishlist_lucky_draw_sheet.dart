import 'package:flutter/material.dart';

// 1. Custom Wishlist Sheet
class CustomWishlistSheet extends StatelessWidget {
  const CustomWishlistSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF161B22),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Custom Wishlist',
                style: TextStyle(color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.close, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Daily wishes will be reset at 0:00 UTC+8',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildWishItem('Cheers', '0/2'),
              _buildWishItem('Mask', '0/2'),
              _buildWishItem('Fruit Plate', '0/1'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Open the wish every day', style: TextStyle(color: Colors.white)),
              Switch(value: true, onChanged: null, activeColor: Colors.amber),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6C5CE7),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {},
              child: const Text('Open the wish', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWishItem(String name, String progress) {
    return Container(
      width: 90,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF21262D),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          const Icon(Icons.card_giftcard, color: Colors.amber, size: 32),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(color: Colors.white, fontSize: 12), textAlign: TextAlign.center),
          const SizedBox(height: 4),
          Text(progress, style: const TextStyle(color: Colors.grey, fontSize: 10)),
        ],
      ),
    );
  }
}

// 2. Lucky Draw & Audience Distribution Sheet
class LuckyDrawSheet extends StatelessWidget {
  const LuckyDrawSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF161B22),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Lucky Draw',
                style: TextStyle(color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.help_outline, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Total Coins', style: TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildCoinChip('100', true),
                _buildCoinChip('1,000', false),
                _buildCoinChip('10,000', false),
                _buildCoinChip('50,000', false),
                _buildCoinChip('200,000', false),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text('Distribution amount', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _buildAudienceOption('All audiences'),
          _buildAudienceOption('Follow the host'),
          _buildAudienceOption('Join Fan Club'),
          _buildAudienceOption('Send Code'),
        ],
      ),
    );
  }

  Widget _buildCoinChip(String amount, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.amber.withOpacity(0.2) : const Color(0xFF21262D),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isSelected ? Colors.amber : Colors.grey.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.monetization_on, color: Colors.amber, size: 16),
          const SizedBox(width: 4),
          Text(amount, style: TextStyle(color: isSelected ? Colors.amber : Colors.white)),
        ],
      ),
    );
  }

  Widget _buildAudienceOption(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF21262D),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 14),
        onTap: () {},
      ),
    );
  }
}
