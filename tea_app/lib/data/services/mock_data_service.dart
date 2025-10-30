import '../models/user.dart';
import '../models/feed_post.dart';
import '../models/men_post.dart';
import '../models/comment.dart';

class MockDataService {
  static List<User> getMockUsers() {
    return [
      User(
        id: 1,
        name: 'Sarah Johnson',
        email: 'sarah@example.com',
        phone: '+1234567890',
        role: 'user',
        status: 'active',
        avatar: null,
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
      ),
      User(
        id: 2,
        name: 'Emily Chen',
        email: 'emily@example.com',
        phone: '+1234567891',
        role: 'user',
        status: 'active',
        avatar: null,
        createdAt: DateTime.now().subtract(const Duration(days: 15)),
      ),
      User(
        id: 3,
        name: 'Maria Garcia',
        email: 'maria@example.com',
        phone: '+1234567892',
        role: 'user',
        status: 'active',
        avatar: null,
        createdAt: DateTime.now().subtract(const Duration(days: 7)),
      ),
    ];
  }

  static List<FeedPost> getMockFeedPosts() {
    final users = getMockUsers();
    return [
      FeedPost(
        id: 1,
        title: 'Best dating safety tips',
        body: 'I wanted to share some safety tips that have worked really well for me when meeting new people. Always meet in public first, trust your instincts, and let someone know where you are.',
        imageUrl: null,
        upvotes: 45,
        downvotes: 2,
        commentsCount: 12,
        user: users[0],
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      ),
      FeedPost(
        id: 2,
        title: 'How to spot red flags early',
        body: 'After going through some tough experiences, I learned to recognize red flags early. Here are the warning signs I wish I knew before...',
        imageUrl: null,
        upvotes: 78,
        downvotes: 5,
        commentsCount: 23,
        user: users[1],
        createdAt: DateTime.now().subtract(const Duration(hours: 10)),
      ),
      FeedPost(
        id: 3,
        title: 'Community support group',
        body: 'Anyone interested in starting a weekly support group? We could meet up and share experiences in a safe space.',
        imageUrl: null,
        upvotes: 120,
        downvotes: 1,
        commentsCount: 45,
        user: users[2],
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      FeedPost(
        id: 4,
        title: 'Online dating advice',
        body: 'Looking for advice on how to stay safe while dating online. What platforms do you trust?',
        imageUrl: null,
        upvotes: 34,
        downvotes: 3,
        commentsCount: 18,
        user: users[0],
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      FeedPost(
        id: 5,
        title: 'Building confidence after bad experiences',
        body: 'It\'s been tough to get back into dating after what happened. How do you rebuild that confidence and trust?',
        imageUrl: null,
        upvotes: 92,
        downvotes: 0,
        commentsCount: 56,
        user: users[1],
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
    ];
  }

  static List<MenPost> getMockMenPosts() {
    final users = getMockUsers();
    return [
      MenPost(
        id: 1,
        fullName: 'John Smith',
        city: 'New York, NY',
        tags: ['gym', 'instagram', 'clubs'],
        caption: 'Met him at a party downtown. Initially seemed nice but showed concerning behavior after a few drinks. Be careful if you encounter him at nightlife events.',
        photoUrl: null,
        flagCounts: FlagCounts(red: 8, green: 2, neutral: 1),
        user: users[0],
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      MenPost(
        id: 2,
        fullName: 'Michael Johnson',
        city: 'Los Angeles, CA',
        tags: ['dating app', 'bars'],
        caption: 'Was set up through friends but turned out to be someone else entirely. Catfished with fake photos. Avoid!',
        photoUrl: null,
        flagCounts: FlagCounts(red: 15, green: 0, neutral: 0),
        user: users[1],
        createdAt: DateTime.now().subtract(const Duration(hours: 6)),
      ),
      MenPost(
        id: 3,
        fullName: 'David Williams',
        city: 'Chicago, IL',
        tags: ['workplace', 'professional'],
        caption: 'Coworker who crossed multiple boundaries. Unwanted advances and inappropriate comments. HR was notified.',
        photoUrl: null,
        flagCounts: FlagCounts(red: 22, green: 1, neutral: 3),
        user: users[2],
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      MenPost(
        id: 4,
        fullName: 'James Brown',
        city: 'Miami, FL',
        tags: ['dating app', 'beach', 'vacation'],
        caption: 'Seemed charming on the app but completely different in person. Very aggressive and disrespectful when I said I wasn\'t interested.',
        photoUrl: null,
        flagCounts: FlagCounts(red: 12, green: 0, neutral: 2),
        user: users[0],
        createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 12)),
      ),
      MenPost(
        id: 5,
        fullName: 'Robert Davis',
        city: 'Austin, TX',
        tags: ['bars', 'music venues'],
        caption: 'Met at a concert. At first seemed respectful but later sent inappropriate messages and got angry when I didn\'t respond immediately.',
        photoUrl: null,
        flagCounts: FlagCounts(red: 19, green: 3, neutral: 1),
        user: users[1],
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ];
  }

  static List<Comment> getMockComments() {
    final users = getMockUsers();
    return [
      Comment(
        id: 1,
        body: 'Thanks for sharing this information. It\'s so important to stay alert and look out for each other.',
        user: users[0],
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      Comment(
        id: 2,
        body: 'I had a similar experience. It\'s good that you\'re raising awareness.',
        user: users[1],
        createdAt: DateTime.now().subtract(const Duration(hours: 30)),
      ),
      Comment(
        id: 3,
        body: 'Stay safe everyone! Always trust your instincts.',
        user: users[2],
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];
  }

  static List<String> getForumCategories() {
    return [
      'General Discussion',
      'Safety & Awareness',
      'Dating Advice',
      'Support & Recovery',
      'Events & Meetups',
      'Resources & Tools',
    ];
  }

  static List<Map<String, dynamic>> getMockEvents() {
    return [
      {
        'id': 1,
        'title': 'Community Safety Workshop',
        'description': 'Learn about personal safety strategies and support resources available in our community.',
        'date': DateTime.now().add(const Duration(days: 7)),
        'location': 'Community Center, Downtown',
        'attendees': 45,
      },
      {
        'id': 2,
        'title': 'Weekly Support Group Meetup',
        'description': 'A safe space to share experiences and support each other.',
        'date': DateTime.now().add(const Duration(days: 3)),
        'location': 'Online via Zoom',
        'attendees': 23,
      },
      {
        'id': 3,
        'title': 'Self-Defense Workshop',
        'description': 'Learn basic self-defense techniques with certified instructors.',
        'date': DateTime.now().add(const Duration(days: 14)),
        'location': 'Martial Arts Studio',
        'attendees': 18,
      },
    ];
  }
}

