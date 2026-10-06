import 'dart:async';
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

class WelcomeLoginPage extends StatefulWidget {
  const WelcomeLoginPage({Key? key}) : super(key: key);

  @override
  _WelcomeLoginPageState createState() => _WelcomeLoginPageState();
}

class _WelcomeLoginPageState extends State<WelcomeLoginPage> {
  // የጀርባ ፎቶዎች (Background Slideshow Images)
  final List<String> _bgImages = [
    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=1000&q=80',
    'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=1000&q=80',
    'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=1000&q=80',
  ];
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _bgImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. የጀርባ ተለዋዋጭ ፎቶዎች (Dynamic Background Slideshow)
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),
            child: Image.network(
              _bgImages[_currentIndex],
              key: ValueKey<int>(_currentIndex),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          // የጥላ ከለር (Dark/Gold Gradient Overlay)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.75),
                ],
              ),
            ),
          ),

          // 2. ዋናው ይዘት
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ከላይ በግራ በኩል ያለው ሎጎ እና ስም (Aura Logo & Title)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // የዶላር እና ወርቃማ ከለር ሎጎ
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
                                  blurRadius: 10,
                                  spreadRadius: 2,
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

                  // 3. የማህበራዊ ሚዲያ መግቢያ ቁልፎች (Social Logins)
                  _buildSocialButton(
                    icon: Icons.g_mobiledata,
                    iconColor: Colors.red,
                    text: 'Log in with Google',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 14),
                  _buildSocialButton(
                    icon: Icons.facebook,
                    iconColor: Colors.blue,
                    text: 'Log in with Facebook',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 14),
                  _buildSocialButton(
                    icon: Icons.camera_alt,
                    iconColor: Colors.purple,
                    text: 'Log in with Instagram',
                    onPressed: () {},
                  ),

                  const SizedBox(height: 24),

                  // ተጨማሪ መግቢያ መንገዶች (More Login Methods)
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

                  // ከታች ያሉት አይኮኖች (Bottom Icons)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildBottomIcon(Icons.phone_android, () {}),
                      const SizedBox(width: 30),
                      _buildBottomIcon(Icons.person_outline, () {}),
                      const SizedBox(width: 30),
                      _buildBottomIcon(Icons.email_outlined, () {}),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // የውል ስምምነት ማስታወሻ
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
        ],
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
