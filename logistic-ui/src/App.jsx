import React from 'react'
import './App.css'

function App() {
  return (
    <div className="app">
      <header className="header">
        <h1>Welcome to Logistic UI</h1>
        <p>A basic React application</p>
      </header>
      
      <main className="main">
        <div className="content">
          <h2>Getting Started</h2>
          <p>
            This is a basic React application created with Vite. 
            You can start building your logistics application here.
          </p>
          
          <div className="features">
            <div className="feature">
              <h3>⚡ Fast</h3>
              <p>Built with Vite for lightning-fast development</p>
            </div>
            <div className="feature">
              <h3>🎨 Modern</h3>
              <p>Clean and responsive design</p>
            </div>
            <div className="feature">
              <h3>🚀 Ready</h3>
              <p>Ready for deployment and scaling</p>
            </div>
          </div>
          
          <button className="cta-button">
            Get Started
          </button>
        </div>
      </main>
      
      <footer className="footer">
        <p>&copy; 2024 Logistic UI. Built with React & Vite.</p>
      </footer>
    </div>
  )
}

export default App 