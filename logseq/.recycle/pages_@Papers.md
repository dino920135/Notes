icon:: 📑

- {{renderer :tocgen2}}
- ## Overview
	- Collection of research papers and literature reviews.
- ## All Papers
	- query-sort-by:: exclude-in-graph
	  query-sort-desc:: false
	  query-properties:: [:page :url :links :created-at :updated-at :exclude-in-graph]
	  #+BEGIN_QUERY
	  {
	  :title "All Papers"
	  :query [:find (pull ?p [*])
	          :where
	          [?p :block/name ?name]
	          [(clojure.string/starts-with? ?name "@")]
	          [?p :block/properties ?props]
	          [(get ?props :url)]]
	  :table-view? true
	  }
	  #+END_QUERY