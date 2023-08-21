import React from 'react';

function ReservationsPage() {
  const reservations = []; // Fetch reservations from API

  return (
    <div className="reservations-page">
      <h2>Your Reservations</h2>
      <ul className="reservation-list">
        {reservations.map(reservation => (
          <li key={reservation.id}>
            {/* Display reservation details */}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default ReservationsPage;
