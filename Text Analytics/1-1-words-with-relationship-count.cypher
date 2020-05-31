//1.1 Words with relationship count
//https://neo4j.com/blog/natural-language-analytics-made-simple-visual-neo4j/

match (r:RelNotes)
where r.relNotesId="7302902"
with split(r.body, " ") as rWords
unwind range(0, size(rWords)-2) as idx
MERGE (w1:Word {name:rWords[idx]})
MERGE (w2:Word {name:rWords[idx+1]})
MERGE (w1)-[r:NEXT]->(w2)
ON CREATE SET r.count = 1 ON MATCH SET r.count = r.count +1;