import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    let result = skill_trees.filter {
        let skills = $0.filter { skill.contains($0) }.map { String($0) }.joined()
        return skill.hasPrefix(skills)
    }.count
    return result
}