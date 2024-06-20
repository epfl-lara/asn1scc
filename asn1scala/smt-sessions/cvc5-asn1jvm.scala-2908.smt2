; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69568 () Bool)

(assert start!69568)

(declare-datatypes ((array!19168 0))(
  ( (array!19169 (arr!9391 (Array (_ BitVec 32) (_ BitVec 8))) (size!8311 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13726 0))(
  ( (BitStream!13727 (buf!7924 array!19168) (currentByte!14643 (_ BitVec 32)) (currentBit!14638 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13726)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun lt!442028 () (_ BitVec 64))

(declare-fun b!312718 () Bool)

(declare-fun e!224947 () Bool)

(assert (=> b!312718 (= e!224947 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8311 (buf!7924 b1!97)))) (bvadd lt!442028 ((_ sign_extend 32) (currentBit!14638 b1!97)))) b1ValidateOffsetBits!10) (not (= ((_ sign_extend 32) (currentByte!14643 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!442028 ((_ sign_extend 32) (currentByte!14643 b1!97)))))))))

(assert (=> b!312718 (= lt!442028 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14643 b1!97))))))

(declare-fun b!312719 () Bool)

(declare-fun e!224945 () Bool)

(declare-fun b2!97 () BitStream!13726)

(declare-fun array_inv!7863 (array!19168) Bool)

(assert (=> b!312719 (= e!224945 (array_inv!7863 (buf!7924 b2!97)))))

(declare-fun b!312720 () Bool)

(declare-fun res!256090 () Bool)

(assert (=> b!312720 (=> (not res!256090) (not e!224947))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312720 (= res!256090 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8311 (buf!7924 b1!97))) ((_ sign_extend 32) (currentByte!14643 b1!97)) ((_ sign_extend 32) (currentBit!14638 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun res!256088 () Bool)

(assert (=> start!69568 (=> (not res!256088) (not e!224947))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(assert (=> start!69568 (= res!256088 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8311 (buf!7924 b1!97)) (size!8311 (buf!7924 b2!97)))))))

(assert (=> start!69568 e!224947))

(assert (=> start!69568 true))

(declare-fun e!224944 () Bool)

(declare-fun inv!12 (BitStream!13726) Bool)

(assert (=> start!69568 (and (inv!12 b1!97) e!224944)))

(assert (=> start!69568 (and (inv!12 b2!97) e!224945)))

(declare-fun b!312721 () Bool)

(declare-fun res!256089 () Bool)

(assert (=> b!312721 (=> (not res!256089) (not e!224947))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312721 (= res!256089 (bvsle (bitIndex!0 (size!8311 (buf!7924 b2!97)) (currentByte!14643 b2!97) (currentBit!14638 b2!97)) (bvadd (bitIndex!0 (size!8311 (buf!7924 b1!97)) (currentByte!14643 b1!97) (currentBit!14638 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312722 () Bool)

(assert (=> b!312722 (= e!224944 (array_inv!7863 (buf!7924 b1!97)))))

(declare-fun b!312723 () Bool)

(declare-fun res!256091 () Bool)

(assert (=> b!312723 (=> (not res!256091) (not e!224947))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312723 (= res!256091 (validate_offset_bits!1 ((_ sign_extend 32) (size!8311 (buf!7924 b1!97))) ((_ sign_extend 32) (currentByte!14643 b1!97)) ((_ sign_extend 32) (currentBit!14638 b1!97)) b1ValidateOffsetBits!10))))

(assert (= (and start!69568 res!256088) b!312723))

(assert (= (and b!312723 res!256091) b!312721))

(assert (= (and b!312721 res!256089) b!312720))

(assert (= (and b!312720 res!256090) b!312718))

(assert (= start!69568 b!312722))

(assert (= start!69568 b!312719))

(declare-fun m!450353 () Bool)

(assert (=> b!312719 m!450353))

(declare-fun m!450355 () Bool)

(assert (=> b!312721 m!450355))

(declare-fun m!450357 () Bool)

(assert (=> b!312721 m!450357))

(declare-fun m!450359 () Bool)

(assert (=> start!69568 m!450359))

(declare-fun m!450361 () Bool)

(assert (=> start!69568 m!450361))

(declare-fun m!450363 () Bool)

(assert (=> b!312720 m!450363))

(declare-fun m!450365 () Bool)

(assert (=> b!312722 m!450365))

(declare-fun m!450367 () Bool)

(assert (=> b!312723 m!450367))

(push 1)

(assert (not start!69568))

(assert (not b!312720))

(assert (not b!312719))

(assert (not b!312721))

(assert (not b!312723))

(assert (not b!312722))

(check-sat)

(pop 1)

(push 1)

(check-sat)

