import 'package:conduit_client/conduit_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model/auth.dart';
import 'model/auth_state.dart';
import 'routing/state.dart';

final currentUserProvider = StateProvider<User?>((_) => null);

final tagsProvider = FutureProvider<List<String>>((ref) {
  return ref.read(_conduitClient).articles.listTags();
});

final articlesProvider = FutureProvider<ArticleList>((ref) {
  return ref
      .watch(_conduitClient)
      .articles
      .listArticles(ref.watch(articlesFilterProvider));
});

final articleProvider = FutureProvider.family<Article, String>((ref, slug) {
  return ref.watch(_conduitClient).articles.getArticle(slug);
});

final articlesFilterProvider =
    StateNotifierProvider<ArticlesFilterNotifier, ArticlesFilter>(
  (_) => ArticlesFilterNotifier(),
);

final _conduitClient = Provider<ConduitClient>((ref) {
  final metadata = <String, String>{};
  final user = ref.watch(currentUserProvider).state;

  if (user != null) {
    metadata['x-auth-token'] = user.token;
  }

  return ConduitClient(Uri.parse('http://localhost:8080'), metadata);
});

final routingProvider = ChangeNotifierProvider((ref) => RoutingState(ref.read));

class ArticlesFilterNotifier extends StateNotifier<ArticlesFilter> {
  ArticlesFilterNotifier() : super(ArticlesFilter.none());

  void none() => state = ArticlesFilter.none();

  void withTag(String tag) => state = ArticlesFilter(FilterKind.tag, tag, 1);

  void withAuthor(String author) =>
      state = ArticlesFilter(FilterKind.author, author, 1);

  void withPage(int page) =>
      state = ArticlesFilter(state.kind, state.value, page);

  void favoritedBy(String author) =>
      state = ArticlesFilter(FilterKind.favoritedBy, author, 1);
}

final auth = StateNotifierProvider<Auth, AuthState>(
    (ref) => Auth(ref.read(_conduitClient), ref.read));

// final articlesModel = ChangeNotifierProvider(
//     (ref) => ArticlesModel(ref.read(_conduitClient), ref.read));
