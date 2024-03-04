//
//  DataChartView.swift
//  MyRingsWithCD
//
//  Created by Javier Rodríguez Gómez on 17/12/22.
//

import Charts
import SwiftUI

struct DataChartView: View {
    @EnvironmentObject var model: MyViewModel
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)]) var ringsCD: FetchedResults<RingEntity>
    
    let pickerText = ["S", "M", "A", "Total"]
    @State private var pickerSelection = 0
    
    var rings: Array<RingEntity> {
        model.getDataForChart(tag: pickerSelection, rings: ringsCD)
    }
    
    var component: Calendar.Component {
        model.calcCalendarComponent(tag: pickerSelection)
    }
    
    var body: some View {
        NavigationStack {
            if ringsCD.isEmpty {
                VStack {
                    Text("Añade algunos datos para")
                    Text("comenzar a usar la app...")
                }
                .font(.title)
            } else {
                VStack {
                    Picker("Intervalo de tiempo", selection: $pickerSelection.animation()) {
                        ForEach(0..<pickerText.count, id: \.self) {
                            Text(pickerText[$0])
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    VStack {
                        Chart(rings) { ring in
                            BarMark(
                                x: .value("Fecha", ring.date, unit: component),
                                y: .value("kcal", ring.movement)
                            )
                            .foregroundStyle(.pink)
                        }
                        Chart(rings) { ring in
                            BarMark(
                                x: .value("Fecha", ring.date, unit: component),
                                y: .value("minutos", ring.exercise)
                            )
                            .foregroundStyle(.green)
                        }
                        Chart(rings) { ring in
                            BarMark(
                                x: .value("Fecha", ring.date, unit: component),
                                y: .value("horas", ring.standUp)
                            )
                        }
                    }
                    .chartXAxis {
                        switch pickerSelection {
                        case 1:
                            AxisMarks(values: .stride(by: .day)) {
                                AxisGridLine()
                                AxisValueLabel(format: .dateTime.day(), centered: true)
                            }
                        case 2:
                            AxisMarks(values: .stride(by: .month)) {
                                AxisGridLine()
                                AxisValueLabel(format: .dateTime.month(), centered: true)
                            }
                        case 3:
                            AxisMarks(values: .stride(by: .year)) {
                                AxisGridLine()
                                AxisValueLabel(format: .dateTime.year(), centered: true)
                            }
                        default:
                            AxisMarks(values: .stride(by: .day)) {
                                AxisGridLine()
                                AxisValueLabel(format: .dateTime.weekday(), centered: true)
                            }
                        }
                    }
                }
                .padding()
                .navigationTitle("Histórico")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct DataChartView_Previews: PreviewProvider {
    static var previews: some View {
        DataChartView()
            .environmentObject(MyViewModel())
    }
}
