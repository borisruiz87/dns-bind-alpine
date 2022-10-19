; base zone file for othar.cu
$TTL 2d    ; default TTL for zone
$ORIGIN othar.cu. ; base domain-name
; Start of Authority RR defining the key characteristics of the zone (domain)
@         IN      SOA   ns1.othar.cu. admin.othar.cu. (
                                2022101800 ; serial number
                                12h        ; refresh
                                15m        ; update retry
                                3w         ; expiry
                                2h         ; minimum
                                )
; name server RR for the domain
           IN      NS      ns1.othar.cu.

; mail server RRs for the zone (domain)
           IN      MX  10  mail.othar.cu.
		   
; RR type A
ns1        IN      A       152.206.119.139
mail       IN      A       190.6.81.70
