
# 🌟 The Next Star 

**The Next Star** is an AI-based online audition platform designed to connect K-Pop audition applicants with entertainment companies. By utilizing facial analysis and image searching technology, it helps entertainment companies efficiently find the talent they need from a large pool of applicants.

## 👋 Project Overview

Every year, tens of thousands of applicants apply for K-Pop auditions, making it challenging for entertainment companies to efficiently screen and select candidates. The current system often requires small teams to manually review thousands of applications, which is time-consuming and inefficient. Additionally, international applicants face challenges in submitting applications due to varying formats and languages.

**The Next Star** addresses these issues by providing a streamlined platform that makes it easier for applicants to apply and for companies to find the right talent.

## 🔍 Key Features

1. **AI Facial Analysis**:
   - Analyzes the applicant's facial features using ratio analysis technology.
   - Recommends entertainment companies and audition opportunities that match the applicant's appearance.
   - Continuously improves analysis standards by learning from various model images.

2. **Image Searching**:
   - Uses AI-based image searching technology to analyze and categorize photos and videos submitted by applicants.
   - Provides entertainment companies with visual insights into an applicant's characteristics and potential.

## 👨🏻‍💻 Tech Stack

- **Flutter**: Used as the framework for cross-platform application development.

## ✔️ Project Structure

The main directory and file structure of the project is as follows:

```
lib/
├── main.dart                         # Application entry point
├── models/                           # Data model definitions
│   ├── application.dart              # Application model
│   ├── casting.dart                  # Casting model
│   ├── company.dart                  # Entertainment company model
│   ├── proposal.dart                 # Proposal model
│   └── trainee.dart                  # Trainee model
├── pages/                            # Main screens and pages
│   ├── companies/                    # Company-related pages
│   │   ├── companies_mainpage/       # Company main pages
│   │   ├── companies_mypage/         # Company my pages
│   │   ├── company_popup.dart        # Company popup page
│   │   ├── create_company.dart       # Create company page
│   │   ├── message/                  # Message-related pages
│   │   ├── registration/             # Company registration pages
│   │   └── trainee_info_page.dart    # Trainee information page
│   ├── individuals/                  # Individual user-related pages
│   │   ├── applicaiton_page.dart     # Application creation page
│   │   ├── company_detail_page.dart  # Company detail page
│   │   ├── create_profile.dart       # Profile creation page
│   │   ├── individual_popup.dart     # Individual popup page
│   │   ├── individuals_apply/        # Application submission pages
│   │   ├── individuals_mainpage/     # Individual user main pages
│   │   ├── message/                  # Message-related pages
│   │   ├── proposal_page.dart        # Proposal page
│   │   ├── registration/             # Individual registration pages
│   │   └── viewprofile_page.dart     # Profile view page
│   ├── login/                        # Login page
│   ├── new_register/                 # New registration page
│   └── onboarding/                   # Onboarding page
```

## 🏭 Installation and Running the Project

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- [Firebase CLI](https://firebase.google.com/docs/cli)

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/The-Next-Staar/NextStar-App.git
    cd NextStar-App
    ```

2. Install dependencies:
    ```bash
    flutter pub get
    ```

3. Run the application:
    ```bash
    flutter run
    ```

## 🙇‍♂️ Contributing

We welcome contributions! To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Implement your feature or fix a bug.
4. Test your changes.
5. Commit and push your changes (`git push origin feature-branch`).
6. Open a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For questions, issues, or suggestions, feel free to reach out via [GitHub Issues](https://github.com/The-Next-Staar/NextStar-App/issues).
