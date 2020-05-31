//1.2 Words- word and rel counts and clean of upper case and punctuation  
//https://neo4j.com/blog/natural-language-analytics-made-simple-visual-neo4j/

match (r:RelNotes)
where r.relNotesId="7302902"
with r.body as text
with reduce(t=tolower(text), delim in [",",".","!","?",'"',":",";","'","-", "&"] | replace(t,delim,"")) as normalized
with [w in split(normalized," ") | trim(w)] as words
unwind range(0, size(words)-2) as idx
MERGE (w1:Word {name:words[idx]})
  ON CREATE SET w1.count = 1 ON MATCH SET w1.count = w1.count + 1
MERGE (w2:Word {name:words[idx+1]})
  ON CREATE SET w2.count = 1
  ON MATCH SET w2.count = w2.count + (case when idx = size(words)-2 then 1 else 0 end)
MERGE (w1)-[r:NEXT]->(w2)
  ON CREATE SET r.count = 1
  ON MATCH SET r.count = r.count +1;