echo "creating folders"
HOME_DIR="/home/cloudy"
KEY_NAME="jenkins_deploy_key"

cd ""$HOME_DIR""
mkdir nextcloud_data
mkdir nextcloud_logs
mkdir nextcloud_ssl
mkdir nextcloud_html
mkdir nextcloud_infra
mkdir nextcloud_keys
echo "copying infra files"
cp decentralize-your-internet/infra/nextcloud/compose.yml nextcloud_infra/
cp decentralize-your-internet/infra/nextcloud/.env.example nextcloud_infra/.env
chmod +r $HOME_DIR/nextcloud_infra/compose.yml
chmod +r $HOME_DIR/nextcloud_infra/.env

sudo chmod 711 /home/cloudy # give jenkins read access to the home repo
sudo chmod 777 /home/cloudy/nextcloud_infra

cd nextcloud_infra
echo ""
echo -e "\e[94m!!! check the .env and adjust db secret in all cases and project names if necessary !!!\e[0m"
echo ""