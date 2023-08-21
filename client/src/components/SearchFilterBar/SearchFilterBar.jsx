import React from 'react';

function SearchFilterBar() {
  const handleSearch = (searchQuery) => {
    // Handle search functionality
  };

  return (
    <div className="search-filter-bar">
      <input type="text" placeholder="Search..." />
      <button onClick={handleSearch}>Search</button>
    </div>
  );
}

export default SearchFilterBar;
