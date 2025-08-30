// API Configuration for Choreo Backend
const DEFAULT_BASE_URL = 'http://localhost:9090/health'
const BASE_URL = (import.meta as any).env?.VITE_API_BASE_URL || DEFAULT_BASE_URL

// Get API key from environment variable
const API_KEY = (import.meta as any).env?.VITE_CHOREO_API_KEY || ''

// Create headers with authentication
export function createHeaders(additionalHeaders: Record<string, string> = {}): HeadersInit {
  const headers: HeadersInit = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    ...additionalHeaders
  }

  // Add API key if available
  if (API_KEY) {
    headers['Authorization'] = `Bearer ${API_KEY}`
  }

  return headers
}

// Create fetch options with authentication
export function createFetchOptions(
  method: string = 'GET',
  body?: any,
  additionalHeaders: Record<string, string> = {}
): RequestInit {
  const options: RequestInit = {
    method,
    headers: createHeaders(additionalHeaders),
    mode: 'cors'
  }

  if (body) {
    options.body = JSON.stringify(body)
  }

  return options
}

// Get the base URL
export function getBaseUrl(): string {
  return BASE_URL
}

// Check if we're using Choreo (production)
export function isChoreoBackend(): boolean {
  return BASE_URL.includes('choreoapis.dev')
}

// Log API configuration for debugging
export function logApiConfig(): void {
  console.log('API Configuration:')
  console.log('- Base URL:', BASE_URL)
  console.log('- Using Choreo:', isChoreoBackend())
  console.log('- API Key Available:', !!API_KEY)
}
