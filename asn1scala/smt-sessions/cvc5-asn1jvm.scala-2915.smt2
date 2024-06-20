; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69610 () Bool)

(assert start!69610)

(declare-fun b!313096 () Bool)

(declare-fun res!256343 () Bool)

(declare-fun e!225262 () Bool)

(assert (=> b!313096 (=> (not res!256343) (not e!225262))))

(declare-datatypes ((array!19210 0))(
  ( (array!19211 (arr!9412 (Array (_ BitVec 32) (_ BitVec 8))) (size!8332 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13768 0))(
  ( (BitStream!13769 (buf!7945 array!19210) (currentByte!14664 (_ BitVec 32)) (currentBit!14659 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13768)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313096 (= res!256343 (validate_offset_bits!1 ((_ sign_extend 32) (size!8332 (buf!7945 b1!97))) ((_ sign_extend 32) (currentByte!14664 b1!97)) ((_ sign_extend 32) (currentBit!14659 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!313097 () Bool)

(declare-fun e!225259 () Bool)

(declare-fun b2!97 () BitStream!13768)

(declare-fun array_inv!7884 (array!19210) Bool)

(assert (=> b!313097 (= e!225259 (array_inv!7884 (buf!7945 b2!97)))))

(declare-fun b!313098 () Bool)

(declare-fun e!225261 () Bool)

(assert (=> b!313098 (= e!225261 (array_inv!7884 (buf!7945 b1!97)))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun lt!442118 () (_ BitVec 64))

(declare-fun b!313099 () Bool)

(assert (=> b!313099 (= e!225262 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8332 (buf!7945 b1!97)))) lt!442118) b1ValidateOffsetBits!10) (bvsle (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14664 b2!97))) ((_ sign_extend 32) (currentBit!14659 b2!97))) (bvadd lt!442118 advancedAtMostBits!9)) (not (= (bvand b1ValidateOffsetBits!10 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand advancedAtMostBits!9 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand b1ValidateOffsetBits!10 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!313099 (= lt!442118 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14664 b1!97))) ((_ sign_extend 32) (currentBit!14659 b1!97))))))

(declare-fun b!313100 () Bool)

(declare-fun res!256340 () Bool)

(assert (=> b!313100 (=> (not res!256340) (not e!225262))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!313100 (= res!256340 (bvsle (bitIndex!0 (size!8332 (buf!7945 b2!97)) (currentByte!14664 b2!97) (currentBit!14659 b2!97)) (bvadd (bitIndex!0 (size!8332 (buf!7945 b1!97)) (currentByte!14664 b1!97) (currentBit!14659 b1!97)) advancedAtMostBits!9)))))

(declare-fun res!256341 () Bool)

(assert (=> start!69610 (=> (not res!256341) (not e!225262))))

(assert (=> start!69610 (= res!256341 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8332 (buf!7945 b1!97)) (size!8332 (buf!7945 b2!97)))))))

(assert (=> start!69610 e!225262))

(assert (=> start!69610 true))

(declare-fun inv!12 (BitStream!13768) Bool)

(assert (=> start!69610 (and (inv!12 b1!97) e!225261)))

(assert (=> start!69610 (and (inv!12 b2!97) e!225259)))

(declare-fun b!313101 () Bool)

(declare-fun res!256342 () Bool)

(assert (=> b!313101 (=> (not res!256342) (not e!225262))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!313101 (= res!256342 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8332 (buf!7945 b1!97))) ((_ sign_extend 32) (currentByte!14664 b1!97)) ((_ sign_extend 32) (currentBit!14659 b1!97))) b1ValidateOffsetBits!10))))

(assert (= (and start!69610 res!256341) b!313096))

(assert (= (and b!313096 res!256343) b!313100))

(assert (= (and b!313100 res!256340) b!313101))

(assert (= (and b!313101 res!256342) b!313099))

(assert (= start!69610 b!313098))

(assert (= start!69610 b!313097))

(declare-fun m!450689 () Bool)

(assert (=> b!313097 m!450689))

(declare-fun m!450691 () Bool)

(assert (=> b!313096 m!450691))

(declare-fun m!450693 () Bool)

(assert (=> b!313100 m!450693))

(declare-fun m!450695 () Bool)

(assert (=> b!313100 m!450695))

(declare-fun m!450697 () Bool)

(assert (=> b!313098 m!450697))

(declare-fun m!450699 () Bool)

(assert (=> start!69610 m!450699))

(declare-fun m!450701 () Bool)

(assert (=> start!69610 m!450701))

(declare-fun m!450703 () Bool)

(assert (=> b!313101 m!450703))

(push 1)

(assert (not b!313101))

(assert (not b!313096))

(assert (not start!69610))

(assert (not b!313098))

(assert (not b!313100))

(assert (not b!313097))

(check-sat)

(pop 1)

(push 1)

(check-sat)

