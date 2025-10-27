import { MenPost, MenPostComment } from '../../types';

// Mock data generator for Men Posts
const FIRST_NAMES = ['Ahmed', 'Omar', 'Mohammed', 'Khaled', 'Ali', 'Hassan', 'Youssef', 'Karim', 'Tarek', 'Amr'];
const LAST_NAMES = ['Ibrahim', 'Hassan', 'Mahmoud', 'Ahmed', 'Sayed', 'Khalil', 'Fathy', 'Nabil', 'Mostafa', 'Rashid'];
const CITIES = ['Cairo', 'Alexandria', 'Giza', 'Shubra El Kheima', 'Port Said', 'Suez', 'Luxor', 'Mansoura', 'Tanta', 'Aswan'];
const TAGS = ['Gym', 'Instagram', 'Coffee Shop', 'Work', 'University', 'Tinder', 'Facebook', 'Mutual Friends', 'Club', 'Online'];

const CAPTIONS = [
  'Met him at the gym and he seemed nice at first, but became very aggressive when I said I wasn\'t interested. Be careful.',
  'This guy kept following me from the coffee shop to my car. Very creepy behavior. Stay alert if you see him.',
  'Had a terrible experience with this person. Started off polite but showed his true colors very quickly. Avoid at all costs.',
  'Matched with him on a dating app. Seemed nice online but was completely different in person. Trust your instincts.',
  'Works in my building and constantly makes inappropriate comments. HR has been notified.',
  'Met through mutual friends. Initially seemed friendly but crossed boundaries multiple times despite being told no.',
  'Encountered him at a local event. Very pushy and wouldn\'t take no for an answer. Please be careful.',
  'Classmate from university. Acts respectful in public but sends disturbing messages. Screenshots saved.',
  'This person approached me at the mall. When I politely declined conversation, he became hostile.',
  'Had a few dates with him. Everything seemed fine until he showed controlling behavior. Red flags everywhere.',
  'Met him through work connections. Professional at first but later made unwanted advances.',
  'Saw him at the club multiple times. Always trying to touch people without consent. Security was notified.',
  'Neighbor who doesn\'t understand personal boundaries. Always trying to "coincidentally" run into me.',
  'Met online and he seemed great initially. Reality was completely different. Stay safe out there.',
  'Friend of a friend who took advantage of the mutual connection. Be wary of this person.',
  'Encountered at a community event. Made everyone uncomfortable with his behavior.',
  'This guy is a serial harasser. Multiple women have reported similar experiences.',
  'Works at a local shop. Uses his position to make customers uncomfortable. Management aware.',
  'Met at a social gathering. Drinks too much and becomes problematic. Avoid when possible.',
  'Former colleague who couldn\'t handle professional rejection. Created hostile work environment.',
];

// Generate random date in the past 30 days
function getRandomDate(daysAgo: number = 30): string {
  const now = new Date();
  const past = new Date(now.getTime() - daysAgo * 24 * 60 * 60 * 1000 * Math.random());
  return past.toISOString();
}

// Generate mock men posts
export function generateMenPosts(count: number = 20): MenPost[] {
  const posts: MenPost[] = [];

  for (let i = 0; i < count; i++) {
    const firstName = FIRST_NAMES[Math.floor(Math.random() * FIRST_NAMES.length)];
    const lastName = LAST_NAMES[Math.floor(Math.random() * LAST_NAMES.length)];
    const fullName = `${firstName} ${lastName}`;

    // Generate random flags with realistic distribution
    const red = Math.floor(Math.random() * 50) + 1;
    const green = Math.floor(Math.random() * 20);
    const neutral = Math.floor(Math.random() * 15);

    // Random 2-4 tags
    const numTags = Math.floor(Math.random() * 3) + 2;
    const shuffledTags = [...TAGS].sort(() => 0.5 - Math.random());
    const tags = shuffledTags.slice(0, numTags);

    posts.push({
      id: `men-${i + 1}`,
      photo: `https://i.pravatar.cc/300?img=${i + 1}`, // Placeholder avatar
      fullName,
      city: CITIES[Math.floor(Math.random() * CITIES.length)],
      tags,
      caption: CAPTIONS[i % CAPTIONS.length],
      flags: { red, green, neutral },
      commentsCount: Math.floor(Math.random() * 25),
      createdAt: getRandomDate(30),
    });
  }

  return posts;
}

// Generate mock comments for a post
export function generateMenPostComments(postId: string, count: number = 10): MenPostComment[] {
  const comments: MenPostComment[] = [];
  const commentTexts = [
    'I had a similar experience. Thanks for sharing.',
    'Stay safe everyone. This is important information.',
    'Encountered this person as well. Can confirm.',
    'Thank you for the warning!',
    'I know someone who had the same issue with this person.',
    'This is concerning. Has anyone reported this?',
    'Please everyone be careful and trust your instincts.',
    'I\'ve seen this person around. Will be more cautious now.',
    'Thanks for posting this. Community safety is important.',
    'This needs more visibility. Share if you can.',
  ];

  for (let i = 0; i < count; i++) {
    comments.push({
      id: `comment-${postId}-${i + 1}`,
      postId,
      author: {
        name: `User${Math.floor(Math.random() * 1000)}`,
        avatar: `https://i.pravatar.cc/150?img=${Math.floor(Math.random() * 70)}`,
      },
      content: commentTexts[i % commentTexts.length],
      createdAt: getRandomDate(7),
    });
  }

  return comments;
}

// Calculate hot score for sorting
export function calculateHotScore(post: MenPost): number {
  const { red, green, neutral } = post.flags;
  const hoursAgo = (Date.now() - new Date(post.createdAt).getTime()) / (1000 * 60 * 60);
  const score = (red + 0.5 * neutral - 0.2 * green) / Math.pow(1 + hoursAgo, 1.3);
  return score;
}

// Sort posts by different criteria
export function sortMenPosts(posts: MenPost[], sortBy: 'hot' | 'new' | 'top'): MenPost[] {
  const sorted = [...posts];

  switch (sortBy) {
    case 'hot':
      sorted.sort((a, b) => calculateHotScore(b) - calculateHotScore(a));
      break;
    case 'new':
      sorted.sort((a, b) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime());
      break;
    case 'top':
      sorted.sort((a, b) => b.flags.red - a.flags.red);
      break;
  }

  return sorted;
}

