import React from 'react';
import ClothingItemTile from '../../components/ClothingItem/ClothingItem'; // Update the path

function LandingPage() {
  const clothingItems = []; // Fetch clothing items from API

  return (
    <div className="landing-page">
      {clothingItems.map(item => (
        <ClothingItemTile key={item.id} item={item} />
      ))}
    </div>
  );
}

export default LandingPage;
