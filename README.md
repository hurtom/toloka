## I. Встановлення docker

### Windows - toolbox

Якщо ви користуєтеся virtualbox, це для вас. В іншому випадку перейдіть до *Windows - native*

1. Встановіть [docker toolbox](https://www.docker.com/products/docker-toolbox)
2. Наступні команди виконуйте з Docker Quickstart Terminal

### Windows - native

1. Встановіть [docker native](https://store.docker.com/search?type=edition&offering=community)
2. Наступні команди виконуйте з Powershell

### Ubuntu 14.04 / 16.04

1. Додайте репозиторій

```
sudo apt-get -y install apt-transport-https ca-certificates curl git
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

2. Встановіть docker

```
sudo apt-get update
sudo apt-get -y install docker-ce
```

3. Завантажте docker-compose

```
sudo curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.13.0/docker-compose-$(uname -s)-$(uname -m)"
sudo chmod +x /usr/local/bin/docker-compose
```
4. Користування командами docker без прав адміністратора (опціонально)

  - Необхідно додати користувача у групу _docker_
    
```
 sudo usermod -aG docker $(whoami) 
```

   - Щоб зміни вступили в силу, необхідно перезайти
### macOS

1. Встановіть [brew](https://brew.sh/)
2. Оновіть brew

```
brew update
brew upgrade
```

3. Встановіть docker

```
brew install docker docker-compose
```

## II. Перевірка версії docker

```
docker -v
docker-compose -v
```

Має бути мінімально:

```
Docker version 17.03.0-ce
docker-compose version 1.11.2
```

## III. Початок роботи з git

1. Встановіть [git](https://git-scm.com/downloads)
2. Створіть fork на github
3. Перейдіть в домашню теку

```
cd ~
```

4. Клонуйте репо на локальний комп'ютер

```
git clone https://github.com/<username>/toloka
```

5. Перейдіть в щойно створену теку

```
cd toloka
```

6. Додайте посилання на оригінальне репо, щоб могти оновлюватися

```
git remote add upstream https://github.com/hurtom/toloka
```

## IV. Запуск Толоки

1. Запустіть контейнери

```
docker-compose up -d
```

2. Встановіть пакети composer

```
docker-compose exec toloka composer install
```

3. Відкрийте сайт

    toolbox  
    [192.168.99.100:8081](http://192.168.99.100:8081)

    native  
    [localhost:8081](http://localhost:8081)

## V. Оновлення

Завжди оновлюйтеся перед початком роботи

```
cd ~/toloka
git pull upstream master
docker-compose pull
docker-compose up -d
docker-compose exec toloka composer update
```

## VI. Створення зміни


1. Створіть нову локальну гілку

```
git checkout -b some-feature
```

2. Додайте зміни
3. Оновіться, щоб ваші зміни були у відповідності до основного репо
4. Створіть комміт

```
git commit -a -m "Add some feature"
```

5. Завантажте зміни на github

```
git push origin some-feature
```

6. Створіть pull request на github
7. Перейдіть назад на основну гілку

```
git checkout master
```


## VII. Очищення

Зупинка контейнерів 

```
docker-compose stop
```

Видалення контейнерів

```
docker-compose rm
```

Видалення образів

```
docker rmi $(docker images -f "dangling=true" -q)
```

## VIII. Логи

nginx та php-fpm

```
docker-compose logs -f toloka
```

torrentpier

```
tail -f internal_data/log/php_err.log
```

## IX. Консоль

```
docker-compose exec toloka bash
```

## X. Інше

**xdebug**

Працює без додаткових налаштувань. Потрібно тільки [закладки](https://www.jetbrains.com/phpstorm/marklets/) або [розширення](https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc) для браузера, та IDE

**phpmyadmin**

toolbox  
[192.168.99.100:8082](http://192.168.99.100:8082)

native  
[localhost:8082](http://localhost:8082)
