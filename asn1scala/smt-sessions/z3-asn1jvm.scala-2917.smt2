; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69624 () Bool)

(assert start!69624)

(declare-fun b!313237 () Bool)

(declare-fun e!225374 () Bool)

(declare-datatypes ((array!19224 0))(
  ( (array!19225 (arr!9419 (Array (_ BitVec 32) (_ BitVec 8))) (size!8339 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13782 0))(
  ( (BitStream!13783 (buf!7952 array!19224) (currentByte!14671 (_ BitVec 32)) (currentBit!14666 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13782)

(declare-fun array_inv!7891 (array!19224) Bool)

(assert (=> b!313237 (= e!225374 (array_inv!7891 (buf!7952 b1!97)))))

(declare-fun b!313238 () Bool)

(declare-fun res!256445 () Bool)

(declare-fun e!225373 () Bool)

(assert (=> b!313238 (=> (not res!256445) (not e!225373))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313238 (= res!256445 (validate_offset_bits!1 ((_ sign_extend 32) (size!8339 (buf!7952 b1!97))) ((_ sign_extend 32) (currentByte!14671 b1!97)) ((_ sign_extend 32) (currentBit!14666 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!313240 () Bool)

(declare-fun res!256439 () Bool)

(assert (=> b!313240 (=> (not res!256439) (not e!225373))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13782)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!313240 (= res!256439 (bvsle (bitIndex!0 (size!8339 (buf!7952 b2!97)) (currentByte!14671 b2!97) (currentBit!14666 b2!97)) (bvadd (bitIndex!0 (size!8339 (buf!7952 b1!97)) (currentByte!14671 b1!97) (currentBit!14666 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!313241 () Bool)

(declare-fun e!225376 () Bool)

(assert (=> b!313241 (= e!225373 e!225376)))

(declare-fun res!256442 () Bool)

(assert (=> b!313241 (=> (not res!256442) (not e!225376))))

(declare-fun lt!442159 () (_ BitVec 64))

(declare-fun lt!442160 () (_ BitVec 64))

(assert (=> b!313241 (= res!256442 (bvsge (bvsub lt!442160 lt!442159) b1ValidateOffsetBits!10))))

(assert (=> b!313241 (= lt!442159 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14671 b1!97))) ((_ sign_extend 32) (currentBit!14666 b1!97))))))

(assert (=> b!313241 (= lt!442160 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8339 (buf!7952 b1!97)))))))

(declare-fun b!313242 () Bool)

(declare-fun res!256444 () Bool)

(assert (=> b!313242 (=> (not res!256444) (not e!225373))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!313242 (= res!256444 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8339 (buf!7952 b1!97))) ((_ sign_extend 32) (currentByte!14671 b1!97)) ((_ sign_extend 32) (currentBit!14666 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!313243 () Bool)

(declare-fun e!225377 () Bool)

(assert (=> b!313243 (= e!225376 e!225377)))

(declare-fun res!256440 () Bool)

(assert (=> b!313243 (=> (not res!256440) (not e!225377))))

(declare-fun lt!442158 () (_ BitVec 64))

(assert (=> b!313243 (= res!256440 (and (bvsle lt!442158 (bvadd lt!442159 advancedAtMostBits!9)) (bvsge (bvsub lt!442160 lt!442158) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))

(assert (=> b!313243 (= lt!442158 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14671 b2!97))) ((_ sign_extend 32) (currentBit!14666 b2!97))))))

(declare-fun b!313244 () Bool)

(declare-fun res!256441 () Bool)

(assert (=> b!313244 (=> (not res!256441) (not e!225377))))

(assert (=> b!313244 (= res!256441 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8339 (buf!7952 b2!97))) ((_ sign_extend 32) (currentByte!14671 b2!97)) ((_ sign_extend 32) (currentBit!14666 b2!97))) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)))))

(declare-fun b!313245 () Bool)

(declare-fun e!225379 () Bool)

(assert (=> b!313245 (= e!225379 (array_inv!7891 (buf!7952 b2!97)))))

(declare-fun res!256443 () Bool)

(assert (=> start!69624 (=> (not res!256443) (not e!225373))))

(assert (=> start!69624 (= res!256443 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8339 (buf!7952 b1!97)) (size!8339 (buf!7952 b2!97)))))))

(assert (=> start!69624 e!225373))

(assert (=> start!69624 true))

(declare-fun inv!12 (BitStream!13782) Bool)

(assert (=> start!69624 (and (inv!12 b1!97) e!225374)))

(assert (=> start!69624 (and (inv!12 b2!97) e!225379)))

(declare-fun b!313239 () Bool)

(assert (=> b!313239 (= e!225377 (and (not (= (bvand b1ValidateOffsetBits!10 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand advancedAtMostBits!9 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand b1ValidateOffsetBits!10 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!69624 res!256443) b!313238))

(assert (= (and b!313238 res!256445) b!313240))

(assert (= (and b!313240 res!256439) b!313242))

(assert (= (and b!313242 res!256444) b!313241))

(assert (= (and b!313241 res!256442) b!313243))

(assert (= (and b!313243 res!256440) b!313244))

(assert (= (and b!313244 res!256441) b!313239))

(assert (= start!69624 b!313237))

(assert (= start!69624 b!313245))

(declare-fun m!450803 () Bool)

(assert (=> b!313245 m!450803))

(declare-fun m!450805 () Bool)

(assert (=> b!313237 m!450805))

(declare-fun m!450807 () Bool)

(assert (=> b!313240 m!450807))

(declare-fun m!450809 () Bool)

(assert (=> b!313240 m!450809))

(declare-fun m!450811 () Bool)

(assert (=> b!313244 m!450811))

(declare-fun m!450813 () Bool)

(assert (=> start!69624 m!450813))

(declare-fun m!450815 () Bool)

(assert (=> start!69624 m!450815))

(declare-fun m!450817 () Bool)

(assert (=> b!313242 m!450817))

(declare-fun m!450819 () Bool)

(assert (=> b!313238 m!450819))

(check-sat (not start!69624) (not b!313245) (not b!313237) (not b!313242) (not b!313240) (not b!313244) (not b!313238))
(check-sat)
