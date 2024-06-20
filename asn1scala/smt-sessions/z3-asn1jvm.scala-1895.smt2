; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49656 () Bool)

(assert start!49656)

(declare-fun res!195963 () Bool)

(declare-fun e!161946 () Bool)

(assert (=> start!49656 (=> (not res!195963) (not e!161946))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-datatypes ((array!12260 0))(
  ( (array!12261 (arr!6374 (Array (_ BitVec 32) (_ BitVec 8))) (size!5387 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9738 0))(
  ( (BitStream!9739 (buf!5862 array!12260) (currentByte!10915 (_ BitVec 32)) (currentBit!10910 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9738)

(declare-fun i!546 () (_ BitVec 32))

(assert (=> start!49656 (= res!195963 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5387 (buf!5862 bs!63))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10915 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10910 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5387 (buf!5862 bs!63))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!10915 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!10910 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!49656 e!161946))

(assert (=> start!49656 true))

(declare-fun e!161947 () Bool)

(declare-fun inv!12 (BitStream!9738) Bool)

(assert (=> start!49656 (and (inv!12 bs!63) e!161947)))

(declare-fun b!234292 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!234292 (= e!161946 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10910 bs!63))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10915 bs!63))) ((_ extract 31 0) ((_ sign_extend 32) (size!5387 (buf!5862 bs!63)))))))))

(declare-fun b!234293 () Bool)

(declare-fun array_inv!5128 (array!12260) Bool)

(assert (=> b!234293 (= e!161947 (array_inv!5128 (buf!5862 bs!63)))))

(assert (= (and start!49656 res!195963) b!234292))

(assert (= start!49656 b!234293))

(declare-fun m!356939 () Bool)

(assert (=> start!49656 m!356939))

(declare-fun m!356941 () Bool)

(assert (=> b!234292 m!356941))

(declare-fun m!356943 () Bool)

(assert (=> b!234293 m!356943))

(check-sat (not b!234293) (not b!234292) (not start!49656))
(check-sat)
(get-model)

(declare-fun d!78940 () Bool)

(assert (=> d!78940 (= (array_inv!5128 (buf!5862 bs!63)) (bvsge (size!5387 (buf!5862 bs!63)) #b00000000000000000000000000000000))))

(assert (=> b!234293 d!78940))

(declare-fun d!78942 () Bool)

(assert (=> d!78942 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10910 bs!63))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10915 bs!63))) ((_ extract 31 0) ((_ sign_extend 32) (size!5387 (buf!5862 bs!63))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10910 bs!63))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10910 bs!63))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10915 bs!63))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10915 bs!63))) ((_ extract 31 0) ((_ sign_extend 32) (size!5387 (buf!5862 bs!63))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10910 bs!63))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10915 bs!63))) ((_ extract 31 0) ((_ sign_extend 32) (size!5387 (buf!5862 bs!63)))))))))))

(assert (=> b!234292 d!78942))

(declare-fun d!78944 () Bool)

(assert (=> d!78944 (= (inv!12 bs!63) (invariant!0 (currentBit!10910 bs!63) (currentByte!10915 bs!63) (size!5387 (buf!5862 bs!63))))))

(declare-fun bs!19674 () Bool)

(assert (= bs!19674 d!78944))

(declare-fun m!356951 () Bool)

(assert (=> bs!19674 m!356951))

(assert (=> start!49656 d!78944))

(check-sat (not d!78944))
(check-sat)
