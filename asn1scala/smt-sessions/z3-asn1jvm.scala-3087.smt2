; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71052 () Bool)

(assert start!71052)

(declare-fun res!263530 () Bool)

(declare-fun e!231031 () Bool)

(assert (=> start!71052 (=> (not res!263530) (not e!231031))))

(declare-fun nBits!542 () (_ BitVec 32))

(assert (=> start!71052 (= res!263530 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000)))))

(assert (=> start!71052 e!231031))

(assert (=> start!71052 true))

(declare-datatypes ((array!20282 0))(
  ( (array!20283 (arr!9932 (Array (_ BitVec 32) (_ BitVec 8))) (size!8840 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13842 0))(
  ( (BitStream!13843 (buf!7982 array!20282) (currentByte!14717 (_ BitVec 32)) (currentBit!14712 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13842)

(declare-fun e!231032 () Bool)

(declare-fun inv!12 (BitStream!13842) Bool)

(assert (=> start!71052 (and (inv!12 thiss!1780) e!231032)))

(declare-fun b!320840 () Bool)

(declare-fun res!263529 () Bool)

(assert (=> b!320840 (=> (not res!263529) (not e!231031))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320840 (= res!263529 (validate_offset_bits!1 ((_ sign_extend 32) (size!8840 (buf!7982 thiss!1780))) ((_ sign_extend 32) (currentByte!14717 thiss!1780)) ((_ sign_extend 32) (currentBit!14712 thiss!1780)) ((_ sign_extend 32) nBits!542)))))

(declare-fun b!320841 () Bool)

(assert (=> b!320841 (= e!231031 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!8840 (buf!7982 thiss!1780))) ((_ sign_extend 32) (currentByte!14717 thiss!1780)) ((_ sign_extend 32) (currentBit!14712 thiss!1780)) ((_ sign_extend 32) nBits!542))))))

(declare-fun b!320842 () Bool)

(declare-fun array_inv!8392 (array!20282) Bool)

(assert (=> b!320842 (= e!231032 (array_inv!8392 (buf!7982 thiss!1780)))))

(assert (= (and start!71052 res!263530) b!320840))

(assert (= (and b!320840 res!263529) b!320841))

(assert (= start!71052 b!320842))

(declare-fun m!459201 () Bool)

(assert (=> start!71052 m!459201))

(declare-fun m!459203 () Bool)

(assert (=> b!320840 m!459203))

(assert (=> b!320841 m!459203))

(declare-fun m!459205 () Bool)

(assert (=> b!320842 m!459205))

(check-sat (not b!320842) (not b!320841) (not b!320840) (not start!71052))
(check-sat)
