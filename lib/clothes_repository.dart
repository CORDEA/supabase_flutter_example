import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_flutter_example/clothes.dart';
import 'package:supabase_flutter_example/supabase.dart';

part 'clothes_repository.g.dart';

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
}
