
# Step 4 - Setup Nextcloud 

## Run Docker containers
- copy the git repository to your target machine
```bash
git clone git@github.com:hackerbande-nbg/decentralize-your-internet.git
```
- do some prep work, go to the nextcloud folder, make a copy of the env file and edit it
```bash
cd /home/cloudy
mkdir nextcloud_data
mkdir nextcloud_logs
mkdir nextcloud_ssl
mkdir nextcloud_html
cd decentralize-your-internet/infra/nextcloud
cp .env.example .env
nano .env
```
- replace the password (POSTGRES_PW) with a password of your choice
  - ATTENTION it seems important to make it not too complicated, this cost me a whi
  le to figure out. I was lucky with a 25 character long password, containing lower, upper case and numbers. No special characters.
- replace the project name (PROJECT) with a name of your choice
- start the nextcloud containers:
  ```bash
  docker compose up -d
  ```
  - note down the container name of the 3 created containers, in this case: 38c3.fun_app_nginx_proxy_manager, 38c3.fun_db_postgres + 38c3.fun_app_nextcloud. 
  
    ```bash
      [+] Running 13/13
      ✔ Network 38c3.fun_nw_public                         Created                                                            0.2s
      ✔ Network nextcloud_default                          Created                                                            0.2s
      ✔ Network 38c3.fun_nw_private                        Created                                                            0.2s
      ✔ Volume "38c3.fun_nginx_proxy_manager_letsencrypt"  Created                                                            0.0s
      ✔ Volume "38c3.fun_nextcloud_core"                   Created                                                            0.0s
      ✔ Volume "38c3.fun_nextcloud_apps"                   Created                                                            0.0s
      ✔ Volume "38c3.fun_nextcloud_config"                 Created                                                            0.0s
      ✔ Volume "38c3.fun_nextcloud_themes"                 Created                                                            0.0s
      ✔ Volume "38c3.fun_db_postgres_data"                 Created                                                            0.0s
      ✔ Volume "38c3.fun_nginx_proxy_manager_data"         Created                                                            0.0s
      ✔ Container 38c3.fun_app_nginx_proxy_manager         Started                                                            3.6s
      ✔ Container 38c3.fun_db_postgres                     Started                                                            3.3s
      ✔ Container 38c3.fun_app_nextcloud                   Started                                                            4.9s
    ```
    You can also find the container names later with 
    ```bash
    docker ps
    ```

  ## Configure nextcloud
  - On your admin machine, open a browser and browse to http://<target machine IP>:8092
    - Nextcloud Setup Screen should show up ![Nextcloud Setup Screen](images/nextcloud_setup.png)
  - Choose an admin login and password of your choice
  - Expand "Storage and Database":
    - Storage Directory: Keep Default
    - Setup Database: Toggle "PostgreSQL"
    - Database Account: postgres
    - Database Password: Enter the one you chose in [Step 7](#step-7---run-nextcloud) as POSTGRES_PW
    - Database Name: postgres
    - Database Host: <postgres container name from [Step 7](#step-7---run-nextcloud)>:5433
  - Click on "Install"
    - Button should switch to "Installing" - patience!
  - On the next page click "Install recommended Apps" or make a choice 