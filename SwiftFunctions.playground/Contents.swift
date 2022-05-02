import UIKit

//“Every function in Swift has a type, consisting of the function’s parameter types and return type”

func tellMovie(name:String) -> String{
    let m = name + " is a great movie!"
    return m
}

print(tellMovie(name:"The Godfather"))

//“Function Parameters and Return Values”

//“Function parameters and return values are extremely flexible in Swift. You can define anything from a simple utility function with a single unnamed parameter to a complex function with expressive parameter names and different parameter options.”

//Functions Without Parameters
func tellMovie() -> String{
        return "Dunkirk is a great movie!"
}

print(tellMovie())

//“Functions With Multiple Parameters”
func myFunc1(name:String, nclass:Int) -> String{

    return name + " is in class " + String(nclass)
}

print(myFunc1(name: "Raj", nclass: 9))


//“Functions Without Return Values”
// when using return inside a function, we need to specify the return type otherwise we don't need to write anything.

//here is an example of a function that doesn't have a return statement in it.

func myfunc2(n:String){
    print("\(n) is a great company!")
}
//“Because it doesn’t need to return a value, the function’s definition doesn’t include the return arrow (->) or a return type.”

//“Strictly speaking, this function does still return a value, even though no return value is defined. Functions without a defined return type return a special value of type Void. This is simply an empty tuple, which is written as ().”

myfunc2(n: "Apple")


//“The return value of a function can be ignored when it’s called:”

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}


func printWithoutCounting(string: String) { //this function doesn't have a return type so it will not return anything but it will execute the print statement of the function defined inside it.
    
    let _ = printAndCount(string: string)
}


print(printAndCount(string: "hello, world"))
// prints "hello, world" and returns a value of 12

print(printWithoutCounting(string: "hello, world"))
// prints "hello, world" but doesn't return a value

//“The first function, printAndCount(string:), prints a string, and then returns its character count as an Int. The second function, printWithoutCounting(string:), calls the first function, but ignores its return value. When the second function is called, the message is still printed by the first function, but the returned value isn’t used.


//Return values can be ignored, but a function that says it will return a value must always do so. A function with a defined return type can’t allow control to fall out of the bottom of the function without returning a value, and attempting to do so will result in a compile-time error.”




//“Functions with Multiple Return Values
//You can use a tuple type as the return type for a function to return multiple values as part of one compound return value.”

func myFunc3(movie:String, year:Int) -> (m: String, y:Int){
    print("Your searched for: ")
    var m = movie
    var y = year
    return (m, y)
}

print(myFunc3(movie: "Inception", year: 2010))


 func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

print(minMax(array: [2,3,41,21,09]))

//“Because the tuple’s member values are named as part of the function’s return type, they can be accessed with dot syntax to retrieve the values:”

var p = myFunc3(movie: "Interstellar", year: 2014)
print(p.m, "was released in the year", p.y)
