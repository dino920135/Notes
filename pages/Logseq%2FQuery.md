#logseq #note #query

Logseq provides two ways to find and display data: **Simple Queries** and **Advanced Queries**.

## Simple Queries
Simple queries are easy to write and suitable for basic filtering.
- **Syntax**: `{{query (and (property key value) "string")}}`
- **Common Operators**:
	- `(and ...)`: Matches all conditions.
	- `(or ...)`: Matches any condition.
	- `(not ...)`: Excludes conditions.
	- `(property key value)`: Filters by block/page properties.
	- `(page "name")`: Filters by page title (substring match).
	- `(tag name)`: Filters by tags.

## Advanced Queries (Datalog)
Advanced queries use the Datalog language to perform complex database lookups. They are more powerful and robust than simple queries.
- **Example (Finding pages starting with @ with a URL property)**:
  ```clojure
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
  ```
- **Structure**:
	- `:title`: The header displayed above the results.
	- `:query`: The core Datalog logic.
	- `:find (pull ?p [*])`: Instructs Logseq to retrieve the full content of the matched entities.
	- `:where`: The conditions that define the search criteria.
	- `:table-view? true`: Displays the results in a table format.

## Useful Resources
- [Logseq Query Documentation](https://docs.logseq.com/#/page/queries)
- [Logseq Advanced Queries Guide](https://docs.logseq.com/#/page/advanced%20queries)