enum SubscriptionTier {
  basic,
  plus,
  premium,
}

class SubscriptionLimits {
  final int dailyMatches;
  final int monthlyStyleChanges;
  final int skinToneChanges;
  final int dailyMakeupMatches;
  final int savedCombinations;
  final bool hasAiStylist;
  
  const SubscriptionLimits({
    required this.dailyMatches,
    required this.monthlyStyleChanges,
    required this.skinToneChanges,
    required this.dailyMakeupMatches,
    required this.savedCombinations,
    required this.hasAiStylist,
  });
  
  static const Map<SubscriptionTier, SubscriptionLimits> limits = {
    SubscriptionTier.basic: SubscriptionLimits(
      dailyMatches: 2,
      monthlyStyleChanges: 0,
      skinToneChanges: 1,
      dailyMakeupMatches: 0,
      savedCombinations: 5,
      hasAiStylist: false,
    ),
    SubscriptionTier.plus: SubscriptionLimits(
      dailyMatches: 4,
      monthlyStyleChanges: 10,
      skinToneChanges: 5,
      dailyMakeupMatches: 1,
      savedCombinations: 20,
      hasAiStylist: false,
    ),
    SubscriptionTier.premium: SubscriptionLimits(
      dailyMatches: -1, // Unlimited
      monthlyStyleChanges: -1, // Unlimited
      skinToneChanges: -1, // Unlimited
      dailyMakeupMatches: -1, // Unlimited
      savedCombinations: -1, // Unlimited
      hasAiStylist: true,
    ),
  };
  
  static SubscriptionLimits getLimits(SubscriptionTier tier) {
    return limits[tier] ?? limits[SubscriptionTier.basic]!;
  }
  
  static String getTierName(SubscriptionTier tier) {
    switch (tier) {
      case SubscriptionTier.basic:
        return 'Basic';
      case SubscriptionTier.plus:
        return 'Plus';
      case SubscriptionTier.premium:
        return 'Premium';
    }
  }
  
  static String getTierPrice(SubscriptionTier tier) {
    switch (tier) {
      case SubscriptionTier.basic:
        return 'Free';
      case SubscriptionTier.plus:
        return '\$2.99/month';
      case SubscriptionTier.premium:
        return '\$4.99/month';
    }
  }
  
  static String getTierDescription(SubscriptionTier tier) {
    switch (tier) {
      case SubscriptionTier.basic:
        return 'Perfect for getting started';
      case SubscriptionTier.plus:
        return 'More matches and features';
      case SubscriptionTier.premium:
        return 'Unlimited access to everything';
    }
  }
} 