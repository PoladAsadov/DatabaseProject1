Street Art Reporting Database – Extended Version

This project contains an improved version of the Street Art Reporting System database.
The goal of this update was to modernize the structure, add relational functionality, and include new features such as categories, reviews, and ratings.

Implemented Features

Added category_id to street_art table

Added foreign key linking street art entries to art_category

Added new tables:

art_review – stores evaluator reviews

art_rating – stores user ratings

Inserted sample user accounts

Added sample reviews

Assigned categories to existing artworks

Ensured foreign key consistency and normalization

Database Tables Overview
Table	Purpose
street_art	Stores artworks + new category_id
art_category	List of valid categories (Graffiti, Mural, Stencil, Tag)
art_review	Evaluator reviews for artworks
art_rating	Rating values from users
user	Artist, evaluator, and visitor accounts
Sample Data Inserted

3 Users (Artist, Evaluator, User)

3 Street Art items

4 Categories

3 Reviews

Foreign Key Structure

street_art.category_id → art_category.category_id

art_review.street_art_uno → street_art.street_art_uno

art_review.evaluator_uno → user.uno

art_rating.user_uno → user.uno

Result

The database is now normalized, cleaner, and supports additional features such as artwork reviews and rating management.
