//
//  CustomSearchStringView.swift
//  WeatherForecast
//
//  Created by name surname on 04.06.2025.
//

import SwiftUI

struct CustomSearchStringView: View {
    
    @Binding var searchText: String
    @Binding var showSearchBar: Bool
    @ObservedObject var vm: WeatherViewModel
    @FocusState private var isTextFieldFocused: Bool
    @FocusState private var isSearchFieldFocused: Bool
    
    var body: some View {
        HStack {
            
            TextField("Поиск города", text: $searchText) {
                Task {
                    await vm.fetchWeather(for: searchText)
                    searchText = ""
                    showSearchBar = false
                }
            }
            .textFieldStyle(.roundedBorder)
            .submitLabel(.search)
            .padding(.horizontal)
            .focused($isSearchFieldFocused)
            
            if searchText.isEmpty {
                Button {
                    searchText = ""
                    showSearchBar = false
                } label: {
                    Text("Отмена")
                }
            } else {
                Button{
                    Task {
                        await vm.fetchWeather(for: searchText)
                        searchText = ""
                        showSearchBar = false
                    }
                }label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.blue)
                }
            }
        }
        .transition(.move(edge: .trailing))
        .animation(.easeInOut(duration: 0.5), value: showSearchBar)
        .padding([.top, .trailing])
        .onSubmit {
            if !searchText.isEmpty {
                Task {
                    await vm.fetchWeather(for: searchText)
                    searchText = ""
                    showSearchBar = false
                }
            }
        }
        .onAppear {
            isTextFieldFocused = true
        }
        .onAppear {
            isSearchFieldFocused = true
        }
    }
}
