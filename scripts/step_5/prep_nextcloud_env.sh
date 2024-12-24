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

echo "create deploy key"
ssh-keygen -t rsa -b 4096 -f "$HOME_DIR/$KEY_NAME" -N "" -q
echo "Private key: $HOME_DIR/$KEY_NAME"
echo "Public key: $HOME_DIR/$KEY_NAME.pub"

cd nextcloud_infra
echo "!!! check the .env and adjust secrets and project names if necessary !!!"