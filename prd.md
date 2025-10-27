Tea App — Mobile (React Native + Expo) PRD

Platform: React Native + Expo SDK 51
Platforms: iOS + Android
Language: TypeScript
Backend: Laravel REST API (v1)
Storage: AsyncStorage (cache)
UI Library: NativeWind (Tailwind RN) + React Native Paper
Notifications: Expo Notifications
Goal: Build the MVP of the Tea app — a safe social space for women to share experiences, rate interactions, discuss freely, and attend events.

🎯 Product Vision

Tea is a women-first social platform that blends two main experiences:

🧠 Feed (Reddit-style posts) — women post general discussions, advice, and topics that others can upvote/downvote and comment on.

🚩 Men Posts — a safe, private section where women can post about men (photo, story, tags) and the community rates them (red/green/neutral).

Additional features:

Forums & events

Alerts for tracked names

Local push notifications

Fully bilingual (English/Arabic) and RTL-ready.

🧭 App Navigation Structure

Bottom Tabs (5):

🏠 Home (Men Posts) — red/green/neutral ratings

📰 Feed — Reddit-style community feed

➕ Add Button (Floating) → Action sheet for quick actions

Post a Man

Create Feed Post

Set Alert

Create Event (if mod)

💬 Forum — categories like “Self-Care”, “Work Life”, etc.

🎟️ Events — discover local and online events

Top App Bar (global):

Left → Profile avatar (opens settings/profile page)

Right → Chat 💬 + Notification Bell 🔔

Below → Contextual Search Bar (filters posts/events/forums)

💡 Core Features
1️⃣ Authentication

Basic email/password or phone login (via Laravel API)

Remember session via AsyncStorage

Screens: Onboarding → Login → Register → Home

2️⃣ Home — Men Posts Feed

Purpose: Safe space to report or discuss men with blur protection.

UI Components

Card layout (single column list)

Blurred photo (hold-to-reveal)

Full name + city + tags chips (e.g., Gym, Instagram)

Caption/Story preview (2–3 lines)

Inline Flag Bar (🚩 ✅ ⚪)

Tap to vote (optimistic update)

Changes color when selected

Comments count

Overflow menu (Share / Report / “Set Alert for this name”)

Top bar filters: Hot | New | Top (Red)

Floating “+” for quick Post

Data:

/api/v1/men/posts → GET all posts

/api/v1/men/posts/:id/flag → POST flag

/api/v1/men/posts/:id/comments → GET/POST comments

Sorting Logic (frontend):

Hot = (red + 0.5*neutral - 0.2*green) / (1+hours)^1.3

New = timestamp descending

Top = red count descending

3️⃣ Post a Man (Composer)

Steps:

Upload photo (Expo ImagePicker → auto blur → EXIF strip → watermark)

Enter full name (first + last)

City + tags (multi-select chips)

Caption (min 20 chars; warn if phone/email detected)

Choose flag (Red / Green / Neutral)

Submit → POST /api/v1/men/posts

Prompt: “Set alert for [name]?” → POST /api/v1/alerts

4️⃣ Men Post Details

Full blurred image gallery (hold-to-reveal)

Full name + city + tags

Full caption/story

Inline flag bar

Flag summary (red/green/neutral counts)

Comments section (scrollable)

List of comments

Add comment input (POST /api/v1/men/posts/:id/comments)

Overflow menu: Share / Report / Set Alert

5️⃣ Feed (Community Section)

Purpose: Reddit-style forum for general discussion.

Feed Post Card

Author name & avatar

Title + body (truncated)

Upvote / Downvote buttons with count

Comments count

Time since posted

Optional image preview

Data:

/api/v1/feed/posts → GET/POST

/api/v1/feed/posts/:id/vote → POST vote

/api/v1/feed/posts/:id/comments → GET/POST

Sorting: Hot, New, Top (based on vote ratio)

6️⃣ Forum

List of categories (/api/v1/forums)

Each opens topic list (with title, body, comment count)

Users can comment, upvote/downvote inside

Similar UI to Feed but grouped by topic

7️⃣ Events

Upcoming events list (/api/v1/events)

Card with title, image, date/time, and location

“RSVP” button toggles local saved state

Schedule local notification 30 minutes before (expo-notifications)

8️⃣ Alerts System

