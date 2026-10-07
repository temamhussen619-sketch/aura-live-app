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
      title: 'Poppo Live',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const WelcomeLoginPage(),
    );
  }
}

// 1. ሎጊን ገጽ (Welcome / Login Page - Poppo Style Light Theme)
class WelcomeLoginPage extends StatefulWidget {
  const WelcomeLoginPage({Key? key}) : super(key: key);

  @override
  State<WelcomeLoginPage> createState() => _WelcomeLoginPageState();
}

class _WelcomeLoginPageState extends State<WelcomeLoginPage> {
  // የጎግል አካውንት መምረጫ
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
                  color: Colors.purple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('po.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.purple)),
              ),
              const SizedBox(height: 12),
              const Text('Choose a Google account', style: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text('to continue to Poppo Live', style: TextStyle(color: Colors.black54, fontSize: 13)),
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

  // የፌስቡክ አካውንት መምረጫ
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
              const Text('Log in to Poppo Live as:', style: TextStyle(color: Colors.black54, fontSize: 13)),
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

  // የኢንስታግራም አካውንት መምረጫ
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
              const Text('Log in to Poppo Live as:', style: TextStyle(color: Colors.black54, fontSize: 13)),
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
            'You need to read and agree before registering and logging in to Poppo Live Terms Of Service and Privacy Policy.',
            style: TextStyle(color: Colors.black87, fontSize: 13),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
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
              child: const Text('Accept', style: TextStyle(color: Colors.white)),
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
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'po.',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'POPPO',
                            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'From strangeness to intimacy',
                            style: TextStyle(color: Colors.white70, fontSize: 11),
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
                      'Logging in confirms you’re 18+ and have read and agreed\nPoppo Live Terms Of Service and Privacy Policy',
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
            Icon(icon, color: Colors.purple, size: 24),
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

// 2. ፕሮፋይል ማስተካከያ ገጽ ከጥብቅ ቫሊዴሽን ጋር (Profile Setup Page)
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
        const SnackBar(content: Text('እባክዎ ዩዘርኔም እና የልደት ቀን ይሙሉ!'), backgroundColor: Colors.red),
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
        title: const Text('Setup Profile', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImageFromGallery,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white24,
                backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
                child: _imageFile == null ? const Icon(Icons.camera_alt, size: 40, color: Colors.white70) : null,
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _nameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Nickname *',
                labelStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _dobController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Date of Birth (DD/MM/YYYY) *',
                labelStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                onPressed: _validateAndSubmit,
                child: const Text('Start Live Journey', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 3. የላይቭ ኤክስፕሎር ገጽ (Live Explore Page)
class LiveExplorePage extends StatelessWidget {
  const LiveExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12121f),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1a1a2e),
        title: const Text('Poppo Live Explore', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Text(
          'Welcome to Poppo Live!',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
