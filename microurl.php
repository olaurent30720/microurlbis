<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Microurl</title>
  <meta name="description" content="">
</head>
<body><pre><?php

  // séparer ses identifiants et les protéger, une bonne habitude à prendre
  include "microurl-connect.php";

  try {

    // instancie un objet $connexion à partir de la classe PDO
    $connexion = new PDO(DB_DRIVER . ":host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET, DB_LOGIN, DB_PASS, DB_OPTIONS);

    // Requête de sélection 01
    $requete = "SELECT * FROM `url`";
    $prepare = $connexion->prepare($requete);
    $prepare->execute();


    //$resultat = $prepare->fetch() ave un boucle while;

    while ($donnee = $prepare->fetch()){
      echo("<li>"
      ."Id de l'url : ".$donnee['id_url']."<br>"
      ."url : ".$donnee['url']."<br>"
      ."Shorcut : ".$donnee['shortcut']."<br>"
      ."Datetime : ".$donnee['datetime']."<br>"
      ."Description : ".$donnee['description']
      ."</li>"."<br>");
  }; 

    // Requête de sélection 02
    $requete = "SELECT *
                FROM `url`
                WHERE `id_url` = :id"; // on cible le l'url dont l'id est ...
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(":id" => 2)); // on cible l'url dont l'id est 2
    $resultat = $prepare->fetchAll();

    // debug & vérification
    print_r($resultat); 

    // Requête d'insertion
    
    $requete = "INSERT INTO `url` (`url`, `shortcut`, `datetime`, `description`)
                VALUES (:url, :shortcut, :datetime, :description);";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
      ":url" => "https://www.rendezvouscheznous.com/activites?categories%5B0%5D=7&address=M%C3%A9jannes%20le%20Clap",
      ":shortcut" => "sp-mlp",
      ":datetime" => date("Y-m-d H-i"),
      ":description"=>"Spéléo à Mejeanne le clap"
    ));
    $resultat = $prepare->rowCount(); // rowCount() nécessite PDO::MYSQL_ATTR_FOUND_ROWS => true
    $lastInsertedEpisodeId = $connexion->lastInsertId(); // on récupère l'id automatiquement créé par SQL

    
    // Requête de modification
    $requete = "UPDATE `url`
                SET`description` = :description
                WHERE `id_url` = :id;";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
      ":id" => 3,
      ":description" => "Avatar 222"
    ));
    $resultat = $prepare->rowCount();
    
    // Requête de suppression
    $requete = "DELETE FROM `url`
                WHERE ((`id_url` = :id));";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
      ":id"   => 5
    ));
    $resultat = $prepare->rowCount();


    // insertion pour la question 7

    $requete = "INSERT INTO `url` (`url`, `shortcut`, `datetime`, `description`)
                VALUES (:url, :shortcut, :datetime, :description);";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
      ":url" => "https://www.zataz.com/total-energie-direct-obligee-de-stopper-un-jeu-en-ligne-suite-a-une-fuite-de-donnees/",
      ":shortcut" => "ztz7",
      ":datetime" => date("Y-m-d H-i"),
      ":description"=>"L'entreprise Total Energie Direct avait lancé un jeu en ligne. Le concours a dû être stoppé. Il était possible d'accéder aux données des autres joueurs."
    ));
    $resultat = $prepare->rowCount(); // rowCount() nécessite PDO::MYSQL_ATTR_FOUND_ROWS => true
    $lastInsertedEpisodeId = $connexion->lastInsertId(); // on récupère l'id automatiquement créé par SQL
    
    // question 8
    $requete = "INSERT INTO `mots_cles` (`nom`)
                VALUES (:nom);";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
      ":nom" => "piratage"
    ));
    $resultat = $prepare->rowCount(); // rowCount() nécessite PDO::MYSQL_ATTR_FOUND_ROWS => true
    $lastInsertedEpisodeId = $connexion->lastInsertId();


    // question 9 : Créer une requête qui lie le hashtag "piratage" à l'entrée de l'étape 7.

    $requete = "INSERT INTO `asso_mots_url`(`id_mot_clé`, `id_url`)
    VALUES(:motsclesId, :urlId)";
    $prepare = $connexion -> prepare($requete);
    $prepare->execute(array(
    ':motsclesId' => 4,
    'urlId' => 8
    ));

// question 10

$requete = "SELECT `url`
                FROM `asso_mots_url`
                JOIN `url` ON `url.id_url` = `asso_mots_url.id_url`
                JOIN `mots_cles` ON `mots_cles`.`id_mots_cles` = `asso_mots_url.id_mot_clé`
                WHERE `mots_cles` = `piratage`"; 
    $prepare = $connexion->prepare($requete);
    $prepare->execute(); 
    $resultat = $prepare->fetchAll();

  } catch (PDOException $e) {

    // en cas d'erreur, on récup et on affiche, grâce à notre try/catch
    exit("❌🙀💀 OOPS :\n" . $e->getMessage());

  }

?></pre></body>
</html>