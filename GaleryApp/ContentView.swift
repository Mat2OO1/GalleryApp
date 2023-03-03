//
//  ContentView.swift
//  GaleryApp
//
//  Created by Mateusz on 03/03/2023.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct GalleryView: View {
    @ObservedObject var gallery: GalleryModelView
    @State var invert = false;
    @State var yellow = false;
    @State var bw = false;
    var body: some View {
        VStack {
            HStack{
                Text("Gallery")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                Spacer()
                Text(String(gallery.model.currentImageNumber + 1)+"/100")
            }
            Spacer()
            HStack(alignment: .center){
                if bw{
                    Image(gallery.model.images[gallery.model.currentImageNumber])
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .saturation(0.0)
                }
                else if invert{
                    Image(gallery.model.images[gallery.model.currentImageNumber])
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .colorInvert()
                }
                else if yellow {
                    Image(gallery.model.images[gallery.model.currentImageNumber])
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .colorMultiply(.yellow)
                        //.brightness(0.2)
                        
                        
                }
                else {
                    Image(gallery.model.images[gallery.model.currentImageNumber])
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                }
            }
            Spacer()
            HStack{
                Image(systemName: "chevron.backward.2")
                    .onTapGesture {
                        if gallery.model.currentImageNumber - 1 >= 0 {
                            gallery.model.currentImageNumber = (gallery.model.currentImageNumber - 1 ) % gallery.model.images.count
                        } else {
                            gallery.model.currentImageNumber = gallery.model.images.count - 1
                        }
                        
                        invert = false;
                        yellow = false;
                        bw = false;
                    }
                VStack{
                    Image(gallery.model.images[gallery.model.currentImageNumber])
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 90)
                        .cornerRadius(20)
                        .opacity(0.7)
                        .colorInvert()
                    Text("Invert")
                        .font(.title2)
                        .foregroundColor(Color.blue)
                }
                .onTapGesture {
                    invert = true;
                    yellow = false;
                    bw = false;
                }
                VStack{
                    Image(
                        gallery.model.images[gallery.model.currentImageNumber])
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 90)
                        .cornerRadius(20)
                        .opacity(0.7)
                        .saturation(0.8)
                    Text("Yellow")
                        .font(.title2)
                        .foregroundColor(Color.blue)
                }
                .onTapGesture {
                    invert = false;
                    yellow = true;
                    bw = false;
                }
                VStack{
                    Image(gallery.model.images[gallery.model.currentImageNumber])
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 90)
                        .cornerRadius(20)
                        .opacity(0.7)
                        .saturation(0.0)
                    Text("BW")
                        .font(.title2)
                        .foregroundColor(Color.blue)
                }
                .onTapGesture {
                    invert = false;
                    yellow = false;
                    bw = true;
                }
                Image(systemName: "chevron.forward.2")
                    .onTapGesture {
                        gallery.model.currentImageNumber = (gallery.model.currentImageNumber + 1) % gallery.model.images.count
                        invert = false;
                        yellow = false;
                        bw = false;
                    }
            }
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                    Text("Reset")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .frame( maxWidth: 100, maxHeight: 40)
                .foregroundColor(.blue)
                .onTapGesture {
                    invert = false;
                    yellow = false;
                    bw = false;
                }
            }
        }
        .padding()
        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                            .onEnded({ value in
                                if value.translation.width < 0 {
                                    gallery.model.currentImageNumber = (gallery.model.currentImageNumber + 1) % gallery.model.images.count
                                    invert = false;
                                    yellow = false;
                                    bw = false;
                                }

                                if value.translation.width > 0 {
                                    if gallery.model.currentImageNumber - 1 >= 0 {
                                        gallery.model.currentImageNumber = (gallery.model.currentImageNumber - 1 ) % gallery.model.images.count
                                    } else {
                                        gallery.model.currentImageNumber = gallery.model.images.count - 1
                                    }
                                    
                                    invert = false;
                                    yellow = false;
                                    bw = false;
                                }

                            }))
    }
}

struct GalleryLogic {
    var images = ["image1", "image2", "image3", "image4", "image5", "image6", "image7", "image8", "image9", "image10", "image11", "image12", "image13", "image14", "image15", "image16", "image17", "image18", "image19", "image20", "image21", "image22", "image23", "image24", "image25", "image26", "image27", "image28", "image29", "image30", "image31", "image32", "image33", "image34", "image35", "image36", "image37", "image38", "image39", "image40", "image41", "image42", "image43", "image44", "image45", "image46", "image47", "image48", "image49", "image50", "image51", "image52", "image53", "image54", "image55", "image56", "image57", "image58", "image59", "image60", "image61", "image62", "image63", "image64", "image65", "image66", "image67", "image68", "image69", "image70", "image71", "image72", "image73", "image74", "image75", "image76", "image77", "image78", "image79", "image80", "image81", "image82", "image83", "image84", "image85", "image86", "image87", "image88", "image89", "image90", "image91", "image92", "image93", "image94", "image95", "image96", "image97", "image98", "image99", "image100"]
    var currentImageNumber = 0
    
}
    
    
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView(gallery: GalleryModelView())
    }
}


