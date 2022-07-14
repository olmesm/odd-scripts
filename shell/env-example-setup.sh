#!/usr/bin/env sh

echo "
####################
# \`.env.example\` is a list of required env vars for working in the project.
#
# Normally a variable is set to a value for use in the application.
# However in a \`.env.example\` you should either
#     - set a non-secret value (safe for publishing or publicly accessible)
#     - comment on how to obtain the required key
#
# For debugging variables, default to values that help the developer.
####################

ENVIRONMENT_VARIABLE=VALUE
" > .env.example