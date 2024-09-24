import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wibshop/services/services.dart';
import 'package:wibshop/services/user_mode.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, bool>(
  (ref) => AuthNotifier(AuthServices()),
);
