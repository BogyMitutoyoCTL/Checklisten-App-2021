# Checklisten-App-2021
Checklisten erstellen und ausfüllen mit einer App für Smartphones.

## Mittwoch 22.9.21

Wir haben uns kurz vorgestellt, einen Rundgang durch die Firma gemacht, Laptops einsatzfähig gemacht und Github Accounts eingerichtet. Die [Firmenpräsentation (PPTX ⇓)](Firmenpräsentation.pptx) enthält auch Informationen über das Studium. Einen Blick in die [Studentenwohnung (PPTX ⇓)](Studentenwohnung.pptx) war auch möglich. Schließlich haben wir auf den Smartphones schon einmal den Entwicklermodus aktiviert.

Unsere Überlegungen, was eine Checklisten-App alles können oder haben sollte, führten zu folgender Liste:

* Titel oder Name für die Checkliste
* Häkchen zum Abhaken
* Kategorien, um die Checkliste einzuteilen
* Suche nach Checklisten oder Einträgen
* Anzahl zu einem Eintrag hinzufügen (z.B. 5 T-Shirts für den Urlaub)
* Vorgeben einer Reihenfolge zur Abarbeitung der Checkliste (z.B. zuerst Wagenheber hochschrauben, dann Reifen abmontieren)
* Umrechenbare Einheiten (z.B. für Kochrezepte)
* Alternativen (z.B. bei Lebensmittelunverträglichkeit)
* Einstellen eines Termins, bis wann die Checkliste erledigt sein muss
* Erinnerung an die Abarbeitung der Checkliste
* Regelmäßige Wiedervorlage einer Checkliste mit Hilfe eines Kalenders
* Auswertung von Checklisten (Rückblick auf vergangene ausgefüllte Checklisten)
* Bild zu einem Eintrag hinzufügen, damit klar ist, was gemeint ist (z.B. welches T-Shirt genau)
* Feedback-Funktion für Nutzer (z.B. Bug-Reports, Feature-Wünsche)
* Offline-Funktionalität, falls die App in abgelegenen Gebieten benutzt wird
* Übersetzung, damit die App weltweit genutzt werden kann
* Vorgefertigte Checklisten aus dem Internet verwenden
* Checklisten zusammen mit anderen Personen ausfüllen

Bis zum nächsten Mal: bitte das Dokument "Fotofreigabe" ausfüllen und von den Eltern unterschreiben lassen.

## Mittwoch, 29.9.21

Heute ging es endlich ans Programmieren, oder genauer gesagt: zunächst an die Einrichtung einer Entwicklungsumgebung, mit der programmiert werden kann. Um eine App mit Dart und Flutter zu programmieren, benutzen wir [Android Studio (PPTX⇓)](AndroidStudio.pptx). Die Systemvoraussetzungen um eine Flutter App mit Android Studio zu entwickeln sind:

* Windows 10 64 Bit
* 8 GB RAM
* 8 GB freier Festplattenplatz
* 1280×800 Pixel Bildschirm

Weil die Downloads auch ziemlich umfangreich sind, hat Mitutoyo für diese Schritte einen USB Stick zur Verfügung gestellt, auf dem die Programme schon enthalten waren.

Wir installierten und konfigurierten:

