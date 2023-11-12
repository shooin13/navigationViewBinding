import SwiftUI

// MARK:- Directions
/*
 * Everything you need is in this file!
 * Use an iPad scheme for previews
 * Add Navigation from each row in the list of tracks to a DetailView for that track
 * Try presenting a popover when the MeowMixHeader is tapped. Use the MessagePopover view.
 * Check out the TODO in this file to learn more about options for navigation views.
 */

struct ContentView: View {
  let mix = MeowMix()
  @State private var popoverShown = false
  
  var body: some View {
    // MARK: TODO - Add a NavigationView
    /*
     * Try using the .navigationViewStyle modifier on the NavigationView with a StackNavigationViewStyle()
     * Try hiding the navigation bar with .navigationBarHidden
     */
    NavigationView {
      VStack(spacing: 0.0) {
        MeowMixHeader()
          .padding()
          .onTapGesture {
            popoverShown = true
          }
          .popover(isPresented: $popoverShown) {
            MessagePopover()
          }
        
        Divider()
          .padding()
        
        List(mix.tracks) { track in
          NavigationLink(destination: DetailView(track: track)) {
            TrackRow(track: track)
          }
        }
        
        
        FeaturedCats(artists: mix.tracks.map(\.artist))
          .padding(.vertical)
          .background(Color.gray.opacity(0.2))
      }
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

struct DetailView: View {
  let track: Track
  
  var body: some View {
    ZStack {
      track.gradient
        .ignoresSafeArea()
      
      VStack {
        Text(track.title)
          .font(.largeTitle)
          .fontWeight(.black)
        Text(track.artist)
          .font(.title)
          .fontWeight(.semibold)
        
        track.thumbnail
          .resizable()
          .scaledToFit()
          .padding(50)
      }
      .foregroundColor(.white)
    }
  }
}

struct MessagePopover: View {
  var body: some View {
    Text("These cats are not available in your region 😿")
      .font(.title)
      .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let mix = MeowMix()
    
    ContentView()
    DetailView(track: mix.tracks[0])
  }
}

