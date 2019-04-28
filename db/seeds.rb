year = Time.new.year
instants = Instant.create(
    [
        {name: 'INSTANT_PAYMENT_DUE', description: 'Payment Due', instant: DateTime.new(year, 7, 21, 14, 30, 0, '-07:00')},
        {name: 'INSTANT_REGISTRATIONS_CLOSED', description: 'Registrations Closed', instant: nil}
    ])

tier0 = Tier.create(
    label: 'Tier 0', description: 'Pre-Booked', available: DateTime.new(year, 6, 6, 19, 30, 0, '-07:00',),
    subject: "#{year} FnF Cabins & Lodging Room Assignment",
    email_html: "<p style='background-color: transparent; color: #000000; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 18.2px; min-height: 0px; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;'>Based on your response/role, you have been, or soon will be, <strong>pre-booked</strong> to a specific room. Please check your inbox for an email with the subject line 'FnF #{year} Cabins Booking Confirmation' (arriving sometime today if it hasn't already).&nbsp; This email will tell you the room we have assigned you to.</p>
<p style='background-color: transparent; color: #000000; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 18.2px; min-height: 0px; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;'><strong>Important!&nbsp;</strong> If you do not agree with the room you have been assigned, please email us at fnfreservations@gmail.com <span style='text-decoration: underline;'>ASAP</span> - we will be opening registration to the general Medical tier on Tuesday night!!</p>
<p style='background-color: transparent; color: #000000; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 18.2px; min-height: 0px; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;'>If you are happy with your room assignment, please pay us.&nbsp; You can see the cost for your room, and get to a handy PayPal button, like this:</p>
<p>1. Sign in on the Cabin Site at&nbsp;<a href='http://cabins.inappropirates.com'>http://cabins.inappropirates.com</a></p>
<p>2. Look in the top right for your name; click on it.&nbsp; From the dropdown choose 'profile'.</p>
<p>3. On that page, you will see the room you have been assigned and the cost.</p>
<p>4. There is a PayPal link. If you need to pay by a method other than PayPal, please see the FAQ.</p>
<p style='background-color: transparent; color: #000000; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 18.2px; min-height: 0px; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;'>Please add fnfreservations@gmail.com to your approved senders list to avoid emails going into the SPAM folder.<br style='background-color: transparent; color: #000000; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 14px; line-height: 18.2px; min-height: 0px;' /><br style='background-color: transparent; color: #000000; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 14px; line-height: 18.2px; min-height: 0px;' />Thanks!<br style='background-color: transparent; color: #000000; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 14px; line-height: 18.2px; min-height: 0px;' /><br style='background-color: transparent; color: #000000; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 14px; line-height: 18.2px; min-height: 0px;' />FnF #{year} Cabins<br style='background-color: transparent; color: #000000; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 14px; line-height: 18.2px; min-height: 0px;' /><a style='background-color: transparent; color: #0066cc; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 14px; line-height: 18.2px; min-height: 0px;' href='http://cabins.inappropirates.com'>http://cabins.inappropirates.com</a></p>",
    email_text: "Based on your response/role, you have been, or soon will be, pre-booked to a specific room. Please check your inbox for an email with the subject line 'FnF #{year} Cabins Booking Confirmation' (arriving sometime today if it hasn't already).  This email will tell you the room we have assigned you to.

Important!  If you do not agree with the room you have been assigned, please email us at fnfreservations@gmail.com ASAP - we will be opening registration to the general Medical tier on Tuesday night!!

If you are happy with your room assignment, please pay us.  You can see the cost for your room, and get to a handy PayPal button, like this:
1. Sign in on the Cabin Site at http://cabins.inappropirates.com
2. Look in the top right for your name; click on it.  From the dropdown choose 'profile'.
3. On that page, you will see the room you have been assigned and the cost.
4. There is a PayPal link. If you need to pay by a method other than PayPal, please see the FAQ.

Please add fnfreservations@gmail.com to your approved senders list to avoid emails going into the SPAM folder.

Thanks!

FnF #{year} Cabins
http://cabins.inappropirates.com"
)
tier1 = Tier.create(
    label: 'Tier 1', description: 'Planners Medical', available: DateTime.new(year, 5, 28, 19, 30, 0, '-07:00'),
    subject: "#{year} FnF Cabins & Lodging Tier Assignment",
    email_html: "<p>Based on your response/role, you have been assigned the 'Medical' tier. You will be allowed to log in on <strong>Tuesday, 10 Jul #{year} at 7:30 PM PDT</strong> to request your lodging for the campout. &nbsp;</p>
<p>A brief note:&nbsp; after we completed pre-assignments for people who needed specific amenities or a specific cabin, there are still <strong>more</strong> private rooms available than there are people who will be registering in the Medical tier.&nbsp; This means that everyone in the Medical tier who wants a cabin (vs a dorm bed) can have one!&nbsp; It just might not be your first choice cabin.&nbsp; We encourage you to visit the site before your tier opens and <a href='http://cabins.inappropirates.com/accommodations'>identify your first few choices for rooms</a>. (You will need to log in to view the list of rooms available to book.)</p>
<p><br />If you have any questions or you feel you have not been assigned the correct tier, please contact us at fnfreservations@gmail.com.<br /><br />Please add fnfreservations@gmail.com to your approved senders list to avoid emails going into the SPAM folder.<br /><br />Thanks!<br /><br />FnF #{year} Cabins<br /><a href='http://cabins.inappropirates.com'>http://cabins.inappropirates.com</a></p>",
    email_text: "Based on your response/role, you have been assigned the 'Medical' tier. You will be allowed to log in on Tuesday, 10 Jul #{year} at 7:30 PM PDT to request your lodging for the campout.

A brief note:  after we completed pre-assignments for people who needed specific amenities or a specific cabin, there are still *more* private rooms available than there are people who will be registering in the Medical tier.  This means that everyone in the Medical tier who wants a cabin (vs a dorm bed) can have one!  It just might not be your first choice cabin.  We encourage you to visit the site before your tier opens and identify your first few choices for rooms: https://cabins.inappropirates.com/accommodations (You will need to log in to view the list of rooms available to book.)

If you have any questions or you feel you have not been assigned the correct tier, please contact us at fnfreservations@gmail.com.

Please add fnfreservations@gmail.com to your approved senders list to avoid emails going into the SPAM folder.

Thanks!

FnF #{year} Cabins
http://cabins.inappropirates.com"
)
tier2 = Tier.create(
    label: 'Tier 2', description: 'Planners', available: DateTime.new(year, 5, 29, 19, 30, 0, '-07:00'),
    subject: "#{year} FnF Cabins & Lodging Tier Assignment",
    email_html: "<p>Based on your response/role, you have been assigned the 'Planners' tier. You will be allowed to log in on <strong>Wednesday, 11 Jul #{year} at 7:30 PM PDT</strong> to request your lodging for the campout. &nbsp;<br /><br />If you have any questions or you feel you have not been assigned the correct tier, please contact us at fnfreservations@gmail.com.<br /><br />Please add fnfreservations@gmail.com to your approved senders list to avoid emails going into the SPAM folder.<br /><br />Thanks!<br /><br />FnF #{year} Cabins<br /><a href='http://cabins.inappropirates.com'>http://cabins.inappropirates.com</a></p>",
    email_text: "Based on your response/role, you have been assigned the 'Planners' tier. You will be allowed to log in on Wednesday, 11 Jul #{year} at 7:30 PM PDT to request your lodging for the campout.

If you have any questions or you feel you have not been assigned the correct tier, please contact us at fnfreservations@gmail.com.

Please add fnfreservations@gmail.com to your approved senders list to avoid emails going into the SPAM folder.

Thanks!

FnF #{year} Cabins
http://cabins.inappropirates.com"
);
tier3 = Tier.create(
    label: 'Tier 3', description: 'All', available: DateTime.new(year, 5, 30, 19, 30, 0, '-07:00'),
    subject: "#{year} FnF Cabins & Lodging Tier Assignment",
    email_html: "<p>Based on your response/role, you have been assigned the 'Volunteers' tier. You will be allowed to log in on <strong>Thursday, 12 Jul #{year} at 7:30 PM PDT</strong> to request your lodging for the campout. &nbsp;<br /><br />If you have any questions or you feel you have not been assigned the correct tier, please contact us at fnfreservations@gmail.com.<br /><br />Please add fnfreservations@gmail.com to your approved senders list to avoid emails going into the SPAM folder.<br /><br />Thanks!<br /><br />FnF #{year} Cabins<br /><a href='http://cabins.inappropirates.com'>http://cabins.inappropirates.com</a></p>",
    email_text: "Based on your response/role, you have been assigned the 'Volunteers' tier. You will be allowed to log in on Thursday, 12 Jul #{year} at 7:30 PM PDT to request your lodging for the campout.

If you have any questions or you feel you have not been assigned the correct tier, please contact us at fnfreservations@gmail.com.

Please add fnfreservations@gmail.com to your approved senders list to avoid emails going into the SPAM folder.

Thanks!

FnF #{year} Cabins
http://cabins.inappropirates.com"
);


