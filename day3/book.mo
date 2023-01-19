module Book {


    // 4. Define a custom type for a book with title and num of pages
    public type Book = {title: Text; pages: Nat};


    // 5. Takes a string and number of pages to create a new book
    public func create_book(title : Text, pages : Nat) : async Book {
        let newBook : Book = {
            title = title;
            pages = pages;
        };
        return newBook;
    };


}