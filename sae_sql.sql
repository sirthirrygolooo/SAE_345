DROP TABLE IF EXISTS declinaison, ligne_commande, commande, etat, ligne_panier, note, equipement, categorie_sport, couleur, morphologie, marque, taille, utilisateur;  
    

    
CREATE TABLE UTILISATEUR (
  id_utilisateur INT AUTO_INCREMENT,
  login varchar(255),
  email varchar(255),
  password varchar(255),
  role varchar(255),
  nom varchar(255),
  est_actif tinyint(1),
  PRIMARY KEY (id_utilisateur)
);  
    
    
     
INSERT INTO UTILISATEUR(id_utilisateur,login,email,password,role,nom,est_actif) VALUES
    (NULL,'admin','admin@admin.fr',
    'sha256$dPL3oH9ug1wjJqva$2b341da75a4257607c841eb0dbbacb76e780f4015f0499bb1a164de2a893fdbf',
    'ROLE_admin','admin','1'),
    (2,'client','client@client.fr',
    'sha256$1GAmexw1DkXqlTKK$31d359e9adeea1154f24491edaa55000ee248f290b49b7420ced542c1bf4cf7d',
    'ROLE_client','client','1'),
    (3,'client2','client2@client2.fr',
    'sha256$MjhdGuDELhI82lKY$2161be4a68a9f236a27781a7f981a531d11fdc50e4112d912a7754de2dfa0422',
    'ROLE_client','client2','1');
    
    

     
    CREATE TABLE categorie_sport(
    id_categorie_sport INT AUTO_INCREMENT,
    libelle_categorie_sport VARCHAR(255),
    PRIMARY KEY(id_categorie_sport)
    );
    
    
    
     
    INSERT INTO categorie_sport (libelle_categorie_sport) VALUES
        ('Sport de combat'),
        ('Sport collectif'),
        ('Sport de raquettes'),
        ('Sport d endurance'),
        ('Sport aquatique'),
        ('Cyclisme'),
        ('Renforcement Musculaire')
    ;
    
    
    


     
    CREATE TABLE couleur(
    id_couleur INT AUTO_INCREMENT,
    libelle_couleur VARCHAR(255),
    couleur_anglais VARCHAR(255),
    PRIMARY KEY(id_couleur)
);
     
    
     
    INSERT INTO couleur(libelle_couleur, couleur_anglais) VALUES
    ('Rouge', 'red'),
    ('Bleu', 'blue'),
    ('Vert', 'green'),
    ('Violet', 'violet'),
    ('Noir', 'black'),
    ('Blanc', 'white'),
    ('Rose', 'pink'),
    ('Jaune', 'yellow'),
    ('Gris', 'grey'),
    ('Marron', 'brown'),
    ('Orange', 'orange'),
    ('Kaki', 'khaki');
         
    

     
    CREATE TABLE morphologie(
    id_morphologie INT AUTO_INCREMENT,
    libelle_morphologie VARCHAR(255),
    PRIMARY KEY(id_morphologie)
);
     
    
     
    INSERT INTO morphologie (libelle_morphologie) VALUES
    ('Homme'),
    ('Femme'),
    ('Enfant'),
    ('Unisexe');
                 
    

     
    CREATE TABLE marque(
    id_marque INT AUTO_INCREMENT,
    libelle_marque VARCHAR(255),
    PRIMARY KEY(id_marque)
);
         
    
     
    INSERT INTO marque (libelle_marque) VALUES
    ('Venum'),
    ('Adidas'),
    ('Nike'),
    ('Kipsta'),
    ('Puma'),
    ('Asics'),
    ('Le coq sportif'),
    ('The North Face'),
    ('Metal'),
    ('Jordan'),
    ('Kempa'),
    ('Power Shot'),
    ('Nabaiji'),
    ('cressi_sub'),
    ('salomon'),
    ('Kemi'),
    ('Domyos'),
    ('Fit & Rack'),
    ('Decathlon'),
    ('canyon'),
    ('Bmc'),
    ('electra');
         
    


     
    CREATE TABLE taille(
    id_taille INT AUTO_INCREMENT,
    libelle_taille VARCHAR(255),
    PRIMARY KEY(id_taille)
);
         
    
    
    INSERT INTO taille (libelle_taille) VALUES
    ('XS'),
    ('S'),
    ('M'),
    ('L'),
    ('XL'),
    ('XXL'),
    ('XXXL'),
    ('Lot 2'),
    ('Lot 4'),
    ('Lot 6'),
    ('Lot 8'),
    ('Lot 10'),
    ('Lot 12'),
    ('Lot 14'),
    ('Lot 16'),
    ('36'),
    ('37'),
    ('38'),
    ('39'),
    ('40'),
    ('41'),
    ('42'),
    ('43'),
    ('44'),
    ('45'),
    ('46'),
    ('0, 5(L)'),
    ('1(L)'),
    ('2(L)'),
    ('10(m)'),
    ('55(kg)'),
    ('20(kg)');
          
    
     
    
    CREATE TABLE equipement(
    id_equipement INT AUTO_INCREMENT,
    libelle_equipement VARCHAR(10000),
    prix_equipement INT,
    description_equipement VARCHAR(1000),
    image_equipement VARCHAR(1000),
    marque_equipement_id INT,
    sport_equipement_id INT,
    morphologie_equipement_id INT,
    PRIMARY KEY(id_equipement),
    CONSTRAINT fk_equipement_marque FOREIGN KEY (marque_equipement_id) REFERENCES marque(id_marque),
    CONSTRAINT fk_equipement_sport FOREIGN KEY (sport_equipement_id) REFERENCES categorie_sport(id_categorie_sport),
    CONSTRAINT fk_equipement_morphologie FOREIGN KEY (morphologie_equipement_id) REFERENCES morphologie(id_morphologie)
);
          
    

    
    
    INSERT INTO equipement (libelle_equipement, prix_equipement, description_equipement, image_equipement, marque_equipement_id, sport_equipement_id, morphologie_equipement_id) VALUES
    ( 'Gants  de  MMA  Venum  Impact  2.0' , 80,  'Ces  gants  en  cuir  Skintex  sont  ergonomiques    confortables  et  de  haute  qualité.  La  mousse  triple  densite  permet  de  garder  votre  main  à  l  abris  des  chocs.  Forme  incurvée  permettant  au  gant  de  parfaitement  épouser  la  forme  de  votre  main.  Le  système  de  fermeture  fournit  un  meilleur  serrage  et  la  possibilité  de  fermer  avec  une  seule  main.' , 'gantsMMA.webp', 1, 1, 4),
    ( 'Gants  de  boxe  Venum  Elite' , 90,  'Gants  pour  Boxe  Anglaise    Kick  Boxing  et  Muay  Thai.  Doté  d  une  mousse  à  quadruple  densité    ces  gants  sont  designés  pour  absorber  au  mieux  les  impacts  lors  des  frappes.  Les  coutures  renforcées  et  les  panneaux  en  maille  combinés  à  leur  forme  ergonomique  vous  apporteront  un  ajustement  confortable  et  vous  aurez  l  impression  de  ne  faire  qu  un  avec  le  gant.' , 'gantsBoxe.webp', 1, 1, 4),
    ( 'Kimono  JJB  Venum  Elite  4.0' , 200,  'Ce  Kimono  est  fabriqué  en  coton  Pearl  Wave  450  g/m²  et  est  renforcé  sur  tous  les  points  de  tension  pour  une  plus  grande  durabilité.  Le  col  en  mousse  EVA  rigide  résistera  aux  prises  de  vos  adversaires  et  à  vos  ruptures  de  prise  les  plus  puissantes.  Confortable  et  robuste    il  est  conçu  pour  résister  à  l  usure  des  séances  d  entraînement  intenses.  Le  pantalon  est  fabriqué  en  tissu  Ripstop  285  g/m²  et  est  renforcé  aux  chevilles    aux  genoux  et  à  l  entrejambe.  Les  coutures  renforcées  aux  poignets  assurent  une  plus  grande  longévité' , 'kimonoJJB.webp', 1, 3, 1),
    ('Nunchaku', 40,  'Découvrez  l  élégance  et  la  puissance  du  Nunchaku    un  instrument  emblématique  dans  le  monde  des  arts  martiaux.  Notre  Nunchaku  est  fabriqué  avec  un  artisanat  exceptionnel    offrant  une  combinaison  parfaite  de  durabilité  et  de  performance.  Conçu  pour  les  pratiquants  de  tous  niveaux    cet  article  incarne  la  tradition  tout  en  intégrant  des  éléments  modernes  pour  une  expérience  optimale' , 'nunchaku.jpg', 19, 1, 4),
    ( 'Kimono  de  Judo' , 70,  'Explorez  l  excellence  du  judo  avec  notre  Kimono  de  haute  qualité.  Conçu  pour  répondre  aux  exigences  rigoureuses  des  pratiquants  de  judo    notre  Kimono  allie  confort    durabilité  et  performance  exceptionnelle.  Fabriqué  à  partir  de  matériaux  résistants    il  offre  une  coupe  précise  qui  permet  une  liberté  de  mouvement  maximale  tout  en  conservant  une  élégance  traditionnelle.  Que  vous  soyez  un  débutant  passionné  ou  un  judoka  expérimenté    notre  Kimono  est  un  choix  fiable  pour  vos  séances  d  entraînement  et  compétitions.' , 'kimonoJudo.jpg', 19, 1, 1),
    ( 'Jordan  Zion  3  Pink  Lotus  Enfants  GS' , 110,  'Chaussure  de  basket  Jordan  rose  pour  enfant' , 'chaussureBasket1.webp', 10, 2, 3),
    ( 'Résine  Kempa  200ml  [Taille  200  ml]' , 16,  'résine  en  pot  pour  plus  d  adhérence  en  match' , 'potResineHand1.jpg', 11, 2, 1),
    ( 'filet  de  volley  ball  d  entrainement' , 45,  'filet  de  10*1m  sera  parfait  pour  vos  entrainement' , 'filetVolley1.jpg', 12, 2, 1),
    ( 'pince  nez  flottant  de  natation  bleu  cyan' , 4,  'peur  de  perdre  votre  pince  nez celui  ci  flotte  ' , 'pinceNezNatation1.jpg', 13, 5, 4),
    ( 'Palmes  Cressi  Frog  Plus  Noir/silver' , 65,  'Palmage  fluide  effort  réduit  peu  fatiguant' , 'palmPlongée1.jpg', 14, 5, 4),
    ( 'Soft  flask  250mL  -  28mm' , 18,  'Gourde  accessible facilement  transportable' , 'gourdeCoursePied1.jpg', 15, 4, 4),
    ( 'flash  carbon' , 76,  'léger  transportable  en  fibre  de  carbone' , 'batonTrail1.jpg', 16, 4, 4),
    ( 'Kettlebell  de  musculation  en  fonte  et  base  caoutchouc' , 55,  'kettelbell  de  55kg  a  base  en  caoutchouc  pour  moins  de  dégat' , 'bouleMuscu.jpg', 17, 7, 4),
    ( 'Barre  Olympique  -  Entrainement  2.0  -  20kg' , 207,  'barre  de  crossfit  de  20kg  avec  un  bon  grip' , 'barreCrossfit1.jpg', 18, 7, 4),
    ( 'GYM  BALL  RÉSISTANT  TAILLE  2  /  65  cm  -  BLEU' , 20,  'gymball  avec  une  structure  résitante      peut  etre  utilisé  pour  toutes  exercices' , 'gymballPilat1.jpg', 17, 7, 4),
    ( 'Spectral  29  CF  8' , 4600,  'Du  rapide  et  fluide  au  rugueux  et  technique    le  Spectral  CF  8  est  prêt  à  affronter  tous  les  sentiers  que  vous  lui  indiquerez.' , 'veloEnduro1.webp', 20, 6, 4),
    ( 'Vélo  de  Route  BMC  Teammachine  SLR  Five  Shimano  105  Di2  12V  700  mm  Argent  Arctic  2023' , 3300,  'Vélo  de  course  parfait  pour  rouler  sur  route  et  la  vitesse' , 'veloCourse1.jpg', 21, 6, 4),
    ( 'Electra  Loft  7i  EQ  Step  Thru' , 440,  'La  technologie  Flat  Foot  d  Electra  signifie  un  confort  et  un  contrôle  brevetés  sur  un  vélo  Electra.' , 'veloVille.jpg', 22, 6, 4),
    ( 'X  Crazyfast  Elite  LL  FG' , 270,  'chaussure  de  foot  equipé  de  crampon  silouhette  aérodynamique' , 'chaussureFoot1.avif', 2, 2, 4),
    ( 'Protège-dents  Venum  Predator' , 22,  'Ce  protège-dents    est  le  parfait  mix  en  confort    souplesse  et  absorption  des  chocs    afin  de  prévenir  et  réduire  les  besssures  au  niveau  de  vos  dents    lèvres  et  gencives.  Cadre  extérieur  en  caoutchouc  asborbant  les  chocs    et  intérieur  en  gel  thermo-formable  afin  de  mouler  parfaitement  votre  dentition  et  permettre  une  meilleure  respiration', 'protegeDents.webp', 1, 1, 4);
     
    
    
    
    
