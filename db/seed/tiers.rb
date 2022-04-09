@tier0 = Tier.create(
  label: 'Tier 0', description: 'Pre-Booked', available: DateTime.new(@year, 6, 6, 19, 30, 0, '-07:00',),
  subject: "#{@year} FnF Cabins & Lodging Room Assignment",
  email_html: "<p style='background-color: transparent; color: #000000; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 18.2px; min-height: 0px; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;'>Based on your response/role, you have been, or soon will be, <strong>pre-booked</strong> to a specific room. Please check your inbox for an email with the subject line 'FnF #{@year} Cabins Booking Confirmation' (arriving sometime today if it hasn't already).&nbsp; This email will tell you the room we have assigned you to.</p>
<p style='background-color: transparent; color: #000000; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 18.2px; min-height: 0px; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;'><strong>Important!&nbsp;</strong> If you do not agree with the room you have been assigned, please email us at cabins@fnf.org <span style='text-decoration: underline;'>ASAP</span> - we will be opening registration to the general Medical tier on Tuesday night!!</p>
<p style='background-color: transparent; color: #000000; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 18.2px; min-height: 0px; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;'>If you are happy with your room assignment, please pay us.&nbsp; You can see the cost for your room, and get to a handy PayPal button, like this:</p>
<p>1. Sign in on the Cabin Site at&nbsp;<a href='http://#{Cabins::Application.config.host}'>http://#{Cabins::Application.config.host}</a></p>
<p>2. Look in the top right for your name; click on it.&nbsp; From the dropdown choose 'profile'.</p>
<p>3. On that page, you will see the room you have been assigned and the cost.</p>
<p>4. There is a PayPal link. If you need to pay by a method other than PayPal, please see the FAQ.</p>
<p style='background-color: transparent; color: #000000; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; line-height: 18.2px; min-height: 0px; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;'>Please add cabins@fnf.org to your approved senders list to avoid emails going into the SPAM folder.<br style='background-color: transparent; color: #000000; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 14px; line-height: 18.2px; min-height: 0px;' /><br style='background-color: transparent; color: #000000; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 14px; line-height: 18.2px; min-height: 0px;' />Thanks!<br style='background-color: transparent; color: #000000; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 14px; line-height: 18.2px; min-height: 0px;' /><br style='background-color: transparent; color: #000000; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 14px; line-height: 18.2px; min-height: 0px;' />FnF #{@year} Cabins<br style='background-color: transparent; color: #000000; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 14px; line-height: 18.2px; min-height: 0px;' /><a style='background-color: transparent; color: #0066cc; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 14px; line-height: 18.2px; min-height: 0px;' href='http://#{Cabins::Application.config.host}'>http://#{Cabins::Application.config.host}</a></p>",
  email_text: "Based on your response/role, you have been, or soon will be, pre-booked to a specific room. Please check your inbox for an email with the subject line 'FnF #{@year} Cabins Booking Confirmation' (arriving sometime today if it hasn't already).  This email will tell you the room we have assigned you to.

Important!  If you do not agree with the room you have been assigned, please email us at cabins@fnf.org ASAP - we will be opening registration to the general Medical tier on Tuesday night!!

If you are happy with your room assignment, please pay us.  You can see the cost for your room, and get to a handy PayPal button, like this:
1. Sign in on the Cabin Site at http://#{Cabins::Application.config.host}
2. Look in the top right for your name; click on it.  From the dropdown choose 'profile'.
3. On that page, you will see the room you have been assigned and the cost.
4. There is a PayPal link. If you need to pay by a method other than PayPal, please see the FAQ.

Please add cabins@fnf.org to your approved senders list to avoid emails going into the SPAM folder.

Thanks!

FnF #{@year} Cabins
http://#{Cabins::Application.config.host}"
)
@tier1 = Tier.create(
  label: 'Tier 1', description: 'Planners Medical', available: DateTime.new(@year, 5, 28, 19, 30, 0, '-07:00'),
  subject: "#{@year} FnF Cabins & Lodging Tier Assignment",
  email_html: "<p>Based on your response/role, you have been assigned the 'Medical' tier. You will be allowed to log in on <strong>Tuesday, 10 Jul #{@year} at 7:30 PM PDT</strong> to request your lodging for the campout. &nbsp;</p>
<p>A brief note:&nbsp; after we completed pre-assignments for people who needed specific amenities or a specific cabin, there are still <strong>more</strong> private rooms available than there are people who will be registering in the Medical tier.&nbsp; This means that everyone in the Medical tier who wants a cabin (vs a dorm bed) can have one!&nbsp; It just might not be your first choice cabin.&nbsp; We encourage you to visit the site before your tier opens and <a href='http://#{Cabins::Application.config.host}/accommodations'>identify your first few choices for rooms</a>. (You will need to log in to view the list of rooms available to book.)</p>
<p><br />If you have any questions or you feel you have not been assigned the correct tier, please contact us at cabins@fnf.org.<br /><br />Please add cabins@fnf.org to your approved senders list to avoid emails going into the SPAM folder.<br /><br />Thanks!<br /><br />FnF #{@year} Cabins<br /><a href='http://#{Cabins::Application.config.host}'>http://#{Cabins::Application.config.host}</a></p>",
  email_text: "Based on your response/role, you have been assigned the 'Medical' tier. You will be allowed to log in on Tuesday, 10 Jul #{@year} at 7:30 PM PDT to request your lodging for the campout.

A brief note:  after we completed pre-assignments for people who needed specific amenities or a specific cabin, there are still *more* private rooms available than there are people who will be registering in the Medical tier.  This means that everyone in the Medical tier who wants a cabin (vs a dorm bed) can have one!  It just might not be your first choice cabin.  We encourage you to visit the site before your tier opens and identify your first few choices for rooms: https://#{Cabins::Application.config.host}/accommodations (You will need to log in to view the list of rooms available to book.)

If you have any questions or you feel you have not been assigned the correct tier, please contact us at cabins@fnf.org.

Please add cabins@fnf.org to your approved senders list to avoid emails going into the SPAM folder.

Thanks!

FnF #{@year} Cabins
http://#{Cabins::Application.config.host}"
)
@tier2 = Tier.create(
  label: 'Tier 2', description: 'Planners', available: DateTime.new(@year, 5, 29, 19, 30, 0, '-07:00'),
  subject: "#{@year} FnF Cabins & Lodging Tier Assignment",
  email_html: "<p>Based on your response/role, you have been assigned the 'Planners' tier. You will be allowed to log in on <strong>Wednesday, 11 Jul #{@year} at 7:30 PM PDT</strong> to request your lodging for the campout. &nbsp;<br /><br />If you have any questions or you feel you have not been assigned the correct tier, please contact us at cabins@fnf.org.<br /><br />Please add cabins@fnf.org to your approved senders list to avoid emails going into the SPAM folder.<br /><br />Thanks!<br /><br />FnF #{@year} Cabins<br /><a href='http://#{Cabins::Application.config.host}'>http://#{Cabins::Application.config.host}</a></p>",
  email_text: "Based on your response/role, you have been assigned the 'Planners' tier. You will be allowed to log in on Wednesday, 11 Jul #{@year} at 7:30 PM PDT to request your lodging for the campout.

If you have any questions or you feel you have not been assigned the correct tier, please contact us at cabins@fnf.org.

Please add cabins@fnf.org to your approved senders list to avoid emails going into the SPAM folder.

Thanks!

FnF #{@year} Cabins
http://#{Cabins::Application.config.host}"
);

