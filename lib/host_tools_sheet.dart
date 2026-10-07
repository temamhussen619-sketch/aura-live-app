import 'package:flutter/material.dart';

class HostToolsSheet extends StatelessWidget {
  const HostToolsSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // የርዕስ መስመር
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Host Tools & Features',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.close, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 20),
          
          // የሆስት መሳሪያዎች ዝርዝር
          _buildFeatureTile(
            icon: Icons.card_giftcard,
            title: 'Custom Wishlist',
            subtitle: 'Manage daily wishes and gifts',
            onTap: () {
              // የዊሽሊስት መስኮት መክፈቻ
            },
          ),
          _buildFeatureTile(
            icon: Icons.monetization_on,
            title: 'Lucky Draw & Even Split',
            subtitle: 'Coin distributions and lucky draws for audience',
            onTap: () {
              // የሉኪ ድሮው መስኮት መክፈቻ
            },
          ),
          _buildFeatureTile(
            icon: Icons.security,
            title: 'Screen Recording Restriction',
            subtitle: 'Protect live stream content privacy',
            onTap: () {},
          ),
          _buildFeatureTile(
            icon: Icons.face,
            title: 'Beauty & Material Filters',
            subtitle: 'Enhance live streaming visual quality',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber.withOpacity(0.3)),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.amber),
        ),
        title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
        onTap: onTap,
      ),
    );
  }
}
