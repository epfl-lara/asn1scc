; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69546 () Bool)

(assert start!69546)

(declare-fun b!312520 () Bool)

(declare-fun res!255956 () Bool)

(declare-fun e!224780 () Bool)

(assert (=> b!312520 (=> (not res!255956) (not e!224780))))

(declare-datatypes ((array!19146 0))(
  ( (array!19147 (arr!9380 (Array (_ BitVec 32) (_ BitVec 8))) (size!8300 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13704 0))(
  ( (BitStream!13705 (buf!7913 array!19146) (currentByte!14632 (_ BitVec 32)) (currentBit!14627 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13704)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312520 (= res!255956 (validate_offset_bits!1 ((_ sign_extend 32) (size!8300 (buf!7913 b1!97))) ((_ sign_extend 32) (currentByte!14632 b1!97)) ((_ sign_extend 32) (currentBit!14627 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312521 () Bool)

(declare-fun e!224781 () Bool)

(declare-fun b2!97 () BitStream!13704)

(declare-fun array_inv!7852 (array!19146) Bool)

(assert (=> b!312521 (= e!224781 (array_inv!7852 (buf!7913 b2!97)))))

(declare-fun b!312522 () Bool)

(declare-fun e!224782 () Bool)

(assert (=> b!312522 (= e!224782 (array_inv!7852 (buf!7913 b1!97)))))

(declare-fun b!312523 () Bool)

(declare-fun res!255959 () Bool)

(assert (=> b!312523 (=> (not res!255959) (not e!224780))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312523 (= res!255959 (bvsle (bitIndex!0 (size!8300 (buf!7913 b2!97)) (currentByte!14632 b2!97) (currentBit!14627 b2!97)) (bvadd (bitIndex!0 (size!8300 (buf!7913 b1!97)) (currentByte!14632 b1!97) (currentBit!14627 b1!97)) advancedAtMostBits!9)))))

(declare-fun lt!441991 () (_ BitVec 64))

(declare-fun lt!441992 () (_ BitVec 64))

(declare-fun b!312524 () Bool)

(assert (=> b!312524 (= e!224780 (and (= lt!441991 (bvand ((_ sign_extend 32) (currentBit!14627 b1!97)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!441991 (bvand (bvadd lt!441992 ((_ sign_extend 32) (currentBit!14627 b1!97))) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!312524 (= lt!441991 (bvand lt!441992 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!312524 (= lt!441992 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14632 b1!97))))))

(declare-fun res!255958 () Bool)

(assert (=> start!69546 (=> (not res!255958) (not e!224780))))

(assert (=> start!69546 (= res!255958 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8300 (buf!7913 b1!97)) (size!8300 (buf!7913 b2!97)))))))

(assert (=> start!69546 e!224780))

(assert (=> start!69546 true))

(declare-fun inv!12 (BitStream!13704) Bool)

(assert (=> start!69546 (and (inv!12 b1!97) e!224782)))

(assert (=> start!69546 (and (inv!12 b2!97) e!224781)))

(declare-fun b!312525 () Bool)

(declare-fun res!255957 () Bool)

(assert (=> b!312525 (=> (not res!255957) (not e!224780))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312525 (= res!255957 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8300 (buf!7913 b1!97))) ((_ sign_extend 32) (currentByte!14632 b1!97)) ((_ sign_extend 32) (currentBit!14627 b1!97))) b1ValidateOffsetBits!10))))

(assert (= (and start!69546 res!255958) b!312520))

(assert (= (and b!312520 res!255956) b!312523))

(assert (= (and b!312523 res!255959) b!312525))

(assert (= (and b!312525 res!255957) b!312524))

(assert (= start!69546 b!312522))

(assert (= start!69546 b!312521))

(declare-fun m!450177 () Bool)

(assert (=> b!312525 m!450177))

(declare-fun m!450179 () Bool)

(assert (=> b!312520 m!450179))

(declare-fun m!450181 () Bool)

(assert (=> b!312522 m!450181))

(declare-fun m!450183 () Bool)

(assert (=> start!69546 m!450183))

(declare-fun m!450185 () Bool)

(assert (=> start!69546 m!450185))

(declare-fun m!450187 () Bool)

(assert (=> b!312521 m!450187))

(declare-fun m!450189 () Bool)

(assert (=> b!312523 m!450189))

(declare-fun m!450191 () Bool)

(assert (=> b!312523 m!450191))

(check-sat (not b!312522) (not start!69546) (not b!312523) (not b!312520) (not b!312525) (not b!312521))
(check-sat)
