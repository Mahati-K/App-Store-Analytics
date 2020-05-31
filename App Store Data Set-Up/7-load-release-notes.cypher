//7. Load Release Notes
call apoc.load.json("file:///appReleaseNotes.json") yield value
merge (r:RelNotes{relNotesId:value.id})
set r.body = value.body
set r.version = value.version
set r.date = value.date