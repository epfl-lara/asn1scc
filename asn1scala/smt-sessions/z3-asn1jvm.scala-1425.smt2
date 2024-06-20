; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39100 () Bool)

(assert start!39100)

(declare-fun b!175912 () Bool)

(declare-fun res!145674 () Bool)

(declare-fun e!122656 () Bool)

(assert (=> b!175912 (=> (not res!145674) (not e!122656))))

(declare-datatypes ((array!9496 0))(
  ( (array!9497 (arr!5120 (Array (_ BitVec 32) (_ BitVec 8))) (size!4190 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7488 0))(
  ( (BitStream!7489 (buf!4633 array!9496) (currentByte!8768 (_ BitVec 32)) (currentBit!8763 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7488)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175912 (= res!145674 (invariant!0 (currentBit!8763 thiss!1204) (currentByte!8768 thiss!1204) (size!4190 (buf!4633 thiss!1204))))))

(declare-fun b!175913 () Bool)

(declare-fun e!122653 () Bool)

(assert (=> b!175913 (= e!122653 (not true))))

(declare-fun i!590 () (_ BitVec 32))

(declare-datatypes ((tuple2!15128 0))(
  ( (tuple2!15129 (_1!8209 BitStream!7488) (_2!8209 BitStream!7488)) )
))
(declare-fun lt!271215 () tuple2!15128)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun v!189 () (_ BitVec 64))

(declare-datatypes ((tuple2!15130 0))(
  ( (tuple2!15131 (_1!8210 BitStream!7488) (_2!8210 (_ BitVec 64))) )
))
(declare-fun lt!271219 () tuple2!15130)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7488 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15130)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175913 (= lt!271219 (readNBitsLSBFirstsLoopPure!0 (_1!8209 lt!271215) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-datatypes ((Unit!12694 0))(
  ( (Unit!12695) )
))
(declare-fun lt!271218 () Unit!12694)

(declare-fun lt!271217 () (_ BitVec 64))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7488 array!9496 (_ BitVec 64)) Unit!12694)

(assert (=> b!175913 (= lt!271218 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4633 thiss!1204) lt!271217))))

(declare-fun reader!0 (BitStream!7488 BitStream!7488) tuple2!15128)

(assert (=> b!175913 (= lt!271215 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7488 BitStream!7488) Bool)

(assert (=> b!175913 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!271216 () Unit!12694)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7488) Unit!12694)

(assert (=> b!175913 (= lt!271216 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175914 () Bool)

(assert (=> b!175914 (= e!122656 e!122653)))

(declare-fun res!145673 () Bool)

(assert (=> b!175914 (=> (not res!145673) (not e!122653))))

(declare-fun lt!271220 () (_ BitVec 64))

(assert (=> b!175914 (= res!145673 (= lt!271220 (bvsub (bvadd lt!271220 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175914 (= lt!271220 (bitIndex!0 (size!4190 (buf!4633 thiss!1204)) (currentByte!8768 thiss!1204) (currentBit!8763 thiss!1204)))))

(declare-fun b!175916 () Bool)

(declare-fun e!122654 () Bool)

(assert (=> b!175916 (= e!122654 e!122656)))

(declare-fun res!145670 () Bool)

(assert (=> b!175916 (=> (not res!145670) (not e!122656))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175916 (= res!145670 (validate_offset_bits!1 ((_ sign_extend 32) (size!4190 (buf!4633 thiss!1204))) ((_ sign_extend 32) (currentByte!8768 thiss!1204)) ((_ sign_extend 32) (currentBit!8763 thiss!1204)) lt!271217))))

(assert (=> b!175916 (= lt!271217 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!175917 () Bool)

(declare-fun res!145671 () Bool)

(assert (=> b!175917 (=> (not res!145671) (not e!122656))))

(assert (=> b!175917 (= res!145671 (= i!590 nBits!348))))

(declare-fun b!175915 () Bool)

(declare-fun e!122655 () Bool)

(declare-fun array_inv!3931 (array!9496) Bool)

(assert (=> b!175915 (= e!122655 (array_inv!3931 (buf!4633 thiss!1204)))))

(declare-fun res!145672 () Bool)

(assert (=> start!39100 (=> (not res!145672) (not e!122654))))

(assert (=> start!39100 (= res!145672 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39100 e!122654))

(assert (=> start!39100 true))

(declare-fun inv!12 (BitStream!7488) Bool)

(assert (=> start!39100 (and (inv!12 thiss!1204) e!122655)))

(assert (= (and start!39100 res!145672) b!175916))

(assert (= (and b!175916 res!145670) b!175912))

(assert (= (and b!175912 res!145674) b!175917))

(assert (= (and b!175917 res!145671) b!175914))

(assert (= (and b!175914 res!145673) b!175913))

(assert (= start!39100 b!175915))

(declare-fun m!276107 () Bool)

(assert (=> b!175913 m!276107))

(declare-fun m!276109 () Bool)

(assert (=> b!175913 m!276109))

(declare-fun m!276111 () Bool)

(assert (=> b!175913 m!276111))

(declare-fun m!276113 () Bool)

(assert (=> b!175913 m!276113))

(declare-fun m!276115 () Bool)

(assert (=> b!175913 m!276115))

(declare-fun m!276117 () Bool)

(assert (=> b!175913 m!276117))

(declare-fun m!276119 () Bool)

(assert (=> b!175916 m!276119))

(declare-fun m!276121 () Bool)

(assert (=> b!175912 m!276121))

(declare-fun m!276123 () Bool)

(assert (=> start!39100 m!276123))

(declare-fun m!276125 () Bool)

(assert (=> b!175914 m!276125))

(declare-fun m!276127 () Bool)

(assert (=> b!175915 m!276127))

(check-sat (not b!175914) (not b!175915) (not b!175913) (not start!39100) (not b!175912) (not b!175916))
