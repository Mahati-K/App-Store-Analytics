//Rating Dev
match (a:App)--(r:Review)
with a, apoc.convert.toInteger(r.star_rating) as rating
return distinct(a.category), min(rating) as LeastRating, max(rating) as HighestRating, avg(rating) as Average, stdev(rating) as StandardDeviation
order by StandardDeviation