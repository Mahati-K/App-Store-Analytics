//8.3 App, Review Relationship
call apoc.load.json("file:///appReviews.json") yield value
match (a:App), (r:Review)
where a.appId = value.store_app_id and value.review_id = r.reviewId
create (a)-[:has]->(r)