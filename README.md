# Cross-Platform Programming Course Assignments

## Student Information
- **Name**: Trịnh Đàm Huy  
- **Student ID**: 21IT081  
- **Class**: 21JIT  

## Introduction
This repository contains the assignments and labs for the Cross-Platform Programming course. Each lab is stored in a separate directory and includes a link to the corresponding lab folder in this repository.

---

## How to Build the Project

### Steps to Build the Project
1. **Clone the Repository**
   - Use the following command to clone the repository:
     ```bash
     git clone https://github.com/ThxgHntr/cross_platf_labs.git
     cd cross_platf_labs
     ```

2. **Build for Debug Mode**
   - To build the project in debug mode and run it on a connected device or emulator:
     ```bash
     flutter run
     ```

3. **Build for Release Mode**
   - To generate a release build for Android:
     ```bash
     flutter build apk
     ```
   - For iOS, make sure you are on macOS with Xcode installed, then use:
     ```bash
     flutter build ios
     ```

4. **Running on a Specific Device**
   - List available devices using:
     ```bash
     flutter devices
     ```
   - Run the app on a specific device:
     ```bash
     flutter run -d <device_id>
     ```

5. **Build Web Version (Optional)**
   - Enable web support by running:
     ```bash
     flutter config --enable-web
     flutter devices
     ```
   - Build the web version:
     ```bash
     flutter build web
     ```
   - The output will be in the `build/web` directory.

### Troubleshooting
- If you encounter any issues during the build process, try running:
  ```bash
  flutter doctor


## List of Labs

### Lab 1: I am rich
- **Description**: I am rich  
- **GitHub Link**: [Lab 1 Code](https://github.com/ThxgHntr/cross_platf_labs/blob/master/lib/src/lab1)

### Lab 2: MiCard
- **Description**: MiCard  
- **GitHub Link**: [Lab 2 Code](https://github.com/ThxgHntr/cross_platf_labs/blob/master/lib/src/lab2)

### Lab3: Dice
- **Description**: MiCard  
- **GitHub Link**: [Lab 2 Code](https://github.com/ThxgHntr/cross_platf_labs/blob/master/lib/src/lab3)