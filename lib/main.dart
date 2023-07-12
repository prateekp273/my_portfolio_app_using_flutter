import 'package:flutter/material.dart';
import 'package:transform_3d/transform_3d.dart';

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
  final String about =
      "SDE Intern at VISANKA TECHNOLOGIES PVT LTD | Android Developer | Cross Platform App Developer | AI(open AI)| Full Stack Developer | SOLANA HACKDAY HACKATHON IIIT DELHI first prize winner✅ | HACKACCINO first prize winner✅";
  final String email = "prateekp18012000@gmail.com";
  final String linkedIn = "https://www.linkedin.com/in/prateek-patel273/";
  final String github = "https://github.com/prateekp273";
  final String resumeLink =
      "https://drive.google.com/file/d/1vrTeJD74N2sqFg3D1MN6tJxXaM6Xs9aw/view?usp=drivesdk";
  final String contactNumber = "8090439359";

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
    {
      "title": "Project 3",
      "description": "Write a brief description of your project.",
      "url": "https://project3.com",
    },
    {
      "title": "Project 4",
      "description": "Write a brief description of your project.",
      "url": "https://project4.com",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Transform3D(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(0.2),
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile_image.jpg'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                about,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Projects',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      projects[index]['title'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(projects[index]['description']),
                    onTap: () async {
                      if (await (projects[index]['url'])) {
                        await (projects[index]['url']);
                      }
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Contact Me',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.mail),
              title: const Text('Email'),
              subtitle: Text(email),
              onTap: () async {
                final Uri _emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: email,
                );
                await (_emailLaunchUri.toString());
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: Text('Contact Number'),
              subtitle: Text(contactNumber),
              onTap: () async {
                final Uri _phoneLaunchUri = Uri(
                  scheme: 'tel',
                  path: contactNumber,
                );
                await (_phoneLaunchUri.toString());
              },
            ),
            ListTile(
              leading: const Icon(Icons.link),
              title: const Text('LinkedIn'),
              subtitle: Text('Connect with me on LinkedIn'),
              onTap: () async {
                await (linkedIn);
              },
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text('GitHub'),
              subtitle: const Text('View my GitHub profile'),
              onTap: () async {
                await (github);
              },
            ),
            ListTile(
              leading: const Icon(Icons.insert_drive_file),
              title: const Text('Resume'),
              subtitle: const Text('View my resume'),
              onTap: () async {
                await (resumeLink);
              },
            ),
          ],
        ),
      ),
    );
  }
}
