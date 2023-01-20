import List "mo:base/List";
import Principal "mo:base/Principal";
import Buffer "mo:base/Buffer";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";


actor {


    // // 1. Takes a list and returns a new list where all duplicate elements have been removed
    private func unique<T>(l : List.List<T>) : List.List<T> {
        // core project is fun
        return l;
    };


    // 2. Takes a list and returns it in reversed order
    private func reverse<T>(l : List.List<T>) : List.List<T> {
        return List.reverse(l);
    };


    // 3. Returns a bool saying whether the caller is anonymous or not
    public shared(msg) func is_anonymous() : async Bool {
        return msg.caller == Principal.fromText("2vxsx-fae");
    };


    // 4. Takes a buffer and a value of same type and returns the optional index of its first occurrence
    private func find_in_buffer<T>(buf : Buffer.Buffer<T>, val : T) : () {
        let result = Buffer.indexOf<T>(val, buf, func x = x == val);
        // idk how to return ?T (if that is even possible)
    };


    // 5. Add function containing array of tuples from the entries of a HashMap
    let usernames = HashMap.HashMap<Principal, Text>(0, Principal.equal, Principal.hash);

    public shared ({ caller }) func add_username(name : Text) : async () {
      usernames.put(caller, name);
    };

    public func get_usernames() : async [(Principal, Text)] {
        return Iter.toArray(usernames.entries());
    };

};