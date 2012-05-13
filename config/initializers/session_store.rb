# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_website-generator_session',
  :secret      => '2ceb457825e33a80c1b33f5e90527ba777ce701c7981ef62c54f51adb8640ac9b442c35f359965f073931fdd62a676afc96b5d8a3e40c4dce37a96e7a302ac86'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