@tier3 = Tier.create(
  label: 'Tier 3', description: 'All', available: DateTime.new(@year, 5, 30, 19, 30, 0, '-07:00'),
  subject: "#{@year} FnF Cabins & Lodging Tier Assignment",
  email_html: "<p>Based on your response/role, you have been assigned the 'Volunteers' tier. You will be allowed to log in on <strong>Thursday, 12 Jul #{@year} at 7:30 PM PDT</strong> to request your lodging for the campout. &nbsp;<br /><br />If you have any questions or you feel you have not been assigned the correct tier, please contact us at cabins@fnf.org.<br /><br />Please add cabins@fnf.org to your approved senders list to avoid emails going into the SPAM folder.<br /><br />Thanks!<br /><br />FnF #{@year} Cabins<br /><a href='http://#{Cabins::Application.config.host}'>http://#{Cabins::Application.config.host}</a></p>",
  email_text: "Based on your response/role, you have been assigned the 'Volunteers' tier. You will be allowed to log in on Thursday, 12 Jul #{@year} at 7:30 PM PDT to request your lodging for the campout.

If you have any questions or you feel you have not been assigned the correct tier, please contact us at cabins@fnf.org.

Please add cabins@fnf.org to your approved senders list to avoid emails going into the SPAM folder.

Thanks!

FnF #{@year} Cabins
http://#{Cabins::Application.config.host}"
)
