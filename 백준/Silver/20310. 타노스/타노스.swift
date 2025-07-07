import Foundation

let input = readLine()!
let oneToRemove = input.filter { $0 == "1" }.count/2
let zeroToRemove = input.filter { $0 == "0" }.count/2

var result = ""
var removedOnes = 0

for char in input {
    if char == "1", removedOnes < oneToRemove{
        removedOnes += 1
        continue
    }
    result.append(char)
}

var final = ""
var removedZeros = 0
for char in result.reversed() {
    if char == "0", removedZeros < zeroToRemove{
        removedZeros += 1
        continue
    }
    final.append(char)
}

print(String(final.reversed()))

