# 🎨 Design System & UI

We follow a strict design system to maintain visual consistency and high-quality user experience.

## 🌈 Theming & Styling

**Crucial Rule:** NEVER use raw color constants (e.g., `AppColors.primary`) or text styles (e.g., `AppTextStyles.h1`) directly in your widgets.

### How to access styles:
Use the provided `BuildContext` extensions in `lib/core/extensions/context_extensions.dart`.

- **Colors:** `context.colorScheme.primary`, `context.theme.scaffoldBackgroundColor`.
- **Text:** `context.textTheme.headlineLarge`, `context.textTheme.bodyMedium`.

---

## 📱 Responsiveness (ScreenUtil)

All hardcoded dimensions (width, height, padding, margin, radius, font size) must be wrapped with **ScreenUtil** extensions.

- **Width:** `100.w`
- **Height:** `50.h`
- **Radius:** `12.r`
- **Font Size:** `16.sp`

Example:
```dart
Container(
  width: 300.w,
  height: 150.h,
  padding: EdgeInsets.all(16.r),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8.r),
  ),
)
```

---

## 🌍 Localization (L10n)

Hardcoded strings in the UI are strictly forbidden.

1.  Add your keys to `lib/core/localization/l10n/app_en.arb` and `app_ar.arb`.
2.  Run `flutter gen-l10n`.
3.  Access strings via `context.local.[key]`.

Example:
```dart
Text(context.local.welcome_message)
```

---

## 🖼️ Assets
All asset paths should be centralized in `lib/core/utils/app_images.dart` or `app_constants.dart`. Do not use string literals for paths in the UI.
