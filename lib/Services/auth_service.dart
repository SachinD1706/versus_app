import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await Supabase.instance.client.auth.signUp(
      email: email,
      password: password,
    );

    await Supabase.instance.client.from('profiles').insert({
      'id': response.user!.id,
      'username': username,
    });
  }
}
