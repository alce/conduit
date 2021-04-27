import 'package:conduit_client/conduit_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model/auth.dart';
import 'model/auth_state.dart';

final currentUser = StateProvider<User?>((_) => null);

final conduitClient = Provider<ConduitClient>((ref) {
  final metadata = <String, String>{};
  final user = ref.watch(currentUser).state;

  if (user != null) {
    metadata['x-auth-token'] = user.token;
  }

  return ConduitClient(Uri.parse('http://localhost:8080'), metadata);
});

final articles = FutureProvider<ArticleList>((ref) {
  final filter = ref.watch(articlesFilter).state;
  return ref.watch(conduitClient).articles.listArticles(filter);
});

final tags = FutureProvider<List<String>>((ref) {
  return ref.watch(conduitClient).articles.listTags();
});

final articlesFilter = StateProvider((_) => ArticlesFilter.none());

final auth = StateNotifierProvider<Auth, AuthState>(
    (ref) => Auth(ref.read(conduitClient), ref.read));
