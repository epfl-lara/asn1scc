; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8258 () Bool)

(assert start!8258)

(declare-fun b!41212 () Bool)

(declare-fun e!27265 () Bool)

(assert (=> b!41212 (= e!27265 true)))

(declare-datatypes ((array!2061 0))(
  ( (array!2062 (arr!1429 (Array (_ BitVec 32) (_ BitVec 8))) (size!930 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1604 0))(
  ( (BitStream!1605 (buf!1258 array!2061) (currentByte!2701 (_ BitVec 32)) (currentBit!2696 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3942 0))(
  ( (tuple2!3943 (_1!2058 array!2061) (_2!2058 BitStream!1604)) )
))
(declare-fun lt!62491 () tuple2!3942)

(declare-fun thiss!1379 () BitStream!1604)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun readBits!0 (BitStream!1604 (_ BitVec 64)) tuple2!3942)

(declare-datatypes ((tuple2!3944 0))(
  ( (tuple2!3945 (_1!2059 BitStream!1604) (_2!2059 BitStream!1604)) )
))
(declare-fun reader!0 (BitStream!1604 BitStream!1604) tuple2!3944)

(assert (=> b!41212 (= lt!62491 (readBits!0 (_1!2059 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41213 () Bool)

(declare-fun res!35069 () Bool)

(declare-fun e!27263 () Bool)

(assert (=> b!41213 (=> (not res!35069) (not e!27263))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41213 (= res!35069 (validate_offset_bits!1 ((_ sign_extend 32) (size!930 (buf!1258 thiss!1379))) ((_ sign_extend 32) (currentByte!2701 thiss!1379)) ((_ sign_extend 32) (currentBit!2696 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41214 () Bool)

(assert (=> b!41214 (= e!27263 (not e!27265))))

(declare-fun res!35067 () Bool)

(assert (=> b!41214 (=> res!35067 e!27265)))

(declare-fun lt!62490 () (_ BitVec 64))

(assert (=> b!41214 (= res!35067 (or (bvslt i!635 to!314) (not (= lt!62490 (bvsub (bvadd lt!62490 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1604 BitStream!1604) Bool)

(assert (=> b!41214 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2908 0))(
  ( (Unit!2909) )
))
(declare-fun lt!62489 () Unit!2908)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1604) Unit!2908)

(assert (=> b!41214 (= lt!62489 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41214 (= lt!62490 (bitIndex!0 (size!930 (buf!1258 thiss!1379)) (currentByte!2701 thiss!1379) (currentBit!2696 thiss!1379)))))

(declare-fun b!41215 () Bool)

(declare-fun res!35070 () Bool)

(assert (=> b!41215 (=> res!35070 e!27265)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41215 (= res!35070 (not (invariant!0 (currentBit!2696 thiss!1379) (currentByte!2701 thiss!1379) (size!930 (buf!1258 thiss!1379)))))))

(declare-fun b!41211 () Bool)

(declare-fun e!27262 () Bool)

(declare-fun array_inv!855 (array!2061) Bool)

(assert (=> b!41211 (= e!27262 (array_inv!855 (buf!1258 thiss!1379)))))

(declare-fun res!35068 () Bool)

(assert (=> start!8258 (=> (not res!35068) (not e!27263))))

(declare-fun srcBuffer!2 () array!2061)

(assert (=> start!8258 (= res!35068 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!930 srcBuffer!2))))))))

(assert (=> start!8258 e!27263))

(assert (=> start!8258 true))

(assert (=> start!8258 (array_inv!855 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1604) Bool)

(assert (=> start!8258 (and (inv!12 thiss!1379) e!27262)))

(assert (= (and start!8258 res!35068) b!41213))

(assert (= (and b!41213 res!35069) b!41214))

(assert (= (and b!41214 (not res!35067)) b!41215))

(assert (= (and b!41215 (not res!35070)) b!41212))

(assert (= start!8258 b!41211))

(declare-fun m!62867 () Bool)

(assert (=> b!41215 m!62867))

(declare-fun m!62869 () Bool)

(assert (=> start!8258 m!62869))

(declare-fun m!62871 () Bool)

(assert (=> start!8258 m!62871))

(declare-fun m!62873 () Bool)

(assert (=> b!41211 m!62873))

(declare-fun m!62875 () Bool)

(assert (=> b!41214 m!62875))

(declare-fun m!62877 () Bool)

(assert (=> b!41214 m!62877))

(declare-fun m!62879 () Bool)

(assert (=> b!41214 m!62879))

(declare-fun m!62881 () Bool)

(assert (=> b!41213 m!62881))

(declare-fun m!62883 () Bool)

(assert (=> b!41212 m!62883))

(declare-fun m!62885 () Bool)

(assert (=> b!41212 m!62885))

(push 1)

(assert (not start!8258))

(assert (not b!41214))

(assert (not b!41213))

(assert (not b!41211))

(assert (not b!41212))

(assert (not b!41215))

