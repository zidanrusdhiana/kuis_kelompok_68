import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentNavIndex = 4;
  bool _isDarkMode = true;
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildProfileHeader(),
              const SizedBox(height: 20),
              _buildProfileInfo(),
              const SizedBox(height: 20),
              _buildSettingsSection(),
              const SizedBox(height: 20),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          setState(() {
            _currentNavIndex = index;
          });

          if (index == 0) {
            Navigator.pushNamed(context, '/page1'); // Home
          } else if (index == 1) {
            Navigator.pushNamed(context, '/page3'); // Chat
          } else if (index == 2) {
            Navigator.pushNamed(context, '/page4'); // Wishlist
          } else if (index == 3) {
            Navigator.pushNamed(context, '/transaction1'); // Order Monitoring (ubah dari Cart)
          }
        },
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF3E2723), Colors.black],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu_open_rounded, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/'); // Kembali ke main menu
                    },
                  ),
                  const Text(
                    'My Profile',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.white), // Ubah dari Edit ke Settings
                onPressed: () {
                  // Navigasi ke halaman settings (bisa ditambahkan nanti)
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundImage: const NetworkImage(
              'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Alex Johnson',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Text(
            'alex.johnson@example.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStatItem('5', 'Orders'),
              _buildDivider(),
              _buildStatItem('3', 'Active'),
              _buildDivider(),
              _buildStatItem('2', 'Completed'),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildStatItem(String count, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(
            count,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8D6E63),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 30,
      width: 1,
      color: Colors.grey.withOpacity(0.5),
    );
  }

  Widget _buildProfileInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildInfoItem(Icons.phone, 'Phone', '+1 (555) 123-4567'),
              _buildInfoItem(Icons.location_on, 'Address', '123 Camping Street, Outdoor City, CA 94123'),
              _buildInfoItem(Icons.calendar_today, 'Member Since', 'January 2023'),
              _buildInfoItem(Icons.credit_card, 'Payment Method', 'Visa •••• 4567'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF8D6E63)),
      title: Text(label, style: const TextStyle(color: Colors.grey)),
      subtitle: Text(value, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _buildSettingsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Dark Mode', style: TextStyle(color: Colors.white)),
              value: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
              },
              activeColor: const Color(0xFF8D6E63),
            ),
            SwitchListTile(
              title: const Text('Notifications', style: TextStyle(color: Colors.white)),
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
              activeColor: const Color(0xFF8D6E63),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/transaction1'); // Orders
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8D6E63),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text('View My Orders'),
          ),
          const SizedBox(height: 10),
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/page1'); // Sign out
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF8D6E63)),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              'Sign Out',
              style: TextStyle(color: Color(0xFF8D6E63)),
            ),
          ),
        ],
      ),
    );
  }
}