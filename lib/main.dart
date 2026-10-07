import 'package:flutter/material.dart';

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
class WelcomeLoginPage extends StatelessWidget {
  const WelcomeLoginPage({Key? key}) : super(key: key);

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
                // ከላይ በግራ በኩል ያለው ሎጎ እና ስም
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

                // መካከለኛ የውበት ምልክት (Star Icon)
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

                // የማህበራዊ ሚዲያ መግቢያ ቁልፎች (ወደ ProfileSetupPage የሚወስድ)
                _buildSocialButton(
                  icon: Icons.g_mobiledata,
                  iconColor: Colors.red,
                  text: 'Log in with Google',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfileSetupPage()),
                    );
                  },
                ),
                const SizedBox(height: 14),
                _buildSocialButton(
                  icon: Icons.facebook,
                  iconColor: Colors.blue,
                  text: 'Log in with Facebook',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfileSetupPage()),
                    );
                  },
                ),
                const SizedBox(height: 14),
                _buildSocialButton(
                  icon: Icons.camera_alt,
                  iconColor: Colors.purple,
                  text: 'Log in with Instagram',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfileSetupPage()),
                    );
                  },
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
                    _buildBottomIcon(Icons.phone_android, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileSetupPage()));
                    }),
                    const SizedBox(width: 30),
                    _buildBottomIcon(Icons.person_outline, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileSetupPage()));
                    }),
                    const SizedBox(width: 30),
                    _buildBottomIcon(Icons.email_outlined, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileSetupPage()));
                    }),
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

// 2. ሁለተኛው ገጽ፡ የፕሮፋይል ማስተካከያ እና የሆስት ባጅ (Profile Setup Page)
class ProfileSetupPage extends StatefulWidget {
  const ProfileSetupPage({Key? key}) : super(key: key);

  @override
  _ProfileSetupPageState createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  String _selectedGender = 'Male';

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
        iconTheme: const IconThemeData(color: Colors.white), // የተስተካከለው መስመር
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Level 1 • Starter Host ባጅ (Badge)
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

            // የፕሮፋይል ፎቶ መምረጫ (Profile Picture Avatar)
            Stack(
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
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.person, size: 60, color: Colors.white70),
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

            const SizedBox(height: 32),

            // ስም ማስገቢያ (Full Name)
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

            // የልደት ቀን (Date of Birth)
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

            // ጾታ ምርጫ (Gender Selection)
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

            // Continue / Start Streaming ቁልፍ
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Profile Setup Completed Successfully!')),
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
