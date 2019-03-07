(load "x.l")
(pool "ex.db")

# retrieve some stuff
(call 'wget "https://catalog.lansstyrelsen.se/store/2/resource/39")

# since it is ISO latin encoded we use iconv to read it
(setq *CurrentCsv (makeCsvIso
    "39"
    "CSV example, swedish county government decisions 2015-17"))

# show case categories
(uniqColNr> *CurrentCsv 3)

# check for vulnerabilities on your box with nmap
(de nmapExample ()
    (mapcar prinl (nmapVuln "localhost")))
