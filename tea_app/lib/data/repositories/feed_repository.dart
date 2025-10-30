import '../models/feed_post.dart';
import '../models/comment.dart';
import '../services/api_client.dart';

class FeedRepository {
  final ApiClient _apiClient;

  FeedRepository(this._apiClient);

  Future<FeedPostsResponse> getFeedPosts({
    int page = 1,
    int perPage = 20,
    String sort = 'trending',
  }) async {
    try {
      final response = await _apiClient.getFeedPosts(
        page: page,
        perPage: perPage,
        sort: sort,
      );
      return FeedPostsResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to get feed posts: ${e.toString()}');
    }
  }

  Future<FeedPost> createFeedPost({
    required String title,
    required String body,
    String? imagePath,
  }) async {
    try {
      final response = await _apiClient.createFeedPost(
        title: title,
        body: body,
        imagePath: imagePath,
      );
      final data = response.data as Map<String, dynamic>;
      return FeedPost.fromJson(data['post']);
    } catch (e) {
      throw Exception('Failed to create feed post: ${e.toString()}');
    }
  }

  Future<FeedPost> getFeedPost(int id) async {
    try {
      final response = await _apiClient.getFeedPost(id);
      final data = response.data as Map<String, dynamic>;
      return FeedPost.fromJson(data['post']);
    } catch (e) {
      throw Exception('Failed to get feed post: ${e.toString()}');
    }
  }

  Future<Map<String, dynamic>> voteFeedPost(int id, String voteType) async {
    try {
      final response = await _apiClient.voteFeedPost(id, voteType);
      return {
        'upvotes': response.data['upvotes'],
        'downvotes': response.data['downvotes'],
        'message': response.data['message'],
      };
    } catch (e) {
      throw Exception('Failed to vote on feed post: ${e.toString()}');
    }
  }

  Future<CommentsResponse> getFeedPostComments(int id, {int page = 1}) async {
    try {
      final response = await _apiClient.getFeedPostComments(id, page: page);
      return CommentsResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to get comments: ${e.toString()}');
    }
  }

  Future<Comment> addFeedPostComment(int id, String body) async {
    try {
      final response = await _apiClient.addFeedPostComment(id, body);
      final data = response.data as Map<String, dynamic>;
      return Comment.fromJson(data['comment']);
    } catch (e) {
      throw Exception('Failed to add comment: ${e.toString()}');
    }
  }
}
