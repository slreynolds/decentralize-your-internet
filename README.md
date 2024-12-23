
```mermaid
flowchart TD
    0["0 MAIN Hardware Setup"] --> 1
    1["1 MAIN ubuntu"] --> 2
    2["2 MAIN Docker"] --> 3
    3["3 MAIN jenkins"] --> 4
    4["4 MAIN Nextcloud"]
    1 -.-> 1_1["1_1 (optional) Configure SSH"]
    3 -.-> 3_1["3_1 (optional) jenkins nodes"]
    3_1 -.-> 3_2["3_2 (optional) git pipelines"]
    
    style 0 fill:#1E9088,stroke:#000,stroke-width:3px
    style 1 fill:#1E9088,stroke:#000,stroke-width:3px
    style 2 fill:#1E9088,stroke:#000,stroke-width:3px
    style 3 fill:#1E9088,stroke:#000,stroke-width:3px
    style 4 fill:#1E9088,stroke:#000,stroke-width:3px
```


# Step 0 - Hardware and Preparations

- get the target machine: e.g. Dell Latitude E6230
- admin machine from where you work normally
- charger for said notebook
- a USB Stick (8GB or more)
- a mouse for setup (optional)

# Step 1 - Install ubuntu
## Step 1_1 - Configure SSH

# Step 2 - Install docker

# Step 3 - Install jenkins

# Step 3_1 - Register Jenkins Nodes

# Step 4 - Setup Nextcloud 
