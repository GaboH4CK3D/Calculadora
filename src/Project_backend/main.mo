import Float "mo:base/Float";
import Array "mo:base/Array";
import Option "mo:base/Option";
import Nat "mo:base/Nat";
import HashMap "mo:base/HashMap";

actor calculadora {

  var mean : Float = 0.0;

  public query func calculate(arrayData: [Float]) : async [Float] {
    for (number in arrayData.vals()) {
      mean += number;
    };
    mean := mean / Float.fromInt(arrayData.size());
    
    var mediumIndex  : Nat = (arrayData.size()/2) +1;
    var medium : Float = 0.0;
    if (arrayData.size() % 2 == 0) {
      // If the array has even length, take the average of the two middle elements
      medium := (arrayData[mediumIndex - 1] + arrayData[mediumIndex]) / 2.0;
    } else {
      // If the array has odd length, take the middle element
      medium := arrayData[mediumIndex];
    };
    
    // let frecuencia: HashMap.HashMap<Float, Float> = HashMap.empty();

    // Array.iter(fun(elemento: Float) {
    //   frecuencia.put(elemento, Option.getOrDefault(frecuencia.get(elemento as Float), 0.0) + 1.0)
    // }, arrayData);

    // var moda : Float = 0.0;
    // var maxFrecuencia : Float = 0.0;
    
    // // Encontrar el elemento con la frecuencia máxima
    // HashMap.entries(frecuencia)(fun(par : (Float, Float)) {
    //     let (elemento, frec) = par;
    //     if (frec > maxFrecuencia) {
    //         maxFrecuencia = frec;
    //         moda = elemento;
    //     };
    // });
    // Return mean, median, mode
    return [mean, medium];
  };
};
