import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/subscription_tier.dart';

class UserProvider with ChangeNotifier {
  static const String _subscriptionKey = 'subscription_tier';
  static const String _skinToneKey = 'skin_tone';
  static const String _styleKey = 'style_preference';
  static const String _dailyMatchesKey = 'daily_matches';
  static const String _lastMatchDateKey = 'last_match_date';
  static const String _monthlyStyleChangesKey = 'monthly_style_changes';
  static const String _lastStyleChangeMonthKey = 'last_style_change_month';
  static const String _skinToneChangesKey = 'skin_tone_changes';
  static const String _dailyMakeupMatchesKey = 'daily_makeup_matches';
  static const String _lastMakeupDateKey = 'last_makeup_date';
  static const String _savedCombinationsKey = 'saved_combinations';
  
  SubscriptionTier _subscriptionTier = SubscriptionTier.basic;
  String _skinTone = 'Medium';
  String _stylePreference = 'Casual';
  int _dailyMatchesUsed = 0;
  String _lastMatchDate = '';
  int _monthlyStyleChangesUsed = 0;
  String _lastStyleChangeMonth = '';
  int _skinToneChangesUsed = 0;
  int _dailyMakeupMatchesUsed = 0;
  String _lastMakeupDate = '';
  List<String> _savedCombinations = [];
  
  // Getters
  SubscriptionTier get subscriptionTier => _subscriptionTier;
  String get skinTone => _skinTone;
  String get stylePreference => _stylePreference;
  int get dailyMatchesUsed => _dailyMatchesUsed;
  int get monthlyStyleChangesUsed => _monthlyStyleChangesUsed;
  int get skinToneChangesUsed => _skinToneChangesUsed;
  int get dailyMakeupMatchesUsed => _dailyMakeupMatchesUsed;
  List<String> get savedCombinations => _savedCombinations;
  
  SubscriptionLimits get currentLimits => SubscriptionLimits.getLimits(_subscriptionTier);
  
  UserProvider() {
    _loadUserData();
  }
  
  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    
    // Load subscription tier
    final tierIndex = prefs.getInt(_subscriptionKey) ?? 0;
    _subscriptionTier = SubscriptionTier.values[tierIndex];
    
    // Load user preferences
    _skinTone = prefs.getString(_skinToneKey) ?? 'Medium';
    _stylePreference = prefs.getString(_styleKey) ?? 'Casual';
    
    // Load usage data
    _dailyMatchesUsed = prefs.getInt(_dailyMatchesKey) ?? 0;
    _lastMatchDate = prefs.getString(_lastMatchDateKey) ?? '';
    _monthlyStyleChangesUsed = prefs.getInt(_monthlyStyleChangesKey) ?? 0;
    _lastStyleChangeMonth = prefs.getString(_lastStyleChangeMonthKey) ?? '';
    _skinToneChangesUsed = prefs.getInt(_skinToneChangesKey) ?? 0;
    _dailyMakeupMatchesUsed = prefs.getInt(_dailyMakeupMatchesKey) ?? 0;
    _lastMakeupDate = prefs.getString(_lastMakeupDateKey) ?? '';
    
    // Load saved combinations
    _savedCombinations = prefs.getStringList(_savedCombinationsKey) ?? [];
    
    // Reset daily counters if it's a new day
    _resetDailyCounters();
    _resetMonthlyCounters();
    
