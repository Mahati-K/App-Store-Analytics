//8.4 Reviewer, Review Relationship
call apoc.load.json("file:///appReviews.json") yield value
match (r:Review), (rr:Reviewer)
where r.reviewId = value.review_id and value.user_apple_id = rr.reviewerId
create (r)-[:GivenBy]->(rr)