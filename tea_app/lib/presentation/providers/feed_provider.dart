import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/feed_post.dart';
import '../../data/models/comment.dart';
import '../../data/repositories/feed_repository.dart';
import 'repositories_provider.dart';
part 'feed_provider.g.dart';

@riverpod
Future<FeedPostsResponse> feedPosts(
  FeedPostsRef ref, {
  int page = 1,
  int perPage = 20,
  String sort = 'trending',
}) async {
  final repository = ref.watch(feedRepositoryProvider);
  return await repository.getFeedPosts(
    page: page,
    perPage: perPage,
    sort: sort,
  );
}

@riverpod
Future<FeedPost> feedPost(
  FeedPostRef ref,
  int id,
) async {
  final repository = ref.watch(feedRepositoryProvider);
  return await repository.getFeedPost(id);
}

@riverpod
Future<CommentsResponse> feedPostComments(
  FeedPostCommentsRef ref,
  int postId, {
  int page = 1,
}) async {
  final repository = ref.watch(feedRepositoryProvider);
  return await repository.getFeedPostComments(postId, page: page);
}

