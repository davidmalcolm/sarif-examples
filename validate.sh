for f in $(find valid/2.1.0 -name *.sarif) ; do
    echo $f
    check-jsonschema --schemafile schemata/sarif-schema-2.1.0.json $f
done

for f in $(find valid/2.2-experimental -name *.sarif) ; do
    echo $f
    check-jsonschema --schemafile schemata/sarif-schema-2.2-prerelease-2024-08-08.json $f
done
