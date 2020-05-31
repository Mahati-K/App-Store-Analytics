//8.2 App, Release Notes
call apoc.load.json("file:///appReleaseNotes.json") yield value
match (a:App), (r:RelNotes)
where a.appId = value.store_app_id and value.id = r.relNotesId
create (a)-[:has]->(r)