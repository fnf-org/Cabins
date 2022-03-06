summer_cabin = BuildingType.create(label: 'Summer Cabin');
wood_tent = BuildingType.create(label: 'Wood Tent');
cabin = BuildingType.create(label: 'Cabin');
lodge = BuildingType.create(label: 'Lodge');

bed = AccommodationType.create(label: 'Bed', description: 'bed in a dorm room');
private_room = AccommodationType.create(label: 'Private Room', description: '1 bed in room');
semi_private_room = AccommodationType.create(label: 'Semi-Private Room', description: '2 beds in room');
not_private_room = AccommodationType.create(label: 'Not Private Room', description: '3+ beds in room OR futon in living area');

['S1', 'S2'].each {|label|
  building = Building.create(label: label, building_type: summer_cabin)
  Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                       label: "Summer Cabin #{label}", description: '1x full (futon) - screened in single-room cabin & no electricity. Just like camping but without having to put up your own tent!',
                       occupancy: 2, price: 180.0, quantity: 1, air_conditioning: false, bathroom: false, kitchen: false)
}

['A', 'E', 'F', 'H'].each {|label|
  building = Building.create(label: label, building_type: wood_tent)
  Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                       label: "Wood Tent #{label}", description: '1x full.  Single-room cabin with electricity.',
                       occupancy: 2, price: 220.0, quantity: 1, air_conditioning: false, bathroom: false, kitchen: false)
}

['B'].each {|label|
  building = Building.create(label: label, building_type: wood_tent)
  Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                       label: "Wood Tent #{label}", description: '1x queen. Single-room cabin with electricity.',
                       occupancy: 2, price: 220.0, quantity: 1, air_conditioning: false, bathroom: false, kitchen: false)
}

building = Building.create(label: "C", building_type: wood_tent)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: "Wood Tent C", description: '2x twins - can be joined into a Cal King. Single-room cabin with electricity.',
                     occupancy: 2, price: 260.0, quantity: 1, air_conditioning: false, bathroom: false, kitchen: false)

building = Building.create(label: "D", building_type: wood_tent)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: "Wood Tent D", description: '2x twins - can be joined into a Cal King. Single-room cabin with electricity.',
                     occupancy: 2, price: 220.0, quantity: 1, air_conditioning: false, bathroom: false, kitchen: false)

building = Building.create(label: 'G', building_type: wood_tent, description: 'Reserved for Medical')
Accommodation.create(accommodation_type: private_room, building: building, hold: true,
                     label: 'Wood Tent G - Medic Team', description: '1x queen. Single-room cabin with electricity.',
                     occupancy: 2, price: 260.0, quantity: 1, air_conditioning: true, bathroom: false, kitchen: false)

building = Building.create(label: 'Cabin 1 - Family Cabin', building_type: cabin, description: 'Family cabin for those with small children.  Shared bathrooms, electricity.')
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: "Cabin 1 (Family Cabin) - Room A", description: '2x twin (can be joined into Cal King)',
                     occupancy: 2, price: 330.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: "Cabin 1 (Family Cabin) - Room B", description: '2x full',
                     occupancy: 4, price: 400.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: "Cabin 1 (Family Cabin) - Room C", description: '2x twin (can be joined into Cal King',
                     occupancy: 2, price: 330.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: "Cabin 1 (Family Cabin) - Room D", description: '1x full + 1x twin',
                     occupancy: 3, price: 330.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)

building = Building.create(label: 'Cabin 2', 'description': 'Reserved for Radiant Atmospheres. Shared bathrooms, electricity.', building_type: cabin)
Accommodation.create(accommodation_type: semi_private_room, building: building, hold: true,
                     label: "Cabin 2 (RA staff) - Room A", description: 'Front of cabin. 2x queen (bunked)',
                     occupancy: 4, price: 370.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: semi_private_room, building: building, hold: true,
                     label: "Cabin 2 (RA staff) - Room B", description: 'Front of cabin. 2x queen (bunked) + 1x full (futon)',
                     occupancy: 6, price: 500.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: semi_private_room, building: building, hold: true,
                     label: "Cabin 2 (RA staff) - Room C", description: 'Back of cabin. 2x full',
                     occupancy: 4, price: 370.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: semi_private_room, building: building, hold: true,
                     label: "Cabin 2 (RA staff) - Room D", description: 'Back of cabin. 2x twin',
                     occupancy: 2, price: 350.0, quantity: 1, air_conditioning: true, bathroom: true, kitchen: false)

building = Building.create(label: 'Cabin 5', building_type: cabin, description: 'Shared bathrooms, electricity.')
Accommodation.create(accommodation_type: semi_private_room, building: building, hold: false,
                     label: "#{building.label} - Room A", description: '2x twin (bunked) + 2x queen (bunked)',
                     occupancy: 6, price: 500.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: semi_private_room, building: building, hold: false,
                     label: "#{building.label} - Room B", description: '2x queen (bunked)',
                     occupancy: 4, price: 400.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: not_private_room, building: building, hold: false,
                     label: "#{building.label} - Sitting Room", description: '1x full futon (living room)',
                     occupancy: 2, price: 180.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)

building = Building.create(label: 'Cabin 6', building_type: cabin, description: 'Shared bathrooms, electricity.  Shared kitchenette (follow the kitchen rules!)')
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: "#{building.label} - Room A", description: '2x twin (bunked) + 2x queen (bunked)',
                     occupancy: 3, price: 380.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: true)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: "#{building.label} - Room B", description: '1x queen',
                     occupancy: 2, price: 380.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: true)
Accommodation.create(accommodation_type: not_private_room, building: building, hold: false,
                     label: "#{building.label} - Sitting Room", description: '1x full futon (living room)',
                     occupancy: 2, price: 200.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: true)

building = Building.create(label: 'Cabin 7', building_type: cabin, description: 'Shared bathrooms, electricity. Wheelchair ramp. ')
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: "#{building.label} - Room A", description: '1x full + 1x twin. ADA accessible.',
                     occupancy: 3, price: 350.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: "#{building.label} - Room B", description: '1x full. ADA accessible.',
                     occupancy: 2, price: 350.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: not_private_room, building: building, hold: false,
                     label: "#{building.label} - Sitting Room", description: '1x full futon (living room). ADA accessible.',
                     occupancy: 2, price: 180.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)

building = Building.create(label: 'Main Lodge', building_type: lodge, description: 'Shared bathrooms, electricity.')
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: 'Main Lodge 4 - Master Bedroom', description: '1x queen + 1x twin',
                     occupancy: 3, price: 300.0, quantity: 1, air_conditioning: true, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: bed, building: building, hold: false,
                     label: 'Main Lodge 1 - Dorm', description: '1 twin bed in a room of 8 twin beds (bunked)',
                     occupancy: 1, price: 65.0, quantity: 8, air_conditioning: true, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: bed, building: building, hold: false,
                     label: 'Main Lodge 2 - Quiet Dorm', description: '1 twin bed in a room of 10 twin beds (bunked)',
                     occupancy: 1, price: 65.0, quantity: 10, air_conditioning: true, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: bed, building: building, hold: false,
                     label: 'Main Lodge 3 - Dorm', description: '1 twin bed in a room of 8 twin beds (bunked)',
                     occupancy: 1, price: 65.0, quantity: 8, air_conditioning: true, bathroom: true, kitchen: false)
