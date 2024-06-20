; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8350 () Bool)

(assert start!8350)

(declare-fun b!41633 () Bool)

(declare-fun e!27602 () Bool)

(assert (=> b!41633 (= e!27602 true)))

(declare-datatypes ((array!2102 0))(
  ( (array!2103 (arr!1448 (Array (_ BitVec 32) (_ BitVec 8))) (size!949 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2102)

(declare-datatypes ((BitStream!1642 0))(
  ( (BitStream!1643 (buf!1277 array!2102) (currentByte!2729 (_ BitVec 32)) (currentBit!2724 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1642)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((tuple2!4018 0))(
  ( (tuple2!4019 (_1!2099 array!2102) (_2!2099 BitStream!1642)) )
))
(declare-fun lt!62985 () tuple2!4018)

(declare-fun checkByteArrayBitContent!0 (BitStream!1642 array!2102 array!2102 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41633 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2099 lt!62985) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun res!35415 () Bool)

(declare-fun e!27606 () Bool)

(assert (=> start!8350 (=> (not res!35415) (not e!27606))))

(assert (=> start!8350 (= res!35415 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!949 srcBuffer!2))))))))

(assert (=> start!8350 e!27606))

(assert (=> start!8350 true))

(declare-fun array_inv!874 (array!2102) Bool)

(assert (=> start!8350 (array_inv!874 srcBuffer!2)))

(declare-fun e!27607 () Bool)

(declare-fun inv!12 (BitStream!1642) Bool)

(assert (=> start!8350 (and (inv!12 thiss!1379) e!27607)))

(declare-fun b!41634 () Bool)

(declare-fun e!27603 () Bool)

(assert (=> b!41634 (= e!27603 e!27602)))

(declare-fun res!35418 () Bool)

(assert (=> b!41634 (=> res!35418 e!27602)))

(assert (=> b!41634 (= res!35418 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!1642 (_ BitVec 64)) tuple2!4018)

(declare-datatypes ((tuple2!4020 0))(
  ( (tuple2!4021 (_1!2100 BitStream!1642) (_2!2100 BitStream!1642)) )
))
(declare-fun reader!0 (BitStream!1642 BitStream!1642) tuple2!4020)

(assert (=> b!41634 (= lt!62985 (readBits!0 (_1!2100 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41635 () Bool)

(declare-fun res!35416 () Bool)

(assert (=> b!41635 (=> (not res!35416) (not e!27606))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41635 (= res!35416 (validate_offset_bits!1 ((_ sign_extend 32) (size!949 (buf!1277 thiss!1379))) ((_ sign_extend 32) (currentByte!2729 thiss!1379)) ((_ sign_extend 32) (currentBit!2724 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41636 () Bool)

(assert (=> b!41636 (= e!27606 (not e!27603))))

(declare-fun res!35414 () Bool)

(assert (=> b!41636 (=> res!35414 e!27603)))

(declare-fun lt!62984 () (_ BitVec 64))

(assert (=> b!41636 (= res!35414 (or (bvslt i!635 to!314) (not (= lt!62984 (bvsub (bvadd lt!62984 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1642 BitStream!1642) Bool)

(assert (=> b!41636 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2949 0))(
  ( (Unit!2950) )
))
(declare-fun lt!62986 () Unit!2949)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1642) Unit!2949)

(assert (=> b!41636 (= lt!62986 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41636 (= lt!62984 (bitIndex!0 (size!949 (buf!1277 thiss!1379)) (currentByte!2729 thiss!1379) (currentBit!2724 thiss!1379)))))

(declare-fun b!41637 () Bool)

(declare-fun res!35417 () Bool)

(assert (=> b!41637 (=> res!35417 e!27603)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41637 (= res!35417 (not (invariant!0 (currentBit!2724 thiss!1379) (currentByte!2729 thiss!1379) (size!949 (buf!1277 thiss!1379)))))))

(declare-fun b!41638 () Bool)

(assert (=> b!41638 (= e!27607 (array_inv!874 (buf!1277 thiss!1379)))))

(assert (= (and start!8350 res!35415) b!41635))

(assert (= (and b!41635 res!35416) b!41636))

(assert (= (and b!41636 (not res!35414)) b!41637))

(assert (= (and b!41637 (not res!35417)) b!41634))

(assert (= (and b!41634 (not res!35418)) b!41633))

(assert (= start!8350 b!41638))

(declare-fun m!63361 () Bool)

(assert (=> b!41633 m!63361))

(declare-fun m!63363 () Bool)

(assert (=> b!41637 m!63363))

(declare-fun m!63365 () Bool)

(assert (=> b!41634 m!63365))

(declare-fun m!63367 () Bool)

(assert (=> b!41634 m!63367))

(declare-fun m!63369 () Bool)

(assert (=> b!41636 m!63369))

(declare-fun m!63371 () Bool)

(assert (=> b!41636 m!63371))

(declare-fun m!63373 () Bool)

(assert (=> b!41636 m!63373))

(declare-fun m!63375 () Bool)

(assert (=> start!8350 m!63375))

(declare-fun m!63377 () Bool)

(assert (=> start!8350 m!63377))

(declare-fun m!63379 () Bool)

(assert (=> b!41635 m!63379))

(declare-fun m!63381 () Bool)

(assert (=> b!41638 m!63381))

(push 1)

(assert (not b!41636))

(assert (not b!41638))

(assert (not b!41634))

(assert (not b!41633))

(assert (not b!41637))

(assert (not start!8350))

(assert (not b!41635))

(check-sat)

(pop 1)

