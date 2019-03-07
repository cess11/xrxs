# csv 

# globals

(setq *DefDelim ";")

# E/R

(class +Csv +Entity)
(rel id (+Key +Number))
(rel nm (+String))
(rel hd (+List +String))
(rel dt (+List +String))
(rel pt (+List +Joint) cd (+Csv))
(rel cd (+List +Joint) pt (+Csv))

(dm uniqColNr> (Nr)
    (with This 
        (uniq
            (mapcar '((X)(get X Nr)) (: dt)))))

(dm countRows> ()
   (with This 
      (length (: dt))))

(dm writeFile> (File Delim)
    (default Delim ";")
    (with This
        (out File 
            (prinl (: hd))
            (for X (: dt)
                (prinl (glue Delim X))))))

# functions

(de newCsv (Lst Nm)
   (new! '(+Csv) 'id (genKey 'id '+Csv) 'hd (car Lst) 'dt (cdr Lst)))

(de readCsv (File Delim)
    (default Delim *DefDelim)
    (make 
        (in File 
            (until (eof)
                (link 
                    (mapcar pack (split (line) Delim)))))))

(de readCsvIso (File Delim)
    (default Delim *DefDelim)
    (make 
        (in (list "iconv" "-fISO-8859-1" "-tUTF-8" File)
            (until (eof)
                (link
                    (mapcar pack (split (line) Delim)))))))

(de makeCsv (File Nm Delim)
    (default Delim *DefDelim)
    (let Lst (readCsv File Delim)
        (newCsv Lst Nm)))


