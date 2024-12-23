echo "creating folders"
cd /home/cloudy
mkdir nextcloud_data
mkdir nextcloud_logs
mkdir nextcloud_ssl
mkdir nextcloud_html
mkdir nextcloud_infra
cp decentralize-your-internet/infra/nextcloud/* nextcloud_infra
cd nextcloud_infra
cp .env.example .env
nano .env