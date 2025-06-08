import Foundation

func solution(_ clothes:[[String]]) -> Int {
    let grouped = Dictionary(grouping: clothes, by: { $0[1] })
        .mapValues { $0.map {$0[0]}}
    var result = 1
    
    for (key, value) in grouped {
    // 안입는 선택지 포함 + 1
        result *= (value.count) + 1
        
    }
    // 최소한 한개의 의상은 입기 때문에 안입는 경우는 없음
    return result - 1
}