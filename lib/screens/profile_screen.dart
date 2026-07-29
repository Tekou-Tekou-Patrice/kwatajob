import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                authProvider.user?.fullName ?? 'Utilisateur',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(authProvider.user?.email ?? 'Aucune information'),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Téléphone'),
                subtitle: Text(authProvider.user?.phone ?? '—'),
              ),
              ListTile(
                leading: const Icon(Icons.badge),
                title: const Text('Type d’utilisateur'),
                subtitle: Text(authProvider.user?.userType ?? '—'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
