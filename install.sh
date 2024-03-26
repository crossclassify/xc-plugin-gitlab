set -e

read -p "Enter SiteId: " site_id
read -p "Enter API Key: " api_key



# Save the API key to a file or use it in other configurations
echo "apiKey=$api_key" >> /etc/cross-classify-gitlab-plugin/config.txt
echo "secretKey=$secret_key" >> /etc/cross-classify-gitlab-plugin/config.txt


# ======================== Load plugin =========================
cd /opt/gitlab/embedded/service/gitlab-rails/public/assets
wget https://ryan-gitlab-plugin.s3.ap-southeast-2.amazonaws.com/sdk.js
wget https://ryan-gitlab-plugin.s3.ap-southeast-2.amazonaws.com/classify-script.js

file_path="/opt/gitlab/embedded/service/gitlab-rails/public/assets/classify-script.js"

# Replace the existing API key and secret key in the file
sed -i "s/^const siteId= \".*\"/const siteId= \"$site_id\"/" "$file_path"
sed -i "s/^const apiKey= \".*\"/const apiKey= \"$api_key\"/" "$file_path"


cd /opt/gitlab/embedded/service/gitlab-rails/app/views/devise/sessions

echo "/ Import SDK.js" >> new.html.haml
echo ":javascript" >> new.html.haml
echo "  var sdk = document.createElement('script');" >> new.html.haml
echo "  sdk.src = '/assets/sdk.js';" >> new.html.haml
echo "  document.head.appendChild(sdk);" >> new.html.haml
echo "  var script = document.createElement('script');" >> new.html.haml
echo "  script.src = '/assets/classify-script.js';" >> new.html.haml
echo "  document.head.appendChild(script);" >> new.html.haml
echo "" >> new.html.haml
echo "#root" >> new.html.haml

cd /opt/gitlab/embedded/service/gitlab-rails/app/views/devise/registrations

echo "/ Import SDK.js" >> new.html.haml
echo ":javascript" >> new.html.haml
echo "  var sdk = document.createElement('script');" >> new.html.haml
echo "  sdk.src = '/assets/sdk.js';" >> new.html.haml
echo "  document.head.appendChild(sdk);" >> new.html.haml
echo "  var script = document.createElement('script');" >> new.html.haml
echo "  script.src = '/assets/classify-script.js';" >> new.html.haml
echo "  document.head.appendChild(script);" >> new.html.haml
echo "" >> new.html.haml
echo "#root" >> new.html.haml

gitlab-ctl restart

echo -e "\e[1;34m  ___                                _                   _   __"
echo -e " / __\\ _ __   ___   ___  ___    ___ | |  __ _  ___  ___ (_) / _| _   _"
echo -e "/ /   | '__| / _ \\ / __|/ __|  / __|| | / _\` |/ __|/ __|| || |_ | | | |"
echo -e "\\ \\___| |   | (_) |\\__ \\\\__ \\  (__ | || (_| |\\__ \\\\__ \\| ||  _|| |_| |"
echo -e " \\____|_|    \\___/ |___/|___/  \\___||_| \\__,_||___/|___/|_||_|   \\__, |"
echo -e "                                                                  |___/\e[0m"



