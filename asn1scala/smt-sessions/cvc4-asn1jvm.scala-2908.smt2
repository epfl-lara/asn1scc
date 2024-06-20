; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69572 () Bool)

(assert start!69572)

(declare-fun e!224974 () Bool)

(declare-datatypes ((array!19172 0))(
  ( (array!19173 (arr!9393 (Array (_ BitVec 32) (_ BitVec 8))) (size!8313 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13730 0))(
  ( (BitStream!13731 (buf!7926 array!19172) (currentByte!14645 (_ BitVec 32)) (currentBit!14640 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13730)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b!312754 () Bool)

(declare-fun lt!442034 () (_ BitVec 64))

(assert (=> b!312754 (= e!224974 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8313 (buf!7926 b1!97)))) (bvadd lt!442034 ((_ sign_extend 32) (currentBit!14640 b1!97)))) b1ValidateOffsetBits!10) (not (= ((_ sign_extend 32) (currentByte!14645 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!442034 ((_ sign_extend 32) (currentByte!14645 b1!97)))))))))

(assert (=> b!312754 (= lt!442034 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14645 b1!97))))))

(declare-fun b!312755 () Bool)

(declare-fun res!256113 () Bool)

(assert (=> b!312755 (=> (not res!256113) (not e!224974))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312755 (= res!256113 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8313 (buf!7926 b1!97))) ((_ sign_extend 32) (currentByte!14645 b1!97)) ((_ sign_extend 32) (currentBit!14640 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312756 () Bool)

(declare-fun e!224973 () Bool)

(declare-fun array_inv!7865 (array!19172) Bool)

(assert (=> b!312756 (= e!224973 (array_inv!7865 (buf!7926 b1!97)))))

(declare-fun b!312757 () Bool)

(declare-fun res!256115 () Bool)

(assert (=> b!312757 (=> (not res!256115) (not e!224974))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13730)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312757 (= res!256115 (bvsle (bitIndex!0 (size!8313 (buf!7926 b2!97)) (currentByte!14645 b2!97) (currentBit!14640 b2!97)) (bvadd (bitIndex!0 (size!8313 (buf!7926 b1!97)) (currentByte!14645 b1!97) (currentBit!14640 b1!97)) advancedAtMostBits!9)))))

(declare-fun res!256114 () Bool)

(assert (=> start!69572 (=> (not res!256114) (not e!224974))))

(assert (=> start!69572 (= res!256114 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8313 (buf!7926 b1!97)) (size!8313 (buf!7926 b2!97)))))))

(assert (=> start!69572 e!224974))

(assert (=> start!69572 true))

(declare-fun inv!12 (BitStream!13730) Bool)

(assert (=> start!69572 (and (inv!12 b1!97) e!224973)))

(declare-fun e!224976 () Bool)

(assert (=> start!69572 (and (inv!12 b2!97) e!224976)))

(declare-fun b!312758 () Bool)

(assert (=> b!312758 (= e!224976 (array_inv!7865 (buf!7926 b2!97)))))

(declare-fun b!312759 () Bool)

(declare-fun res!256112 () Bool)

(assert (=> b!312759 (=> (not res!256112) (not e!224974))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312759 (= res!256112 (validate_offset_bits!1 ((_ sign_extend 32) (size!8313 (buf!7926 b1!97))) ((_ sign_extend 32) (currentByte!14645 b1!97)) ((_ sign_extend 32) (currentBit!14640 b1!97)) b1ValidateOffsetBits!10))))

(assert (= (and start!69572 res!256114) b!312759))

(assert (= (and b!312759 res!256112) b!312757))

(assert (= (and b!312757 res!256115) b!312755))

(assert (= (and b!312755 res!256113) b!312754))

(assert (= start!69572 b!312756))

(assert (= start!69572 b!312758))

(declare-fun m!450385 () Bool)

(assert (=> b!312757 m!450385))

(declare-fun m!450387 () Bool)

(assert (=> b!312757 m!450387))

(declare-fun m!450389 () Bool)

(assert (=> b!312755 m!450389))

(declare-fun m!450391 () Bool)

(assert (=> b!312759 m!450391))

(declare-fun m!450393 () Bool)

(assert (=> start!69572 m!450393))

(declare-fun m!450395 () Bool)

(assert (=> start!69572 m!450395))

(declare-fun m!450397 () Bool)

(assert (=> b!312758 m!450397))

(declare-fun m!450399 () Bool)

(assert (=> b!312756 m!450399))

(push 1)

(assert (not start!69572))

(assert (not b!312757))

(assert (not b!312755))

(assert (not b!312758))

(assert (not b!312759))

(assert (not b!312756))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

