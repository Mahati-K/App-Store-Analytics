// Mob Reviewers
MATCH (rr:Reviewer)--(r:Review)--(a:App)
WITH rr, COLLECT(a) AS appList
where size(appList)>1
WITH appList, COLLECT(rr) as Gang
WHERE SIZE(Gang) >1
RETURN appList, Gang order by size(Gang), size(appList) limit 5