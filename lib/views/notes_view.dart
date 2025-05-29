import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main UI"),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldLogout = await showLogoutDialog(context);
                  if (shouldLogout) {
                    await FirebaseAuth.instance.signOut();
                    if (context.mounted) {
                      Navigator.of(
                        context,
                      ).pushNamedAndRemoveUntil("/login/", (_) => false);
                    }
                  }

                  break;
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem<MenuAction>(
                  value: MenuAction.logout,
                  child: Text("Logout"),
                ),
              ];
            },
          ),
        ],
      ),
      body: Text("Notes"),
    );
  }
}

enum MenuAction { logout }

Future<bool> showLogoutDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Logout"),
        content: Text("Are you sure you want to sign out?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text("Log out"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text("Cancel"),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
