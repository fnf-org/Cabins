# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

year = Time.new.year
instants = Instant.create([
    {name: 'INSTANT_PAYMENT_DUE', description: 'Payment Due', instant:DateTime.new(year, 7, 17, 19, 30, 0, '-07:00')}
])

tier0 = Tier.create(label: 'Tier 0', description: 'Secret', available: DateTime.new(year, 6, 6, 19, 30, 0, '-07:00'));
tier1 = Tier.create(label: 'Tier 1', description: 'Planners Medical', available: DateTime.new(year, 7, 10, 19, 30, 0, '-07:00'));
tier2 = Tier.create(label: 'Tier 2', description: 'Planners', available: DateTime.new(year, 7, 11, 15, 30, 0, '-07:00'));
tier3 = Tier.create(label: 'Tier 3', description: 'All', available: DateTime.new(year, 7, 11, 19, 30, 0, '-07:00'));

posts = Post.create([
  {
    category: 'home', title: 'Greetings FnFers!',
    body:
      "Welcome to the FnF #{year} Cabin Reservation App<br/><br/>"\
      "This app will help you pre-register for lodging at the FnF Summer Campout, receive notification of lodging registration times, review and reserve specific rooms at the Saratoga Springs resort, and receive confirmation of your reservation and payment. To start using FnF #{year} cabins, please review the lodging reservation instructions below and FAQ. <strong><a href=\"/users/new\">Click here to register</a></strong>."
  },
  {
    category: 'home', title: 'Pre-registration',
    body:
      "On the next page, FnF #{year} Cabins will prompt you for contact information and details about your participation in this year\'s summer camp out. We will be assigning people to tiers based on the following</p><p><strong>Coordinators &amp; Planners:</strong> People on the planners mailing list.</p><p><strong>Planner Medical:</strong> Planners with reasonable medical need for a room.</p><p><strong>Other / Attendee:</strong> People who have tickets already but don\'t fit into one of the other categories.</p><p>Once you complete the pre-registration process, FnF #{year} Cabins admins will send you a confirmation email with your date to register for the lodging of your choice at Saratoga Springs.</p>"
  },
  {
      category: 'home', title: 'Registration',
      body:
        "<p>During the registration period, log into the FnF #{year} Cabins lodging registration page and select the lodging options tab.Please note that you will be able to register for exactly one room*, and NO MORE than one room. Once you select a room, FnF #{year} Cabins will reserve that room in your name until the payment deadline, during which time you must send your payment or we will release your reservation.</p><p>Please note that some of the rooms have space for as many as 6 people**, so you can organize a group and split up the room however you wish. Once you have registered and paid for a room, any room changes or cost sharing are your responsibility. <strong>Please note</strong>: you will also be responsible for any damages that may occur and removal of all trash. <strong>FnF campout is a pack in and pack out event and this applies to the cabins as well.</strong><p style=\"font-style: italic; font-size: smaller;\">* The notable exception: In the Main Cabin, you may registerfor individual beds in dormitory-style rooms. These rooms have multiple twin bunk beds for which you can register for more than one.<br/><br/>** Assuming 2 people to a double or queen bed and 1 person to a twin.</p>"
  },
  {
    category: 'home', title: 'Pay',
    body:
        "<p>Once you have reserved your lodging through FnF #{year} Cabins, you will receive a confirmation email. Please check the FAQ for payment options other than the PayPal button at check-out.</p>Please note that your pre-paid registration only lasts until the payment deadline (usually a week after registrations). If we have not received your payment within that time, FnF #{year} Cabins will cancel your reservation and make your lodging preference available for other participants.</p>Once we receive payment, FnF #{year} Cabins will send you an email confirming your paid reservation.</p><p>Should you have any questions about the FnF lodging policy, please contact fnfreservations@gmail.com."
  },

  {
    category: 'rule', title: 'ATTENTION: FnF Campout is a PACK IN/PACK OUT Event.',
    body:
      'Please take all your Trash/Recyclables including what is in the trash can when you leave.'
  },
  {
      category: 'rule', title: 'Room Rules: Smoking',
      body:
          'Smoking (of any kind) is strictly prohibited (that means don\'t do it). Saratoga Springs only permits smoking in designated smoking areas (see map or ask). <strong>This is especially important this year.</strong>'
  },
  {
      category: 'rule', title: 'Room Rules: Bathrooms',
      body:
          'The bathroom facilities are for your use only. This is a critical restriction as the septic system will not handle more than what the limited number of renters can produce. <strong>Please ask your friends to make use of the ample portable and public facilities.</strong>'
  },
  {
      category: 'rule', title: 'Room Rules: Leave it as you found it',
      body:
          'Please leave the room as you found it. Move furniture back where it was when you arrived. You are responsible for any damages or excessive dirtiness.'
  },
  {
      category: 'rule', title: 'Room Rules: Trash',
      body:
          'Remove <strong>ALL</strong> trash from room. FnF is a pack in/pack out event and this includes the trash and recyclables in the trash cans in the rooms.'
  },
  {
      category: 'rule', title: 'Room Rules: Issues',
      body:
          'Should you have any problems with your room, please contact the Saratoga Springs staff.'
  },
  {
      category: 'faq', title: 'Are you eligible?',
      body:
          'You are eligible to register for a cabin if you have a ticket secured <strong>and</strong> are either a coordinator or will be working one or more shifts at the event.'
  },
  {
      category: 'faq', title: 'When can I pre-register for a cabin?',
      body:
          'The pre-registration page will open June 23.  You\'ll need to enter your name, email address, and phone number, create a password, and verify your selected registration tier - i.e, your role at the campout or the accommodations needed for medical priority. This pre-registration step does not guarantee you a cabin; it just allows us to validate your eligibility before we open the signup sheet to each tier.'
  },
  {
      category: 'faq', title: 'Do I need to pre-register if I pre-registered last year?',
      body:
          'Yes. You must pre-register again this year, even if you signed up for an account last year. Your account does not roll over and your role at FnF camp out may have changed.'
  },
  {
      category: 'faq', title: 'What are the different tiers for the cabin reservation system?',
      body:
          'Tier 1) Planner Medical – People on planner\'s list with a reasonable medical need for accommodation.  This includes medical conditions, injuries, disabilities, and women in the third trimester of pregnancy. This tier is decided on a case-by-case basis, at our discretion.<br/><br/>Tier 2) Planners and Coordinators - People on the FnF planners mailing list.<br/><br/>Tier 3) Other/Attendee - Anyone else who has tickets to the event.'
  },
  {
      category: 'faq', title: 'Can I reserve a cabin/room if I haven\'t pre-registered?',
      body:
          'No. You must pre-register and get placed in a tier before you can sign-up for a cabin.'
  },
  {
      category: 'faq', title: 'When does cabin registration begin?',
      body:
          "The tier you have been placed in determines when you can sign up.<br/><br/>

Tier 1 - #{tier1.available.strftime('%A, %B %e @ %l:%M%p')}<br/>
Tier 2 - #{tier2.available.strftime('%A, %B %e @ %l:%M%p')}<br/>
Tier 3 - #{tier3.available.strftime('%A, %B %e @ %l:%M%p')}<br/><br/>

Once your tier is open, you will be able to sign in using the same email address and password you pre-registered with and choose to reserve an available room. The Registration app will allow you to choose a specific room from among those that have not yet been registered."
  },
  {
      category: 'faq', title: 'When do you need payment for the cabin?',
      body:
          'If we have not received your payment by the payment deadline, we will send you a notification that your payment is late. At that time, only Paypal payments will be accepted. In the event that we still have not received payment, we will cancel your room reservation, allowing someone else to register for it. SEND YOUR PAYMENT ON TIME'
  },
  {
      category: 'faq', title: 'I forgot to pay for my cabin/room when I reserved it. How can I pay after the fact?',
      body:
          'You can pay in two ways:<br/><br/>
1.  Pay via Paypal: Send $ to paypal@cfaea.org. Be sure to select "Send money to friends or family" and write your cabin/room number in the comments<br/><br/>
2.  Pay via check: Make your payment to CFAEA by check and send it to the following address:<br/><br/>
CFAEA<br/>
c/o Jenny Lee<br/>
930 Pacific Ave. #1<br/>
San Francisco, CA 94133<br/><br/>
* Please include the cabin/room number in the notes on the check.'
  },
  {
      category: 'faq', title: 'How do I find my cabin when I arrive at Saratoga Springs?',
      body:
          'We will have a map with the cabin assignments at the Gate so you can refer to it once you arrive on site. Each cabin will also have a list of the names of the people who reserved the rooms within.'
  },
  {
      category: 'faq', title: 'I am planning on coming early to the camp out and/or staying late, can I use my cabin during this time?',
      body:
          'Yes. You will have access to the cabin for the full time that you are at the campout.'
  },
  {
      category: 'faq', title: 'There are trashcans and recycle bins in the cabin. Can I leave my trash/recycling behind in the can?',
      body:
          '<strong>NO!</strong> You will be responsible for removing <strong>ALL</strong> trash from your cabin/room. The camp out is a pack in/pack out event and this applies to the cabins.'
  },
  {
      category: 'faq', title: 'I didn\'t receive a confirmation email. Am I registered?',
      body:
          'Check your SPAM folder and email us at fnfreservations@gmail.com for confirmation.'
  },
  {
      category: 'faq', title: 'If I am staying in a cabin/dorm room, do I need to bring linens?',
      body:
          'Saratoga Springs only supplies a sheet over the mattress. We strongly encourage you to bring your own linens, blankets and whatever else makes you feel cozy while you sleep.'
  }
])

