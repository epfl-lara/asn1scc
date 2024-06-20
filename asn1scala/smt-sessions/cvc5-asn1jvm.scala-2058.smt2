; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52384 () Bool)

(assert start!52384)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13213 0))(
  ( (array!13214 (arr!6775 (Array (_ BitVec 32) (_ BitVec 8))) (size!5788 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10498 0))(
  ( (BitStream!10499 (buf!6254 array!13213) (currentByte!11614 (_ BitVec 32)) (currentBit!11609 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10498)

(assert (=> start!52384 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297) (bvsle ((_ sign_extend 32) (size!5788 (buf!6254 thiss!1005))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11614 thiss!1005)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11609 thiss!1005)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5788 (buf!6254 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!11614 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!11609 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!52384 true))

(declare-fun e!167110 () Bool)

(declare-fun inv!12 (BitStream!10498) Bool)

(assert (=> start!52384 (and (inv!12 thiss!1005) e!167110)))

(declare-fun b!241154 () Bool)

(declare-fun array_inv!5529 (array!13213) Bool)

(assert (=> b!241154 (= e!167110 (array_inv!5529 (buf!6254 thiss!1005)))))

(assert (= start!52384 b!241154))

(declare-fun m!363873 () Bool)

(assert (=> start!52384 m!363873))

(declare-fun m!363875 () Bool)

(assert (=> b!241154 m!363875))

(push 1)

(assert (not start!52384))

(assert (not b!241154))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81472 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!81472 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11609 thiss!1005) (currentByte!11614 thiss!1005) (size!5788 (buf!6254 thiss!1005))))))

(declare-fun bs!20571 () Bool)

(assert (= bs!20571 d!81472))

(declare-fun m!363887 () Bool)

(assert (=> bs!20571 m!363887))

(assert (=> start!52384 d!81472))

(declare-fun d!81474 () Bool)

(assert (=> d!81474 (= (array_inv!5529 (buf!6254 thiss!1005)) (bvsge (size!5788 (buf!6254 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!241154 d!81474))

(push 1)

(assert (not d!81472))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