Users add alert for specific names (/api/v1/alerts)

Stored locally and on backend

When new MenPost matches name → backend sends Expo push

List of active alerts (Profile → “My Alerts”)

9️⃣ Notifications

Pull from /api/v1/notifications

Local notifications via expo-notifications

Bell icon badge count

Handles:

New comments

New alert matches

Event reminders

Admin broadcasts

🔟 Search Bar

Contextual search per page:

Section	Filters by
Home (Men)	Name, city, tags
Feed	Post title/body
Forum	Topic titles
Events	Title/location

All use debounced local filtering (React Query cache).

⚙️ System Architecture (Frontend)

Main Stack

React Native + Expo SDK 51

TypeScript

React Query (API + cache)

Axios (API client)

AsyncStorage (persistent cache)

Expo ImagePicker / BlurView

Expo Notifications

react-navigation (Tabs + Stack)

react-i18next (localization)

NativeWind (Tailwind RN)

Folder Structure

src/
 ├── api/
 │    ├── ApiClient.ts
 │    ├── endpoints/
 ├── components/
 ├── hooks/
 ├── navigation/
 ├── screens/
 │    ├── Home/
 │    ├── Feed/
 │    ├── Forum/
 │    ├── Events/
 │    ├── Auth/
 │    ├── Profile/
 ├── store/
 ├── utils/
 ├── locales/
 │    ├── en.json
 │    ├── ar.json

🧩 UI Design Rules

Color Palette:

Deep Teal #0C3C49

Accent Green #2D8C3C

Background: Off-white / beige neutrals

Typography:

Rounded, readable sans-serif (Nunito / Inter)

Mood: Warm, safe, supportive

RTL Support:

Use I18nManager.isRTL for direction

Layouts flip seamlessly for Arabic

Accessibility:

Font scaling supported

Alt text for images

🧰 Integration Expectations (Backend → Frontend)

All endpoints under /api/v1/

Token-based auth via Laravel Sanctum

JSON structure:

{
  "status": true,
  "data": [...],
  "message": "Success"
}


Errors return HTTP 4xx/5xx with message key.

🧱 Notifications Integration

Each user registers Expo Push Token (POST /api/v1/users/token)

Laravel queue sends Expo push via saved token

Local notifications handled with expo-notifications

🔄 Offline Behavior

Cache feed & men posts locally

Allow reading offline

Queue comment/posts until reconnect (React Query retry)

🧮 Analytics (optional phase)

Track screen visits (Segment/Amplitude optional)

Track post creation rate, flag usage, events joined

✅ Acceptance Criteria (MVP)
Area	Must Have
Auth	Login / Register / Persist Session
Home	View, create, flag, comment on Men posts
Feed	Create post, vote, comment, sort
Alerts	Add / remove alerts, receive notifications
Events	List & RSVP + reminders
Notifications	Working Expo push & local
Search	Contextual, responsive, per tab
RTL	Verified Arabic layout & strings
Offline	Cache posts for reading
Performance	60 fps on mid-range Android
Release	Runs on Expo Go + Play Store + App Store
🧭 MVP Milestones
Phase	Focus	Deliverables
1. Auth + Navigation	Core structure	Auth, Tabs, Search, Theme
2. Men Posts	Main feature	Feed, Flags, Comments
3. Feed (Reddit)	Community	Posts, Votes, Comments
4. Alerts + Notifications	Engagement	Alerts, Expo push
5. Forum + Events	Add-ons	Event cards, RSVP
6. Polish & RTL	QA phase	Arabic layout, bug fixes
7. Publish	Final	EAS build + App Store/Play upload
🧠 Development Tools

IDE: Cursor / VS Code

Version Control: GitHub

Project Management: Notion / Trello

Testing: Expo Go (mobile) + Jest (unit tests)

🧩 Deliverables

Complete Expo project folder (ready for EAS build)

Working integration with Laravel endpoints

i18n-ready with en.json + ar.json

Documentation:

Setup & run instructions

.env config (API URL, Expo key)

Preview build (EAS link or APK)

Unit-tested core features (Feed, Men Posts)

✅ End Result
A production-quality Expo mobile app (Tea MVP) integrated with your Laravel backend — featuring both the Reddit-like Feed and the private Men Posts, complete with voting, commenting, alerts, events, notifications, and RTL/i18n.