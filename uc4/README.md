
# Music School Information Model: Database to OWL Mapping 🎵

## Overview 📋
 This document describes the mapping between the **Music School Database** schema ([view schema here](https://dbdiagram.io/d/MUSIQ-DB-65169a08ffbf5169f0baba29)) and its corresponding **OWL ontology** representation. The ontology was designed to be more generic and reusable while maintaining specific music school domain concepts.  

## Key Mapping Principles 🔑
- Database table names were generalized into music-specific OWL classes.
- Enumerations were converted to controlled vocabularies.
- Relationships were preserved through object properties.

## Core Class Mappings 🏛️

Database Table → OWL Class:
- `schools` → `MusicEducationSchool`
- `users` → `MusicSchoolMember`
- `teachers` → `MusicInstructor`
- `students` → `MusicLearner`
- `lessons` → `MusicInstruction`
- `matches` → `TeacherStudentPairing`

### Supporting Classes 🔧
Additional classes were created for better domain modeling:
- `MusicGenreCategory` (from genres[] columns)
- `MusicalInstrumentType` (from instruments[] columns)
- `MusicSchoolDocument` (from files table)
- `InstructionSchedule` (from schedules table)

### Integration Classes 🔌
- `ExternalMusicService` (from integrations table)
- `MusicInstructorIntegration` (from teacher_integrations table)

### Enumerations to OWL Classes and Instances 📚
Database enumerations were converted to semantic concepts:

# Enumerations to OWL Classes and Instances 📚

Database enumerations were converted to semantic concepts with proper class hierarchies:

1. Language System 🗣️ (`language`, `school_language`):
   - OWL Class: `MusicSchoolLanguage`
   - Instances: `EnglishLanguage`, `GermanLanguage`

2. User Roles 👥 (`user_role`):
   - OWL Class: `MusicSchoolMemberRole`
   - Instances: 
     * `RootAdminRole`
     * `SchoolAdminRole`
     * `MusicInstructorRole`
     * `MusicLearnerRole`

3. Gender and Preferences 👤:
   - Gender Class: `MusicSchoolMemberGender`
     * Instances: `MaleGender`, `FemaleGender`, `OtherGender`
   - Preference Class: `MusicSchoolMemberGenderPreference`
     * Instances: `MalePreference`, `FemalePreference`, `AnyGenderPreference`

4. Lesson Related 📖:
   - Place Class: `MusicInstructionPlace`
     * Instances: `OnlineInstruction`, `OfflineInstruction`
   - Type Class: `MusicInstructionType`
     * Instances: `TrialInstruction`, `SingleInstruction`, `RepeatInstruction`
   - Duration Class: `MusicInstructionDuration`
     * Instances: `Duration35Minutes`, `Duration45Minutes`, `Duration60Minutes`
   - Status Class: `MusicInstructionStatus`
     * Instances: `PendingStatus`, `AcceptedStatus`, `CompletedStatus`, `CanceledStatus`

5. Document Types 📄 (`file_type`):
   - OWL Class: `MusicSchoolDocumentType`
   - Instance: `AvatarDocument`

6. Confirmation Types 🔐 (`user_confirmation`):
   - OWL Class: `MusicSchoolMemberConfirmationType`
   - Instances:
     * `RegistrationConfirmation`
     * `RecoveryConfirmation`

7. Notification System 🔔 (`school_match_notification`):
   - OWL Class: `MusicSchoolMatchNotification`
   - Instances: 
     * `SendToSchoolNotification`
     * `SendToTeacherNotification`

8. Experience Levels 📈:
   - OWL Class: `MusicExperienceLevel`
   - Instances: 
     * `BeginnerLevel`
     * `IntermediateLevel`
     * `AdvancedLevel`


## Database Column to OWL Property Mappings 🔄

Database Column Types → OWL Properties:
- Primary Keys (uuid) → URI identifiers
- Foreign Keys → owl:ObjectProperty
- Regular Columns → owl:DatatypeProperty

### Examples 💡:
- `teachers.id` (Primary Key) → URI for MusicInstructor instances
- `teachers.school_id` (Foreign Key) → ObjectProperty linking MusicInstructor to MusicEducationSchool
- `teachers.years_experience` (Regular Column) → DatatypeProperty with xsd:integer range


## Object Properties 🔗

1. Relationship Properties 🤝
```
hasUser                  # 👤 Links Teacher/Student to User profile
hasSchoolAssociation     # 🏫 Links School to Members/Documents
hasInstructionParticipant # 👥 Links Instruction to Participants
hasInstructionSchedule   # 📅 Links to Time Slots
hasServiceIntegration    # 🔌 External Service Connections
hasMemberConfirmation    # ✅ Links to Verification Events
hasAssociatedDocument    # 📄 Links to Related Documents
hasTeacherStudentMatch   # 🤝 Links Teachers to Students
```

2. Profile & Preference Properties 👤
```
hasMusicalProfile        # 🎵 Links to Instruments/Genres
hasTeachingPreference    # 👩‍🏫 Teaching Preferences
hasGenderPreference      # ⚧️ Gender Teaching Preferences
hasAgePreference        # 👶 Age Group Preferences
hasExperienceLevel      # 📈 Experience Classification
hasPreferredLocation    # 📍 Teaching/Learning Locations
hasNotificationPreference # 🔔 Match Notification Settings
hasStudentExperienceLevel # 📚 Student Experience Level
```

3. Classification Properties 🏷️
```
hasType                 # 📑 Entity Type Classification
hasStatus              # 📊 Current State
hasRole                # 👥 System Role Assignment
hasCurrency            # 💰 Currency Specification
hasPrimaryLanguage     # 🗣️ Primary Communication Language
hasSpokenLanguages     # 🌐 Additional Languages
hasPriceRange         # 💲 Price Structure
```

## Datatype Properties 📊

1. Identification Properties 🪪
```
hasFirstName           # 📛 Person First Name
hasLastName            # 📛 Person Last Name
hasEmail              # 📧 Email Address
hasPhoneNumber        # 📱 Contact Number
hasDescription        # 📝 Detailed Description
hasWebsite            # 🌐 Website URL
hasPasswordHash       # 🔑 Password Storage
```

2. Location Properties 📍
```
hasCity               # 🏙️ City Location
hasPostalCode         # 📮 Postal Code
hasLocation           # 📌 Location Details
hasCoordinates        # 🗺️ Geographic Coordinates
```

3. Temporal Properties ⏰
```
hasCreationTime       # 🆕 Creation Timestamp
hasModificationTime   # 🔄 Last Modified Time
hasDeletionTime      # ❌ Deletion Time
hasBirthday          # 🎂 Date of Birth
hasStartTime         # ▶️ Event Start
hasEndTime           # ⏹️ Event End
```

4. Numerical Properties 🔢
```
hasMusicInstructorsAmount  # 👩‍🏫 Number of Instructors
hasMusicLearnersAmount     # 👨‍🎓 Number of Students
hasYearsExperience        # ⏳ Teaching Experience
hasNoticePeriod           # ⏰ Required Notice
hasRoomId                # 🚪 Room Assignment
```

5. Status Properties (Boolean) ✅
```
isConfirmed           # ✔️ Confirmation Status
isValidated           # ✅ Validation Status
canTeachMinors        # 🧒 Minor Teaching Authorization
allowsEmailContact    # 📧 Email Permission
allowsPhoneContact    # 📱 Phone Permission
hasTeacherAcceptance  # 👩‍🏫 Teacher Match Acceptance
hasStudentAcceptance  # 👨‍🎓 Student Match Acceptance
isTerminated          # 🛑 Termination Status
isTopTen             # 🏆 Top 10 Status
isAvailableInMusiq   # ✨ Platform Availability
```

6. Complex Data Properties (JSON) 📦
```
hasEducation          # 🎓 Educational Background
hasSocialMedia        # 📱 Social Media Presence
hasUnionMemberships   # 🤝 Professional Affiliations
```

7. Resource Identifier Properties 🔍
```
hasUrl               # 🔗 Resource URL
hasLink              # 🔗 Integration Link
hasKey               # 🔑 Unique Key
hasGndIdentifier     # 🏷️ Authority Reference
hasWikidataIdentifier # 📚 Wikidata Reference
hasMimoIdentifier    # 🎵 MIMO Reference
```

```

## Ontology Improvements 🚀
1. More specific naming conventions aligned with music domain.
2. Proper class hierarchies with rdfs:subClassOf relationships.
3. Integration with standard ontologies (schema.org, FOAF, etc.)
4. Clear separation of administrative and domain concepts

## Notes 📝
- The ontology maintains backward compatibility with the database schema
- Additional semantic relationships were added for richer domain modeling
- Class names reflect music-specific concepts for better reusability