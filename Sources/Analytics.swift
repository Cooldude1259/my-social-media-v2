import Foundation

/// Lightweight TelemetryDeck client using its HTTP ingestion API.
/// No SDK, no binary frameworks — just HTTPS POSTs, so it builds fine with the plain `swift build` pipeline.
///
/// To enable it:
///   1. Create a free account at https://telemetrydeck.com
///   2. Create an app in the dashboard.
///   3. Copy that app's "App ID" (a UUID) and paste it below.
/// Until then, logging is a silent no-op, so it's harmless when unset.
enum Analytics {
    private static let appID = "119BD5B4-E900-4786-A2D1-DC9CCBFB5194" // TODO: paste your TelemetryDeck App ID (a UUID)

    /// Stable, anonymous per-install identifier. TelemetryDeck hashes this server-side,
    /// so no personal data leaves the device — just a consistent "this is one user" signal.
    private static var clientUser: String {
        let key = "td_client_user"
        if let existing = UserDefaults.standard.string(forKey: key) { return existing }
        let new = UUID().uuidString
        UserDefaults.standard.set(new, forKey: key)
        return new
    }

    /// One session id per app launch, so TelemetryDeck can group events into sessions.
    private static let sessionID = UUID().uuidString

    /// Send a signal (event) to TelemetryDeck. Fire-and-forget; never blocks the UI.
    static func log(_ signalType: String, params: [String: Any] = [:]) {
        guard appID != "119BD5B4-E900-4786-A2D1-DC9CCBFB5194", !appID.isEmpty else { return }
        guard let url = URL(string: "https://nom.telemetrydeck.com/v2/") else { return }

        // TelemetryDeck payload values are strings.
        let payload = params.reduce(into: [String: String]()) { $0[$1.key] = "\($1.value)" }

        let signal: [String: Any] = [
            "appID": appID,
            "clientUser": clientUser,
            "sessionID": sessionID,
            "type": signalType,
            "payload": payload
        ]

        guard let body = try? JSONSerialization.data(withJSONObject: [signal]) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        URLSession.shared.dataTask(with: request).resume()
    }
}
