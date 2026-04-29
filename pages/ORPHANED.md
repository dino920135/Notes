- #+BEGIN_QUERY
  {:title "Orphaned Pages"
   :query [:find (pull ?p [*])
           :where
           [?p :block/name _]
           (not [?p :block/journal? true])
           (not [_ :block/path-refs ?p])]}
  #+END_QUERY