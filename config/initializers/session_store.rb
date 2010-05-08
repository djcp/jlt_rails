# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_jlt_session',
  :secret      => '597f6c86061a870c999f1a77d4afc1b74c73e17fbc2d03be8967fa627d39e41a763919b4335a518bd34eb39a360851b28871d016048945b517d2e9a50ac721ac'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
