
import Hashmap "mo:base/Hashmap";
import Time "mo:base/Time";
import Result "mo:base/Result";
import Principal "mo:base/Principal";


actor {
    public type Time= Time.Time;
    public type Profile = {
        name: Text;
        age: Nat;
        registration_date : Time;
        premium : Bool;
    };

let users : Hashmap.Hashmap<Principal, Profile> = Hashmap.Hashmap<Principal, Profile>(0, Principal.equal, Principal.hash);
public shared ({caller}) func create_profile(user: Profile): async (){
    users.put(caller, user);
    return;
};

public query func read_profile(principal: Principal) : async?Profile{

};
    public func greet(name : Text) : async Text {
        return "Hello, " # name # "!";
    };

    private func greet (name : Text) : Text {
        return ("Hello, " # name # "!");
    };
};
