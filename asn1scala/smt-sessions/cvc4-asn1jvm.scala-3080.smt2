; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70962 () Bool)

(assert start!70962)

(declare-fun nBits!545 () (_ BitVec 32))

(declare-datatypes ((array!20233 0))(
  ( (array!20234 (arr!9912 (Array (_ BitVec 32) (_ BitVec 8))) (size!8820 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13802 0))(
  ( (BitStream!13803 (buf!7962 array!20233) (currentByte!14690 (_ BitVec 32)) (currentBit!14685 (_ BitVec 32))) )
))
(declare-fun thiss!1788 () BitStream!13802)

(assert (=> start!70962 (and (bvsge nBits!545 #b00000000000000000000000000000000) (bvsle nBits!545 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8820 (buf!7962 thiss!1788))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14690 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14685 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8820 (buf!7962 thiss!1788))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14690 thiss!1788)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14685 thiss!1788)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!70962 true))

(declare-fun e!230870 () Bool)

(declare-fun inv!12 (BitStream!13802) Bool)

(assert (=> start!70962 (and (inv!12 thiss!1788) e!230870)))

(declare-fun b!320716 () Bool)

(declare-fun array_inv!8372 (array!20233) Bool)

(assert (=> b!320716 (= e!230870 (array_inv!8372 (buf!7962 thiss!1788)))))

(assert (= start!70962 b!320716))

(declare-fun m!459081 () Bool)

(assert (=> start!70962 m!459081))

(declare-fun m!459083 () Bool)

(assert (=> b!320716 m!459083))

(push 1)

(assert (not b!320716))

(assert (not start!70962))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

