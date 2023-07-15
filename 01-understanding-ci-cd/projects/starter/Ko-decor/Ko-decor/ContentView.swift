/// Copyright (c) 2023 Kodeco Inc.
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.
///
///

import SwiftUI

struct ContentView: View {
    
    @State var gridView: [GridItem] = [ GridItem() ]
    @State private var isPressed = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridView, alignment: .center, spacing: 10) {
                    ForEach(decorImages.indices) { index in
                        Image(decorImages[index].imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: gridView.count == 1 ? 200 : 100)
                            .cornerRadius(20)
                            .shadow(color: Color.primary.opacity(0.5), radius: 2)
                        
                    }
                }
                .padding(.all, 10)
            }
            .navigationTitle("Ko Decor")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.gridView = Array(repeating: .init(.flexible()), count: self.gridView.count % 5 + 1)
                        isPressed = !isPressed
                        print(self.gridView.count)
                    }) {
                        switch gridView.count {
                          case 2:
                            Image(systemName: "rectangle.grid.2x2.fill")
                                .font(.title)
                                .foregroundColor(.orange)
                          case 3...5:
                            Image(systemName: "rectangle.grid.3x2.fill")
                                .font(.title)
                                .foregroundColor(.orange)
                          default:
                            Image(systemName: "rectangle.grid.1x2.fill")
                                .font(.title)
                                .foregroundColor(.orange)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
