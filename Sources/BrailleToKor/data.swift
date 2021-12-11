//
//  File.swift
//  
//
//  Created by Nayeon Kim on 2021/12/11.
//

import Foundation

let cho_braille = ["⠈": "ㄱ","⠉": "ㄴ","⠊": "ㄷ","⠐": "ㄹ","⠑": "ㅁ","⠘": "ㅂ","⠠": "ㅅ","⠨": "ㅈ","⠰":"ㅊ","⠋": "ㅋ","⠓": "ㅌ","⠙": "ㅍ","⠚": "ㅎ","⠠⠈": "ㄲ","⠠⠊": "ㄸ","⠠⠘": "ㅃ","⠠⠠": "ㅆ","⠠⠨":"ㅉ"]

// 'ㄱ','ㅅ','ㄹ'을 제외한 초성 배열 - for 'ㅏ' 약자
let abb_cho_braille = ["⠉": "ㄴ","⠊": "ㄷ","⠑": "ㅁ","⠘": "ㅂ","⠨": "ㅈ","⠋": "ㅋ","⠓": "ㅌ","⠙": "ㅍ","⠚": "ㅎ","⠠⠈": "ㄲ","⠠⠊": "ㄸ","⠠⠘": "ㅃ","⠠⠠": "ㅆ","⠠⠨":"ㅉ"]

let double_cho_braille = ["⠠⠈": "ㄲ","⠠⠊":"ㄸ","⠠⠘":"ㅃ","⠠⠠":"ㅆ","⠠⠨":"ㅉ"]

let jung_braille = ["⠣": "ㅏ", "⠜": "ㅑ", "⠎": "ㅓ", "⠱": "ㅕ", "⠥": "ㅗ", "⠬": "ㅛ", "⠍": "ㅜ", "⠩": "ㅠ", "⠪": "ㅡ", "⠕": "ㅣ", "⠗": "ㅐ", "⠝": "ㅔ", "⠜⠗": "ㅒ", "⠌": "ㅖ", "⠧": "ㅘ", "⠧⠗": "ㅙ", "⠽": "ㅚ", "⠏": "ㅝ", "⠏⠗": "ㅞ", "⠍⠗": "ㅟ", "⠺": "ㅢ"]

let double_jung_braille = ["⠜⠗": "ㅒ", "⠧⠗": "ㅙ","⠏⠗": "ㅞ","⠍⠗": "ㅟ"]

let jong_braille = ["⠁": "ㄱ","⠁⠄": "ㄳ", "⠒": "ㄴ", "⠒⠅": "ㄵ", "⠒⠴": "ㄶ", "⠔": "ㄷ", "⠂":"ㄹ", "⠂⠁": "ㄺ", "⠂⠢": "ㄻ", "⠂⠃": "ㄼ","⠂⠄": "ㄽ", "⠂⠦": "ㄾ", "⠂⠲": "ㄿ", "⠂⠴": "ㅀ", "⠢": "ㅁ", "⠃": "ㅂ", "⠃⠄": "ㅄ", "⠄": "ㅅ", "⠶": "ㅇ", "⠅": "ㅈ", "⠆": "ㅊ", "⠖": "ㅋ", "⠦": "ㅌ", "⠲": "ㅍ", "⠴": "ㅎ", "⠁⠁": "ㄲ", "⠌": "ㅆ"]

// ㅆ 없으면 -> 땄, 된소리 + ㅏ약자 + 받침 안됨
// ㅆ 있으면 -> 톈 안됨

let double_jong_braille = ["ㄱ⠄": "ㄳ","ㄴ⠅": "ㄵ", "ㄴ⠴": "ㄶ","ㄹ⠁": "ㄺ", "ㄹ⠢": "ㄻ", "ㄹ⠃": "ㄼ","ㄹ⠄": "ㄽ", "ㄹ⠦": "ㄾ", "ㄹ⠲": "ㄿ", "ㄹ⠴": "ㅀ","ㅂ⠄": "ㅄ","ㄱ⠁": "ㄲ"]

