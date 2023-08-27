import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as s;

final supabaseClientProvider = Provider((ref) {
  return s.Supabase.instance.client;
});
