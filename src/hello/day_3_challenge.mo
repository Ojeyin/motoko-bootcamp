import Array "mo:base/Array";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Buffer "mo:base/Buffer";
import Option "mo:base/Option";
import Iter "mo:base/Iter";
actor {

    // Challenge 1
    private func _swap(array : [Nat], i : Nat, j : Nat) :  [Nat] {
        let thaw_array : [var Nat] = Array.thaw(array);
        var temp : Nat = thaw_array[i];
        thaw_array[i] := thaw_array[j];
        thaw_array[j] := temp;
        //swaped_array
        return Array.freeze<Nat>(thaw_array);
    };

    public func swap(array : [Nat], i : Nat, j : Nat) : async [Nat] {
        return _swap(array : [Nat], i : Nat, j : Nat);
    };

    // Challenge 2
    public func init_count(n : Nat) : async [Nat] {
        return Array.tabulate<Nat>(n,func(n :Nat) : Nat { return n});
    };

    // Challenge 3
    public func seven(array : [Nat]) : async Text {
        for (value in array.vals()){
            if (value==7){
                return "Seven is found";
            };
        };
        return "Seven is not found";

    };

    // Challenge 4

    public func nat_opt_to_nat(n : ?Nat, m : Nat) : async Nat {
        switch(n){
            case(null){
                return m;
            };
            case(?n){
                return n;
            };
        };
    };

    // Challenge 5

    public func day_of_the_week(n : Nat) : async ?Text {
        let week : [Text] = ["Monday","Tueday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
        if (n>= 1 and n < 8){
            return ?week[n-1];
        };
        return null;
    };

    // Challenge 6
    public func populate_array(array: [?Nat]): async [Nat]{
        let buffer = Buffer.Buffer<Nat>(array.size());
        for (n in array.vals()){
            buffer.add(Option.get(n, 0));
        };

        return buffer.toArray();
    };

    // Challenge 7
    public func sum_of_array(arr: [Nat]): async Nat{
        var sum_array = 0;
        Iter.iterate<Nat>(arr.vals(), func(n, i){
            sum_array += n;
        });
        

        return sum_array;
    };

    // Challenge 8
    public func squared_array(array: [Nat]): async [Nat] {
        Array.map<Nat, Nat>(array, func(x){return x*x;})
    };   

    // Challenge 9
    public func increase_by_index(array: [Nat]): async [Nat] {
        Array.mapEntries<Nat, Nat>(array, func(x, y){return x+y;})
    }; 

    // challenge 10
     func contains<A>(array: [A], a: A, f: ((A, A))-> Bool):  Bool {
        for (i in array.vals()){
            if (f(i, a)){
                return true;
            };
        };
        return false;
    };

    public func test(array: [Nat], a: Nat): async Bool{
        return contains<Nat>(array, a, func(a, b) {a==b});
    };




};