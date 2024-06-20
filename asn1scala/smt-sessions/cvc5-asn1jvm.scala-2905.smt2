; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69550 () Bool)

(assert start!69550)

(declare-fun b!312557 () Bool)

(declare-fun res!255982 () Bool)

(declare-fun e!224811 () Bool)

(assert (=> b!312557 (=> (not res!255982) (not e!224811))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19150 0))(
  ( (array!19151 (arr!9382 (Array (_ BitVec 32) (_ BitVec 8))) (size!8302 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13708 0))(
  ( (BitStream!13709 (buf!7915 array!19150) (currentByte!14634 (_ BitVec 32)) (currentBit!14629 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13708)

(declare-fun b2!97 () BitStream!13708)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312557 (= res!255982 (bvsle (bitIndex!0 (size!8302 (buf!7915 b2!97)) (currentByte!14634 b2!97) (currentBit!14629 b2!97)) (bvadd (bitIndex!0 (size!8302 (buf!7915 b1!97)) (currentByte!14634 b1!97) (currentBit!14629 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312558 () Bool)

(declare-fun res!255980 () Bool)

(assert (=> b!312558 (=> (not res!255980) (not e!224811))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312558 (= res!255980 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8302 (buf!7915 b1!97))) ((_ sign_extend 32) (currentByte!14634 b1!97)) ((_ sign_extend 32) (currentBit!14629 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312559 () Bool)

(declare-fun e!224808 () Bool)

(declare-fun array_inv!7854 (array!19150) Bool)

(assert (=> b!312559 (= e!224808 (array_inv!7854 (buf!7915 b2!97)))))

(declare-fun b!312556 () Bool)

(declare-fun e!224812 () Bool)

(assert (=> b!312556 (= e!224812 (array_inv!7854 (buf!7915 b1!97)))))

(declare-fun res!255981 () Bool)

(assert (=> start!69550 (=> (not res!255981) (not e!224811))))

(assert (=> start!69550 (= res!255981 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8302 (buf!7915 b1!97)) (size!8302 (buf!7915 b2!97)))))))

(assert (=> start!69550 e!224811))

(assert (=> start!69550 true))

(declare-fun inv!12 (BitStream!13708) Bool)

(assert (=> start!69550 (and (inv!12 b1!97) e!224812)))

(assert (=> start!69550 (and (inv!12 b2!97) e!224808)))

(declare-fun b!312560 () Bool)

(declare-fun res!255983 () Bool)

(assert (=> b!312560 (=> (not res!255983) (not e!224811))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312560 (= res!255983 (validate_offset_bits!1 ((_ sign_extend 32) (size!8302 (buf!7915 b1!97))) ((_ sign_extend 32) (currentByte!14634 b1!97)) ((_ sign_extend 32) (currentBit!14629 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun lt!442006 () (_ BitVec 64))

(declare-fun lt!442007 () (_ BitVec 64))

(declare-fun lt!442005 () (_ BitVec 64))

(declare-fun b!312561 () Bool)

(assert (=> b!312561 (= e!224811 (and (not (= lt!442007 (bvand lt!442005 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!442007 (bvand (bvsub lt!442006 lt!442005) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!312561 (= lt!442007 (bvand lt!442006 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!312561 (= lt!442005 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14634 b1!97))) ((_ sign_extend 32) (currentBit!14629 b1!97))))))

(assert (=> b!312561 (= lt!442006 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8302 (buf!7915 b1!97)))))))

(assert (= (and start!69550 res!255981) b!312560))

(assert (= (and b!312560 res!255983) b!312557))

(assert (= (and b!312557 res!255982) b!312558))

(assert (= (and b!312558 res!255980) b!312561))

(assert (= start!69550 b!312556))

(assert (= start!69550 b!312559))

(declare-fun m!450209 () Bool)

(assert (=> b!312558 m!450209))

(declare-fun m!450211 () Bool)

(assert (=> b!312559 m!450211))

(declare-fun m!450213 () Bool)

(assert (=> b!312557 m!450213))

(declare-fun m!450215 () Bool)

(assert (=> b!312557 m!450215))

(declare-fun m!450217 () Bool)

(assert (=> start!69550 m!450217))

(declare-fun m!450219 () Bool)

(assert (=> start!69550 m!450219))

(declare-fun m!450221 () Bool)

(assert (=> b!312560 m!450221))

(declare-fun m!450223 () Bool)

(assert (=> b!312556 m!450223))

(push 1)

(assert (not b!312558))

(assert (not b!312559))

(assert (not b!312557))

(assert (not start!69550))

(assert (not b!312556))

(assert (not b!312560))

(check-sat)

(pop 1)

(push 1)

(check-sat)

