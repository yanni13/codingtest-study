// 매주마다의 랭킹 정보 리스트를 인풋으로 받아 2등 선수가 누구인지 알아내자
// 매주 랭킹에 선수의 이름이 오를 때 마다 선수의 포인트가 1씩 증가
while true {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let N = input[0]
    let M = input[1]

    if N == 0 && M == 0 {
        break
    }

    var map = Array(repeating: Array(repeating: 0, count: M), count: N)
    var result: [Int: Int] = [:]

    for i in 0..<N {
        let row = readLine()!.split(separator: " ").map { Int($0)! }
        map[i] = row
    }

    for i in 0..<N {
        for j in 0..<M {
            result[map[i][j], default: 0] += 1
        }
    }

    let sortedValue = result.sorted { $0.value > $1.value }
    let firstValue = sortedValue.first!.value
    let secondValue = sortedValue.first(where: {$0.value != firstValue})?.value

    if let secondValue = secondValue {
        let answer = sortedValue.filter { $0.value == secondValue }.map { $0.key }.sorted()
        if answer.count == 1 {
            print(answer[0])
        } else {
            print(answer.map { String($0) }.joined(separator: " "))
        }
    }
}
