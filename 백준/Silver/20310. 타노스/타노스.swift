let input = readLine()!
let sorted = input.sorted()
let result = String(sorted)

let zeroParts = result.split(separator: "1")
var zeroCount = zeroParts.reduce(0) {$0 + $1.count}


let oneParts = result.split(separator: "0")
var oneCount = oneParts.reduce(0) {$0 + $1.count}

zeroCount = zeroCount / 2
oneCount = oneCount / 2

let final = String(repeating: "0", count: zeroCount) + String(repeating: "1", count: oneCount)
print(final)