CREATE TABLE note(
    id_note INT AUTO_INCREMENT,
    note INT,
    id_equipement INT,
    PRIMARY KEY(id_note),
    CONSTRAINT fk_note_equipement FOREIGN KEY(id_equipement) REFERENCES EQUIPEMENT(id_equipement));
    
    
    
    
    INSERT INTO note (note, id_equipement) VALUES 
    (4, 1),
    (2, 1),
    (5, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (4, 2),
    (2, 2),
    (5, 2),
    (3, 2),
    (4, 3),
    (5, 3),
    (4, 3),
    (4, 3),
    (1, 4),
    (2, 4),
    (3, 4),
    (1, 4),
    (4, 5),
    (5, 5),
    (2, 5),
    (1, 5),
    (4, 6),
    (5, 6),
    (2, 6),
    (1, 6);
    
    
    

    
    CREATE TABLE etat(
    id_etat INT AUTO_INCREMENT,
    libelle_etat VARCHAR(255),
    PRIMARY KEY(id_etat)
);
            
    

    
    INSERT INTO etat (libelle_etat) VALUES
    ('En cours de traitement'),
    ('Expédié'),
    ('Validé');
    
    

    
    CREATE TABLE commande(
    id_commande INT AUTO_INCREMENT,
    date_achat DATE,
    etat_id INT NOT NULL,
    id_utilisateur INT,
    PRIMARY KEY(id_commande),
    CONSTRAINT fk_commande_etat FOREIGN KEY (etat_id) REFERENCES etat(id_etat),
    CONSTRAINT fk_commande_utilisateur FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur)
);
            
    

    
    INSERT INTO commande (date_achat, etat_id, id_utilisateur) VALUES
    ('2022-01-01', 1, 2),
    ('2022-01-01', 2, 2),
    ('2022-01-01', 3, 2);
    
    

    
    CREATE TABLE ligne_commande(
    commande_id INT,
    equipement_id INT,
    prix INT,
    quantite INT,
    PRIMARY KEY(commande_id, equipement_id),
    CONSTRAINT fk_ligne_commande_commande FOREIGN KEY (commande_id) REFERENCES commande(id_commande),
    CONSTRAINT fk_ligne_commande_equipement FOREIGN KEY (equipement_id) REFERENCES equipement(id_equipement)
);
            
    

    
    INSERT INTO ligne_commande (commande_id, equipement_id, prix, quantite) VALUES
    (1, 1, 80, 2),
    (2, 2, 90, 1),
    (3, 3, 200, 1),
    (3, 4, 40, 1),
    (3, 5, 70, 1);
    
    

    
    CREATE TABLE declinaison(
    id_declinaison INT AUTO_INCREMENT,
    couleur_declinaison INT,
    taille_declinaison INT,
    stock INT,
    id_equipement INT,
    PRIMARY KEY(id_declinaison),
    CONSTRAINT fk_declinaison_equipement FOREIGN KEY (id_equipement) REFERENCES equipement(id_equipement),
    CONSTRAINT fk_declinaison_taille FOREIGN KEY (taille_declinaison) REFERENCES taille(id_taille),
    CONSTRAINT fk_declinaison_couleur FOREIGN KEY (couleur_declinaison) REFERENCES couleur(id_couleur)
);
            
    

    
    INSERT INTO declinaison (couleur_declinaison, taille_declinaison, stock, id_equipement) VALUES
    (1, 1, 10, 1),
    (2, 2, 10, 1),
    (3, 3, 10, 1),
    (1, 4, 10, 2),
    (1, 5, 10, 2),
    (1, 6, 10, 2),
    (1, 7, 10, 3),
    (1, 8, 10, 3),
    (1, 9, 10, 3),
    (1, 10, 10, 4),
    (1, 11, 10, 4),
    (1, 12, 10, 4),
    (1, 13, 10, 5),
    (1, 14, 10, 5),
    (1, 15, 10, 5),
    (1, 16, 10, 6),
    (1, 17, 10, 6),
    (1, 18, 10, 6),
    (3, 1, 10, 7),
    (2, 1, 10, 7),
    (1, 1, 10, 7),
    (3, 2, 10, 8),
    (2, 2, 10, 8),
    (1, 2, 10, 8),
    (3, 3, 10, 9),
    (2, 3, 10, 9),
    (1, 3, 10, 9),
    (3, 4, 10, 10),
    (2, 4, 10, 10),
    (1, 4, 10, 10),
    (3, 5, 10, 11),
    (2, 5, 10, 11),
    (1, 5, 10, 11),
    (3, 6, 10, 12),
    (2, 6, 10, 12),
    (1, 6, 10, 12),
    (3, 7, 10, 13),
    (2, 7, 10, 13),
    (1, 7, 10, 13),
    (3, 8, 10, 14),
    (2, 8, 10, 14),
    (1, 8, 10, 14),
    (3, 9, 10, 15),
    (2, 9, 10, 15),
    (1, 9, 10, 15),
    (3, 10, 10, 16),
    (2, 10, 10, 16),
    (1, 10, 10, 16),
    (3, 11, 10, 17),
    (2, 11, 10, 17),
    (1, 11, 10, 17),
    (3, 12, 10, 18),
    (2, 12, 10, 18),
    (1, 12, 10, 18),
    (3, 13, 10, 19),
    (2, 13, 10, 19),
    (1, 13, 10, 19),
    (3, 14, 10, 20),
    (2, 14, 10, 20),
    (1, 14, 10, 20);
    
    

    
CREATE TABLE ligne_panier(
    id_ligne_panier INT AUTO_INCREMENT,
    quantite INT,
    prix INT,
    id_declinaison INT,
    id_utilisateur INT,
    PRIMARY KEY(id_ligne_panier),
    CONSTRAINT fk_ligne_panier_declinaison FOREIGN KEY (id_declinaison) REFERENCES declinaison(id_declinaison),
    CONSTRAINT fk_ligne_panier_utilisateur FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur)
); 