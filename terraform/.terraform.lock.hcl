# This file is maintained automatically by "terraform init".
# Manual edits may be lost in future updates.

provider "registry.terraform.io/gavinbunney/kubectl" {
  version     = "1.19.0"
  constraints = ">= 1.14.0"
  hashes = [
    "h1:jTkF6nmuZvbXvl08L6iwe2RfV4PkPdy2Cnn+7aWkgu8=",
    "zh:1dec8766336ac5b00b3d8f62e3fff6390f5f60699c9299920fc9861a76f00c71",
    "zh:43f101b56b58d7fead6a511728b4e09f7c41dc2e3963f59cf1c146c4767c6cb7",
    "zh:4c4fbaa44f60e722f25cc05ee11dfaec282893c5c0ffa27bc88c382dbfbaa35c",
    "zh:51dd23238b7b677b8a1abbfcc7deec53ffa5ec79e58e3b54d6be334d3d01bc0e",
    "zh:5afc2ebc75b9d708730dbabdc8f94dd559d7f2fc5a31c5101358bd8d016916ba",
    "zh:6be6e72d4663776390a82a37e34f7359f726d0120df622f4a2b46619338a168e",
    "zh:72642d5fcf1e3febb6e5d4ae7b592bb9ff3cb220af041dbda893588e4bf30c0c",
    "zh:9b12af85486a96aedd8d7984b0ff811a4b42e3d88dad1a3fb4c0b580d04fa425",
    "zh:a1da03e3239867b35812ee031a1060fed6e8d8e458e2eaca48b5dd51b35f56f7",
    "zh:b98b6a6728fe277fcd133bdfa7237bd733eae233f09653523f14460f608f8ba2",
    "zh:bb8b071d0437f4767695c6158a3cb70df9f52e377c67019971d888b99147511f",
    "zh:dc89ce4b63bfef708ec29c17e85ad0232a1794336dc54dd88c3ba0b77e764f71",
    "zh:dd7dd18f1f8218c6cd19592288fde32dccc743cde05b9feeb2883f37c2ff4b4e",
    "zh:ec4bd5ab3872dedb39fe528319b4bba609306e12ee90971495f109e142d66310",
    "zh:f610ead42f724c82f5463e0e71fa735a11ffb6101880665d93f48b4a67b9ad82",
  ]
}

provider "registry.terraform.io/hashicorp/helm" {
  version     = "2.17.0"
  constraints = "~> 2.17.0"
  hashes = [
    "h1:rsqAO9oKyDMLiysQqrWEzf9CNtU9NJtwEGk7bSItC9g=",
    "zh:06fb4e9932f0afc1904d2279e6e99353c2ddac0d765305ce90519af410706bd4",
    "zh:104eccfc781fc868da3c7fec4385ad14ed183eb985c96331a1a937ac79c2d1a7",
    "zh:129345c82359837bb3f0070ce4891ec232697052f7d5ccf61d43d818912cf5f3",
    "zh:3956187ec239f4045975b35e8c30741f701aa494c386aaa04ebabffe7749f81c",
    "zh:66a9686d92a6b3ec43de3ca3fde60ef3d89fb76259ed3313ca4eb9bb8c13b7dd",
    "zh:88644260090aa621e7e8083585c468c8dd5e09a3c01a432fb05da5c4623af940",
    "zh:a248f650d174a883b32c5b94f9e725f4057e623b00f171936dcdcc840fad0b3e",
    "zh:aa498c1f1ab93be5c8fbf6d48af51dc6ef0f10b2ea88d67bcb9f02d1d80d3930",
    "zh:bf01e0f2ec2468c53596e027d376532a2d30feb72b0b5b810334d043109ae32f",
    "zh:c46fa84cc8388e5ca87eb575a534ebcf68819c5a5724142998b487cb11246654",
    "zh:d0c0f15ffc115c0965cbfe5c81f18c2e114113e7a1e6829f6bfd879ce5744fbb",
    "zh:f569b65999264a9416862bca5cd2a6177d94ccb0424f3a4ef424428912b9cb3c",
  ]
}

provider "registry.terraform.io/hashicorp/kubernetes" {
  version     = "2.36.0"
  constraints = "~> 2.36.0"
  hashes = [
    "h1:TvCIjwLJR9k2Y+h4fYrcz3aQSSbGjIux80X1g78ZoOE=",
    "zh:07f38fcb7578984a3e2c8cf0397c880f6b3eb2a722a120a08a634a607ea495ca",
    "zh:1adde61769c50dbb799d8bf8bfd5c8c504a37017dfd06c7820f82bcf44ca0d39",
    "zh:39707f23ab58fd0e686967c0f973c0f5a39c14d6ccfc757f97c345fdd0cd4624",
    "zh:4cc3dc2b5d06cc22d1c734f7162b0a8fdc61990ff9efb64e59412d65a7ccc92a",
    "zh:8382dcb82ba7303715b5e67939e07dd1c8ecddbe01d12f39b82b2b7d7357e1d9",
    "zh:88e8e4f90034186b8bfdea1b8d394621cbc46a064ff2418027e6dba6807d5227",
    "zh:a6276a75ad170f76d88263fdb5f9558998bf3a3f7650d7bd3387b396410e59f3",
    "zh:bc816c7e0606e5df98a0c7634b240bb0c8100c3107b8b17b554af702edc6a0c5",
    "zh:cb2f31d58f37020e840af52755c18afd1f09a833c4903ac59270ab440fab57b7",
    "zh:ee0d103b8d0089fb1918311683110b4492a9346f0471b136af46d3b019576b22",
    "zh:f569b65999264a9416862bca5cd2a6177d94ccb0424f3a4ef424428912b9cb3c",
    "zh:f688b9ec761721e401f6859c19c083e3be20a650426f4747cd359cdc079d212a",
  ]
}

provider "registry.terraform.io/hashicorp/null" {
  version     = "3.2.3"
  constraints = "~> 3.2.0"
  hashes = [
    "h1:zxoDtu918XPWJ/Y6s4aFrZydn6SfqkRc5Ax1ZLnC6Ew=",
    "zh:22d062e5278d872fe7aed834f5577ba0a5afe34a3bdac2b81f828d8d3e6706d2",
    "zh:23dead00493ad863729495dc212fd6c29b8293e707b055ce5ba21ee453ce552d",
    "zh:28299accf21763ca1ca144d8f660688d7c2ad0b105b7202554ca60b02a3856d3",
    "zh:55c9e8a9ac25a7652df8c51a8a9a422bd67d784061b1de2dc9fe6c3cb4e77f2f",
    "zh:756586535d11698a216291c06b9ed8a5cc6a4ec43eee1ee09ecd5c6a9e297ac1",
    "zh:78d5eefdd9e494defcb3c68d282b8f96630502cac21d1ea161f53cfe9bb483b3",
    "zh:9d5eea62fdb587eeb96a8c4d782459f4e6b73baeece4d04b4a40e44faaee9301",
    "zh:a6355f596a3fb8fc85c2fb054ab14e722991533f87f928e7169a486462c74670",
    "zh:b5a65a789cff4ada58a5baffc76cb9767dc26ec6b45c00d2ec8b1b027f6db4ed",
    "zh:db5ab669cf11d0e9f81dc380a6fdfcac437aea3d69109c7aef1a5426639d2d65",
    "zh:de655d251c470197bcbb5ac45d289595295acb8f829f6c781d4a75c8c8b7c7dd",
    "zh:f5c68199f2e6076bce92a12230434782bf768103a427e9bb9abee99b116af7b5",
  ]
}
