icon:: 📑

- ## Overview
	- Collection of research papers and literature reviews.
- ## All Papers
	- {{query (property :title "@")}}
	- # (Note: This simple query finds pages where title property starts with @, or just use a regex query)
	- {{query (page-property :title "@")}}
	- {{query (and (property :title) (re "@.*"))}}
	- query-table:: true
	- query-properties:: [:page :authors :journal]