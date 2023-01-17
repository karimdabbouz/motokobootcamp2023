import Nat "mo:base/Nat";

actor {

    // 1.
    public query func multiply(n : Nat, m: Nat) : async Nat {
        return n * m;
    };

    // 2.
    public query func volume(n : Nat) : async Nat {
        return n * n * n;
    };

    // 3.
    public query func hours_to_minutes(n : Nat) : async Nat {
        return n * 60;
    };

    // 4.
    var counter : Nat = 0;

    public func set_counter(n : Nat) : async () {
        counter := n;
    };

    public query func get_counter() : async Nat {
        return counter;
    };

    // 5.
    public query func test_divide(n : Nat, m: Nat) : async Bool {
        if (m > 0) {
            return true;
        } else {
            return false;
        };
    };

    // 6.
    public query func is_even(n : Nat) : async Bool {
        let rem = Nat.rem(n, 2);
        if (rem == 0) {
            return true;
        } else {
            return false;
        };
    };

}