// 한글 점자 약어
let abb_word_list = ["⠁⠎":"그래서", "⠁⠉":"그러나", "⠁⠒":"그러면", "⠁⠢":"그러므로", "⠁⠝":"그런데", "⠁⠥":"그리고", "⠁⠱":"그리하여"]

// 한글 점자 약자
let abb_cho_list = ["⠫": ["ㄱ", "ㅏ"],"⠇": ["ㅅ", "ㅏ"], "⠠⠫": ["ㄲ","ㅏ"], "⠠⠇": ["ㅆ","ㅏ"] ]
let abb_jung_jong_list = ["⠹": ["ㅓ", "ㄱ"], "⠾": ["ㅓ", "ㄴ"], "⠞": ["ㅓ", "ㄹ"], "⠡": ["ㅕ", "ㄴ"], "⠳": ["ㅕ", "ㄹ"], "⠻": ["ㅕ", "ㅇ"], "⠭": ["ㅗ", "ㄱ"], "⠷": ["ㅗ", "ㄴ"], "⠿": ["ㅗ", "ㅇ"], "⠛": ["ㅜ", "ㄴ"], "⠯": ["ㅜ", "ㄹ"], "⠵": ["ㅡ", "ㄴ"], "⠮": ["ㅡ", "ㄹ"], "⠟": ["ㅣ", "ㄴ"]]
let abb_cho_jung_jong = ["⠸⠎": ["ㄱ", "ㅓ", "ㅅ"]]

//문장 부호_한글
let front_punctuation_list = ["⠸⠌": "/", "⠦": "\"", "": "'", "⠦⠄": "(", "⠦⠂": "{","⠦⠆": "[", "⠐⠦": "〈", "⠔⠔": "*", "⠰⠆": "〃", "⠈⠺": "₩", "⠈⠙": "$"]
let middle_punctuation_list = ["⠐⠆": "·", "⠐⠂": ":", "⠦⠄": "(", "⠠⠴": ")", "⠦⠂": "{", "⠐⠴": "}", "⠦⠆": "[", "⠰⠴": "]", "⠐⠦": "〈", "⠴⠂": "〉", "⠤": "-", "⠤⠤": "~", "⠸⠌": "/","⠦": "\"","⠴": "\"", "⠠⠦": "'", "⠴⠄": "'", "⠠⠠⠠": "...", "⠔⠔": "*", "⠰⠆": "〃", "⠈⠺": "₩", "⠈⠙": "$"] //"⠲": "." 은 말줄임표 위해서
//11 Dec 2021: "⠲": ".", middle에서 뺐음. 읊다 -> 을.다 현상 때문에

let end_punctuation_list = ["⠲": ".", "⠦": "?", "⠖": "!", "⠐": ",", "⠐⠂": ":", "⠴": "\"", "⠠⠴": ")", "⠐⠴": "}","⠰⠴": "]", "⠤⠤": "~", "⠠⠠⠠": "...", "⠸⠌": "/", "⠔⠔": "*", "⠰⠆": "〃", "⠈⠺": "₩", "⠈⠙": "$"]

//영어
let alphabet = ["⠁": "a", "⠃": "b", "⠉": "c", "⠙": "d", "⠑": "e", "⠋": "f", "⠛": "g", "⠓": "h", "⠊": "i", "⠚": "j", "⠅": "k", "⠇": "l", "⠍": "m", "⠝": "n", "⠕": "o", "⠏": "p", "⠟": "q", "⠗": "r", "⠎": "s", "⠞": "t", "⠥": "u", "⠧": "v", "⠺": "w", "⠭": "x", "⠽": "y", "⠵": "z"]
let upper_case = "⠠"
let upper_case_word: String = upper_case + upper_case
let upper_case_phrase: String = upper_case + upper_case_word //3단어 이상이 대문자일때
let upper_case_end = "⠠⠄"

let eng_start = "⠴" //로마자 시작
let eng_end = "⠲" //로마자 끝

//문장부호_영어
//let front_punctuation_eng_list = []
//let middle_punctuation_eng_list = []
//let end_punctuation_eng_list = []

