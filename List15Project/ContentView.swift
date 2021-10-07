//==============================================================================
//  ContentView.swift
//
//  List15Project
//  Created by Champlin Technologies LLC on 2021/10/06.
//  Copyright © 2021 Champlin Technologies LLC. All rights reserved.
//==============================================================================
import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var dataModel: DataModel
    @Environment(\.editMode) var editMode
    
    @FocusState private var focus: UUID?
        
    @State private var focusPrevious:  UUID = UUID.init()
    @State private var scrollPrevious: UUID = UUID.init()
    @State private var focusNext:      UUID = UUID.init()
    @State private var scrollNext:     UUID = UUID.init()
        
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                List {
                    ForEach($dataModel.faves) {$singleFave in
                        FaveRowView(row: $singleFave, textFieldFocus: $focus)
                            .listRowSeparatorTint(.yellow.opacity(0.4))
                            .padding(.vertical, 10)
                    }
                    .onMove(perform: dataModel.relocate)
                    .onDelete(perform: dataModel.delete)
                }
                .listStyle(.insetGrouped)
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()

                    Button(action: {
                        if let currentFavesIndex: Int = dataModel.faves.firstIndex(where: { $0.id == focus }) { // found match on first text field in row
                            withAnimation(.easeInOut(duration: 0.3)) {
                                proxy.scrollTo(dataModel.faves[max(currentFavesIndex - 2, 0)].id)
                            }
                            let previousFave = dataModel.faves[max(currentFavesIndex - 1, 0)]
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                focus = (currentFavesIndex > 0) ? previousFave.favoriteID : previousFave.id
                            }
                        } else if let currentFavesIndex: Int = dataModel.faves.firstIndex(where: { $0.favoriteID == focus }) { // found match on second text field in row
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                focus = dataModel.faves[currentFavesIndex].id
                            }
                        }
                    }) {
                        Text("Previous")
                            .padding(.horizontal, 5)
                    }
                    .tint(Color(UIColor.systemGray3))
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .controlSize(.small)

                    Button(action: {
                        if let currentFavesIndex: Int = dataModel.faves.firstIndex(where: { $0.id == focus }) { // found match on first text field in row
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                focus = dataModel.faves[currentFavesIndex].favoriteID
                            }
                        } else if let currentFavesIndex: Int = dataModel.faves.firstIndex(where: { $0.favoriteID == focus }) { // found match on second text field in row
                            withAnimation(.easeInOut(duration: 0.3)) {
                                proxy.scrollTo(dataModel.faves[min(currentFavesIndex + 2, dataModel.faves.count - 1)].id)
                            }
                            let nextFave = dataModel.faves[ min(currentFavesIndex + 1, dataModel.faves.count - 1) ]
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                focus = (currentFavesIndex < dataModel.faves.count - 1) ? nextFave.id : nextFave.favoriteID
                            }
                        }
                    }) {
                        Text("Next")
                            .padding(.horizontal, 5)
                    }
                    .tint(Color(UIColor.systemGray3))
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .controlSize(.small)
                    .padding(.horizontal, 20)
                }
            }
        }
        .frame(maxHeight: .infinity)
        .frame(width: 400, alignment: .center)
        .onAppear {
            editMode?.wrappedValue = .active
        }
    }

}

