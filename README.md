# Your Shade - Complete Flutter Project

## Project Overview
This is the complete, merged Flutter project for "Your Shade" - a personal fashion and beauty assistant. This project consolidates all previous versions into a single, runnable application.

A personal fashion and beauty assistant that helps you discover what clothes, colors, and makeup look best on you.

## Features

### 🎨 **Smart Matching**
- Find clothes that complement your skin tone
- Get personalized style recommendations
- Discover makeup colors that flatter you

### 💎 **Subscription Tiers**
- **Basic (Free)**: 2 daily matches, 1 skin tone change, 5 saved combinations
- **Plus ($2.99/month)**: 4 daily matches, 10 monthly style changes, 5 skin tone changes, 1 daily makeup match, 20 saved combinations
- **Premium ($4.99/month)**: Unlimited access to all features + AI stylist

### 🌓 **Light/Dark Mode**
- Beautiful light theme with ivory background and mocha text
- Elegant dark theme with neon green accents
- Automatic theme persistence

### 📱 **Modern UI**
- Smooth animations and transitions
- Google Fonts integration
- Material Design 3 components
- Responsive layout

## Screens

### Welcome Screen
- App introduction with overlapping fashion cards
- Call-to-action to start exploring

### Home Screen
- Personalized greeting
- Usage statistics
- Quick actions for matches and style changes
- Recent matches display

### Match Screen
- Skin tone selector with usage tracking
- Style preference selection
- Real-time match generation
- Save and view match details

### Tips Screen
- Fashion tips and advice
- Makeup guidance (Premium content)
- Style guides for different occasions
- Interactive tip cards

### Profile Screen
- User information and preferences
- Subscription management
- Saved combinations
- Settings with theme toggle

## Technical Stack

- **Framework**: Flutter
- **State Management**: Provider
- **Theme**: Custom Material 3 implementation
- **Persistence**: SharedPreferences
- **Fonts**: Google Fonts (Poppins)
- **Animations**: Lottie (ready for integration)

## Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd your_shade_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Project Structure

```
lib/
├── main.dart                 # App entry point
├── theme/
│   └── app_theme.dart       # Theme configuration
├── providers/
│   ├── theme_provider.dart  # Theme state management
│   └── user_provider.dart   # User data and subscription
├── models/
│   └── subscription_tier.dart # Subscription models
├── screens/
│   ├── welcome_screen.dart  # Welcome screen
│   ├── main_app_screen.dart # Main app with navigation
│   ├── home_screen.dart     # Home dashboard
│   ├── match_screen.dart    # Match generation
│   ├── tips_screen.dart     # Tips and advice
│   └── profile_screen.dart  # User profile
└── widgets/
    └── upgrade_dialog.dart  # Subscription upgrade dialog
```

## Usage Tracking

The app implements comprehensive usage tracking for subscription tiers:

- **Daily Matches**: Resets daily at midnight
- **Monthly Style Changes**: Resets monthly
- **Skin Tone Changes**: Limited per subscription tier
- **Makeup Matches**: Daily limits for Plus/Premium
- **Saved Combinations**: Storage limits per tier

## Future Enhancements

- [ ] AI-powered stylist integration
- [ ] Real fashion database integration
- [ ] Social sharing features
- [ ] Advanced color analysis
- [ ] Virtual try-on capabilities
- [ ] Shopping integration
- [ ] Community features

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions, please contact the development team or create an issue in the repository.
