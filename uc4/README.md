# DRK Musikschul-Manager Ontology Documentation

## Overview
This document describes the translation of the Hamburger Konservatorium's Musikschul-Manager PostgreSQL database schema into an RDF/OWL ontology for the DRK (Datenraum Kultur) system.

## Translation Statistics
- **Total Classes**: 26 (14 domain classes + 12 enumerations)
- **Total Properties**: 108 (92 data properties + 19 object properties)

## Translation Patterns

### 1. Database Tables → OWL Classes (14)
```
Domain Classes:
- migrations
- auth
- schools
- users
- user_confirmations
- teachers
- students
- schedules
- lessons
- matches
- files
- integrations
- teacher_integrations
- integrations_schools
```

### 2. Enumeration Classes (12)
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

### 3. Properties Mapping
```
Database Column Type    →  OWL Property Type
----------------------------------------
Primary Keys (uuid)     →  URI identifiers
Foreign Keys           →  owl:ObjectProperty (19 total)
Regular Columns        →  owl:DatatypeProperty (89 total)
```

### 4. Constraints Translation
```
Database Constraint    →  OWL Constraint
----------------------------------------
NOT NULL              →  owl:cardinality 1
Optional              →  owl:maxCardinality 1
ENUM                  →  owl:oneOf
```


## Complete Properties Table

### Data Properties (92)
| Class | Property | Type | Cardinality | Description |
|-------|----------|------|-------------|-------------|
| **migrations** |
| | timestamp | xsd:long | 1..1 | Migration execution timestamp |
| | name | xsd:string | 1..1 | Migration name/description |
| **auth** |
| | token | xsd:string | 1..1 | Authentication token |
| | created | xsd:dateTime | 1..1 | Token creation timestamp |
| **schools** |
| | confirmed | xsd:boolean | 1..1 | School confirmation status |
| | validated | xsd:boolean | 1..1 | School validation status |
| | name | xsd:string | 1..1 | School name |
| | teachers_amount | xsd:nonNegativeInteger | 1..1 | Number of teachers |
| | students_amount | xsd:nonNegativeInteger | 1..1 | Number of students |
| | language | school_language | 1..1 | Primary language |
| | match_notification | school_match_notification | 1..1 | Notification preference |
| | socials | xsd:string (JSON) | 0..1 | Social media links as JSON |
| | unions | xsd:string (JSON) | 0..1 | Unions data as JSON |
| | price_range | xsd:string (JSON) | 0..1 | Price range data as JSON |
| | sponsor | xsd:string | 0..1 | School sponsor |
| | website | xsd:anyURI | 0..1 | School website |
| | description | xsd:string | 0..1 | School description |
| | postal_code | xsd:string | 0..1 | Postal code |
| | city | xsd:string | 0..1 | City |
| | phone_number | xsd:string | 0..1 | Contact number |
| | instruments | rdf:List | 0..1 | List of instruments offered |
| | genres | rdf:List | 0..1 | List of music genres taught |
| | created | xsd:dateTime | 1..1 | Record creation date |
| | modified | xsd:dateTime | 1..1 | Last modification date |
| | deleted | xsd:dateTime | 0..1 | Deletion date if applicable |
| **users** |
| | language | language | 0..1 | User preferred language |
| | spoken_languages | rdf:List | 0..1 | Languages spoken |
| | role | user_role | 1..1 | User role in system |
| | email | xsd:string | 1..1 | Email address |
| | password | xsd:string | 0..1 | Encrypted password |
| | first_name | xsd:string | 0..1 | First name |
| | last_name | xsd:string | 0..1 | Last name |
| | timezone | xsd:string | 0..1 | User timezone |
| | postal_code | xsd:string | 0..1 | Postal code |
| | city | xsd:string | 0..1 | City |
| | phone_number | xsd:string | 0..1 | Contact number |
| | gender | user_gender | 0..1 | User gender |
| | allow_email_contact | xsd:boolean | 0..1 | Email contact preference |
| | allow_phone_contact | xsd:boolean | 0..1 | Phone contact preference |
| | birthday | xsd:dateTime | 0..1 | Date of birth |
| | coordinate | xsd:string (JSON) | 0..1 | Geographic coordinates |
| | created | xsd:dateTime | 1..1 | Record creation date |
| | modified | xsd:dateTime | 1..1 | Last modification date |
| **user_confirmations** |
| | email | xsd:string | 1..1 | Email to confirm |
| | type | user_confirmation | 1..1 | Confirmation type |
| | key | xsd:integer | 1..1 | Confirmation key |
| | confirmed | xsd:boolean | 0..1 | Confirmation status |
| | created | xsd:dateTime | 1..1 | Record creation date |
| | modified | xsd:dateTime | 1..1 | Last modification date |
| **teachers** |
| | validated | xsd:boolean | 1..1 | Validation status |
| | instruments | rdf:List | 0..1 | Instruments taught |
| | genres | rdf:List | 0..1 | Music genres taught |
| | years_experience | xsd:nonNegativeInteger | 0..1 | Years of teaching |
| | teaching_location | rdf:List | 0..1 | Teaching locations |
| | education | xsd:string (JSON) | 0..1 | Education details |
| | socials | xsd:string (JSON) | 0..1 | Social media profiles |
| | work_with_minors | xsd:boolean | 0..1 | Minor student capability |
| | students_experience_level | rdf:List | 0..1 | Student levels taught |
| | age_preference | rdf:List | 0..1 | Preferred student ages |
| | gender_preference | gender_preference | 0..1 | Preferred student gender |
| | description | xsd:string | 0..1 | Teacher description |
| | price_range | xsd:string (JSON) | 0..1 | Teaching rates |
| | students_amount | xsd:nonNegativeInteger | 1..1 | Current student count |
| | created | xsd:dateTime | 1..1 | Record creation date |
| | modified | xsd:dateTime | 1..1 | Last modification date |
| **students** |
| | instruments | rdf:List | 0..1 | Instruments of interest |
| | genres | rdf:List | 0..1 | Music genres of interest |
| | experience_level | xsd:string | 0..1 | Musical experience level |
| | teaching_location | rdf:List | 0..1 | Preferred lesson locations |
| | gender_preference | gender_preference | 0..1 | Preferred teacher gender |
| | created | xsd:dateTime | 1..1 | Record creation date |
| | modified | xsd:dateTime | 1..1 | Last modification date |
| **schedules** |
| | day | xsd:integer | 1..1 | Day of week |
| | start_time | xsd:dateTime | 0..1 | Schedule start time |
| | end_time | xsd:dateTime | 0..1 | Schedule end time |
| | override_date | xsd:dateTime | 0..1 | Override date if any |
| | notice | xsd:integer | 1..1 | Notice period |
| | created | xsd:dateTime | 1..1 | Record creation date |
| **lessons** |
| | place | lesson_place | 1..1 | Lesson location type |
| | location | xsd:string | 0..1 | Specific location |
| | room_id | xsd:integer | 0..1 | Room identifier |
| | title | xsd:string | 1..1 | Lesson title |
| | description | xsd:string | 0..1 | Lesson description |
| | target_teacher | xsd:string | 0..1 | Target teacher notes |
| | target_student | xsd:string | 0..1 | Target student notes |
| | start_time | xsd:dateTime | 1..1 | Lesson start time |
| | end_time | xsd:dateTime | 1..1 | Lesson end time |
| | notice | xsd:integer | 1..1 | Notice period |
| | type | lesson_type | 1..1 | Lesson type |
| | duration | lesson_duration | 1..1 | Lesson duration |
| | status | lesson_status | 1..1 | Lesson status |
| | created | xsd:dateTime | 1..1 | Record creation date |
| | modified | xsd:dateTime | 1..1 | Last modification date |
| **matches** |
| | instruments | rdf:List | 0..1 | Matched instruments |
| | genres | rdf:List | 0..1 | Matched genres |
| | accept_teacher | xsd:boolean | 0..1 | Teacher acceptance |
| | accept_student | xsd:boolean | 0..1 | Student acceptance |
| | terminated | xsd:boolean | 0..1 | Match termination status |
| | created | xsd:dateTime | 1..1 | Record creation date |
| **files** |
| | type | file_type | 1..1 | File type |
| | url | xsd:anyURI | 1..1 | File URL |
| | key | xsd:string | 1..1 | Unique file key |
| | created | xsd:dateTime | 1..1 | Record creation date |
| **integrations** |
| | name | xsd:string | 1..1 | Integration name |
| | description | xsd:string | 0..1 | Integration description |
| | created | xsd:dateTime | 1..1 | Record creation date |
| | modified | xsd:dateTime | 1..1 | Last modification date |
| **teacher_integrations** |
| | link | xsd:anyURI | 1..1 | Integration link |
| | created | xsd:dateTime | 1..1 | Record creation date |
| | modified | xsd:dateTime | 1..1 | Last modification date |

