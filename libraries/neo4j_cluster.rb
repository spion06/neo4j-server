
module Neo4jClusterUtils
  def get_cluster_members
    cluster_members = Array.new
    search(:node, "neo4j-server_cluster.name:#{node['neo4j-server']['cluster.name']}").each do |search_node|
      cluster_members << search_node['fqdn'].to_s if search_node.run_list.expand(search_node.chef_environment).recipes.include?("neo4j-server")
    end
    return cluster_members
  end
  def get_server_id
    server_ids = Array.new
    server_id = node['neo4j-server']['neo4j.properties']['ha.server_id'] if node['neo4j-server']['neo4j.properties']['ha.server_id']
    if server_id.nil?
      search(:node, "neo4j-server_cluster.name:#{node['neo4j-server']['cluster.name']}").each do |search_node|
        server_ids << search_node['neo4j-server']['neo4j.properties']['ha.server_id'].to_i if search_node['neo4j-server']['neo4j.properties']['ha.server_id']
      end
      if server_ids.empty?
        server_id = 1
      else
        server_id = server_ids.zip.max[0].to_i + 1
      end
    end
    return server_id
  end
end

class Chef::Recipe ; include Neo4jClusterUtils ; end
class Chef::Resource ; include Neo4jClusterUtils ; end
