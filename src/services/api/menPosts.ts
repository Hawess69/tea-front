import { MenPost, MenPostComment, PaginatedResponse, SortType } from '../../types';
import { generateMenPosts, generateMenPostComments, sortMenPosts } from '../mock/menPostsData';

// Simulated API delay
const delay = (ms: number) => new Promise(resolve => setTimeout(resolve, ms));

// In-memory storage for mock data
let allPosts: MenPost[] = generateMenPosts(25);
let userFlags: Record<string, 'red' | 'green' | 'neutral'> = {};

// Get paginated men posts
export async function getMenPosts(
  page: number = 1,
  limit: number = 10,
  sort: SortType = 'hot'
): Promise<PaginatedResponse<MenPost>> {
  await delay(500); // Simulate network delay

  const sorted = sortMenPosts(allPosts, sort);

  // Apply user flags
  const postsWithUserFlags = sorted.map(post => ({
    ...post,
    userFlag: userFlags[post.id],
  }));

  const start = (page - 1) * limit;
  const end = start + limit;
  const paginatedData = postsWithUserFlags.slice(start, end);

  return {
    data: paginatedData,
    pagination: {
      currentPage: page,
      totalPages: Math.ceil(sorted.length / limit),
      totalItems: sorted.length,
      hasMore: end < sorted.length,
    },
  };
}

// Get single men post by ID
export async function getMenPostById(id: string): Promise<MenPost | null> {
  await delay(300);

  const post = allPosts.find(p => p.id === id);
  if (!post) return null;

  return {
    ...post,
    userFlag: userFlags[post.id],
  };
}

// Flag a men post
export async function flagMenPost(
  postId: string,
  flag: 'red' | 'green' | 'neutral'
): Promise<MenPost> {
  await delay(200);

  const post = allPosts.find(p => p.id === postId);
  if (!post) {
    throw new Error('Post not found');
  }

  // Remove previous flag if exists
  const previousFlag = userFlags[postId];
  if (previousFlag) {
    post.flags[previousFlag]--;
  }

  // Add new flag
  post.flags[flag]++;
  userFlags[postId] = flag;

  return {
    ...post,
    userFlag: flag,
  };
}

// Remove flag from a men post
export async function removeFlagFromMenPost(postId: string): Promise<MenPost> {
  await delay(200);

  const post = allPosts.find(p => p.id === postId);
  if (!post) {
    throw new Error('Post not found');
  }

  const previousFlag = userFlags[postId];
  if (previousFlag) {
    post.flags[previousFlag]--;
    delete userFlags[postId];
  }

  return {
    ...post,
    userFlag: undefined,
  };
}

// Get comments for a men post
export async function getMenPostComments(postId: string): Promise<MenPostComment[]> {
  await delay(400);

  return generateMenPostComments(postId, 10);
}

// Add comment to a men post
export async function addMenPostComment(
  postId: string,
  content: string
): Promise<MenPostComment> {
  await delay(300);

  const post = allPosts.find(p => p.id === postId);
  if (!post) {
    throw new Error('Post not found');
  }

  post.commentsCount++;

  const newComment: MenPostComment = {
    id: `comment-${postId}-${Date.now()}`,
    postId,
    author: {
      name: 'Current User',
      avatar: 'https://i.pravatar.cc/150?img=48',
    },
    content,
    createdAt: new Date().toISOString(),
  };

  return newComment;
}

// Search men posts by name or city
export async function searchMenPosts(query: string): Promise<MenPost[]> {
  await delay(500);

  const lowerQuery = query.toLowerCase();
  const results = allPosts.filter(
    post =>
      post.fullName.toLowerCase().includes(lowerQuery) ||
      post.city.toLowerCase().includes(lowerQuery)
  );

  return results.map(post => ({
    ...post,
    userFlag: userFlags[post.id],
  }));
}

