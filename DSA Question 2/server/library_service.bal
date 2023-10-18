import ballerina/grpc;

listener grpc:Listener ep = new (9090);

table<Book> key(isbn) bookTable = table [];
table<User> key(id) userTable = table [];

@grpc:Descriptor {value: LIBRARY_DESC}
service "Library" on ep {

    remote function addBook(Book value) returns string|error {
        error? addNewBook = bookTable.add(value);
        if addNewBook is error {
            return addNewBook;
        } else {
            return "Book added successfully";
        }
    }
    remote function updateBook(Book value) returns Book|error {
        error? updateBook = bookTable.put(value);
        if updateBook is error {
            return updateBook;
        } else {
            return bookTable.get(value.isbn);
        }
    }
    remote function removeBook(Book value) returns RepeatedBook|error {
        Book deletedBook = bookTable.remove(value.isbn);

        return {books: [deletedBook]};
    }
    remote function locateBook(string value) returns string|error {
        Book getBook = bookTable.get(value);
        if (getBook.isbn === "") {
            return "Book cannot found";
        } else {
            return getBook.title;
        }
    }
    remote function borrowBook(BorrowRequest value) returns BorrowResponse|error {
        Book book = bookTable.get(value.isbn);
        if (book.isbn === "") {
            return error("Book cannot found");
        } else {
            User user = userTable.get(value.userId);
            if (user.id === "") {
                return error("User cannot found");
            } else {
                // Fix this part you dont have borrowedBy in your record
                // book.borrowedBy = value.id;
                // Becareful with the values you used in you record the record have userId not id

                //correct this line book.borrowedBy = value.userId;
                bookTable.put(book);

                // What exactly are you doing here you supposed to return a record with message and status see my implementation below 
                // BorrowResponse borrowResponse = BorrowResponse{status: "Success"};
                // thus what you were suppose to return
                return {message: value.userId + " user borrowed book successful", success: true};
            }
        }
    }
    remote function createUsers(stream<User, grpc:Error?> clientStream) returns UserResponse|error {
        // Using arrow functions in foreach loop you dont put {} brackets
        grpc:Error? forEach = clientStream.forEach((user) => userTable.add(user));
        // same mistake as above function you dont declare records like this 
        // look all examples we did in class on how to create records.
        // return UserResponse{status: "Success"};
        // you should be return an array of users as what you mentioned in your UserResponse. What is this you are returning?
        return {users: userTable.toArray()};
    }
    remote function listAvailableBooks() returns stream<Book, error?>|error {
        // stream<Book, error?> bookStream = stream from var book in bookTable.toArray()
        // select book where book.borrowedBy == "";
        // the "where" statement comes before the "select"

        // make user you added the borrowedBy filed in your Book record.
        stream<Book, error?> bookStream = stream from var book in bookTable.toArray()
            where book.borrrowedBy === ""
            select book;

        return bookStream;
    }
}

