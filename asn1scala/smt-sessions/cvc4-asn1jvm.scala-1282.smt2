; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36586 () Bool)

(assert start!36586)

(declare-fun nBits!601 () (_ BitVec 32))

(declare-datatypes ((array!8697 0))(
  ( (array!8698 (arr!4782 (Array (_ BitVec 32) (_ BitVec 8))) (size!3861 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6878 0))(
  ( (BitStream!6879 (buf!4313 array!8697) (currentByte!8170 (_ BitVec 32)) (currentBit!8165 (_ BitVec 32))) )
))
(declare-fun thiss!1909 () BitStream!6878)

(assert (=> start!36586 (and (bvsge nBits!601 #b00000000000000000000000000000001) (bvslt nBits!601 #b00000000000000000000000000001000) (or (bvsgt ((_ sign_extend 32) (size!3861 (buf!4313 thiss!1909))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!8170 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!8165 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!36586 true))

(declare-fun e!116759 () Bool)

(declare-fun inv!12 (BitStream!6878) Bool)

(assert (=> start!36586 (and (inv!12 thiss!1909) e!116759)))

(declare-fun b!168183 () Bool)

(declare-fun array_inv!3602 (array!8697) Bool)

(assert (=> b!168183 (= e!116759 (array_inv!3602 (buf!4313 thiss!1909)))))

(assert (= start!36586 b!168183))

(declare-fun m!267815 () Bool)

(assert (=> start!36586 m!267815))

(declare-fun m!267817 () Bool)

(assert (=> b!168183 m!267817))

(push 1)

(assert (not start!36586))

(assert (not b!168183))

(check-sat)

(pop 1)

(push 1)

(check-sat)

