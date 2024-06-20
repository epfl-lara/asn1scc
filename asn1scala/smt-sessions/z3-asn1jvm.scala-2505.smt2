; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63344 () Bool)

(assert start!63344)

(declare-fun lt!417960 () (_ BitVec 32))

(declare-fun lt!417959 () (_ BitVec 32))

(assert (=> start!63344 (= lt!417960 (bvand lt!417959 #b10000000000000000000000000000000))))

(declare-datatypes ((array!16479 0))(
  ( (array!16480 (arr!8114 (Array (_ BitVec 32) (_ BitVec 8))) (size!7118 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12606 0))(
  ( (BitStream!12607 (buf!7364 array!16479) (currentByte!13636 (_ BitVec 32)) (currentBit!13631 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12606)

(assert (=> start!63344 (= lt!417959 (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13636 thiss!1939) #b00000000000000000000000000000001)))))

(assert (=> start!63344 (and (= lt!417960 (bvand (currentBit!13631 thiss!1939) #b10000000000000000000000000000000)) (not (= lt!417960 (bvand (bvadd lt!417959 (currentBit!13631 thiss!1939)) #b10000000000000000000000000000000))))))

(declare-fun e!202532 () Bool)

(declare-fun inv!12 (BitStream!12606) Bool)

(assert (=> start!63344 (and (inv!12 thiss!1939) e!202532)))

(declare-fun b!283626 () Bool)

(declare-fun array_inv!6811 (array!16479) Bool)

(assert (=> b!283626 (= e!202532 (array_inv!6811 (buf!7364 thiss!1939)))))

(assert (= start!63344 b!283626))

(declare-fun m!416675 () Bool)

(assert (=> start!63344 m!416675))

(declare-fun m!416677 () Bool)

(assert (=> b!283626 m!416677))

(check-sat (not start!63344) (not b!283626))
(check-sat)
(get-model)

(declare-fun d!97330 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97330 (= (inv!12 thiss!1939) (invariant!0 (currentBit!13631 thiss!1939) (currentByte!13636 thiss!1939) (size!7118 (buf!7364 thiss!1939))))))

(declare-fun bs!24570 () Bool)

(assert (= bs!24570 d!97330))

(declare-fun m!416683 () Bool)

(assert (=> bs!24570 m!416683))

(assert (=> start!63344 d!97330))

(declare-fun d!97340 () Bool)

(assert (=> d!97340 (= (array_inv!6811 (buf!7364 thiss!1939)) (bvsge (size!7118 (buf!7364 thiss!1939)) #b00000000000000000000000000000000))))

(assert (=> b!283626 d!97340))

(check-sat (not d!97330))
(check-sat)
(get-model)

(declare-fun d!97342 () Bool)

(assert (=> d!97342 (= (invariant!0 (currentBit!13631 thiss!1939) (currentByte!13636 thiss!1939) (size!7118 (buf!7364 thiss!1939))) (and (bvsge (currentBit!13631 thiss!1939) #b00000000000000000000000000000000) (bvslt (currentBit!13631 thiss!1939) #b00000000000000000000000000001000) (bvsge (currentByte!13636 thiss!1939) #b00000000000000000000000000000000) (or (bvslt (currentByte!13636 thiss!1939) (size!7118 (buf!7364 thiss!1939))) (and (= (currentBit!13631 thiss!1939) #b00000000000000000000000000000000) (= (currentByte!13636 thiss!1939) (size!7118 (buf!7364 thiss!1939)))))))))

(assert (=> d!97330 d!97342))

(check-sat)
