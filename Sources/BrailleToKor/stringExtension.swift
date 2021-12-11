//
//  File.swift
//  
//
//  Created by Nayeon Kim on 2021/12/11.
//

import Foundation

extension String {
    func getChar(at index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }

    subscript(_ index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}
