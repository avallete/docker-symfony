docker-compose exec php /usr/bin/composer install
# Let's setup and populate the database
docker-compose exec php /usr/bin/php app/console doctrine:schema:update --force
docker-compose exec php /usr/bin/php app/console doctrine:generate:entities AppBundle
docker-compose exec php /usr/bin/php app/console doctrine:fixtures:load -q
# Let's setup the prod environment
docker-compose exec php /usr/bin/composer install --no-dev --optimize-autoloader
docker-compose exec php /usr/bin/php app/console cache:clear --env=prod --no-debug
docker-compose exec php /usr/bin/php app/console assets:install
