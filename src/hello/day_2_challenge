import Nat8 "mo:base/Nat8";
import Nat32 "mo:base/Nat32";
import Nat "mo:base/Nat";
import Char "mo:base/Char";
import Text "mo:base/Text";
import Array "mo:base/Array";
actor {

    public func nat_to_nat8(n : Nat) : async Nat8 {
      assert(n < 256);
      return Nat8.fromNat(n);
    };  

    // Challenge 2
    public func max_number_with_n_bits(n : Nat) : async Nat {
      let ans : Nat = 2**n-1;
      return ans;
    };
    // Challenge 3
    public func decimal_to_bits(n: Nat) : async Text {
        var bits : Text = "";
        var decimal : Nat = n;
        while (decimal > 0){
            bits := Nat.toText(decimal % 2) # bits;
            decimal := decimal/2;
        };
        return bits;
    };

    // Challenge 4
    public func capitalize_character( t : Text) : async Text {
        //let c: Char = Text.toChar(t);
        var c : Char = 't';
        for (i in t.chars()){
            c := i;
        };
        if (Char.isUppercase(c)){
            return Char.toText(c);
        } else {
            let c_unicode : Nat32 = Char.toNat32(c);  
            let unicode_to_decimal : Nat = Nat32.toNat(c_unicode)-32;
            let upper_case_unicode : Nat32 = Nat32.fromNat(unicode_to_decimal);
            let char : Char = Char.fromNat32(upper_case_unicode);
    	    
            return Char.toText(char);
        };
    };

    // Challenge 5
    public func capitalize_text(text : Text) : async Text {
        var result : Text = "";
        var t_to_text : Text = "";
        var char_capitalized : Text = "";
        for (t in text.chars()){
            t_to_text := Char.toText(t);
            char_capitalized := await capitalize_character(t_to_text);
            result := result # char_capitalized;
        };
        return result;
    };

    // Challenge 6
    public func is_inside(text: Text, c : Text) : async Bool {
        let p = #text(c);
        return Text.contains(text, p);
    };

    // Challenge 7
    public func trim_whitespace(text : Text) : async Text {
        let p = #text(" ");
        return Text.trim(text, p)
    };

    // Challenge 8
    public func duplicated_character(text : Text) : async Text {
        var message : Text = "";
        var text_char : Text = "";
        var temp : Text = "";
        var array : [Text] = [];
        for (char in text.chars()){
            temp:= Char.toText(char);
            var p = #text(temp);
            if (Text.contains(message,p)){
                text_char := text_char # temp;
                array := Array.append(array, [temp])
            };
            message := message # temp;
        };
        if (text_char.size() != 0){
            return array[0];
        } else {
            return text;
        };
    };

    // Challenge 9
    //public func size_in_bytes(text : Text) : async Nat8 {
     //   g
    //};

    // Challenge 10
    public func bubble_sort(arr : [Nat]) : async [Nat] {
        var sorted_array : [Nat] = Array.sort(arr, Nat.compare);
        return sorted_array;
    };

};