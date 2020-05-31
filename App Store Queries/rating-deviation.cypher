// Rating Deviation
match (a:App)--(r:Review)
return distinct(a.category) as categories, collect(a.name) as App, stdev(apoc.convert.toInteger(r.star_rating)) as RatingDeviation