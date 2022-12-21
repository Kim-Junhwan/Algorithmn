func convertMinute(timeStamp: String) -> Int {
    let time = timeStamp.split(separator: ":").map {Int($0)!}
    return time[0]*60 + time[1]
}

let seq = readLine()!.split(separator: " ").map {convertMinute(timeStamp: String($0))}
var enterSet: Set<String> = []
var outSet: Set<String> = []

while let line = readLine()?.split(separator: " ") {
    let ts = convertMinute(timeStamp: String(line[0]))
    let name = String(line[1])
    
    if (0...seq[0]) ~= ts {
        enterSet.insert(name)
    } else if (seq[1]...seq[2]) ~= ts {
        outSet.insert(name)
    }
}
print(enterSet.intersection(outSet).count)
