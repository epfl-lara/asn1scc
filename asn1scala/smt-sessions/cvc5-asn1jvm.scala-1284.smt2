; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36608 () Bool)

(assert start!36608)

(declare-fun res!140024 () Bool)

(declare-fun e!116785 () Bool)

(assert (=> start!36608 (=> (not res!140024) (not e!116785))))

(declare-fun nBits!601 () (_ BitVec 32))

(declare-datatypes ((array!8707 0))(
  ( (array!8708 (arr!4786 (Array (_ BitVec 32) (_ BitVec 8))) (size!3865 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6886 0))(
  ( (BitStream!6887 (buf!4317 array!8707) (currentByte!8176 (_ BitVec 32)) (currentBit!8171 (_ BitVec 32))) )
))
(declare-fun thiss!1909 () BitStream!6886)

(assert (=> start!36608 (= res!140024 (and (bvsge nBits!601 #b00000000000000000000000000000001) (bvslt nBits!601 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3865 (buf!4317 thiss!1909))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8176 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8171 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3865 (buf!4317 thiss!1909))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8176 thiss!1909)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8171 thiss!1909)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!36608 e!116785))

(assert (=> start!36608 true))

(declare-fun e!116786 () Bool)

(declare-fun inv!12 (BitStream!6886) Bool)

(assert (=> start!36608 (and (inv!12 thiss!1909) e!116786)))

(declare-fun b!168197 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168197 (= e!116785 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8171 thiss!1909))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8176 thiss!1909))) ((_ extract 31 0) ((_ sign_extend 32) (size!3865 (buf!4317 thiss!1909)))))))))

(declare-fun b!168198 () Bool)

(declare-fun array_inv!3606 (array!8707) Bool)

(assert (=> b!168198 (= e!116786 (array_inv!3606 (buf!4317 thiss!1909)))))

(assert (= (and start!36608 res!140024) b!168197))

(assert (= start!36608 b!168198))

(declare-fun m!267835 () Bool)

(assert (=> start!36608 m!267835))

(declare-fun m!267837 () Bool)

(assert (=> b!168197 m!267837))

(declare-fun m!267839 () Bool)

(assert (=> b!168198 m!267839))

(push 1)

(assert (not start!36608))

(assert (not b!168198))

(assert (not b!168197))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59217 () Bool)

(assert (=> d!59217 (= (inv!12 thiss!1909) (invariant!0 (currentBit!8171 thiss!1909) (currentByte!8176 thiss!1909) (size!3865 (buf!4317 thiss!1909))))))

(assert (=> start!36608 d!59217))

