; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3904 () Bool)

(assert start!3904)

(declare-fun newOffset!1 () (_ BitVec 64))

(declare-fun origOffset!1 () (_ BitVec 64))

(declare-datatypes ((array!977 0))(
  ( (array!978 (arr!845 (Array (_ BitVec 32) (_ BitVec 8))) (size!416 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!792 0))(
  ( (BitStream!793 (buf!779 array!977) (currentByte!1948 (_ BitVec 32)) (currentBit!1943 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!792)

(assert (=> start!3904 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1) (bvsle ((_ sign_extend 32) (size!416 (buf!779 b!162))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1948 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1943 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!416 (buf!779 b!162))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1948 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1943 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3904 true))

(declare-fun e!10706 () Bool)

(declare-fun inv!12 (BitStream!792) Bool)

(assert (=> start!3904 (and (inv!12 b!162) e!10706)))

(declare-fun b!16985 () Bool)

(declare-fun array_inv!405 (array!977) Bool)

(assert (=> b!16985 (= e!10706 (array_inv!405 (buf!779 b!162)))))

(assert (= start!3904 b!16985))

(declare-fun m!23177 () Bool)

(assert (=> start!3904 m!23177))

(declare-fun m!23179 () Bool)

(assert (=> b!16985 m!23179))

(check-sat (not start!3904) (not b!16985))
(check-sat)
(get-model)

(declare-fun d!5512 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!5512 (= (inv!12 b!162) (invariant!0 (currentBit!1943 b!162) (currentByte!1948 b!162) (size!416 (buf!779 b!162))))))

(declare-fun bs!1533 () Bool)

(assert (= bs!1533 d!5512))

(declare-fun m!23185 () Bool)

(assert (=> bs!1533 m!23185))

(assert (=> start!3904 d!5512))

(declare-fun d!5514 () Bool)

(assert (=> d!5514 (= (array_inv!405 (buf!779 b!162)) (bvsge (size!416 (buf!779 b!162)) #b00000000000000000000000000000000))))

(assert (=> b!16985 d!5514))

(check-sat (not d!5512))
(check-sat)
(get-model)

(declare-fun d!5516 () Bool)

(assert (=> d!5516 (= (invariant!0 (currentBit!1943 b!162) (currentByte!1948 b!162) (size!416 (buf!779 b!162))) (and (bvsge (currentBit!1943 b!162) #b00000000000000000000000000000000) (bvslt (currentBit!1943 b!162) #b00000000000000000000000000001000) (bvsge (currentByte!1948 b!162) #b00000000000000000000000000000000) (or (bvslt (currentByte!1948 b!162) (size!416 (buf!779 b!162))) (and (= (currentBit!1943 b!162) #b00000000000000000000000000000000) (= (currentByte!1948 b!162) (size!416 (buf!779 b!162)))))))))

(assert (=> d!5512 d!5516))

(check-sat)
