import 'package:flutter/material.dart';
import '../services/data_service.dart';
import '../models/profile.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final _dataService = DataService();
  late Future<Profile> _profileFuture;

  @override
  void initState() {
    super.initState();
    _profileFuture = _dataService.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Profile>(
      future: _profileFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final profile = snapshot.data!;

        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              ClipOval(
                child: Image.network(
                  profile.photoUrl,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 120,
                    height: 120,
                    color: Colors.blueGrey.withOpacity(0.1),
                    child: const Icon(Icons.person, size: 60, color: Colors.blueGrey),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                profile.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                profile.email,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              _buildProfileItem(Icons.phone, 'Phone', profile.phone),
              _buildProfileItem(Icons.location_on, 'Address', profile.address),
              const Divider(indent: 20, endIndent: 20),
              _buildProfileItem(Icons.settings, 'Settings', 'Account preferences'),
              _buildProfileItem(Icons.help, 'Help & Support', 'F.A.Q, Contact us'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProfileItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueGrey),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
