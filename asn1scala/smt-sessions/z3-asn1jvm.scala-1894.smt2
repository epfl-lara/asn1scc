; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49640 () Bool)

(assert start!49640)

(declare-fun i!546 () (_ BitVec 32))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-datatypes ((array!12252 0))(
  ( (array!12253 (arr!6371 (Array (_ BitVec 32) (_ BitVec 8))) (size!5384 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9732 0))(
  ( (BitStream!9733 (buf!5859 array!12252) (currentByte!10911 (_ BitVec 32)) (currentBit!10906 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9732)

(assert (=> start!49640 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5384 (buf!5859 bs!63))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10911 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10906 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5384 (buf!5859 bs!63))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!10911 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!10906 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!49640 true))

(declare-fun e!161923 () Bool)

(declare-fun inv!12 (BitStream!9732) Bool)

(assert (=> start!49640 (and (inv!12 bs!63) e!161923)))

(declare-fun b!234278 () Bool)

(declare-fun array_inv!5125 (array!12252) Bool)

(assert (=> b!234278 (= e!161923 (array_inv!5125 (buf!5859 bs!63)))))

(assert (= start!49640 b!234278))

(declare-fun m!356921 () Bool)

(assert (=> start!49640 m!356921))

(declare-fun m!356923 () Bool)

(assert (=> b!234278 m!356923))

(check-sat (not start!49640) (not b!234278))
(check-sat)
(get-model)

(declare-fun d!78928 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78928 (= (inv!12 bs!63) (invariant!0 (currentBit!10906 bs!63) (currentByte!10911 bs!63) (size!5384 (buf!5859 bs!63))))))

(declare-fun bs!19669 () Bool)

(assert (= bs!19669 d!78928))

(declare-fun m!356929 () Bool)

(assert (=> bs!19669 m!356929))

(assert (=> start!49640 d!78928))

(declare-fun d!78930 () Bool)

(assert (=> d!78930 (= (array_inv!5125 (buf!5859 bs!63)) (bvsge (size!5384 (buf!5859 bs!63)) #b00000000000000000000000000000000))))

(assert (=> b!234278 d!78930))

(check-sat (not d!78928))
(check-sat)
(get-model)

(declare-fun d!78932 () Bool)

(assert (=> d!78932 (= (invariant!0 (currentBit!10906 bs!63) (currentByte!10911 bs!63) (size!5384 (buf!5859 bs!63))) (and (bvsge (currentBit!10906 bs!63) #b00000000000000000000000000000000) (bvslt (currentBit!10906 bs!63) #b00000000000000000000000000001000) (bvsge (currentByte!10911 bs!63) #b00000000000000000000000000000000) (or (bvslt (currentByte!10911 bs!63) (size!5384 (buf!5859 bs!63))) (and (= (currentBit!10906 bs!63) #b00000000000000000000000000000000) (= (currentByte!10911 bs!63) (size!5384 (buf!5859 bs!63)))))))))

(assert (=> d!78928 d!78932))

(check-sat)
