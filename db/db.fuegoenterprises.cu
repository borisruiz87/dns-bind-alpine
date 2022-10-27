; base zone file for fuegoenterprises.cu
$TTL 2d    ; default TTL for zone
$ORIGIN fuegoenterprises.cu. ; base domain-name
; Start of Authority RR defining the key characteristics of the zone (domain)
@         IN      SOA   ns1.fuegoenterprises.cu. admin.fuegoenterprises.cu. (
                                2022101800 ; serial number
                                12h        ; refresh
                                15m        ; update retry
                                3w         ; expiry
                                2h         ; minimum
                                )
; name server RR for the domain
           IN      NS      ns1.fuegoenterprises.cu.

; mail server RRs for the zone (domain)
           IN      MX  10  mail.othar.cu.
  
; spf
           IN	   TXT	"v=spf1 a:mail.othar.cu ip4:152.206.119.139/32 mx -all"
  
; RR type A
ns1        IN      A       152.206.119.139

; dkim
20221026._domainkey	IN	TXT	( "v=DKIM1; k=rsa; "
                             "p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA3oGV3nLGcWSB2EdxsLUg1bQ18URHa371sX9i080hGkvqa+HijlLajY60B7PhHXYc8bJPVWb5vczV/chU59bpU0UqQ/NKjvZY62N3r+ZgZWB6wZ8ed7x6V6bjV1HdHom8eAjpeLhMiEYbeVTD5U8G3ZwkzdxXG3FeCoQK2zVjCfjovyxG1+/o8mnC7GEJ4BYli/YmN8S6rEhcnP"
                             "na74Q4lPogxqIwN27NqxcKeNuWVy6UR8cyUwBsGaue2pj4mlQEZDud+ncCsU9HWLZ3RUpwnC7yIf9xhJ01yIPFKLZt6TPfcgNm0UCPxoi5PL3XIbVhjO/2iyfps76TxMFs5IATrwIDAQAB" )  ; ----- DKIM key 20221026 for fuegoenterprises.cu
                             
