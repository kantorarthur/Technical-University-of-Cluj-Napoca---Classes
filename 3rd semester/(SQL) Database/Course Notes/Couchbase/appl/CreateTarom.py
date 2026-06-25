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

print("\nCreate  ...")
document = {'id': 101, 'type': 'airline', 'name': 'Tarom', \
    'iata': 'RO', 'icao': 'ROT', 'callsign': 'Tar-Rom', 'country': 'Romania'}
result = collection.insert("101", document)
cas = result.cas
# end::insert[]
