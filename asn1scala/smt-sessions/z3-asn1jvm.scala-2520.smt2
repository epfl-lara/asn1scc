; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63634 () Bool)

(assert start!63634)

(declare-fun res!235267 () Bool)

(declare-fun e!202941 () Bool)

(assert (=> start!63634 (=> (not res!235267) (not e!202941))))

(declare-datatypes ((array!16586 0))(
  ( (array!16587 (arr!8156 (Array (_ BitVec 32) (_ BitVec 8))) (size!7160 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12690 0))(
  ( (BitStream!12691 (buf!7406 array!16586) (currentByte!13726 (_ BitVec 32)) (currentBit!13721 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12690)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63634 (= res!235267 (validate_offset_bits!1 ((_ sign_extend 32) (size!7160 (buf!7406 thiss!1929))) ((_ sign_extend 32) (currentByte!13726 thiss!1929)) ((_ sign_extend 32) (currentBit!13721 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13721 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63634 e!202941))

(declare-fun e!202939 () Bool)

(declare-fun inv!12 (BitStream!12690) Bool)

(assert (=> start!63634 (and (inv!12 thiss!1929) e!202939)))

(declare-fun b!283963 () Bool)

(declare-fun res!235268 () Bool)

(assert (=> b!283963 (=> (not res!235268) (not e!202941))))

(assert (=> b!283963 (= res!235268 (= (currentBit!13721 thiss!1929) #b00000000000000000000000000000000))))

(declare-fun b!283964 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283964 (= e!202941 (not (invariant!0 (currentBit!13721 thiss!1929) (currentByte!13726 thiss!1929) (size!7160 (buf!7406 thiss!1929)))))))

(declare-fun b!283965 () Bool)

(declare-fun array_inv!6853 (array!16586) Bool)

(assert (=> b!283965 (= e!202939 (array_inv!6853 (buf!7406 thiss!1929)))))

(assert (= (and start!63634 res!235267) b!283963))

(assert (= (and b!283963 res!235268) b!283964))

(assert (= start!63634 b!283965))

(declare-fun m!417089 () Bool)

(assert (=> start!63634 m!417089))

(declare-fun m!417091 () Bool)

(assert (=> start!63634 m!417091))

(declare-fun m!417093 () Bool)

(assert (=> b!283964 m!417093))

(declare-fun m!417095 () Bool)

(assert (=> b!283965 m!417095))

(check-sat (not start!63634) (not b!283965) (not b!283964))
(check-sat)
(get-model)

(declare-fun d!97604 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97604 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7160 (buf!7406 thiss!1929))) ((_ sign_extend 32) (currentByte!13726 thiss!1929)) ((_ sign_extend 32) (currentBit!13721 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13721 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7160 (buf!7406 thiss!1929))) ((_ sign_extend 32) (currentByte!13726 thiss!1929)) ((_ sign_extend 32) (currentBit!13721 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13721 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24657 () Bool)

(assert (= bs!24657 d!97604))

(declare-fun m!417105 () Bool)

(assert (=> bs!24657 m!417105))

(assert (=> start!63634 d!97604))

(declare-fun d!97608 () Bool)

(assert (=> d!97608 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13721 thiss!1929) (currentByte!13726 thiss!1929) (size!7160 (buf!7406 thiss!1929))))))

(declare-fun bs!24658 () Bool)

(assert (= bs!24658 d!97608))

(assert (=> bs!24658 m!417093))

(assert (=> start!63634 d!97608))

(declare-fun d!97614 () Bool)

(assert (=> d!97614 (= (array_inv!6853 (buf!7406 thiss!1929)) (bvsge (size!7160 (buf!7406 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!283965 d!97614))

(declare-fun d!97618 () Bool)

(assert (=> d!97618 (= (invariant!0 (currentBit!13721 thiss!1929) (currentByte!13726 thiss!1929) (size!7160 (buf!7406 thiss!1929))) (and (bvsge (currentBit!13721 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13721 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13726 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13726 thiss!1929) (size!7160 (buf!7406 thiss!1929))) (and (= (currentBit!13721 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13726 thiss!1929) (size!7160 (buf!7406 thiss!1929)))))))))

(assert (=> b!283964 d!97618))

(check-sat (not d!97608) (not d!97604))
(check-sat)
