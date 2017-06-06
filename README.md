#### Передумови

docker >= v17.03.0-ce  
як [toolbox](https://www.docker.com/products/docker-toolbox) (рекомендовано для Windows)  
або [native](https://store.docker.com/search?type=edition&offering=community)

#### Початок

```
# fork
git clone https://github.com/<username>/toloka
git remote add upstream https://github.com/hurtom/toloka
cd toloka
docker-compose up -d
docker-compose exec toloka composer install
```

Якщо ви встановили toolbox:
- `docker-compose` треба запускати із Quickstart Terminal
- на Windows `toloka` має бути в `C:\Users\<user>\`

#### Оновлення

```
git pull upstream master
docker-compose pull
docker-compose up -d
docker-compose exec toloka composer update
```

#### Створення зміни

```
git checkout -b some-feature
# розробка
# оновлення
git commit -a -m "Add some feature"
git push origin some-feature
# pull request
git checkout master
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

#### Xdebug

Працює без додаткових налаштувань. Потрібно тільки [закладки](https://www.jetbrains.com/phpstorm/marklets/) або [розширення](https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc) для браузера, та IDE

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
