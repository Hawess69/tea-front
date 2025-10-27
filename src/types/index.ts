// Global TypeScript types for Tea App

// User and Auth types
export interface User {
  id: number;
  name: string;
  email: string;
  avatar?: string;
}

export interface AuthState {
  user: User | null;
  token: string | null;
  isAuthenticated: boolean;
  isLoading: boolean;
}

// Form validation types
export interface LoginCredentials {
  email: string;
  password: string;
}

export interface SignupData {
  name: string;
  email: string;
  password: string;
  confirmPassword: string;
  agreeToTerms: boolean;
}

// Men Posts (Home) types
export interface MenPost {
  id: string;
  photo: string; // URL to blurred photo
  fullName: string;
  city: string;
  tags: string[]; // e.g., ["Gym", "Instagram"]
  caption: string;
  flags: {
    red: number;
    green: number;
    neutral: number;
  };
  userFlag?: 'red' | 'green' | 'neutral'; // current user's vote
  commentsCount: number;
  createdAt: string; // ISO date string
}

export interface MenPostComment {
  id: string;
  postId: string;
  author: {
    name: string;
    avatar: string;
  };
  content: string;
  createdAt: string;
  parentId?: string; // For nested replies
  replies?: MenPostComment[]; // Nested comments
  isEdited?: boolean;
  editedAt?: string;
}

// Feed (Community) types
export interface FeedPost {
  id: string;
  author: {
    name: string;
    avatar: string;
  };
  title: string;
  body: string;
  image?: string; // Optional image URL
  votes: number; // net votes (upvotes - downvotes)
  userVote?: 'up' | 'down'; // current user's vote
  commentsCount: number;
  createdAt: string;
}

export interface FeedPostComment {
  id: string;
  postId: string;
  author: {
    name: string;
    avatar: string;
  };
  content: string;
  votes: number;
  userVote?: 'up' | 'down';
  createdAt: string;
  parentId?: string; // For nested replies
  replies?: FeedPostComment[]; // Nested comments
  isEdited?: boolean;
  editedAt?: string;
}

// Filter/Sort types
export type SortType = 'hot' | 'new' | 'top';

// Pagination types
export interface PaginationParams {
  page: number;
  limit: number;
}

export interface PaginatedResponse<T> {
  data: T[];
  pagination: {
    currentPage: number;
    totalPages: number;
    totalItems: number;
    hasMore: boolean;
  };
}

// Navigation types
export type RootStackParamList = {
  Splash: undefined;
  Onboarding: undefined;
  AuthStack: undefined;
  MainTabs: undefined;
};

export type AuthStackParamList = {
  Login: undefined;
  Signup: undefined;
  ForgotPassword: undefined;
};

export type HomeStackParamList = {
  HomeList: undefined;
  MenPostDetail: { postId: string };
};

export type FeedStackParamList = {
  FeedList: undefined;
  FeedPostDetail: { postId: string };
};

export type MainTabParamList = {
  HomeTab: undefined;
  FeedTab: undefined;
  AddTab: undefined;
  ForumTab: undefined;
  EventsTab: undefined;
};

// Comment form types
export interface CommentFormData {
  content: string;
  parentId?: string;
  parentAuthor?: string;
}
