import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hai, $username!',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 67, 91, 119),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MenuCard(
              title: 'News',
              description:
                  'Get an overview of the latest SpaceFlight news, from various sources! Easily link your users to the right websites.',
              icon: Icons.newspaper,
              onTap: () => navigateToDetail(context, 'News'),
            ),
            MenuCard(
              title: 'Blog',
              description:
                  'Blogs often provide a more detailed overview of launches and missions. A must-have for the serious spaceflight enthusiast.',
              icon: Icons.article,
              onTap: () => navigateToDetail(context, 'Blog'),
            ),
            MenuCard(
              title: 'Report',
              description:
                  'Space stations and other missions often publish their data. With SNAPi, you can include it in your reports.',
              icon: Icons.report,
              onTap: () => navigateToDetail(context, 'Report'),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToDetail(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetailPage(title: title)),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(icon, size: 40),
              title: Text(title, style: const TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
