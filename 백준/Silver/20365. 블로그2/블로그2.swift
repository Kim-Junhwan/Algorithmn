let num = Int(readLine()!)!

let colorNum = Array(readLine()!).map {String($0)}
var dict: [String:Int] = ["B":0,"R":0]
var beforeWord = ""
var reductionWord = ""
for item in colorNum {
    if beforeWord == item {
        continue
    } else {
        reductionWord.append(item)
        beforeWord = item
    }
}
for item in reductionWord {
    if item == "B" {
        dict["B"]! += 1
    } else {
        dict["R"]! += 1
    }
}
print(dict.values.min()!+1)
