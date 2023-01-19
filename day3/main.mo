import Buffer "mo:base/Buffer";
import List "mo:base/List";

import Book "book";
import Utils "utils";


actor {


    // ///////////
    // STATE
    // ///////////

    // 6. Creates an empty list to store our books to
    let bookList = List.nil<Book.Book>();
    let bookBuffer = Buffer.Buffer<Book.Book>(0); // this works better, but needs to be converted to array when upgrading



    // //////////////
    // FUNCTIONS
    // /////////////



    // 7. Takes a book and adds it to the list
    public func add_book(book : Book.Book) : () {
    // I don't use lists...
        bookBuffer.add(book);
    };


    // Returns all books stored to that list (as an array)
    public query func get_books() : async [Book.Book] {
        return bookBuffer.toArray();
    };


    // Call imported function (meaning: expose via actor I guess?)
    public func expose_second_maximum(array : [Int]) : async Int {
        let result = await Utils.second_maximum(array);
        return result;
    };
}