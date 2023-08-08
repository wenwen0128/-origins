//
//  Product.swift
//  瘋狂購物
//
//  Created by 溫皓 on 2023/8/7.
//

import Foundation

// MARK: - Properties

// 產品類別，封裝產品的名稱、數量和價格
class Product {
    let name: String
    var quantity: Int
    let price: Int
    
    init(name: String, quantity: Int, price: Int) {
        self.name = name
        self.quantity = quantity
        self.price = price
    }
}
