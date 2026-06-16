import Foundation
import Supabase

/// The single shared Supabase client used across the whole app.
/// The `anon` key below is a public/publishable key — safe to ship in the app;
/// your data is protected by Row-Level-Security policies in Supabase, not by hiding this key.
let supabase = SupabaseClient(
    supabaseURL: URL(string: "https://bmfbnydcanksjwquljzb.supabase.co")!,
    supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJtZmJueWRjYW5rc2p3cXVsanpiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjY3MzA0MjksImV4cCI6MjA4MjMwNjQyOX0.d7sVVng0ZVOzE-yLXjMhiKr7cUodIP9C8v4zoVQxZHo"
)
