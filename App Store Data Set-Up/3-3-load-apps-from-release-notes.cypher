//3.3 Load Apps from ReleaseNotes
call apoc.load.json("file:///appReleaseNotes.json") yield value
where value.store_app_id is not null
merge (a:App{appId:value.store_app_id})