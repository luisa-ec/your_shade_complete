import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../widgets/upgrade_dialog.dart';
import '../models/subscription_tier.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userProvider = Provider.of<UserProvider>(context);
    
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting
              Text(
                'Good ${_getGreeting()}!',
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              
              const SizedBox(height: 8),
              
              Text(
                'Ready to discover your perfect shade?',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Usage Stats
              _buildUsageStats(context, userProvider),
              
              const SizedBox(height: 32),
              
              // Quick Actions
              Text(
                'Quick Actions',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              
              const SizedBox(height: 16),
              
              _buildQuickActions(context, userProvider),
              
              const SizedBox(height: 32),
              
              // Recent Matches
              Text(
                'Recent Matches',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              
              const SizedBox(height: 16),
              
              _buildRecentMatches(context),
            ],
          ),
        ),
      ),
    );
  }
  
  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Morning';
    if (hour < 17) return 'Afternoon';
    return 'Evening';
  }
  
  Widget _buildUsageStats(BuildContext context, UserProvider userProvider) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.analytics,
                color: theme.colorScheme.primary,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'Your Usage',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  context,
                  'Matches',
                  userProvider.getMatchUsageText(),
                  Icons.style,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatItem(
                  context,
                  'Style Changes',
                  userProvider.getStyleChangeUsageText(),
                  Icons.checkroom,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  context,
                  'Skin Tone',
                  userProvider.getSkinToneChangeUsageText(),
                  Icons.palette,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatItem(
                  context,
                  'Makeup',
                  userProvider.getMakeupMatchUsageText(),
                  Icons.face,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildStatItem(
    BuildContext context,
    String title,
    String value,
    IconData icon,
  ) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: theme.colorScheme.primary,
            size: 20,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildQuickActions(BuildContext context, UserProvider userProvider) {
    return Row(
      children: [
        Expanded(
          child: _buildActionCard(
            context,
            'New Match',
            'Find your perfect outfit',
            Icons.style,
            () => _handleNewMatch(context, userProvider),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildActionCard(
            context,
            'Change Style',
            'Update your preferences',
            Icons.checkroom,
            () => _handleStyleChange(context, userProvider),
          ),
        ),
      ],
    );
  }
  
  Widget _buildActionCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    final theme = Theme.of(context);
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(
                icon,
                color: theme.colorScheme.primary,
                size: 24,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildRecentMatches(BuildContext context) {
    final theme = Theme.of(context);
    
    // Mock recent matches data
    final recentMatches = [
      {'name': 'Summer Dress', 'category': 'Casual', 'rating': 4.5},
      {'name': 'Evening Gown', 'category': 'Elegant', 'rating': 4.8},
      {'name': 'Business Suit', 'category': 'Professional', 'rating': 4.2},
    ];
    
    return Column(
      children: recentMatches.map((match) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.checkroom,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      match['name'] as String,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      match['category'] as String,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    match['rating'].toString(),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
  
  void _handleNewMatch(BuildContext context, UserProvider userProvider) {
    if (!userProvider.canUseMatch()) {
      showDialog(
        context: context,
        builder: (context) => UpgradeDialog(
          title: 'Daily Limit Reached',
          message: 'You\'ve used all your daily matches. Upgrade to get more!',
          upgradeTier: SubscriptionTier.plus,
          onUpgrade: () {
            // Handle upgrade logic
            userProvider.upgradeSubscription(SubscriptionTier.plus);
          },
        ),
      );
    } else {
      // Navigate to match screen
      // This would be handled by the bottom navigation
    }
  }
  
  void _handleStyleChange(BuildContext context, UserProvider userProvider) {
    if (!userProvider.canChangeStyle()) {
      showDialog(
        context: context,
        builder: (context) => UpgradeDialog(
          title: 'Monthly Limit Reached',
          message: 'You\'ve used all your monthly style changes. Upgrade for more!',
          upgradeTier: SubscriptionTier.plus,
          onUpgrade: () {
            userProvider.upgradeSubscription(SubscriptionTier.plus);
          },
        ),
      );
    } else {
      // Show style change dialog
      _showStyleChangeDialog(context, userProvider);
    }
  }
  
  void _showStyleChangeDialog(BuildContext context, UserProvider userProvider) {
    final styles = ['Casual', 'Elegant', 'Professional', 'Bold', 'Minimalist'];
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Choose Your Style'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: styles.map((style) {
            return ListTile(
              title: Text(style),
              trailing: userProvider.stylePreference == style 
                ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary)
                : null,
              onTap: () {
                userProvider.changeStyle(style);
                Navigator.pop(context);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
} 