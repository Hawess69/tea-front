import { FeedPost, FeedPostComment, PaginatedResponse, SortType } from '../../types';
import { generateFeedPosts, generateFeedPostComments, sortFeedPosts } from '../mock/feedData';

// Simulated API delay
const delay = (ms: number) => new Promise(resolve => setTimeout(resolve, ms));

// In-memory storage for mock data
let allPosts: FeedPost[] = generateFeedPosts(30);
let userVotes: Record<string, 'up' | 'down'> = {};
let commentVotes: Record<string, 'up' | 'down'> = {};

// Get paginated feed posts
export async function getFeedPosts(
  page: number = 1,
  limit: number = 10,
  sort: SortType = 'hot'
): Promise<PaginatedResponse<FeedPost>> {
  await delay(500); // Simulate network delay

  const sorted = sortFeedPosts(allPosts, sort);

  // Apply user votes
  const postsWithUserVotes = sorted.map(post => ({
    ...post,
    userVote: userVotes[post.id],
  }));

  const start = (page - 1) * limit;
  const end = start + limit;
  const paginatedData = postsWithUserVotes.slice(start, end);

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

// Get single feed post by ID
export async function getFeedPostById(id: string): Promise<FeedPost | null> {
  await delay(300);

  const post = allPosts.find(p => p.id === id);
  if (!post) return null;

  return {
    ...post,
    userVote: userVotes[post.id],
  };
}

// Vote on a feed post
export async function voteFeedPost(
  postId: string,
  vote: 'up' | 'down'
): Promise<FeedPost> {
  await delay(200);

  const post = allPosts.find(p => p.id === postId);
  if (!post) {
    throw new Error('Post not found');
  }

  // Remove previous vote if exists
  const previousVote = userVotes[postId];
  if (previousVote === 'up') {
    post.votes--;
  } else if (previousVote === 'down') {
    post.votes++;
  }

  // Add new vote
  if (vote === 'up') {
    post.votes++;
  } else {
    post.votes--;
  }
  userVotes[postId] = vote;

  return {
    ...post,
    userVote: vote,
  };
}

// Remove vote from a feed post
export async function removeVoteFromFeedPost(postId: string): Promise<FeedPost> {
  await delay(200);

  const post = allPosts.find(p => p.id === postId);
  if (!post) {
    throw new Error('Post not found');
  }

  const previousVote = userVotes[postId];
  if (previousVote === 'up') {
    post.votes--;
  } else if (previousVote === 'down') {
    post.votes++;
  }
  delete userVotes[postId];

  return {
    ...post,
    userVote: undefined,
  };
}

// Get comments for a feed post
export async function getFeedPostComments(postId: string): Promise<FeedPostComment[]> {
  await delay(400);

  const comments = generateFeedPostComments(postId, 15);

  // Apply user votes to comments
  return comments.map(comment => ({
    ...comment,
    userVote: commentVotes[comment.id],
  }));
}

// Add comment to a feed post
export async function addFeedPostComment(
  postId: string,
  content: string
): Promise<FeedPostComment> {
  await delay(300);

  const post = allPosts.find(p => p.id === postId);
  if (!post) {
    throw new Error('Post not found');
  }

  post.commentsCount++;

  const newComment: FeedPostComment = {
    id: `comment-${postId}-${Date.now()}`,
    postId,
    author: {
      name: 'Current User',
      avatar: 'https://i.pravatar.cc/150?img=48',
    },
    content,
    votes: 0,
    createdAt: new Date().toISOString(),
  };

  return newComment;
}

// Vote on a feed post comment
export async function voteFeedPostComment(
  commentId: string,
  vote: 'up' | 'down'
): Promise<void> {
  await delay(200);

  commentVotes[commentId] = vote;
}

// Search feed posts by title or body
export async function searchFeedPosts(query: string): Promise<FeedPost[]> {
  await delay(500);

  const lowerQuery = query.toLowerCase();
  const results = allPosts.filter(
    post =>
      post.title.toLowerCase().includes(lowerQuery) ||
      post.body.toLowerCase().includes(lowerQuery)
  );

  return results.map(post => ({
    ...post,
    userVote: userVotes[post.id],
  }));
}

