import 'package:flutter/material.dart';

import 'palette.dart';
import '../utils/constants.dart';

/// The default themes for this app.
class CustomTheme {
  static ThemeData modernTheme() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Palette.background,
      backgroundColor: Palette.background,
      cardColor: Palette.card,
      hoverColor: Colors.transparent,
      focusColor: Palette.focus,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      disabledColor: Palette.suppressed,
      canvasColor: Palette.card,
      hintColor: Palette.suppressed,
      errorColor: Palette.failure,
      dialogTheme: DialogTheme(
        backgroundColor: Palette.card,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardCornerRadius)),
      ),
      colorScheme: const ColorScheme.dark(
        primary: Palette.highlight,
        surface: Palette.card,
      ),
      timePickerTheme: TimePickerThemeData(
        helpTextStyle: const TextStyle(
          fontFamily: 'Noto Sans',
          color: Palette.standard,
        ),
        hourMinuteTextStyle: const TextStyle(
            fontFamily: 'M PLUS Rounded 1c',
            color: Palette.highlight,
            fontSize: 48),
        dayPeriodTextStyle: const TextStyle(
          fontFamily: 'Noto Sans',
          color: Palette.standard,
          fontSize: 16,
        ),
        dialBackgroundColor: Palette.focus,
        dayPeriodBorderSide: BorderSide.none,
        dayPeriodColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return Palette.focus;
          }
          return Colors.transparent;
        }),
        hourMinuteColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return Palette.focus;
          }
          return Colors.transparent;
        }),
      ),
      toggleableActiveColor: Palette.standard,
      tooltipTheme: const TooltipThemeData(
        waitDuration: Duration(milliseconds: 350),
        decoration: BoxDecoration(
          color: Palette.card,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        textStyle: TextStyle(
          fontFamily: 'Noto Sans',
          color: Palette.highlight,
        ),
      ),
      dividerColor: Colors.transparent,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Palette.highlight,
        selectionColor: Palette.focus,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: Palette.highlight,
          fontSize: 64,
          height: 0.8,
          leadingDistribution: TextLeadingDistribution.even,
          fontFamily: 'M PLUS Rounded 1c',
        ),
        headlineLarge: TextStyle(
          color: Palette.standard,
          fontSize: 32,
          height: 0.8,
          leadingDistribution: TextLeadingDistribution.even,
          fontFamily: 'M PLUS Rounded 1c',
        ),
        headlineSmall: TextStyle(
          color: Palette.suppressed,
          fontSize: 20,
          height: 0.8,
          leadingDistribution: TextLeadingDistribution.even,
          fontFamily: 'M PLUS Rounded 1c',
        ),
        titleLarge: TextStyle(
          fontFamily: 'Noto Sans',
          color: Palette.highlight,
          fontSize: 20,
        ),
        titleMedium: TextStyle(
          fontFamily: 'Noto Sans',
          color: Palette.standard,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Noto Sans',
          color: Palette.standard,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Noto Sans',
          color: Palette.standard,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
            (states) => const TextStyle(
              fontFamily: 'Noto Sans',
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(MaterialState.hovered)) {
                return Palette.focus;
              }
              return Colors.transparent;
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(MaterialState.hovered)) {
                return Palette.highlight;
              }
              return Palette.standard;
            },
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
              (states) => const TextStyle(
                fontFamily: 'Noto Sans',
                fontSize: 20,
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (states) {
                if (states.contains(MaterialState.hovered)) {
                  return Palette.focus;
                }
                return Colors.transparent;
              },
            ),
            foregroundColor: MaterialStateProperty.resolveWith<Color?>(
              (states) {
                if (states.contains(MaterialState.hovered)) {
                  return Palette.highlight;
                } else if (states.contains(MaterialState.disabled)) {
                  return Palette.suppressed;
                }
                return Palette.standard;
              },
            ),
            mouseCursor:
                MaterialStateProperty.resolveWith<MouseCursor?>((states) {
              if (states.contains(MaterialState.hovered)) {
                return SystemMouseCursors.click;
              } else if (states.contains(MaterialState.disabled)) {
                return SystemMouseCursors.forbidden;
              }
              return null;
            })),
      ),
    );
  }

  static ThemeData oldTheme() {
    return modernTheme().copyWith();
  }
}