### Object Properties (19)
| Source | Property | Target | Cardinality | Description |
|--------|----------|--------|-------------|-------------|
| teachers | hasUser | users | 1..1 | Teacher's user account |
| teachers | hasSchool | schools | 1..1 | Teacher's school |
| students | hasUser | users | 1..1 | Student's user account |
| students | hasSchool | schools | 0..1 | Student's school |
| schedules | hasUser | users | 1..1 | Schedule owner |
| lessons | hasTeacher | teachers | 1..1 | Lesson teacher |
| lessons | hasStudent | students | 1..1 | Lesson student |
| matches | hasTeacher | teachers | 1..1 | Match teacher |
| matches | hasStudent | students | 1..1 | Match student |
| user_confirmations | hasUser | users | 1..1 | User being confirmed |
| files | hasUser | users | 0..1 | File owner |
| files | hasSchool | schools | 0..1 | Associated school |
| users | managesSchool | schools | 0..1 | School being managed |
| teacher_integrations | hasIntegration | integrations | 1..1 | Integration type |
| teacher_integrations | hasTeacher | teachers | 1..1 | Associated teacher |
| integrations_schools | hasSchool | schools | 1..1 | School in integration |
| integrations_schools | hasIntegration | integrations | 1..1 | Integration type |

## Implementation Features
- Bilingual labels (EN/DE)
- Dublin Core terms integration
- Proper cardinality constraints
- Clear class hierarchies
- Standard vocabulary reuse
- Comprehensive documentation
