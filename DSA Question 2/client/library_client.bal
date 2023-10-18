import ballerina/io;

LibraryClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    Book addBookRequest = {title: "THE BIBLE", author_1: "Teef", author_2: "Joe", location: "shelf 3", isbn: "12345", status: true};
    string addBookResponse = check ep->addBook(addBookRequest);
    io:println(addBookResponse);

    Book updateBookRequest = {title: "theBIBLE", author_1: "Teef", author_2: "Brito", location: "shelf 2", isbn: "12345", status: true};
    Book updateBookResponse = check ep->updateBook(updateBookRequest);
    io:println(updateBookResponse);

    Book removeBookRequest = {title: "theBIBLE", author_1: "Teef", author_2: "Brito", location: "shelf 2", isbn: "12345", status: true};
    RepeatedBook removeBookResponse = check ep->removeBook(removeBookRequest);
    io:println(removeBookResponse);

    string locateBookRequest = "12345";
    string locateBookResponse = check ep->locateBook(locateBookRequest);
    io:println(locateBookResponse);

    BorrowRequest borrowBookRequest = {userId: "00000", isbn: "12345"};
    BorrowResponse borrowBookResponse = check ep->borrowBook(borrowBookRequest);
    io:println(borrowBookResponse);
    stream<

Book, error?> listAvailableBooksResponse = check ep->listAvailableBooks();
    check listAvailableBooksResponse.forEach(function(Book value) {
        io:println(value);
    });

    User createUsersRequest = {id: "00000", name: "John DOe", isStudent: true};
    CreateUsersStreamingClient createUsersStreamingClient = check ep->createUsers();
    check createUsersStreamingClient->sendUser(createUsersRequest);
    check createUsersStreamingClient->complete();
    UserResponse? createUsersResponse = check createUsersStreamingClient->receiveUserResponse();
    io:println(createUsersResponse);
}

