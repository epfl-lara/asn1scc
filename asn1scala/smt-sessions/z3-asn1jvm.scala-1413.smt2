; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38908 () Bool)

(assert start!38908)

(declare-fun res!144972 () Bool)

(declare-fun e!122075 () Bool)

(assert (=> start!38908 (=> (not res!144972) (not e!122075))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!9418 0))(
  ( (array!9419 (arr!5084 (Array (_ BitVec 32) (_ BitVec 8))) (size!4154 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7416 0))(
  ( (BitStream!7417 (buf!4591 array!9418) (currentByte!8714 (_ BitVec 32)) (currentBit!8709 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7416)

(assert (=> start!38908 (= res!144972 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348) (bvsle ((_ sign_extend 32) (size!4154 (buf!4591 thiss!1204))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8714 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8709 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4154 (buf!4591 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8714 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8709 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38908 e!122075))

(assert (=> start!38908 true))

(declare-fun e!122076 () Bool)

(declare-fun inv!12 (BitStream!7416) Bool)

(assert (=> start!38908 (and (inv!12 thiss!1204) e!122076)))

(declare-fun b!175069 () Bool)

(declare-fun res!144971 () Bool)

(assert (=> b!175069 (=> (not res!144971) (not e!122075))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175069 (= res!144971 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8709 thiss!1204))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8714 thiss!1204))) ((_ extract 31 0) ((_ sign_extend 32) (size!4154 (buf!4591 thiss!1204))))))))

(declare-fun b!175070 () Bool)

(assert (=> b!175070 (= e!122075 (bvslt ((_ sign_extend 32) (bvsub nBits!348 i!590)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175071 () Bool)

(declare-fun array_inv!3895 (array!9418) Bool)

(assert (=> b!175071 (= e!122076 (array_inv!3895 (buf!4591 thiss!1204)))))

(assert (= (and start!38908 res!144972) b!175069))

(assert (= (and b!175069 res!144971) b!175070))

(assert (= start!38908 b!175071))

(declare-fun m!275317 () Bool)

(assert (=> start!38908 m!275317))

(declare-fun m!275319 () Bool)

(assert (=> b!175069 m!275319))

(declare-fun m!275321 () Bool)

(assert (=> b!175071 m!275321))

(check-sat (not b!175069) (not start!38908) (not b!175071))
(check-sat)
