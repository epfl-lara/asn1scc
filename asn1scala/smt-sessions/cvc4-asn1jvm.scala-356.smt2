; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8354 () Bool)

(assert start!8354)

(declare-fun b!41669 () Bool)

(declare-fun res!35446 () Bool)

(declare-fun e!27642 () Bool)

(assert (=> b!41669 (=> (not res!35446) (not e!27642))))

(declare-datatypes ((array!2106 0))(
  ( (array!2107 (arr!1450 (Array (_ BitVec 32) (_ BitVec 8))) (size!951 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1646 0))(
  ( (BitStream!1647 (buf!1279 array!2106) (currentByte!2731 (_ BitVec 32)) (currentBit!2726 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1646)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41669 (= res!35446 (validate_offset_bits!1 ((_ sign_extend 32) (size!951 (buf!1279 thiss!1379))) ((_ sign_extend 32) (currentByte!2731 thiss!1379)) ((_ sign_extend 32) (currentBit!2726 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41670 () Bool)

(declare-fun e!27639 () Bool)

(declare-fun array_inv!876 (array!2106) Bool)

(assert (=> b!41670 (= e!27639 (array_inv!876 (buf!1279 thiss!1379)))))

(declare-fun b!41671 () Bool)

(declare-fun res!35445 () Bool)

(declare-fun e!27640 () Bool)

(assert (=> b!41671 (=> res!35445 e!27640)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41671 (= res!35445 (not (invariant!0 (currentBit!2726 thiss!1379) (currentByte!2731 thiss!1379) (size!951 (buf!1279 thiss!1379)))))))

(declare-fun b!41672 () Bool)

(assert (=> b!41672 (= e!27642 (not e!27640))))

(declare-fun res!35447 () Bool)

(assert (=> b!41672 (=> res!35447 e!27640)))

(declare-fun lt!63004 () (_ BitVec 64))

(assert (=> b!41672 (= res!35447 (or (bvslt i!635 to!314) (not (= lt!63004 (bvsub (bvadd lt!63004 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1646 BitStream!1646) Bool)

(assert (=> b!41672 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2953 0))(
  ( (Unit!2954) )
))
(declare-fun lt!63003 () Unit!2953)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1646) Unit!2953)

(assert (=> b!41672 (= lt!63003 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41672 (= lt!63004 (bitIndex!0 (size!951 (buf!1279 thiss!1379)) (currentByte!2731 thiss!1379) (currentBit!2726 thiss!1379)))))

(declare-fun res!35448 () Bool)

(assert (=> start!8354 (=> (not res!35448) (not e!27642))))

(declare-fun srcBuffer!2 () array!2106)

(assert (=> start!8354 (= res!35448 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!951 srcBuffer!2))))))))

(assert (=> start!8354 e!27642))

(assert (=> start!8354 true))

(assert (=> start!8354 (array_inv!876 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1646) Bool)

(assert (=> start!8354 (and (inv!12 thiss!1379) e!27639)))

(declare-fun b!41673 () Bool)

(declare-fun e!27643 () Bool)

(assert (=> b!41673 (= e!27640 e!27643)))

(declare-fun res!35444 () Bool)

(assert (=> b!41673 (=> res!35444 e!27643)))

(assert (=> b!41673 (= res!35444 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4026 0))(
  ( (tuple2!4027 (_1!2103 array!2106) (_2!2103 BitStream!1646)) )
))
(declare-fun lt!63002 () tuple2!4026)

(declare-fun readBits!0 (BitStream!1646 (_ BitVec 64)) tuple2!4026)

(declare-datatypes ((tuple2!4028 0))(
  ( (tuple2!4029 (_1!2104 BitStream!1646) (_2!2104 BitStream!1646)) )
))
(declare-fun reader!0 (BitStream!1646 BitStream!1646) tuple2!4028)

(assert (=> b!41673 (= lt!63002 (readBits!0 (_1!2104 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41674 () Bool)

(assert (=> b!41674 (= e!27643 true)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1646 array!2106 array!2106 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41674 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2103 lt!63002) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(assert (= (and start!8354 res!35448) b!41669))

(assert (= (and b!41669 res!35446) b!41672))

(assert (= (and b!41672 (not res!35447)) b!41671))

(assert (= (and b!41671 (not res!35445)) b!41673))

(assert (= (and b!41673 (not res!35444)) b!41674))

(assert (= start!8354 b!41670))

(declare-fun m!63405 () Bool)

(assert (=> b!41672 m!63405))

(declare-fun m!63407 () Bool)

(assert (=> b!41672 m!63407))

(declare-fun m!63409 () Bool)

(assert (=> b!41672 m!63409))

(declare-fun m!63411 () Bool)

(assert (=> b!41673 m!63411))

(declare-fun m!63413 () Bool)

(assert (=> b!41673 m!63413))

(declare-fun m!63415 () Bool)

(assert (=> b!41671 m!63415))

(declare-fun m!63417 () Bool)

(assert (=> b!41669 m!63417))

(declare-fun m!63419 () Bool)

(assert (=> b!41674 m!63419))

(declare-fun m!63421 () Bool)

(assert (=> b!41670 m!63421))

(declare-fun m!63423 () Bool)

(assert (=> start!8354 m!63423))

(declare-fun m!63425 () Bool)

(assert (=> start!8354 m!63425))

(push 1)

(assert (not b!41673))

(assert (not b!41674))

(assert (not b!41669))

(assert (not b!41671))

(assert (not start!8354))

(assert (not b!41672))

(assert (not b!41670))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

