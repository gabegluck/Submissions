use tennis
#Challenge 1 How many matches

select player,sum(counts)
from (select player1 as player, count(player1) as counts from grand_slam_men group by player union all select player2, count(player2) from grand_slam_men group by player2)t
group by player order by sum(counts)
into outfile '/home/gabegluck/challenge1.txt'
fields terminated by ','
lines terminated by '\n';
#Nadal has played the most matches in the three tournaments with 21 matches, Ferrer 17, Wawrinka 17, Djokovic 17

#Challenge 2 first serve percentage for men 
select *
 from (select player1, max(fsp_1) as fsp from grand_slam_men group by player1 union all select player2, max(fsp_2) from grand_slam_men group by player2) t
order by fsp
into outfile '/home/gabegluck/challenge2.txt'
fields terminated by ','
lines terminated by '\n';
#Carlos Berlocq, Rafael Nadal, Gael Monfils had the highest serving percentage with 84%

#Challenge 3 unforced errors
select player1, sumufe/sumtpw as ufe_rate
from  (select player1, sum(ufe) as sumufe, sum(tpw) as sumtpw from (select player1, sum(ufe_1) as ufe,sum(tpw_1+tpw_2) as tpw from grand_slam_men group by player1 union all select player2, sum(ufe_2), sum(tpw_1+tpw_2) from grand_slam_men group byplayer2)t group by player1)g
order by ufe_rate
into outfile '/home/gabegluck/challenge3.txt'
fields terminated by ','
lines terminated by '\n';

#Wawrinka's error percentage .11, Djokovic .11, Ferrer .10, Nadal .094