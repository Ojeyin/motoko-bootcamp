import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Cycles "mo:base/ExperimentalCycles";

actor {
    // challenge 1
    public query ({caller}) func is_anonymous(): async Bool{
        Principal.toText(caller) == "fzfpa-tqaaa-aaaak-qagga-cai"
    };

    // challenge 2
    let favorite_number = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

    // challenge 3
    public shared ({caller})  func add_favorite_number(n: Nat): async () {
         favorite_number.put(caller, n)
    };

    public query ({caller})  func show_favorite_number(): async ?Nat {
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
    public shared ({caller})  func update_favorite_number (n: Nat):  async Text{
        switch(favorite_number.get(caller)){
           case (?num) {favorite_number.put(caller, n); "Your number has been updated"};
           case (_) "You haven't registered your number";
       }
    };

     public shared ({caller})  func delete_favorite_number ():  async Text{
        switch(favorite_number.get(caller)){
           case (?num) {
               ignore favorite_number.remove(caller);
               "Your number has been deleted"
            };
           case (_) "You haven't registered your number";
       }
    };

    // challenge 6
    public shared func deposit_cycles(): async Nat{
        let msg_cycles = Cycles.available();
        Cycles.accept(msg_cycles);
    };

    // challenge 7
    stable var counter: Nat = 0;

    public func increment_counter(): async () {
        counter += 1;
    };

    public func show_counter(): async Nat{
        counter
    };

    stable var versionNumber = 0;

    system func postupgrade() {
        versionNumber += 1;
    };
    
}