import 'package:flutter/material.dart';

@immutable
class AppColorTheme extends ThemeExtension<AppColorTheme> {
  final Color primary;
  final Color success;
  final Color error;
  final Color warning;
  final Color textPrimary;
  final Color textSecondary;
  final Color surface;
  final Color surfaceVariant;
  final Color divider;

  const AppColorTheme({
    required this.primary,
    required this.success,
    required this.error,
    required this.warning,
    required this.textPrimary,
    required this.textSecondary,
    required this.surface,
    required this.surfaceVariant,
    required this.divider,
  });

  @override
  ThemeExtension<AppColorTheme> copyWith({
    Color? primary,
    Color? success,
    Color? error,
    Color? warning,
    Color? textPrimary,
    Color? textSecondary,
    Color? surface,
    Color? surfaceVariant,
    Color? divider,
  }) {
    return AppColorTheme(
      primary: primary ?? this.primary,
      success: success ?? this.success,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      surface: surface ?? this.surface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      divider: divider ?? this.divider,
    );
  }

  @override
  ThemeExtension<AppColorTheme> lerp(
    ThemeExtension<AppColorTheme>? other,
    double t,
  ) {
    if (other is! AppColorTheme) {
      return this;
    }

    return AppColorTheme(
      primary: Color.lerp(primary, other.primary, t)!,
      success: Color.lerp(success, other.success, t)!,
      error: Color.lerp(error, other.error, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
    );
  }

  // Light Theme
  static const light = AppColorTheme(
    primary: Color(0xff5B67CA),
    success: Color(0xff34D399),
    error: Color(0xffEF4444),
    warning: Color(0xffF59E0B),
    textPrimary: Color(0xff1F2937),
    textSecondary: Color(0xff6B7280),
    surface: Color(0xffF8FAFC),
    surfaceVariant: Color(0xffE5E7EB),
    divider: Color(0xffD1D5DB),
  );

  // Dark Theme
  static const dark = AppColorTheme(
    primary: Color(0xff7D88E7),
    success: Color(0xff81E89E),
    error: Color(0xffE88B8C),
    warning: Color(0xffFFD580),
    textPrimary: Color(0xffF9FAFB),
    textSecondary: Color(0xffD1D5DB),
    surface: Color(0xff1A1A1A),
    surfaceVariant: Color(0xff2D2D2D),
    divider: Color(0xff404040),
  );
}

class AppTheme {
  static ThemeData get light => ThemeData.light().copyWith(
        extensions: <ThemeExtension<dynamic>>[AppColorTheme.light],
        colorScheme: const ColorScheme.light().copyWith(
          primary: AppColorTheme.light.primary,
          secondary: AppColorTheme.light.success,
          error: AppColorTheme.light.error,
          surface: AppColorTheme.light.surface,
        ),
      );

  static ThemeData get dark => ThemeData.dark().copyWith(
        extensions: <ThemeExtension<dynamic>>[AppColorTheme.dark],
        colorScheme: const ColorScheme.dark().copyWith(
          primary: AppColorTheme.dark.primary,
          secondary: AppColorTheme.dark.success,
          error: AppColorTheme.dark.error,
          surface: AppColorTheme.dark.surface,
        ),
      );
}
