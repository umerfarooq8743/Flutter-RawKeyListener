import 'package:flutter/material.dart';

void main() {
  runApp(PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.blueAccent,
      ),
      home: PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portfolio'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(),
            SizedBox(height: 20),
            AboutMeSection(),
            SizedBox(height: 20),
            PersonalDetailsSection(),
            SizedBox(height: 20),
            SkillsSection(),
            SizedBox(height: 20),
            ProjectsSection(),
            SizedBox(height: 20),
            ExperienceSection(),
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('assets/profile_picture.jpg'),
        ),
        SizedBox(height: 10),
        Text(
          'John Doe',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Software Engineer',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class AboutMeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Me',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'I am a passionate software engineer with experience in building web and mobile applications. '
          'I enjoy solving complex problems and creating efficient solutions. '
          'My expertise includes Flutter, Dart, and JavaScript. '
          'I am a quick learner and always eager to explore new technologies.',
        ),
      ],
    );
  }
}

class PersonalDetailsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personal Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        ListTile(
          leading: Icon(Icons.email),
          title: Text('Email'),
          subtitle: Text('johndoe@example.com'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Phone'),
          subtitle: Text('+1 123 456 7890'),
        ),
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text('Location'),
          subtitle: Text('City, Country'),
        ),
      ],
    );
  }
}

class SkillsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skills',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            SkillChip(skill: 'Flutter'),
            SkillChip(skill: 'Dart'),
            SkillChip(skill: 'JavaScript'),
            SkillChip(skill: 'React'),
            SkillChip(skill: 'Node.js'),
            SkillChip(skill: 'Firebase'),
          ],
        ),
      ],
    );
  }
}

class SkillChip extends StatelessWidget {
  final String skill;

  const SkillChip({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(skill),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Projects',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        ProjectItem(
          name: 'Expense Tracker',
          description:
              'A mobile app built with Flutter for tracking personal expenses.',
        ),
        ProjectItem(
          name: 'E-commerce Website',
          description:
              'A responsive e-commerce website built with React and Node.js.',
        ),
      ],
    );
  }
}

class ProjectItem extends StatelessWidget {
  final String name;
  final String description;

  const ProjectItem({
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(description),
      onTap: () {
        // TODO: Handle project item tap
      },
    );
  }
}

class ExperienceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Experience',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        ExperienceItem(
          company: 'ABC Tech',
          position: 'Software Engineer',
          duration: '2018 - Present',
          description:
              'Worked on developing and maintaining web applications using React and Node.js. '
              'Collaborated with cross-functional teams to deliver high-quality software solutions.',
        ),
        ExperienceItem(
          company: 'XYZ Company',
          position: 'Intern',
          duration: 'Summer 2017',
          description:
              'Gained hands-on experience in mobile app development using Flutter. '
              'Contributed to the development of a project management app.',
        ),
      ],
    );
  }
}

class ExperienceItem extends StatelessWidget {
  final String company;
  final String position;
  final String duration;
  final String description;

  const ExperienceItem({
    required this.company,
    required this.position,
    required this.duration,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$position, $company',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          duration,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 5),
        Text(description),
        Divider(),
      ],
    );
  }
}