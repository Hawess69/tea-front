import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:tea_app/data/services/api_client.dart';
import 'package:tea_app/data/models/user.dart';
import 'package:tea_app/data/models/feed_post.dart';
import 'package:tea_app/data/models/men_post.dart';
import 'package:tea_app/data/models/comment.dart';
import 'package:tea_app/data/models/alert.dart';
import 'package:tea_app/data/models/event.dart';
import 'package:tea_app/data/models/notification.dart';
import 'mocks/mock_storage_service.dart';

void main() {
  // Initialize Flutter binding for platform services
  TestWidgetsFlutterBinding.ensureInitialized();
  
  late ApiClient apiClient;
  late String testEmail;
  late String testPassword;
  String? authToken;
  int? userId;
  int? feedPostId;
  int? menPostId;

  setUp(() async {
    final storageService = MockStorageService();
    apiClient = ApiClient(storageService);
    
    // Generate unique test email
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    testEmail = 'test_$timestamp@example.com';
    testPassword = 'Test1234!@#';
  });

  group('API Integration Tests', () {
    test('1. User Registration', () async {
      print('\n🧪 Testing: User Registration');
      
      try {
        final response = await apiClient.register({
          'name': 'Test User',
          'email': testEmail,
          'password': testPassword,
          'password_confirmation': testPassword,
          'phone': '+1234567890',
        });
        
        expect(response.statusCode, 201);
        expect(response.data, isNotNull);
        expect(response.data['token'], isNotNull);
        expect(response.data['user'], isNotNull);
        
        authToken = response.data['token'];
        userId = response.data['user']['id'];
        
        print('✅ Registration successful!');
        print('   User ID: $userId');
        print('   Token: ${authToken?.substring(0, 20)}...');
      } catch (e) {
        print('❌ Registration failed: $e');
        rethrow;
      }
    });

    test('2. User Login', () async {
      print('\n🧪 Testing: User Login');
      
      try {
        final response = await apiClient.login({
          'email': testEmail,
          'password': testPassword,
        });
        
        expect(response.statusCode, 200);
        expect(response.data, isNotNull);
        expect(response.data['token'], isNotNull);
        expect(response.data['user'], isNotNull);
        
        authToken = response.data['token'];
        
        print('✅ Login successful!');
        print('   User: ${response.data['user']['name']}');
      } catch (e) {
        print('❌ Login failed: $e');
        rethrow;
      }
    });

    test('3. Get User Profile', () async {
      print('\n🧪 Testing: Get User Profile');
      
      try {
        final response = await apiClient.getProfile();
        
        expect(response.statusCode, 200);
        expect(response.data, isNotNull);
        expect(response.data['user'], isNotNull);
        
        print('✅ Get profile successful!');
        print('   Email: ${response.data['user']['email']}');
      } catch (e) {
        print('❌ Get profile failed: $e');
        rethrow;
      }
    });

    test('4. Update User Profile', () async {
      print('\n🧪 Testing: Update User Profile');
      
      try {
        final response = await apiClient.updateProfile(
          name: 'Updated Test User',
          phone: '+0987654321',
        );
        
        expect(response.statusCode, 200);
        expect(response.data, isNotNull);
        
        print('✅ Update profile successful!');
        print('   Updated name: ${response.data['user']['name']}');
      } catch (e) {
        print('❌ Update profile failed: $e');
        rethrow;
      }
    });

    test('5. Get Feed Posts', () async {
      print('\n🧪 Testing: Get Feed Posts');
      
      try {
        final response = await apiClient.getFeedPosts(page: 1, perPage: 10);
        
        expect(response.statusCode, 200);
        expect(response.data, isNotNull);
        
        print('✅ Get feed posts successful!');
        print('   Posts count: ${response.data['posts']?.length ?? 0}');
        
        if (response.data['posts'] != null && (response.data['posts'] as List).isNotEmpty) {
          feedPostId = response.data['posts'][0]['id'];
          print('   First post ID: $feedPostId');
        }
      } catch (e) {
        print('❌ Get feed posts failed: $e');
        rethrow;
      }
    });

    test('6. Create Feed Post (without image)', () async {
      print('\n🧪 Testing: Create Feed Post');
      
      try {
        final response = await apiClient.createFeedPost(
          title: 'Test Feed Post Title',
          body: 'This is a test feed post content from automated testing.',
        );
        
        expect(response.statusCode, 201);
        expect(response.data, isNotNull);
        expect(response.data['post'], isNotNull);
        
        feedPostId = response.data['post']['id'];
        
        print('✅ Create feed post successful!');
        print('   Post ID: $feedPostId');
        print('   Title: ${response.data['post']['title']}');
      } catch (e) {
        print('❌ Create feed post failed: $e');
        rethrow;
      }
    });

    test('7. Get Single Feed Post', () async {
      print('\n🧪 Testing: Get Single Feed Post');
      
      if (feedPostId == null) {
        print('⏭️ Skipping: No feed post ID available');
        return;
      }
      
      try {
        final response = await apiClient.getFeedPost(feedPostId!);
        
        expect(response.statusCode, 200);
        expect(response.data, isNotNull);
        expect(response.data['post'], isNotNull);
        
        print('✅ Get single feed post successful!');
        print('   Post ID: ${response.data['post']['id']}');
      } catch (e) {
        print('❌ Get single feed post failed: $e');
        rethrow;
      }
    });

    test('8. Vote on Feed Post', () async {
      print('\n🧪 Testing: Vote on Feed Post');
      
      if (feedPostId == null) {
        print('⏭️ Skipping: No feed post ID available');
        return;
      }
      
      try {
        final response = await apiClient.voteFeedPost(feedPostId!, 'up');
        
        expect(response.statusCode, 200);
        expect(response.data, isNotNull);
        
        print('✅ Vote on feed post successful!');
        print('   Upvotes: ${response.data['upvotes']}');
        print('   Downvotes: ${response.data['downvotes']}');
      } catch (e) {
        print('❌ Vote on feed post failed: $e');
        rethrow;
      }
    });

    test('9. Add Comment to Feed Post', () async {
      print('\n🧪 Testing: Add Comment to Feed Post');
      
      if (feedPostId == null) {
        print('⏭️ Skipping: No feed post ID available');
        return;
      }
      
      try {
        final response = await apiClient.addFeedPostComment(
          feedPostId!,
          'This is a test comment from automated testing.',
        );
        
        expect(response.statusCode, 201);
        expect(response.data, isNotNull);
        
        print('✅ Add comment successful!');
        print('   Comment ID: ${response.data['comment']['id']}');
      } catch (e) {
        print('❌ Add comment failed: $e');
        rethrow;
      }
    });

    test('10. Get Men Posts', () async {
      print('\n🧪 Testing: Get Men Posts');
      
      try {
        final response = await apiClient.getMenPosts(page: 1, perPage: 10);
        
        expect(response.statusCode, 200);
        expect(response.data, isNotNull);
        
        print('✅ Get men posts successful!');
        print('   Posts count: ${response.data['posts']?.length ?? 0}');
        
        if (response.data['posts'] != null && (response.data['posts'] as List).isNotEmpty) {
          menPostId = response.data['posts'][0]['id'];
          print('   First post ID: $menPostId');
        }
      } catch (e) {
        print('❌ Get men posts failed: $e');
        rethrow;
      }
    });

    test('11. Create Men Post (without image)', () async {
      print('\n🧪 Testing: Create Men Post');
      
      try {
        final response = await apiClient.createMenPost(
          fullName: 'Test Person Name',
          city: 'Test City',
          caption: 'This is a test men post caption from automated testing. Be careful with this person.',
          tags: ['test', 'automated'],
        );
        
        expect(response.statusCode, 201);
        expect(response.data, isNotNull);
        expect(response.data['post'], isNotNull);
        
        menPostId = response.data['post']['id'];
        
        print('✅ Create men post successful!');
        print('   Post ID: $menPostId');
        print('   Full name: ${response.data['post']['full_name']}');
      } catch (e) {
        print('❌ Create men post failed: $e');
        rethrow;
      }
    });

    test('12. Get Single Men Post', () async {
      print('\n🧪 Testing: Get Single Men Post');
      
      if (menPostId == null) {
        print('⏭️ Skipping: No men post ID available');
        return;
      }
      
      try {
        final response = await apiClient.getMenPost(menPostId!);
        
        expect(response.statusCode, 200);
        expect(response.data, isNotNull);
        expect(response.data['post'], isNotNull);
        
        print('✅ Get single men post successful!');
        print('   Post ID: ${response.data['post']['id']}');
      } catch (e) {
        print('❌ Get single men post failed: $e');
        rethrow;
      }
    });

    test('13. Flag Men Post', () async {
      print('\n🧪 Testing: Flag Men Post');
      
      if (menPostId == null) {
        print('⏭️ Skipping: No men post ID available');
        return;
      }
      
      try {
        final response = await apiClient.flagMenPost(menPostId!, 'red');
        
        expect(response.statusCode, 200);
        expect(response.data, isNotNull);
        
        print('✅ Flag men post successful!');
        print('   Red flags: ${response.data['red_flags']}');
        print('   Green flags: ${response.data['green_flags']}');
      } catch (e) {
        print('❌ Flag men post failed: $e');
        rethrow;
      }
    });

    test('14. Add Comment to Men Post', () async {
      print('\n🧪 Testing: Add Comment to Men Post');
      
      if (menPostId == null) {
        print('⏭️ Skipping: No men post ID available');
        return;
      }
      
      try {
        final response = await apiClient.addMenPostComment(
          menPostId!,
          'This is a test comment on a men post.',
        );
        
        expect(response.statusCode, 201);
        expect(response.data, isNotNull);
        
        print('✅ Add comment to men post successful!');
        print('   Comment ID: ${response.data['comment']['id']}');
      } catch (e) {
        print('❌ Add comment to men post failed: $e');
        rethrow;
      }
    });

    test('15. Create Alert', () async {
      print('\n🧪 Testing: Create Alert');
      
      try {
        final response = await apiClient.createAlert('Test Person Alert');
        
        expect(response.statusCode, 201);
        expect(response.data, isNotNull);
        expect(response.data['alert'], isNotNull);
        
        print('✅ Create alert successful!');
        print('   Alert ID: ${response.data['alert']['id']}');
        print('   Name to track: ${response.data['alert']['name_to_track']}');
      } catch (e) {
        print('❌ Create alert failed: $e');
        rethrow;
      }
    });

    test('16. Get Alerts', () async {
      print('\n🧪 Testing: Get Alerts');
      
      try {
        final response = await apiClient.getAlerts();
        
        expect(response.statusCode, 200);
        expect(response.data, isNotNull);
        expect(response.data['alerts'], isNotNull);
        
        print('✅ Get alerts successful!');
        print('   Alerts count: ${response.data['alerts']?.length ?? 0}');
      } catch (e) {
        print('❌ Get alerts failed: $e');
        rethrow;
      }
    });

    test('17. Get Events', () async {
      print('\n🧪 Testing: Get Events');
      
      try {
        final response = await apiClient.getEvents(page: 1, perPage: 10);
        
        expect(response.statusCode, 200);
        expect(response.data, isNotNull);
        
        print('✅ Get events successful!');
        print('   Events count: ${response.data['events']?.length ?? 0}');
      } catch (e) {
        print('❌ Get events failed: $e');
        rethrow;
      }
    });

    test('18. Get Notifications', () async {
      print('\n🧪 Testing: Get Notifications');
      
      try {
        final response = await apiClient.getNotifications(page: 1, perPage: 10);
        
        expect(response.statusCode, 200);
        expect(response.data, isNotNull);
        
        print('✅ Get notifications successful!');
        print('   Notifications count: ${response.data['notifications']?.length ?? 0}');
      } catch (e) {
        print('❌ Get notifications failed: $e');
        rethrow;
      }
    });

    test('19. Get Feed Post Comments', () async {
      print('\n🧪 Testing: Get Feed Post Comments');
      
      if (feedPostId == null) {
        print('⏭️ Skipping: No feed post ID available');
        return;
      }
      
      try {
        final response = await apiClient.getFeedPostComments(feedPostId!, page: 1);
        
        expect(response.statusCode, 200);
        expect(response.data, isNotNull);
        
        print('✅ Get feed post comments successful!');
        print('   Comments count: ${response.data['comments']?.length ?? 0}');
      } catch (e) {
        print('❌ Get feed post comments failed: $e');
        rethrow;
      }
    });

    test('20. Get Men Post Comments', () async {
      print('\n🧪 Testing: Get Men Post Comments');
      
      if (menPostId == null) {
        print('⏭️ Skipping: No men post ID available');
        return;
      }
      
      try {
        final response = await apiClient.getMenPostComments(menPostId!, page: 1);
        
        expect(response.statusCode, 200);
        expect(response.data, isNotNull);
        
        print('✅ Get men post comments successful!');
        print('   Comments count: ${response.data['comments']?.length ?? 0}');
      } catch (e) {
        print('❌ Get men post comments failed: $e');
        rethrow;
      }
    });
  });

  tearDown(() {
    print('\n🧹 Test cleanup completed');
  });
}
