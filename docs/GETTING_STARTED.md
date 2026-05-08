# 🚀 Getting Started

Follow these steps to set up your development environment and start contributing to the project.

## 🛠️ Prerequisites

### 1. Flutter SDK
We use a specific version of Flutter to ensure consistency across the team.
- **Version:** `3.41.7`
- **Check your version:**
  ```bash
  flutter --version
  ```
  If you have a different version, please switch or use a version manager like `fvm`.

### 2. Environment Check
Run the following command to ensure your environment is ready:
```bash
flutter doctor
```
Ensure all required components (Android/iOS tools) are correctly configured.

---

## 📦 Installation

1.  **Clone the repository:**
    ```bash
    git clone [repository-url]
    cd dipe_freelance
    ```
2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Generate Localization Strings:**
    ```bash
    flutter gen-l10n
    ```

---

## 🏃 Running the Project

- **Debug Mode:**
  ```bash
  flutter run
  ```
- **Release Mode:**
  ```bash
  flutter run --release
  ```

---

## 🛑 Important Notes
- **External Packages:** Do NOT add any new packages to `pubspec.yaml` without explicit permission from the **Team Leader**.
- **Code Generation:** We do NOT use code generation tools (like `freezed` or `json_serializable`). All models and entities must be written manually following the project patterns.
