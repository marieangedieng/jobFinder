# JobFinder: Your Career Companion 🔍♥🔥

**JobFinder** is an innovative Laravel-based web application designed to connect job seekers and employers on a dynamic and user-friendly platform. It simplifies the recruitment process, making it efficient and effective for everyone involved. 

## Features ♥🔥

### For Job Seekers:
- Create professional profiles and upload resumes.
- Browse and search jobs by category, location, or skill set.
- Save jobs and track application statuses.
- Receive personalized job recommendations.

### For Employers:
- Post job openings with detailed requirements.
- Review and filter applicants based on resumes and profiles.
- Manage job postings and view analytics for applications.
- Directly contact potential candidates via an integrated messaging system.

---

## Project Overview ♥🔥
This web app is designed to streamline the recruitment process by bridging the gap between job seekers and employers. With a focus on accessibility and ease of use, the platform ensures:

- **Job Seekers:** Easy navigation, robust job search, and a professional way to showcase their skills.
- **Employers:** Simplified job posting and candidate filtering tools to find the perfect fit.

---

## Technologies Used ♥🔥
<p align="center">
<a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a>
</p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

### Backend:
- **Laravel**: Framework for building robust and scalable web applications.
- **MySQL**: Database for managing job, user, and employer data.

### Frontend:
- **Blade Templates**: For clean and modular view files.
- **Bootstrap**: Responsive design framework for sleek user interfaces.

---

## Installation Instructions ⚙️
Create database named job_portal, then import the database.sql file from /database/ folder.

Then:

1.Clone the repository:

   ```bash
    git clone https://github.com/marieangedieng/jobFinder.git
   ```

2.Navigate to the project directory:

    ```bash
    cd jobfinder
    ```

3.Install dependencies:

    ```bash
    composer install
    npm install
    ```

4.Set up environment variables:

    -Duplicate the .env.example file and rename it to .env.
    -Configure your database and mail settings in the .env file.

5.Generate an application key:

    ```bash
    php artisan key:generate
    ```

6.Run migrations and seed the database:

    ```bash
    php artisan migrate --seed
    ```

7.Start the development server:

    ```bash
    php artisan serve
    ```

---

## Contact 💌

For questions or suggestions, please email us at marieangedieng@gmail.com or open an issue in the repository.

Let’s make finding jobs and talent effortless! 🚀
