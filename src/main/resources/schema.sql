DROP TABLE if exists AUTHORITIES;
DROP TABLE if exists user_roles;
DROP TABLE if exists user_orgs;
DROP TABLE if exists USERS;
drop table if exists oauth_client_details;
create table oauth_client_details (
    client_id VARCHAR(256) PRIMARY KEY,
    resource_ids VARCHAR(256),
    client_secret VARCHAR(256),
    scope VARCHAR(256),
    authorized_grant_types VARCHAR(256),
    web_server_redirect_uri VARCHAR(256),
    authorities VARCHAR(256),
    access_token_validity INTEGER,
    refresh_token_validity INTEGER,
    additional_information VARCHAR(4096),
    autoapprove VARCHAR(256)
);

INSERT INTO oauth_client_details
    (client_id, client_secret, scope, authorized_grant_types,
    web_server_redirect_uri, authorities, access_token_validity,
    refresh_token_validity, additional_information, autoapprove)
VALUES
    ('eagleeye', 'thisissecret', 'webclient,mobileclient',
    'refresh_token,password,client_credentials', null, null, 36000, 36000, null, true);


CREATE  TABLE USERS (
  USERNAME VARCHAR(100) NOT NULL ,
  PASSWORD VARCHAR(100) NOT NULL ,
  ENABLED boolean NOT NULL ,
  PRIMARY KEY (USERNAME));

CREATE TABLE AUTHORITIES (
USERNAME VARCHAR(50) NOT NULL,
AUTHORITY VARCHAR(50) NOT NULL,
FOREIGN KEY (USERNAME) REFERENCES USERS
);


CREATE TABLE user_orgs (
  organization_id   VARCHAR(100)  NOT NULL,
  user_name         VARCHAR(100)   NOT NULL,
  PRIMARY KEY (user_name));


--INSERT INTO USERS(USERNAME ,password,enabled) VALUES ('john.carnell','password1', true);
--INSERT INTO USERS(USERNAME ,password,enabled) VALUES ('william.woodward','password2', true);

INSERT INTO USERS(USERNAME ,password,enabled) VALUES ('john.carnell','$2a$10$D.MqRrSRnA3qSaZy6aSMVekENfCdO7zhzr6XzZGmY5dnbxyl/0A3q', true);
INSERT INTO USERS(USERNAME ,password,enabled) VALUES ('william.woodward','$2a$10$wONCCP43ci53zeUhWJHlGe0P9XaKuixAnFipy4KFG.LKF90NtxvXi', true);
INSERT INTO AUTHORITIES (USERNAME, AUTHORITY) VALUES ('john.carnell', 'ROLE_USER');
INSERT INTO AUTHORITIES (USERNAME, AUTHORITY) VALUES ('william.woodward', 'ROLE_ADMIN');
INSERT INTO AUTHORITIES (USERNAME, AUTHORITY) VALUES ('william.woodward', 'ROLE_USER');

--INSERT INTO user_roles (user_name, role) VALUES ('john.carnell', 'ROLE_USER');
--INSERT INTO user_roles (user_name, role) VALUES ('william.woodward', 'ROLE_ADMIN');
--INSERT INTO user_roles (user_name, role) VALUES ('william.woodward', 'ROLE_USER');

INSERT INTO user_orgs (organization_id, user_name) VALUES ('d1859f1f-4bd7-4593-8654-ea6d9a6a626e', 'john.carnell');
INSERT INTO user_orgs (organization_id, user_name) VALUES ('42d3d4f5-9f33-42f4-8aca-b7519d6af1bb', 'william.woodward');
