class ApiEndpoints {
  // Base URLs
  // For Android emulator: 10.0.2.2 points to host machine's localhost
  // For iOS simulator: use localhost
  // For physical devices: use your computer's IP address (e.g., http://192.168.1.100:8000/api/v1)
  
  // DEVELOPMENT - Change to your actual backend URL
  // Option 1: Android Emulator (use 10.0.2.2 to access host machine's localhost)
  // static const String baseUrl = 'http://10.0.2.2:8000/api/v1';
  
  // Option 2: iOS Simulator (use localhost)
  // static const String baseUrl = 'http://localhost:8000/api/v1';
  
  // Option 3: Physical Device - Your computer's IP address
  // Update this if your IP address changes
  static const String baseUrl = 'http://192.168.100.39:8000/api/v1';
  
  // PRODUCTION - Replace when deploying
  // static const String baseUrl = 'https://your-production-url.com/api/v1';
  
  // Authentication
  static const String register = '/auth/register';
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  
  // Profile
  static const String profile = '/profile';
  static const String updateProfile = '/profile';
  
  // Feed Posts
  static const String feedPosts = '/feed/posts';
  static String feedPost(int id) => '$feedPosts/$id';
  static String feedPostVote(int id) => '$feedPosts/$id/vote';
  static String feedPostComments(int id) => '$feedPosts/$id/comments';
  
  // Men Posts
  static const String menPosts = '/men/posts';
  static String menPost(int id) => '$menPosts/$id';
  static String menPostFlag(int id) => '$menPosts/$id/flag';
  static String menPostComments(int id) => '$menPosts/$id/comments';
  
  // Alerts
  static const String alerts = '/alerts';
  static String alert(int id) => '$alerts/$id';
  
  // Events
  static const String events = '/events';
  
  // Notifications
  static const String notifications = '/notifications';
  
  // Comments (Generic)
  static const String comments = '/comments';
  static String comment(int id) => '$comments/$id';
  
  // Users
  static const String updateToken = '/users/token';
}

