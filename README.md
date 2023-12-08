# real_estate

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Real Estate App

## Overview

This Flutter application represents a real estate app with a user profile page. The profile page includes various functionalities, each represented by a card with an icon and title.

## Profile Page

### `ProfilePage` Class

#### Overview

The `ProfilePage` class is responsible for displaying the user's profile information and a list of functionalities.

#### Constructors

- `ProfilePage({Key? key, required this.fullName})`: Initializes the profile page with the user's full name.

#### UI Components

- `AppBar`: Displays the user's full name and provides a link to edit the profile.
- `ListView`: Contains a list of `FunctionalityCard` widgets representing different functionalities.

#### Functionalities

1. **Past Tours**
    - Icon: `Icons.home`
    - Navigates to the "PastToursPage" when tapped.

2. **Open House Schedule**
    - Icon: `Icons.account_tree_sharp`
    - Navigates to the "OpenHouseSchedulePage" when tapped.

3. ... (List other functionalities with icons and navigation logic)

#### Settings

- Icon: `Icons.settings`
- Navigates to the "Settings" page when tapped.

## `FunctionalityCard` Class

### Overview

The `FunctionalityCard` class represents a card displaying a specific functionality within the profile page.

#### Constructors

- `FunctionalityCard({required this.title, required this.icon, required this.onTap})`: Initializes a functionality card.

#### UI Components

- `Card`: Represents the visual card container.
- `ListTile`: Displays the icon, title, and handles the onTap functionality.

#### Properties

- `title`: The title of the functionality card.
- `icon`: The icon representing the functionality.
- `onTap`: Callback function triggered when the card is tapped.

## Usage

To use this code, make sure to have Flutter installed. Run the app using:

```bash
flutter run

