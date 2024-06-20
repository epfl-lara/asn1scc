; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36592 () Bool)

(assert start!36592)

(declare-fun nBits!601 () (_ BitVec 32))

(declare-datatypes ((array!8703 0))(
  ( (array!8704 (arr!4785 (Array (_ BitVec 32) (_ BitVec 8))) (size!3864 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6884 0))(
  ( (BitStream!6885 (buf!4316 array!8703) (currentByte!8173 (_ BitVec 32)) (currentBit!8168 (_ BitVec 32))) )
))
(declare-fun thiss!1909 () BitStream!6884)

(assert (=> start!36592 (and (bvsge nBits!601 #b00000000000000000000000000000001) (bvslt nBits!601 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3864 (buf!4316 thiss!1909))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8173 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8168 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3864 (buf!4316 thiss!1909))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!8173 thiss!1909)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!8168 thiss!1909)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!36592 true))

(declare-fun e!116777 () Bool)

(declare-fun inv!12 (BitStream!6884) Bool)

(assert (=> start!36592 (and (inv!12 thiss!1909) e!116777)))

(declare-fun b!168192 () Bool)

(declare-fun array_inv!3605 (array!8703) Bool)

(assert (=> b!168192 (= e!116777 (array_inv!3605 (buf!4316 thiss!1909)))))

(assert (= start!36592 b!168192))

(declare-fun m!267827 () Bool)

(assert (=> start!36592 m!267827))

(declare-fun m!267829 () Bool)

(assert (=> b!168192 m!267829))

(push 1)

(assert (not start!36592))

(assert (not b!168192))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

