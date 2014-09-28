default['neo4j-server']['yum.url'] = 'http://yum.neo4j.org'
default['neo4j-server']['gpg.key.url'] = 'http://debian.neo4j.org/neotechnology.gpg.key'


default['neo4j-server']['cluster.name'] = nil

default['neo4j-server']['neo4j.server.properties']['org.neo4j.server.database.location'] = '/var/lib/neo4j'
default['neo4j-server']['neo4j.server.properties']['org.neo4j.server.db.tuning.properties'] = 'conf/neo4j.properties'
default['neo4j-server']['neo4j.server.properties']['org.neo4j.server.http.log.config'] = 'conf/neo4j-http-logging.xml'
default['neo4j-server']['neo4j.server.properties']['org.neo4j.server.http.log.enabled'] = 'true'
default['neo4j-server']['neo4j.server.properties']['org.neo4j.server.manage.console_engines'] = 'shell'
default['neo4j-server']['neo4j.server.properties']['org.neo4j.server.webadmin.data.uri'] = '/db/data/'
default['neo4j-server']['neo4j.server.properties']['org.neo4j.server.webadmin.management.uri'] = '/db/manage/'
default['neo4j-server']['neo4j.server.properties']['org.neo4j.server.webadmin.rrdb.location'] = 'data/rrd'
default['neo4j-server']['neo4j.server.properties']['org.neo4j.server.webserver.https.cert.location'] = 'conf/ssl/snakeoil.cert'
default['neo4j-server']['neo4j.server.properties']['org.neo4j.server.webserver.https.enabled'] = 'true'
default['neo4j-server']['neo4j.server.properties']['org.neo4j.server.webserver.https.key.location'] = 'conf/ssl/snakeoil.key'
default['neo4j-server']['neo4j.server.properties']['org.neo4j.server.webserver.https.keystore.location'] = 'data/keystore'
default['neo4j-server']['neo4j.server.properties']['org.neo4j.server.webserver.https.port'] = '7473'
default['neo4j-server']['neo4j.server.properties']['org.neo4j.server.webserver.port'] = '7474'
default['neo4j-server']['neo4j.server.properties']['org.neo4j.server.database.mode'] = 'single'

default['neo4j-server']['neo4j.properties']['org.neo4j.server.webserver.port'] = '7474'

default['neo4j-server']['sysconfig']['JAVA_OPTS'] = '-Xmx1024m'

if node['neo4j-server']['cluster.name'] 
  default['neo4j-server']['neo4j.server.properties']['org.neo4j.server.database.mode'] = 'HA' 
end
