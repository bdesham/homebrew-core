require "language/node"

class Jhipster < Formula
  desc "Generate, develop and deploy Spring Boot + Angular/React applications"
  homepage "https://www.jhipster.tech/"
  url "https://registry.npmjs.org/generator-jhipster/-/generator-jhipster-6.1.1.tgz"
  sha256 "712c6d40ed8e4ca6f0c86300a32ba097c4ff630e1b87929314c54d9f8660893f"

  bottle do
    cellar :any_skip_relocation
    sha256 "69cae2bfd371cf576fa6e0884ba70d94f09fd49d21c690b158fb41869c3f9c95" => :mojave
    sha256 "4f15a1b0c7928cf059634d32e47fee340a772b60d155cc69f370d97f25cac6be" => :high_sierra
    sha256 "403109affa011dfad5202c16913179b2b26e434d3b0f1015a4b24773eba6359d" => :sierra
  end

  depends_on :java => "1.8+"
  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "execution is complete", shell_output("#{bin}/jhipster info")
  end
end
