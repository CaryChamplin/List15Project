//==============================================================================
//  FaveRowView.swift
//
//  List15Project
//  Created by Champlin Technologies LLC on 2021/10/06.
//  Copyright © 2021 Champlin Technologies LLC. All rights reserved.
//==============================================================================
import SwiftUI

struct FaveRowView: View {
    
    @Binding var row: Fave
    var textFieldFocus: FocusState<UUID?>.Binding

    var body: some View {
        HStack {
            TextField("", text: $row.category, prompt: Text("Enter a category"))
                .focused(textFieldFocus, equals: row.id)
                .font(.subheadline)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .foregroundColor(.gray)
                .padding(7)
                .background(Color(UIColor.systemGray4))
                .cornerRadius(8)
                .frame(width: 80)

            TextField("", text: $row.favorite, prompt: Text("Enter a fave"))
                .focused(textFieldFocus, equals: row.favoriteID)
                .font(.subheadline)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .foregroundColor(.white)
                .padding(7)
                .background(Color(UIColor.systemGray4))
                .cornerRadius(8)
        }
    }
}

