; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8272 () Bool)

(assert start!8272)

(declare-fun b!41316 () Bool)

(declare-fun e!27366 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!41316 (= e!27366 (or (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-datatypes ((array!2075 0))(
  ( (array!2076 (arr!1436 (Array (_ BitVec 32) (_ BitVec 8))) (size!937 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1618 0))(
  ( (BitStream!1619 (buf!1265 array!2075) (currentByte!2708 (_ BitVec 32)) (currentBit!2703 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3970 0))(
  ( (tuple2!3971 (_1!2072 array!2075) (_2!2072 BitStream!1618)) )
))
(declare-fun lt!62553 () tuple2!3970)

(declare-fun thiss!1379 () BitStream!1618)

(declare-fun readBits!0 (BitStream!1618 (_ BitVec 64)) tuple2!3970)

(declare-datatypes ((tuple2!3972 0))(
  ( (tuple2!3973 (_1!2073 BitStream!1618) (_2!2073 BitStream!1618)) )
))
(declare-fun reader!0 (BitStream!1618 BitStream!1618) tuple2!3972)

(assert (=> b!41316 (= lt!62553 (readBits!0 (_1!2073 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!35151 () Bool)

(declare-fun e!27367 () Bool)

(assert (=> start!8272 (=> (not res!35151) (not e!27367))))

(declare-fun srcBuffer!2 () array!2075)

(assert (=> start!8272 (= res!35151 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!937 srcBuffer!2))))))))

(assert (=> start!8272 e!27367))

(assert (=> start!8272 true))

(declare-fun array_inv!862 (array!2075) Bool)

(assert (=> start!8272 (array_inv!862 srcBuffer!2)))

(declare-fun e!27370 () Bool)

(declare-fun inv!12 (BitStream!1618) Bool)

(assert (=> start!8272 (and (inv!12 thiss!1379) e!27370)))

(declare-fun b!41317 () Bool)

(declare-fun res!35152 () Bool)

(assert (=> b!41317 (=> (not res!35152) (not e!27367))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41317 (= res!35152 (validate_offset_bits!1 ((_ sign_extend 32) (size!937 (buf!1265 thiss!1379))) ((_ sign_extend 32) (currentByte!2708 thiss!1379)) ((_ sign_extend 32) (currentBit!2703 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41318 () Bool)

(assert (=> b!41318 (= e!27367 (not e!27366))))

(declare-fun res!35153 () Bool)

(assert (=> b!41318 (=> res!35153 e!27366)))

(declare-fun lt!62554 () (_ BitVec 64))

(assert (=> b!41318 (= res!35153 (or (bvslt i!635 to!314) (not (= lt!62554 (bvsub (bvadd lt!62554 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1618 BitStream!1618) Bool)

(assert (=> b!41318 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2922 0))(
  ( (Unit!2923) )
))
(declare-fun lt!62552 () Unit!2922)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1618) Unit!2922)

(assert (=> b!41318 (= lt!62552 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41318 (= lt!62554 (bitIndex!0 (size!937 (buf!1265 thiss!1379)) (currentByte!2708 thiss!1379) (currentBit!2703 thiss!1379)))))

(declare-fun b!41319 () Bool)

(declare-fun res!35154 () Bool)

(assert (=> b!41319 (=> res!35154 e!27366)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41319 (= res!35154 (not (invariant!0 (currentBit!2703 thiss!1379) (currentByte!2708 thiss!1379) (size!937 (buf!1265 thiss!1379)))))))

(declare-fun b!41320 () Bool)

(assert (=> b!41320 (= e!27370 (array_inv!862 (buf!1265 thiss!1379)))))

(assert (= (and start!8272 res!35151) b!41317))

(assert (= (and b!41317 res!35152) b!41318))

(assert (= (and b!41318 (not res!35153)) b!41319))

(assert (= (and b!41319 (not res!35154)) b!41316))

(assert (= start!8272 b!41320))

(declare-fun m!63007 () Bool)

(assert (=> b!41318 m!63007))

(declare-fun m!63009 () Bool)

(assert (=> b!41318 m!63009))

(declare-fun m!63011 () Bool)

(assert (=> b!41318 m!63011))

(declare-fun m!63013 () Bool)

(assert (=> b!41316 m!63013))

(declare-fun m!63015 () Bool)

(assert (=> b!41316 m!63015))

(declare-fun m!63017 () Bool)

(assert (=> start!8272 m!63017))

(declare-fun m!63019 () Bool)

(assert (=> start!8272 m!63019))

(declare-fun m!63021 () Bool)

(assert (=> b!41317 m!63021))

(declare-fun m!63023 () Bool)

(assert (=> b!41320 m!63023))

(declare-fun m!63025 () Bool)

(assert (=> b!41319 m!63025))

(push 1)

(assert (not b!41316))

(assert (not b!41319))

(assert (not start!8272))

(assert (not b!41320))

(assert (not b!41317))

(assert (not b!41318))

(check-sat)

(pop 1)

(push 1)

(check-sat)

