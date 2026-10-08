import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import 'dart:io';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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

class WelcomeLoginPage extends StatefulWidget {
  const WelcomeLoginPage({Key? key}) : super(key: key);

  @override
  State<WelcomeLoginPage> createState() => _WelcomeLoginPageState();
}

class _WelcomeLoginPageState extends State<WelcomeLoginPage> {
  void _showGoogleAccountChooser() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.star_rounded, color: Colors.amber, size: 30),
              ),
              const SizedBox(height: 12),
              const Text('Choose a Google account', style: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text('to continue to Aura Live', style: TextStyle(color: Colors.black54, fontSize: 13)),
            ],
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                _buildAccountItem('Temam Hussein', 'temamhussein619@gmail.com', 'T', Colors.teal),
                _buildAccountItem('Amar Temam', 'amartemam0@gmail.com', 'A', Colors.deepPurple),
                _buildAccountItem('Temam Ahmad', 'temamahmad4@gmail.com', 'T', Colors.blueGrey),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showFacebookAccountChooser() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Column(
            children: [
              const Icon(Icons.facebook, color: Colors.blue, size: 40),
              const SizedBox(height: 8),
              const Text('Choose Facebook Account', style: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text('Log in to Aura Live as:', style: TextStyle(color: Colors.black54, fontSize: 13)),
            ],
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                _buildAccountItem('Temam Facebook', 'temam.facebook@fb.com', 'F', Colors.blue),
                _buildAccountItem('Aura Official FB', 'aura.host@fb.com', 'A', Colors.indigo),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showInstagramAccountChooser() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Column(
            children: [
              const Icon(Icons.camera_alt, color: Colors.purple, size: 40),
              const SizedBox(height: 8),
              const Text('Choose Instagram Account', style: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text('Log in to Aura Live as:', style: TextStyle(color: Colors.black54, fontSize: 13)),
            ],
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                _buildAccountItem('@temam_live', 'temam_ig@insta.com', 'IG', Colors.pink),
                _buildAccountItem('@aura_host_official', 'aura_ig@insta.com', 'AI', Colors.purpleAccent),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAccountItem(String name, String email, String initial, Color color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(initial, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87)),
      subtitle: Text(email, style: const TextStyle(fontSize: 12, color: Colors.black54)),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileSetupPage()),
        );
      },
    );
  }

  void _showAgreementDialog(String providerName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text(
            'User Agreement',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          content: const Text(
            'You need to read and agree before registering and logging in to Aura Live Terms Of Service and Privacy Policy.',
            style: TextStyle(color: Colors.black87, fontSize: 13),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {
                Navigator.pop(context);
                if (providerName == 'Google') {
                  _showGoogleAccountChooser();
                } else if (providerName == 'Facebook') {
                  _showFacebookAccountChooser();
                } else if (providerName == 'Instagram') {
                  _showInstagramAccountChooser();
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfileSetupPage()),
                  );
                }
              },
              child: const Text('Accept', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=800'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Need help?',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
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
                            ),
                          ],
                          border: Border.all(color: Colors.white, width: 1.5),
                        ),
                        child: const Icon(Icons.star_rounded, color: Colors.white, size: 28),
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'AURA LIVE',
                            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                          ),
                          Text(
                            'Party, Dollar & Shine',
                            style: TextStyle(color: Colors.amberAccent, fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  _buildLoginButton('Log in with Google', Icons.g_mobiledata, () => _showAgreementDialog('Google')),
                  const SizedBox(height: 12),
                  _buildLoginButton('Log in with Facebook', Icons.facebook, () => _showAgreementDialog('Facebook')),
                  const SizedBox(height: 12),
                  _buildLoginButton('Log in with Instagram', Icons.camera_alt, () => _showAgreementDialog('Instagram')),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'More Login Methods',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildRoundIcon(Icons.phone_android, () => _showAgreementDialog('Phone')),
                      const SizedBox(width: 24),
                      _buildRoundIcon(Icons.person_outline, () => _showAgreementDialog('ID')),
                      const SizedBox(width: 24),
                      _buildRoundIcon(Icons.email_outlined, () => _showAgreementDialog('Email')),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'Logging in confirms you’re 18+ and have read and agreed\nAura Live Terms Of Service and Privacy Policy',
                      style: TextStyle(color: Colors.white60, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(String text, IconData icon, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          elevation: 4,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.amber, size: 24),
            const SizedBox(width: 8),
            Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildRoundIcon(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.black87, size: 20),
      ),
    );
  }
}

