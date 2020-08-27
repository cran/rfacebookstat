</head>

<p align="center">
<a href="https://selesnow.github.io/"><img src="https://alexeyseleznev.files.wordpress.com/2017/03/as.png" height="80"></a>
</p>

# rfacebookstat - R пакет для работы с рекламным кабинетом Facebook <a href='https://selesnow.github.io/rfacebookstat/'><img src='https://raw.githubusercontent.com/selesnow/rfacebookstat/master/inst/logo/rfacebookstat.png' align="right" height="139" /></a>

## CRAN

[![Rdoc](http://www.rdocumentation.org/badges/version/rfacebookstat)](https://www.rdocumentation.org/packages/rfacebookstat)
[![rpackages.io rank](http://www.rpackages.io/badge/rfacebookstat.svg)](http://www.rpackages.io/package/rfacebookstat)
[![](https://cranlogs.r-pkg.org/badges/rfacebookstat)](https://cran.r-project.org/package=rfacebookstat)

## For English speaking users

For use inside package manual run: `help( package = "rfacebookstat")`

## Краткое описание.

Пакет для загрузки данных из [Marketing API Facebook](https://developers.facebook.com/docs/marketing-apis?locale=ru_RU) в R, а так же с помощью пакета вы можете управлять доступами пользователей к рекламный аккаунтам на Facebook.

## Достижения

1. rfacebookstat попал в [top 40 пакетов](https://rviews.rstudio.com/2018/09/26/august-2018-top-40-new-packages/), опубликованных на CRAN в августе 2018 года.

## Видео уроки по работе с пакетом `rfacebookstat`
Для того, что бы вам было проще понять как работать с пакетом я записал 6 коротких видео уроков, все они доступны на YouTube в этом [плейлисте](https://www.youtube.com/playlist?list=PLD2LDq8edf4pItOb-vZTG5AXZK2niJ8_R).

1. Простая авторизация
2. Авторизация через собственное приложение
3. Автоматическая авторизация через файл *.Renviron*
4. Автоматическая авторизация через переменные среды на Windows
5. Опции пакета и загрузка объектов из рекламных кабинетов.
6. Загрузка статистики рекламы из рекламных кабинетов Facebook в R и визуализация данных.

## Установка пакета rfacebookstat
Для установки пакета запустите приведённый ниже код в RStudio или R консоли.
Установка из главного репозитория CRAN:
```r
install.packages("rfacebookstat")
```
Устновка наиболее актульной dev версии пакета:
```r
if(!"devtools" %in% installed.packages()[,1]){install.packages("devtools")}
devtools::install_github('selesnow/rfacebookstat')
```

### Пример кода
```
# переменные среды для авторизации
Sys.setenv("RFB_USER" = "selesnow",
           "RFB_TOKEN_PATH" = "C:/Users/Alsey/fb_authdata")

# подключение пакета
library(rfacebookstat)

# опции
options(rfacebookstat.accounts_id  = c("act_000000000", "act_1111111111),
		rfacebookstat.business_id  = 0000000000)
 
# авторизация в API
# краткосрочный токен
fbAuth()

# Загрузка объектов API
# бизнес менеджеры
my_fb_bm   <- fbGetBusinessManagers()

# рекламные аккаунты
my_fb_acs <- fbGetAdAccounts()

# Объекты рекламного аккаунта
# кампании
my_fb_camp <- fbGetCampaigns()

# группы объявлений
my_fb_adsets <- fbGetAdSets()

# объявления
my_fb_ads    <- fbGetAds()

# контент объявлений
my_fb_ad_content <- fbGetAdCreative()

# страницы связанные с рекламными аккаунтами
my_fb_page <- fbGetPages()

# приложения связанные с рекламными аккаунтами
my_fb_apps <- fbGetApps()

# ###################
# загрузка статистики
# ###################
my_fb_stats <- fbGetMarketingStat(level = "campaign",
                                  fields = "account_name,campaign_name,impressions,clicks",
                                  breakdowns = "device_platform",
                                  date_start = "2018-08-01",
                                  date_stop = "2018-08-07",
                                  interval = "day")


```

## Переменные среды
Как правило в `rfacebookstat` переменные среды используются для автоматизации процесса авторизации.

* RFB_TOKEN_PATH - Путь к папке в которой у вас хранится файл с раширением *.rfb_auth.rds*, в котором хранятся учётные данные;
* RFB_USER - Имя пользователя Facebook, который вы указали в аргументе *username* при прохождении авторизации с помощью функции `fbAuth()`;
* RFB_API_TOKEN - Полученный с помощью функции `fbAuth()` токен доступа к API.

## Опции
Опции используются для минимизации дублирования кода, и позволяют регулировать поведение пакета в ходе конкретной R сессии или одного скрипта. Как правила с помощью опций регулируют список рекламных аккаунтов и бизнес менеджеров с которыми будет вестись работа в ходе скрипта.

* rfacebookstat.api_version - Версия API к которой пакет будет направлять запросы, не рекомендуется изменять эту опцию;
* rfacebookstat.access_token - Ваш токен доступа, также не рекомендуется хранить его текстом в ваших скриптах;
* rfacebookstat.accounts_id - ID аккаунтов которые вы используете в скрипте по умолчанию, можно задавать вектором;
* rfacebookstat.business_id - ID бизнес менеджера который вы планируете использовать в скрипте по умолчанию
* rfacebookstat.token_path - Путь к папке, где хранятся файлы с учётными данными;
* rfacebookstat.username - Имя пользователя facebook;
* rfacebookstat.app_id - ID созданного вами приложения в Facebook для авторизации;
* rfacebookstat.app_secret - Секрет созданного вами приложения в Facebook.

### Виньетки 
1. ВИньетка про авторизацию в Facebook API: `vignette('rfacebookstat-authorization', package = 'rfacebookstat')`
2. Виньетка посвящённая загрузке статистическим данных из рекламных аккаунтов: `vignette('rfacebookstat-get-statistics', package = 'rfacebookstat')`

### Статьи
1. [Как загрузить статистику рекламных кампаний из API Facebook с помощью языка R](https://netpeak.net/ru/blog/kak-zagruzit-statistiku-reklamnykh-kampanii-iz-api-facebook-s-pomoshch-yu-yazyka-r/)
2. [Как загрузить статистику из рекламных систем в Google BigQuery](https://ppc.world/articles/kak-zagruzit-statistiku-iz-reklamnyh-sistem-v-google-bigquery/)
3. [Импорт данных о расходах в Google Analytics с помощью R](https://analytics-tips.com/import-dannyh-o-raskhodah-v-google-analytics-s-pomoshchyu-r/)

### Ссылки
1. [Документация по работе с пакетом rfacebookstat](https://selesnow.github.io/rfacebookstat/).
2. Баг репорты, предложения по доработке и улучшению функционала rfacebookstat оставлять [тут](https://github.com/selesnow/rfacebookstat/issues). 
3. [Видео уроки по работе с пакетом rfacebookstat](https://www.youtube.com/playlist?list=PLD2LDq8edf4pItOb-vZTG5AXZK2niJ8_R)
4. [Список релизов](https://github.com/selesnow/rfacebookstat/releases).
5. [Группа в Вконтакте](https://vk.com/data_club).

### Автор пакета
Алексей Селезнёв, Head of analytics dept. at [Netpeak](https://netpeak.net)
<Br>Telegram Channel: [R4marketing](https://t.me/R4marketing)
<Br>email: selesnow@gmail.com
<Br>skype: selesnow
<Br>facebook: [facebook.com/selesnow](https://www.facebook.com/selesnow)
<Br>blog: [alexeyseleznev.wordpress.com](https://alexeyseleznev.wordpress.com/)
