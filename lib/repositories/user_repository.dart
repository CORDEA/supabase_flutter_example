import 'dart:io';
import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../entities/user.dart' as u;
import '../supabase.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) =>
    UserRepository(ref.watch(supabaseClientProvider));

class UserRepository {
  UserRepository(this._client);

  final SupabaseClient _client;
  static const _thumbnailId = 'thumbnail';

  Future<u.User> find() async {
    final user = _client.auth.currentUser;
    if (user == null) {
      throw const AuthException('User not found.');
    }
    final userInfo = await _client
        .from('users')
        .select<PostgrestMap>()
        .eq('id', user.id)
        .single();
    return u.User.fromMap(userInfo);
  }

  Future<Uint8List> findThumbnail() {
    final user = _client.auth.currentUser;
    if (user == null) {
      throw const AuthException('User not found.');
    }
    return _client.storage.from('users').download('${user.id}/$_thumbnailId');
  }

  Future<FunctionResponse> insert({
    required String emailAddress,
    required String password,
  }) async {
    await _client.auth.signUp(email: emailAddress, password: password);
    return _client.functions.invoke('supabase-initialize-user');
  }

  Future<void> insertThumbnail(File file) async {
    final user = _client.auth.currentUser;
    if (user == null) {
      throw const AuthException('User not found.');
    }
    await _client.storage
        .from('users')
        .upload('${user.id}/$_thumbnailId', file);
  }

  Future<FunctionResponse> delete() {
    return _client.functions.invoke('supabase-delete-user');
  }
}
