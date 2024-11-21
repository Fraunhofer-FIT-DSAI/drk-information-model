# DRK Musikschul-Manager Ontology Documentation
## Overview
This document describes the translation of the Hamburger Konservatorium's Musikschul-Manager PostgreSQL database schema into an RDF/OWL ontology for the DRK (Datenraum Kultur) system.

# Database to OWL Translation Documentation
This project translates the Hamburger Konservatorium's Musikschul-Manager PostgreSQL database schema into an RDF/OWL ontology for the DRK (Datenraum Kultur) system. The translation preserves the semantic relationships while enabling semantic web capabilities.

## Translation Statistics
- **Domain Classes**: 14 core classes from database tables
- **Enumeration Classes**: 12 from database enums
- **Properties**: 108 total
  - 89 data properties from database columns
  - 19 object properties from relationships

## Key Mappings

### Database → OWL Class Mappings
```
Database Tables → OWL Classes
- migrations      → Migrations
- auth           → Auth
- schools        → School
- users          → User
- teachers       → Teacher
- students       → Student
- schedules      → Schedule
- lessons        → Lesson
- matches        → Match
- files          → File
- integrations   → Integration
...and more
```

### Enum → OWL Class Mappings
```
Database Enums → OWL Enumeration Classes
language
user_role
user_gender
user_confirmation
lesson_place
lesson_type
lesson_duration
lesson_status
file_type
gender_preference
school_language
school_match_notification
```

### Property Mappings
```
Database Column Types → OWL Properties
- Primary Keys (uuid) → URI identifiers
- Foreign Keys       → owl:ObjectProperty
- Regular Columns    → owl:DatatypeProperty
```

## Database Constraints Translation
```
Database           │ OWL
───────────────────┼──────────────────
NOT NULL           │ owl:cardinality 1
Optional           │ owl:maxCardinality 1
ENUM              │ owl:oneOf
```

## Core Classes (Primary Domain Classes)
Core classes represent the fundamental entities in the music school domain:

- **School**: Music education institution
- **User**: Base class for system participants
- **Teacher**: Music education professionals (subclass of User)
- **Student**: Music learners (subclass of User)
- **Lesson**: Instructional sessions
- **Match**: Teacher-student pairing entity
- **Genre**: Musical styles and categories
- **Instrument**: Musical instruments used in education

## Secondary Classes (Supporting Classes)
Secondary classes provide supporting functionality:

- **File**: Digital assets and documents
- **Schedule**: Time management and availability
- **Integration**: Third-party service connections
- **UserConfirmation**: Verification processes
- **TeacherIntegration**: Teacher-specific external service connections

Each class maintains semantic relationships through standard vocabularies (Schema.org, FOAF, Music Ontology) while adding domain-specific attributes for music education.


# Object Properties Mapping

## Core User Relations
| Property | Domain | Range | Description |
|----------|---------|--------|-------------|
| `hasUser` | `Teacher`, `Student` | `User` | Links Teacher/Student to their base User profile |
| `managesSchool` | `User` | `School` | Links admin User to School they manage |
| `belongsToSchool` | `Teacher` | `School` | Links Teacher to their School |
| `attendsSchool` | `Student` | `School` | Links Student to their School |

## Teaching Relations
| Property | Domain | Range | Description |
|----------|---------|--------|-------------|
| `teachesLesson` | `Teacher` | `Lesson` | Links Teacher to Lessons they teach |
| `attendsLesson` | `Student` | `Lesson` | Links Student to Lessons they attend |
| `hasSchedule` | `User` | `Schedule` | Links User to their Schedule |

## Matching System
| Property | Domain | Range | Description |
|----------|---------|--------|-------------|
| `teacherMatch` | `Teacher` | `Match` | Links Teacher to their Matches |
| `studentMatch` | `Student` | `Match` | Links Student to their Matches |

## Resource Relations
| Property | Domain | Range | Description |
|----------|---------|--------|-------------|
| `hasInstrument` | `Teacher`, `Student`, `School`, `Match` | `Instrument` | Links entities to Instruments |
| `hasGenre` | `Teacher`, `Student`, `School`, `Match` | `Genre` | Links entities to Genres |
| `hasFile` | `User`, `School` | `File` | Links entities to their Files |

## Integration Relations
| Property | Domain | Range | Description |
|----------|---------|--------|-------------|
| `hasIntegration` | `Teacher`, `School` | `Integration`, `TeacherIntegration` | Links to Integration systems |

