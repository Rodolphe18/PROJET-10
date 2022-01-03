
CREATE TABLE categorie (
                id_categorie VARCHAR NOT NULL,
                nom_categorie VARCHAR(50) NOT NULL,
                CONSTRAINT categorie_pk PRIMARY KEY (id_categorie)
);


CREATE TABLE produit (
                id_produit VARCHAR NOT NULL,
                id_categorie VARCHAR NOT NULL,
                reference_article VARCHAR NOT NULL,
                libelle VARCHAR(100) NOT NULL,
                ingredients VARCHAR(200),
                recette VARCHAR(300),
                taille VARCHAR(50),
                prix_unitaire_HT NUMERIC(5) NOT NULL,
                TVA NUMERIC(4) NOT NULL,
                CONSTRAINT produit_pk PRIMARY KEY (id_produit)
);


CREATE TABLE adresse (
                id_adresse VARCHAR NOT NULL,
                voie VARCHAR(50) NOT NULL,
                complement VARCHAR(50) NOT NULL,
                code_postale NUMERIC(5) NOT NULL,
                commune VARCHAR(25) NOT NULL,
                CONSTRAINT adresse_pk PRIMARY KEY (id_adresse)
);


CREATE TABLE point_de_vente (
                id_point_de_vente VARCHAR NOT NULL,
                id_adresse VARCHAR NOT NULL,
                CONSTRAINT point_de_vente_pk PRIMARY KEY (id_point_de_vente)
);


CREATE TABLE stock (
                id_stock VARCHAR(15) NOT NULL,
                date_de_peremtion TIMESTAMP NOT NULL,
                quantite_restante NUMERIC NOT NULL,
                date_achat TIMESTAMP NOT NULL,
                id_produit VARCHAR NOT NULL,
                id_point_de_vente VARCHAR NOT NULL,
                CONSTRAINT stock_pk PRIMARY KEY (id_stock)
);


CREATE TABLE role (
                id_role VARCHAR NOT NULL,
                role VARCHAR(15) NOT NULL,
                description VARCHAR(100) NOT NULL,
                CONSTRAINT role_pk PRIMARY KEY (id_role)
);


CREATE TABLE utilisateur (
                id_utilisateur VARCHAR NOT NULL,
                login VARCHAR(150) NOT NULL,
                nom VARCHAR(50) NOT NULL,
                prenom VARCHAR(50) NOT NULL,
                password VARCHAR(150) NOT NULL,
                telephone VARCHAR(10) NOT NULL,
                email VARCHAR(50) NOT NULL,
                CONSTRAINT utilisateur_pk PRIMARY KEY (id_utilisateur)
);


CREATE TABLE employe (
                id_utilisateur VARCHAR NOT NULL,
                numero_employe VARCHAR NOT NULL,
                id_role VARCHAR NOT NULL,
                CONSTRAINT employe_pk PRIMARY KEY (id_utilisateur)
);


CREATE TABLE client (
                id_utilisateur VARCHAR NOT NULL,
                id_adresse VARCHAR NOT NULL,
                numero_client VARCHAR NOT NULL,
                CONSTRAINT client_pk PRIMARY KEY (id_utilisateur)
);


CREATE TABLE info_bancaire (
                id_info_bancaire VARCHAR NOT NULL,
                id_client VARCHAR(200) NOT NULL,
                nom_carte VARCHAR(50) NOT NULL,
                numero_carte NUMERIC(16) NOT NULL,
                date_validite NUMERIC(4) NOT NULL,
                pictogramme NUMERIC(3) NOT NULL,
                id_utilisateur VARCHAR NOT NULL,
                CONSTRAINT info_bancaire_pk PRIMARY KEY (id_info_bancaire)
);


CREATE TABLE commande (
                id_commande VARCHAR NOT NULL,
                id_client VARCHAR(200) NOT NULL,
                id_info_bancaire VARCHAR NOT NULL,
                id_point_de_vente VARCHAR NOT NULL,
                numero_commande VARCHAR NOT NULL,
                date_commande TIMESTAMP NOT NULL,
                status VARCHAR(40) NOT NULL,
                id_utilisateur VARCHAR NOT NULL,
                CONSTRAINT commande_pk PRIMARY KEY (id_commande)
);


CREATE TABLE ligne_commande (
                id_ligne_commande VARCHAR NOT NULL,
                id_commande VARCHAR NOT NULL,
                id_produit VARCHAR NOT NULL,
                quantite NUMERIC(4) NOT NULL,
                prix_unitaire_HT NUMERIC(5) NOT NULL,
                TVA NUMERIC(4) NOT NULL,
                CONSTRAINT ligne_commande_pk PRIMARY KEY (id_ligne_commande)
);


CREATE TABLE facture (
                id_facture VARCHAR(200) NOT NULL,
                id_commande VARCHAR NOT NULL,
                numero VARCHAR(10) NOT NULL,
                date TIMESTAMP NOT NULL,
                montant_HT NUMERIC NOT NULL,
                TVA NUMERIC NOT NULL,
                CONSTRAINT facture_pk PRIMARY KEY (id_facture)
);


ALTER TABLE produit ADD CONSTRAINT categorie_produit_fk
FOREIGN KEY (id_categorie)
REFERENCES categorie (id_categorie)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ligne_commande ADD CONSTRAINT produit_ligne_commande_fk
FOREIGN KEY (id_ligne_commande)
REFERENCES produit (id_produit)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE stock ADD CONSTRAINT produit_stock_fk
FOREIGN KEY (id_produit)
REFERENCES produit (id_produit)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE client ADD CONSTRAINT adresse_client_fk
FOREIGN KEY (id_adresse)
REFERENCES adresse (id_adresse)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE point_de_vente ADD CONSTRAINT adresse_point_de_vente_fk
FOREIGN KEY (id_adresse)
REFERENCES adresse (id_adresse)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE commande ADD CONSTRAINT point_de_vente_commande_fk
FOREIGN KEY (id_point_de_vente)
REFERENCES point_de_vente (id_point_de_vente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE stock ADD CONSTRAINT point_de_vente_stock_fk
FOREIGN KEY (id_point_de_vente)
REFERENCES point_de_vente (id_point_de_vente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE employe ADD CONSTRAINT role_employe_fk
FOREIGN KEY (id_role)
REFERENCES role (id_role)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE client ADD CONSTRAINT utilisateur_client_fk
FOREIGN KEY (id_utilisateur)
REFERENCES utilisateur (id_utilisateur)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE employe ADD CONSTRAINT utilisateur_employe_fk
FOREIGN KEY (id_utilisateur)
REFERENCES utilisateur (id_utilisateur)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE commande ADD CONSTRAINT employe_commande_fk
FOREIGN KEY (id_utilisateur)
REFERENCES employe (id_utilisateur)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE info_bancaire ADD CONSTRAINT client_info_bancaire_fk
FOREIGN KEY (id_utilisateur)
REFERENCES client (id_utilisateur)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE commande ADD CONSTRAINT client_commande_fk
FOREIGN KEY (id_utilisateur)
REFERENCES client (id_utilisateur)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE commande ADD CONSTRAINT info_bancaire_commande_fk
FOREIGN KEY (id_info_bancaire)
REFERENCES info_bancaire (id_info_bancaire)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE facture ADD CONSTRAINT commande_facture_fk
FOREIGN KEY (id_commande)
REFERENCES commande (id_commande)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ligne_commande ADD CONSTRAINT commande_ligne_commande_fk
FOREIGN KEY (id_ligne_commande)
REFERENCES commande (id_commande)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
