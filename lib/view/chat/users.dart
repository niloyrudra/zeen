import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:zeen/config/text_style.dart';
import 'package:zeen/flutterfire.dart';
import 'package:zeen/view/chat/p2p_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';

import 'package:zeen/view/chat/util.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});
  // const UsersPage({super.key, user = getCurrentUser()});
  // this.currentUser = getCurrentUser();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      title: const Text('Users'),
      centerTitle: true,
      titleTextStyle: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(
        color: AppTheme.isLightTheme == true
          ? HexColor(AppTheme.primaryColorString!)
          : HexColor('#ffffff'),
        fontSize: 16,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: IconThemeData(
        color: AppTheme.isLightTheme == true
            ? HexColor('#15141f')
            : HexColor('#ffffff'),
      ),
      backgroundColor: AppTheme.isLightTheme == false
          ? HexColor('#15141f')
          : HexColor('#ffffff'),
    ),
    body: StreamBuilder<List<types.User>>(
      stream: FirebaseChatCore.instance.users(),
      initialData: const [],
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
              bottom: 200,
            ),
            child: const Text('No users'),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final user = snapshot.data![index];

            print(user); // _User(null, null, EejJ33357ypDD64KWRki, null, null, null, null, null, null)

            return GestureDetector(
              onTap: () {
                _handlePressed(user, context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    _buildAvatar(user),
                    Text('User'), // Text(getUserName(user)),
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
  );

  Widget _buildAvatar(types.User user) {
    final color = getUserAvatarNameColor(user);
    final hasImage = user.imageUrl != null;
    final name = getUserName(user);

    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: CircleAvatar(
        backgroundColor: hasImage ? Colors.transparent : color,
        backgroundImage: hasImage ? NetworkImage(user.imageUrl!) : null,
        radius: 20,
        child: !hasImage
            ? Text(
          name.isEmpty ? '' : name[0].toUpperCase(),
          style: const TextStyle(color: Colors.white),
        )
            : null,
      ),
    );
  }

  void _handlePressed(types.User otherUser, BuildContext context) async {
    final navigator = Navigator.of(context);
    final room = await FirebaseChatCore.instance.createRoom(otherUser);

    navigator.pop();
    await navigator.push(
      MaterialPageRoute(
        builder: (context) => ChatPage(
          room: room,
        ),
      ),
    );
  }
}