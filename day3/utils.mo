import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Buffer "mo:base/Buffer";


module Utils {

    // 1. Takes an array of Int and returns its second largest value
    public func second_maximum(array : [Int]) : async Int {
        // Sort array by value
        let sorted_array : [Int] = Array.sort<Int>(array, Int.compare);
        return sorted_array[sorted_array.size()-2];
    };


    // 2. Takes array of Nat and returns new array containing only the odd numbers of that array
    public func remove_even(array : [Nat]) : async [Nat] {
        let result = Buffer.Buffer<Nat>(0);
        for (val in array.vals()) {
            if (Nat.rem(val, 2) != 0) {
                result.add(val);
            };
        };
        return result.toArray();
    };


    // 3. Takes an array with generic type and drops the n first elements returning the remainder
    public func drop(xs : [T], n : Nat) : async [T] {
        let buffer = Buffer.fromArray<T>(xs);
        let result = Buffer.split<T>(buffer, n);
        return result.1.toArray();
    };


}