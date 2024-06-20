; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4828 () Bool)

(assert start!4828)

(declare-fun b!19033 () Bool)

(declare-fun e!12469 () Bool)

(declare-fun e!12467 () Bool)

(assert (=> b!19033 (= e!12469 e!12467)))

(declare-fun res!16651 () Bool)

(assert (=> b!19033 (=> res!16651 e!12467)))

(declare-datatypes ((array!1352 0))(
  ( (array!1353 (arr!1012 (Array (_ BitVec 32) (_ BitVec 8))) (size!571 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!976 0))(
  ( (BitStream!977 (buf!871 array!1352) (currentByte!2151 (_ BitVec 32)) (currentBit!2146 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!976)

(declare-datatypes ((Unit!1686 0))(
  ( (Unit!1687) )
))
(declare-datatypes ((tuple2!2150 0))(
  ( (tuple2!2151 (_1!1160 Unit!1686) (_2!1160 BitStream!976)) )
))
(declare-fun lt!27103 () tuple2!2150)

(assert (=> b!19033 (= res!16651 (not (= (size!571 (buf!871 thiss!1379)) (size!571 (buf!871 (_2!1160 lt!27103))))))))

(declare-fun srcBuffer!2 () array!1352)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun appendBitFromByte!0 (BitStream!976 (_ BitVec 8) (_ BitVec 32)) tuple2!2150)

(assert (=> b!19033 (= lt!27103 (appendBitFromByte!0 thiss!1379 (select (arr!1012 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19034 () Bool)

(assert (=> b!19034 (= e!12467 true)))

(declare-fun lt!27106 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19034 (= lt!27106 (bitIndex!0 (size!571 (buf!871 (_2!1160 lt!27103))) (currentByte!2151 (_2!1160 lt!27103)) (currentBit!2146 (_2!1160 lt!27103))))))

(declare-fun res!16649 () Bool)

(declare-fun e!12471 () Bool)

(assert (=> start!4828 (=> (not res!16649) (not e!12471))))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4828 (= res!16649 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!571 srcBuffer!2))))))))

(assert (=> start!4828 e!12471))

(assert (=> start!4828 true))

(declare-fun array_inv!541 (array!1352) Bool)

(assert (=> start!4828 (array_inv!541 srcBuffer!2)))

(declare-fun e!12470 () Bool)

(declare-fun inv!12 (BitStream!976) Bool)

(assert (=> start!4828 (and (inv!12 thiss!1379) e!12470)))

(declare-fun b!19035 () Bool)

(declare-fun res!16652 () Bool)

(assert (=> b!19035 (=> (not res!16652) (not e!12471))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19035 (= res!16652 (validate_offset_bits!1 ((_ sign_extend 32) (size!571 (buf!871 thiss!1379))) ((_ sign_extend 32) (currentByte!2151 thiss!1379)) ((_ sign_extend 32) (currentBit!2146 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19036 () Bool)

(assert (=> b!19036 (= e!12471 (not e!12469))))

(declare-fun res!16650 () Bool)

(assert (=> b!19036 (=> res!16650 e!12469)))

(assert (=> b!19036 (= res!16650 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!976 BitStream!976) Bool)

(assert (=> b!19036 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27105 () Unit!1686)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!976) Unit!1686)

(assert (=> b!19036 (= lt!27105 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27104 () (_ BitVec 64))

(assert (=> b!19036 (= lt!27104 (bitIndex!0 (size!571 (buf!871 thiss!1379)) (currentByte!2151 thiss!1379) (currentBit!2146 thiss!1379)))))

(declare-fun b!19037 () Bool)

(assert (=> b!19037 (= e!12470 (array_inv!541 (buf!871 thiss!1379)))))

(assert (= (and start!4828 res!16649) b!19035))

(assert (= (and b!19035 res!16652) b!19036))

(assert (= (and b!19036 (not res!16650)) b!19033))

(assert (= (and b!19033 (not res!16651)) b!19034))

(assert (= start!4828 b!19037))

(declare-fun m!25515 () Bool)

(assert (=> b!19037 m!25515))

(declare-fun m!25517 () Bool)

(assert (=> b!19035 m!25517))

(declare-fun m!25519 () Bool)

(assert (=> b!19033 m!25519))

(assert (=> b!19033 m!25519))

(declare-fun m!25521 () Bool)

(assert (=> b!19033 m!25521))

(declare-fun m!25523 () Bool)

(assert (=> b!19036 m!25523))

(declare-fun m!25525 () Bool)

(assert (=> b!19036 m!25525))

(declare-fun m!25527 () Bool)

(assert (=> b!19036 m!25527))

(declare-fun m!25529 () Bool)

(assert (=> b!19034 m!25529))

(declare-fun m!25531 () Bool)

(assert (=> start!4828 m!25531))

(declare-fun m!25533 () Bool)

(assert (=> start!4828 m!25533))

(push 1)

(assert (not b!19033))

(assert (not b!19034))

(assert (not start!4828))

(assert (not b!19035))

(assert (not b!19037))

(assert (not b!19036))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

