import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../providers/task_provider.dart';
import 'login_screen.dart';
import 'home_screen.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  String? _loadedForUid;

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    if (auth.status == AuthStatus.unknown) {
      return const Scaffold(
        backgroundColor: Color(0xff1C1C1C),
        body: Center(
          child: CircularProgressIndicator(color: Color(0xffFFEA00)),
        ),
      );
    }

    if (auth.status == AuthStatus.unauthenticated) {
      _loadedForUid = null;
      return const LoginScreen();
    }

    final uid = auth.user!.uid;
    if (_loadedForUid != uid) {
      _loadedForUid = uid;
      // Kick off the per-user task load once, right when we detect a new
      // signed-in user (covers both fresh sign-in and app restart).
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) context.read<TaskProvider>().loadForUser(uid);
      });
    }

    return const HomeScreen();
  }
}
