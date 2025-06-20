import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let zeroCount = lottos.filter { $0 == 0 }.count
    let matchCount = lottos.filter { win_nums.contains($0) }.count
    
    let maxRank = getRank(matchCount + zeroCount)
    let minRank = getRank(matchCount)
    
    return [maxRank, minRank]
}

func getRank(_ correctCount: Int) -> Int {
    switch correctCount {
    case 6: return 1
    case 5: return 2
    case 4: return 3
    case 3: return 4
    case 2: return 5
    default: return 6
    }
}
