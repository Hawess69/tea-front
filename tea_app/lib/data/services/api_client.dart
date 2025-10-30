import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../core/constants/api_endpoints.dart';
import 'storage_service.dart';
import 'storage_interface.dart';

class ApiClient {
  late final Dio _dio;
  final StorageInterface _storageService;

  ApiClient(this._storageService) {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _storageService.getAuthToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (error, handler) {
          if (error.response?.statusCode == 401) {
            // Handle unauthorized - should logout
            _storageService.clearAuthToken();
          }
          return handler.next(error);
        },
      ),
    );

    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
    ));
  }

  // Auth endpoints
  Future<Response> register(Map<String, dynamic> data) async {
    return await _dio.post(ApiEndpoints.register, data: data);
  }

  Future<Response> login(Map<String, dynamic> data) async {
    return await _dio.post(ApiEndpoints.login, data: data);
  }

  Future<Response> getProfile() async {
    return await _dio.get(ApiEndpoints.profile);
  }

  Future<Response> updateProfile({
    String? name,
    String? phone,
    String? avatar,
  }) async {
    final data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (phone != null) data['phone'] = phone;
    if (avatar != null) data['avatar'] = avatar;
    
    return await _dio.put(ApiEndpoints.updateProfile, data: data);
  }

  // Feed posts endpoints
  Future<Response> getFeedPosts({
    int page = 1,
    int perPage = 15,
    String sort = 'trending',
  }) async {
    return await _dio.get(
      ApiEndpoints.feedPosts,
      queryParameters: {
        'page': page,
        'per_page': perPage,
        'sort': sort,
      },
    );
  }

  Future<Response> createFeedPost({
    required String title,
    required String body,
    String? imagePath,
  }) async {
    if (imagePath != null) {
      // Multipart request for image upload
      final formData = FormData.fromMap({
        'title': title,
        'body': body,
        'image': await MultipartFile.fromFile(imagePath),
      });
      return await _dio.post(ApiEndpoints.feedPosts, data: formData);
    } else {
      // JSON request without image
      return await _dio.post(
        ApiEndpoints.feedPosts,
        data: {'title': title, 'body': body},
      );
    }
  }

  Future<Response> getFeedPost(int id) async {
    return await _dio.get(ApiEndpoints.feedPost(id));
  }

  Future<Response> voteFeedPost(int id, String voteType) async {
    return await _dio.post(
      ApiEndpoints.feedPostVote(id),
      data: {'vote_type': voteType},
    );
  }

  Future<Response> getFeedPostComments(int id, {int page = 1}) async {
    return await _dio.get(
      ApiEndpoints.feedPostComments(id),
      queryParameters: {'page': page},
    );
  }

  Future<Response> addFeedPostComment(int id, String body) async {
    return await _dio.post(
      ApiEndpoints.feedPostComments(id),
      data: {'body': body},
    );
  }

  // Men posts endpoints
  Future<Response> getMenPosts({
    int page = 1,
    int perPage = 15,
    String? city,
    String? tags,
    String? name,
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      'per_page': perPage,
    };
    if (city != null) queryParams['city'] = city;
    if (tags != null) queryParams['tags'] = tags;
    if (name != null) queryParams['name'] = name;

    return await _dio.get(
      ApiEndpoints.menPosts,
      queryParameters: queryParams,
    );
  }

  Future<Response> createMenPost({
    required String fullName,
    required String city,
    required String caption,
    List<String>? tags,
    String? imagePath,
  }) async {
    if (imagePath != null) {
      // Multipart request for image upload
      final formData = FormData.fromMap({
        'full_name': fullName,
        'city': city,
        'caption': caption,
        if (tags != null && tags.isNotEmpty)
          'tags[]': tags, // Laravel expects tags[] for array in multipart
        'image': await MultipartFile.fromFile(imagePath),
      });
      return await _dio.post(ApiEndpoints.menPosts, data: formData);
    } else {
      // JSON request without image
      return await _dio.post(
        ApiEndpoints.menPosts,
        data: {
          'full_name': fullName,
          'city': city,
          'caption': caption,
          if (tags != null && tags.isNotEmpty) 'tags': tags,
        },
      );
    }
  }

  Future<Response> getMenPost(int id) async {
    return await _dio.get(ApiEndpoints.menPost(id));
  }

  Future<Response> flagMenPost(int id, String flagType) async {
    return await _dio.post(
      ApiEndpoints.menPostFlag(id),
      data: {'flag_type': flagType},
    );
  }

  Future<Response> getMenPostComments(int id, {int page = 1}) async {
    return await _dio.get(
      ApiEndpoints.menPostComments(id),
      queryParameters: {'page': page},
    );
  }

  Future<Response> addMenPostComment(int id, String body) async {
    return await _dio.post(
      ApiEndpoints.menPostComments(id),
      data: {'body': body},
    );
  }

  // Alerts endpoints
  Future<Response> getAlerts() async {
    return await _dio.get(ApiEndpoints.alerts);
  }

  Future<Response> createAlert(String nameToTrack) async {
    return await _dio.post(
      ApiEndpoints.alerts,
      data: {'name_to_track': nameToTrack},
    );
  }

  Future<Response> deleteAlert(int id) async {
    return await _dio.delete(ApiEndpoints.alert(id));
  }

  // Events endpoints
  Future<Response> getEvents({
    int page = 1,
    int perPage = 20,
    bool upcoming = true,
  }) async {
    return await _dio.get(
      ApiEndpoints.events,
      queryParameters: {
        'page': page,
        'per_page': perPage,
        'upcoming': upcoming,
      },
    );
  }

  // Notifications endpoints
  Future<Response> getNotifications({
    int page = 1,
    int perPage = 20,
  }) async {
    return await _dio.get(
      ApiEndpoints.notifications,
      queryParameters: {
        'page': page,
        'per_page': perPage,
      },
    );
  }

  // Generic Comments endpoints
  Future<Response> getComment(int id) async {
    return await _dio.get(ApiEndpoints.comment(id));
  }

  Future<Response> updateComment(int id, String body) async {
    return await _dio.put(
      ApiEndpoints.comment(id),
      data: {'body': body},
    );
  }

  Future<Response> deleteComment(int id) async {
    return await _dio.delete(ApiEndpoints.comment(id));
  }

  // Update device token
  Future<Response> updateDeviceToken(String token) async {
    return await _dio.post(
      ApiEndpoints.updateToken,
      data: {'device_token': token},
    );
  }
}

