import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
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
        primarySwatch: Colors.amber,
      ),
      home: const WelcomeLoginPage(),
    );
  }
}

// 1. መጀመሪያ የሚከፈተው የሎጊን ገጽ (Welcome / Login Page)
class WelcomeLoginPage extends StatefulWidget {
  const WelcomeLoginPage({Key? key}) : super(key: key);

  @override
  State<WelcomeLoginPage> createState() => _WelcomeLoginPageState();
}

class _WelcomeLoginPageState extends State<WelcomeLoginPage> {
  void _showAccountChooser(String providerName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1a1a2e),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Colors.amberAccent, width: 1),
          ),
          title: Row(
            children: [
              const Icon(Icons.account_circle, color: Colors.amberAccent),
              const SizedBox(width: 10),
              Text(
                'Choose $providerName Account',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select an account to continue with Aura Live:',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
              const SizedBox(height: 16),
              _buildAccountOption('Temam Hussein (temam@gmail.com)', context),
              const Divider(color: Colors.white24),
              _buildAccountOption('Aura Host Official (host@aura.com)', context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAccountOption(String email, BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.amber,
        child: Icon(Icons.person, color: Colors.black),
      ),
      title: Text(
        email,
        style: const TextStyle(color: Colors.white, fontSize: 13),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileSetupPage()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1a1a2e),
              Color(0xFF16213e),
              Color(0xFF0f0f1a),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.amber, Colors.orangeAccent, Colors.yellow],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.amber.withOpacity(0.6),
                                blurRadius: 12,
                                spreadRadius: 3,
                                offset: const Offset(0, 2),
                              ),
                            ],
                            border: Border.all(color: Colors.white, width: 1.5),
                          ),
                          child: const Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(Icons.monetization_on, color: Colors.white, size: 22),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Icon(Icons.star, color: Colors.yellowAccent, size: 10),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'AURA LIVE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                            Text(
                              'Party, Dollar & Shine',
                              style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(Icons.person_outline, color: Colors.white70),
                        SizedBox(width: 16),
                        Icon(Icons.headset_mic, color: Colors.white70),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber.withOpacity(0.1),
                      border: Border.all(color: Colors.amber.withOpacity(0.3), width: 1.5),
                    ),
                    child: const Icon(
                      Icons.star_rounded,
                      size: 60,
                      color: Colors.amberAccent,
                    ),
                  ),
                ),
                const Spacer(),
                _buildSocialButton(
                  icon: Icons.g_mobiledata,
                  iconColor: Colors.red,
                  text: 'Log in with Google',
                  onPressed: () => _showAccountChooser('Google'),
                ),
                const SizedBox(height: 14),
                _buildSocialButton(
                  icon: Icons.facebook,
                  iconColor: Colors.blue,
                  text: 'Log in with Facebook',
                  onPressed: () => _showAccountChooser('Facebook'),
                ),
                const SizedBox(height: 14),
                _buildSocialButton(
                  icon: Icons.camera_alt,
                  iconColor: Colors.purple,
                  text: 'Log in with Instagram',
                  onPressed: () => _showAccountChooser('Instagram'),
                ),
                const SizedBox(height: 24),
                const Row(
                  children: [
                    Expanded(child: Divider(color: Colors.white54)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'More Login Methods',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.white54)),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildBottomIcon(Icons.phone_android, () => _showAccountChooser('Phone')),
                    const SizedBox(width: 30),
                    _buildBottomIcon(Icons.person_outline, () => _showAccountChooser('Guest')),
                    const SizedBox(width: 30),
                    _buildBottomIcon(Icons.email_outlined, () => _showAccountChooser('Email')),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.check_circle, color: Colors.amberAccent, size: 14),
                    const SizedBox(width: 6),
                    Text(
                      'Logging in confirms you’re 18+ and agree to Terms',
                      style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required Color iconColor,
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 6,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 28),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomIcon(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white30, width: 1),
        ),
        child: Icon(icon, color: Colors.white, size: 22),
      ),
    );
  }
}

