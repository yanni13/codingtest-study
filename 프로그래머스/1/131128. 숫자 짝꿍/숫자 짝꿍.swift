func solution(_ X: String, _ Y: String) -> String {
    var countX = Array(repeating: 0, count: 10)
    var countY = Array(repeating: 0, count: 10)

    for ch in X {
        if let digit = ch.wholeNumberValue {
            countX[digit] += 1
        }
    }

    for ch in Y {
        if let digit = ch.wholeNumberValue {
            countY[digit] += 1
        }
    }

    var result = ""

    // 내림차순으로 큰 숫자부터
    for digit in (0...9).reversed() {
        let commonCount = min(countX[digit], countY[digit])
        result += String(repeating: "\(digit)", count: commonCount)
    }

    if result.isEmpty {
        return "-1"
    }

    // 0000 같은 경우는 하나의 0만 반환
    if result.first == "0" {
        return "0"
    }

    return result
}
