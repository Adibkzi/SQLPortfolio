SELECT OP_CARRIER, SUM(distance) as TotalDistance
FROM FlightsDelayedDB.DBO.FLDY1
 Group by OP_CARRIER 
 order by sum(DISTANCE)