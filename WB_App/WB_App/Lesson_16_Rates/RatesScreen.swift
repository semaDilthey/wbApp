//
//  RatesScreen.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 30.07.2024.
//

import SwiftUI
import VATComplyAPI

struct RatesScreen: View {
    
    @State var ratesModel : RatesModel = .init()
    
    var body: some View {
        VStack {
            header
            ratesCollection
        }
        .onAppear {
            ratesModel.loadData { result in
                switch result {
                case .success(let success):
                    ratesModel.rateList = success
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
    
    private var header: some View {
        VStack {
            Text("Rates date: \(ratesModel.rateList?.date?.formatted(date: .numeric, time: .shortened) ?? "")")
                .padding()
            HStack {
                Text("Base currency:")
                Spacer()
                Text(String(ratesModel.rateList?.base ?? ""))
                    .font(.subheadline)
            }
            .padding()
        }
    }
    
    private var ratesCollection: some View {
        ScrollView {
            LazyVStack {
                ForEach(RatesEnum.allCases, id: \.self) { rate in
                    rateCell(rate: rate)
                        .padding()
                }
            }
        }
    }
    
    private func rateCell(rate: RatesEnum) -> some View {
        HStack {
            if let rateValue = ratesModel.rateList?.rates {
                rateView(rate, value: rateValue)
                    .padding()
            }
        }
        .background(.white)
        .clipShape(.rect(cornerRadius: 8))
        .shadow(radius: 4)
    }
    
    @ViewBuilder
    private func rateView(_ rate: RatesEnum, value: RateListRates) -> some View {
        switch rate {
        case .EUR:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.EUR).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.EUR).value))
            }
        case .USD:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.USD).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.USD).value))
            }
        case .JPY:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.JPY).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.JPY).value))
            }
        case .BGN:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.BGN).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.BGN).value))
            }
        case .CZK:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.CZK).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.CZK).value))
            }
        case .DKK:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.DKK).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.DKK).value))
            }
        case .GBP:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.GBP).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.GBP).value))
            }
        case .HUF:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.HUF).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.HUF).value))
            }
        case .PLN:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.PLN).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.PLN).value))
            }
        case .RON:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.RON).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.RON).value))
            }
        case .SEK:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.SEK).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.SEK).value))
            }
        case .CHF:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.CHF).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.CHF).value))
            }
        case .ISK:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.ISK).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.ISK).value))
            }
        case .NOK:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.NOK).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.NOK).value))
            }
        case .TRY:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.TRY).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.TRY).value))
            }
        case .AUD:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.AUD).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.AUD).value))
            }
        case .BRL:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.BRL).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.BRL).value))
            }
        case .CAD:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.CAD).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.CAD).value))
            }
        case .CNY:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.CNY).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.CNY).value))
            }
        case .HKD:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.HKD).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.HKD).value))
            }
        case .IDR:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.IDR).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.IDR).value))
            }
        case .ILS:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.ILS).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.ILS).value))
            }
        case .INR:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.INR).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.INR).value))
            }
        case .KRW:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.KRW).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.KRW).value))
            }
        case .MXN:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.MXN).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.MXN).value))
            }
        case .MYR:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.MYR).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.MYR).value))
            }
        case .NZD:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.NZD).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.NZD).value))
            }
        case .PHP:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.PHP).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.PHP).value))
            }
        case .SGD:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.SGD).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.SGD).value))
            }
        case .THB:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.THB).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.THB).value))
            }
        case .ZAR:
            HStack {
                Text(RatesEnum.toTuple(rate: rate, value: value.ZAR).rate)
                Spacer()
                Text(String(RatesEnum.toTuple(rate: rate, value: value.ZAR).value))
            }
        }
    }
}

#Preview {
    RatesScreen()
}
