; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36584 () Bool)

(assert start!36584)

(declare-fun nBits!601 () (_ BitVec 32))

(declare-datatypes ((array!8695 0))(
  ( (array!8696 (arr!4781 (Array (_ BitVec 32) (_ BitVec 8))) (size!3860 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6876 0))(
  ( (BitStream!6877 (buf!4312 array!8695) (currentByte!8169 (_ BitVec 32)) (currentBit!8164 (_ BitVec 32))) )
))
(declare-fun thiss!1909 () BitStream!6876)

(assert (=> start!36584 (and (bvsge nBits!601 #b00000000000000000000000000000001) (bvslt nBits!601 #b00000000000000000000000000001000) (or (bvsgt ((_ sign_extend 32) (size!3860 (buf!4312 thiss!1909))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!8169 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!8164 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!36584 true))

(declare-fun e!116753 () Bool)

(declare-fun inv!12 (BitStream!6876) Bool)

(assert (=> start!36584 (and (inv!12 thiss!1909) e!116753)))

(declare-fun b!168180 () Bool)

(declare-fun array_inv!3601 (array!8695) Bool)

(assert (=> b!168180 (= e!116753 (array_inv!3601 (buf!4312 thiss!1909)))))

(assert (= start!36584 b!168180))

(declare-fun m!267811 () Bool)

(assert (=> start!36584 m!267811))

(declare-fun m!267813 () Bool)

(assert (=> b!168180 m!267813))

(check-sat (not b!168180) (not start!36584))
(check-sat)
