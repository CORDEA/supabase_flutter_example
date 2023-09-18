import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../supabase.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) =>
    UserRepository(ref.watch(supabaseClientProvider));

class UserRepository {
  UserRepository(this._client);

  final SupabaseClient _client;

  Future<FunctionResponse> insert({
    required String emailAddress,
    required String password,
  }) async {
    await _client.auth.signUp(email: emailAddress, password: password);
    return _client.functions.invoke('supabase-initialize-user');
  }
}
