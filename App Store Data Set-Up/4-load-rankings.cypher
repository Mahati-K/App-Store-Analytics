//4. Load Rankings
call apoc.load.json("file:///appRankings.json") yield value
merge (ra:Ranking{rankingId:value.id})
set ra.rank_type = value.rank_type
set ra.category = value.category
set ra.rank = value.rank
set ra.date = value.date