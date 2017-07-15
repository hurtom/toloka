# Толока [![Issues in Progress](https://img.shields.io/waffle/label/hurtom/toloka/in%20progress.svg)](http://waffle.io/hurtom/toloka) [![Issues Need Review](https://img.shields.io/waffle/label/hurtom/toloka/needs%20review.svg)](http://waffle.io/hurtom/toloka)

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/hurtom/toloka?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![StyleCI Status](https://styleci.io/repos/92591522/shield?style=flat)](https://styleci.io/repos/92591522)
[![Build Status](https://travis-ci.org/hurtom/toloka.svg?branch=master)](https://travis-ci.org/hurtom/toloka)
[![Issues in Progress](https://img.shields.io/waffle/label/hurtom/toloka/in%20progress.svg)](http://waffle.io/hurtom/toloka)
[![Issues Need Review](https://img.shields.io/waffle/label/hurtom/toloka/needs%20review.svg)](http://waffle.io/hurtom/toloka)

Інтернет-толока та BitTorrent трекер, метою якого є поширення україномовного коненту. Використовує рушій [TorrentPier](/torrentpier/torrentpier).

## Перед початком

* Переконайтесь, що ознайомились та розумієте стандарт офрмлення коду PHP [PSR-2][].
* Для спрощення налаштування різних IDE та редакторів проект використовує [`.editorconfig`](/hurtom/toloka/blob/master/.editorconfig) ([докладніше](http://editorconfig.org)) - дуже радимо додати відповідне розширення, якщо середовище не підтримує `.editorconfig` "з коробки". Подивитись наявні інтеграції можна за [цим посиланням](http://editorconfig.org/#download).
* Ми радимо дотримуватись [git-flow][]. Ви навіть можете не встановлювати [git-flow][], натомість просто дотримуватись згоди щодо іменування гілок (`feature/aaazzz`, `hotfix/bbbyyy`, `release/vX.Y.Z`). Оригінальна концепція була описана [Vincent Driessen][] у _"[A successful Git branching model][]"_
* Переконайтесь, що ознайомились та розумієте [GitHub flow][], який власне ідентичний до git-flow.

**Цей проект обмежений [Кодексом поведінки](CODE_OF_CONDUCT.md).**

## Зміст

* [Ресурси для новачків](#Ресурси-для-новачків)
* [I. Встановлення docker](#i-Встановлення-docker)
  * [Windows - toolbox](#windows---toolbox)
  * [Windows - native](#windows---native)
  * [Linux - Ubuntu 14.04 / 16.04](#linux---ubuntu-1404--1604)
  * [MacOS](#macos)
* [II. Перевірка версії docker](#ii-Перевірка-версії-docker)
  * [Мінімально необхідна версія docker](#Мінімально-необхідна-версія-docker)
* [III. Початок роботи з git](#iii-Початок-роботи-з-git)
* [IV. Запуск Толоки](#iv-Запуск-Толоки)
* [V. Оновлення](#v-Оновлення)
* [VI. Створення зміни](#vi-Створення-зміни)
* [VII. Очищення](#vii-Очищення)
  * [Зупинка контейнерів](#Зупинка-контейнерів)
  * [Видалення контейнерів](#Видалення-контейнерів)
  * [Видалення образів](#Видалення-образів)
* [VIII. Логи](#viii-Логи)
  * [nginx та php-fpm](#nginx-та-php-fpm)
  * [torrentpier](#torrentpier)
* [IX. Консоль](#ix-Консоль)
* [X. Інше](#x-Інше)
  * [xdebug](#xdebug)
  * [phpmyadmin](#phpmyadmin)

## Ресурси для новачків

* [Кодекс поведінки](CODE_OF_CONDUCT.md)
* [Як зробити внесок](CONTRIBUTING.md)
* [Чат hurtom/toloka у Gitter](https://gitter.im/hurtom/toloka)
* [git-flow][]
* [GitHub flow][]
* [Understanding the GitHub Flow][]
* [Pro Git book][]

## I. Встановлення docker

### Windows - toolbox

Якщо ви користуєтеся virtualbox, це для вас. В іншому випадку перейдіть до *Windows - native*

1. Встановіть [docker toolbox](https://www.docker.com/products/docker-toolbox)
2. Наступні команди виконуйте з Docker Quickstart Terminal

### Windows - native

1. Встановіть [docker native](https://store.docker.com/search?type=edition&offering=community)
2. Наступні команди виконуйте з Powershell

### Linux - Ubuntu 14.04 / 16.04

#### 1. Додайте apt репозитарій

```shell
sudo apt-get -y install apt-transport-https ca-certificates curl git
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

#### 2. Встановіть docker

```shell
sudo apt-get update
sudo apt-get -y install docker-ce
```

#### 3. Встановіть docker-compose

```shell
sudo curl -o /usr/local/bin/docker-compose -L \
    "https://github.com/docker/compose/releases/download/1.13.0/docker-compose-$(uname -s)-$(uname -m)"
sudo chmod +x /usr/local/bin/docker-compose
```

### MacOS

#### 1. Встановіть [brew](https://brew.sh/)

#### 2. Оновіть brew

```shell
brew update
brew upgrade
```

#### 3. Встановіть docker та docker-compose

```shell
brew install docker docker-compose
```

## II. Перевірка версії docker

```shell
docker -v
docker-compose -v
```

### Мінімально необхідна версія docker

```
Docker version 17.03.0-ce
docker-compose version 1.11.2
```

## III. Початок роботи з git

1. Встановіть [git](https://git-scm.com/downloads)
2. Створіть [форк (fork)](https://guides.github.com/activities/forking/) репозитарію на GitHub
3. Перейдіть в домашню теку
```shell
cd ~
```
4. [Клонуйте](https://guides.github.com/activities/forking/#clone) репозитарій на локальний комп’ютер (замініть $USER на вашу обліковку)
```shell
git clone https://github.com/$USER/toloka.git
```
5. Перейдіть в щойно створену теку
```shell
cd toloka
```
6. Додайте посилання на оригінальний репозитарій, щоб мати змогу оновлюватися
```shell
git remote add upstream https://github.com/hurtom/toloka.git
```

## IV. Запуск Толоки

1. Запустіть контейнери
```shell
docker-compose up -d
```
2. Встановіть пакети composer
```shell
docker-compose exec toloka composer install
```
3. Відкрийте сайт

| Версія docker| URL-адреса |
| ------------ | ---------- |
| toolbox | [192.168.99.100:8081](http://192.168.99.100:8081) |
| native  | [localhost:8081](http://localhost:8081) |

## V. Оновлення

Завжди оновлюйтеся перед початком роботи

```shell
cd ~/toloka
git pull upstream master
docker-compose pull
docker-compose up -d
docker-compose exec toloka composer update
```

## VI. Створення зміни

> Детально процес описаний у [GitHub flow][], є також [візуальний гід](https://guides.github.com/introduction/flow/) по ньому.

1. Створіть нову локальну гілку
```shell
git checkout -b feature/something
```
2. Додайте зміни
3. Оновіться, щоб ваші зміни були у відповідності до основного репозитарію
4. Створіть комміт
```shell
git commit -a -m "Add some feature"
```
5. Завантажте (push) зміни на GitHub ([як?](https://help.github.com/articles/pushing-to-a-remote/))
```shell
git push origin feature/something
```
6. Створіть pull request на GitHub ([як?](https://help.github.com/articles/creating-a-pull-request-from-a-fork/)). Переконайтеся, що поставили позначку **[Allow edits from maintainers](https://help.github.com/articles/allowing-changes-to-a-pull-request-branch-created-from-a-fork/).**
7. Перейдіть назад на основну гілку
```shell
git checkout master
```

## VII. Очищення

### Зупинка контейнерів

```shell
docker-compose stop
```

### Видалення контейнерів

```shell
docker-compose rm
```

### Видалення образів

```shell
docker rmi $(docker images -f "dangling=true" -q)
```

## VIII. Логи

### nginx та php-fpm

```shell
docker-compose logs -f toloka
```

### torrentpier

```shell
tail -f internal_data/log/php_err.log
```

## IX. Консоль

```shell
docker-compose exec toloka bash
```

## X. Інше

### xdebug

Працює без додаткових налаштувань. Потрібно тільки [закладки](https://www.jetbrains.com/phpstorm/marklets/) або [розширення](https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc) для браузера, та IDE

### phpmyadmin

| Версія docker | URL-адреса |
| ------------- | ---------- |
| toolbox | [192.168.99.100:8082](http://192.168.99.100:8082) |
| native  | [localhost:8082](http://localhost:8082) |


[PSR-2]: http://www.php-fig.org/psr/psr-2/
[git-flow]: https://danielkummer.github.io/git-flow-cheatsheet/index.uk_UA.html
[GitHub flow]: https://help.github.com/articles/github-flow/
[Understanding the GitHub Flow]: https://guides.github.com/introduction/flow/
[Pro Git book]: https://git-scm.com/book/uk/v2
[Vincent Driessen]: http://nvie.com/about/
[A successful Git branching model]: http://nvie.com/posts/a-successful-git-branching-model/
