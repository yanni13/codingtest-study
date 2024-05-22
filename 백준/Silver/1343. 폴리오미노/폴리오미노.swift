import Foundation

let n = readLine() ?? ""
var result = ""   
var countX = 0    

for char in n {
    if char == "X" {
        countX += 1
    } else {
        if countX % 2 != 0 {
            result = "-1"
            break
        }
        if countX > 0 {
            result += String(repeating: "AAAA", count: countX / 4)
            result += String(repeating: "BB", count: (countX % 4) / 2)
            countX = 0
        }
        result.append(".")
    }
}
if countX % 2 != 0 {
    result = "-1"
} else {
    if countX > 0 {
        result += String(repeating: "AAAA", count: countX / 4)
        result += String(repeating: "BB", count: (countX % 4) / 2)
    }
}

print(result)
