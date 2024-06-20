; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3896 () Bool)

(assert start!3896)

(declare-fun newOffset!1 () (_ BitVec 64))

(declare-fun origOffset!1 () (_ BitVec 64))

(declare-datatypes ((array!969 0))(
  ( (array!970 (arr!841 (Array (_ BitVec 32) (_ BitVec 8))) (size!412 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!784 0))(
  ( (BitStream!785 (buf!775 array!969) (currentByte!1944 (_ BitVec 32)) (currentBit!1939 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!784)

(assert (=> start!3896 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1) (or (bvsgt ((_ sign_extend 32) (size!412 (buf!775 b!162))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1944 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1939 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!3896 true))

(declare-fun e!10682 () Bool)

(declare-fun inv!12 (BitStream!784) Bool)

(assert (=> start!3896 (and (inv!12 b!162) e!10682)))

(declare-fun b!16973 () Bool)

(declare-fun array_inv!401 (array!969) Bool)

(assert (=> b!16973 (= e!10682 (array_inv!401 (buf!775 b!162)))))

(assert (= start!3896 b!16973))

(declare-fun m!23161 () Bool)

(assert (=> start!3896 m!23161))

(declare-fun m!23163 () Bool)

(assert (=> b!16973 m!23163))

(push 1)

(assert (not b!16973))

(assert (not start!3896))

(check-sat)

(pop 1)

(push 1)

(check-sat)

