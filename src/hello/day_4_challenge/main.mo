import Custom "custom";
import Animal "animal";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import List "mo:base/List";
actor {

    
    public type Patient = Custom.Patient;

    public func fun(): async Student {
        let Patient_data : Patient = {
        name = "Oluwo Lateef";
        age = 40;
        height = 160;
        weight = 70;
        nationality = "Nigeria";
        specimen = "Venous Blood"
    }; 
        return Patient_data;
    }; 

    
    public type Animal = Animal.Animal;
    let owl : Animal = {
        species = "aves ";
        energy = 86;
    };

    public func create_animal_then_takes_a_break(species: Text, energy : Nat) : async Animal {
        let specie_energy = {
            species;
            energy;
        };
        return Animal.animal_sleep(specie_energy);
    };

    
    var animalList : List.List<Animal> = List.nil<Animal>();

    public func push_animal(animal : Animal) : async () {
        animalList := List.push(animal, animalList);
    };

    public func get_animals() : async [Animal] {
        return List.toArray(animalList);
    };
    
};