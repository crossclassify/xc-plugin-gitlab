set -e

# Define file paths
sessions_file="/opt/gitlab/embedded/service/gitlab-rails/app/views/devise/sessions/new.html.haml"
registrations_file="/opt/gitlab/embedded/service/gitlab-rails/app/views/devise/registrations/new.html.haml"

# Check if files exist before attempting to modify them
if [ -f "$sessions_file" ]; then
    # Remove added lines from devise/sessions/new.html.haml
    sed -i "/^\/ Import SDK.js/,/#root/d" "$sessions_file"
fi

if [ -f "$registrations_file" ]; then
    # Remove added lines from devise/registrations/new.html.haml
    sed -i "/^\/ Import SDK.js/,/#root/d" "$registrations_file"
fi

# Restart GitLab
gitlab-ctl restart
