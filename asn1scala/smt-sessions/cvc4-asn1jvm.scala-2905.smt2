; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69554 () Bool)

(assert start!69554)

(declare-fun e!224841 () Bool)

(declare-fun b!312592 () Bool)

(declare-fun lt!442025 () (_ BitVec 64))

(declare-fun lt!442023 () (_ BitVec 64))

(declare-fun lt!442024 () (_ BitVec 64))

(assert (=> b!312592 (= e!224841 (and (not (= lt!442023 (bvand lt!442025 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!442023 (bvand (bvsub lt!442024 lt!442025) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!312592 (= lt!442023 (bvand lt!442024 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!19154 0))(
  ( (array!19155 (arr!9384 (Array (_ BitVec 32) (_ BitVec 8))) (size!8304 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13712 0))(
  ( (BitStream!13713 (buf!7917 array!19154) (currentByte!14636 (_ BitVec 32)) (currentBit!14631 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13712)

(assert (=> b!312592 (= lt!442025 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14636 b1!97))) ((_ sign_extend 32) (currentBit!14631 b1!97))))))

(assert (=> b!312592 (= lt!442024 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8304 (buf!7917 b1!97)))))))

(declare-fun res!256006 () Bool)

(assert (=> start!69554 (=> (not res!256006) (not e!224841))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13712)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(assert (=> start!69554 (= res!256006 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8304 (buf!7917 b1!97)) (size!8304 (buf!7917 b2!97)))))))

(assert (=> start!69554 e!224841))

(assert (=> start!69554 true))

(declare-fun e!224838 () Bool)

(declare-fun inv!12 (BitStream!13712) Bool)

(assert (=> start!69554 (and (inv!12 b1!97) e!224838)))

(declare-fun e!224840 () Bool)

(assert (=> start!69554 (and (inv!12 b2!97) e!224840)))

(declare-fun b!312593 () Bool)

(declare-fun array_inv!7856 (array!19154) Bool)

(assert (=> b!312593 (= e!224840 (array_inv!7856 (buf!7917 b2!97)))))

(declare-fun b!312594 () Bool)

(declare-fun res!256007 () Bool)

(assert (=> b!312594 (=> (not res!256007) (not e!224841))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312594 (= res!256007 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8304 (buf!7917 b1!97))) ((_ sign_extend 32) (currentByte!14636 b1!97)) ((_ sign_extend 32) (currentBit!14631 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312595 () Bool)

(assert (=> b!312595 (= e!224838 (array_inv!7856 (buf!7917 b1!97)))))

(declare-fun b!312596 () Bool)

(declare-fun res!256005 () Bool)

(assert (=> b!312596 (=> (not res!256005) (not e!224841))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312596 (= res!256005 (validate_offset_bits!1 ((_ sign_extend 32) (size!8304 (buf!7917 b1!97))) ((_ sign_extend 32) (currentByte!14636 b1!97)) ((_ sign_extend 32) (currentBit!14631 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312597 () Bool)

(declare-fun res!256004 () Bool)

(assert (=> b!312597 (=> (not res!256004) (not e!224841))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312597 (= res!256004 (bvsle (bitIndex!0 (size!8304 (buf!7917 b2!97)) (currentByte!14636 b2!97) (currentBit!14631 b2!97)) (bvadd (bitIndex!0 (size!8304 (buf!7917 b1!97)) (currentByte!14636 b1!97) (currentBit!14631 b1!97)) advancedAtMostBits!9)))))

(assert (= (and start!69554 res!256006) b!312596))

(assert (= (and b!312596 res!256005) b!312597))

(assert (= (and b!312597 res!256004) b!312594))

(assert (= (and b!312594 res!256007) b!312592))

(assert (= start!69554 b!312595))

(assert (= start!69554 b!312593))

(declare-fun m!450241 () Bool)

(assert (=> b!312597 m!450241))

(declare-fun m!450243 () Bool)

(assert (=> b!312597 m!450243))

(declare-fun m!450245 () Bool)

(assert (=> b!312594 m!450245))

(declare-fun m!450247 () Bool)

(assert (=> b!312595 m!450247))

(declare-fun m!450249 () Bool)

(assert (=> b!312596 m!450249))

(declare-fun m!450251 () Bool)

(assert (=> start!69554 m!450251))

(declare-fun m!450253 () Bool)

(assert (=> start!69554 m!450253))

(declare-fun m!450255 () Bool)

(assert (=> b!312593 m!450255))

(push 1)

(assert (not start!69554))

(assert (not b!312596))

(assert (not b!312593))

(assert (not b!312595))

(assert (not b!312594))

(assert (not b!312597))

(check-sat)

(pop 1)

(push 1)

(check-sat)

