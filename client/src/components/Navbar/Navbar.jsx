import React from 'react';
import { Link } from 'react-router-dom';
import CategoryDropdown from '../CategoryDropDown/Category';
import SearchFilterBar from '../SearchFilterBar/SearchFilterBar';

function Navbar() {
  return (
    <nav className="navbar">
      <div className="logo">
        <Link to="/">Your App Name</Link>
        {/* Your app logo */}
      </div>
      <SearchFilterBar />
      <ul className="nav-links">
        <li><Link to="/home">Home</Link></li>
        <li><Link to="/favorites">Favorites</Link></li>
        <li><Link to="/reservations">Reservations</Link></li>
        <li><Link to="/payments">Payments</Link></li>
      </ul>
      <CategoryDropdown />
      {/* Cart icon and functionality */}
    </nav>
  );
}

export default Navbar;
