import ballerina/http;

type Lecturer record{
    readonly string staffNum;
    string staffName;
    string gender;
    string officeNum;
    string title;
    string course;
};


table<Lecturer> key(staffNum) lecturersTable = table[];

service / on new http:Listener(9090) {
resource function post addLecturer(Lecturer newLecturer) returns string | error {
        error? addLecturer = lecturersTable.add(newLecturer);
        if addLecturer is error{
            return error("Failed to add new lecturer.");
        }
        return newLecturer.staffName +" created successfully.";
    }

    resource function get getAllLecturers() returns Lecturer[] | error {
        Lecturer[] lecturerList = [];
        foreach var lecturer in lecturersTable {
            lecturerList.push(lecturer);
        }
        return lecturerList;
    }

    resource function put updateLecturer(string staffNum, Lecturer updatedLecturer) returns string | error {
        // Find the existing lecturer by staff number
        Lecturer? existingLecturer = lecturersTable[staffNum];
        if (existingLecturer == null) {
            return error("Lecturer with staff number " + staffNum + " not found.");
        }

        // Update the existing lecturer's information with the provided data
        existingLecturer.staffName = updatedLecturer.staffName;
        existingLecturer.gender = updatedLecturer.gender;
        existingLecturer.officeNum = updatedLecturer.officeNum;
        existingLecturer.title = updatedLecturer.title;

        return "Lecturer with staff number " + staffNum + " updated successfully.";
    }

     // Resource function to retrieve details of a specific lecturer by staff number
    resource function get getLecturerByStaffNum(string staffNum) returns Lecturer | error {
        // Find the lecturer by staff number
        Lecturer? lecturer = lecturersTable[staffNum];
        if (lecturer == null) {
            return error("Lecturer with staff number " + staffNum + " not found.");
        }
        return lecturer;
    }

// Resource function to delete a lecturer by staff number
    resource function delete deleteLecturerByStaffNum(string staffNum) returns string | error {
    // Check if the lecturer exists by staff number
        Lecturer? existingLecturer = lecturersTable[staffNum];
        if (existingLecturer == null) {
            return error("Lecturer with staff number " + staffNum + " not found.");
    }

    
    _ = lecturersTable.remove(existingLecturer.staffNum);

    return "Lecturer with staff number " + staffNum + " deleted successfully.";
}

 // Resource function to retrieve all lecturers that sit in the same office
    resource function get getLecturersInSameOffice(string officeNum) returns Lecturer[] | error {
        Lecturer[] lecturersInSameOffice = [];
        foreach var lecturer in lecturersTable {
            if (lecturer.officeNum == officeNum) {
                lecturersInSameOffice.push(lecturer);
            }
        }
        return lecturersInSameOffice;
    }

// Resource function to retrieve all lecturers that teach a certain course
    resource function get getLecturersTeachingCourse(string courseName) returns Lecturer[] | error {
        Lecturer[] lecturersTeachingCourse = [];
        foreach var lecturer in lecturersTable {
            if (lecturer.course == courseName) {
                lecturersTeachingCourse.push(lecturer);
            }
        }
        return lecturersTeachingCourse;
    }
}
