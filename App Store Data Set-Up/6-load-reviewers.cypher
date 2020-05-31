//6. Load Reviewers
call apoc.load.json("file:///appReviews.json") yield value
merge (ra:Reviewer{reviewerId:value.user_apple_id})
set ra.username = value.username
set ra.user_reviews_url = value.user_reviews_url