user_minty = User.create(name: 'minty', email:'minty@inappropirates.com', password:'nopenope', password_confirmation:'nopenope', phone: '1111', role: 'planner', admin: true);
user_asdf = User.create(name: 'asdf', email:'asdf@gmail.com', password:'asdfasdf', password_confirmation:'asdfasdf', phone: '1111', role: 'attendee', admin: false);
# user_caseytest = User.create(name: 'caseytest', email:'gerstle+test@gmail.com', password:'asdfasdf', password_confirmation:'asdfasdf', phone: '1111', role: 'attendee', admin: false);

summer_cabin = BuildingType.create(label: 'Summer Cabin');
wood_tent = BuildingType.create(label: 'Wood Tent');
cabin = BuildingType.create(label: 'Cabin');
lodge = BuildingType.create(label: 'Lodge');

bed = AccommodationType.create(label: 'Bed', description: 'bed in a dorm room');
private_room = AccommodationType.create(label: 'Private Room', description: '1 bed in room');
semi_private_room = AccommodationType.create(label: 'Semi-Private Room', description: '2 beds in room');
not_private_room = AccommodationType.create(label: 'Not Private Room', description: '3+ beds in room OR futon in living area');

array = ['S1', 'S2']
array.each { |label|
  building = Building.create(label: label, building_type: summer_cabin)
  Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                       label: "Summer Cabin #{label}", description: '1x double (futon) - screened in & no electricity. Just like camping but without having to put up your own tent!',
                       occupancy: 2, price: 180.0, quantity: 1, air_conditioning: false, bathroom: false, kitchen: false)
}

