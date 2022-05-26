import Foundation

var number = readLine()?.split(separator: " ").map{Int($0)}
var pokemonName = [String : Int]()
var pokemonNum  = [Int : String]()
for item in 0..<number![0]!{
    var pokemon = readLine()!
    pokemonName[pokemon] = item+1
    pokemonNum[item+1] = pokemon
}
for _ in 0..<number![1]!{
    var input = readLine()!
    if Int(input) != nil{
        print(pokemonNum[Int(input)!]!)
    }else{
        print(pokemonName[input]!)
    }
}