user_minty = User.create(name: 'minty', email: 'minty@inappropirates.com', password: 'nopenope', password_confirmation: 'nopenope', phone: '1111', role: 'planner', admin: true);

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
                     label: "Cabin 2 (RA staff) - Room C", description: 'Back of cabin. 2x queen (bunked)',
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

PaymentType.create(label: 'PayPal');
PaymentType.create(label: 'Check');
PaymentType.create(label: 'Shady Dealings');

Post.create(
    [
        {
            category: 'home',
            title: '<h3>Greetings FnFers!</h3>',
            body: "<p><strong>Welcome to the FnF #{year} Cabin Reservation Site!</strong></p>
<p>The steps to get your lodging are:</p>
<ol>
<li>pre-register for lodging at the FnF Summer Campout,</li>
<li>receive a tier assignment and notification of lodging registration times,</li>
<li>register for specific rooms at the Saratoga Springs resort,</li>
<li>receive confirmation of your registration,</li>
<li>pay for your room, and</li>
<li>receive confirmation of your payment and reservation.</li>
</ol>
<p>To start, please review the instructions here, the <strong><a href='../../rules'>cabin rules</a></strong>. and the <strong><a href='../../faq'>FAQ</a></strong>.</p>"
        },
        {
            category: 'home',
            title: '<h3>1. Pre-registration and Tier Assignment</h3>',
            body: "<p>On the pre-registration page, we ask you for contact information and details about your participation in this year's summer camp out. We will be assigning people to tiers:</p>
<p><strong>Medical:</strong> Planners and others with reasonable medical need for a room.</p>
<p><strong>Coordinators &amp; Planners:</strong> People on the planners mailing list.</p>
<p><strong>Other Volunteer:</strong> People who have tickets already, and plan to work at least one volunteer shift, but don't fit into one of the other categories.</p>
<p>Once you complete the pre-registration process, FnF #{year} Cabins admins will assign you a tier and send you a confirmation email with your date to register for the lodging of your choice at Saratoga Springs.</p>
<p><strong><a href='../../users/new'>Click here to pre-register</a></strong>.</p>"
        },
        {
            category: 'home',
            title: '<h3>2. Registration and Registration Confirmation</h3>',
            body: '<p>When your tier\'s registration opens, log into the website and select the <strong><a href="../../accomodations">"book!"</a></strong> tab. Please note that you will be able to register for one room and NO MORE than one room*. Once you register for a room, you will get a registration confirmation email. But you are not done! You must pay in order to get a confirmed reservation. You must send your payment before the payment deadline (July 20) or we will release your hold on the room.</p>
<p>Some of the rooms have space for as many as 6 people**, so you can organize a group, have one person register for the room, and split up the room however you wish. Once you have registered and paid for a room, any room changes or cost sharing are the responsibility of the group.</p>
<p><strong>Please note</strong>: the person who reserves the room will be responsible for making sure guests in the room follow all <strong><a href="../../rules">cabin rules</a></strong>, paying for any damages that may occur and <strong>removing all trash</strong>. The FnF campout is a pack in and pack out event and this applies to the cabins as well. Trash cans are only provided to help you collect your garbage before you pack it out.</p>
<p style="font-style: italic; font-size: smaller;">* The notable exception: In the Main Cabin, there are three dormitory-style rooms with multiple twin bunk beds. For these rooms, you register by the bed, and you may register for more than one bed.<br /><br />** Assuming 2 people to a double or queen bed and 1 person to a twin.</p>'
        },
        {
            category: 'home',
            title: '<h3>3. Payment and Reservation Confirmation</h3>',
            body: '<p>Once you have registered for a room, you will receive a confirmation email (step 4), and you will immediately see a screen with an option to pay by PayPal. We suggest you be ready to pay immediately after registration. If you do not pay at checkout, payment is more complicated! Please check the <strong><a href="../../faq">FAQ</a></strong> for payment options other than the PayPal button at check-out.</p>
<p>Please remember that a non-paid registration only lasts until July 20. If we have not received your payment before then, we will cancel your registration and make your lodging available for other participants.</p>
<p>Once we receive payment, we will send you a final email confirming your paid reservation.</p>
<p>If you have any questions about the FnF lodging process, please contact <a href="mailto:fnfreservations@gmail.com?subject=Registration%20Question">fnfreservations@gmail.com</a>.</p>'
        },
        {
            category: 'rule',
            title: '<h3>Room Rules: Trash</h3>',
            body: '<h5>ATTENTION: the FnF Campout is a PACK IN/PACK OUT Event.</h5>
<p>Please take all your trash/recyclables when you leave, including what is in the trash can. Trash cans are only provided to help you collect your garbage before you pack it out.</p>'
        },
        {
            category: 'rule',
            title: '<h3>Room Rules: Smoking</h3>',
            body: '<p>Smoking (of any kind) is strictly prohibited in the rooms and in most outdoor areas (that means don\'t do it). Saratoga Springs only permits smoking in designated smoking areas (see map or ask). <strong>This is especially important this year - the fire risk is very high.</strong></p>'
        },
        {
            category: 'rule',
            title: '<h3>Room Rules: Bathrooms</h3>',
            body: '<p>The bathroom facilities are for people staying in the lodging only. This is a critical restriction as the septic system will not handle more than what the limited number of renters can produce. <strong>Please ask your friends to make use of the ample portable and public facilities.</strong></p>'
        },
        {
            category: 'rule',
            title: '<h3>Room Rules: Leave it as you found it</h3>',
            body: 'Please leave the room as you found it. Move furniture back where it was when you arrived. You are responsible for any damages or excessive dirtiness.'
        },
        {
            category: 'faq',
            title: '<h3>Am I eligible?</h3>',
            body: '<p>You are eligible to register for a cabin if you have a ticket secured <strong>and</strong> are either a coordinator or will be working one or more shifts at the event.</p>
<p>Yes, we know some years the staff sheet is late going up.&nbsp; Please be honest.&nbsp; The campout works best when everyone helps create the event, so please honor those working a shift by not registering for a cabin if you don\'t intend to work.</p>'
        },
        {
            category: 'faq',
            title: '<h3>When can I pre-register?</h3>',
            body: '<p>The pre-registration page will open July 2. You\'ll need to enter your name, email address, and phone number, create a password, and verify your selected registration tier - i.e, your role at the campout or the accommodations needed for medical priority. This pre-registration step does not guarantee you a room or a bed; it just allows us to validate your eligibility before we open the signup sheet to each tier.</p>'
        },
        {
            category: 'faq',
            title: '<h3>Do I need to pre-register if I pre-registered last year?</h3>',
            body: '<p>Yes! You must pre-register again this year, even if you signed up for an account last year. Your account does not roll over and your role at the FnF campout may have changed.</p>'
        },
        {
            category: 'faq',
            title: '<h3>What are the different tiers for the reservation system?</h3>',
            body: '<p><strong>Tier 1) Medical</strong> - People with a reasonable medical need for accommodation. This includes medical conditions, injuries, disabilities, and women in the third trimester of pregnancy. This tier is decided on a case-by-case basis, at our discretion.</p>
<p><strong>Tier 2) Planners and Coordinators</strong> - People on the FnF planners mailing list.</p>
<p><strong>Tier 3) Other Volunteer</strong> - Anyone else who has tickets to the event.</p>'
        },
        {
            category: 'faq',
            title: '<h3>Can I reserve a bed/room if I haven\'t pre-registered?</h3>',
            body: '<p>No. You must pre-register and get placed in a tier before you can register for lodging.</p>'
        },
        {
            category: 'faq',
            title: '<h3>When does lodging registration open?</h3>',
            body: "<p>The tier you have been placed in determines when you can register.
<p>
Tier 1 - #{tier1.available.strftime('%A, %B %e @ %l:%M%p')}<br/>
Tier 2 - #{tier2.available.strftime('%A, %B %e @ %l:%M%p')}<br/>
Tier 3 - #{tier3.available.strftime('%A, %B %e @ %l:%M%p')}
</p>
Once your tier is open, you will be able to sign in using the same email address and password you pre-registered with and register for an available room. Room registration is first-come-first-serve within each tier.</p>"
        },
        {
            category: 'faq',
            title: '<h3>When do you need payment?</h3>',
            body: '<p>If we have not received your payment by July 20, we will send you a notification that your payment is late. At that time, only PayPal payments will be accepted. In the event that we still have not received payment, we will cancel your room registration, and notify people on our waitlist. SEND YOUR PAYMENT ON TIME.</p>'
        },
        {
            category: 'faq',
            title: '<h3>I forgot to pay for my cabin/room when I registered for it. How can I pay after the fact?</h3>',
            body: '<p>You can pay after registration in two ways:<br /><br /><Strong>1.</strong> Pay via Paypal: Send $ to paypal@cfaea.org. Be sure to select "Send money to friends or family" and (VERY IMPORTANT) write "CABIN: [your cabin/room number]" in the comments.&nbsp; If you do not indicate CABIN somewhere in the comments we may not know you have paid!<br /><br /><strong>2.</strong> Pay via check: Make your payment to CFAEA by check and send it to the following address:<br /><br />CFAEA<br />c/o Michelle Maloy<br />1366 San Bruno Avenue<br />Apt 2<br />San Francisco, CA 94110<br /><br />* Please include the cabin/room number in the notes on the check.&nbsp; Then please email us at <a href="mailto:fnfreservations@gmail.com?subject=Incoming%20Check">fnfreservations@gmail.com</a> to let us know to watch for the check.</p>'
        },
        {
            category: 'faq',
            title: '<h3>How do I find my lodging when I arrive at Saratoga Springs?</h3>',
            body: '<p>We will have a map with the cabin assignments at the Gate when you arrive on site. Each cabin will also have a list of the names of the people who reserved each room posted in the cabin.&nbsp; Beds in the dorm-style rooms are first come, first serve.</p>
<p>If you are Early Arrival, please take the time to consult the <strong><a href="map">cabin map</a></strong> before you head up, in case you arrive at the Gate before the map does.</p>'
        },
        {
            category: 'faq',
            title: '<h3>I am coming early to the campout and/or staying late - can I use my cabin during this time?</h3>',
            body: '<p>Yes. You will have access to the cabin for the full time that you are at the campout.&nbsp; Reserving and paying for lodging guarantees your lodging is held for you from Early Arrival all the way through Late Departure.&nbsp; (Please note that you will need to arrange or pay for EA/LD separately; reserving lodging does not automatically get you EA/LD!)</p>'
        },
        {
            category: 'faq',
            title: '<h3>Can I leave my trash/recycling behind in the room?</h3>',
            body: '<p><strong>NO!</strong> You will be responsible for removing <strong>ALL</strong> trash from your cabin/room. The camp out is a pack in/pack out event and this applies to the cabins.&nbsp; Trash cans and recycle bins are provided as a convenience to help you collect your garbage so that you can take it home with you.</p>'
        },
        {
            category: 'faq',
            title: '<h3>I didn\'t receive a confirmation email. Am I pre-registered/registered/confirmed paid?</h3>',
            body: '<p>Check your SPAM folder and email us at fnfreservations@gmail.com for confirmation.</p>'
        },
        {
            category: 'faq',
            title: '<h3>If I am staying in a cabin/dorm room, do I need to bring linens?</h3>',
            body: '<p>No!&nbsp; And please don\'t bring your own blankets or pillows, unless you have a medical need.</p>
<p>Saratoga Springs has a new policy to prevent bedbugs - they provide all your linens, and they ask that you respect their efforts to stop this pest from arriving at SS by not bringing bedding.</p>'
        },
        {
            category: 'rule',
            title: '<h3>Room Rules: Guest Issues</h3>',
            body: "<p>While we strive to keep our community a safe place, issues do occur.</p>
<p>Belongings: FnF and Saratoga Springs are not responsible for protecting your belongings. Please keep private, important, or valuable personal belongings on your person or safely stowed away.</p>
<p>Guest conduct: All attendees must follow the <strong><a href='https://cfaea.net/the-fnf-way/'>FnF Way</a></strong> and the <strong><a href='https://fnforg.files.wordpress.com/#{year}/06/cfaea-and-fnf-conduct-policy-v-2-0-final.pdf'> Code of Conduct</a></strong>. If you have trouble with a guest in your room or cabin, and you cannot work it out among yourselves, please consider contacting Karma Patrol or a Site Coordinator at the event.</p>
<p>If you have any other guest-related issues, please contact a Site Coordinator at the campout as soon as possible. You may also contact <a href='mailto:fnfreservations@gmail.com?subject=Guest%2Issue&quot;&gt;fnfreservations@gmail.com'>the Cabin Crew</a> by email after the event.</p>"
        },
        {
            category: 'rule',
            title: '<h3>Room Rules: Room Issues</h3>',
            body: '<p>Should you have any problems with your room, please contact the Saratoga Springs staff.</p>'
        },
        {
            category: 'rule',
            title: '<h3>Room Rules: Empty Rooms</h3>',
            body: '<p>Reserving and paying for lodging guarantees your lodging is held for you from Early Arrival all the way through Late Departure.&nbsp; (Please note that you will need to arrange or pay for EA/LD separately; reserving lodging does not automatically get you EA/LD!)</p>
<p>The flipside of this is: if a person who reserved lodging leaves before you do, you may NOT move into their lodging.&nbsp;</p>
<p>Why not?&nbsp; First, it\'s a big public health problem and Saratoga Springs has asked us not to.&nbsp; Saratoga Springs does not provide bedding turnover or clean the cabins during the weekend, so you\'re sleeping on dirty sheets.&nbsp; If you were previously camping outside, moving into a room means you are bringing in some of the outdoors with you: dirt, dust, and bugs that will be far harder to get rid of for the next guests.&nbsp; Even if the person who reserved the room invites you to move in, please don\'t do it!</p>
<p>Second, it hurts FnF financially if people try to stay in empty rooms for free.&nbsp; It decreases demand for the rooms and means we have to raise ticket prices for everyone.&nbsp; It also hurts the people who reserved the room if you don\'t treat the room with the same care that they did.&nbsp; Please honor the system.</p>'
        },
        {
            category: 'faq',
            title: '<h3>I paid for a bed/room. Can I turn it over to my friend when I leave?</h3>',
            body: '<p>No.</p>
<p>Why not?&nbsp; First, it\'s a big public health problem and Saratoga Springs has asked us not to.&nbsp; Saratoga Springs does not provide bedding turnover or clean the cabins during the weekend, so you\'re sleeping on dirty sheets.&nbsp; If you were previously camping outside, moving into a room means you are bringing in some of the outdoors with you: dirt, dust, and bugs that will be far harder to get rid of for the next guests.&nbsp; Even if the person who reserved the room invites you to move in, please don\'t do it!<br /><br />Second, it hurts FnF financially if people try to stay in empty rooms for free.&nbsp; It decreases demand for the rooms and means we have to raise ticket prices for everyone.&nbsp; It also hurts the people who reserved the room if you don\'t treat the room with the same care that they did.&nbsp; Please honor the system.</p>'
        },
        {
            category: 'faq',
            title: '<h3>What sort of detail or proof do you need of my medical need?</h3>',
            body: '<p>We respect your privacy and ask that you provide only what is needed to determine your tier.</p>
<p>The medical tier is for those with a reasonable medical need for accommodation. This includes medical conditions, injuries, disabilities, and women in the third trimester of pregnancy.</p>
<p>
Examples of reasonable medical need:
<ul>
<li>chronic illness requires guaranteed fast access to restroom facilities in the night</li>
<li>recent surgery requires no stairs and minimal walking</li>
<li>disability requires access to private bathroom with running water for hygiene</li>
</ul>
</p>
<p><strong>Please let us know when you pre-register if your need requires specific amenities (electricity for a CPAP, AC for a heat-related condition) or a specific cabin/room/bed (cabin with a wheelchair ramp, room with windows).</strong></p>
<p>We may follow up with you for additional information within reason, which will be kept confidential. Access to this tier is decided on a case-by-case basis, at our discretion.</p>'
        },
        {
            category: 'faq',
            title: '<h3>How do I see who is in my room/cabin?</h3>',
            body: '<p>During booking:</p>
<p>Dorm rooms that are not yet full will show a list of who is already registered in the room when you book.&nbsp; For cabins with multiple rooms, follow the steps for "after booking".</p>
<p>After booking:
<ul>
<li>Log into the website</li>
<li>Go to the "<strong><a href="accommodations">book!</a></strong>" tab</li>
<li>Look for your room or cabin and see who else is in it!</li>
</ul></p>
<p>Note: if your room is not shown, look next to the "search" box, click on "filters", and make sure "available" is UNCHECKED.</p>'
        },
        {
            category: 'faq',
            title: '<h3>I need to keep my lodging private. How do I do this?</h3>',
            body: "<p>There is a feature to hide your name on the website.&nbsp; We refer everyone to the <a href='https://fnforg.files.wordpress.com/#{year}/06/cfaea-and-fnf-conduct-policy-v-2-0-final.pdf'>Code of Conduct</a>, and trust that only those with a special need will choose to use this feature.<br /><br />To hide your name, click on your name in the top right and select 'profile' from the dropdown.&nbsp; On your profile page, check the box labeled 'Please hide my name from my Friends &amp; Family'.<br /><br />Note that hiding your name on the website will not hide your name on the printouts that are posted in each cabin.</p>"
        },
        {
            category: 'faq',
            title: '<h3>Why isn\'t (Room or Cabin X) listed?</h3>',
            body: 'It\'s probably taken.&nbsp; You can check on the booking page:
<ol>
<li>Next to the "search" box, click on "filters"</li>
<li>Uncheck "available"</li>
</ol>
If the room is now shown, you should be able to see that someone has reserved it.'
        }
    ])
