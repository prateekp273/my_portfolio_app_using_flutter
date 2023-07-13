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
      debugShowCheckedModeBanner: false, // Remove debug  banner
      home: PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
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
      "image": "assets/images/project1_image.jpg",
    },
    {
      "title": "Project 2",
      "description": "Write a brief description of your project.",
      "url": "https://project2.com",
      "image": "assets/images/project2_image.jpg",
    },
    {
      "title": "Project 3",
      "description": "Write a brief description of your project.",
      "url": "https://project3.com",
      "image": "assets/images/project3_image.jpg",
    },
    {
      "title": "Project 4",
      "description": "Write a brief description of your project.",
      "url": "https://project4.com",
      "image": "assets/images/project4_image.jpg",
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
    Container(
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
    GridView.builder(
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 1.0,
    crossAxisSpacing: 8.0,
    mainAxisSpacing: 8.0,
    ),
    itemCount: projects.length,
    itemBuilder: (context, index) {
    return GestureDetector(
    onTap: () {
    showDialog(
    context: context,
    builder: (context) => AlertDialog(
    title: Text(projects[index]['title']),
    content: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
    Text(projects[index]['description']),
    const SizedBox(height: 8),
    Image.asset(
    projects[index]['image'],
    height: 200,
    width: double.infinity,
    fit: BoxFit.cover,
    ),
    ],
    ),
    actions: [
    TextButton(
    onPressed: () {
    Navigator.of(context).pop();
    },
    child: const Text('Close'),
    ),
    TextButton(
    onPressed: () async {
    if (await canLaunch(projects[index]['url'])) {
    await launch(projects[index]['url']);
    }
    },
    child: const Text('Visit Project'),
    ),
    ],
    ),
    );
    },
    child: Card(
    margin:
    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    elevation: 2,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Expanded(
    child: Image.asset(
    projects[index]['image'],
    fit: BoxFit.cover,
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
    projects[index]['title'],
    style: const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    ),
    ),
    ),
    ],
    ),
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
    await launch(_emailLaunchUri.toString());
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
    await launch(_phoneLaunchUri.toString());
    },
    ),
    ListTile(
    leading: const Icon(Icons.link),
    title: const Text('LinkedIn'),
    subtitle: Text('Connect with me on LinkedIn'),
    onTap: () async {
    await launch(linkedIn);
    },
    ),
    ListTile(
    leading: const Icon(Icons.code),
    title: const Text('GitHub'),
      subtitle: const Text('View my GitHub profile'),
      onTap: () async {
        await launch(github);
      },
    ),
      ListTile(
        leading: const Icon(Icons.insert_drive_file),
        title: const Text('Resume'),
        subtitle: const Text('View my resume'),
        onTap: () async {
          await launch(resumeLink);
        },
      ),
    ],
    ),
    ),
    );
  }
}
