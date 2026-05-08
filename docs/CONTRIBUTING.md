# 🛠️ Development Workflow

To maintain a clean and manageable history, we follow strict Git and coding standards.

## 🌿 Branching Strategy

Always create a new branch for every task. Use the following prefixes:

- **Features:** `feat/feature-name` (e.g., `feat/login-ui`)
- **Bug Fixes:** `fix/bug-name` (e.g., `fix/overflow-error`)
- **Refactoring:** `refactor/component-name`
- **Documentation:** `docs/wiki-update`
- **Chore:** `chore/pubspec-update` (Permission required for `pubspec` changes)

---

## 📝 Commit Guidelines

- Keep commits small and focused.
- Use descriptive messages (e.g., `feat: implement login cubit and states`).
- Use lowercase for types and follow the format: `type: description`.

---

## 🚀 Submission Process (PRs)

1.  **Format your code:**
    ```bash
    dart format .
    ```
2.  **Run Analysis:**
    ```bash
    flutter analyze
    ```
    Ensure there are zero errors and warnings.
3.  **Push your branch:**
    ```bash
    git push origin [your-branch-name]
    ```
4.  **Create a Pull Request:** Request a review from the **Team Leader**.

---

## 🤖 AI Assistant (Antigravity)

When using the AI coding assistant (Antigravity), ensure it follows the `.rules` file.
- It should automatically create branches for you.
- It must not add packages without asking.
- It must adhere to the Clean Architecture layers.

---

