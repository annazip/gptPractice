//
//  ShoppingItem.swift
//  reflectColor_gpt
//
//  Created by 森杏菜 on 2024/07/18.
//

import Foundation
import RealmSwift

class ShoppingItem: Object{
    @Persisted var title: String = ""
    @Persisted var price: Int = 0
    @Persisted var isMarked: Bool = false
}
