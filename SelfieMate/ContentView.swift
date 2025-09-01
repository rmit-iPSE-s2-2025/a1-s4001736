// Views.swift (or ContentView.swift)
import SwiftUI

// MARK: - Home View
struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("SelfieMate")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                NavigationLink(destination: PoseGuideView()) {
                    Text("Start Photobooth")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                NavigationLink(destination: GalleryView()) {
                    Text("View Gallery")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

// MARK: - Pose Guide View
struct PoseGuideView: View {
    var body: some View {
        VStack {
            Text("Select Your Face Shape")
                .font(.headline)

            HStack {
                Button("Round") {}
                Button("Oval") {}
                Button("Square") {}
            }
            .padding()

            Spacer()

            NavigationLink(destination: CameraView()) {
                Text("Next → Camera")
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

// MARK: - Camera View
struct CameraView: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.gray.opacity(0.3)) // placeholder for live camera
                .frame(height: 400)
                .overlay(Text("Camera Preview + Overlay"))

            HStack {
                Button("🌈 Palette") {}
                Button("🎨 Filter") {}
                Button("⏱ Timer") {}
            }
            .padding()

            Button(action: {}) {
                Circle()
                    .fill(Color.red)
                    .frame(width: 70, height: 70)
            }
        }
    }
}

// MARK: - Filters View
struct FiltersView: View {
    let filters = ["Soft", "Vivid", "Retro", "Mono"]

    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 400)
                .overlay(Text("Live Filter Preview"))

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(filters, id: \.self) { filter in
                        Text(filter)
                            .padding()
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(8)
                    }
                }
            }
        }
    }
}

// MARK: - Gallery View
struct GalleryView: View {
    let photos = Array(1...6).map { "Photo \($0)" }
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(photos, id: \.self) { photo in
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 100)
                        .overlay(Text(photo))
                }
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

