# nmap

(de nmapSimple (Url)
    (make
        (in (list "nmap" Url)
            (until (eof)
                (link (line T))))))

(de nmapVuln (Url) 
    (make 
        (in (list "nmap" "--script" "vuln" Url)
            (until (eof)
                (link (line T))))))
