import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends StatelessWidget {
  final String name = "Prateek Patel";
  final String title = "Passionate Android & Web Developer";
  final String about = "SDE Intern at VISANKA TECHNOLOGIES PVT LTD | Android Developer | Cross Platform App Developer | AI(open AI)| Full Stack Developer | SOLANA HACKDAY HACKATHON IIIT DELHI first prize winner✅ | HACKACCINO first prize winner✅";

  final List<Map<String, dynamic>> projects = [
    {
      "title": "Project 1",
      "description": "Write a brief description of your project.",
      "url": "https://project1.com",
    },
    {
      "title": "Project 2",
      "description": "Write a brief description of your project.",
      "url": "https://project2.com",
    },
    // Add more projects here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portfolio'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/profile_image.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                about,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Projects',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    projects[index]['title'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(projects[index]['description']),
                  onTap: () async {
                    if (await canLaunch(projects[index]['url'])) {
                      await launch(projects[index]['url']);
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