1. eine Java Runtime: [Amazon Corretto 🔗](https://docs.aws.amazon.com/corretto/index.html)
2. [Android Studio 🔗](https://developer.android.com/studio)
3. [Flutter 🔗](https://flutter.dev/) (enthält [Dart 🔗](https://dart.dev/))
4. einen Emulator für ein Smartphone mit Play Store

Das Ausführen der mitgelieferten Demo-App im Browser, im Emulator und auf dem Smartphone zeigte, ob alles wie gewünscht geklappt hat. 

Erkenntnis:

* Beim Xiaomi Note 9 muss die "MIUI optimization" abgeschaltet werden, damit wir Apps hochladen konnten. ([Quelle 🔗](https://stackoverflow.com/questions/47239251/install-failed-user-restricted-android-studio-using-redmi-4-device))

  Ein kurzer Moment des Schreckens: auf dem betroffenen Smartphone zeigte Whatsapp keine Kontaktinformationen mehr an. Grund dafür war, dass WhatsApp keine Berechtigungen mehr hatte ([Quelle 🔗](https://www.reddit.com/r/Xiaomi/comments/8c84f5/whatsapp_not_showing_contact_names/)). Warum genau WhatsApp die Berechtigungen verlor, ist unklar. Das Wiedereinschalten der "MIUI Optimization" half jedenfalls nicht. Wir haben folgende Berechtigungen von einem anderen Smartphone abgelesen und wieder eingerichtet: Kamera, Kontakte, Mikrofon, Speicher.

Danach haben wir den ganzen Dart Code der Demoanwendung gelöscht, um erstmal mit ein paar [Dart Grundlagen (PPTX⇓)](Dart.pptx) loslegen zu können. In dieser Präsentation sind wir bis Folie 13 gekommen.

## Mittwoch, 6.10.21

Wir haben in Android Studio weiter programmiert und Dart kennengelernt und folgende Themen behandelt:

* Rechenoperationen
* Bibliotheken, z.B. für die Mathematik-Funktion Potenzieren
* Textverarbeitung, insbesondere das "Ausschneiden" von Buchstaben
* Wiederholungen / Schleifen (`for` und `while`)
* Wahrheitswerte und Aussagen
* Verzweigungen (`if`)

**Lösungen zu den Übungen:**

* [Lösung Übung 1](https://dartpad.dev/?id=bc2ccef0f3caaa3444577838340cb746&null_safety=true)
* [Lösung Übung 2](https://dartpad.dev/?id=600212c3180ea97c91c25899fe08fe32&null_safety=true)
* [Lösung Übung 3](https://dartpad.dev/?id=275d13381ca893879be2b6f6b82559e2&null_safety=true)

Wir sind bis Folie 38 gekommen.

## Mittwoch, 13.10.21

Wir haben weiter mit Dart gearbeitet und die Themen

* Listen
* Maps / Dictionaries
* Methoden
* Funktionen
* Named Arguments

**Lösungen zu den Übungen:**

* [Lösung Übung 4](https://dartpad.dev/?id=04925f332c8e728abda1d6fda4b5a6cf&null_safety=true)
* [Lösung Übung 5](https://dartpad.dev/?id=f3bd95f6690db01d8301e8e478d8d198&null_safety=true)
* [Lösung Übung 6](https://dartpad.dev/?id=0f4e3f00594a88e8da99956803acd726&null_safety=true)

behandelt. Wir sind bis Folie 58 gekommen.

## Mittwoch 20.10.21

Wir haben die verbleibenden Themen der Dart-Präsentation durchgearbeitet:

* Callbacks (überflogen)
* async/await (überflogen)
* Klassen und Objekte

Beim Thema Klassen und Objekte haben wir berechnet, wie viel ein Quader aus Gold wiegt und was er wert ist. Viele Filme sind in dieser Hinsicht eher unrealistisch: die Bankräuber tragen zu viele Goldbarren auf einmal und ein voll mit Gold beladener Laster würde sicher zusammenbrechen.

In der BOGY-Woche müssen wir noch lernen

* wie eine Flutter App aufgebaut ist
* wie wir zusammen arbeiten und Daten austauschen.

## Montag 25.10.21

Nachdem wir die Grundlagen von Dart verstanden haben, konnten wir uns heute mit dem Thema [Flutter (PPTX⇓)](Flutter.pptx) beschäftigen. Flutter ist ein Zusatz zu Dart, der es uns erlaubt, Apps mit visuellen Gestaltungselementen zu erstellen. Die visuellen Elemente heißen Widgets.

## Dienstag 26.10.21

Am Morgen haben wir überlegt, wie die App aussehen könnte. Es entstanden sogenannte Wireframes und eine Navigationsübersicht.

Im Anschluss haben wir besprochen, was [Versionskontrolle (PPTX⇓)](Versionskontrolle.pptx) ist und wie sie konkret bei [Git (PPTX⇓)](GitWindows.pptx) einsetzt.

Den Rest des Dienstages haben wir damit verbracht, die Wireframes in echte Widgets zu verwandeln. Diese liefen allerdings noch mit Demo-Daten, also noch nicht mit echten Daten aus echten Checklisten.

## Mittwoch 27.10.21

Am Mittwoch liefen mehrere Arbeiten parallel:

* die Navigation zwischen den Widgets wurde hergestellt
* es entstand eine Klasse für eine echte Checkliste
* wir haben Demo-Checklisten erstellt, basierend auf der neuen Klasse
* Möglichkeiten zum Abspeichern von Daten wurden untersucht

Herr Haufe, Lehrer vom Gymnasium am Rosenberg hat uns besucht und sich den Fortschritt zeigen lassen.

## Donnerstag 28.10.21

Wir haben uns kurz über [Scrum (PPTX⇓)](Scrum.pptx) informiert und die verbleibenden Aufgaben aufgeschrieben und im Taskboard verwaltet.

Im Laufe des Tages haben wir auch erfahren, wie [Globalisierung (PPTX⇓)](Globalisierung.pptx) in einer App funktioniert. Später haben wir noch festgestellt, dass man die Default-Sprache in `l10n.yaml` mit `preferred-supported-locales: ["en"]` eingestellt werden kann, so dass Englisch als Sprache ausgewählt wird, falls eine eher exotische Sprache eingestellt ist.

## Freitag 29.10.21

Wir haben ein paar [Issues 🔗](https://github.com/BogyMitutoyoCTL/Checklisten-App-2021/issues) bei Github eingetragen und behoben und ansonsten weiter die Tasks vom Taskboard bearbeitet.

Um eine APK Datei zu erstellen, die dann verteilt und auf dem Handy installiert werden kann, darf im Terminal der Befehl `flutter build apk --release` verwendet werden. In den Google Playstore haben wir die App nicht veröffentlicht, da das noch [viele Schritte mehr 🔗](https://flutter.dev/docs/deployment/android) bedeutet.

Am Nachmittag gab es noch eine Feedbackrunde. Wer sich für Informatik interessiert  findet auf folgenden Seiten noch Ideen für Programmieraufgaben:

* [Project Euler 🔗](https://projecteuler.net) mit eher mathematischen Rätseln
* [Codewars 🔗](https://www.codewars.com) 
* [Hackerrank 🔗](https://www.hackerrank.com/)

