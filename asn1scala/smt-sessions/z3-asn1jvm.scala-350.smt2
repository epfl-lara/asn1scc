; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8262 () Bool)

(assert start!8262)

(declare-fun b!41241 () Bool)

(declare-fun e!27295 () Bool)

(declare-fun e!27291 () Bool)

(assert (=> b!41241 (= e!27295 (not e!27291))))

(declare-fun res!35094 () Bool)

(assert (=> b!41241 (=> res!35094 e!27291)))

(declare-fun lt!62509 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!41241 (= res!35094 (or (bvslt i!635 to!314) (not (= lt!62509 (bvsub (bvadd lt!62509 to!314) i!635)))))))

(declare-datatypes ((array!2065 0))(
  ( (array!2066 (arr!1431 (Array (_ BitVec 32) (_ BitVec 8))) (size!932 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1608 0))(
  ( (BitStream!1609 (buf!1260 array!2065) (currentByte!2703 (_ BitVec 32)) (currentBit!2698 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1608)

(declare-fun isPrefixOf!0 (BitStream!1608 BitStream!1608) Bool)

(assert (=> b!41241 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2912 0))(
  ( (Unit!2913) )
))
(declare-fun lt!62508 () Unit!2912)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1608) Unit!2912)

(assert (=> b!41241 (= lt!62508 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41241 (= lt!62509 (bitIndex!0 (size!932 (buf!1260 thiss!1379)) (currentByte!2703 thiss!1379) (currentBit!2698 thiss!1379)))))

(declare-fun res!35093 () Bool)

(assert (=> start!8262 (=> (not res!35093) (not e!27295))))

(declare-fun srcBuffer!2 () array!2065)

(assert (=> start!8262 (= res!35093 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!932 srcBuffer!2))))))))

(assert (=> start!8262 e!27295))

(assert (=> start!8262 true))

(declare-fun array_inv!857 (array!2065) Bool)

(assert (=> start!8262 (array_inv!857 srcBuffer!2)))

(declare-fun e!27293 () Bool)

(declare-fun inv!12 (BitStream!1608) Bool)

(assert (=> start!8262 (and (inv!12 thiss!1379) e!27293)))

(declare-fun b!41242 () Bool)

(declare-fun res!35092 () Bool)

(assert (=> b!41242 (=> (not res!35092) (not e!27295))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41242 (= res!35092 (validate_offset_bits!1 ((_ sign_extend 32) (size!932 (buf!1260 thiss!1379))) ((_ sign_extend 32) (currentByte!2703 thiss!1379)) ((_ sign_extend 32) (currentBit!2698 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41243 () Bool)

(assert (=> b!41243 (= e!27293 (array_inv!857 (buf!1260 thiss!1379)))))

(declare-fun b!41244 () Bool)

(assert (=> b!41244 (= e!27291 true)))

(declare-datatypes ((tuple2!3950 0))(
  ( (tuple2!3951 (_1!2062 array!2065) (_2!2062 BitStream!1608)) )
))
(declare-fun lt!62507 () tuple2!3950)

(declare-fun readBits!0 (BitStream!1608 (_ BitVec 64)) tuple2!3950)

(declare-datatypes ((tuple2!3952 0))(
  ( (tuple2!3953 (_1!2063 BitStream!1608) (_2!2063 BitStream!1608)) )
))
(declare-fun reader!0 (BitStream!1608 BitStream!1608) tuple2!3952)

(assert (=> b!41244 (= lt!62507 (readBits!0 (_1!2063 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41245 () Bool)

(declare-fun res!35091 () Bool)

(assert (=> b!41245 (=> res!35091 e!27291)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41245 (= res!35091 (not (invariant!0 (currentBit!2698 thiss!1379) (currentByte!2703 thiss!1379) (size!932 (buf!1260 thiss!1379)))))))

(assert (= (and start!8262 res!35093) b!41242))

(assert (= (and b!41242 res!35092) b!41241))

(assert (= (and b!41241 (not res!35094)) b!41245))

(assert (= (and b!41245 (not res!35091)) b!41244))

(assert (= start!8262 b!41243))

(declare-fun m!62907 () Bool)

(assert (=> b!41243 m!62907))

(declare-fun m!62909 () Bool)

(assert (=> b!41245 m!62909))

(declare-fun m!62911 () Bool)

(assert (=> b!41244 m!62911))

(declare-fun m!62913 () Bool)

(assert (=> b!41244 m!62913))

(declare-fun m!62915 () Bool)

(assert (=> start!8262 m!62915))

(declare-fun m!62917 () Bool)

(assert (=> start!8262 m!62917))

(declare-fun m!62919 () Bool)

(assert (=> b!41241 m!62919))

(declare-fun m!62921 () Bool)

(assert (=> b!41241 m!62921))

(declare-fun m!62923 () Bool)

(assert (=> b!41241 m!62923))

(declare-fun m!62925 () Bool)

(assert (=> b!41242 m!62925))

(check-sat (not b!41241) (not b!41242) (not start!8262) (not b!41245) (not b!41244) (not b!41243))
