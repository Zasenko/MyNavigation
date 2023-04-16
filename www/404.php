<?php
$lang = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);

switch ($lang) {
    case "en":
        $message = "Sorry, the page you are looking for could not be found.";
        $title = 'Page not found';
        $backHome = 'To the home page';
        $text = 'Oops! Looks like you took a&nbsp;wrong turn.<br><br>Don&rsquo;t worry, we&nbsp;won&rsquo;t judge. Sometimes we&nbsp;all end up&nbsp;in&nbsp;unexpected places.<br><br>But since you&rsquo;re here, why not take a&nbsp;look around?<br>Who knows, you might discover something new and exciting!';
        break;
    case "fr":
        $message = "Désolé, la page que vous recherchez est introuvable.";
        $title = 'Page non trouvée';
        $backHome = "Vers la page d'accueil";
        $text = 'Oops! On&nbsp;dirait que vous avez pris un&nbsp;mauvais tournant.<br><br>Ne&nbsp;vous inqui&eacute;tez pas, nous ne&nbsp;jugerons pas. Parfois, nous nous retrouvons tous dans des endroits inattendus.<br><br>Mais puisque vous &ecirc;tes ici, pourquoi ne&nbsp;pas jeter un&nbsp;coup d&rsquo;&oelig;il autour?<br>Qui sait, vous pourriez d&eacute;couvrir quelque chose de&nbsp;nouveau et&nbsp;excitant!';
        break;
    case "de":
        $message = "Entschuldigung, die von Ihnen gesuchte Seite konnte nicht gefunden werden.";
        $title = 'Seite nicht gefunden';
        $backHome = 'Zur Startseite';
        $text = 'Hoppla! Sie haben anscheinend eine falsche Abzweigung genommen.<br><br>Keine Sorge, wir werden nicht urteilen. Manchmal landen wir alle an&nbsp;unerwarteten Orten.<br><br>Aber da&nbsp;Sie hier sind, warum schauen Sie sich nicht&nbsp;um?<br>Wer wei&szlig;, vielleicht entdecken Sie etwas Neues und Aufregendes!';
        break;
    case "es":
        $message = "Entschuldigung, die von Ihnen gesuchte Seite konnte nicht gefunden werden.";
        $title = 'Página no encontrada';
        $backHome = 'A la página de inicio';
        $text = '&iexcl;Ups! Parece que has tomado un&nbsp;camino equivocado.<br><br>No&nbsp;te&nbsp;preocupes, no&nbsp;te&nbsp;juzgaremos. A&nbsp;veces todos acabamos en&nbsp;lugares inesperados.<br><br>Pero ya&nbsp;que est&aacute;s aqu&iacute;, &iquest;por qu&eacute; no&nbsp;echas un&nbsp;vistazo?<br>&iexcl;Qui&eacute;n sabe, podr&iacute;as descubrir algo nuevo y&nbsp;emocionante!';
        break;
    case "it":
        $message = "";
        $title = 'Pagina non trovata';
        $backHome = 'Alla pagina iniziale';
        $text = 'Ops! Sembra che tu&nbsp;abbia preso una strada sbagliata.<br><br>Non preoccuparti, non giudicheremo. A&nbsp;volte tutti finiamo in&nbsp;posti inaspettati.<br><br>Ma&nbsp;dato che sei qui, perch&eacute; non dai un&rsquo;occhiata intorno?<br>Chiss&agrave;, potresti scoprire qualcosa di&nbsp;nuovo ed&nbsp;eccitante!';
        break;
    case "ru":
        $message = "Извините, страница, которую вы ищете, не может быть найдена.";
        $title = 'Страница не найдена';
        $backHome = 'На главную страницу';
        $text = 'Упс! Похоже, вы&nbsp;свернули не&nbsp;туда.<br><br>Не&nbsp;волнуйтесь, мы&nbsp;не&nbsp;будем судить. Иногда мы&nbsp;все оказываемся в&nbsp;неожиданных местах.<br><br>Но&nbsp;раз вы&nbsp;здесь, почему&nbsp;бы не&nbsp;осмотреться?<br>Кто знает, может быть, вы&nbsp;откроете для себя что-то новое и&nbsp;захватывающее!';
        break;
    default:
        $message = "Sorry, the page you are looking for could not be found.";
        $title = 'Page not found';
        $backHome = 'To the home page';
        $text = 'Oops! Looks like you took a&nbsp;wrong turn.<br><br>Don&rsquo;t worry, we&nbsp;won&rsquo;t judge. Sometimes we&nbsp;all end up&nbsp;in&nbsp;unexpected places.<br><br>But since you&rsquo;re here, why not take a&nbsp;look around?<br>Who knows, you might discover something new and exciting!';
        break;
}

http_response_code(404);
?>

<!DOCTYPE html>
<html>

<head>
    <title>404 - Page not found</title>
    <meta charset="utf-8">
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <link rel="icon" href="/appimages/logo/browserLogo-64x64.ico">
    <link rel="stylesheet" type="text/css" href="style.css" />
    <style>
        html {
            display: flex;
            justify-content: center;
        }

        div {
            text-align: center;
        }

        .logoFull {
            margin-top: 1rem;
        }

        .div404 {
            margin-top: 5rem;
        }

        .notFound {
            margin-bottom: 5rem;
        }

        p {
            margin-bottom: 1rem;
            text-align: left;
        }

        .mainText {
            max-width: 40rem;
            padding: 2rem;
        }

        .link {
            margin-top: 4rem;
        }
    </style>
</head>

<body class="unselectable">

    <div>
        <a href="https://www.navigay.me"><img class="logoFull" src="appimages/logo/full-logo-black.svg"></a>
    </div>

    <div class="div404">
        <h1 class="superBigText">404</h1>
        <h3 class="notFound"><?php echo $title; ?></h3>
    </div>
    <div class="mainText">
        <p><?php echo $text; ?></p>
        <div class="link">
            <a href="https://www.navigay.me"><button type="button" class="button"><?php echo $backHome; ?></button></a>
        </div>
    </div>
</body>

</html>