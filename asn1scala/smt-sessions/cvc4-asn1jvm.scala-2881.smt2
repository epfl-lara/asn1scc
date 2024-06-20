; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69006 () Bool)

(assert start!69006)

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!18966 0))(
  ( (array!18967 (arr!9312 (Array (_ BitVec 32) (_ BitVec 8))) (size!8232 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13568 0))(
  ( (BitStream!13569 (buf!7845 array!18966) (currentByte!14448 (_ BitVec 32)) (currentBit!14443 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13568)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13568)

(assert (=> start!69006 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8232 (buf!7845 b1!97)) (size!8232 (buf!7845 b2!97))) (bvsle ((_ sign_extend 32) (size!8232 (buf!7845 b1!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14448 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14443 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8232 (buf!7845 b1!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14448 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14443 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!69006 true))

(declare-fun e!223541 () Bool)

(declare-fun inv!12 (BitStream!13568) Bool)

(assert (=> start!69006 (and (inv!12 b1!97) e!223541)))

(declare-fun e!223543 () Bool)

(assert (=> start!69006 (and (inv!12 b2!97) e!223543)))

(declare-fun b!311062 () Bool)

(declare-fun array_inv!7784 (array!18966) Bool)

(assert (=> b!311062 (= e!223541 (array_inv!7784 (buf!7845 b1!97)))))

(declare-fun b!311063 () Bool)

(assert (=> b!311063 (= e!223543 (array_inv!7784 (buf!7845 b2!97)))))

(assert (= start!69006 b!311062))

(assert (= start!69006 b!311063))

(declare-fun m!448923 () Bool)

(assert (=> start!69006 m!448923))

(declare-fun m!448925 () Bool)

(assert (=> start!69006 m!448925))

(declare-fun m!448927 () Bool)

(assert (=> b!311062 m!448927))

(declare-fun m!448929 () Bool)

(assert (=> b!311063 m!448929))

(push 1)

(assert (not start!69006))

(assert (not b!311062))

(assert (not b!311063))

(check-sat)

(pop 1)

(push 1)

(check-sat)

