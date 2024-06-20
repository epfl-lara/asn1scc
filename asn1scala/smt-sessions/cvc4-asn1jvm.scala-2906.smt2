; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69560 () Bool)

(assert start!69560)

(declare-fun b!312646 () Bool)

(declare-fun res!256041 () Bool)

(declare-fun e!224883 () Bool)

(assert (=> b!312646 (=> (not res!256041) (not e!224883))))

(declare-datatypes ((array!19160 0))(
  ( (array!19161 (arr!9387 (Array (_ BitVec 32) (_ BitVec 8))) (size!8307 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13718 0))(
  ( (BitStream!13719 (buf!7920 array!19160) (currentByte!14639 (_ BitVec 32)) (currentBit!14634 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13718)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312646 (= res!256041 (validate_offset_bits!1 ((_ sign_extend 32) (size!8307 (buf!7920 b1!97))) ((_ sign_extend 32) (currentByte!14639 b1!97)) ((_ sign_extend 32) (currentBit!14634 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312647 () Bool)

(declare-fun b2!97 () BitStream!13718)

(assert (=> b!312647 (= e!224883 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8307 (buf!7920 b1!97)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14639 b1!97))) ((_ sign_extend 32) (currentBit!14634 b1!97)))) b1ValidateOffsetBits!10) (not (= ((_ sign_extend 32) (currentByte!14639 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14639 b2!97))) ((_ sign_extend 32) (currentByte!14639 b2!97)))))))))

(declare-fun b!312648 () Bool)

(declare-fun res!256043 () Bool)

(assert (=> b!312648 (=> (not res!256043) (not e!224883))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312648 (= res!256043 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8307 (buf!7920 b1!97))) ((_ sign_extend 32) (currentByte!14639 b1!97)) ((_ sign_extend 32) (currentBit!14634 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312649 () Bool)

(declare-fun res!256042 () Bool)

(assert (=> b!312649 (=> (not res!256042) (not e!224883))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312649 (= res!256042 (bvsle (bitIndex!0 (size!8307 (buf!7920 b2!97)) (currentByte!14639 b2!97) (currentBit!14634 b2!97)) (bvadd (bitIndex!0 (size!8307 (buf!7920 b1!97)) (currentByte!14639 b1!97) (currentBit!14634 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312650 () Bool)

(declare-fun e!224886 () Bool)

(declare-fun array_inv!7859 (array!19160) Bool)

(assert (=> b!312650 (= e!224886 (array_inv!7859 (buf!7920 b1!97)))))

(declare-fun b!312651 () Bool)

(declare-fun e!224885 () Bool)

(assert (=> b!312651 (= e!224885 (array_inv!7859 (buf!7920 b2!97)))))

(declare-fun res!256040 () Bool)

(assert (=> start!69560 (=> (not res!256040) (not e!224883))))

(assert (=> start!69560 (= res!256040 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8307 (buf!7920 b1!97)) (size!8307 (buf!7920 b2!97)))))))

(assert (=> start!69560 e!224883))

(assert (=> start!69560 true))

(declare-fun inv!12 (BitStream!13718) Bool)

(assert (=> start!69560 (and (inv!12 b1!97) e!224886)))

(assert (=> start!69560 (and (inv!12 b2!97) e!224885)))

(assert (= (and start!69560 res!256040) b!312646))

(assert (= (and b!312646 res!256041) b!312649))

(assert (= (and b!312649 res!256042) b!312648))

(assert (= (and b!312648 res!256043) b!312647))

(assert (= start!69560 b!312650))

(assert (= start!69560 b!312651))

(declare-fun m!450289 () Bool)

(assert (=> b!312648 m!450289))

(declare-fun m!450291 () Bool)

(assert (=> b!312650 m!450291))

(declare-fun m!450293 () Bool)

(assert (=> b!312651 m!450293))

(declare-fun m!450295 () Bool)

(assert (=> b!312646 m!450295))

(declare-fun m!450297 () Bool)

(assert (=> b!312649 m!450297))

(declare-fun m!450299 () Bool)

(assert (=> b!312649 m!450299))

(declare-fun m!450301 () Bool)

(assert (=> start!69560 m!450301))

(declare-fun m!450303 () Bool)

(assert (=> start!69560 m!450303))

(push 1)

(assert (not b!312650))

(assert (not b!312646))

(assert (not b!312651))

(assert (not b!312648))

(assert (not start!69560))

(assert (not b!312649))

(check-sat)

(pop 1)

(push 1)

(check-sat)

