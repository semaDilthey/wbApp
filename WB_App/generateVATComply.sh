MODULE="Modules/VATComplyAPI/Sources/VATComplyAPI"

openapi-generator generate -i "vatcomply.yaml" -g swift5 -o "vatcomply"
rm -r $MODULE""*
cp -R "vatcomply/OpenAPIClient/Classes/OpenAPIs/". $MODULE
rm -r "vatcomply"
