//
//  Lv2-완주하지_못한_선수.swift
//  Programmers-Algorithm
//
//  Created by 이치원 on 2022/04/03.
//

import Foundation


/*
    Input: [["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]]
 
    나의 풀이
    1. 낱개로 넘어오는 의상을 종류별로 묶어준다
    2. 의상을 종류별로 순회한다.
    3. 현재 조합의 개수 = (이전의 조합 * 현재 순회중인 종류의 의상 개수) + 이전 조합 + 현재 순회중인 종류의 의상 개수
    4. 순회가 끝난 후에 결과값을 리턴해준다
 */

func solution(_ clothes:[[String]]) -> Int {
    var result = 0
    var newClothes: [String: [String]] = [:]
    
    for cloth in clothes {
        let kind = cloth[1]
        let value = cloth[0]
        if newClothes[kind] == nil {
            newClothes[kind] = []
            newClothes[kind]?.append(value)
        } else {
            newClothes[kind]?.append(value)
        }
    }
    
    var beforeCount = 0
    var currentCount = 0
    for cloth in newClothes.values {
        currentCount = cloth.count
        result = (result * currentCount) + (result + currentCount)
        
        beforeCount += currentCount
    }
    
    return result
}
