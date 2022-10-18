let num = Int(readLine()!)!
let drink = readLine()!.split(separator: " ").map {Double($0)!}

let sortedDrink = drink.sorted {$0 > $1}
var sum: Double = sortedDrink[0]
for item in 1..<sortedDrink.count {
    sum += sortedDrink[item]/2
}
print(sum)