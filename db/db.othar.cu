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
	
; spf
           IN	   TXT	"v=spf1 a:mail.othar.cu ip4:152.206.119.139/32 mx -all"
		   
; RR type A
ns1        IN      A       152.206.119.139
mail       IN      A       190.6.81.70

; dkim
20221021._domainkey	IN	TXT	( "v=DKIM1; k=rsa; "
					 "p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAztk18Cx+VJLu8YQcOjOGdDJOr/lMVEz6g1gTBqMblWjWV1L1lc+qI1/5CIje7nKiEWoLuAwsI7QkFhGcX7iWbZfI9R1jsMRVgCAXSKTWPv1W8/Ckmk9oxf+82NT2i2oQFWfbbCMmfhtFSv/ADq8SSUBGPRlA4klmTfIvAgvvpiV5NxcjNKUXL9hPh+YDyLt24lpT9OJ4nPu/cA"
					 "o0Ayafd3o2OOZppGz6ncvMuqM0HBNJfLFsz0bcZ3vPQu6LLExP9ZmJjFCIguKj2KUcmvl37LnwQNa+xauPaIe1F5aN58GdvT9/K/odOpNJq5p43NLqUazrgNB7fxa1Rp9HgGCUxQIDAQAB" )  ; ----- DKIM key 20221021 for othar.cu

			
