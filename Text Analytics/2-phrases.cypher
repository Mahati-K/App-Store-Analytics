//2. Phrases
MATCH path = (w:Word {name:"Fixes"})-[:NEXT*..3]->()
RETURN [n in nodes(path) | n.name] as phrase
LIMIT 5;