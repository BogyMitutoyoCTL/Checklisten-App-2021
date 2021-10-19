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

behandelt. Wir sind bis Folie 58 gekommen.

