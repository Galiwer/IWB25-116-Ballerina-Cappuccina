# 🏥 Health Records App

A simple app to track your child's health records, vaccines, and doctor appointments.

## 🚀 Quick Start Guide

### What You Need:
- A computer (Windows, Mac, or Linux)
- Internet connection to download software

### Step 1: Install Required Software

#### Install Node.js (for the app frontend):
1. Go to [nodejs.org](https://nodejs.org)
2. Download the "LTS" version (recommended)
3. Run the installer and follow the instructions
4. Restart your computer

#### Install XAMPP (for the database):
1. Go to [apachefriends.org](https://apachefriends.org)
2. Download XAMPP for your operating system
3. Run the installer and follow the instructions
4. **Important**: During installation, you only need to select "MySQL" (uncheck Apache, FileZilla, etc.)

### Step 2: Start the Database

1. Open XAMPP Control Panel
2. Click "Start" next to MySQL
3. Wait until MySQL shows a green status
4. Keep XAMPP running (don't close it)

### Step 3: Download and Run the App

1. Download this project folder to your computer
2. Open a command prompt/terminal in the project folder

#### Start the Backend (Database Server):
```bash
cd backend/ballerinahealthrec
bal run
```
Wait until you see "Service is ready. Press Ctrl+C to stop."

#### Start the Frontend (App Interface):
Open a **new** command prompt/terminal in the project folder:
```bash
cd frontend/babaf
npm install
npm run dev
```

### Step 4: Use the App

1. Open your web browser
2. Go to: `http://localhost:5173`
3. The app will open and you can:
   - Create an account
   - Add your child's information
   - Track vaccines and appointments
   - Monitor growth and BMI

## 🔧 Troubleshooting

### If the app doesn't start:
- Make sure XAMPP is running and MySQL is green
- Check that both command prompts show the app is running
- Try refreshing your browser

### If you get errors:
- Make sure you're in the correct folders when running commands
- Check that all software is properly installed
- Restart your computer and try again

## 📱 What the App Does

- **Track Vaccines**: See what vaccines your child needs and when
- **Manage Appointments**: Keep track of doctor visits
- **Monitor Growth**: Record height, weight, and BMI
- **Store Notes**: Keep important health information handy
- **User Profiles**: Manage multiple children if needed

## 🆘 Need Help?

If something isn't working:
1. Make sure XAMPP is running
2. Check that both the backend and frontend are running
3. Try refreshing your browser
4. Restart the app by stopping both commands (Ctrl+C) and running them again
5. Download mysql-connector.jar and replace mysql-connector.jar located in backend/lib folder.

## 📝 Notes

- The app stores all data on your computer (no internet required after setup)
- You can close the app anytime by pressing Ctrl+C in both command prompts
- To use the app again, just repeat Step 3

---

**That's it!** Follow these steps and you'll have a health records app running on your computer. 🎉
