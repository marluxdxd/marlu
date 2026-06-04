# Marlu Enriquez Portfolio

Flutter Web portfolio for Marlu A. Enriquez, focused on Flutter development, offline-first POS apps, Supabase sync, and IT infrastructure experience.

## Local Preview

```powershell
flutter pub get
flutter run -d chrome
```

## Build For Netlify Drag And Drop

```powershell
flutter build web --release
```

Upload this folder in Netlify:

```text
portfolio_web/build/web
```

## Netlify From GitHub

If this folder is inside a bigger repository, set these in Netlify:

```text
Base directory: portfolio_web
Build command: flutter build web --release
Publish directory: build/web
```

The included `netlify.toml` can install Flutter during Netlify builds when Flutter is not already available.