class ProfileSetupPage extends StatefulWidget {
  const ProfileSetupPage({Key? key}) : super(key: key);

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
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

  void _validateAndSubmit() {
    if (_nameController.text.trim().isEmpty || _dobController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('እባክዎ ስምዎን እና የልደት ቀንዎን ያስገቡ!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LiveExplorePage()),
    );
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
            GestureDetector(
              onTap: _pickImageFromGallery,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white24,
                    backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
                    child: _imageFile == null ? const Icon(Icons.person, size: 60, color: Colors.white70) : null,
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
                labelText: 'Nickname / Full Name *',
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
                labelText: 'Date of Birth (DD/MM/YYYY) *',
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
                ),
                onPressed: _validateAndSubmit,
                child: const Text(
                  'Start Live Journey',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
          tabs: const [
            Tab(text: 'Explore'),
            Tab(text: 'For You'),
            Tab(text: 'New'),
            Tab(text: 'Nearby'),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
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
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LiveRoomPage(
                              hostName: stream['name'],
                              hostImage: stream['image'],
                              category: stream['category'],
                            ),
                          ),
                        );
                      },
                      child: Container(
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
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LiveRoomPage(
                      hostName: 'Temam Host',
                      hostImage: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=500',
                      category: 'LIVE STREAM',
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFff416c), Color(0xFFff4b2b)],
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.videocam, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'LIVE',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
              ),
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

class LiveRoomPage extends StatefulWidget {
  final String hostName;
  final String hostImage;
  final String category;

  const LiveRoomPage({
    Key? key,
    required this.hostName,
    required this.hostImage,
    required this.category,
  }) : super(key: key);

  @override
  State<LiveRoomPage> createState() => _LiveRoomPageState();
}

class _LiveRoomPageState extends State<LiveRoomPage> {
  CameraController? _cameraController;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        final frontCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front,
          orElse: () => cameras.first,
        );

        _cameraController = CameraController(
          frontCamera,
          ResolutionPreset.medium,
          enableAudio: true,
        );

        await _cameraController!.initialize();
        if (mounted) {
          setState(() {
            _isCameraInitialized = true;
          });
        }
      }
    } catch (e) {
      debugPrint('Camera error: $e');
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: _isCameraInitialized && _cameraController != null
                ? CameraPreview(_cameraController!)
                : Container(
                    color: Colors.black,
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.amberAccent),
                    ),
                  ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(radius: 18, backgroundImage: NetworkImage(widget.hostImage)),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(widget.hostName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                                const Text('ID: 26948111', style: TextStyle(color: Colors.amberAccent, fontSize: 9)),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(15)),
                              child: const Text('Follow', style: TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: 250,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(12)),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Aura System: Welcome to the live room!', style: TextStyle(color: Colors.amberAccent, fontSize: 11)),
                            SizedBox(height: 4),
                            Text('Temam: ሰላም ለዚህ ሩም ሰወች! 👋', style: TextStyle(color: Colors.white, fontSize: 12)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.white24),
                              ),
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Say something...', style: TextStyle(color: Colors.white60, fontSize: 13)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          _buildRoomIcon(Icons.flip_camera_ios),
                          const SizedBox(width: 8),
                          _buildRoomIcon(Icons.card_giftcard, color: Colors.amberAccent),
                          const SizedBox(width: 8),
                          _buildRoomIcon(Icons.favorite, color: Colors.redAccent),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoomIcon(IconData icon, {Color color = Colors.white}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
      child: Icon(icon, color: color, size: 22),
    );
  }
}
