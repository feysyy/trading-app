#  Trading App

Welcome to **Trading App**, a Ruby on Rails web application that allows users to buy and sell stocks using real-time price references powered by the Financial Modeling Prep API.

This project simulates a stock trading environment where users can manage portfolios, place trades, and track order history. 

The application includes **pre-seeded admin and user accounts** for easier testing and demonstration. It also integrates **RSpec** for testing and **Faker** for generating realistic sample data.

Users must confirm their email upon registration. After admin approval, users will receive an **email notification confirming that their account has been verified and trading access has been enabled.**

---

##  Tech Stack

- Ruby on Rails
- PostgreSQL
- Financial Modeling Prep API
- Devise
- RSpec
- Faker
- Action Maile
- TailwindCSS

---

##  User Features

- User registration with email confirmation
- Admin account verification before trading is enabled
- Secure login system
- Real-time stock price reference
- Buy and sell stocks
- Order history tracking

---

##  Admin Features

- View all user trades
- Monitor system-wide transactions
- Approve or reject user accounts
- Update user account status
- Adjust user balances

---

##  Seeded Accounts (For Demo & Testing)

The application includes pre-configured accounts for testing purposes.
To access run rails db:seed.

### Admin Account

- **Email:** adminone@gmail.com  
- **Password:** 123123  

---

###  Verified Users

- **Email:** usertwo@gmail.com  
- **Password:** 123123  

- **Email:** userthree@gmail.com  
- **Password:** 123123  

These users are verified and allowed to trade.

---

###  Unverified Users

- **Email:** userone@gmail.com  
- **Password:** 123123  

- **Email:** userfour@gmail.com  
- **Password:** 123123  

These users must be approved by the admin before they can trade.

---

##  Core Functionalities

###  Authentication & Authorization
- Email confirmation required before login
- Admin approval required before trading access
- Role-based access control (User / Admin)

###  Trading System
- Fetch live stock prices via Financial Modeling Prep API
- Validate sufficient balance before purchase
- Prevent selling more shares than owned
- Automatic portfolio updates after each transaction

###  Portfolio Management
- Display owned stocks

---

##  Environment Variables

Create a `.env` file in the root directory and add the following:

```env
FMP_API_KEY=your_api_key_here

--- 

## Installation

- git clone <https://github.com/feysyy/trading-app.git>
- cd trading-app
- bundle install
- rails db:create
- rails db:migrate
- rails db:seed
- rails server