import dataauth as da

# needed for any cluster connection
from couchbase.cluster import Cluster
from couchbase.auth import PasswordAuthenticator

# options for a cluster and SQL++ (N1QL) queries
from couchbase.options import ClusterOptions, QueryOptions

# get a reference to our cluster
cluster = Cluster.connect(da.servername, ClusterOptions(
  PasswordAuthenticator(da.username, da.password)))

bucket_name = "travel-sample"
# get a reference to our bucket
cb = cluster.bucket('travel-sample')

# get a reference to the default collection
cb_coll = cb.default_collection()

# get a document
result = cb_coll.get('airline_10')
print(result.content_as[dict])
res = result.value
print(res)
print(f"{res["name"]} is {res["type"]} with call sign: {res["callsign"]}")


