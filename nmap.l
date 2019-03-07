# nmap

(de nmapSimple (Url)
    (make
        (in (list "nmap" Url))))

(de nmapVuln (Url) 
    (make 
        (in (list "nmap" "--script" "vuln" Url))))
