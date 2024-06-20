; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63664 () Bool)

(assert start!63664)

(declare-fun res!235285 () Bool)

(declare-fun e!202967 () Bool)

(assert (=> start!63664 (=> (not res!235285) (not e!202967))))

(declare-datatypes ((array!16595 0))(
  ( (array!16596 (arr!8159 (Array (_ BitVec 32) (_ BitVec 8))) (size!7163 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12696 0))(
  ( (BitStream!12697 (buf!7409 array!16595) (currentByte!13735 (_ BitVec 32)) (currentBit!13730 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12696)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63664 (= res!235285 (validate_offset_bits!1 ((_ sign_extend 32) (size!7163 (buf!7409 thiss!1929))) ((_ sign_extend 32) (currentByte!13735 thiss!1929)) ((_ sign_extend 32) (currentBit!13730 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13730 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63664 e!202967))

(declare-fun e!202968 () Bool)

(declare-fun inv!12 (BitStream!12696) Bool)

(assert (=> start!63664 (and (inv!12 thiss!1929) e!202968)))

(declare-fun b!283990 () Bool)

(declare-fun res!235286 () Bool)

(assert (=> b!283990 (=> (not res!235286) (not e!202967))))

(assert (=> b!283990 (= res!235286 (= (currentBit!13730 thiss!1929) #b00000000000000000000000000000000))))

(declare-fun b!283991 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283991 (= e!202967 (not (invariant!0 (currentBit!13730 thiss!1929) (currentByte!13735 thiss!1929) (size!7163 (buf!7409 thiss!1929)))))))

(declare-fun b!283992 () Bool)

(declare-fun array_inv!6856 (array!16595) Bool)

(assert (=> b!283992 (= e!202968 (array_inv!6856 (buf!7409 thiss!1929)))))

(assert (= (and start!63664 res!235285) b!283990))

(assert (= (and b!283990 res!235286) b!283991))

(assert (= start!63664 b!283992))

(declare-fun m!417119 () Bool)

(assert (=> start!63664 m!417119))

(declare-fun m!417121 () Bool)

(assert (=> start!63664 m!417121))

(declare-fun m!417123 () Bool)

(assert (=> b!283991 m!417123))

(declare-fun m!417125 () Bool)

(assert (=> b!283992 m!417125))

(check-sat (not start!63664) (not b!283992) (not b!283991))
(check-sat)
(get-model)

(declare-fun d!97628 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97628 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7163 (buf!7409 thiss!1929))) ((_ sign_extend 32) (currentByte!13735 thiss!1929)) ((_ sign_extend 32) (currentBit!13730 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13730 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7163 (buf!7409 thiss!1929))) ((_ sign_extend 32) (currentByte!13735 thiss!1929)) ((_ sign_extend 32) (currentBit!13730 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13730 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24666 () Bool)

(assert (= bs!24666 d!97628))

(declare-fun m!417135 () Bool)

(assert (=> bs!24666 m!417135))

(assert (=> start!63664 d!97628))

(declare-fun d!97634 () Bool)

(assert (=> d!97634 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13730 thiss!1929) (currentByte!13735 thiss!1929) (size!7163 (buf!7409 thiss!1929))))))

(declare-fun bs!24667 () Bool)

(assert (= bs!24667 d!97634))

(assert (=> bs!24667 m!417123))

(assert (=> start!63664 d!97634))

(declare-fun d!97640 () Bool)

(assert (=> d!97640 (= (array_inv!6856 (buf!7409 thiss!1929)) (bvsge (size!7163 (buf!7409 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!283992 d!97640))

(declare-fun d!97642 () Bool)

(assert (=> d!97642 (= (invariant!0 (currentBit!13730 thiss!1929) (currentByte!13735 thiss!1929) (size!7163 (buf!7409 thiss!1929))) (and (bvsge (currentBit!13730 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13730 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13735 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13735 thiss!1929) (size!7163 (buf!7409 thiss!1929))) (and (= (currentBit!13730 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13735 thiss!1929) (size!7163 (buf!7409 thiss!1929)))))))))

(assert (=> b!283991 d!97642))

(check-sat (not d!97634) (not d!97628))
(check-sat)
