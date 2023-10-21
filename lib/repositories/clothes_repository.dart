import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../entities/clothes.dart';
import '../supabase.dart';

part 'clothes_repository.g.dart';

const uuid = Uuid();

@riverpod
ClothesRepository clothesRepository(ClothesRepositoryRef ref) =>
    ClothesRepository(ref.watch(supabaseClientProvider));

class ClothesRepository {
  ClothesRepository(this._client);

  final SupabaseClient _client;

  Future<List<Clothes>> findAll() async {
    final items = await _client.from('clothes').select<PostgrestList>();
    return items.map((e) => Clothes.fromMap(e)).toList(growable: false);
  }

  Future<void> insert(Clothes clothes) async {
    await _client.from('clothes').insert(clothes.toMap());
  }

  Future<String> insertThumbnail(File file) async {
    final user = _client.auth.currentUser;
    if (user == null) {
      throw const AuthException('User not found.');
    }
    final id = uuid.v4();
    await _client.storage
        .from('images')
        .upload('${user.id}/$id', file);
    return id;
  }
}
