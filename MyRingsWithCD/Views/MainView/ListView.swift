//
//  ListView.swift
//  MyRingsWithCD
//
//  Created by Javier Rodríguez Gómez on 16/12/22.
//

import SwiftUI

struct ListView: View {
    let ring: RingEntity
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                VStack(spacing: 0) {
                    HStack {
                        Text("Movimiento")
                        Spacer()
                        Text("\(ring.movement) kcal")
                    }
                    .foregroundColor(.pink)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.primary.opacity(0.2))
                    }
                    HStack {
                        Text("Ejercicio")
                        Spacer()
                        Text("\(ring.exercise) minutos")
                    }
                    .foregroundColor(.green)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.primary.opacity(0.2))
                    }
                    HStack {
                        Text("De pie")
                        Spacer()
                        Text("\(ring.standUp) horas")
                    }
                    .foregroundColor(.blue)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.primary.opacity(0.2))
                    }
                    HStack {
                        Text("Entrenamiento")
                        Spacer()
                        Image(systemName: "figure.walk")
                            .font(.title)
                            .foregroundColor(ring.isTraining ? .green : .gray.opacity(0.4))
                    }
                    .foregroundColor(ring.isTraining ? .primary : .secondary.opacity(0.4))
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.primary.opacity(0.2))
                    }
                }
                
                if let training = ring.toTrain {
                    VStack(spacing: 0) {
                        HStack {
                            Text("Tipo")
                            Spacer()
                            Image(systemName: training.trainingType == .toRun ? "hare.fill" : "tortoise.fill")
                                .foregroundColor(training.trainingType == .toRun ? .orange : .green)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.primary.opacity(0.2))
                        }
                        HStack {
                            Text("Duración")
                            Spacer()
                            Text("\(training.duration, format: .number.precision(.fractionLength(1))) minutos")
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.primary.opacity(0.2))
                        }
                        HStack {
                            Text("Distancia")
                            Spacer()
                            Text("\(training.length, format: .number) km")
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.primary.opacity(0.2))
                        }
                        HStack {
                            Text("Velocidad")
                            Spacer()
                            Text("\(training.velocity, format: .number.precision(.fractionLength(2))) km/h")
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.primary.opacity(0.2))
                        }
                        HStack {
                            Text("Calorías")
                            Spacer()
                            Text("\(training.calories, format: .number) kcal")
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.primary.opacity(0.2))
                        }
                        HStack {
                            Text("FC media")
                            Spacer()
                            Text("\(training.meanHR, format: .number) lpm")
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.primary.opacity(0.2))
                        }
                    }
                }
            }
            .padding(.horizontal, 40)
        }
    }
}

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView()
//    }
//}
