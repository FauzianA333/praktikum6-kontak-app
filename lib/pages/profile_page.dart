import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // TODO: ganti dengan data Anda sendiri.
  static const String _nama = 'M. Fauzian Afshor';
  static const String _nim = '4124033';
  static const String _prodi = 'Sistem Informasi';
  static const String _email = 'm.fauzianafshor@saintek.unipdu.ac.id';

  // Foto profil dari internet. Untuk foto sendiri, simpan di assets/images/
  // lalu ganti Image.network menjadi Image.asset.
  static const String _fotoUrl = 'https://i.pravatar.cc/300?img=12';

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Efek cahaya berdenyut di belakang foto profil.
            AvatarGlow(
              glowColor: scheme.primary,
              child: Material(
                elevation: 8,
                shape: const CircleBorder(),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: scheme.primaryContainer,
                  child: ClipOval(
                    child: Image.network(
                      _fotoUrl,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                      // Jika offline, tampilkan ikon sebagai cadangan.
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.person,
                        size: 64,
                        color: scheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              _nama,
              style: textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(_prodi, style: textTheme.bodyLarge),
            const SizedBox(height: 24),
            const Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.badge_outlined),
                    title: Text('NIM'),
                    subtitle: Text(_nim),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.email_outlined),
                    title: Text('Email'),
                    subtitle: Text(_email),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}