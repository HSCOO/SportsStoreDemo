//
//  StockValueImplementations.swift
//  SportsStoreDemo
//
//  Created by OnlyStu on 2017/3/28.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import Foundation

protocol StockValueFormatter {
    func formatTotal(total:Double) -> String
}

class DollarStockValueFormatter:StockValueFormatter{
    func formatTotal(total: Double) -> String {
        let formatted = Utils.currencyStringFromNumber(number: total)
        return "\(formatted)"
    }
}

class PoundStockValueFormatter:StockValueFormatter{
    func formatTotal(total: Double) -> String {
        let formatTotal = Utils.currencyStringFromNumber(number: total)
        return "£\(formatTotal)"
    }
}

protocol StockValueConverter {
    func convertTotal(total:Double) -> Double
}

class DollarStockValueConverter:StockValueConverter{
    func convertTotal(total: Double) -> Double {
        return total
    }
}

class PoundStockValueConverter:StockValueConverter{
    func convertTotal(total: Double) -> Double {
        return 0.6 * total
    }
}
