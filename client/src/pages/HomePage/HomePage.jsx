import React from 'react';
import ClothingItemTile from '../../components/ClothingItem/ClothingItem'; // Update the path

function HomePage() {
  const featuredItems = []; // Fetch featured items from API

  return (
    <div className="home-page">
      <h2>Featured Items</h2>
      <div className="featured-items">
        {featuredItems.map(item => (
          <ClothingItemTile key={item.id} item={item} />
        ))}
      </div>
    </div>
  );
}

export default HomePage;
