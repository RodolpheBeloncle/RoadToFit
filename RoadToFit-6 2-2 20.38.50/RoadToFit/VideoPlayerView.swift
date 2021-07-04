//
//  VideoPlayerView.swift
//  RoadToFit
//
//  Created by Rizki Abderrahim on 28/06/2021.
//

import SwiftUI
import AVKit
struct VideoPlayerView: View {
    internal init(video: Video) {
        self.video = video
        self.player = AVPlayer(url: Bundle.main.url(forResource: video.videoName, withExtension: video.videoExtension)!)
    }
    
    var video: Video
    private var player: AVPlayer
    var body: some View {
        VStack{
        VideoPlayer(player: player){
            Text("")
            
        }
        .onAppear{
            player.play()
      }
//        .onDisappear{
//            player.pause()
//        }
        }
//        .frame(width:200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(video: Video.all[1])
    }
}
