//
//  RatesModel.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 30.07.2024.
//

import VATComplyAPI

struct RatesModel {
    
    var rateList : RateList?
    
    func loadData(completion: @escaping (Result<RateList, Error>) -> Void) {
        RatesAPI.getRates { data, error in
            if let data {
                completion(.success(data))
            } else if let error {
                completion(.failure(error))
            }
        }
    }
}

enum RatesEnum: String, CaseIterable {
    case EUR, USD, JPY, BGN, CZK, DKK, GBP, HUF, PLN, RON, SEK, CHF, ISK, NOK, TRY, AUD, BRL, CAD, CNY, HKD, IDR, ILS, INR, KRW, MXN, MYR, NZD, PHP, SGD, THB, ZAR
}

extension RatesEnum {
    static func toTuple(rate: Self ,value: Double?) -> (rate: String, value: Double) {
        if let value {
            return (rate.rawValue, value)
        }
         return ("",0)
    }
}

