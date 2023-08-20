# Thrift With Meyn: Online E-Commerce Shop

Welcome to the Thrift With Meyn project! This is a web application that serves as an online e-commerce shop specializing in affordable and stylish second-hand clothing. The project is built using a React frontend and a Rails backend, providing users with a seamless shopping experience.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- - [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
- [Backend](#backend)
- [Frontend](#frontend)
- [Database Design](#database-design)
- [Deployment](#deployment)
- [Future Enhancements](#future-enhancements)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Thrift With Meyn is an online clothing store that brings together fashion enthusiasts looking for unique and budget-friendly clothing options. The platform allows users to browse a wide range of second-hand clothing items, categorize them, reserve items with a half payment, and make purchases securely.

## Features

- **User Roles:**
  - Regular User: Can sign up, log in, view, reserve, add to favorites, rate clothes, and make purchases.
  - Admin: Has all permissions of a regular user plus the ability to add new clothes to the store.


- User Authentication:
  - Users can sign up and log in to their accounts.
  
- Browse Clothes:
  - Users can view a list of available clothes.
  - Clothes are categorized into different sections for easy browsing.

- Purchase and Reserve:
  - Users can buy clothes by making a full payment.
  - Users can reserve clothes by making a half payment.

- Categories:
  - Clothes are organized into various categories for easy navigation, including:
    - Rompers
    - Denims
    - Pallazos
    - Dresses
    - Aladins
    - Jumpsuits

## Technologies Used

- Frontend:
  - React: JavaScript library for building user interfaces.
  - Figma: Used for designing and prototyping the frontend.
  
- Backend:
  - Ruby on Rails: Web application framework for building the backend.
  - GraphQL: API query language for interacting with the backend.

## Getting Started

To get started with the Thrift With Meyn project, follow these steps:

1. Clone the repository:


2. Set up the backend:
- Navigate to the `backend` directory and follow the README instructions to set up the Rails backend.

3. Set up the frontend:
- Navigate to the `frontend` directory and follow the README instructions to set up the React frontend.

## Backend

The backend of the Thrift With Meyn project is built using Ruby on Rails and GraphQL. It consists of several models to manage user authentication, clothes, categories, reservations, and payments.

### Models

- User
- ClothingItem
- Category
- Reservation
- Payment

For detailed information about the backend setup and models, refer to the `backend/README.md` file.

## Frontend

The frontend of the Thrift With Meyn project is developed using React and is designed using Figma. It consists of various pages and components to provide a user-friendly shopping experience.

### Pages

- Home
- Clothing List
- Clothing Details
- Cart
- Checkout

For more information about the frontend setup and pages, refer to the `frontend/README.md` file.

## Database Design

The database is designed using DrawQL to establish relationships between different tables. Here's an overview of the relationships:

- Users have many Reservations and Payments.
- ClothingItems belong to a Category and can have many Reservations and Payments.
- Categories have many ClothingItems.

For a detailed view of the database schema, refer to the `database_schema.drawql` file.

## Deployment

The Thrift With Meyn project is deployed using the `render` platform. To deploy the project to your preferred hosting platform, follow these steps:

1. Sign up for a Render account: [Render](https://render.com/)
2. Create a new web service and link it to your GitHub repository.
3. Configure your deployment settings as described in the `deployment.md` file.

## Future Enhancements

We have plans to enhance the Thrift With Meyn project with the following features:

- User reviews and ratings for clothing items.
- Wishlist functionality for users to save their favorite items.
- Advanced search and filtering options.
- Integration with external payment gateways.

Contributions and ideas are welcome!

## Contributing

We welcome contributions to make Thrift With Meyn even better! If you'd like to contribute, please fork the repository, create a new branch, and submit a pull request. Make sure to follow our [contribution guidelines](CONTRIBUTING.md).

## License

This project is licensed under the [MIT License](LICENSE), which means you are free to use, modify, and distribute it as per the terms of the license.

---

Thank you for choosing Thrift With Meyn! We hope this README provides you with a comprehensive overview of the project. If you have any questions or need further assistance, feel free to reach out to us. Happy coding and happy shopping! 🛍️



