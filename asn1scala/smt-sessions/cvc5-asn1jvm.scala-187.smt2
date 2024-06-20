; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3920 () Bool)

(assert start!3920)

(declare-fun res!15308 () Bool)

(declare-fun e!10720 () Bool)

(assert (=> start!3920 (=> (not res!15308) (not e!10720))))

(declare-fun origOffset!1 () (_ BitVec 64))

(declare-datatypes ((array!983 0))(
  ( (array!984 (arr!847 (Array (_ BitVec 32) (_ BitVec 8))) (size!418 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!796 0))(
  ( (BitStream!797 (buf!781 array!983) (currentByte!1951 (_ BitVec 32)) (currentBit!1946 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!796)

(declare-fun newOffset!1 () (_ BitVec 64))

(assert (=> start!3920 (= res!15308 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1) (bvsle ((_ sign_extend 32) (size!418 (buf!781 b!162))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1951 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1946 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!418 (buf!781 b!162))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1951 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1946 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3920 e!10720))

(assert (=> start!3920 true))

(declare-fun e!10721 () Bool)

(declare-fun inv!12 (BitStream!796) Bool)

(assert (=> start!3920 (and (inv!12 b!162) e!10721)))

(declare-fun b!16993 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!16993 (= e!10720 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1946 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1951 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (size!418 (buf!781 b!162)))))))))

(declare-fun b!16994 () Bool)

(declare-fun array_inv!407 (array!983) Bool)

(assert (=> b!16994 (= e!10721 (array_inv!407 (buf!781 b!162)))))

(assert (= (and start!3920 res!15308) b!16993))

(assert (= start!3920 b!16994))

(declare-fun m!23189 () Bool)

(assert (=> start!3920 m!23189))

(declare-fun m!23191 () Bool)

(assert (=> b!16993 m!23191))

(declare-fun m!23193 () Bool)

(assert (=> b!16994 m!23193))

(push 1)

(assert (not b!16994))

(assert (not start!3920))

(assert (not b!16993))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5530 () Bool)

(assert (=> d!5530 (= (array_inv!407 (buf!781 b!162)) (bvsge (size!418 (buf!781 b!162)) #b00000000000000000000000000000000))))

(assert (=> b!16994 d!5530))

(declare-fun d!5532 () Bool)

(assert (=> d!5532 (= (inv!12 b!162) (invariant!0 (currentBit!1946 b!162) (currentByte!1951 b!162) (size!418 (buf!781 b!162))))))

(declare-fun bs!1539 () Bool)

(assert (= bs!1539 d!5532))

(declare-fun m!23209 () Bool)

(assert (=> bs!1539 m!23209))

(assert (=> start!3920 d!5532))

(declare-fun d!5536 () Bool)

