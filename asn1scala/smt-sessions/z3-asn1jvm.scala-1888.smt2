; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49604 () Bool)

(assert start!49604)

(declare-fun l!187 () (_ BitVec 64))

(assert (=> start!49604 (and (not (= (bvand l!187 #b0000000000000000000000000000000000000000000000000000000011111111) #b0000000000000000000000000000000000000000000000000000000010000000)) (= (bvand l!187 #b0000000000000000000000000000000000000000000000000000000010000000) #b0000000000000000000000000000000000000000000000000000000010000000) (let ((bdg!14465 (bvand (bvand l!187 #b0000000000000000000000000000000000000000000000000000000001111111) #b1000000000000000000000000000000000000000000000000000000000000000))) (and (not (= bdg!14465 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!14465 (bvand (bvsub (bvand l!187 #b0000000000000000000000000000000000000000000000000000000001111111) #b0000000000000000000000000000000000000000000000000000000010000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> start!49604 true))

(check-sat)
