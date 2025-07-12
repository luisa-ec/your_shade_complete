import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../widgets/upgrade_dialog.dart';
import '../models/subscription_tier.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Style Tips & Advice',
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              
              const SizedBox(height: 8),
              
              Text(
                'Expert advice to help you look your best',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Fashion Tips
              _buildSectionHeader(context, 'Fashion Tips', Icons.checkroom),
              const SizedBox(height: 16),
              _buildFashionTips(context),
              
              const SizedBox(height: 32),
              
              // Makeup Advice
              _buildSectionHeader(context, 'Makeup Advice', Icons.face),
              const SizedBox(height: 16),
              _buildMakeupAdvice(context),
              
              const SizedBox(height: 32),
              
              // Style Guides
              _buildSectionHeader(context, 'Style Guides', Icons.style),
              const SizedBox(height: 16),
              _buildStyleGuides(context),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildSectionHeader(BuildContext context, String title, IconData icon) {
    final theme = Theme.of(context);
    
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            icon,
            color: theme.colorScheme.primary,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
  
  Widget _buildFashionTips(BuildContext context) {
    final theme = Theme.of(context);
    
    final tips = [
      {
        'title': 'Color Theory Basics',
        'description': 'Learn how to choose colors that complement your skin tone',
        'icon': Icons.palette,
        'isPremium': false,
      },
      {
        'title': 'Body Shape Styling',
        'description': 'Dress for your body type to enhance your natural features',
        'icon': Icons.accessibility,
        'isPremium': false,
      },
      {
        'title': 'Seasonal Wardrobe',
        'description': 'Build a versatile wardrobe for every season',
        'icon': Icons.wb_sunny,
        'isPremium': true,
      },
      {
        'title': 'Accessorizing Tips',
        'description': 'Complete your look with the perfect accessories',
        'icon': Icons.diamond,
        'isPremium': true,
      },
    ];
    
    return Column(
      children: tips.map((tip) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: _buildTipCard(
            context,
            tip['title'] as String,
            tip['description'] as String,
            tip['icon'] as IconData,
            tip['isPremium'] as bool,
          ),
        );
      }).toList(),
    );
  }
  
  Widget _buildMakeupAdvice(BuildContext context) {
    final theme = Theme.of(context);
    final userProvider = Provider.of<UserProvider>(context);
    
    final makeupTips = [
      {
        'title': 'Foundation Matching',
        'description': 'Find the perfect foundation shade for your skin tone',
        'icon': Icons.face,
        'isPremium': false,
      },
      {
        'title': 'Eye Makeup Guide',
        'description': 'Enhance your eyes with the right colors and techniques',
        'icon': Icons.visibility,
        'isPremium': false,
      },
      {
        'title': 'Lip Color Selection',
        'description': 'Choose lip colors that flatter your skin tone',
        'icon': Icons.lips,
        'isPremium': true,
      },
      {
        'title': 'Contouring Tips',
        'description': 'Master the art of contouring for your face shape',
        'icon': Icons.brush,
        'isPremium': true,
      },
    ];
    
    return Column(
      children: makeupTips.map((tip) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: _buildTipCard(
            context,
            tip['title'] as String,
            tip['description'] as String,
            tip['icon'] as IconData,
            tip['isPremium'] as bool,
            onTap: tip['isPremium'] as bool 
              ? () => _handlePremiumTip(context, userProvider)
              : null,
          ),
        );
      }).toList(),
    );
  }
  
  Widget _buildStyleGuides(BuildContext context) {
    final theme = Theme.of(context);
    
    final guides = [
      {
        'title': 'Casual Style Guide',
        'description': 'Effortless everyday looks that are comfortable and stylish',
        'icon': Icons.weekend,
        'category': 'Casual',
      },
      {
        'title': 'Professional Attire',
        'description': 'Dress to impress in the workplace with confidence',
        'icon': Icons.work,
        'category': 'Professional',
      },
      {
        'title': 'Evening Elegance',
        'description': 'Sophisticated looks for special occasions and events',
        'icon': Icons.celebration,
        'category': 'Elegant',
      },
      {
        'title': 'Bold Fashion Statements',
        'description': 'Make a statement with daring and unique style choices',
        'icon': Icons.flash_on,
        'category': 'Bold',
      },
    ];
    
    return Column(
      children: guides.map((guide) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: _buildGuideCard(
            context,
            guide['title'] as String,
            guide['description'] as String,
            guide['icon'] as IconData,
            guide['category'] as String,
          ),
        );
      }).toList(),
    );
  }
  
  Widget _buildTipCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    bool isPremium, {
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context);
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
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
                icon,
                color: theme.colorScheme.primary,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                      if (isPremium)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Premium',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildGuideCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    String category,
  ) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.secondary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        category,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.secondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    // View guide
                  },
                  icon: Icon(Icons.visibility),
                  label: Text('View Guide'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: theme.colorScheme.primary,
                    side: BorderSide(color: theme.colorScheme.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Save guide
                  },
                  icon: Icon(Icons.bookmark_border),
                  label: Text('Save'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  void _handlePremiumTip(BuildContext context, UserProvider userProvider) {
    showDialog(
      context: context,
      builder: (context) => UpgradeDialog(
        title: 'Premium Content',
        message: 'This tip is available for Premium subscribers. Upgrade to access exclusive makeup advice!',
        upgradeTier: SubscriptionTier.premium,
        onUpgrade: () {
          userProvider.upgradeSubscription(SubscriptionTier.premium);
        },
      ),
    );
  }
} 