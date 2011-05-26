# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_example_app_session',
  :secret      => 'e74beebb1e3c8ad8a09edfbe83cf2f5bb8706c62e4fa63e1d9a1271a280261466a2ecf514fd27d6be5cce90cd6b3d24d9b5868bcd710b898af2f29b22a9d291e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
