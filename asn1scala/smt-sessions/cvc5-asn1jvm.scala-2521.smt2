; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63662 () Bool)

(assert start!63662)

(declare-fun res!235279 () Bool)

(declare-fun e!202959 () Bool)

(assert (=> start!63662 (=> (not res!235279) (not e!202959))))

(declare-datatypes ((array!16593 0))(
  ( (array!16594 (arr!8158 (Array (_ BitVec 32) (_ BitVec 8))) (size!7162 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12694 0))(
  ( (BitStream!12695 (buf!7408 array!16593) (currentByte!13734 (_ BitVec 32)) (currentBit!13729 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12694)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63662 (= res!235279 (validate_offset_bits!1 ((_ sign_extend 32) (size!7162 (buf!7408 thiss!1929))) ((_ sign_extend 32) (currentByte!13734 thiss!1929)) ((_ sign_extend 32) (currentBit!13729 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13729 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63662 e!202959))

(declare-fun e!202957 () Bool)

(declare-fun inv!12 (BitStream!12694) Bool)

(assert (=> start!63662 (and (inv!12 thiss!1929) e!202957)))

(declare-fun b!283981 () Bool)

(declare-fun res!235280 () Bool)

(assert (=> b!283981 (=> (not res!235280) (not e!202959))))

(assert (=> b!283981 (= res!235280 (= (currentBit!13729 thiss!1929) #b00000000000000000000000000000000))))

(declare-fun b!283982 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283982 (= e!202959 (not (invariant!0 (currentBit!13729 thiss!1929) (currentByte!13734 thiss!1929) (size!7162 (buf!7408 thiss!1929)))))))

(declare-fun b!283983 () Bool)

(declare-fun array_inv!6855 (array!16593) Bool)

(assert (=> b!283983 (= e!202957 (array_inv!6855 (buf!7408 thiss!1929)))))

(assert (= (and start!63662 res!235279) b!283981))

(assert (= (and b!283981 res!235280) b!283982))

(assert (= start!63662 b!283983))

(declare-fun m!417111 () Bool)

(assert (=> start!63662 m!417111))

(declare-fun m!417113 () Bool)

(assert (=> start!63662 m!417113))

(declare-fun m!417115 () Bool)

(assert (=> b!283982 m!417115))

(declare-fun m!417117 () Bool)

(assert (=> b!283983 m!417117))

(push 1)

(assert (not b!283982))

(assert (not start!63662))

(assert (not b!283983))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97630 () Bool)

(assert (=> d!97630 (= (invariant!0 (currentBit!13729 thiss!1929) (currentByte!13734 thiss!1929) (size!7162 (buf!7408 thiss!1929))) (and (bvsge (currentBit!13729 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13729 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13734 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13734 thiss!1929) (size!7162 (buf!7408 thiss!1929))) (and (= (currentBit!13729 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13734 thiss!1929) (size!7162 (buf!7408 thiss!1929)))))))))

(assert (=> b!283982 d!97630))

(declare-fun d!97638 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97638 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7162 (buf!7408 thiss!1929))) ((_ sign_extend 32) (currentByte!13734 thiss!1929)) ((_ sign_extend 32) (currentBit!13729 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13729 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7162 (buf!7408 thiss!1929))) ((_ sign_extend 32) (currentByte!13734 thiss!1929)) ((_ sign_extend 32) (currentBit!13729 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13729 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24668 () Bool)

(assert (= bs!24668 d!97638))

(declare-fun m!417137 () Bool)

(assert (=> bs!24668 m!417137))

(assert (=> start!63662 d!97638))

(declare-fun d!97644 () Bool)

(assert (=> d!97644 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13729 thiss!1929) (currentByte!13734 thiss!1929) (size!7162 (buf!7408 thiss!1929))))))

(declare-fun bs!24669 () Bool)

(assert (= bs!24669 d!97644))

(assert (=> bs!24669 m!417115))

(assert (=> start!63662 d!97644))

(declare-fun d!97646 () Bool)

(assert (=> d!97646 (= (array_inv!6855 (buf!7408 thiss!1929)) (bvsge (size!7162 (buf!7408 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!283983 d!97646))

(push 1)