array = ['A', 'E', 'F', 'H']
array.each { |label|
  building = Building.create(label: label, building_type: wood_tent)
  Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                       label: "Wood Tent #{label}", description: '1x full',
                       occupancy: 2, price: 220.0, quantity: 1, air_conditioning: false, bathroom: false, kitchen: false)
}

array = ['B']
array.each { |label|
  building = Building.create(label: label, building_type: wood_tent)
  Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                       label: "Wood Tent #{label}", description: '1x queen. Has power.',
                       occupancy: 2, price: 220.0, quantity: 1, air_conditioning: false, bathroom: false, kitchen: false)
}

array = ['C', 'D']
array.each { |label|
  building = Building.create(label: label, building_type: wood_tent)
  Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                       label: "Wood Tent #{label}", description: '2x twins - can be joined. Has power.',
                       occupancy: 2, price: 180.0, quantity: 1, air_conditioning: false, bathroom: false, kitchen: false)
}
building = Building.create(label: 'G', building_type: wood_tent)
Accommodation.create(accommodation_type: private_room, building: building, hold: true,
                     label: 'Wood Tent G - Medic', description: '1x queen. Has power.',
                     occupancy: 2, price: 300.0, quantity: 1, air_conditioning: true, bathroom: false, kitchen: false)


building = Building.create(label: 'Cabin 1', building_type: cabin)
accommodation_c1a = Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: "#{building.label} - Room A", description: '2x twin (can be joined)',
                     occupancy: 2, price: 330.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: "#{building.label} - Room B", description: '2x full',
                     occupancy: 4, price: 400.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: "#{building.label} - Room C", description: '2x twin (can be joined)',
                     occupancy: 2, price: 330.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: "#{building.label} - Room D", description: '1x full + 1x twin',
                     occupancy: 3, price: 330.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)

