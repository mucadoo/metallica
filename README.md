# Metallica Project

## Description
Web application, structured using a Model-View-Controller (MVC) pattern, and designed to run within a Dockerized environment. It integrates a PHP application with a MySQL database.

## Technologies Used
*   **PHP**: The primary server-side scripting language.
*   **MySQL**: Relational database management system.
*   **Docker**: Containerization platform for building, shipping, and running applications.
*   **Docker Compose**: Tool for defining and running multi-container Docker applications.

## Setup and Installation

### Prerequisites
Before you begin, ensure you have the following installed on your system:
*   [Docker](https://docs.docker.com/get-docker/)
*   [Docker Compose](https://docs.docker.com/compose/install/)

### Getting Started

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/metallica.git
    cd metallica
    ```

2.  **Environment Variables:**
    Create a `.env` file in the root directory of the project. This file will contain sensitive information for your database connection. A typical `.env` file might look like this:
    ```
    MYSQL_ROOT_PASSWORD=your_root_password
    MYSQL_DATABASE=your_database_name
    MYSQL_USER=your_database_user
    MYSQL_PASSWORD=your_database_password
    ```
    *Make sure to replace `your_root_password`, `your_database_name`, `your_database_user`, and `your_database_password` with your desired values.*

3.  **Build and Run with Docker Compose:**
    Navigate to the project's root directory in your terminal and run:
    ```bash
    docker-compose up --build -d
    ```
    This command will:
    *   Build the Docker images for your PHP application and MySQL database.
    *   Create and start the services defined in `docker-compose.yml`.
    *   Run them in detached mode (`-d`).

4.  **Database Initialization:**
    The `db` directory contains SQL scripts that will be automatically executed when the MySQL container starts for the first time, initializing your database schema and data.

### Accessing the Application
Once the Docker containers are up and running, you can access the web application by navigating to `http://localhost` in your web browser.

The MySQL database will be accessible on `localhost:3306`.

## Project Structure
*   `controller/`: Contains the application's controllers, handling user input and updating the model/view.
*   `model/`: Contains the application's models, representing data structures and business logic.
*   `view/`: Contains the application's views, responsible for presenting data to the user.
*   `db/`: Contains SQL scripts for database initialization.
*   `media/`: Stores media files (images, videos, etc.) used by the application.
*   `style/`: Contains CSS or other styling files.
*   `config/`: Configuration files for the application.
*   `script/`: Utility scripts.
*   `index.php`: The entry point of the web application.
*   `Dockerfile`: Dockerfile for the PHP application.
*   `Dockerfile.mysql`: Dockerfile for the MySQL database.
*   `docker-compose.yml`: Defines the multi-container Docker application.
*   `.env`: Environment variables (ignored by Git).
*   `.gitignore`: Specifies intentionally untracked files to ignore.
*   `.htaccess`: Apache HTTP Server configuration file (if applicable).

## Contributing
Contributions are welcome! Please follow these steps:
1.  Fork the repository.
2.  Create a new branch (`git checkout -b feature/your-feature-name`).
3.  Make your changes.
4.  Commit your changes (`git commit -m 'Add some feature'`).
5.  Push to the branch (`git push origin feature/your-feature-name`).
6.  Open a Pull Request.
