# Jot

A simple notes app for iOS built in SwiftUI. Made for CPSC 411 at Cal State Fullerton.

Jot lets you write down quick thoughts, organize them with templates, and pick up right where you left off. Notes autosave on every keystroke and stick around between launches.

## Authors

- Babiker Babiker
- Kenny Garcia

## Features

- **Five built in templates** to help you start writing fast: Blank, Meeting, Journal, To-Do, and Idea
- **Autosave on every keystroke** so you never lose your work
- **Live stats line** showing reading time, word count, and character count while you type
- **Sort your notes** by Newest, Oldest, Title A to Z, or Longest
- **Swipe to delete** any note straight from the list
- **First launch welcome screen** that only shows once
- **Friendly empty state** when you have no notes yet
- **About page** with app info and the team
- **Persistent storage** so your notes are still there when you reopen the app
- **Yellow accent color** to match the feel of the stock iOS Notes app

## Requirements

- A Mac running macOS
- Xcode 15 or later
- iOS 17 simulator or an iPhone running iOS 17 or newer

Older versions of Xcode and iOS will not work since the app uses the new `.onChange` modifier syntax.

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/bebopkenny/cpsc-411-project.git
```

### 2. Move into the project folder

```bash
cd cpsc-411-project
```

### 3. Open the project in Xcode

```bash
open "cpsc 411 project.xcodeproj"
```

### 4. Run the app

Once Xcode finishes indexing, pick a simulator from the toolbar at the top of the window (for example iPhone 15 Pro). Then hit the play button in the top left of Xcode, or use the shortcut:

```
Cmd + R
```

The simulator will boot up and Jot will launch automatically.

## How to Use the App

1. The first time the app opens you will see a welcome sheet. Tap **Get Started** to dismiss it.
2. The main screen will be empty since you do not have any notes yet. Tap the pencil icon in the top right to create your first note.
3. Pick a template from the chips at the top, or leave it on **Blank**.
4. Type a title and a body, then tap **Save**.
5. Your note will show up in the main list.
6. Tap a note to edit it. Changes save automatically as you type.
7. Swipe left on a note to delete it.
8. Use the sort icon in the toolbar to change the order of the list.
9. Tap **About** in the top left to see app info.

## Tech Stack

- Swift
- SwiftUI
- Foundation
- Combine
- UserDefaults for persistence

No external dependencies. No Cocoapods. No Swift Package Manager files. Just clone and run.

## Project Structure

| File | Purpose |
|------|---------|
| `Note.swift` | The data model for a single note |
| `NoteStore.swift` | The data layer that handles saving, loading, and updating notes |
| `ContentView.swift` | Main screen with the list and toolbar |
| `NoteRowView.swift` | A single row in the notes list |
| `NoteDetailView.swift` | Editing screen with autosave and the stats line |
| `NewNoteView.swift` | Sheet for creating a new note with template chips |
| `EmptyNotesView.swift` | What shows when there are no notes |
| `WelcomeSheet.swift` | First launch welcome screen |
| `AboutView.swift` | The About page |
| `DateFormatting.swift` | Helper for formatting dates |
| `cpsc_411_projectApp.swift` | App entry point |