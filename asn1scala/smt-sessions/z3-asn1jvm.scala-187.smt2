; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3922 () Bool)

(assert start!3922)

(declare-fun res!15311 () Bool)

(declare-fun e!10729 () Bool)

(assert (=> start!3922 (=> (not res!15311) (not e!10729))))

(declare-fun origOffset!1 () (_ BitVec 64))

(declare-datatypes ((array!985 0))(
  ( (array!986 (arr!848 (Array (_ BitVec 32) (_ BitVec 8))) (size!419 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!798 0))(
  ( (BitStream!799 (buf!782 array!985) (currentByte!1952 (_ BitVec 32)) (currentBit!1947 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!798)

(declare-fun newOffset!1 () (_ BitVec 64))

(assert (=> start!3922 (= res!15311 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1) (bvsle ((_ sign_extend 32) (size!419 (buf!782 b!162))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1952 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1947 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!419 (buf!782 b!162))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1952 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1947 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3922 e!10729))

(assert (=> start!3922 true))

(declare-fun e!10730 () Bool)

(declare-fun inv!12 (BitStream!798) Bool)

(assert (=> start!3922 (and (inv!12 b!162) e!10730)))

(declare-fun b!16999 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!16999 (= e!10729 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1947 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1952 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (size!419 (buf!782 b!162)))))))))

(declare-fun b!17000 () Bool)

(declare-fun array_inv!408 (array!985) Bool)

(assert (=> b!17000 (= e!10730 (array_inv!408 (buf!782 b!162)))))

(assert (= (and start!3922 res!15311) b!16999))

(assert (= start!3922 b!17000))

(declare-fun m!23195 () Bool)

(assert (=> start!3922 m!23195))

(declare-fun m!23197 () Bool)

(assert (=> b!16999 m!23197))

(declare-fun m!23199 () Bool)

(assert (=> b!17000 m!23199))

(check-sat (not start!3922) (not b!16999) (not b!17000))
(check-sat)
(get-model)

(declare-fun d!5526 () Bool)

(assert (=> d!5526 (= (inv!12 b!162) (invariant!0 (currentBit!1947 b!162) (currentByte!1952 b!162) (size!419 (buf!782 b!162))))))

(declare-fun bs!1538 () Bool)

(assert (= bs!1538 d!5526))

(declare-fun m!23207 () Bool)

(assert (=> bs!1538 m!23207))

(assert (=> start!3922 d!5526))

(declare-fun d!5528 () Bool)

(assert (=> d!5528 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1947 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1952 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (size!419 (buf!782 b!162))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1947 b!162))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1947 b!162))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1952 b!162))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1952 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (size!419 (buf!782 b!162))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1947 b!162))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1952 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (size!419 (buf!782 b!162)))))))))))

(assert (=> b!16999 d!5528))

(declare-fun d!5534 () Bool)

(assert (=> d!5534 (= (array_inv!408 (buf!782 b!162)) (bvsge (size!419 (buf!782 b!162)) #b00000000000000000000000000000000))))

(assert (=> b!17000 d!5534))

(check-sat (not d!5526))
(check-sat)
