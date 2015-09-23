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

    link1 = Link.new(url:"https://gist.github.com/worace/0fa8052bfcf983e8722d")
    link2 = Link.new(url:"http://www.producthunt.com/tech/ubercommute")
    link3 = Link.new(url:"http://venturebeat.com/")
    link4 = Link.new(url:"http://github.com/", status: 1)
    link5 = Link.new(url:"http://soundcloud.com/", status: 1)
    link6 = Link.new(url:"http://reddit.com/", status: 1)

    user.links << link1
    user.links << link2
    user.links << link3
    user.links << link4
    user.links << link5
    user.links << link6
  end
end

Seed.new
