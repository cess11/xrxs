# Prelude
(class +Sous +Entity)
(rel nm (+Sn +Idx +String))
(rel sousa (+Ref +String))
(rel last (+List +String))
(rel chugs (+Joint) sous (+Chug))
(rel wrds (+List +String))

(dm dorun> ()
   (let L (make (in (list 'w3m (: sousa))(until (eof)(link (line T)))))
      (=: last (uniq (make (for X L (and
         (match '(@A ":" "/" "/" "w" "w" "w" "." @B "<" @C) (chop X))
         (link (pack "https://www." @B)))))))
      (mapcar '((X)(new! '(+Chug) 'sous This 'dta (make (in (list 'w3m X)(until (eof)(link (line T))))))) (: last)  ]

(dm clrchugs> ()
   (=: chugs NIL]

(class +Chug +Entity)
(rel sous (+Joint) chugs (+Sous))
(rel dta (+List +String))
(rel res (+List +String))


(de makeExample () (new! '(+Sous) 'nm "Aftonbladet Nyheter" 'sousa "https://www.aftonbladet.se/nyheter/rss.xml" ))
