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

print("\nUpsert  ...")
try:
  # tag::durability[]
  # Upsert with Durability (Couchbase Server >= 6.5) level Majority
  document = {'id': 111, 'type': 'airline', 'name': 'Tarom', \
    'iata': 'RO', 'icao': 'ROT', 'callsign': 'Tar-Rom', 'country': 'Romania'}
#  opts = UpsertOptions(durability=ServerDurability(Durability.MAJORITY))
  result = collection.upsert("111", document, expiry=timedelta(seconds=300))
  # end::durability[]
except CouchbaseException as ex:
    # we expect an exception on local/test host, as Durability requirement
    # requires appropriately configured cluster
  pass
