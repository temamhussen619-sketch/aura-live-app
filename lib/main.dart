import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const AuraLiveApp());
}

class AuraLiveApp extends StatelessWidget {
  const AuraLiveApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aura Live',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFFFD700),
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFFD700),
          secondary: Color(0xFFFF4081),
          surface: Color(0xFF1E1E1E),
        ),
        fontFamily: 'Roboto',
      ),
      home: const LiveRoomScreen(),
    );
  }
}

class LiveRoomScreen extends StatefulWidget {
  const LiveRoomScreen({Key? key}) : super(key: key);

  @override
  State<LiveRoomScreen> createState() => _LiveRoomScreenState();
}

class _LiveRoomScreenState extends State<LiveRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2C2C2C), Color(0xFF121212)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 20,
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Temam...', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        Text('ID: 27759629', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildToolIcon(Icons.admin_panel_settings, 'Admins', () {}),
                _buildToolIcon(Icons.card_giftcard, 'Store', () {
                  _showStoreBottomSheet(context);
                }),
                _buildToolIcon(Icons.diamond, 'VIP', () {
                  _showVipBottomSheet(context);
                }),
                _buildToolIcon(Icons.handyman, 'Host Tools', () {
                  _showHostToolsBottomSheet(context);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolIcon(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.amber, width: 1),
            ),
            child: Icon(icon, color: Colors.amber, size: 24),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  void _showHostToolsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E1E1E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Host Tools', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              ListTile(
                leading: Icon(Icons.security, color: Colors.amber),
                title: Text('Screen Recording Restriction', style: TextStyle(color: Colors.white)),
                subtitle: Text('Prevent audience from recording screen', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ),
              ListTile(
                leading: Icon(Icons.info, color: Colors.amber),
                title: Text('Live Stream Introduction', style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                leading: Icon(Icons.face, color: Colors.amber),
                title: Text('Beauty & Material Filters', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showStoreBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E1E1E),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: const Text('Store: Popular, Honor, Rare ID, Ride, Avatar Frames', style: TextStyle(color: Colors.white, fontSize: 16)),
        );
      },
    );
  }

  void _showVipBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E1E1E),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: const Text('VIP Tiers: Normal VIP, Super VIP, Diamond VIP, SVIP', style: TextStyle(color: Colors.white, fontSize: 16)),
        );
      },
    );
  }
}
