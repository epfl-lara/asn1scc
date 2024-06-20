; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4826 () Bool)

(assert start!4826)

(declare-fun b!19018 () Bool)

(declare-fun e!12449 () Bool)

(declare-fun e!12448 () Bool)

(assert (=> b!19018 (= e!12449 (not e!12448))))

(declare-fun res!16637 () Bool)

(assert (=> b!19018 (=> res!16637 e!12448)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!19018 (= res!16637 (bvsge i!635 to!314))))

(declare-datatypes ((array!1350 0))(
  ( (array!1351 (arr!1011 (Array (_ BitVec 32) (_ BitVec 8))) (size!570 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!974 0))(
  ( (BitStream!975 (buf!870 array!1350) (currentByte!2150 (_ BitVec 32)) (currentBit!2145 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!974)

(declare-fun isPrefixOf!0 (BitStream!974 BitStream!974) Bool)

(assert (=> b!19018 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1684 0))(
  ( (Unit!1685) )
))
(declare-fun lt!27092 () Unit!1684)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!974) Unit!1684)

(assert (=> b!19018 (= lt!27092 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27091 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19018 (= lt!27091 (bitIndex!0 (size!570 (buf!870 thiss!1379)) (currentByte!2150 thiss!1379) (currentBit!2145 thiss!1379)))))

(declare-fun b!19019 () Bool)

(declare-fun e!12453 () Bool)

(assert (=> b!19019 (= e!12448 e!12453)))

(declare-fun res!16640 () Bool)

(assert (=> b!19019 (=> res!16640 e!12453)))

(declare-datatypes ((tuple2!2148 0))(
  ( (tuple2!2149 (_1!1159 Unit!1684) (_2!1159 BitStream!974)) )
))
(declare-fun lt!27093 () tuple2!2148)

(assert (=> b!19019 (= res!16640 (not (= (size!570 (buf!870 thiss!1379)) (size!570 (buf!870 (_2!1159 lt!27093))))))))

(declare-fun srcBuffer!2 () array!1350)

(declare-fun appendBitFromByte!0 (BitStream!974 (_ BitVec 8) (_ BitVec 32)) tuple2!2148)

(assert (=> b!19019 (= lt!27093 (appendBitFromByte!0 thiss!1379 (select (arr!1011 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19020 () Bool)

(assert (=> b!19020 (= e!12453 true)))

(declare-fun lt!27094 () (_ BitVec 64))

(assert (=> b!19020 (= lt!27094 (bitIndex!0 (size!570 (buf!870 (_2!1159 lt!27093))) (currentByte!2150 (_2!1159 lt!27093)) (currentBit!2145 (_2!1159 lt!27093))))))

(declare-fun b!19021 () Bool)

(declare-fun e!12452 () Bool)

(declare-fun array_inv!540 (array!1350) Bool)

(assert (=> b!19021 (= e!12452 (array_inv!540 (buf!870 thiss!1379)))))

(declare-fun b!19022 () Bool)

(declare-fun res!16639 () Bool)

(assert (=> b!19022 (=> (not res!16639) (not e!12449))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19022 (= res!16639 (validate_offset_bits!1 ((_ sign_extend 32) (size!570 (buf!870 thiss!1379))) ((_ sign_extend 32) (currentByte!2150 thiss!1379)) ((_ sign_extend 32) (currentBit!2145 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!16638 () Bool)

(assert (=> start!4826 (=> (not res!16638) (not e!12449))))

(assert (=> start!4826 (= res!16638 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!570 srcBuffer!2))))))))

(assert (=> start!4826 e!12449))

(assert (=> start!4826 true))

(assert (=> start!4826 (array_inv!540 srcBuffer!2)))

(declare-fun inv!12 (BitStream!974) Bool)

(assert (=> start!4826 (and (inv!12 thiss!1379) e!12452)))

(assert (= (and start!4826 res!16638) b!19022))

(assert (= (and b!19022 res!16639) b!19018))

(assert (= (and b!19018 (not res!16637)) b!19019))

(assert (= (and b!19019 (not res!16640)) b!19020))

(assert (= start!4826 b!19021))

(declare-fun m!25495 () Bool)

(assert (=> b!19020 m!25495))

(declare-fun m!25497 () Bool)

(assert (=> b!19018 m!25497))

(declare-fun m!25499 () Bool)

(assert (=> b!19018 m!25499))

(declare-fun m!25501 () Bool)

(assert (=> b!19018 m!25501))

(declare-fun m!25503 () Bool)

(assert (=> b!19022 m!25503))

(declare-fun m!25505 () Bool)

(assert (=> b!19021 m!25505))

(declare-fun m!25507 () Bool)

(assert (=> start!4826 m!25507))

(declare-fun m!25509 () Bool)

(assert (=> start!4826 m!25509))

(declare-fun m!25511 () Bool)

(assert (=> b!19019 m!25511))

(assert (=> b!19019 m!25511))

(declare-fun m!25513 () Bool)

(assert (=> b!19019 m!25513))

(push 1)

(assert (not b!19019))

(assert (not b!19018))

(assert (not b!19021))

(assert (not b!19022))

(assert (not start!4826))

(assert (not b!19020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

