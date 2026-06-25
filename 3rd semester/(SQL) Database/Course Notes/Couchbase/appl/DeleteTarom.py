import dataauth as da

# needed for any cluster connection
from datetime import timedelta
from couchbase.cluster import Cluster
from couchbase.auth import PasswordAuthenticator

# options for a cluster and SQL++ (N1QL) queries
from couchbase.options import ClusterOptions, QueryOptions
from couchbase.options import ReplaceOptions
from couchbase.exceptions import CouchbaseException, CASMismatchException

# get a reference to our cluster
cluster = Cluster.connect(da.servername, ClusterOptions(
  PasswordAuthenticator(da.username, da.password)))

bucket = cluster.bucket("travel-sample")
collection = bucket.default_collection()

print("\nDelete  ...")
# remove document with options
result = collection.remove("101")
