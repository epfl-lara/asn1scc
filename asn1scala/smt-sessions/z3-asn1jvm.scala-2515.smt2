; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63522 () Bool)

(assert start!63522)

(declare-datatypes ((array!16545 0))(
  ( (array!16546 (arr!8141 (Array (_ BitVec 32) (_ BitVec 8))) (size!7145 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12660 0))(
  ( (BitStream!12661 (buf!7391 array!16545) (currentByte!13692 (_ BitVec 32)) (currentBit!13687 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12660)

(assert (=> start!63522 (and (bvsle ((_ sign_extend 32) (size!7145 (buf!7391 thiss!1929))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13692 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13687 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!7145 (buf!7391 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!13692 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!13687 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!202808 () Bool)

(declare-fun inv!12 (BitStream!12660) Bool)

(assert (=> start!63522 (and (inv!12 thiss!1929) e!202808)))

(declare-fun b!283845 () Bool)

(declare-fun array_inv!6838 (array!16545) Bool)

(assert (=> b!283845 (= e!202808 (array_inv!6838 (buf!7391 thiss!1929)))))

(assert (= start!63522 b!283845))

(declare-fun m!416963 () Bool)

(assert (=> start!63522 m!416963))

(declare-fun m!416965 () Bool)

(assert (=> b!283845 m!416965))

(check-sat (not b!283845) (not start!63522))
(check-sat)
(get-model)

(declare-fun d!97504 () Bool)

(assert (=> d!97504 (= (array_inv!6838 (buf!7391 thiss!1929)) (bvsge (size!7145 (buf!7391 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!283845 d!97504))

(declare-fun d!97506 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97506 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13687 thiss!1929) (currentByte!13692 thiss!1929) (size!7145 (buf!7391 thiss!1929))))))

(declare-fun bs!24627 () Bool)

(assert (= bs!24627 d!97506))

(declare-fun m!416971 () Bool)

(assert (=> bs!24627 m!416971))

(assert (=> start!63522 d!97506))

(check-sat (not d!97506))
(check-sat)
(get-model)

(declare-fun d!97512 () Bool)

(assert (=> d!97512 (= (invariant!0 (currentBit!13687 thiss!1929) (currentByte!13692 thiss!1929) (size!7145 (buf!7391 thiss!1929))) (and (bvsge (currentBit!13687 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13687 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13692 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13692 thiss!1929) (size!7145 (buf!7391 thiss!1929))) (and (= (currentBit!13687 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13692 thiss!1929) (size!7145 (buf!7391 thiss!1929)))))))))

(assert (=> d!97506 d!97512))

(check-sat)
