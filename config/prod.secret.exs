use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :user_api, UserApiWeb.Endpoint,
  secret_key_base: "eRzhnd6x8krgkF/yjW2x4Jk0RTKsZFrhlKG16Wzve6Tc/gsuSYIYjjturYS3eDTV"

# Configure your database
config :user_api, UserApi.Repo,
  username: "postgres",
  password: "postgres",
  database: "user_api_prod",
  pool_size: 15
