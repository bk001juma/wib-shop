import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wibSHOP/services/services.dart';
import 'package:wibSHOP/services/user_mode.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, bool>(
  (ref) => AuthNotifier(AuthServices()),
);
