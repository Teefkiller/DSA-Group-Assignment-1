import ballerina/grpc;
import ballerina/protobuf;
import ballerina/protobuf.types.empty;
import ballerina/protobuf.types.wrappers;

public const string LIBRARY_DESC = "0A0D6C6962726172792E70726F746F120E4C696272617279536572766963651A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F1A1B676F6F676C652F70726F746F6275662F656D7074792E70726F746F229A010A04426F6F6B12140A057469746C6518012001280952057469746C6512190A08617574686F725F311802200128095207617574686F723112190A08617574686F725F321803200128095207617574686F7232121A0A086C6F636174696F6E18042001280952086C6F636174696F6E12120A046973626E18052001280952046973626E12160A06737461747573180620012808520673746174757322480A0455736572120E0A0269641801200128095202696412120A046E616D6518022001280952046E616D65121C0A09697353747564656E741803200128085209697353747564656E74223A0A0C5265706561746564426F6F6B122A0A05626F6F6B7318012003280B32142E4C696272617279536572766963652E426F6F6B5205626F6F6B73223B0A0D426F72726F775265717565737412160A06757365724964180120012809520675736572496412120A046973626E18022001280952046973626E22440A0E426F72726F77526573706F6E736512180A077375636365737318012001280852077375636365737312180A076D65737361676518022001280952076D657373616765223A0A0C55736572526573706F6E7365122A0A05757365727318012003280B32142E4C696272617279536572766963652E557365725205757365727332E6030A074C696272617279123D0A07616464426F6F6B12142E4C696272617279536572766963652E426F6F6B1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512430A0B637265617465557365727312142E4C696272617279536572766963652E557365721A1C2E4C696272617279536572766963652E55736572526573706F6E7365280112380A0A757064617465426F6F6B12142E4C696272617279536572766963652E426F6F6B1A142E4C696272617279536572766963652E426F6F6B12400A0A72656D6F7665426F6F6B12142E4C696272617279536572766963652E426F6F6B1A1C2E4C696272617279536572766963652E5265706561746564426F6F6B12440A126C697374417661696C61626C65426F6F6B7312162E676F6F676C652E70726F746F6275662E456D7074791A142E4C696272617279536572766963652E426F6F6B300112480A0A6C6F63617465426F6F6B121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565124B0A0A626F72726F77426F6F6B121D2E4C696272617279536572766963652E426F72726F77526571756573741A1E2E4C696272617279536572766963652E426F72726F77526573706F6E7365620670726F746F33";

public isolated client class LibraryClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, LIBRARY_DESC);
    }

    isolated remote function addBook(Book|ContextBook req) returns string|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryService.Library/addBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }

    isolated remote function addBookContext(Book|ContextBook req) returns wrappers:ContextString|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryService.Library/addBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }

    isolated remote function updateBook(Book|ContextBook req) returns Book|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryService.Library/updateBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Book>result;
    }

    isolated remote function updateBookContext(Book|ContextBook req) returns ContextBook|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryService.Library/updateBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Book>result, headers: respHeaders};
    }

    isolated remote function removeBook(Book|ContextBook req) returns RepeatedBook|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryService.Library/removeBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <RepeatedBook>result;
    }

    isolated remote function removeBookContext(Book|ContextBook req) returns ContextRepeatedBook|grpc:Error {
        map<string|string[]> headers = {};
        Book message;
        if req is ContextBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryService.Library/removeBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <RepeatedBook>result, headers: respHeaders};
    }

    isolated remote function locateBook(string|wrappers:ContextString req) returns string|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryService.Library/locateBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }

    isolated remote function locateBookContext(string|wrappers:ContextString req) returns wrappers:ContextString|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryService.Library/locateBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }

    isolated remote function borrowBook(BorrowRequest|ContextBorrowRequest req) returns BorrowResponse|grpc:Error {
        map<string|string[]> headers = {};
        BorrowRequest message;
        if req is ContextBorrowRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryService.Library/borrowBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BorrowResponse>result;
    }

    isolated remote function borrowBookContext(BorrowRequest|ContextBorrowRequest req) returns ContextBorrowResponse|grpc:Error {
        map<string|string[]> headers = {};
        BorrowRequest message;
        if req is ContextBorrowRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryService.Library/borrowBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BorrowResponse>result, headers: respHeaders};
    }

    isolated remote function createUsers() returns CreateUsersStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("LibraryService.Library/createUsers");
        return new CreateUsersStreamingClient(sClient);
    }

    isolated remote function listAvailableBooks() returns stream<Book, grpc:Error?>|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeServerStreaming("LibraryService.Library/listAvailableBooks", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        BookStream outputStream = new BookStream(result);
        return new stream<Book, grpc:Error?>(outputStream);
    }

    isolated remote function listAvailableBooksContext() returns ContextBookStream|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeServerStreaming("LibraryService.Library/listAvailableBooks", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        BookStream outputStream = new BookStream(result);
        return {content: new stream<Book, grpc:Error?>(outputStream), headers: respHeaders};
    }
}

public client class CreateUsersStreamingClient {
    private grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendUser(User message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextUser(ContextUser message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveUserResponse() returns UserResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <UserResponse>payload;
        }
    }

    isolated remote function receiveContextUserResponse() returns ContextUserResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <UserResponse>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public class BookStream {
    private stream<anydata, grpc:Error?> anydataStream;

    public isolated function init(stream<anydata, grpc:Error?> anydataStream) {
        self.anydataStream = anydataStream;
    }

    public isolated function next() returns record {|Book value;|}|grpc:Error? {
        var streamValue = self.anydataStream.next();
        if (streamValue is ()) {
            return streamValue;
        } else if (streamValue is grpc:Error) {
            return streamValue;
        } else {
            record {|Book value;|} nextRecord = {value: <Book>streamValue.value};
            return nextRecord;
        }
    }

    public isolated function close() returns grpc:Error? {
        return self.anydataStream.close();
    }
}

public type ContextUserStream record {|
    stream<User, error?> content;
    map<string|string[]> headers;
|};

public type ContextBookStream record {|
    stream<Book, error?> content;
    map<string|string[]> headers;
|};

public type ContextUserResponse record {|
    UserResponse content;
    map<string|string[]> headers;
|};

public type ContextRepeatedBook record {|
    RepeatedBook content;
    map<string|string[]> headers;
|};

public type ContextUser record {|
    User content;
    map<string|string[]> headers;
|};

public type ContextBorrowRequest record {|
    BorrowRequest content;
    map<string|string[]> headers;
|};

public type ContextBook record {|
    Book content;
    map<string|string[]> headers;
|};

public type ContextBorrowResponse record {|
    BorrowResponse content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type UserResponse record {|
    User[] users = [];
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type RepeatedBook record {|
    Book[] books = [];
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type User record {|
    string id = "";
    string name = "";
    boolean isStudent = false;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BorrowRequest record {|
    string userId = "";
    string isbn = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type Book record {|
    string title = "";
    string author_1 = "";
    string author_2 = "";
    string location = "";
    string isbn = "";
    boolean status = false;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BorrowResponse record {|
    boolean success = false;
    string message = "";
|};

