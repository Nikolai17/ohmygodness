//
//  ContentView.swift
//  ppc
//
//  Created by Nikolay Volnikov on 18.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isExpanded: Bool = false
    @Namespace var namespace

    var body: some View {
        VStack(alignment: isExpanded ? .center : .trailing) {
            if !isExpanded {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        withAnimation(.linear(duration: 0.3)) {
                            isExpanded.toggle()
                        }
                    } label: {
                        Text("Open")
                    }
                    .buttonStyle(.borderedProminent)
                    .matchedGeometryEffect(id: "animation", in: namespace)
                }
                .padding(.trailing, 20)
            } else {
                Button {
                } label: {
                    VStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.blue)
                            .frame(height: 300)
                    }

                }
                .allowsHitTesting(false)
//                .buttonStyle(.borderedProminent)
                .overlay {
                    VStack {
                        HStack {
                            Image(systemName: "arrowshape.backward.fill").foregroundColor(.white)
                            Text("Back").foregroundColor(.white)
                            Spacer().frame(width: 200, height: 100)
                        }
                        .onTapGesture {
                            withAnimation(.linear(duration: 0.3)) {
                                isExpanded.toggle()
                            }
                        }
                        Spacer().frame(height: 200)
                    }
                    .frame(width: 400, height: 300)
                }
                .matchedGeometryEffect(id: "animation", in: namespace)
                .opacity(1)
                .padding(16)
            }
        }
    }
}

// MARK: - PreviewProvider

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
