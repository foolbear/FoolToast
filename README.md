# FoolToast 
Simple Toast for SwiftUI for multiple toasts and multiple Views with simple animation.  
 
## Installation: 
Swift package Manager   
 
## Usage:  
 
### show toast when action 
showFoolToast(Text("圣诞节").foregroundColor(.red)+Text("快乐 🎄")) 
 
### make View FoolToast supportted 
View.foolToast() 
 
### sample code 
FoolToastTestView.swift  
```
public struct FoolToastTestView: View {
    public var body: some View {
        ZStack {
            Color.clear.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        // show toast
                        showFoolToast(Text("圣诞节").foregroundColor(.red)+Text("快乐 🎄")) 
                    }) {
                        Text("Merry")
                    }
                    Spacer()
                    Button(action: {
                        // show toast
                        showFoolToast(Text("We wish you a merry christmas(我们祝你过一个快乐的圣诞节); We wish you a merry christmas and a happy new year(我们祝你过一个快乐的圣诞和新年)."))
                    }) {
                        Text("Christmas")
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .foolToast() // toast UI
    }
}
```
