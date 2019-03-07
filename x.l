
(load "csv.l")
(load "nmap.l")

# classes 

(class +Source +Entity)
(rel id (+Key +Number))
(rel nm (+String))
(rel cmd (+String))

(class +Collection +Entity)
(rel id (+Key +Number))
(rel nm (+String))
(rel jt (+List +Joint) jt (+Datta))

(class +Datta +Entity)
(rel id (+Key +Number))
(rel ct (+String)) 
(rel dt (+Any))
(rel jt (+Joint) jt (+Collection))

# swedish administration

(class +Lan +Entity)
(rel id (+Key +Number))
(rel nm (+String))
(rel cd (+String))
(rel nr (+String))
(rel cs (+List +Link) (+Collection))

# functions
(de newLan (Nm Code Nr) 
   (new! '(+Lan) 
      'id (genKey 'id '+Lan) 
      'nm Nm
      'cd Code
      'nr Nr)
   (commit 'upd))

(de w3mhtml (Url) 
   (make 
      (in (list 'w3m Url)
         (until (eof) 
            (link 
               (pack (line)))))))
(de w3msrc (Url) 
   (make 
      (in (list 'w3m "-dump_source" Url)
         (until (eof) 
            (link 
               (pack (line)))))))


(de dbupd ()
    ())
