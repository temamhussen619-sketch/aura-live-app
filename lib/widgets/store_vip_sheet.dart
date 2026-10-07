import 'package:flutter/material.dart';

// 1. Store Bottom Sheet (ሱቅ እና ፌቸሮች)
class StoreBottomSheet extends StatelessWidget {
  const StoreBottomSheet({Key? key}) : super(key: key);

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
                'Store & Items',
                style: TextStyle(color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.close, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text('Popular', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
              Text('Honor', style: TextStyle(color: Colors.grey)),
              Text('Rare ID', style: TextStyle(color: Colors.grey)),
              Text('Ride', style: TextStyle(color: Colors.grey)),
              Text('Frames', style: TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 20),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2.5,
            children: [
              _buildStoreItem('Golden Crown', '999 Coins'),
              _buildStoreItem('Super Car', '4999 Coins'),
              _buildStoreItem('Magic Wand', '199 Coins'),
              _buildStoreItem('VIP Wings', '1999 Coins'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStoreItem(String name, String price) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF21262D),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.card_giftcard, color: Colors.amber, size: 28),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(price, style: const TextStyle(color: Colors.amber, fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}

// 2. VIP Tiers Bottom Sheet (የቪአይፒ ደረጃዎች)
class VipBottomSheet extends StatelessWidget {
  const VipBottomSheet({Key? key}) : super(key: key);

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
                'VIP Privileges',
                style: TextStyle(color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.close, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 16),
          _buildVipTile('Normal VIP', 'Basic badges and entry effects', Colors.blueGrey),
          _buildVipTile('Super VIP', 'Exclusive rides and special profile frames', Colors.purple),
          _buildVipTile('Diamond VIP', 'Advanced protection and custom ID style', Colors.amber),
          _buildVipTile('SVIP (Supreme)', 'All features unlocked with ultimate gold theme', Colors.redAccent),
        ],
      ),
    );
  }

  Widget _buildVipTile(String title, String subtitle, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF21262D),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: ListTile(
        leading: Icon(Icons.diamond, color: color, size: 28),
        title: Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 14),
      ),
    );
  }
}
