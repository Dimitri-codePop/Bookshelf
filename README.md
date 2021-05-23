# MyBookshelf

Ceci est une API de gestion de bibliothèque ouverte à tous.

## Auteurs

- [@DimitriMartin](https://github.com/Dimitri-codePop)

## Stack

- [PostgreSQL](https://www.postgresql.org/)
- [Node.js](http://nodejs.org/)
- [Sqitch](https://sqitch.org/)
- [Express](http://expressjs.com/)
- [node-postgres](http://expressjs.com/)
- [Joi](http://joi.dev/)
- [dotenv](https://www.npmjs.com/package/dotenv)

## Run Locally

Clonez le projet

```bash
  git clone https://github.com/Dimitri-codePop/bookshelf.git
```

Rendez-vous dans le répertoire racine du projet

```bash
  cd my-project
```

Installez la base de données PostgreSQL

```bash
createdb my_bookshelf
```

Afin de déployer la BDD, indqiuer les informations de connexion nécessaire dans un fichier `./sqitch.conf` à l'image du `./sqitch.example.conf`

Puis:

```
sqitch deploy
```


Installations des dependences

```bash
  npm install
```

Demarrage du serveur

```bash
  npm run start
```

## Variables d'environnement
