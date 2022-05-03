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




//“Optional Tuple Return Types

//If the tuple type to be returned from a function has the potential to have “no value” for the entire tuple, you can use an optional tuple return type to reflect the fact that the entire tuple can be nil. You write an optional tuple return type by placing a question mark after the tuple type’s closing parenthesis, such as (Int, Int)? or (String, Int, Bool)?.”

func minMaximum(array: [Int]) -> (min: Int, max: Int)?{
    if array.isEmpty{
        print("You have inserted an empty as an input.")
        return nil
    }
    
    if array.count == 1{
        print("comparison not possible as there is only one item.")
        return nil
    
    }
    var currentMin = array[0]
    var currentMax = array[0]
    
    for i in array[1..<array.count]{
        if i < currentMin{
            currentMin = i
        }
        else if i > currentMax{
            currentMax = i
        }
    }
    return(currentMin,currentMax)
}

print(minMaximum(array: []))

var h: Int?
print(h)

//“You can use optional binding to check whether this version of the minMax(array:) function returns an actual tuple value or nil:”

if let mM = minMaximum(array: [2,3,4,1]){
    print("min number is \(mM.min) and max number is \(mM.max)")
}

if let a = minMaximum(array: []){
    print("min number is \(a.min) and max number is \(a.max)")
}




//“Functions With an Implicit Return
//If the entire body of the function is a single expression, the function implicitly returns that expression. For example, both functions below have the same behavior:

func myFunc4(n:Int) -> String{
    return "You typed \(n)."
}

print(myFunc4(n: 4))

func myFunc5(n:Int) -> String{
    "You typed \(n)."
}

print(myFunc5(n: 5))
//“ Any function that you write as just one return line can omit the return.”


//“NOTE
//The code you write as an implicit return value needs to return some value. For example, you can’t use print(13) as an implicit return value. However, you can use a function that never returns like fatalError("Oh no!") as an implicit return value, because Swift knows that the implicit return doesn’t happen.”

//Function Argument Labels and Parameter Names
//Each function parameter has both an argument label and a parameter name. The argument label is used when calling the function; each argument is written in the function call with its argument label before it. The parameter name is used in the implementation of the function. By default, parameters use their parameter name as their argument label.”


//“All parameters must have unique names. Although it’s possible for multiple parameters to have the same argument label, unique argument labels help make your code more readable.”



//Specifying Argument Labels
//You write an argument label before the parameter name, separated by a space:

func myFunc6(argumentLabel parameterName: Int){
    print(parameterName)
}

myFunc6(argumentLabel: 90) //while calling a fuction, argument label is used.




//“Omitting Argument Labels
//If you don’t want an argument label for a parameter, write an underscore (_) instead of an explicit argument label for that parameter.”

func myFunc7(_ parameterName: Int){
    print(parameterName)
}

myFunc7(89)

//“Default Parameter Values
//You can define a default value for any parameter in a function by assigning a value to the parameter after that parameter’s type. If a default value is defined, you can omit that parameter when calling the function.”

func myFunc8(noDefaultValue: Int, defaultValue: Int = 27){
    print("Parameter without default value is: \(noDefaultValue)\nParameter with default value is: \(defaultValue)")
}

myFunc8(noDefaultValue: 56)

//you can also assign a value to the parameter with a default value.
myFunc8(noDefaultValue: 56,defaultValue: 77)

