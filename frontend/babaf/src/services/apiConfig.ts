// API Configuration for Choreo Backend
const DEFAULT_BASE_URL = 'https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0'
const BASE_URL = (import.meta as any).env?.VITE_API_BASE_URL || DEFAULT_BASE_URL

// Get API key from environment variable
const API_KEY = (import.meta as any).env?.VITE_CHOREO_API_KEY || 'eyJraWQiOiJnYXRld2F5X2NlcnRpZmljYXRlX2FsaWFzIiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiI0NTczM2E0NC0xMWQ1LTQ2ZGUtODQzOC0wMTBiNDY0ZGExZmZAY2FyYm9uLnN1cGVyIiwiYXVkIjoiY2hvcmVvOmRlcGxveW1lbnQ6c2FuZGJveCIsIm9yZ2FuaXphdGlvbiI6eyJ1dWlkIjoiMzE2ZGRhNDAtOWI1NS00NWVmLWJjOGUtODIwNGI2ODhkYmVhIn0sImlzcyI6Imh0dHBzOlwvXC9zdHMuY2hvcmVvLmRldjo0NDNcL2FwaVwvYW1cL3B1Ymxpc2hlclwvdjJcL2FwaXNcL2ludGVybmFsLWtleSIsImtleXR5cGUiOiJTQU5EQk9YIiwic3Vic2NyaWJlZEFQSXMiOlt7InN1YnNjcmliZXJUZW5hbnREb21haW4iOm51bGwsIm5hbWUiOiJiYWxsZXJpbmFoZWFsdGhyZWMgLSBIZWFsdGgiLCJjb250ZXh0IjoiXC8zMTZkZGE0MC05YjU1LTQ1ZWYtYmM4ZS04MjA0YjY4OGRiZWFcL2RlZmF1bHRcL2JhbGxlcmluYWhlYWx0aHJlY1wvdjEuMCIsInB1Ymxpc2hlciI6ImNob3Jlb19wcm9kX2FwaW1fYWRtaW4iLCJ2ZXJzaW9uIjoidjEuMCIsInN1YnNjcmlwdGlvblRpZXIiOm51bGx9XSwiZXhwIjoxNzU2NTU4MzQzLCJ0b2tlbl90eXBlIjoiSW50ZXJuYWxLZXkiLCJpYXQiOjE3NTY1NTc3NDMsImp0aSI6IjI3Mjk3Yjc4LWJiZmUtNDcxMC1iOGY2LTI5YzZmZjlmZWZhMSJ9.DjrYpVwR2MBf-RZYT4JJEuf0OCTqusN8l9x8j6bzuYLp8ZlXsWL2DAIfjUrKEYaB5On7fQ6ISUV1ca0U8Jd023WuPM_Dn-sivy4tA9ltxMXmW--_V8rcvaiWjkhDd_M7YCEDOgTm0g-F99Aewi8jjU5QsZlLcp9NpHfJH4BCvM4EgLisXebrlDcp33raKy4b56QLKWgrDTr53KiPBqhwSM1_PAK1nzHG4I8L6LcO6K2ar9m0Qv0ZbQYdDPN577-bhjUS7ji4PdO9Vetn28DuE3v9SGnxiZzI307zWkRgHmFBsTig_d253P1V_JkHJgW12nHORpiqRxBA2mjmRaCc5U3BO8YYudgpss-bVljiasraqDcD7bBOehsFtraWxCE8RcD_mKcMOdJ0oAkTZOWzkEJYUctRKi9rEU34bYF9STAUX9f4lqaHLcRyYyKl6hx5hlL2nC6pigshL3bY-356Qf-PRkWX-N3On0FBtwwzpaOuzvCHOJ-sLhoHc88v6u5qG1Bh4kNI-rqZA5K_gpfQ8hZIcT7LwEUUyFdV6tPULC0yRTvyiLObnuue6JDTrt285ignVuYH-RleyeZpqnjqwjHCcGPDg8TKLdJ_Rz823qKeNME7ikUTfRkoFW2KRrCP9Bbt6t_AFDKqKdquY8L3Es4_Ef-gFWYHcUFIsvdZnsg'

// Create headers with authentication
export function createHeaders(additionalHeaders: Record<string, string> = {}): HeadersInit {
  const headers: HeadersInit = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    ...additionalHeaders
  }

  // Add API key if available
  if (API_KEY) {
    headers['Test-Key'] = API_KEY
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
