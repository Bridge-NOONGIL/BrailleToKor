//
//  func.swift
//  Hollys
//
//  Created by Nayeon Kim on 2021/11/06.
//

import Foundation

func translatePunc(words: [String]) -> [String] {
    
    var stringWithTranslatedPunc:[String] = words
    
    for (index,word) in words.enumerated() {
        var word_arr = Array(word)
        word_arr = translateMiddlePunc(translateLastPunc((translateFirstPunc(word_arr))))
        
        let word_str = String(word_arr)
        stringWithTranslatedPunc[index] = word_str
    }
    
    return stringWithTranslatedPunc
}

func translateFirstPunc(_ word: [Character]) -> [Character] {
    var resultWorld = word
    var firstWord = ""
    if word.count == 0 {
        firstWord = ""
    } else {
        firstWord = String(word[0])
    }
    var secondWord = " "
    
    if word.count > 1 { secondWord = String(word[1])}
    
    if front_punctuation_list[firstWord + secondWord] != nil {
        
        let punctuation = front_punctuation_list[firstWord + secondWord]!
        let _ = resultWorld.remove(at: 0) //하나를 지우고
        resultWorld[0] = Character(punctuation) //하나는 변경해주고
        
        if front_punctuation_list[firstWord + secondWord] == " " {
            resultWorld = translateFirstPunc(resultWorld)
        }
        
    }else if front_punctuation_list[firstWord] != nil{
        let punctuation = front_punctuation_list[firstWord]!
        resultWorld[0] = Character(punctuation)
    }
    
    return resultWorld
}

func translateMiddlePunc(_ word: [Character]) -> [Character] {
    var resultWord = word
    
    for index in 0..<resultWord.count {
        
        let word_count = resultWord.count
        if index >= word_count {break}
        
        let oneWord = String(resultWord[index])
        
        var back_index_word = " "
        var back_back_index_word = " "
        
        if index < word_count - 2 { back_index_word = String(resultWord[index+1]) }
        if index < word_count - 3 { back_back_index_word = String(resultWord[index+2]) }
        
        if middle_punctuation_list[oneWord + back_index_word + back_back_index_word] != nil {
            
            resultWord[index] = "."
            resultWord[index+1] = "."
            resultWord[index+2] = "."
            
        } else if middle_punctuation_list[oneWord + back_index_word] != nil {
            
            let punctuation = middle_punctuation_list[oneWord + back_index_word]!
            let _ = resultWord.remove(at: index) //하나를 지우고
            resultWord[index] = Character(punctuation)
            
        }
        else if middle_punctuation_list[oneWord] != nil {
            
            let punctuation = middle_punctuation_list[oneWord]!
            resultWord[index] = Character(punctuation)
            
        }
    }
    
    return resultWord
}

func translateLastPunc(_ word: [Character]) -> [Character] {
    var resultWord = word
    let word_count = word.count
    
    let lastWord = String(word[word_count-1])
    var front_word = " "
    var front_front_word = " "
    
    if word_count > 1 { front_word = String(word[word_count-2]) }
    if word_count > 2 { front_front_word = String(word[word_count-3]) }
    
    if end_punctuation_list[front_front_word + front_word + word] != nil {
        
        resultWord[word_count-1] = "."
        resultWord[word_count-2] = "."
        resultWord[word_count-3] = "."
        
    }
    else if end_punctuation_list[lastWord] == "\"" || end_punctuation_list[lastWord] == "'" {
        if end_punctuation_list[front_word] == "." || end_punctuation_list[front_word] == "," {
            let punctuation_front = end_punctuation_list[front_word]!
            let punctuation_back = end_punctuation_list[lastWord]!
            resultWord[resultWord.count-2] = Character(punctuation_front)
            resultWord[resultWord.count-1] = Character(punctuation_back)
        }
    }
    else if end_punctuation_list[front_word + lastWord] != nil {
        
        let punctuation = end_punctuation_list[front_word + lastWord]!
        resultWord.remove(at: word_count-1)
        resultWord[resultWord.count-1] = Character(punctuation)
        
        if end_punctuation_list[front_word + lastWord] == " " { //점역자 주
            resultWord = translateLastPunc(resultWord)
        }
    }
    else if end_punctuation_list[lastWord] != nil {
        
        let punctuation = end_punctuation_list[lastWord]!
        resultWord[word_count-1] = Character(punctuation)
        
    }
    
    return resultWord
}

