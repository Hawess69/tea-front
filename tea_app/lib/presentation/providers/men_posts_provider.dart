import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/men_post.dart';
import '../../data/models/comment.dart';
import '../../data/repositories/men_posts_repository.dart';
import 'repositories_provider.dart';
part 'men_posts_provider.g.dart';

@riverpod
Future<MenPostsResponse> menPosts(
  MenPostsRef ref, {
  int page = 1,
  int perPage = 20,
  String? city,
  String? tags,
  String? searchName,
}) async {
  final repository = ref.watch(menPostsRepositoryProvider);
  return await repository.getMenPosts(
    page: page,
    perPage: perPage,
    city: city,
    tags: tags,
    name: searchName,
  );
}

@riverpod
Future<MenPost> menPost(
  MenPostRef ref,
  int id,
) async {
  final repository = ref.watch(menPostsRepositoryProvider);
  return await repository.getMenPost(id);
}

@riverpod
Future<CommentsResponse> menPostComments(
  MenPostCommentsRef ref,
  int postId, {
  int page = 1,
}) async {
  final repository = ref.watch(menPostsRepositoryProvider);
  return await repository.getMenPostComments(postId, page: page);
}

