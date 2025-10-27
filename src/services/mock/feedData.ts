import { FeedPost, FeedPostComment } from '../../types';

// Mock data generator for Community Feed Posts
const AUTHORS = [
  { name: 'Sarah Ahmed', avatar: 'https://i.pravatar.cc/150?img=1' },
  { name: 'Nour Hassan', avatar: 'https://i.pravatar.cc/150?img=5' },
  { name: 'Layla Ibrahim', avatar: 'https://i.pravatar.cc/150?img=9' },
  { name: 'Yasmin Ali', avatar: 'https://i.pravatar.cc/150?img=20' },
  { name: 'Hana Khalil', avatar: 'https://i.pravatar.cc/150?img=23' },
  { name: 'Mariam Sayed', avatar: 'https://i.pravatar.cc/150?img=25' },
  { name: 'Amira Fathy', avatar: 'https://i.pravatar.cc/150?img=29' },
  { name: 'Salma Nabil', avatar: 'https://i.pravatar.cc/150?img=32' },
  { name: 'Lina Mostafa', avatar: 'https://i.pravatar.cc/150?img=38' },
  { name: 'Dina Rashid', avatar: 'https://i.pravatar.cc/150?img=44' },
];

const TITLES = [
  'Looking for recommendations for self-defense classes',
  'What are your thoughts on workplace harassment policies?',
  'Tips for staying safe while traveling alone?',
  'How do you handle unwanted attention in public spaces?',
  'Gym safety tips everyone should know',
  'Best apps for personal safety?',
  'How to support a friend who\'s been harassed?',
  'Dealing with online harassment - seeking advice',
  'Safe coffee shops to work from in Cairo?',
  'Red flags to watch out for when dating',
  'Women-only fitness centers - pros and cons?',
  'How to set boundaries with pushy colleagues',
  'Local support groups and communities',
  'Safety precautions when using ride-sharing apps',
  'How to report harassment effectively',
  'Building confidence after a bad experience',
  'Self-care tips for dealing with stress',
  'Recommendations for therapists/counselors',
  'Creating a safety plan - what to include?',
  'Empowering stories of standing up for yourself',
  'Legal rights everyone should know about',
  'How to trust your instincts better',
  'Safety tips for night shifts',
  'Dealing with catcalling - what works?',
  'Community events and meetups',
  'Starting a safety awareness group',
  'Mental health resources and support',
  'How to spot manipulative behavior',
  'Self-defense vs situational awareness',
  'Stories of solidarity and support',
];

const BODY_TEXTS = [
  'I\'ve been thinking about taking self-defense classes but not sure where to start. Has anyone here taken classes they\'d recommend? Looking for something practical and women-focused.',
  'There\'s been a lot of discussion at my workplace about updating our harassment policies. What has worked well at your companies? What should be included?',
  'Planning a solo trip soon and want to make sure I\'m as prepared as possible. What are your essential safety tips and precautions?',
  'This has happened to me multiple times recently and I\'m tired of it. How do you all handle this kind of situation? What has worked for you?',
  'After a concerning incident at my gym, I wanted to start a discussion about safety measures. What should gyms be doing to keep members safe?',
  'There are so many safety apps out there. Which ones do you actually use and find helpful? Looking for recommendations.',
  'A close friend recently opened up to me about harassment. I want to be supportive but I\'m not sure what to say or do. Any advice?',
  'The online harassment has been getting worse. How do you protect yourself? What platforms or strategies have helped you?',
  'Working remotely and looking for safe, comfortable spaces to work from. Any recommendations in the Cairo area?',
  'What are the early warning signs you\'ve learned to recognize? Sharing experiences might help others avoid bad situations.',
  'Considering switching to a women-only gym. For those who have, what\'s your experience? Is it worth it?',
  'There\'s a colleague who just doesn\'t respect my no. It\'s becoming uncomfortable. How have you handled similar situations professionally?',
  'Looking to connect with other women in the area. Are there any active support groups or communities you\'d recommend?',
  'Using Uber/Careem late at night - what precautions do you take? What features do you use to stay safe?',
  'I want to report an incident but I\'m not sure how to do it effectively. Has anyone been through this process? What should I know?',
  'Slowly rebuilding my confidence after a difficult experience. What helped you? Looking for encouragement and practical advice.',
  'This has been a stressful time. What are your favorite self-care practices? How do you decompress?',
  'Can anyone recommend good therapists or counselors? Preferably someone who specializes in this area.',
  'Creating a personal safety plan. What should I include? What am I missing?',
  'Let\'s share positive stories! Times when you stood up for yourself or others stood up for you. We need more of this.',
  'What legal rights should everyone know about? I feel like there\'s so much we should be aware of but aren\'t.',
  'My gut feeling has saved me multiple times. How do you strengthen your intuition? How do you learn to trust it?',
  'Working night shifts and feeling vulnerable. What precautions do you take? Any tips for staying alert and safe?',
  'The catcalling is exhausting. What responses have actually worked for you? What makes you feel safer?',
  'Organizing a community meetup for women to connect and share experiences. Who\'s interested? Let\'s build solidarity.',
  'Thinking of starting a safety awareness group in my area. Has anyone done this? How do you get started?',
  'Mental health is so important. What resources have helped you? Let\'s compile a list we can all use.',
  'Learning to recognize manipulative behavior has been eye-opening. What patterns have you noticed? Let\'s educate each other.',
  'Is self-defense training or situational awareness more important? I feel like we need both. What\'s your take?',
  'Share your stories of women helping women. Let\'s remember that we\'re not alone in this. Community matters.',
];