building = Building.create(label: 'Cabin 2', 'description': 'Reserved for Radiant Atmospheres', building_type: cabin)
accommodation_c2a = Accommodation.create(accommodation_type: semi_private_room, building: building, hold: true,
                     label: "#{building.label} - Room A", description: 'Front of cabin. 2x queen (bunked)',
                     occupancy: 4, price: 370.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
accommodation_c2b = Accommodation.create(accommodation_type: semi_private_room, building: building, hold: true,
                     label: "#{building.label} - Room B", description: 'Front of cabin. 2x queen (bunked) + 1x full (futon)',
                     occupancy: 6, price: 500.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: semi_private_room, building: building, hold: true,
                     label: "#{building.label} - Room C", description: 'Back of cabin. 2x queen (bunked)',
                     occupancy: 4, price: 370.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: semi_private_room, building: building, hold: true,
                     label: "#{building.label} - Room D", description: 'Back of cabin. 2x twin',
                     occupancy: 2, price: 350.0, quantity: 1, air_conditioning: true, bathroom: true, kitchen: false)

building = Building.create(label: 'Cabin 5', building_type: cabin)
Accommodation.create(accommodation_type: semi_private_room, building: building, hold: false,
                     label: "#{building.label} - Room A", description: '2x twin (bunked) + 2x queen (bunked)',
                     occupancy: 6, price: 500.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: semi_private_room, building: building, hold: false,
                     label: "#{building.label} - Room B", description: '2x queen (bunked)',
                     occupancy: 4, price: 400.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: not_private_room, building: building, hold: false,
                     label: "#{building.label} - Sitting Room", description: '1x full futon (living room)',
                     occupancy: 2, price: 180.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)

building = Building.create(label: 'Cabin 6', building_type: cabin)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: "#{building.label} - Room A", description: '1x queen + 1x twin',
                     occupancy: 3, price: 380.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: true)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: "#{building.label} - Room B", description: '1x queen',
                     occupancy: 2, price: 380.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: true)
Accommodation.create(accommodation_type: not_private_room, building: building, hold: false,
                     label: "#{building.label} - Sitting Room", description: '1x full futon (living room)',
                     occupancy: 2, price: 200.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: true)

building = Building.create(label: 'Cabin 7', building_type: cabin)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: "#{building.label} - Room A", description: '1x double + 1x twin',
                     occupancy: 3, price: 350.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: private_room, building: building, hold: false,
                     label: "#{building.label} - Room B", description: '1x double',
                     occupancy: 2, price: 350.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)
Accommodation.create(accommodation_type: not_private_room, building: building, hold: false,
                     label: "#{building.label} - Sitting Room", description: '1x full futon (living room)',
                     occupancy: 2, price: 180.0, quantity: 1, air_conditioning: false, bathroom: true, kitchen: false)

building = Building.create(label: 'Main Lodge', building_type: lodge)
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

Planner.create([
])

Reservation.create([
])

PaymentType.create(label: 'PayPal');
PaymentType.create(label: 'Check');
PaymentType.create(label: 'Shady Dealings');
