<<'PATCH'
*** Begin Patch
*** Add File: README.md
+## Health Vault — Full-Stack App (Frontend: React + TS, Backend: Ballerina + MongoDB)
+
+A simple health record and vaccination tracking app. The frontend is built with React 19, TypeScript, and Vite. The backend is a Ballerina HTTP service connected to MongoDB. It supports user signup/login, profile management, vaccine schedules (defaults + custom), BMI/growth checks, disease records, and both general and doctor appointments.
+
+### Features
+- **Authentication**: Signup/Login with basic password hashing (SHA-256) and session stored in `localStorage`.
+- **Profile**: View/update profile (name, DOB, gender, phone, photo) and delete account.
+- **Vaccines**: Default schedule per gender, compute due dates from DOB, mark as received, add/update/delete custom vaccines.
+- **Special Notes**: Save and edit user-specific notes.
+- **BMI & Growth**: Store BMI records and classify growth/BMI.
+- **Appointments**: General and doctor appointments CRUD.
+
+### Tech Stack
+- **Frontend**: React 19, React Router 7, TypeScript 5, Vite 7, ESLint
+- **Backend**: Ballerina `2201.12.7`, MongoDB Connector `ballerinax/mongodb 5.1.0`
+- **Database**: MongoDB (local) at `mongodb://localhost:27017/babadb`
+
+### Project Structure
+```text
+babapotha/
+  backend/
+    ballerina_healthrec/
+      Ballerina.toml
+      main.bal
+      type.bal
+  frontend/
+    babaf/
+      package.json
+      vite.config.ts
+      src/
+        pages/ (Auth, Dashboard, Profile, Vaccines, DoctorAppointments, etc.)
+        services/ (authService, profileService, vaccineService, ...)
+        components/ (ProtectedRoute, SideNav, Sidebar)
+        hooks/ (useVaccineSync)
+```
+
+### Prerequisites
+- Node.js 18+ and npm
+- Ballerina distribution `2201.12.7` (Swan Lake)
+- MongoDB running locally on default port (or update connection string in backend)
+
+### Quick Start
+1) Start MongoDB locally.
+
+2) Run the backend (Ballerina):
+```bash
+cd backend/ballerina_healthrec
+bal run
+```
+This starts the service on `http://localhost:9090/health` and initializes collections in the `babadb` database.
+
+3) Run the frontend (Vite):
+```bash
+cd frontend/babaf
+npm install
+npm run dev
+```
+The app runs at `http://localhost:5173`.
+
+### Configuration
+- Frontend API base URL defaults to `http://localhost:9090/health`. Override via `.env` in `frontend/babaf`:
+```bash
+# frontend/babaf/.env
+VITE_API_BASE_URL=http://localhost:9090/health
+```
+- Backend Mongo connection is set in `backend/ballerina_healthrec/main.bal`:
+```bal
+connection: "mongodb://localhost:27017/babadb"
+```
+Change if needed.
+
+### Frontend Scripts
+```bash
+npm run dev        # start Vite dev server
+npm run build      # type-check and build
+npm run preview    # preview production build
+npm run lint       # lint the codebase
+```
+
+### Primary Pages
+- `Welcome` → landing screen
+- `Auth` → signin/signup (Gmail format + strong password validation in UI)
+- `Dashboard` → profile summary, vaccine reminders, appointment notifications, special notes
+- `Vaccines` → manage vaccine register (default + custom), mark as administered
+- `DoctorAppointments` → manage doctor appointments
+- `Profile` → view/edit/delete profile
+
+### API Overview (Base: `/health`)
+- Health Check
+  - `GET /health`
+- Auth
+  - `POST /signup`
+  - `POST /login`
+- Profile
+  - `GET /getUserProfile?userId=...`
+  - `PUT /updateUserProfile`
+  - `DELETE /deleteProfile`
+- Special Notes
+  - `GET /getSpecialNotes?userId=...`
+  - `PUT /updateSpecialNotes`
+- Vaccines
+  - `GET /getVaccines?userId=...`
+  - `PUT /markVaccineReceived`
+  - `POST /addCustomVaccine`
+  - `PUT /updateVaccine`
+  - `DELETE /deleteVaccine`
+  - `GET /getRecommendedVaccines?gender=male|female`
+- Diseases
+  - `POST /addDisease`
+  - `GET /getDiseases?userId=...`
+- BMI & Growth
+  - `POST /addBmiRecord`
+  - `GET /getBmiRecords?userId=...`
+  - `POST /checkGrowth`
+- Appointments (general)
+  - `POST /addAppointment`
+  - `GET /getAppointments?userId=...`
+  - `PUT /updateAppointment`
+  - `DELETE /deleteAppointment`
+- Doctor Appointments
+  - `POST /addDocAppointment`
+  - `GET /getDocAppointments?userId=...`
+  - `PUT /updateDocAppointment`
+  - `DELETE /deleteDocAppointment`
+- Utilities
+  - `GET /test` (simple backend check)
+
+Notes:
+- The backend sends CORS headers and implements `OPTIONS` for all mutating routes.
+- Some responses may be returned either as raw JSON objects/arrays or wrapped in `{ body: ... }`. The frontend services handle both.
+
+### Data & Defaults
+- New users receive a default vaccine schedule based on gender. Due dates are derived from DOB + offset months.
+- Passwords are hashed with SHA-256 (demo-level; no salt/pepper). Consider upgrading for production.
+- The backend will create collections on startup if they do not exist.
+
+### Troubleshooting
+- Backend fails to start: ensure MongoDB is running and reachable at the configured connection string.
+- CORS errors: verify the frontend is on `http://localhost:5173` and backend on `http://localhost:9090`; CORS is enabled for these origins in the service config.
+- Login issues: use credentials created via Signup. The Auth page enforces Gmail format and strong passwords on the client.
+- Dates: Backend accepts dates as `YYYY-MM-DD`; the frontend normalizes various date shapes from the backend.
+
+### License
+MIT (or update as appropriate)
+
*** End Patch
PATCH