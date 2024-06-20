; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63308 () Bool)

(assert start!63308)

(declare-fun res!235052 () Bool)

(declare-fun e!202492 () Bool)

(assert (=> start!63308 (=> (not res!235052) (not e!202492))))

(declare-datatypes ((array!16464 0))(
  ( (array!16465 (arr!8108 (Array (_ BitVec 32) (_ BitVec 8))) (size!7112 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12594 0))(
  ( (BitStream!12595 (buf!7358 array!16464) (currentByte!13627 (_ BitVec 32)) (currentBit!13622 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12594)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63308 (= res!235052 (validate_offset_bits!1 ((_ sign_extend 32) (size!7112 (buf!7358 thiss!1939))) ((_ sign_extend 32) (currentByte!13627 thiss!1939)) ((_ sign_extend 32) (currentBit!13622 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13627 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13622 thiss!1939))) #b00000000000000000000000000001111))))))

(assert (=> start!63308 e!202492))

(declare-fun e!202493 () Bool)

(declare-fun inv!12 (BitStream!12594) Bool)

(assert (=> start!63308 (and (inv!12 thiss!1939) e!202493)))

(declare-fun b!283604 () Bool)

(assert (=> b!283604 (= e!202492 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!7112 (buf!7358 thiss!1939))) ((_ sign_extend 32) (currentByte!13627 thiss!1939)) ((_ sign_extend 32) (currentBit!13622 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13622 thiss!1939)) #b00000000000000000000000000000111)))))))

(declare-fun b!283605 () Bool)

(declare-fun array_inv!6805 (array!16464) Bool)

(assert (=> b!283605 (= e!202493 (array_inv!6805 (buf!7358 thiss!1939)))))

(assert (= (and start!63308 res!235052) b!283604))

(assert (= start!63308 b!283605))

(declare-fun m!416631 () Bool)

(assert (=> start!63308 m!416631))

(declare-fun m!416633 () Bool)

(assert (=> start!63308 m!416633))

(declare-fun m!416635 () Bool)

(assert (=> b!283604 m!416635))

(declare-fun m!416637 () Bool)

(assert (=> b!283605 m!416637))

(check-sat (not b!283604) (not start!63308) (not b!283605))
(check-sat)
(get-model)

(declare-fun d!97300 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97300 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7112 (buf!7358 thiss!1939))) ((_ sign_extend 32) (currentByte!13627 thiss!1939)) ((_ sign_extend 32) (currentBit!13622 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13622 thiss!1939)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7112 (buf!7358 thiss!1939))) ((_ sign_extend 32) (currentByte!13627 thiss!1939)) ((_ sign_extend 32) (currentBit!13622 thiss!1939))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13622 thiss!1939)) #b00000000000000000000000000000111))))))

(declare-fun bs!24552 () Bool)

(assert (= bs!24552 d!97300))

(declare-fun m!416647 () Bool)

(assert (=> bs!24552 m!416647))

(assert (=> b!283604 d!97300))

(declare-fun d!97302 () Bool)

(assert (=> d!97302 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7112 (buf!7358 thiss!1939))) ((_ sign_extend 32) (currentByte!13627 thiss!1939)) ((_ sign_extend 32) (currentBit!13622 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13627 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13622 thiss!1939))) #b00000000000000000000000000001111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7112 (buf!7358 thiss!1939))) ((_ sign_extend 32) (currentByte!13627 thiss!1939)) ((_ sign_extend 32) (currentBit!13622 thiss!1939))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13627 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13622 thiss!1939))) #b00000000000000000000000000001111))))))

(declare-fun bs!24553 () Bool)

(assert (= bs!24553 d!97302))

(assert (=> bs!24553 m!416647))

(assert (=> start!63308 d!97302))

(declare-fun d!97304 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97304 (= (inv!12 thiss!1939) (invariant!0 (currentBit!13622 thiss!1939) (currentByte!13627 thiss!1939) (size!7112 (buf!7358 thiss!1939))))))

(declare-fun bs!24555 () Bool)

(assert (= bs!24555 d!97304))

(declare-fun m!416651 () Bool)

(assert (=> bs!24555 m!416651))

(assert (=> start!63308 d!97304))

(declare-fun d!97312 () Bool)

(assert (=> d!97312 (= (array_inv!6805 (buf!7358 thiss!1939)) (bvsge (size!7112 (buf!7358 thiss!1939)) #b00000000000000000000000000000000))))

(assert (=> b!283605 d!97312))

(check-sat (not d!97302) (not d!97300) (not d!97304))
(check-sat)
