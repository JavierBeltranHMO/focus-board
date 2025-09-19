<a id="readme-top"></a>

<!-- Shields
LinkedIn
Portfolio
Github
 -->

<br>
<div align="center">
   <!-- TODO -->
   <a href="#"><img src="#" alt="logo" width="80" height="80"></a>

   <h3 align="center">Focus Board</h3>

   <p align="center">
      Focus Board is a full-stack Trello clone built with Ruby on Rails and PostgreSQL.
   </p>
</div>

<!-- TABLE OF CONTETS -->
 <details>
   <summary>Table of Contents</summary>
   <ol>
      <li>
         <a href="#demo">Demo</a>
      </li>
      <li>
         <a href="#about-the-project">About the Project</a>
         <ul>
            <li><a href="#built-with">Built With</a></li>
         </ul>
      </li>
      <li><a href="#installation">Instalation</a></li>
      <li><a href="#features-implemented">Features Implemented</a></li>
      <li><a href="#roadmap">Roadmap</a></li>
      <li><a href="#contact">Contact</a></li>
      <li><a href="#licence">License</a></li>
   </ol>
 </details>

<!-- DEMO -->

## Demo 🚀

🔗 [Live Demo](https://focus-board.onrender.com)

### Demo Users

- Email: `user1@example.com` / Password: `password` / Role: user
- Email: `user2@example.com` / Password: `password` / Role: user
- Email: `user3@example.com` / Password: `password` / Role: user

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ABOUT -->

## About The Project

[![Dashboard][dashboard]](https://focus-board.onrender.com)

### Built With

- [![Ruby on Rails][Rails-badge]][Rails-url]
- [![PostgreSQL][Postgres-badge]][Postgres-url]
- [![Bootstrap][Bootstrap-badge]][Bootstrap-url]
- [![Stimulus][Stimulus-badge]][Stimulus-url]
- [![Hotwire][Hotwire-badge]][Hotwire-url]
- [![Render][Render-badge]][Render-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Installation

1. Clone repo

```sh
git clone git@gitlab.com:javier.beltran.hmo/focus-board.git
cd focus-board
```

2. Install dependencies

```sh
bundle install
yarn install
```

3. Setup Database

```sh
rails db:create db:migrate db:seed
```

4. Start Server

```sh
rails s
Open http://localhost:3000
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Features Implemented

### 🧠 Boards

- Create multiple boards.
- Share boards with other users.
- Reorderable task and lists.
- Drag & drop tasks between lists.

### 🧑‍💼 Authentication & Accounts

- User registration and login with Devise.
- Associate boards with users.
- Restrict access to user-owned boards.

### 📋 Lists

- Reorderable task lists.
- Drag & drop tasks between lists.
- Rename lists.
- Delete lists.

### ✅ Tasks

- Add task descriptions.
- Set task deadlines.
- Mark tasks as completed.
- Attach files to tasks.

### Screenshots

1. **Create Task**:
   ![Create Task][create-task]
2. **Move Task**:
   ![Move Task][move-task]
3. **Edit Task**:
   ![Edit Task][edit-task]
4. **Demo**:
   ![Demo][demo]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Roadmap

### Summary Checklist

| Feature                       | Status     |
| ----------------------------- | ---------- |
| CRUD Boards, Lists and Tasks  | ✔️ Done    |
| Authentication & Accounts     | ✔️ Done    |
| Share boards with other users | ✔️ Done    |
| Reordable tasks and lists     | ✔️ Done    |
| Drag and drop tasks           | ✔️ Done    |
| Tasks descriptions, deadlines | ✔️ Done    |
| Mark tasks as completed       | ✔️ Done    |
| Attach files to tasks         | ✔️ Done    |
| Color Themes                  | ⬜ Planned |
| Board activity                | ⬜ Planned |
| Search/filter tasks           | ⬜ Planned |
| Notifications                 | ⬜ Planned |
| Visual task priority          | ⬜ Planned |
| Checklist                     | ⬜ Planned |
| UI/UX Polishing               | ⬜ Planned |

- [ ] **UI/UX Polishing**: Improve overall design consistency and accessibility. Ensure fully responsive layouts for mobile and tablet devices.
- [ ] **Color Themes**: Add a theme toggle (light/dark) to improve customization and user comfort.
- [ ] **Board Activity (Audit Log)**: Track and display recent actions (task creation, edits, moves, deletions) for better collaboration transparency.
- [ ] **Notifications**: Notify users when tasks are assigned, updated, or completed to improve team awareness.
- [ ] **Search/Filter Tasks**: Allow users to search tasks by name or filter by status (to-do, in-progress, done) for faster navigation.
- [ ] **Visual Task Priority**: Add priority levels (high/medium/low) with visual indicators to highlight important tasks.
- [ ] **Checklist (Subtasks)**: Support subtasks within a task to break work into smaller, trackable steps.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contact

Javier Beltran - [LinkedIn](https://www.linkedin.com/in/javier-alejandro-beltran-montiel-3172222b1/)

Project Link: [https://gitlab.com/javier.beltran.hmo/focus-board](https://gitlab.com/javier.beltran.hmo/focus-board)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## License

Distributed under the Unlicense License.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Links and images -->

[//]: # "Badge links"
[Rails-badge]: https://img.shields.io/badge/Ruby%20on%20Rails-7-red?style=for-the-badge&logo=ruby&logoColor=white
[Rails-url]: https://rubyonrails.org/
[Postgres-badge]: https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white
[Postgres-url]: https://www.postgresql.org/
[Bootstrap-badge]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com/
[Stimulus-badge]: https://img.shields.io/badge/Stimulus-FF6F61?style=for-the-badge&logo=stimulus&logoColor=white
[Stimulus-url]: https://stimulus.hotwired.dev/
[Hotwire-badge]: https://img.shields.io/badge/Hotwire-FF2D20?style=for-the-badge&logo=hotwire&logoColor=white
[Hotwire-url]: https://hotwired.dev/
[Render-badge]: https://img.shields.io/badge/Render-00CFFF?style=for-the-badge&logo=render&logoColor=white
[Render-url]: https://render.com/
[//]: # "Images"
[create-task]: app/assets/images/create-task.png
[dashboard]: app/assets/images/Dashboard.png
[demo]: app/assets/images/demo.png
[edit-task]: app/assets/images/edit-task.png
[move-task]: app/assets/images/move-task.gif
