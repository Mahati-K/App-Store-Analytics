//3.2 Load Apps from Reviews
call apoc.load.json("file:///appReviews.json") yield value
merge (a:App{appId:value.store_app_id})
set a.name = value.app_name