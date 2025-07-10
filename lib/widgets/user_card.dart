import 'package:flutter/material.dart';

import '../models/user_model.dart'; 
class UserCard extends StatelessWidget {
  final User user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            // Added 'const' for performance optimization
            const SizedBox(height: 8.0),
            _buildInfoRow(context, Icons.email, user.email),
            const SizedBox(height: 4.0),
            _buildInfoRow(context, Icons.phone, user.phone),
            const SizedBox(height: 4.0),
            _buildInfoRow(context, Icons.language, user.website),
            const SizedBox(height: 4.0),
            _buildInfoRow(context, Icons.business, user.company.name),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18.0, color: Theme.of(context).primaryColor),
        // Added 'const' for performance optimization
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}