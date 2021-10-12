# bhs

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Ce projet a été réalisé avec le framework laravel et l'api REST

Pour l'exécuter:
- Placez vous dans votre dossier laravel;
- Installez et mettez à jour "Composer";
- Créez la base de données "db_mairie" dans phpmyadmin,
- placez vous dans "Mairie/mairie_app/api/api_ogii" et exécutez "php artisan migrate"pour alimenter la base;
- ensuite exécutez "php artisan serve" pour lancer le serveur;
- Puis lancez flutter.

* Dans la partie admin, pour validder une demande, il faut changer le statut de la demande en cliquant sur l'icône horloge dans le coin supérieur droit.


NB: Pour se connecter avec le compte administrateur, il faut changer manuellement "role_id" à "2" dans la table users dans phpmyadmin. Par defaut chaque utilisateur crée est considéré comme user standard.
