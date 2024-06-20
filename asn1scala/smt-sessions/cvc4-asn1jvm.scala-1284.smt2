; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36612 () Bool)

(assert start!36612)

(declare-fun res!140030 () Bool)

(declare-fun e!116803 () Bool)

(assert (=> start!36612 (=> (not res!140030) (not e!116803))))

(declare-fun nBits!601 () (_ BitVec 32))

(declare-datatypes ((array!8711 0))(
  ( (array!8712 (arr!4788 (Array (_ BitVec 32) (_ BitVec 8))) (size!3867 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6890 0))(
  ( (BitStream!6891 (buf!4319 array!8711) (currentByte!8178 (_ BitVec 32)) (currentBit!8173 (_ BitVec 32))) )
))
(declare-fun thiss!1909 () BitStream!6890)

(assert (=> start!36612 (= res!140030 (and (bvsge nBits!601 #b00000000000000000000000000000001) (bvslt nBits!601 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3867 (buf!4319 thiss!1909))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8178 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8173 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3867 (buf!4319 thiss!1909))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8178 thiss!1909)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8173 thiss!1909)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!36612 e!116803))

(assert (=> start!36612 true))

(declare-fun e!116804 () Bool)

(declare-fun inv!12 (BitStream!6890) Bool)

(assert (=> start!36612 (and (inv!12 thiss!1909) e!116804)))

(declare-fun b!168209 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168209 (= e!116803 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8173 thiss!1909))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8178 thiss!1909))) ((_ extract 31 0) ((_ sign_extend 32) (size!3867 (buf!4319 thiss!1909)))))))))

(declare-fun b!168210 () Bool)

(declare-fun array_inv!3608 (array!8711) Bool)

(assert (=> b!168210 (= e!116804 (array_inv!3608 (buf!4319 thiss!1909)))))

(assert (= (and start!36612 res!140030) b!168209))

(assert (= start!36612 b!168210))

(declare-fun m!267847 () Bool)

(assert (=> start!36612 m!267847))

(declare-fun m!267849 () Bool)

(assert (=> b!168209 m!267849))

(declare-fun m!267851 () Bool)

(assert (=> b!168210 m!267851))

(push 1)

(assert (not b!168210))

(assert (not b!168209))

(assert (not start!36612))

(check-sat)

(pop 1)

(push 1)

(check-sat)