// 2. የፕሮፋይል ማስተካከያ ገጽ (Profile Setup Page)
class ProfileSetupPage extends StatefulWidget {
  const ProfileSetupPage({Key? key}) : super(key: key);

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  String _selectedGender = 'Male';
  File? _imageFile;

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12121f),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Setup Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.amber, Colors.orangeAccent],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.amber.withOpacity(0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.verified, color: Colors.white, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'Level 1 • Starter Host',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: _pickImageFromGallery,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.amberAccent, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.amber.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white24,
                      backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
                      child: _imageFile == null
                          ? const Icon(Icons.person, size: 60, color: Colors.white70)
                          : null,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _nameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Nickname / Full Name',
                labelStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.badge, color: Colors.amberAccent),
                filled: true,
                fillColor: Colors.white.withOpacity(0.08),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _dobController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Date of Birth (DD/MM/YYYY)',
                labelStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.calendar_today, color: Colors.amberAccent),
                filled: true,
                fillColor: Colors.white.withOpacity(0.08),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Text(
                  'Gender:',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Male', style: TextStyle(color: Colors.white, fontSize: 14)),
                          value: 'Male',
                          groupValue: _selectedGender,
                          activeColor: Colors.amberAccent,
                          contentPadding: EdgeInsets.zero,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Female', style: TextStyle(color: Colors.white, fontSize: 14)),
                          value: 'Female',
                          groupValue: _selectedGender,
                          activeColor: Colors.amberAccent,
                          contentPadding: EdgeInsets.zero,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 6,
                ),
                onPressed: () {
                  // ወደ ላይቭ ኤክስፕሎር ዋና ገጽ መሸጋገሪያ
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LiveExplorePage()),
                  );
                },
                child: const Text(
                  'Start Live Journey',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 3. ዋናው የላይቭ ኤክስፕሎር ገጽ (Explore, For You, New, Nearby ከ ሀገር ማጣሪያ ጋር)
class LiveExplorePage extends StatefulWidget {
  const LiveExplorePage({Key? key}) : super(key: key);

  @override
  State<LiveExplorePage> createState() => _LiveExplorePageState();
}

class _LiveExplorePageState extends State<LiveExplorePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedCountryIndex = 0;

  final List<Map<String, String>> countries = [
    {'name': 'All', 'flag': '🌐'},
    {'name': 'Philippines', 'flag': '🇵🇭'},
    {'name': 'Nepal', 'flag': '🇳🇵'},
    {'name': 'Ethiopia', 'flag': '🇪🇹'},
  ];

  final List<Map<String, dynamic>> liveStreams = [
    {
      'name': 'እስራኤል ትንሳኤፍሀ...',
      'category': 'INFLUENCER',
      'viewers': '5.5k',
      'image': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=500',
      'flag': '🇪🇹',
    },
    {
      'name': 'Entisar ✨',
      'category': 'Chatting',
      'viewers': '501',
      'image': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=500',
      'flag': '🇪🇹',
    },
    {
      'name': 'Tihitna @13',
      'category': 'Music',
      'viewers': '489',
      'image': 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=500',
      'flag': '🇪🇹',
    },
    {
      'name': 'አፄንት ዘዘዘ',
      'category': 'TOP 10 Hourly',
      'viewers': '4.4K',
      'image': 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?w=500',
      'flag': '🇪🇹',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index == 3) {
        // Nearby ሲመረጥ የሎኬሽን ፍቃድ ጥያቄ ፖፕ-አፕ ማሳየት
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _showLocationPermissionDialog();
        });
      }
    });
  }

  void _showLocationPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1a1a2e),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Requesting location access', style: TextStyle(color: Colors.white, fontSize: 16)),
        content: const Text('You can find streamers near you', style: TextStyle(color: Colors.white70, fontSize: 13)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Location Access Granted!')),
              );
            },
            child: const Text('Open', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12121f),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1a1a2e),
        elevation: 0,
        title: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.amberAccent,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.amberAccent,
          indicatorWeight: 3,
          tabs: const [
            Tab(text: 'Explore'),
            Tab(text: 'For You'),
            Tab(text: 'New'),
            Tab(text: 'Nearby'),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.emoji_events, color: Colors.amberAccent), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // አግድም የሀገር ባንዲራዎች ማጣሪያ (Horizontal Country Flags Selector)
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: countries.length,
              itemBuilder: (context, index) {
                bool isSelected = _selectedCountryIndex == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: ChoiceChip(
                    avatar: Text(countries[index]['flag']!),
                    label: Text(countries[index]['name']!),
                    selected: isSelected,
                    selectedColor: Colors.amber,
                    backgroundColor: Colors.white12,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedCountryIndex = index;
                      });
                    },
                  ),
                );
              },
            ),
          ),

          // የላይቭ ሩሞች ግሪድ (Grid View of Live Streams)
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemCount: liveStreams.length,
              itemBuilder: (context, index) {
                final stream = liveStreams[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(stream['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            stream['category'],
                            style: const TextStyle(color: Colors.amberAccent, fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              stream['name'],
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(stream['flag'], style: const TextStyle(fontSize: 12)),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    '📊 ${stream['viewers']}',
                                    style: const TextStyle(color: Colors.white70, fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1a1a2e),
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: Colors.white60,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.live_tv), label: 'Live'),
          BottomNavigationBarItem(icon: Icon(Icons.monetization_on), label: 'Gifts'),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
