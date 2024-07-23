//
//  MomentEditor.swift
//  serenedipity-0
//
//  Created by Kun Zhu on 2024-07-17.
//

import SwiftUI

struct MomentEditor: View {
    
    @Binding var moment: Moment
    
    var body: some View {
        List {
            Label("New Serendipity", systemImage: "sparkle")
                .padding(.top, 5)
            
            DatePicker("Date", selection: $moment.date)
                .labelsHidden()
                .listRowSeparator(.hidden)
                .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
            
            TextField("describe your serendipity", text:
                        $moment.description, axis: .vertical)
            Spacer()
        }
    }
}

struct MomentEditor_Previews: PreviewProvider {
    static var previews: some View {
        MomentEditor(moment: .constant(Moment()))
    }
}
