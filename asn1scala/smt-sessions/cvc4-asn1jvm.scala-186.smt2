; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3906 () Bool)

(assert start!3906)

(declare-fun newOffset!1 () (_ BitVec 64))

(declare-fun origOffset!1 () (_ BitVec 64))

(declare-datatypes ((array!979 0))(
  ( (array!980 (arr!846 (Array (_ BitVec 32) (_ BitVec 8))) (size!417 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!794 0))(
  ( (BitStream!795 (buf!780 array!979) (currentByte!1949 (_ BitVec 32)) (currentBit!1944 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!794)

(assert (=> start!3906 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1) (bvsle ((_ sign_extend 32) (size!417 (buf!780 b!162))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1949 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1944 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!417 (buf!780 b!162))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1949 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1944 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3906 true))

(declare-fun e!10712 () Bool)

(declare-fun inv!12 (BitStream!794) Bool)

(assert (=> start!3906 (and (inv!12 b!162) e!10712)))

(declare-fun b!16988 () Bool)

(declare-fun array_inv!406 (array!979) Bool)

(assert (=> b!16988 (= e!10712 (array_inv!406 (buf!780 b!162)))))

(assert (= start!3906 b!16988))

(declare-fun m!23181 () Bool)

(assert (=> start!3906 m!23181))

(declare-fun m!23183 () Bool)

(assert (=> b!16988 m!23183))

(push 1)

(assert (not start!3906))

(assert (not b!16988))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

