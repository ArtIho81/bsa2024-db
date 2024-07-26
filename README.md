# Database Schema

## ER Diagram

```mermaid
erDiagram
    USER {
        int id PK
        varchar username
        varchar first_name
        varchar last_name
        varchar email
        varchar password
    }

    FILE {
        int id PK
        varchar file_name
        varchar mime_type
        varchar file_key
        varchar file_url
    }

    USER_FILE {
        int user_id PK, FK
        int file_id PK, FK
    }

    DIRECTOR {
        int id PK
        varchar name
    }

    COUNTRY {
        int id PK
        varchar name
    }

    POSTER {
        int id PK
        varchar file_name
        varchar mime_type
        varchar file_key
        varchar file_url
    }

    MOVIES {
        int id PK
        varchar title
        text description
        decimal budget
        date release_date
        int duration
        int director_id FK
        int country_id FK
        int poster_id FK
    }

    FAVORITE_MOVIES {
        int user_id PK, FK
        int movie_id PK, FK
    }

    GENRE {
        int id PK
        varchar name
    }

    MOVIE_GENRE {
        int genre_id PK, FK
        int movie_id PK, FK
    }

    PHOTO {
        int id PK
        varchar file_name
        varchar mime_type
        varchar file_key
        varchar file_url
    }

    PERSON {
        int id PK
        varchar first_name
        varchar last_name
        text biography
        date birth_day
        varchar gender
        int home_country_id FK
        int main_photo_id FK
    }

    PERSON_PHOTO {
        int person_id FK
        int photo_id FK
    }

    CHARACTER {
        int id PK
        varchar name
        text description
        varchar role
        int movie_id FK
        int person_id FK
    }

    USER ||--o{ USER_FILE: contains
    FILE ||--o{ USER_FILE: contains
    DIRECTOR ||--o{ MOVIES: directs
    COUNTRY ||--o{ MOVIES: produces
    POSTER ||--o{ MOVIES: has
    MOVIES ||--o{ FAVORITE_MOVIES: is_favorite
    USER ||--o{ FAVORITE_MOVIES: has_favorite
    MOVIES ||--o{ MOVIE_GENRE: has
    GENRE ||--o{ MOVIE_GENRE: belongs_to
    COUNTRY ||--o{ PERSON: from
    PHOTO ||--o{ PERSON: has_main
    PERSON ||--o{ PERSON_PHOTO: has
    PHOTO ||--o{ PERSON_PHOTO: belongs_to
    MOVIES ||--o{ CHARACTER: features
    PERSON ||--o{ CHARACTER: portrays
