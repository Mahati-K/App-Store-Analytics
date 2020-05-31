//3.1 Load Apps from Rankings
call apoc.load.json("file:///appRankings.json") yield value
merge (a:App{appId:value.store_app_id})
set a.name = value.app_name
set a.category = value.category