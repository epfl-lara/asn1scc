; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69616 () Bool)

(assert start!69616)

(declare-fun b!313150 () Bool)

(declare-fun res!256378 () Bool)

(declare-fun e!225307 () Bool)

(assert (=> b!313150 (=> (not res!256378) (not e!225307))))

(declare-datatypes ((array!19216 0))(
  ( (array!19217 (arr!9415 (Array (_ BitVec 32) (_ BitVec 8))) (size!8335 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13774 0))(
  ( (BitStream!13775 (buf!7948 array!19216) (currentByte!14667 (_ BitVec 32)) (currentBit!14662 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13774)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313150 (= res!256378 (validate_offset_bits!1 ((_ sign_extend 32) (size!8335 (buf!7948 b1!97))) ((_ sign_extend 32) (currentByte!14667 b1!97)) ((_ sign_extend 32) (currentBit!14662 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!313151 () Bool)

(declare-fun e!225304 () Bool)

(declare-fun b2!97 () BitStream!13774)

(declare-fun array_inv!7887 (array!19216) Bool)

(assert (=> b!313151 (= e!225304 (array_inv!7887 (buf!7948 b2!97)))))

(declare-fun b!313152 () Bool)

(declare-fun res!256376 () Bool)

(assert (=> b!313152 (=> (not res!256376) (not e!225307))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!313152 (= res!256376 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8335 (buf!7948 b1!97))) ((_ sign_extend 32) (currentByte!14667 b1!97)) ((_ sign_extend 32) (currentBit!14662 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun res!256379 () Bool)

(assert (=> start!69616 (=> (not res!256379) (not e!225307))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(assert (=> start!69616 (= res!256379 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8335 (buf!7948 b1!97)) (size!8335 (buf!7948 b2!97)))))))

(assert (=> start!69616 e!225307))

(assert (=> start!69616 true))

(declare-fun e!225303 () Bool)

(declare-fun inv!12 (BitStream!13774) Bool)

(assert (=> start!69616 (and (inv!12 b1!97) e!225303)))

(assert (=> start!69616 (and (inv!12 b2!97) e!225304)))

(declare-fun b!313153 () Bool)

(declare-fun lt!442130 () (_ BitVec 64))

(declare-fun lt!442129 () (_ BitVec 64))

(assert (=> b!313153 (= e!225307 (and (bvsge (bvsub lt!442130 lt!442129) b1ValidateOffsetBits!10) (let ((bdg!18646 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14667 b2!97))) ((_ sign_extend 32) (currentBit!14662 b2!97))))) (and (bvsle bdg!18646 (bvadd lt!442129 advancedAtMostBits!9)) (bvsge (bvsub lt!442130 bdg!18646) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)) (not (= (bvand b1ValidateOffsetBits!10 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand advancedAtMostBits!9 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand b1ValidateOffsetBits!10 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!313153 (= lt!442129 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14667 b1!97))) ((_ sign_extend 32) (currentBit!14662 b1!97))))))

(assert (=> b!313153 (= lt!442130 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8335 (buf!7948 b1!97)))))))

(declare-fun b!313154 () Bool)

(declare-fun res!256377 () Bool)

(assert (=> b!313154 (=> (not res!256377) (not e!225307))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!313154 (= res!256377 (bvsle (bitIndex!0 (size!8335 (buf!7948 b2!97)) (currentByte!14667 b2!97) (currentBit!14662 b2!97)) (bvadd (bitIndex!0 (size!8335 (buf!7948 b1!97)) (currentByte!14667 b1!97) (currentBit!14662 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!313155 () Bool)

(assert (=> b!313155 (= e!225303 (array_inv!7887 (buf!7948 b1!97)))))

(assert (= (and start!69616 res!256379) b!313150))

(assert (= (and b!313150 res!256378) b!313154))

(assert (= (and b!313154 res!256377) b!313152))

(assert (= (and b!313152 res!256376) b!313153))

(assert (= start!69616 b!313155))

(assert (= start!69616 b!313151))

(declare-fun m!450737 () Bool)

(assert (=> start!69616 m!450737))

(declare-fun m!450739 () Bool)

(assert (=> start!69616 m!450739))

(declare-fun m!450741 () Bool)

(assert (=> b!313150 m!450741))

(declare-fun m!450743 () Bool)

(assert (=> b!313155 m!450743))

(declare-fun m!450745 () Bool)

(assert (=> b!313154 m!450745))

(declare-fun m!450747 () Bool)

(assert (=> b!313154 m!450747))

(declare-fun m!450749 () Bool)

(assert (=> b!313152 m!450749))

(declare-fun m!450751 () Bool)

(assert (=> b!313151 m!450751))

(push 1)

(assert (not b!313151))

(assert (not start!69616))

(assert (not b!313152))

(assert (not b!313155))

(assert (not b!313150))

(assert (not b!313154))

(check-sat)

(pop 1)

(push 1)

(check-sat)

