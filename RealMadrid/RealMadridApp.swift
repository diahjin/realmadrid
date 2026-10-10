import SwiftUI
import AVKit
import UIKit

@main
struct RealMadridApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}

struct ContentView: View {
    @State private var showPlaylist = false
    @State private var showPlayer = false
    @State private var playlistURL = ""

    var body: some View {
        NavigationStack {
            ZStack {
                Image("ArdaBackground")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .overlay(
                        LinearGradient(
                            colors: [.black.opacity(0.80), .black.opacity(0.28), .black.opacity(0.92)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .ignoresSafeArea()
                    )

                ScrollView {
                    VStack(spacing: 22) {
                        HStack(spacing: 12) {
                            Image("RealMadridCrest")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 52, height: 52)
                            Text("Real Madrid")
                                .font(.system(size: 30, weight: .bold))
                            Spacer()
                            Text("Playlist")
                                .font(.title3)
                                .foregroundStyle(.white.opacity(0.85))
                        }
                        .padding(.horizontal)
                        .padding(.top, 12)

                        VStack(spacing: 12) {
                            Image("RealMadridCrest")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 105, height: 105)

                            Text("REAL MADRID")
                                .font(.system(size: 27, weight: .heavy, design: .rounded))
                                .tracking(2)

                            Text("HALA MADRID")
                                .font(.headline)
                                .tracking(5)
                                .foregroundStyle(Color(red: 0.95, green: 0.75, blue: 0.15))
                        }
                        .padding(.top, 4)

                        Button {
                            showPlaylist = true
                        } label: {
                            VStack(spacing: 12) {
                                Image(systemName: "plus")
                                    .font(.system(size: 34, weight: .medium))
                                Text("añadir lista de reproducción")
                                    .font(.headline)
                            }
                            .frame(maxWidth: .infinity, minHeight: 145)
                            .background(.ultraThinMaterial)
                            .overlay(
                                RoundedRectangle(cornerRadius: 22)
                                    .stroke(Color.yellow.opacity(0.55), lineWidth: 1.5)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 22))
                        }
                        .padding(.horizontal)

                        Button {
                            if let url = URL(string: "http://xalb.xyz/ibogold") {
                                UIApplication.shared.open(url)
                            }
                        } label: {
                            Text("Abrir sitio web")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 15)
                                .background(Color.black.opacity(0.60))
                                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.yellow, lineWidth: 1.5))
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                        .padding(.horizontal)

                        VStack(spacing: 8) {
                            Text("Real Madrid • La Casa Blanca")
                                .font(.headline)
                            Text("Reproductor multimedia general. Proporciona únicamente contenido para el que tengas autorización.")
                                .font(.footnote)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white.opacity(0.75))
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 30)
                    }
                }
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $showPlaylist) {
                PlaylistSheet(urlText: $playlistURL)
            }
        }
    }
}

struct PlaylistSheet: View {
    @Binding var urlText: String
    @Environment(\.dismiss) private var dismiss
    @State private var errorMessage = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Lista M3U") {
                    TextField("https://ejemplo.com/lista.m3u", text: $urlText)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.URL)
                        .autocorrectionDisabled()

                    Button("Guardar lista") {
                        guard let url = URL(string: urlText), url.scheme != nil else {
                            errorMessage = "Introduce una URL válida."
                            return
                        }
                        UserDefaults.standard.set(urlText, forKey: "playlistURL")
                        dismiss()
                    }
                }

                if !errorMessage.isEmpty {
                    Text(errorMessage).foregroundStyle(.red)
                }

                Section("Nota") {
                    Text("Esta versión iPhone reproduce contenido desde URLs que tú proporciones. La lógica específica del APK Android no se puede convertir directamente a iOS; este proyecto es una base nativa para continuar el port.")
                }
            }
            .navigationTitle("Real Madrid")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Cerrar") { dismiss() }
                }
            }
        }
    }
}
