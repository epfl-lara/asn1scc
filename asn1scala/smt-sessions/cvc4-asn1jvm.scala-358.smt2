; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8366 () Bool)

(assert start!8366)

(declare-fun b!41777 () Bool)

(declare-fun e!27746 () Bool)

(declare-fun e!27748 () Bool)

(assert (=> b!41777 (= e!27746 e!27748)))

(declare-fun res!35538 () Bool)

(assert (=> b!41777 (=> res!35538 e!27748)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!41777 (= res!35538 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!2118 0))(
  ( (array!2119 (arr!1456 (Array (_ BitVec 32) (_ BitVec 8))) (size!957 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1658 0))(
  ( (BitStream!1659 (buf!1285 array!2118) (currentByte!2737 (_ BitVec 32)) (currentBit!2732 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!4050 0))(
  ( (tuple2!4051 (_1!2115 array!2118) (_2!2115 BitStream!1658)) )
))
(declare-fun lt!63058 () tuple2!4050)

(declare-fun thiss!1379 () BitStream!1658)

(declare-fun readBits!0 (BitStream!1658 (_ BitVec 64)) tuple2!4050)

(declare-datatypes ((tuple2!4052 0))(
  ( (tuple2!4053 (_1!2116 BitStream!1658) (_2!2116 BitStream!1658)) )
))
(declare-fun reader!0 (BitStream!1658 BitStream!1658) tuple2!4052)

(assert (=> b!41777 (= lt!63058 (readBits!0 (_1!2116 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41778 () Bool)

(assert (=> b!41778 (= e!27748 true)))

(declare-fun srcBuffer!2 () array!2118)

(declare-fun checkByteArrayBitContent!0 (BitStream!1658 array!2118 array!2118 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41778 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2115 lt!63058) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!41779 () Bool)

(declare-fun res!35535 () Bool)

(assert (=> b!41779 (=> res!35535 e!27746)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41779 (= res!35535 (not (invariant!0 (currentBit!2732 thiss!1379) (currentByte!2737 thiss!1379) (size!957 (buf!1285 thiss!1379)))))))

(declare-fun b!41780 () Bool)

(declare-fun res!35537 () Bool)

(declare-fun e!27749 () Bool)

(assert (=> b!41780 (=> (not res!35537) (not e!27749))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41780 (= res!35537 (validate_offset_bits!1 ((_ sign_extend 32) (size!957 (buf!1285 thiss!1379))) ((_ sign_extend 32) (currentByte!2737 thiss!1379)) ((_ sign_extend 32) (currentBit!2732 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!35534 () Bool)

(assert (=> start!8366 (=> (not res!35534) (not e!27749))))

(assert (=> start!8366 (= res!35534 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!957 srcBuffer!2))))))))

(assert (=> start!8366 e!27749))

(assert (=> start!8366 true))

(declare-fun array_inv!882 (array!2118) Bool)

(assert (=> start!8366 (array_inv!882 srcBuffer!2)))

(declare-fun e!27751 () Bool)

(declare-fun inv!12 (BitStream!1658) Bool)

(assert (=> start!8366 (and (inv!12 thiss!1379) e!27751)))

(declare-fun b!41781 () Bool)

(assert (=> b!41781 (= e!27751 (array_inv!882 (buf!1285 thiss!1379)))))

(declare-fun b!41782 () Bool)

(assert (=> b!41782 (= e!27749 (not e!27746))))

(declare-fun res!35536 () Bool)

(assert (=> b!41782 (=> res!35536 e!27746)))

(declare-fun lt!63056 () (_ BitVec 64))

(assert (=> b!41782 (= res!35536 (or (bvslt i!635 to!314) (not (= lt!63056 (bvsub (bvadd lt!63056 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1658 BitStream!1658) Bool)

(assert (=> b!41782 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2965 0))(
  ( (Unit!2966) )
))
(declare-fun lt!63057 () Unit!2965)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1658) Unit!2965)

(assert (=> b!41782 (= lt!63057 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41782 (= lt!63056 (bitIndex!0 (size!957 (buf!1285 thiss!1379)) (currentByte!2737 thiss!1379) (currentBit!2732 thiss!1379)))))

(assert (= (and start!8366 res!35534) b!41780))

(assert (= (and b!41780 res!35537) b!41782))

(assert (= (and b!41782 (not res!35536)) b!41779))

(assert (= (and b!41779 (not res!35535)) b!41777))

(assert (= (and b!41777 (not res!35538)) b!41778))

(assert (= start!8366 b!41781))

(declare-fun m!63537 () Bool)

(assert (=> b!41781 m!63537))

(declare-fun m!63539 () Bool)

(assert (=> b!41782 m!63539))

(declare-fun m!63541 () Bool)

(assert (=> b!41782 m!63541))

(declare-fun m!63543 () Bool)

(assert (=> b!41782 m!63543))

(declare-fun m!63545 () Bool)

(assert (=> b!41777 m!63545))

(declare-fun m!63547 () Bool)

(assert (=> b!41777 m!63547))

(declare-fun m!63549 () Bool)

(assert (=> b!41780 m!63549))

(declare-fun m!63551 () Bool)

(assert (=> b!41779 m!63551))

(declare-fun m!63553 () Bool)

(assert (=> start!8366 m!63553))

(declare-fun m!63555 () Bool)

(assert (=> start!8366 m!63555))

(declare-fun m!63557 () Bool)

(assert (=> b!41778 m!63557))

(push 1)

(assert (not b!41782))

(assert (not b!41780))

(assert (not start!8366))

(assert (not b!41777))

(assert (not b!41781))

(assert (not b!41778))

(assert (not b!41779))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

