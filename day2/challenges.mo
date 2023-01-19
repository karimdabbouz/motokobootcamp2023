import Text "mo:base/Text";
import Char "mo:base/Char";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import TrieMap "mo:base/TrieMap";
import Hash "mo:base/Hash";

actor {

    // 1. Takes array of integers and returns the avg. value of elements in array
    public func average_array(array : [Int]) : async Int {
        var sum : Int = 0;
        for (elem in array.vals()) {
            sum += elem;
        };
        return sum / array.size();
    };


    // 2. Takes a string and a char and returns the number of occurrences of that char in the string
    public func count_character(t : Text, c : Char) : async Nat {
        var counter : Nat = 0;
        for (char in Text.toIter(t)) {
            if (char == c) {
                counter += 1;
            };
        };
        return counter;
    };
    

    // 3. Takes a Nat and returns its factorial
    public func factorial(n : Nat) : async Nat {
        var result = 1;
        if (n > 1) {
            for (x in Iter.range(1, n)) {
                result := result * x;
            };
        };
        return result;
    };


    // 4. Takes a sentence and returns the number of words
    public func number_of_words(t : Text) : async Nat {
        let pattern : Text.Pattern = #char(' ');
        let array = Iter.toArray(Text.split(t, pattern));
        return array.size();
    };


    // 5. Takes array of Nat and returns array with all duplicate entries in the same order as the original array
    // Compiles, but doesn't work:
    public func find_duplicates(a : [Nat]) : async [Nat] {
        let lookedAt = Buffer.Buffer<Nat>(0);
        let duplicates = Buffer.Buffer<Nat>(0);
        for (val1 in a.vals()) {
            lookedAt.add(val1);
            for (val2 in lookedAt.toArray().vals()) {
                if (val2 == val1) {
                    duplicates.add(val1); // NO!!
                };
            };
        };
        return duplicates.toArray();
    };

    
    // not working either
    public func planB(a : [Nat]) : async [Nat] {
        let result = Buffer.Buffer<Nat>(0);
        let occurences = TrieMap.TrieMap<Nat, Nat>(Nat.equal, Hash.hash);
        // 1) TrieMap keeps track of occurences
        for (val in a.vals()) {
            let entry = occurences.get(val);
            switch entry {
                case null { // first appearance of value
                    occurences.put(val, 1);
                };
                case (?found) {
                    var numAppearances = found;
                    numAppearances += 1;
                    occurences.put(val, numAppearances);
                };
            };
        };
        for (val in a.vals()) {
            let match = occurences.get(val);
            switch match {
                case null {
                    // continue
                };
                case (?item) {
                    if (item > 1) {
                        result.add(val);
                    };
                };
            };
        };
        return result.toArray();
    };


    // // 6. Takes a Nat and returns string with binary representation of n
    // public func convert_to_binary(n : Nat) : async Nat {
    //     let table : [Nat] = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]; // REVERSE THIS!
    //     let result = Buffer.Buffer<Nat>(0);
    //     for (key in table.keys()) {
    //         if (n <= table[key]) {
    //             result.add(1);
    //             // subtract and reassign
    //         } else {
    //             result.add(0);
    //         };
    //     };
    //     return result.toArray();
    // };
}