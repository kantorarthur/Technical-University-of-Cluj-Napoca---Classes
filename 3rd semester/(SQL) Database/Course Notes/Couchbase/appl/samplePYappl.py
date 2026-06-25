# needed for any cluster connection
from couchbase.cluster import Cluster
from couchbase.auth import PasswordAuthenticator

# options for a cluster and SQL++ (N1QL) queries
from couchbase.options import ClusterOptions, QueryOptions

# get a reference to our cluster
cluster = Cluster.connect('couchbase://localhost', ClusterOptions(
  PasswordAuthenticator('Administrator', 'password')))
  # get a reference to our bucket
cb = cluster.bucket('travel-sample')

# get a reference to the default collection
cb_coll = cb.default_collection()

# get a document
result = cb_coll.get('airline_10')
print(result.content_as[dict])

# using SQL++ (a.k.a N1QL)
call_sign = 'CBS'
sql_query = 'SELECT VALUE name FROM `travel-sample` WHERE type = "airline" AND callsign = $1'
query_res = cluster.query(sql_query, QueryOptions(positional_parameters=[call_sign]))
for row in query_res:
    print(row)
