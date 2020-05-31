//1.0 Words 
//https://neo4j.com/blog/natural-language-analytics-made-simple-visual-neo4j/

match (r:RelNotes)
where r.relNotesId="7302902"
with split(r.body, " ") as rWords
unwind range(0, size(rWords)-2) as idx
MERGE (w1:Word {name:rWords[idx]})
MERGE (w2:Word {name:rWords[idx+1]})
CREATE (w1)-[:NEXT]->(w2)