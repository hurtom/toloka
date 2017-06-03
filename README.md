#### Передумови

docker >= v17.03.0-ce  
як [toolbox](https://www.docker.com/products/docker-toolbox) (рекомендовано для Windows)  
або [native](https://store.docker.com/search?type=edition&offering=community)

#### Початок

```
git clone https://github.com/hurtom/toloka
cd toloka
docker-compose up -d
docker-compose exec toloka composer install
```

Якщо ви встановили toolbox, `docker-compose` треба запускати з нього

#### Оновлення

```
git pull
docker-compose pull
docker-compose up -d
docker-compose exec toloka composer update
```

#### Очищення

```
docker-compose stop
docker-compose rm
```

#### Логи

```
docker-compose logs -f toloka
tail -f internal_data/log/php_err.log
```

#### Консоль

```
docker-compose exec toloka bash
```

#### Адреси

**docker toolbox**

Сайт  
<http://192.168.99.100:8081>

phpMyAdmin  
<http://192.168.99.100:8082>

MySQL  
192.168.99.100:33061

**docker native**

Сайт  
<http://localhost:8081>

phpMyAdmin  
<http://localhost:8082>

MySQL  
localhost:33061
