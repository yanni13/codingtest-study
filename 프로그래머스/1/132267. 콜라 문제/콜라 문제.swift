import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var count = 0
    var nowCount = n
    
    while nowCount >= a {
        count += nowCount / a * b
        nowCount = (nowCount / a * b) + (nowCount % a)
    }
    
    return count
}