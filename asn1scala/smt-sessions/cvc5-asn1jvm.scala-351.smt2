; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8266 () Bool)

(assert start!8266)

(declare-fun b!41271 () Bool)

(declare-fun e!27325 () Bool)

(declare-fun e!27321 () Bool)

(assert (=> b!41271 (= e!27325 (not e!27321))))

(declare-fun res!35117 () Bool)

(assert (=> b!41271 (=> res!35117 e!27321)))

(declare-fun lt!62526 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!41271 (= res!35117 (or (bvslt i!635 to!314) (not (= lt!62526 (bvsub (bvadd lt!62526 to!314) i!635)))))))

(declare-datatypes ((array!2069 0))(
  ( (array!2070 (arr!1433 (Array (_ BitVec 32) (_ BitVec 8))) (size!934 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1612 0))(
  ( (BitStream!1613 (buf!1262 array!2069) (currentByte!2705 (_ BitVec 32)) (currentBit!2700 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1612)

(declare-fun isPrefixOf!0 (BitStream!1612 BitStream!1612) Bool)

(assert (=> b!41271 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2916 0))(
  ( (Unit!2917) )
))
(declare-fun lt!62527 () Unit!2916)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1612) Unit!2916)

(assert (=> b!41271 (= lt!62527 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41271 (= lt!62526 (bitIndex!0 (size!934 (buf!1262 thiss!1379)) (currentByte!2705 thiss!1379) (currentBit!2700 thiss!1379)))))

(declare-fun b!41272 () Bool)

(declare-fun res!35115 () Bool)

(assert (=> b!41272 (=> (not res!35115) (not e!27325))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41272 (= res!35115 (validate_offset_bits!1 ((_ sign_extend 32) (size!934 (buf!1262 thiss!1379))) ((_ sign_extend 32) (currentByte!2705 thiss!1379)) ((_ sign_extend 32) (currentBit!2700 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41273 () Bool)

(assert (=> b!41273 (= e!27321 true)))

(declare-datatypes ((tuple2!3958 0))(
  ( (tuple2!3959 (_1!2066 array!2069) (_2!2066 BitStream!1612)) )
))
(declare-fun lt!62525 () tuple2!3958)

(declare-fun readBits!0 (BitStream!1612 (_ BitVec 64)) tuple2!3958)

(declare-datatypes ((tuple2!3960 0))(
  ( (tuple2!3961 (_1!2067 BitStream!1612) (_2!2067 BitStream!1612)) )
))
(declare-fun reader!0 (BitStream!1612 BitStream!1612) tuple2!3960)

(assert (=> b!41273 (= lt!62525 (readBits!0 (_1!2067 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!35118 () Bool)

(assert (=> start!8266 (=> (not res!35118) (not e!27325))))

(declare-fun srcBuffer!2 () array!2069)

(assert (=> start!8266 (= res!35118 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!934 srcBuffer!2))))))))

(assert (=> start!8266 e!27325))

(assert (=> start!8266 true))

(declare-fun array_inv!859 (array!2069) Bool)

(assert (=> start!8266 (array_inv!859 srcBuffer!2)))

(declare-fun e!27323 () Bool)

(declare-fun inv!12 (BitStream!1612) Bool)

(assert (=> start!8266 (and (inv!12 thiss!1379) e!27323)))

(declare-fun b!41274 () Bool)

(declare-fun res!35116 () Bool)

(assert (=> b!41274 (=> res!35116 e!27321)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41274 (= res!35116 (not (invariant!0 (currentBit!2700 thiss!1379) (currentByte!2705 thiss!1379) (size!934 (buf!1262 thiss!1379)))))))

(declare-fun b!41275 () Bool)

(assert (=> b!41275 (= e!27323 (array_inv!859 (buf!1262 thiss!1379)))))

(assert (= (and start!8266 res!35118) b!41272))

(assert (= (and b!41272 res!35115) b!41271))

(assert (= (and b!41271 (not res!35117)) b!41274))

(assert (= (and b!41274 (not res!35116)) b!41273))

(assert (= start!8266 b!41275))

(declare-fun m!62947 () Bool)

(assert (=> start!8266 m!62947))

(declare-fun m!62949 () Bool)

(assert (=> start!8266 m!62949))

(declare-fun m!62951 () Bool)

(assert (=> b!41271 m!62951))

(declare-fun m!62953 () Bool)

(assert (=> b!41271 m!62953))

(declare-fun m!62955 () Bool)

(assert (=> b!41271 m!62955))

(declare-fun m!62957 () Bool)

(assert (=> b!41272 m!62957))

(declare-fun m!62959 () Bool)

(assert (=> b!41273 m!62959))

(declare-fun m!62961 () Bool)

(assert (=> b!41273 m!62961))

(declare-fun m!62963 () Bool)

(assert (=> b!41274 m!62963))

(declare-fun m!62965 () Bool)

(assert (=> b!41275 m!62965))

(push 1)

(assert (not b!41271))

(assert (not b!41273))

(assert (not b!41275))

(assert (not b!41272))

(assert (not start!8266))

(assert (not b!41274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

