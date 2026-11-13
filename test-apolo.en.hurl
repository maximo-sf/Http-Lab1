#
# Test `weblab-1` assignment.
#
# Usage:
#
#     hurl --test --variable site=domain test-apolo.en.hurl
#
# Usage without a DNS Server:
# 
#     hurl --test --variable site=domain --resolve host:port:ip test-apolo.en.hurl
#
# Example:
#
#     hurl --test --variable site=olimpo.test test-apolo.en.hurl
#
# Example without a DNS Server:
#
#     hurl --test \
#       --variable site=olimpo.test \
#       --resolve apolo.olimpo.test:80:192.168.57.11 \
#       test-apolo.en.hurl
#
# Author: Fernando Raya
# Email: fraya@ieszaidinvergeles.org
#

GET http://apolo.olimpo.test
HTTP 200

GET http://apolo.olimpo.test/apolo.html
HTTP 200

GET http://apolo.olimpo.test/index.html
HTTP 404
[Asserts]
body contains "Resource not found on apolo.olimpo.test"

GET http://apolo.olimpo.test/404.html
HTTP 404
[Asserts]
body contains "Resource not found on apolo.olimpo.test"

GET http://atenea.olimpo.test/soyuz.html
HTTP 200
[Asserts]
body contains "<h1>Soyuz site</h1>"

GET http://atenea.olimpo.test
HTTP 403
[Asserts]
body contains "You do not have permission to access apolo.olimpo.test"

GET http://atenea.olimpo.test/index.html
HTTP 404
[Asserts]
body contains "Resource not found on atenea.olimpo.test"

GET http://atenea.olimpo.test/messages/
HTTP 403
[Asserts]
body contains "You do not have permission"
