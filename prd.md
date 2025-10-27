Here's the updated PRD for the Tea App, adapted from React Native + Expo to Flutter, maintaining all features and architecture considerations:

Tea App — Mobile (Flutter)
Platform: Flutter (Dart)
Platforms: iOS + Android
Language: Dart
Backend: Laravel REST API (v1)
Storage: Hive/SharedPreferences (cache)
UI Library: Flutter Material & Custom Widgets, with packages like flutter_bloc/riverpod, flutter_localizations
Notifications: Firebase Cloud Messaging + flutter_local_notifications
Goal: Build the MVP of the Tea app — a women-first social space enabling sharing, rating, discussions, events, and notifications.

🎯 Product Vision
Tea is a women-first social platform blending two core experiences:

🧠 Feed (Reddit-style posts): Women post discussions, advice, topics, upvote/downvote, comment.

🚩 Men Posts: Private section for women to post about men (photo, story, tags), community rates (red/green/neutral).

Additional features:

Forums & events

Alerts for tracked names

Local push notifications

Fully bilingual (English/Arabic) and RTL-ready

🧭 App Navigation Structure
Bottom Navigation Bar (5 tabs):

🏠 Home (Men Posts): Ratings, blur protection

📰 Feed: Community posts

➕ Add Button (Floating): Quick actions like post a man, create feed post, set alert, create event

💬 Forum: Discussion categories

🎟️ Events: Local and online events

Top App Bar:

Left: Profile avatar (settings/profile)

Right: Chat 💬 + Notification Bell 🔔

Below: Contextual search bar with filters

💡 Core Features
1️⃣ Authentication
Email/password or phone login (Laravel API)

Persist sessions (Hive/SharedPreferences)

Screens: Onboarding → Login → Register → Home

2️⃣ Home — Men Posts Feed
Purpose: Safe reporting/discussion with blur protection

UI:

Card list layout

Blurred photos (hold-to-reveal)

Full name + city + tags chips

Caption/story snippet

Inline Flag Bar (🚩 ✅ ⚪)

Voting with optimistic updates

Comments count

Overflow menu (Share, Report, Set Alert)

API:

GET /api/v1/men/posts

POST /api/v1/men/posts/:id/flag

GET/POST /api/v1/men/posts/:id/comments

Sorting Logic:

Hot, New, Top as per specifications

3️⃣ Post a Man (Composer)
Upload photo (using image_picker with auto blur, EXIF removal, watermark)

Enter name, city, tags

Caption (warn if phone/email detected)

Flag choice

Submit to API

Set Alert prompt

4️⃣ Men Post Details
Full gallery (hold-to-reveal)

Name, city, tags

Full caption/story

Flag info & counts

Comments section (scrollable, add comment)

Overflow menu

5️⃣ Feed (Community)
Reddit-style posts

Features:

Author, avatar

Title, truncated body

Upvote/downvote with count

Comments count

Post time

Optional image

API:

GET/POST /api/v1/feed/posts

Vote, comment, sort

6️⃣ Forum
List categories

Topic lists with comments & votes

UI similar to feed, grouped by topics

7️⃣ Events
List upcoming events

RSVP toggle (local)

Schedule local notifications (30 mins before)

8️⃣ Alerts System
Add alerts for specific names

Store locally & backend

Notify when matches occur

9️⃣ Notifications
Fetch: /api/v1/notifications

Local notifications for comments, alerts, events

Badge count update

🔟 Search Bar
Context-aware filtering with debounce

Filters per page (name, city, tags, titles, location)

⚙️ System Architecture (Frontend)
Main Stack:

Flutter (latest stable, SDK 3+)

State Management: Riverpod / Bloc

API: Dio / http

Caching: Hive / shared_preferences

Localization: flutter_localizations + intl or easy_localization

Navigation: go_router or flutter_navigation

UI: Material + custom Widgets, RTL support built-in

Folder Structure:

text
/lib
  /core           // constants, themes, utilities
  /data           // API clients, models, repositories
  /domain         // business logic, use cases
  /presentation   // Screens, widgets, state management (bloc, riverpod)
    /screens
      /auth
      /home
      /feed
      /forum
      /events
      /profile
    /widgets
    /localization
  main.dart
🎨 UI & Theme
Colors: Same palette (#0C3C49, #2D8C3C, neutrals)

Typography: Nunito / Inter via Google Fonts

RTL: Handle with Directionality widget and adapt layouts accordingly

Accessibility: Font scaling, semantic labels

🔌 Backend & API
Endpoints similar (/api/v1/...)

Token auth via Laravel Sanctum

JSON structure consistent

Error handling: HTTP 4xx/5xx with message

🔔 Notifications
Register Expo Firebase token with backend (/api/v1/users/token)

Push notifications via Firebase Cloud Messaging and flutter_local_notifications

Local notifications for reminders

⚡ Offline & Offline Cache
Feed, Men Posts cached locally (Hive)

Queue posts/comments if offline, sync on reconnect

🚩 MVP Milestones
Phase	Focus	Deliverables
1	Auth + Navigation	Core structure, login, registration, theme, RTL
2	Men Posts	Feed, flags, comments
3	Community Feed	Posts, votes, comments
4	Alerts & Notifications	Alerts, push(FCM), local notifications
5	Forum & Events	Categories, RSVP, reminders
6	Polish & RTL	QA, bug fix, full Arabic layout
7	Release	Build APK/IPA, publish
✅ End Goal
A polished, production-ready Flutter app diverse in features, highly performant, with offline support, i18n, RTL, and backend integration, matching initial MVP specs for the Tea App.

