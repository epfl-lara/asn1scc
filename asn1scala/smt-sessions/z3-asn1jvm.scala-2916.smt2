; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69618 () Bool)

(assert start!69618)

(declare-fun b!313168 () Bool)

(declare-fun res!256388 () Bool)

(declare-fun e!225318 () Bool)

(assert (=> b!313168 (=> (not res!256388) (not e!225318))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19218 0))(
  ( (array!19219 (arr!9416 (Array (_ BitVec 32) (_ BitVec 8))) (size!8336 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13776 0))(
  ( (BitStream!13777 (buf!7949 array!19218) (currentByte!14668 (_ BitVec 32)) (currentBit!14663 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13776)

(declare-fun b1!97 () BitStream!13776)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!313168 (= res!256388 (bvsle (bitIndex!0 (size!8336 (buf!7949 b2!97)) (currentByte!14668 b2!97) (currentBit!14663 b2!97)) (bvadd (bitIndex!0 (size!8336 (buf!7949 b1!97)) (currentByte!14668 b1!97) (currentBit!14663 b1!97)) advancedAtMostBits!9)))))

(declare-fun res!256390 () Bool)

(assert (=> start!69618 (=> (not res!256390) (not e!225318))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(assert (=> start!69618 (= res!256390 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8336 (buf!7949 b1!97)) (size!8336 (buf!7949 b2!97)))))))

(assert (=> start!69618 e!225318))

(assert (=> start!69618 true))

(declare-fun e!225322 () Bool)

(declare-fun inv!12 (BitStream!13776) Bool)

(assert (=> start!69618 (and (inv!12 b1!97) e!225322)))

(declare-fun e!225319 () Bool)

(assert (=> start!69618 (and (inv!12 b2!97) e!225319)))

(declare-fun lt!442136 () (_ BitVec 64))

(declare-fun lt!442135 () (_ BitVec 64))

(declare-fun b!313169 () Bool)

(assert (=> b!313169 (= e!225318 (and (bvsge (bvsub lt!442136 lt!442135) b1ValidateOffsetBits!10) (let ((bdg!18646 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14668 b2!97))) ((_ sign_extend 32) (currentBit!14663 b2!97))))) (and (bvsle bdg!18646 (bvadd lt!442135 advancedAtMostBits!9)) (bvsge (bvsub lt!442136 bdg!18646) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)) (not (= (bvand b1ValidateOffsetBits!10 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand advancedAtMostBits!9 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand b1ValidateOffsetBits!10 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!313169 (= lt!442135 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14668 b1!97))) ((_ sign_extend 32) (currentBit!14663 b1!97))))))

(assert (=> b!313169 (= lt!442136 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8336 (buf!7949 b1!97)))))))

(declare-fun b!313170 () Bool)

(declare-fun res!256391 () Bool)

(assert (=> b!313170 (=> (not res!256391) (not e!225318))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313170 (= res!256391 (validate_offset_bits!1 ((_ sign_extend 32) (size!8336 (buf!7949 b1!97))) ((_ sign_extend 32) (currentByte!14668 b1!97)) ((_ sign_extend 32) (currentBit!14663 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!313171 () Bool)

(declare-fun array_inv!7888 (array!19218) Bool)

(assert (=> b!313171 (= e!225319 (array_inv!7888 (buf!7949 b2!97)))))

(declare-fun b!313172 () Bool)

(declare-fun res!256389 () Bool)

(assert (=> b!313172 (=> (not res!256389) (not e!225318))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!313172 (= res!256389 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8336 (buf!7949 b1!97))) ((_ sign_extend 32) (currentByte!14668 b1!97)) ((_ sign_extend 32) (currentBit!14663 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!313173 () Bool)

(assert (=> b!313173 (= e!225322 (array_inv!7888 (buf!7949 b1!97)))))

(assert (= (and start!69618 res!256390) b!313170))

(assert (= (and b!313170 res!256391) b!313168))

(assert (= (and b!313168 res!256388) b!313172))

(assert (= (and b!313172 res!256389) b!313169))

(assert (= start!69618 b!313173))

(assert (= start!69618 b!313171))

(declare-fun m!450753 () Bool)

(assert (=> b!313173 m!450753))

(declare-fun m!450755 () Bool)

(assert (=> b!313171 m!450755))

(declare-fun m!450757 () Bool)

(assert (=> start!69618 m!450757))

(declare-fun m!450759 () Bool)

(assert (=> start!69618 m!450759))

(declare-fun m!450761 () Bool)

(assert (=> b!313172 m!450761))

(declare-fun m!450763 () Bool)

(assert (=> b!313168 m!450763))

(declare-fun m!450765 () Bool)

(assert (=> b!313168 m!450765))

(declare-fun m!450767 () Bool)

(assert (=> b!313170 m!450767))

(check-sat (not b!313170) (not b!313172) (not start!69618) (not b!313173) (not b!313168) (not b!313171))
(check-sat)
