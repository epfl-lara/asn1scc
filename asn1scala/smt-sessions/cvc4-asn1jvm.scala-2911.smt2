; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69590 () Bool)

(assert start!69590)

(declare-fun b!312916 () Bool)

(declare-fun res!256221 () Bool)

(declare-fun e!225112 () Bool)

(assert (=> b!312916 (=> (not res!256221) (not e!225112))))

(declare-datatypes ((array!19190 0))(
  ( (array!19191 (arr!9402 (Array (_ BitVec 32) (_ BitVec 8))) (size!8322 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13748 0))(
  ( (BitStream!13749 (buf!7935 array!19190) (currentByte!14654 (_ BitVec 32)) (currentBit!14649 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13748)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312916 (= res!256221 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8322 (buf!7935 b1!97))) ((_ sign_extend 32) (currentByte!14654 b1!97)) ((_ sign_extend 32) (currentBit!14649 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun res!256223 () Bool)

(assert (=> start!69590 (=> (not res!256223) (not e!225112))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13748)

(assert (=> start!69590 (= res!256223 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8322 (buf!7935 b1!97)) (size!8322 (buf!7935 b2!97)))))))

(assert (=> start!69590 e!225112))

(assert (=> start!69590 true))

(declare-fun e!225111 () Bool)

(declare-fun inv!12 (BitStream!13748) Bool)

(assert (=> start!69590 (and (inv!12 b1!97) e!225111)))

(declare-fun e!225109 () Bool)

(assert (=> start!69590 (and (inv!12 b2!97) e!225109)))

(declare-fun lt!442079 () (_ BitVec 64))

(declare-fun lt!442078 () (_ BitVec 64))

(declare-fun b!312917 () Bool)

(assert (=> b!312917 (= e!225112 (and (bvsge (bvsub lt!442078 lt!442079) b1ValidateOffsetBits!10) (bvsle (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14654 b2!97))) ((_ sign_extend 32) (currentBit!14649 b2!97))) (bvadd lt!442079 advancedAtMostBits!9)) (not (= ((_ sign_extend 32) (size!8322 (buf!7935 b1!97))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!442078 ((_ sign_extend 32) (size!8322 (buf!7935 b1!97))))))))))

(assert (=> b!312917 (= lt!442079 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14654 b1!97))) ((_ sign_extend 32) (currentBit!14649 b1!97))))))

(assert (=> b!312917 (= lt!442078 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8322 (buf!7935 b1!97)))))))

(declare-fun b!312918 () Bool)

(declare-fun res!256220 () Bool)

(assert (=> b!312918 (=> (not res!256220) (not e!225112))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312918 (= res!256220 (bvsle (bitIndex!0 (size!8322 (buf!7935 b2!97)) (currentByte!14654 b2!97) (currentBit!14649 b2!97)) (bvadd (bitIndex!0 (size!8322 (buf!7935 b1!97)) (currentByte!14654 b1!97) (currentBit!14649 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312919 () Bool)

(declare-fun array_inv!7874 (array!19190) Bool)

(assert (=> b!312919 (= e!225109 (array_inv!7874 (buf!7935 b2!97)))))

(declare-fun b!312920 () Bool)

(assert (=> b!312920 (= e!225111 (array_inv!7874 (buf!7935 b1!97)))))

(declare-fun b!312921 () Bool)

(declare-fun res!256222 () Bool)

(assert (=> b!312921 (=> (not res!256222) (not e!225112))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312921 (= res!256222 (validate_offset_bits!1 ((_ sign_extend 32) (size!8322 (buf!7935 b1!97))) ((_ sign_extend 32) (currentByte!14654 b1!97)) ((_ sign_extend 32) (currentBit!14649 b1!97)) b1ValidateOffsetBits!10))))

(assert (= (and start!69590 res!256223) b!312921))

(assert (= (and b!312921 res!256222) b!312918))

(assert (= (and b!312918 res!256220) b!312916))

(assert (= (and b!312916 res!256221) b!312917))

(assert (= start!69590 b!312920))

(assert (= start!69590 b!312919))

(declare-fun m!450529 () Bool)

(assert (=> b!312919 m!450529))

(declare-fun m!450531 () Bool)

(assert (=> b!312916 m!450531))

(declare-fun m!450533 () Bool)

(assert (=> b!312918 m!450533))

(declare-fun m!450535 () Bool)

(assert (=> b!312918 m!450535))

(declare-fun m!450537 () Bool)

(assert (=> b!312920 m!450537))

(declare-fun m!450539 () Bool)

(assert (=> b!312921 m!450539))

(declare-fun m!450541 () Bool)

(assert (=> start!69590 m!450541))

(declare-fun m!450543 () Bool)

(assert (=> start!69590 m!450543))

(push 1)

(assert (not b!312919))

(assert (not b!312916))

(assert (not b!312921))

(assert (not b!312920))

(assert (not b!312918))

(assert (not start!69590))

(check-sat)

(pop 1)

(push 1)

(check-sat)

