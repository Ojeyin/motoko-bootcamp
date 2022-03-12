
import Iter "mo:base/Iter";
import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";

actor{

    // To deploy this, run dfx deploy day_5_alternate
    stable var mapEntries: [(Principal, Nat)] = [];
    let favorite_number = HashMap.fromIter<Principal, Nat>(mapEntries.vals(), 0, Principal.equal, Principal.hash);

    // challenge 3
    public shared ({caller})  func add_favorite_number(n: Nat): async () {
         favorite_number.put(caller, n)
    };

    public shared ({caller})  func show_favorite_number(): async ?Nat {
       switch(favorite_number.get(caller)){
           case (?num) ?num;
           case (_) null;
       }
    };
    // challenge 4
    public shared ({caller}) func add_favorite_number_second_version(n: Nat): async Text {
       switch(favorite_number.get(caller)){
           case (null) {favorite_number.put(caller, n); "Your number has been added"};
           case (?num) "You've already registered your number";
       }
    };

    // challenge 5
    public shared ({caller}) func update_favorite_number (n: Nat):  async Text{
        
        switch(favorite_number.get(caller)){
           case (?num) {favorite_number.put(caller, n); "Your number has been updated"};
           case (_) "You haven't registered your number";
       }
    };

    // Store favorite_number
    system func preupgrade() {
        mapEntries := Iter.toArray(favorite_number.entries());

    };

    system func postupgrade() {
        mapEntries := [];
    };
}