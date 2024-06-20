; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4832 () Bool)

(assert start!4832)

(declare-fun b!19063 () Bool)

(declare-fun res!16675 () Bool)

(declare-fun e!12503 () Bool)

(assert (=> b!19063 (=> (not res!16675) (not e!12503))))

(declare-datatypes ((array!1356 0))(
  ( (array!1357 (arr!1014 (Array (_ BitVec 32) (_ BitVec 8))) (size!573 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!980 0))(
  ( (BitStream!981 (buf!873 array!1356) (currentByte!2153 (_ BitVec 32)) (currentBit!2148 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!980)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19063 (= res!16675 (validate_offset_bits!1 ((_ sign_extend 32) (size!573 (buf!873 thiss!1379))) ((_ sign_extend 32) (currentByte!2153 thiss!1379)) ((_ sign_extend 32) (currentBit!2148 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19064 () Bool)

(declare-fun e!12507 () Bool)

(assert (=> b!19064 (= e!12507 true)))

(declare-fun lt!27128 () (_ BitVec 64))

(declare-datatypes ((Unit!1690 0))(
  ( (Unit!1691) )
))
(declare-datatypes ((tuple2!2154 0))(
  ( (tuple2!2155 (_1!1162 Unit!1690) (_2!1162 BitStream!980)) )
))
(declare-fun lt!27127 () tuple2!2154)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19064 (= lt!27128 (bitIndex!0 (size!573 (buf!873 (_2!1162 lt!27127))) (currentByte!2153 (_2!1162 lt!27127)) (currentBit!2148 (_2!1162 lt!27127))))))

(declare-fun res!16673 () Bool)

(assert (=> start!4832 (=> (not res!16673) (not e!12503))))

(declare-fun srcBuffer!2 () array!1356)

(assert (=> start!4832 (= res!16673 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!573 srcBuffer!2))))))))

(assert (=> start!4832 e!12503))

(assert (=> start!4832 true))

(declare-fun array_inv!543 (array!1356) Bool)

(assert (=> start!4832 (array_inv!543 srcBuffer!2)))

(declare-fun e!12506 () Bool)

(declare-fun inv!12 (BitStream!980) Bool)

(assert (=> start!4832 (and (inv!12 thiss!1379) e!12506)))

(declare-fun b!19065 () Bool)

(declare-fun e!12505 () Bool)

(assert (=> b!19065 (= e!12505 e!12507)))

(declare-fun res!16676 () Bool)

(assert (=> b!19065 (=> res!16676 e!12507)))

(assert (=> b!19065 (= res!16676 (not (= (size!573 (buf!873 thiss!1379)) (size!573 (buf!873 (_2!1162 lt!27127))))))))

(declare-fun appendBitFromByte!0 (BitStream!980 (_ BitVec 8) (_ BitVec 32)) tuple2!2154)

(assert (=> b!19065 (= lt!27127 (appendBitFromByte!0 thiss!1379 (select (arr!1014 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19066 () Bool)

(assert (=> b!19066 (= e!12506 (array_inv!543 (buf!873 thiss!1379)))))

(declare-fun b!19067 () Bool)

(assert (=> b!19067 (= e!12503 (not e!12505))))

(declare-fun res!16674 () Bool)

(assert (=> b!19067 (=> res!16674 e!12505)))

(assert (=> b!19067 (= res!16674 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!980 BitStream!980) Bool)

(assert (=> b!19067 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27130 () Unit!1690)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!980) Unit!1690)

(assert (=> b!19067 (= lt!27130 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27129 () (_ BitVec 64))

(assert (=> b!19067 (= lt!27129 (bitIndex!0 (size!573 (buf!873 thiss!1379)) (currentByte!2153 thiss!1379) (currentBit!2148 thiss!1379)))))

(assert (= (and start!4832 res!16673) b!19063))

(assert (= (and b!19063 res!16675) b!19067))

(assert (= (and b!19067 (not res!16674)) b!19065))

(assert (= (and b!19065 (not res!16676)) b!19064))

(assert (= start!4832 b!19066))

(declare-fun m!25555 () Bool)

(assert (=> b!19064 m!25555))

(declare-fun m!25557 () Bool)

(assert (=> b!19066 m!25557))

(declare-fun m!25559 () Bool)

(assert (=> start!4832 m!25559))

(declare-fun m!25561 () Bool)

(assert (=> start!4832 m!25561))

(declare-fun m!25563 () Bool)

(assert (=> b!19063 m!25563))

(declare-fun m!25565 () Bool)

(assert (=> b!19067 m!25565))

(declare-fun m!25567 () Bool)

(assert (=> b!19067 m!25567))

(declare-fun m!25569 () Bool)

(assert (=> b!19067 m!25569))

(declare-fun m!25571 () Bool)

(assert (=> b!19065 m!25571))

(assert (=> b!19065 m!25571))

(declare-fun m!25573 () Bool)

(assert (=> b!19065 m!25573))

(push 1)

(assert (not b!19067))

(assert (not b!19064))

(assert (not b!19063))

(assert (not b!19066))

(assert (not b!19065))

(assert (not start!4832))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

