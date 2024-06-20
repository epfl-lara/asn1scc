; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39092 () Bool)

(assert start!39092)

(declare-fun b!175826 () Bool)

(declare-fun res!145600 () Bool)

(declare-fun e!122587 () Bool)

(assert (=> b!175826 (=> (not res!145600) (not e!122587))))

(declare-datatypes ((array!9488 0))(
  ( (array!9489 (arr!5116 (Array (_ BitVec 32) (_ BitVec 8))) (size!4186 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7480 0))(
  ( (BitStream!7481 (buf!4629 array!9488) (currentByte!8764 (_ BitVec 32)) (currentBit!8759 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7480)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175826 (= res!145600 (invariant!0 (currentBit!8759 thiss!1204) (currentByte!8764 thiss!1204) (size!4186 (buf!4629 thiss!1204))))))

(declare-fun b!175828 () Bool)

(declare-fun e!122586 () Bool)

(declare-fun e!122590 () Bool)

(assert (=> b!175828 (= e!122586 (not e!122590))))

(declare-fun res!145596 () Bool)

(assert (=> b!175828 (=> res!145596 e!122590)))

(declare-datatypes ((tuple2!15118 0))(
  ( (tuple2!15119 (_1!8204 BitStream!7480) (_2!8204 BitStream!7480)) )
))
(declare-fun lt!271144 () tuple2!15118)

(declare-fun lt!271143 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175828 (= res!145596 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4186 (buf!4629 (_1!8204 lt!271144)))) ((_ sign_extend 32) (currentByte!8764 (_1!8204 lt!271144))) ((_ sign_extend 32) (currentBit!8759 (_1!8204 lt!271144))) lt!271143)))))

(declare-datatypes ((Unit!12686 0))(
  ( (Unit!12687) )
))
(declare-fun lt!271148 () Unit!12686)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7480 array!9488 (_ BitVec 64)) Unit!12686)

(assert (=> b!175828 (= lt!271148 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4629 thiss!1204) lt!271143))))

(declare-fun lt!271145 () (_ BitVec 64))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175828 (= lt!271145 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun reader!0 (BitStream!7480 BitStream!7480) tuple2!15118)

(assert (=> b!175828 (= lt!271144 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7480 BitStream!7480) Bool)

(assert (=> b!175828 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!271147 () Unit!12686)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7480) Unit!12686)

(assert (=> b!175828 (= lt!271147 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175829 () Bool)

(declare-fun res!145599 () Bool)

(assert (=> b!175829 (=> (not res!145599) (not e!122587))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!175829 (= res!145599 (= i!590 nBits!348))))

(declare-fun b!175830 () Bool)

(assert (=> b!175830 (= e!122590 (= (bvand lt!271145 #b1111111111111111111111111111111111111111111111111111111111111111) lt!271145))))

(declare-fun b!175831 () Bool)

(declare-fun e!122588 () Bool)

(assert (=> b!175831 (= e!122588 e!122587)))

(declare-fun res!145601 () Bool)

(assert (=> b!175831 (=> (not res!145601) (not e!122587))))

(assert (=> b!175831 (= res!145601 (validate_offset_bits!1 ((_ sign_extend 32) (size!4186 (buf!4629 thiss!1204))) ((_ sign_extend 32) (currentByte!8764 thiss!1204)) ((_ sign_extend 32) (currentBit!8759 thiss!1204)) lt!271143))))

(assert (=> b!175831 (= lt!271143 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!175832 () Bool)

(declare-fun res!145602 () Bool)

(assert (=> b!175832 (=> res!145602 e!122590)))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175832 (= res!145602 (not (= (bvand lt!271145 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175833 () Bool)

(declare-fun e!122585 () Bool)

(declare-fun array_inv!3927 (array!9488) Bool)

(assert (=> b!175833 (= e!122585 (array_inv!3927 (buf!4629 thiss!1204)))))

(declare-fun b!175827 () Bool)

(assert (=> b!175827 (= e!122587 e!122586)))

(declare-fun res!145598 () Bool)

(assert (=> b!175827 (=> (not res!145598) (not e!122586))))

(declare-fun lt!271146 () (_ BitVec 64))

(assert (=> b!175827 (= res!145598 (= lt!271146 (bvsub (bvadd lt!271146 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175827 (= lt!271146 (bitIndex!0 (size!4186 (buf!4629 thiss!1204)) (currentByte!8764 thiss!1204) (currentBit!8759 thiss!1204)))))

(declare-fun res!145597 () Bool)

(assert (=> start!39092 (=> (not res!145597) (not e!122588))))

(assert (=> start!39092 (= res!145597 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39092 e!122588))

(assert (=> start!39092 true))

(declare-fun inv!12 (BitStream!7480) Bool)

(assert (=> start!39092 (and (inv!12 thiss!1204) e!122585)))

(assert (= (and start!39092 res!145597) b!175831))

(assert (= (and b!175831 res!145601) b!175826))

(assert (= (and b!175826 res!145600) b!175829))

(assert (= (and b!175829 res!145599) b!175827))

(assert (= (and b!175827 res!145598) b!175828))

(assert (= (and b!175828 (not res!145596)) b!175832))

(assert (= (and b!175832 (not res!145602)) b!175830))

(assert (= start!39092 b!175833))

(declare-fun m!276013 () Bool)

(assert (=> b!175833 m!276013))

(declare-fun m!276015 () Bool)

(assert (=> b!175831 m!276015))

(declare-fun m!276017 () Bool)

(assert (=> b!175827 m!276017))

(declare-fun m!276019 () Bool)

(assert (=> b!175832 m!276019))

(declare-fun m!276021 () Bool)

(assert (=> start!39092 m!276021))

(declare-fun m!276023 () Bool)

(assert (=> b!175826 m!276023))

(declare-fun m!276025 () Bool)

(assert (=> b!175828 m!276025))

(declare-fun m!276027 () Bool)

(assert (=> b!175828 m!276027))

(declare-fun m!276029 () Bool)

(assert (=> b!175828 m!276029))

(declare-fun m!276031 () Bool)

(assert (=> b!175828 m!276031))

(declare-fun m!276033 () Bool)

(assert (=> b!175828 m!276033))

(declare-fun m!276035 () Bool)

(assert (=> b!175828 m!276035))

(push 1)

(assert (not start!39092))

(assert (not b!175833))

(assert (not b!175831))

(assert (not b!175828))

(assert (not b!175826))

(assert (not b!175832))

(assert (not b!175827))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

