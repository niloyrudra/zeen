import 'package:zeen/config/text_style.dart';
import 'package:zeen/firebase_options.dart';
import 'package:zeen/view/chat/p2p_chat.dart';
import 'package:zeen/view/login/login_screen.dart';
// import 'package:finpay/view/profile/profile_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';

import 'package:zeen/view/chat/users.dart';
import 'package:zeen/view/chat/util.dart';
// import 'package:get/get.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({super.key});

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  bool _error = false;
  bool _initialized = false;
  User? _user;

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Container();
    }

    if (!_initialized) {
      return Container();
    }

    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        actions: [
          IconButton(
            icon: Icon(
                Icons.add,
              color: HexColor(AppTheme.primaryColorString!), // Theme.of(context).textTheme.headline6!.color,
            ),
            onPressed: _user == null
                ? null
                : () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => const UsersPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Theme.of(context).textTheme.titleLarge!.color, // Theme.of(context).textTheme.headline6!.color, // HexColor(AppTheme.primaryColorString!),
            ),
            onPressed: _user == null ? null : logout,
          ),
        ],
        // leading: IconButton(
        //   icon: Icon(
        //       Icons.arrow_back,
        //     color: Theme.of(context).textTheme.headline6!.color, // HexColor(AppTheme.primaryColorString!),
        //   ),
        //   onPressed: _handlePressed(context),// Navigator.of(context).pop(context), //ProfileView(),
        // ),
        // systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text('Rooms'),
        centerTitle: true,
        titleTextStyle: Theme.of(context)
            .textTheme
            // .bodyText2!
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
      body: _user == null
          ? Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(
          bottom: 200,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Not authenticated'),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: const Text('Login'),
            ),
          ],
        ),
      )
          : StreamBuilder<List<types.Room>>(
        stream: FirebaseChatCore.instance.rooms(),
        initialData: const [],
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                bottom: 200,
              ),
              child: const Text('No rooms'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final room = snapshot.data![index];

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChatPage(
                        room: room,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      _buildAvatar(room),
                      Text(room.name ?? ''),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        setState(() {
          _user = user;
        });
      });
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  // {@tool snippet}
  // Typical usage for closing a route is as follows:
  void _handlePressed(BuildContext context) async {
    final navigator = Navigator.of(context);
    navigator.pop();
  }
  Widget _buildAvatar(types.Room room) {
    var color = Colors.transparent;

    if (room.type == types.RoomType.direct) {
      try {
        final otherUser = room.users.firstWhere(
              (u) => u.id != _user!.uid,
        );

        color = getUserAvatarNameColor(otherUser);
      } catch (e) {
        // Do nothing if other user is not found.
      }
    }

    final hasImage = room.imageUrl != null;
    final name = room.name ?? '';

    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: CircleAvatar(
        backgroundColor: hasImage ? Colors.transparent : color,
        backgroundImage: hasImage ? NetworkImage(room.imageUrl!) : null,
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
}
