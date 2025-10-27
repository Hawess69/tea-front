---
architecture: tea-app
status: planning
priority: high
owner: cursor
last_updated: 2025-01-27
tags: [react-native, expo, architecture]
---

# Tea App - System Overview

## High-Level Architecture

```mermaid
graph TB
    subgraph "Mobile App (React Native + Expo)"
        A[App Shell] --> B[Navigation]
        B --> C[Home - Men Posts]
        B --> D[Feed - Community]
        B --> E[Forum - Categories]
        B --> F[Events - RSVP]
        B --> G[Profile - Settings]
        
        H[API Client] --> I[React Query Cache]
        I --> J[AsyncStorage]
        
        K[Notifications] --> L[Expo Push]
        K --> M[Local Notifications]
    end
    
    subgraph "Backend (Laravel API v1)"
        N[Authentication] --> O[Laravel Sanctum]
        P[Men Posts API] --> Q[Posts + Comments]
        R[Feed API] --> S[Voting + Comments]
        T[Alerts API] --> U[Name Tracking]
        V[Events API] --> W[RSVP Management]
        X[Notifications API] --> Y[Push Tokens]
    end
    
    H --> N
    H --> P
    H --> R
    H --> T
    H --> V
    H --> X
```

## Core Components

### 1. Navigation Structure
- **Bottom Tabs**: Home, Feed, Forum, Events
- **Floating Action**: Quick post creation
- **Top Bar**: Profile, Chat, Notifications, Search

### 2. Data Flow
- **API Layer**: Axios + React Query for caching
- **State Management**: React Query + Context
- **Persistence**: AsyncStorage for offline cache
- **Real-time**: Expo Push Notifications

### 3. Key Features Integration
- **Men Posts**: Blur protection, flag system, comments
- **Feed**: Reddit-style voting, sorting algorithms
- **Alerts**: Name tracking with push notifications
- **Events**: RSVP with local reminders
- **Search**: Contextual filtering per section

## Technical Stack

### Frontend
- React Native + Expo SDK 51
- TypeScript for type safety
- NativeWind (Tailwind CSS for RN)
- React Native Paper components
- React Query for data fetching
- React Navigation for routing

### Backend Integration
- Laravel REST API v1
- Token-based auth (Laravel Sanctum)
- Standardized JSON responses
- Push notification integration

### Development Tools
- Expo Go for development
- EAS Build for production
- Jest for unit testing
- React Native Testing Library

## Scalability Considerations
- **Caching Strategy**: React Query with AsyncStorage persistence
- **Offline Support**: Cache-first approach with sync on reconnect
- **Performance**: Lazy loading, image optimization, 60fps target
- **Internationalization**: RTL support, Arabic/English switching

## Security & Privacy
- **Image Protection**: Auto-blur, EXIF stripping, watermarks
- **Content Moderation**: Report system, admin controls
- **Data Privacy**: Secure storage, encrypted communications
- **User Safety**: Alert system, content warnings


