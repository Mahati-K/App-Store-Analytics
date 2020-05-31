//8.1 App, Ranking
call apoc.load.json("file:///appRankings.json") yield value
match (a:App), (r:Ranking)
where a.appId = value.store_app_id and value.id = r.rankingId
create (a)-[:has]->(r)