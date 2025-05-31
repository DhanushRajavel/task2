import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2/providers/user_provider.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(provider.isOnline ? 'Online Users' : 'Offline Users'),
      ),
      body: provider.users.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: provider.users.length,
              itemBuilder: (_, index) {
                final user = provider.users[index];
                return ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(user.pictureUrl)),
                  title: Text('${user.title} ${user.firstName} ${user.lastName}'),
                  subtitle: Text('${user.city}, ${user.country}'),
                  trailing: Text(user.gender),
                );
              },
            ),
    );
  }
}