### Enumeration Classes (12)
```
Enum Classes:
- language
- user_role
- user_gender
- user_confirmation
- lesson_place
- lesson_type
- lesson_duration
- lesson_status
- file_type
- gender_preference
- school_language
- school_match_notification
```

### Properties with Enum Types

- **`users`**
  - `language` → `language` (Enum)
  - `role` → `user_role` (Enum)
  - `gender` → `user_gender` (Enum)

- **`user_confirmations`**
  - `type` → `user_confirmation` (Enum)

- **`schools`**
  - `language` → `school_language` (Enum)
  - `match_notification` → `school_match_notification` (Enum)

- **`teachers`**
  - `gender_preference` → `gender_preference` (Enum)

- **`students`**
  - `gender_preference` → `gender_preference` (Enum)

- **`lessons`**
  - `place` → `lesson_place` (Enum)
  - `type` → `lesson_type` (Enum)
  - `duration` → `lesson_duration` (Enum)
  - `status` → `lesson_status` (Enum)

- **`files`**
  - `type` → `file_type` (Enum)


# Core Identification Data Properties
1. id
   Domains: [School, User, Teacher, Student, Schedule, Lesson, Match, File, Integration, TeacherIntegration, Genre, Instrument]

2. name
   Domains: [School, Integration]
   Sub-properties: nameDe, nameEn, nameVariant (Domains: [Genre, Instrument])

3. description
   Domains: [School, Teacher, Integration, Lesson]

# Contact Properties
4. email
   Domains: [User, UserConfirmation]

5. phoneNumber
   Domains: [School, User]

6. website
   Domains: [School]

# Location Properties
7. city
   Domains: [School, User]

8. postalCode
   Domains: [School, User]

9. location
   Domains: [Lesson]
   
10. teachingLocation
    Domains: [Teacher, Student]

# Temporal Properties
11. created
    Domains: [School, User, UserConfirmation, Teacher, Student, Schedule, Lesson, Match, File, Integration, TeacherIntegration]

12. modified
    Domains: [School, User, UserConfirmation, Teacher, Student, Lesson, Integration, TeacherIntegration]

13. deleted
    Domains: [School]

14. birthday
    Domains: [User]

15. startTime
    Domains: [Schedule, Lesson]

16. endTime
    Domains: [Schedule, Lesson]

# Language Properties
17. language
    Domains: [School, User]

18. spokenLanguages
    Domains: [User]

# Numerical Properties
19. teachersAmount
    Domains: [School]

20. studentsAmount
    Domains: [School, Teacher]

21. yearsExperience
    Domains: [Teacher]

22. notice
    Domains: [Schedule, Lesson]

23. roomId
    Domains: [Lesson]

# Boolean Properties
24. confirmed
    Domains: [School, UserConfirmation]

25. validated
    Domains: [School, Teacher]

26. workWithMinors
    Domains: [Teacher]

27. allowEmailContact
    Domains: [User]

28. allowPhoneContact
    Domains: [User]

29. acceptTeacher
    Domains: [Match]

30. acceptStudent
    Domains: [Match]

31. terminated
    Domains: [Match]

32. top10
    Domains: [Genre, Instrument]

33. availableInMusiq
    Domains: [Genre, Instrument]

# Preference Properties
34. genderPreference
    Domains: [Teacher, Student]

35. agePreference
    Domains: [Teacher]

36. experienceLevel
    Domains: [Student]
    
37. studentsExperienceLevel
    Domains: [Teacher]

# External Reference Properties
38. gnd
    Domains: [Genre, Instrument]

39. wikidata
    Domains: [Genre, Instrument]

40. mimo
    Domains: [Genre, Instrument]

# JSON/Complex Properties
41. priceRange
    Domains: [School, Teacher]

42. socials
    Domains: [School, Teacher]

43. education
    Domains: [Teacher]

44. coordinate
    Domains: [User]

45. unions
    Domains: [School]

# Authentication Properties
46. password
    Domains: [User]

47. token
    Domains: [Auth]

# Type/Status Properties
48. type
    Domains: [UserConfirmation, Lesson, File]

49. status
    Domains: [Lesson]

# Link Properties
50. url
    Domains: [File]

51. link
    Domains: [TeacherIntegration]

52. key
    Domains: [File, UserConfirmation]

# Role Properties
53. role
    Domains: [User]

Total Count: 53 distinct data properties


