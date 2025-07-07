
let N = Int(readLine()!)!
var tuple = [(arrivedTime: Int, inspectTime: Int)]()
var answer = 0

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map {Int($0)!}
    let arrivedTime = input[0]
    var inspectTime = input[1]
    tuple.append((arrivedTime, inspectTime))
}

tuple.sort {$0.arrivedTime < $1.arrivedTime}

for i in tuple {
    if answer < i.arrivedTime {
        answer = i.arrivedTime
    }
    answer += i.inspectTime
}
print(answer)

