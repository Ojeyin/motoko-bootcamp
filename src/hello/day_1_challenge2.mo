import Array "mo:base/Array";
import Char "mo:base/Char";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";

actor{
    public func square (n : Nat): async Nat{
        return (n * n);
    };
};

    public func days_to_seconds(n: Nat): async Nat{
        return (n /(3600*24));
    };

    public func increment_counter(n: Nat): async Nat{
        increment_value +=n;
        return increment_value;
    };    
    public func clear_counter (): async Nat{
        counter_value = 0;
        return counter_value;
    };
    public func divide (n: Nat, m: Nat); async Bool{
        return True if n%m == 0;
    };

    public func is_even (n: Nat); async Bool{
        return True if n%2 == 0;
    };

    public func sum_of_array (n: [Nat]); async Nat{
        var sum=0;
        for (val in array.vals()){
            sum+=val
        };
        return (sum)
    };
    public func maximum(array: [Nat]): async Nat{
        if(array.size()==0) return 0;
        var maximum = array[0];
        for (val in array.vals()){
            if (val >= maximum){
                maximum: = val;
            };
        };
        return (maximum)
    };
    public func remove_from_array(n: Nat, array: [Nat]): async [Nat{
        var new_array: [Nat]=[];
        for (vals in array.vals()){
            if(vals !=n){
                new_array: = Array.append<Nat>(new_array, [vals]);
            };
        };
        return (new_array);
    };
private func _swap(array: [Nat], i: Nat, j:Nat): [Nat]{
        let array_mutable = Array.thaw<Nat>(array);
        let tmp = array[i];
        array[i] := array[j];
        array[j] := tmp;
        return(Array.freeze<Nat>(array));
};        
public func selection_sort(array : [Nat]): async [Nat]{
    var sorted = array;
    let size = array.size();
    for (i in Iter.range(0, size-1)){
        var index_minimum = i;
        for (j in Iter.range(i, size-1)){
            if (sorted[j]<sorted[index_minimum]){
                index_minimum: = j;
            };
        };
    };
    sorted := _swap(sorted, index_minimum, i);
    };
    return(sorted);
};
