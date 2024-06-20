; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3902 () Bool)

(assert start!3902)

(declare-fun newOffset!1 () (_ BitVec 64))

(declare-fun origOffset!1 () (_ BitVec 64))

(declare-datatypes ((array!975 0))(
  ( (array!976 (arr!844 (Array (_ BitVec 32) (_ BitVec 8))) (size!415 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!790 0))(
  ( (BitStream!791 (buf!778 array!975) (currentByte!1947 (_ BitVec 32)) (currentBit!1942 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!790)

(assert (=> start!3902 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1) (bvsle ((_ sign_extend 32) (size!415 (buf!778 b!162))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1947 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1942 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!415 (buf!778 b!162))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1947 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1942 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3902 true))

(declare-fun e!10700 () Bool)

(declare-fun inv!12 (BitStream!790) Bool)

(assert (=> start!3902 (and (inv!12 b!162) e!10700)))

(declare-fun b!16982 () Bool)

(declare-fun array_inv!404 (array!975) Bool)

(assert (=> b!16982 (= e!10700 (array_inv!404 (buf!778 b!162)))))

(assert (= start!3902 b!16982))

(declare-fun m!23173 () Bool)

(assert (=> start!3902 m!23173))

(declare-fun m!23175 () Bool)

(assert (=> b!16982 m!23175))

(push 1)

(assert (not start!3902))

(assert (not b!16982))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5518 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!5518 (= (inv!12 b!162) (invariant!0 (currentBit!1942 b!162) (currentByte!1947 b!162) (size!415 (buf!778 b!162))))))

(declare-fun bs!1534 () Bool)

(assert (= bs!1534 d!5518))

(declare-fun m!23187 () Bool)

(assert (=> bs!1534 m!23187))

(assert (=> start!3902 d!5518))

(declare-fun d!5520 () Bool)

