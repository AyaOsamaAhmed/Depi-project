# 📚 Project Wiki: dipe_freelance

Welcome to the **dipe_freelance** project wiki! This repository is built with **Flutter** using **Clean Architecture** principles to ensure scalability, maintainability, and high performance.

---

## 🗺️ Navigation

### 1. 🚀 [Getting Started](./GETTING_STARTED.md)
Everything you need to set up your development environment and run the project.

### 2. 🏗️ [Architecture & Logic](./ARCHITECTURE.md)
Detailed guide on our implementation of **Clean Architecture** (Feature-based) and Business Logic patterns.
*See also: [Clean Architecture Guide (Arabic)](./clean_arch_docs.md)*

### 3. 🎨 [Design System & UI](./DESIGN_SYSTEM.md)
Rules for styling, theming, responsiveness (ScreenUtil), and localization (L10n).

### 4. 🛠️ [Development Workflow](./CONTRIBUTING.md)
Git branching strategy, code standards, and submission guidelines.
*See also: [Developer Rules](./rulre_for_devs.md)*

### 5. 🔌 [State Management & Networking](./STATE_NETWORKING.md)
Standard patterns for **Bloc/Cubit** and **Dio** networking.

---

## 🚨 Core Principles

1.  **Clean Architecture:** Strict separation of Domain, Data, and Presentation layers.
2.  **No Code Gen:** We avoid `freezed` or other generation tools to keep the project light and predictable.
3.  **Strict Localization:** Zero hardcoded strings in the UI.
4.  **Theme Extensions:** No direct use of `AppColors` or `AppTextStyles` in widgets.
5.  **Responsiveness:** Mandatory use of `flutter_screenutil` for all dimensions.

---

## 👥 Team & Support
If you have questions about these rules, please contact the **Team Leader** before proceeding with major changes.
