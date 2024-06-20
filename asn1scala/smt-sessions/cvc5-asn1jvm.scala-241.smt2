; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4762 () Bool)

(assert start!4762)

(declare-fun res!16475 () Bool)

(declare-fun e!12238 () Bool)

(assert (=> start!4762 (=> (not res!16475) (not e!12238))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!1325 0))(
  ( (array!1326 (arr!1000 (Array (_ BitVec 32) (_ BitVec 8))) (size!559 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1325)

(assert (=> start!4762 (= res!16475 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!559 srcBuffer!2))))))))

(assert (=> start!4762 e!12238))

(assert (=> start!4762 true))

(declare-fun array_inv!529 (array!1325) Bool)

(assert (=> start!4762 (array_inv!529 srcBuffer!2)))

(declare-datatypes ((BitStream!952 0))(
  ( (BitStream!953 (buf!859 array!1325) (currentByte!2130 (_ BitVec 32)) (currentBit!2125 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!952)

(declare-fun e!12240 () Bool)

(declare-fun inv!12 (BitStream!952) Bool)

(assert (=> start!4762 (and (inv!12 thiss!1379) e!12240)))

(declare-fun b!18822 () Bool)

(declare-fun res!16474 () Bool)

(assert (=> b!18822 (=> (not res!16474) (not e!12238))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18822 (= res!16474 (validate_offset_bits!1 ((_ sign_extend 32) (size!559 (buf!859 thiss!1379))) ((_ sign_extend 32) (currentByte!2130 thiss!1379)) ((_ sign_extend 32) (currentBit!2125 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!18823 () Bool)

(assert (=> b!18823 (= e!12238 (not (or (bvsge i!635 to!314) (let ((bdg!598 ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) (and (bvsge bdg!598 #b00000000000000000000000000000000) (bvslt bdg!598 #b00000000000000000000000000001000))))))))

(declare-fun isPrefixOf!0 (BitStream!952 BitStream!952) Bool)

(assert (=> b!18823 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1662 0))(
  ( (Unit!1663) )
))
(declare-fun lt!26920 () Unit!1662)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!952) Unit!1662)

(assert (=> b!18823 (= lt!26920 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!26919 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18823 (= lt!26919 (bitIndex!0 (size!559 (buf!859 thiss!1379)) (currentByte!2130 thiss!1379) (currentBit!2125 thiss!1379)))))

(declare-fun b!18824 () Bool)

(assert (=> b!18824 (= e!12240 (array_inv!529 (buf!859 thiss!1379)))))

(assert (= (and start!4762 res!16475) b!18822))

(assert (= (and b!18822 res!16474) b!18823))

(assert (= start!4762 b!18824))

(declare-fun m!25281 () Bool)

(assert (=> start!4762 m!25281))

(declare-fun m!25283 () Bool)

(assert (=> start!4762 m!25283))

(declare-fun m!25285 () Bool)

(assert (=> b!18822 m!25285))

(declare-fun m!25287 () Bool)

(assert (=> b!18823 m!25287))

(declare-fun m!25289 () Bool)

(assert (=> b!18823 m!25289))

(declare-fun m!25291 () Bool)

(assert (=> b!18823 m!25291))

(declare-fun m!25293 () Bool)

(assert (=> b!18824 m!25293))

(push 1)

(assert (not b!18824))

(assert (not b!18823))

(assert (not start!4762))

(assert (not b!18822))

(check-sat)

(pop 1)

(push 1)

(check-sat)

