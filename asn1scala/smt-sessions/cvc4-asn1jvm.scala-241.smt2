; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4766 () Bool)

(assert start!4766)

(declare-fun res!16487 () Bool)

(declare-fun e!12264 () Bool)

(assert (=> start!4766 (=> (not res!16487) (not e!12264))))

(declare-datatypes ((array!1329 0))(
  ( (array!1330 (arr!1002 (Array (_ BitVec 32) (_ BitVec 8))) (size!561 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1329)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4766 (= res!16487 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!561 srcBuffer!2))))))))

(assert (=> start!4766 e!12264))

(assert (=> start!4766 true))

(declare-fun array_inv!531 (array!1329) Bool)

(assert (=> start!4766 (array_inv!531 srcBuffer!2)))

(declare-datatypes ((BitStream!956 0))(
  ( (BitStream!957 (buf!861 array!1329) (currentByte!2132 (_ BitVec 32)) (currentBit!2127 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!956)

(declare-fun e!12263 () Bool)

(declare-fun inv!12 (BitStream!956) Bool)

(assert (=> start!4766 (and (inv!12 thiss!1379) e!12263)))

(declare-fun b!18840 () Bool)

(declare-fun res!16486 () Bool)

(assert (=> b!18840 (=> (not res!16486) (not e!12264))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18840 (= res!16486 (validate_offset_bits!1 ((_ sign_extend 32) (size!561 (buf!861 thiss!1379))) ((_ sign_extend 32) (currentByte!2132 thiss!1379)) ((_ sign_extend 32) (currentBit!2127 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!18841 () Bool)

(assert (=> b!18841 (= e!12264 (not (or (bvsge i!635 to!314) (let ((bdg!598 ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) (and (bvsge bdg!598 #b00000000000000000000000000000000) (bvslt bdg!598 #b00000000000000000000000000001000))))))))

(declare-fun isPrefixOf!0 (BitStream!956 BitStream!956) Bool)

(assert (=> b!18841 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1666 0))(
  ( (Unit!1667) )
))
(declare-fun lt!26931 () Unit!1666)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!956) Unit!1666)

(assert (=> b!18841 (= lt!26931 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!26932 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18841 (= lt!26932 (bitIndex!0 (size!561 (buf!861 thiss!1379)) (currentByte!2132 thiss!1379) (currentBit!2127 thiss!1379)))))

(declare-fun b!18842 () Bool)

(assert (=> b!18842 (= e!12263 (array_inv!531 (buf!861 thiss!1379)))))

(assert (= (and start!4766 res!16487) b!18840))

(assert (= (and b!18840 res!16486) b!18841))

(assert (= start!4766 b!18842))

(declare-fun m!25309 () Bool)

(assert (=> start!4766 m!25309))

(declare-fun m!25311 () Bool)

(assert (=> start!4766 m!25311))

(declare-fun m!25313 () Bool)

(assert (=> b!18840 m!25313))

(declare-fun m!25315 () Bool)

(assert (=> b!18841 m!25315))

(declare-fun m!25317 () Bool)

(assert (=> b!18841 m!25317))

(declare-fun m!25319 () Bool)

(assert (=> b!18841 m!25319))

(declare-fun m!25321 () Bool)

(assert (=> b!18842 m!25321))

(push 1)

(assert (not b!18842))

(assert (not b!18841))

(assert (not start!4766))

(assert (not b!18840))

(check-sat)

(pop 1)

(push 1)

(check-sat)

