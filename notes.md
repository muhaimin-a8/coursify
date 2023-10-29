# Coursify
REST API written in `Go`

Note: `NOT FOR PRODUCTION TO REAL USERS`

## 1.0 Requirements Gathering
### 1.1 Functional Requirements

- Stakeholders
  - Instructor
  - Student
  - Administrator

- Needs
  - Instructor can create, read, update, and delete courses
  - Student can search for and enroll in courses
  - Admin can manage all aspect of api, including users, courses, and enrollment

- Use Cases
  - Instructor
    - Create a course
    - Read a course
    - Update a course
    - Disable a course
    - Enable a course
    - Delete a course
    - List all courses
    - Create a course section
    - Read a course section
    - Update a course section
    - Delete a course section

  - Student
    - Search for a course
    - Enroll in a course
    - List all courses
    - List all enrolled courses
    - Read a course section
    - Mark a course section as completed
    - Mark a course section as uncompleted

  - Administrator
    - Read a course
    - Disable a course
    - Enable a course
    - List all courses
    - Search for a course

### 1.2 Non-Functional Requirements
- API must be secure
- API must be scalable
- API must be documented
- API must be tested
- API must be versioned

## 2.0 System Design

### 2.1 Data Model
- User
  - Id
  - Username
  - Name
  - Email
  - Password
  - Role
  - Verified
  - CreatedAt
  - UpdatedAt

- Course
  - Id
  - Title
  - Description
  - Sections
      - Id
      - Title
      - Description
      - Content
      - Completed
      - CreatedAt
      - UpdatedAt
  - Instructor
    - userId
    - username
    - Name
  - Price
  - Enrollments : count of student enrollments
  - Rate
  - Disabled
  - CreatedAt
  - UpdatedAt

- Enrollment
  - Id
  - CourseId
  - UserId
  - Disabled
  - CreatedAt
  - UpdatedAt
  - Completed
  - CompletedAt

### 2.2 API Endpoints
- Api Keys
  - POST `/api/v1/api-keys`: Create new api key

- Users
  - POST `/api/v1/users` : Create a user
  - GET `/api/v1/users` : List all users
  - GET `/api/v1/users/current` : Get current user
  - PUT `/api/v1/users/current` : Update current user
  - DELETE `/api/v1/users/current` : Delete current user
  - PUT `/api/v1/users/current/password` : Update password current user
  - PUT `/api/v1/users/current/email` : Update email current user
  - GET `/api/v1/users/{userId}` : Get a user by id
  - DELETE `/api/v1/users/{userId}` : Delete a user by id

- Verifications:
  - POST `/api/v1/verifications/emails` : Verify user email
  - PUT `/api/v1/verifications/emails/resend-code` : Resend verification email

- Authentications:
  - POST `/api/v1/authentications/login` : User login
  - DELETE `/api/v1/authentications/logout` : User logout
  - PUT `/api/v1/authentications/token`: Renew access token

- Courses
  - POST `/api/v1/courses` : Create a course
  - GET `/api/v1/courses`: List all courses
  - GET `/api/v1/courses/owned`: List all owned courses
  - GET `/api/v1/courses/enrolled`: List all enrolled courses
  - GET `/api/v1/courses/search?keyword=value`: Search for courses
  - GET `/api/v1/courses/{courseId}`: Get detail a course
  - PUT `/api/v1/courses/{courseId}`: Update a course
  - DELETE `/api/v1/courses/{courseId}`: Delete a course
  - PUT `/api/v1/courses/{courseId}/disable` : Disable a course
  - PUT `/api/v1/courses/{courseId}/enable` : Enable a course

- Course Sections
  - POST `/api/v1/courses/{courseId}/sections`: Create a course section
  - GET `/api/v1/courses/{courseId}/sections`: List all course section
  - GET `/api/v1/courses/{courseId}/sections/latest`: Create latest uncompleted section
  - GET `/api/v1/courses/{courseId}/sections/{sectionId}`: Get a course section
  - PUT `/api/v1/courses/{courseId}/sections/{sectionId}` : Update a course section
  - DELETE `/api/v1/courses/{courseId}/sections/{sectionId}` : Delete a course section
  - PUT `/api/v1/courses/{courseId}/sections/{sectionId}/completed`: Mark a section is completed

- Enrollments
  - POST `/api/v1/enrollments`: Enroll a course
  - GET `/api/v1/enrollments` : List all enrollments
  - PUT `/api/v1/enrollments/{enrollmentId}/disable`: Disable an enrollment
  - PUT `/api/v1/enrollments/{enrollmentId}/enable`: Enable an enrollment

### 2.2 Architecture
- Clean Architecture

### 2.3 Technologies And Frameworks
- Golang
- Go fiber
- PostgreSQL
- Docker
- Kubernetes
- OpenAPI
- JWT
- Git
- GitHub
- GitHub Actions
- Postman

### 2.4 API Design
- Authentication
  - JWT
  - API Key

- Authorization
  - Role Based

- Testing
  - Unit Testing
  - Integration Testing
  - End-to-End Testing
  - Postman Test Automation

- Documentation
  - OpenAPI

- Deployment
  - Docker
  - Kubernetes
