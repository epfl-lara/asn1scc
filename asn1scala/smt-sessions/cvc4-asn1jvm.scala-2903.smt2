; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69542 () Bool)

(assert start!69542)

(declare-fun res!255935 () Bool)

(declare-fun e!224752 () Bool)

(assert (=> start!69542 (=> (not res!255935) (not e!224752))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19142 0))(
  ( (array!19143 (arr!9378 (Array (_ BitVec 32) (_ BitVec 8))) (size!8298 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13700 0))(
  ( (BitStream!13701 (buf!7911 array!19142) (currentByte!14630 (_ BitVec 32)) (currentBit!14625 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13700)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13700)

(assert (=> start!69542 (= res!255935 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8298 (buf!7911 b1!97)) (size!8298 (buf!7911 b2!97)))))))

(assert (=> start!69542 e!224752))

(assert (=> start!69542 true))

(declare-fun e!224751 () Bool)

(declare-fun inv!12 (BitStream!13700) Bool)

(assert (=> start!69542 (and (inv!12 b1!97) e!224751)))

(declare-fun e!224748 () Bool)

(assert (=> start!69542 (and (inv!12 b2!97) e!224748)))

(declare-fun b!312484 () Bool)

(declare-fun res!255933 () Bool)

(assert (=> b!312484 (=> (not res!255933) (not e!224752))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312484 (= res!255933 (bvsle (bitIndex!0 (size!8298 (buf!7911 b2!97)) (currentByte!14630 b2!97) (currentBit!14625 b2!97)) (bvadd (bitIndex!0 (size!8298 (buf!7911 b1!97)) (currentByte!14630 b1!97) (currentBit!14625 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312485 () Bool)

(declare-fun res!255934 () Bool)

(assert (=> b!312485 (=> (not res!255934) (not e!224752))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312485 (= res!255934 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8298 (buf!7911 b1!97))) ((_ sign_extend 32) (currentByte!14630 b1!97)) ((_ sign_extend 32) (currentBit!14625 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312486 () Bool)

(assert (=> b!312486 (= e!224752 (and (not (= ((_ sign_extend 32) (currentByte!14630 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14630 b1!97))) ((_ sign_extend 32) (currentByte!14630 b1!97)))))))))

(declare-fun b!312487 () Bool)

(declare-fun res!255932 () Bool)

(assert (=> b!312487 (=> (not res!255932) (not e!224752))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312487 (= res!255932 (validate_offset_bits!1 ((_ sign_extend 32) (size!8298 (buf!7911 b1!97))) ((_ sign_extend 32) (currentByte!14630 b1!97)) ((_ sign_extend 32) (currentBit!14625 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312488 () Bool)

(declare-fun array_inv!7850 (array!19142) Bool)

(assert (=> b!312488 (= e!224748 (array_inv!7850 (buf!7911 b2!97)))))

(declare-fun b!312489 () Bool)

(assert (=> b!312489 (= e!224751 (array_inv!7850 (buf!7911 b1!97)))))

(assert (= (and start!69542 res!255935) b!312487))

(assert (= (and b!312487 res!255932) b!312484))

(assert (= (and b!312484 res!255933) b!312485))

(assert (= (and b!312485 res!255934) b!312486))

(assert (= start!69542 b!312489))

(assert (= start!69542 b!312488))

(declare-fun m!450145 () Bool)

(assert (=> b!312485 m!450145))

(declare-fun m!450147 () Bool)

(assert (=> b!312487 m!450147))

(declare-fun m!450149 () Bool)

(assert (=> b!312489 m!450149))

(declare-fun m!450151 () Bool)

(assert (=> start!69542 m!450151))

(declare-fun m!450153 () Bool)

(assert (=> start!69542 m!450153))

(declare-fun m!450155 () Bool)

(assert (=> b!312488 m!450155))

(declare-fun m!450157 () Bool)

(assert (=> b!312484 m!450157))

(declare-fun m!450159 () Bool)

(assert (=> b!312484 m!450159))

(push 1)

(assert (not b!312488))

(assert (not start!69542))

(assert (not b!312484))

(assert (not b!312489))

(assert (not b!312487))

(assert (not b!312485))

(check-sat)

(pop 1)

(push 1)

(check-sat)

