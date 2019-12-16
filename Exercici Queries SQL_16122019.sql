1. Quantitat de registres de la taula de vols:  
select count(flightID) from flights
2_Retard promig de sortida i arribada segons l’aeroport origen.
SELECT Origin, AVG(ArrDelay) as prom_arribades, AVG (DepDelay) 
as prom_sortides from flights group by Origin order by Origin
3_Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen. 
A més, volen que els  resultat es mostrin de la següent forma (fixa’t en l’ordre de les files):
SELECT Origin, colyear, colMonth, AVG(ArrDelay) as promig_arribades from flights
group by Origin, colYear, colMonth order by Origin, colyear, colMonth
4. Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen
(mateixa consulta que  abans i amb el mateix ordre).
Però a més, ara volen que en comptes del codi de l’aeroport es mostri  el nom de la ciutat.
SELECT City, colYear, colMonth, AVG(ArrDelay) as promig_arribades
from flights left join usairports on IATA = Origin
group by City, colYear, colMonth order by City, colYear, colMonth
5_Les companyies amb més vols cancelats, per mesos i any. A més, han d’estar ordenades de forma 
que les companyies amb més cancel·lacions apareguin les primeres.
SELECT UniqueCarrier, colYear, colMonth, count(Cancelled) as cancellations
from flights group by UniqueCarrier, colYear, colMonth order by cancellations DESC;
6_ L’identificador dels 10 avions que més distància han recorregut fent vols.
SELECT TailNum, SUM(Distance) as totalDistance from flights
group by TailNum order by totalDistance DESC limit 1,10;
7_ Companyies amb el seu retard promig només d’aquelles les quals els seus vols arriben al seu destí 
amb un retràs promig major de 10 minuts.
SELECT UniqueCarrier, avg(ArrDelay) as avg_Delay FROM flights
group by UniqueCarrier having avg(ArrDelay)>10 order by avg_Delay DESC;


 