// Generate random date in the past 14 days
function getRandomDate(daysAgo: number = 14): string {
  const now = new Date();
  const past = new Date(now.getTime() - daysAgo * 24 * 60 * 60 * 1000 * Math.random());
  return past.toISOString();
}

// Generate mock feed posts
export function generateFeedPosts(count: number = 30): FeedPost[] {
  const posts: FeedPost[] = [];

  for (let i = 0; i < count; i++) {
    const upvotes = Math.floor(Math.random() * 200) + 5;
    const downvotes = Math.floor(Math.random() * 20);
    const votes = upvotes - downvotes;

    // 30% chance to have an image
    const hasImage = Math.random() < 0.3;

    posts.push({
      id: `feed-${i + 1}`,
      author: AUTHORS[Math.floor(Math.random() * AUTHORS.length)],
      title: TITLES[i % TITLES.length],
      body: BODY_TEXTS[i % BODY_TEXTS.length],
      image: hasImage ? `https://picsum.photos/seed/${i}/800/600` : undefined,
      votes,
      commentsCount: Math.floor(Math.random() * 40),
      createdAt: getRandomDate(14),
    });
  }

  return posts;
}

// Generate mock comments for a post
export function generateFeedPostComments(postId: string, count: number = 15): FeedPostComment[] {
  const comments: FeedPostComment[] = [];
  const commentTexts = [
    'This is such an important topic. Thank you for bringing it up.',
    'I completely agree with your perspective on this.',
    'Here\'s a resource that might help: [link]',
    'I\'ve been through something similar. Sending support.',
    'This should be talked about more. Thanks for starting the conversation.',
    'Great point! I never thought about it that way.',
    'Adding my experience: [detailed response]',
    'Thank you for sharing this. It\'s really helpful.',
    'I disagree but I respect your view. Here\'s why I think differently...',
    'This is exactly what I needed to hear today.',
    'Can you share more details about this?',
    'I have a different approach that worked for me...',
    'Everyone should read this. Very insightful.',
    'Thanks for being vulnerable and sharing.',
    'This community is so supportive. Grateful for all of you.',
  ];

  for (let i = 0; i < count; i++) {
    const upvotes = Math.floor(Math.random() * 50);
    const downvotes = Math.floor(Math.random() * 5);

    comments.push({
      id: `comment-${postId}-${i + 1}`,
      postId,
      author: AUTHORS[Math.floor(Math.random() * AUTHORS.length)],
      content: commentTexts[i % commentTexts.length],
      votes: upvotes - downvotes,
      createdAt: getRandomDate(7),
    });
  }

  return comments;
}

// Calculate hot score for sorting (Reddit algorithm)
export function calculateHotScore(post: FeedPost): number {
  const hoursAgo = (Date.now() - new Date(post.createdAt).getTime()) / (1000 * 60 * 60);
  const score = post.votes / Math.pow(hoursAgo + 2, 1.5);
  return score;
}

// Sort posts by different criteria
export function sortFeedPosts(posts: FeedPost[], sortBy: 'hot' | 'new' | 'top'): FeedPost[] {
  const sorted = [...posts];

  switch (sortBy) {
    case 'hot':
      sorted.sort((a, b) => calculateHotScore(b) - calculateHotScore(a));
      break;
    case 'new':
      sorted.sort((a, b) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime());
      break;
    case 'top':
      sorted.sort((a, b) => b.votes - a.votes);
      break;
  }

  return sorted;
}

