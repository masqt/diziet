# diziet

Masqt Flutter front-end for Android and iOS.

## Getting Started

1. You'll need to install Flutter, if you don't already have it on your machine.
Follow the instructions [here](https://flutter.dev/docs/get-started/install)
for your operating system, including setting up an editor.

1. Clone this repository.

1. Copy the `env.example` file in this directory to a new file called `.env`.
    (We use environment variables to configure our builds for dev/test/staging/prod,
    and the build will fail without a `.env` file in the project root directory.)

1. Run `flutter doctor` and fix any important problems that it mentions.
    (One day this README will explain what the output of `flutter doctor` means.)

1. optionally, run `flutter test`, which should tell you whether tests are working. 

1. Open the project directory and get hacking!

## Project structure

At top-level, this is a standard Flutter project: cross-platform
Dart files are in `lib/`, platform-specific code for Android is
in `android/`, platform-specific code for iOS is in `ios/`,
and so on.

Within the `lib/` directory we follow a folder-by-feature convention.
So, for example, `lib/authentication/` contains all the code, including widgets,
that are concerned with authentication.
