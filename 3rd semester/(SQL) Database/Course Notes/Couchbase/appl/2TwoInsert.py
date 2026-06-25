import dataauth as da

# needed for any cluster connection
from couchbase.cluster import Cluster
from couchbase.auth import PasswordAuthenticator

# options for a cluster and SQL++ (N1QL) queries
from couchbase.options import ClusterOptions, QueryOptions

# get a reference to our cluster
cluster = Cluster.connect(da.servername, ClusterOptions(
  PasswordAuthenticator(da.username, da.password)))

bucket = cluster.bucket("travel-sample")
collection = bucket.default_collection()

# get a document
result = collection.get('airline_10')
print(result.content_as[dict])
res = result.value
print(res)
print(f"{res["name"]} is {res["type"]} with call sign: {res["callsign"]}")

print("\nInsert  ...")
document = {"foo": "bar", "bar": "foo"}
result = collection.insert("document-key", document)
cas = result.cas
# end::insert[]
print(result)
print(cas)

result = collection.get('document-key')
print(result.content_as[dict])
