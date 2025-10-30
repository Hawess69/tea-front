import '../models/men_post.dart';
import '../models/comment.dart';
import '../services/api_client.dart';

class MenPostsRepository {
  final ApiClient _apiClient;

  MenPostsRepository(this._apiClient);

  Future<MenPostsResponse> getMenPosts({
    int page = 1,
    int perPage = 20,
    String? city,
    String? tags,
    String? name,
  }) async {
    try {
      final response = await _apiClient.getMenPosts(
        page: page,
        perPage: perPage,
        city: city,
        tags: tags,
        name: name,
      );
      return MenPostsResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to get men posts: ${e.toString()}');
    }
  }

  Future<MenPost> createMenPost({
    required String fullName,
    required String city,
    required String caption,
    List<String>? tags,
    String? imagePath,
  }) async {
    try {
      final response = await _apiClient.createMenPost(
        fullName: fullName,
        city: city,
        caption: caption,
        tags: tags,
        imagePath: imagePath,
      );
      final data = response.data as Map<String, dynamic>;
      return MenPost.fromJson(data['post']);
    } catch (e) {
      throw Exception('Failed to create men post: ${e.toString()}');
    }
  }

  Future<MenPost> getMenPost(int id) async {
    try {
      final response = await _apiClient.getMenPost(id);
      final data = response.data as Map<String, dynamic>;
      return MenPost.fromJson(data['post']);
    } catch (e) {
      throw Exception('Failed to get men post: ${e.toString()}');
    }
  }

  Future<Map<String, dynamic>> flagMenPost(int id, String flagType) async {
    try {
      final response = await _apiClient.flagMenPost(id, flagType);
      return {
        'red_flags': response.data['red_flags'],
        'green_flags': response.data['green_flags'],
        'neutral_flags': response.data['neutral_flags'],
        'message': response.data['message'],
      };
    } catch (e) {
      throw Exception('Failed to flag men post: ${e.toString()}');
    }
  }

  Future<CommentsResponse> getMenPostComments(int id, {int page = 1}) async {
    try {
      final response = await _apiClient.getMenPostComments(id, page: page);
      return CommentsResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to get comments: ${e.toString()}');
    }
  }

  Future<Comment> addMenPostComment(int id, String body) async {
    try {
      final response = await _apiClient.addMenPostComment(id, body);
      final data = response.data as Map<String, dynamic>;
      return Comment.fromJson(data['comment']);
    } catch (e) {
      throw Exception('Failed to add comment: ${e.toString()}');
    }
  }
}
