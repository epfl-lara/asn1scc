; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38104 () Bool)

(assert start!38104)

(declare-fun nBits!575 () (_ BitVec 32))

(declare-datatypes ((array!9161 0))(
  ( (array!9162 (arr!4979 (Array (_ BitVec 32) (_ BitVec 8))) (size!4049 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7206 0))(
  ( (BitStream!7207 (buf!4477 array!9161) (currentByte!8509 (_ BitVec 32)) (currentBit!8504 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7206)

(assert (=> start!38104 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!4049 (buf!4477 thiss!1817))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!8509 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!8504 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!38104 true))

(declare-fun e!119964 () Bool)

(declare-fun inv!12 (BitStream!7206) Bool)

(assert (=> start!38104 (and (inv!12 thiss!1817) e!119964)))

(declare-fun b!171726 () Bool)

(declare-fun array_inv!3790 (array!9161) Bool)

(assert (=> b!171726 (= e!119964 (array_inv!3790 (buf!4477 thiss!1817)))))

(assert (= start!38104 b!171726))

(declare-fun m!270971 () Bool)

(assert (=> start!38104 m!270971))

(declare-fun m!270973 () Bool)

(assert (=> b!171726 m!270973))

(check-sat (not start!38104) (not b!171726))
(check-sat)
