//
//  StatView.swift
//  GetUpYo
//
//  Created by William Hernandez on 2/28/23.
//

import SwiftUI

struct StatsView: View {
    let dataByMonth = [
        MonthData(month: "January", value: 10000),
        MonthData(month: "February", value: 12000),
        MonthData(month: "March", value: 8000),
        // Add more months and data here
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dataByMonth) { monthData in
                    NavigationLink(destination: MonthDetailView(monthData: monthData)) {
                        Text("\(monthData.month) - \(monthData.value)")
                    }
                }
            }
            .navigationTitle("Data by Month")
        }
    }
}

struct MonthData: Identifiable {
    let id = UUID()
    let month: String
    let value: Int
}

struct MonthDetailView: View {
    let monthData: MonthData
    
    var body: some View {
        Text("\(monthData.month) - \(monthData.value)")
            .navigationTitle(monthData.month)
    }
}