    notifyListeners();
  }
  
  void _resetDailyCounters() {
    final today = DateTime.now().toIso8601String().split('T')[0];
    
    if (_lastMatchDate != today) {
      _dailyMatchesUsed = 0;
      _lastMatchDate = today;
    }
    
    if (_lastMakeupDate != today) {
      _dailyMakeupMatchesUsed = 0;
      _lastMakeupDate = today;
    }
  }
  
  void _resetMonthlyCounters() {
    final currentMonth = DateTime.now().toIso8601String().substring(0, 7); // YYYY-MM
    
    if (_lastStyleChangeMonth != currentMonth) {
      _monthlyStyleChangesUsed = 0;
      _lastStyleChangeMonth = currentMonth;
    }
  }
  
  Future<void> _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    
    await prefs.setInt(_subscriptionKey, _subscriptionTier.index);
    await prefs.setString(_skinToneKey, _skinTone);
    await prefs.setString(_styleKey, _stylePreference);
    await prefs.setInt(_dailyMatchesKey, _dailyMatchesUsed);
    await prefs.setString(_lastMatchDateKey, _lastMatchDate);
    await prefs.setInt(_monthlyStyleChangesKey, _monthlyStyleChangesUsed);
    await prefs.setString(_lastStyleChangeMonthKey, _lastStyleChangeMonth);
    await prefs.setInt(_skinToneChangesKey, _skinToneChangesUsed);
    await prefs.setInt(_dailyMakeupMatchesKey, _dailyMakeupMatchesUsed);
    await prefs.setString(_lastMakeupDateKey, _lastMakeupDate);
    await prefs.setStringList(_savedCombinationsKey, _savedCombinations);
  }
  
  // Usage tracking methods
  bool canUseMatch() {
    final limits = currentLimits;
    if (limits.dailyMatches == -1) return true; // Unlimited
    return _dailyMatchesUsed < limits.dailyMatches;
  }
  
  Future<bool> useMatch() async {
    if (!canUseMatch()) return false;
    
    _dailyMatchesUsed++;
    await _saveUserData();
    notifyListeners();
    return true;
  }
  
  bool canChangeStyle() {
    final limits = currentLimits;
    if (limits.monthlyStyleChanges == -1) return true; // Unlimited
    return _monthlyStyleChangesUsed < limits.monthlyStyleChanges;
  }
  
  Future<bool> changeStyle(String newStyle) async {
    if (!canChangeStyle()) return false;
    
    _stylePreference = newStyle;
    _monthlyStyleChangesUsed++;
    await _saveUserData();
    notifyListeners();
    return true;
  }
  
  bool canChangeSkinTone() {
    final limits = currentLimits;
    if (limits.skinToneChanges == -1) return true; // Unlimited
    return _skinToneChangesUsed < limits.skinToneChanges;
  }
  
  Future<bool> changeSkinTone(String newSkinTone) async {
    if (!canChangeSkinTone()) return false;
    
    _skinTone = newSkinTone;
    _skinToneChangesUsed++;
    await _saveUserData();
    notifyListeners();
    return true;
  }
  
  bool canUseMakeupMatch() {
    final limits = currentLimits;
    if (limits.dailyMakeupMatches == -1) return true; // Unlimited
    return _dailyMakeupMatchesUsed < limits.dailyMakeupMatches;
  }
  
  Future<bool> useMakeupMatch() async {
    if (!canUseMakeupMatch()) return false;
    
    _dailyMakeupMatchesUsed++;
    await _saveUserData();
    notifyListeners();
    return true;
  }
  
  bool canSaveCombination() {
    final limits = currentLimits;
    if (limits.savedCombinations == -1) return true; // Unlimited
    return _savedCombinations.length < limits.savedCombinations;
  }
  
  Future<bool> saveCombination(String combination) async {
    if (!canSaveCombination()) return false;
    
    _savedCombinations.add(combination);
    await _saveUserData();
    notifyListeners();
    return true;
  }
  
  Future<void> removeCombination(String combination) async {
    _savedCombinations.remove(combination);
    await _saveUserData();
    notifyListeners();
  }
  
  // Subscription management
  Future<void> upgradeSubscription(SubscriptionTier newTier) async {
    _subscriptionTier = newTier;
    await _saveUserData();
    notifyListeners();
  }
  
  // Get usage status for UI
  String getMatchUsageText() {
    final limits = currentLimits;
    if (limits.dailyMatches == -1) return 'Unlimited matches';
    return '$_dailyMatchesUsed/${limits.dailyMatches} matches today';
  }
  
  String getStyleChangeUsageText() {
    final limits = currentLimits;
    if (limits.monthlyStyleChanges == -1) return 'Unlimited style changes';
    return '$_monthlyStyleChangesUsed/${limits.monthlyStyleChanges} changes this month';
  }
  
  String getSkinToneChangeUsageText() {
    final limits = currentLimits;
    if (limits.skinToneChanges == -1) return 'Unlimited skin tone changes';
    return '$_skinToneChangesUsed/${limits.skinToneChanges} changes used';
  }
  
  String getMakeupMatchUsageText() {
    final limits = currentLimits;
    if (limits.dailyMakeupMatches == -1) return 'Unlimited makeup matches';
    return '$_dailyMakeupMatchesUsed/${limits.dailyMakeupMatches} matches today';
  }
  
  String getSavedCombinationsUsageText() {
    final limits = currentLimits;
    if (limits.savedCombinations == -1) return 'Unlimited saved combinations';
    return '${_savedCombinations.length}/${limits.savedCombinations} saved';
  }
} 