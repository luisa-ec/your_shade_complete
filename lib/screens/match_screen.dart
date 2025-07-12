import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../widgets/upgrade_dialog.dart';
import '../models/subscription_tier.dart';
import '../services/fashion_service.dart';
import '../models/fashion_item.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  String _selectedSkinTone = 'Medium';
  String _selectedStyle = 'Casual';
  bool _isLoading = false;
  List<FashionItem>? _matchResults;
  final FashionService _fashionService = FashionService();
  
  final List<String> _skinTones = [
    'Very Light',
    'Light',
    'Medium',
    'Medium-Dark',
    'Dark',
    'Very Dark',
  ];
  
  final List<String> _styles = [
    'Casual',
    'Elegant',
    'Professional',
    'Bold',
    'Minimalist',
    'Vintage',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      _selectedSkinTone = userProvider.skinTone;
      _selectedStyle = userProvider.stylePreference;
    });
  }

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
              // Header
              Text(
                'Find Your Match',
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              
              const SizedBox(height: 8),
              
              Text(
                'Discover clothes that complement your skin tone',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Skin Tone Selector
              _buildSkinToneSelector(context, userProvider),
              
              const SizedBox(height: 24),
              
              // Style Preferences
              _buildStyleSelector(context, userProvider),
              
              const SizedBox(height: 32),
              
              // Match Button
              _buildMatchButton(context, userProvider),
              
              const SizedBox(height: 32),
              
              // Results
              if (_matchResults != null) _buildMatchResults(context),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildSkinToneSelector(BuildContext context, UserProvider userProvider) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.palette,
              color: theme.colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Skin Tone',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const Spacer(),
            Text(
              userProvider.getSkinToneChangeUsageText(),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 16),
        
        SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _skinTones.length,
            itemBuilder: (context, index) {
              final skinTone = _skinTones[index];
              final isSelected = _selectedSkinTone == skinTone;
              
              return GestureDetector(
                onTap: () => _selectSkinTone(skinTone, userProvider),
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected 
                      ? theme.colorScheme.primary
                      : theme.colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: isSelected 
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurface.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      skinTone,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: isSelected 
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.onSurface,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  
  Widget _buildStyleSelector(BuildContext context, UserProvider userProvider) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.style,
              color: theme.colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Style Preference',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const Spacer(),
            Text(
              userProvider.getStyleChangeUsageText(),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 16),
        
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: _styles.map((style) {
            final isSelected = _selectedStyle == style;
            
            return GestureDetector(
              onTap: () => _selectStyle(style, userProvider),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected 
                    ? theme.colorScheme.primary
                    : theme.colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected 
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurface.withValues(alpha: 0.2),
                  ),
                ),
                child: Text(
                  style,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: isSelected 
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.onSurface,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
  
  Widget _buildMatchButton(BuildContext context, UserProvider userProvider) {
    final theme = Theme.of(context);
    
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: _isLoading ? null : () => _findMatch(context, userProvider),
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          elevation: 8,
          shadowColor: theme.colorScheme.primary.withValues(alpha: 0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: _isLoading
          ? SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  theme.colorScheme.onPrimary,
                ),
              ),
            )
          : Text(
              'Find My Match',
              style: theme.textTheme.labelLarge?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
      ),
    );
  }
  
  Widget _buildMatchResults(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.check_circle,
              color: theme.colorScheme.primary,
              size: 24,
            ),
            const SizedBox(width: 8),
            Text(
              'Your Perfect Matches',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 20),
        
        ..._matchResults!.map((item) => _buildMatchItem(context, item)).toList(),
      ],
    );
  }
  
  Widget _buildMatchItem(BuildContext context, FashionItem item) {
    final theme = Theme.of(context);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _getCategoryIcon(item.category),
              color: theme.colorScheme.primary,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.brand,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      item.rating.toString(),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '\$${item.price.toStringAsFixed(2)}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'dresses':
        return Icons.checkroom;
      case 'tops':
        return Icons.style;
      case 'bottoms':
        return Icons.accessibility;
      case 'outerwear':
        return Icons.ac_unit;
      case 'accessories':
        return Icons.diamond;
      default:
        return Icons.checkroom;
    }
  }
  
  void _selectSkinTone(String skinTone, UserProvider userProvider) {
    if (_selectedSkinTone != skinTone) {
      if (userProvider.canChangeSkinTone()) {
        setState(() {
          _selectedSkinTone = skinTone;
        });
        userProvider.changeSkinTone(skinTone);
      } else {
        showDialog(
          context: context,
          builder: (context) => UpgradeDialog(
            title: 'Skin Tone Limit Reached',
            message: 'You\'ve used all your skin tone changes. Upgrade for more!',
            upgradeTier: SubscriptionTier.plus,
            onUpgrade: () {
              userProvider.upgradeSubscription(SubscriptionTier.plus);
            },
          ),
        );
      }
    }
  }
  
  void _selectStyle(String style, UserProvider userProvider) {
    if (_selectedStyle != style) {
      if (userProvider.canChangeStyle()) {
        setState(() {
          _selectedStyle = style;
        });
        userProvider.changeStyle(style);
      } else {
        showDialog(
          context: context,
          builder: (context) => UpgradeDialog(
            title: 'Style Change Limit Reached',
            message: 'You\'ve used all your monthly style changes. Upgrade for more!',
            upgradeTier: SubscriptionTier.plus,
            onUpgrade: () {
              userProvider.upgradeSubscription(SubscriptionTier.plus);
            },
          ),
        );
      }
    }
  }
  
  Future<void> _findMatch(BuildContext context, UserProvider userProvider) async {
    if (!userProvider.canUseMatch()) {
      showDialog(
        context: context,
        builder: (context) => UpgradeDialog(
          title: 'Daily Limit Reached',
          message: 'You\'ve used all your daily matches. Upgrade to get more!',
          upgradeTier: SubscriptionTier.plus,
          onUpgrade: () {
            userProvider.upgradeSubscription(SubscriptionTier.plus);
          },
        ),
      );
      return;
    }
    
    setState(() {
      _isLoading = true;
    });
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    
    // Use the match
    await userProvider.useMatch();
    
    // Get real recommendations
    final recommendations = _fashionService.getRecommendations(
      _selectedSkinTone, 
      _selectedStyle, 
      limit: 3
    );
    
    setState(() {
      _isLoading = false;
      _matchResults = recommendations;
    });
  }
} 