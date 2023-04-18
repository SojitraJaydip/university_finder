import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_app/custom_widget/custom_container.dart';
import 'package:web_app/extension.dart';

import '../models/university_data.dart';

class CollegeCard extends StatelessWidget {
  final UniversityData collegeData;
  const CollegeCard({Key? key, required this.collegeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: ListTile(
        onTap: () async {
          if (!await launchUrl(Uri.parse(collegeData.webPages?.first ?? ''))) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('No website found'),
                ),
              );
            }
          }
        },
        title: Text(
          collegeData.name ?? 'No name',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Icon(
          Icons.open_in_new,
          color: Theme.of(context).iconTheme.color!,
        ),
      ),
    );
  }
}
