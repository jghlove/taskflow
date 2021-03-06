use test;

drop table if exists user_info;
CREATE TABLE user_info (
    id   INT NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(255) NOT NULL,
    user_password_hash VARCHAR(255) NOT NULL,
    user_email VARCHAR(255) NOT NULL,
    register_time datetime NOT NULL,
    PRIMARY KEY (id)
);

drop table if exists project_info;
CREATE TABLE project_info (
    id   INT NOT NULL AUTO_INCREMENT,
    project_name VARCHAR(255) NOT NULL,
    create_user_id INT NOT NULL,
    create_time  datetime NOT NULL,
    project_desc  VARCHAR(255) NOT NULL,
    permission_users VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

drop table if exists dag_info;
CREATE TABLE dag_info  (
    id   INT NOT NULL AUTO_INCREMENT,
    dag_id  INT NOT NULL,
    dag_name VARCHAR(255) NOT NULL,
    valid INT NOT NULL default 0,
    project_name VARCHAR(255) NOT NULL, 
    create_user_id INT NOT NULL,
    create_time datetime NOT NULL,
    scheduler_interval  INT NOT NULL,  
    skip_failed  INT NOT NULL default 0, 
    modify_time datetime NOT NULL,
    dag_status VARCHAR(255) NOT NULL,  
    next_start_time datetime NOT NULL, 
    dag_json VARCHAR(2048) NOT NULL,
    PRIMARY KEY (id)
);

drop table if exists task_info;
CREATE TABLE task_info (
    id   INT NOT NULL AUTO_INCREMENT,
    dag_id INT NOT NULL,
    task_id INT NOT NULL,
    task_name VARCHAR(255) NOT NULL,
    run_machine VARCHAR(255) NOT NULL,  
    run_user VARCHAR(255) NOT NULL,
    run_dir VARCHAR(255) NOT NULL,
    run_command  VARCHAR(2048) NOT NULL, 
    run_timeout  INT NOT NULL,   
    retry_times INT NOT NULL default 1,
    task_status VARCHAR(255) NOT NULL,  
    modify_time datetime NOT NULL,
    PRIMARY KEY (id)
);

drop table if exists machine_info;
CREATE TABLE machine_info (
    id   INT NOT NULL AUTO_INCREMENT,
    machine_name VARCHAR(255),
    machine_ip VARCHAR(255),
    PRIMARY KEY (id)
);

drop table if exists dag_run_history;
CREATE TABLE dag_run_history (
    id   INT NOT NULL AUTO_INCREMENT,
    dag_id  INT NOT NULL,         
    start_time datetime NOT NULL,
    end_time datetime NOT NULL,
    status  VARCHAR(255) NOT NULL,   
    PRIMARY KEY (id)
);

drop table if exists task_run_history;
CREATE TABLE task_run_history (
    id   INT NOT NULL AUTO_INCREMENT,
    task_id  INT NOT NULL,         
    start_time datetime NOT NULL,
    end_time datetime NOT NULL,
    status VARCHAR(255) NOT NULL,   
    stdout VARCHAR(255) NOT NULL,
    stderr VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

drop table if exists task_pending_queue;
CREATE TABLE task_pending_queue (
    id   INT NOT NULL AUTO_INCREMENT,
    task_id INT NOT NULL, 
    machine_ip  VARCHAR(255)  NOT NULL,
    PRIMARY KEY (id)
);
