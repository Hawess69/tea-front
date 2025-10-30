# Tea App - Quick Start Guide

## 🚀 Running the App with Mock Data

The app is now fully configured with **mock data** so you can see the entire UI and functionality without connecting to a backend!

### What You'll See:

1. **Authentication Screens**
   - Login screen with validation
   - Register screen for new users
   - All working with mock authentication

2. **Main Navigation**
   - Bottom navigation with 4 tabs
   - Switch between sections seamlessly

3. **Men Posts Screen** 🏠
   - List of mock men posts with flags (red/green/neutral)
   - Post cards showing: name, city, tags, caption
   - Flag counts with visual progress bars
   - Action buttons for comments, flagging, sharing
   - Floating action button to create new posts

4. **Feed Screen** 📰
   - Community posts (Reddit-style)
   - Upvote/downvote buttons
   - Comments count
   - Author information with time stamps
   - Pull-to-refresh functionality

5. **Forum Screen** 💬
   - List of forum categories
   - Topic counts
   - Easy navigation

6. **Events Screen** 🎟️
   - Upcoming events
   - Event details (date, location, attendees)
   - RSVP buttons
   - Save/remind options

## ✨ Mock Features Working:

- ✅ Authentication flow (login/register)
- ✅ Navigation between all screens
- ✅ View mock data in all sections
- ✅ Interactive buttons and menus
- ✅ Flag voting system
- ✅ Upvote/downvote
- ✅ Share, report, and alert actions
- ✅ Beautiful card layouts
- ✅ Responsive design

## 🎨 Mock Data Includes:

**5 Feed Posts:**
- Safety tips
- Red flag warnings
- Support groups
- Dating advice
- Personal experiences

**5 Men Posts:**
- Real scenarios from different cities
- Flag counts (red/green/neutral)
- Tagged with keywords (gym, dating app, clubs, etc.)
- Caption/story previews

**3 Events:**
- Community Safety Workshop
- Weekly Support Group
- Self-Defense Workshop

**6 Forum Categories:**
- General Discussion
- Safety & Awareness
- Dating Advice
- Support & Recovery
- Events & Meetups
- Resources & Tools

## 📱 How to Run:

```bash
cd tea_app
flutter run
```

Or run on a specific device:

```bash
# Chrome (Web)
flutter run -d chrome

# Android
flutter run -d android

# iOS
flutter run -d ios
```

## 🔌 When Ready for Backend:

Once you're ready to connect to the Laravel backend:

1. Make sure backend is running at `http://localhost:8000`
2. The API client is already configured in `lib/data/services/api_client.dart`
3. All endpoints match the API documentation in `apis.md`
4. Just start using the API instead of mock data!

The app will automatically work with your backend API once connected.

## 🎯 Try These Features:

- **Tap the flag icons** on men posts to submit flags
- **Scroll** through feed posts
- **Click** upvote/downvote buttons
- **Long press** the menu button (three dots) on posts
- **Try the share/report options**
- **Navigate** between all 4 tabs
- **Click RSVP** on events
- **Test** all the interactive elements

Enjoy exploring the Tea app! 🍵

