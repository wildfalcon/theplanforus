# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_masterplan_session',
  :secret      => '35515ba145fa6cb8fdd29c0a8827b11ce4494a6156f07a4b4852008921bdaeb4b411f25425a229c233628bb3bc7bfdad5350c8df62396365042e45f10eb4ea8c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
