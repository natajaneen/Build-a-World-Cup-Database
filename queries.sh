#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"

echo "Total number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games;")"

echo "Total number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals) + SUM(opponent_goals) FROM games;")"

echo "Average number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) FROM games;")"

echo "Average number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals), 2) FROM games;")"

echo "Average number of goals in all games from both teams:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals + opponent_goals), 2) FROM games;")"

echo "Most goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(GREATEST(winner_goals, opponent_goals)) FROM games;")"

echo "Number of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals > 2;")"

echo "Winner of the 2018 tournament team name:"
echo "$($PSQL "SELECT name FROM teams WHERE team_id = (SELECT winner_id FROM games WHERE year=2018 AND round='Final');")"

echo "List of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT DISTINCT name FROM teams INNER JOIN games ON teams.team_id = games.winner_id OR teams.team_id = games.opponent_id WHERE year=2014 AND round='Eighth-Final' ORDER BY name;")"

echo "List of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT DISTINCT name FROM teams INNER JOIN games ON teams.team_id = games.winner_id ORDER BY name;")"

echo "Year and team name of all the champions:"
echo "$($PSQL "SELECT year, name FROM teams INNER JOIN games ON teams.team_id = games.winner_id WHERE round='Final' ORDER BY year;")"

echo "List of teams that start with 'Co':"
echo "$($PSQL "SELECT name FROM teams WHERE name LIKE 'Co%';")"
#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo

echo -e "\nAverage number of goals in all games from the winning teams:"
echo

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo

echo -e "\nAverage number of goals in all games from both teams:"
echo

echo -e "\nMost goals scored in a single game by one team:"
echo

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo

echo -e "\nWinner of the 2018 tournament team name:"
echo

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo

echo -e "\nList of unique winning team names in the whole data set:"
echo

echo -e "\nYear and team name of all the champions:"
echo

echo -e "\nList of teams that start with 'Co':"
echo
