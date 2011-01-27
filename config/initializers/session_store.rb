# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_new_med_tourism_session',
  :secret      => '5a16617d5997292bfd70c6858ab585b82716da1966347cb802e3ac2f462566f6543008e64a1e1dd39d55725be81a0227b1efcb3d87791de26c9ee99d523b9dcf'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
