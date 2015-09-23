class Seed
  def initialize
    create_user
    create_links
  end

  def create_user
    User.create(email: "mdub@gmail.com", password: "password")
  end

  def create_links
    user = User.find_by(email: "mdub@gmail.com")

    link1 = Link.new(url:"http://venturebeat.com/2015/09/23/datastax-partners-with-microsoft-to-improve-cassandra-on-azure/")
    link2 = Link.new(url:"http://www.producthunt.com/tech/ubercommute")
    link3 = Link.new(url:"http://venturebeat.com/")
    link4 = Link.new(url:"http://venturebeat.com/2015/09/23/microsoft-partners-with-baidu-to-push-windows-10-upgrades-in-china/", status: 1)
    link5 = Link.new(url:"http://venturebeat.com/2015/09/23/google-launches-beta-of-cloud-dataproc-a-managed-service-for-hadoop-and-spark/", status: 1)
    link6 = Link.new(url:"http://venturebeat.com/2015/09/23/pebble-unveils-new-pebble-time-round-smartwatch/", status: 1)

    user.links << link1
    user.links << link2
    user.links << link3
    user.links << link4
    user.links << link5
    user.links << link6
  end
end

Seed.new
