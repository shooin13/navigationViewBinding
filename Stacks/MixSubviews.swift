import SwiftUI

struct FeaturedCats: View {
  let artists: [String]
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Featured Cats")
        .font(.title)
        .padding(.leading)
      
      ScrollView(.horizontal) {
        HStack(alignment: .top, spacing: 25.0) {
          ForEach(artists, id: \.self) { artist in
            FeaturedArtist(artist: artist)
          }
        }
        .padding(.horizontal)
      }
    }
  }
}

struct TrackRow: View {
  let track: Track
  
  var body: some View {
    HStack {
      track.thumbnail
        .padding()
        .background(track.gradient)
        .cornerRadius(6)
      
      Text(track.title)
      Text(track.artist)
        .foregroundColor(.secondary)
        .lineLimit(1)
        .truncationMode(.tail)
      
      Spacer()
      
      Text("\(track.duration)")
    }
  }
}

struct FeaturedArtist: View {
  let artist: String
  
  var body: some View {
    VStack {
      ZStack {
        Circle()
          .fill([Color.orange, .pink, .purple, .red, .yellow].randomElement()!)
          .scaledToFit()
        
        Image(systemName: "music.mic")
          .resizable()
          .frame(width: 50, height: 50)
          .foregroundColor(.white)
      }
      
      Text(artist)
        .multilineTextAlignment(.center)
        .lineLimit(2)
    }
    .frame(width: 120)
  }
}
