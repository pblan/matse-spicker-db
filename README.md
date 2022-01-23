# matse-spicker-db
Beispiel-Datenbanken für das Modul "Datenbanken" in Verbindung mit eigener Zusammenfassung (https://matse.paddel.xyz/spicker)

## Allgemeines
Die Datenbank `db_pokemon` wurde erstellt mithilfe von [PokéAPI](https://pokeapi.co/).

Im Ordner `helpers` liegt das Skript, das uns bei der Erstellung der Datenbank geholfen haben.
Dieses ist (leider) weder schön, noch sonderlich effizient. 
Der Vollständigkeit halber liegt es aber hier im Repository.

Ebenfalls enthalten sind die Beispieldatenbanken aus der Vorlesung: 
- `db_kemper`
- `db_matse_algebra`
- `db_mhist`
- `db_oracle`

## Installation 
### Voraussetzungen
- Docker (Siehe https://docs.docker.com/get-docker/)
- Docker Compose (Siehe https://docs.docker.com/compose/install/)

### Ablauf
1. Dieses Repository klonen
2. In einem Terminal folgenden Befehl im geklonten Ordner ausführen: 
```bash
docker-compose up -d
```
3. Docker Compose wird nun zwei Container gestartet haben: 
    - `phpmyadmin`: Dient als sofort lauffähige SQL-Nutzeroberfläche. 
    Zu erreichen ist diese über http://localhost:8086
    - `mysql`: Die eigentliche Datenbank. 
    **Achtung**: Der Container nutzt den Port `3308`!
4. Anschließend kann man sich auf der phpmyadmin-Oberfläche mit den Standard-Credentials `root` (User) und `root` (Passwort) anmelden.

### Anpassungen
Natürlich sind die Standard-Credentials nicht wirklich sicher, der MySQL-Port potentiell belegt, oder man möchte phpmyadmin überhaupt nicht nutzen.

In der `docker-compose.yml` kann man diese Dinge natürlich manuell ändern: 
```yml
version: "3.7"

services:
# Diesen Block auskommentieren, um phpmyadmin nicht zu nutzen
  phpmyadmin:
    image: phpmyadmin/phpmyadmin:latest
    ports:
      - "8086:80"
    links:
      - mysql:db
    restart: always

  mysql:
    image: mysql:latest
    # Credentials
    environment:
      MYSQL_USER: user
      MYSQL_PASSWORD: password
      MYSQL_ROOT_PASSWORD: root
    # MySQL-Port
    ports:
      - "3308:3306"
    volumes:
      - mysql_data:/var/lib/mysql
      # automatisches Importieren von allen Dumps in `mysql`
      - ./dumps/:/docker-entrypoint-initdb.d
    restart: always
```

Will man nicht alle Datenbanken importieren, einfach die entsprechenden Dateien löschen/aus `dumps` entfernen.
## Tipps und Tricks
- Solltet ihr in den SQL-Dump der Datenbank schauen (`dumps/db_pokemon.sql`), wundert euch nicht  über die 54306 Zeilen, die wir für die Tabelle `lernt` benötigen. 
In einer voherigen Version war das eine beinahe 2MB große Zeile...

- Im Ordner `mysql_data` liegen die Daten, die die Datenbank im Betrieb erzeugt. 
Vielleicht ist es mal ganz interessant sich das anzuschauen.

- Auch nach einem `docker-compose down` liegen die Daten der letzten Instanz noch im Ordner `mysql_data`! 
Wollte ihr also einen Clean-Reset, müsst ihr vor dem `docker-compose up -d` einmal den Inhalt des Ordners/den Ordner löschen!