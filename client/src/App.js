import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom/';
import Navbar from './components/Navbar/Navbar';
import Footer from './components/Footer/Footer';
import LandingPage from './pages/LandingPage/LandingPage';
import HomePage from './pages/HomePage/HomePage';
import FavoritesPage from './pages/FavoritesPage/Favorites';
import ReservationsPage from './pages/ReservationsPage/Reservations';

function App() {
  return (
    <Router>
      <div className="App">
        <Navbar />
        <Routes>
          <Route path="/" element={<LandingPage />} />
          <Route path="/home" element={<HomePage />} />
          <Route path="/favorites" element={<FavoritesPage />} />
          <Route path="/reservations" element={<ReservationsPage />} />
        </Routes>
        <Footer />
      </div>
    </Router>
  );
}

export default App; // Export the App component as default
