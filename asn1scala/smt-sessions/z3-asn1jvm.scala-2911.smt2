; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69588 () Bool)

(assert start!69588)

(declare-fun b!312899 () Bool)

(declare-fun res!256208 () Bool)

(declare-fun e!225094 () Bool)

(assert (=> b!312899 (=> (not res!256208) (not e!225094))))

(declare-datatypes ((array!19188 0))(
  ( (array!19189 (arr!9401 (Array (_ BitVec 32) (_ BitVec 8))) (size!8321 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13746 0))(
  ( (BitStream!13747 (buf!7934 array!19188) (currentByte!14653 (_ BitVec 32)) (currentBit!14648 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13746)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312899 (= res!256208 (validate_offset_bits!1 ((_ sign_extend 32) (size!8321 (buf!7934 b1!97))) ((_ sign_extend 32) (currentByte!14653 b1!97)) ((_ sign_extend 32) (currentBit!14648 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312900 () Bool)

(declare-fun res!256209 () Bool)

(assert (=> b!312900 (=> (not res!256209) (not e!225094))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13746)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312900 (= res!256209 (bvsle (bitIndex!0 (size!8321 (buf!7934 b2!97)) (currentByte!14653 b2!97) (currentBit!14648 b2!97)) (bvadd (bitIndex!0 (size!8321 (buf!7934 b1!97)) (currentByte!14653 b1!97) (currentBit!14648 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312901 () Bool)

(declare-fun res!256211 () Bool)

(assert (=> b!312901 (=> (not res!256211) (not e!225094))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312901 (= res!256211 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8321 (buf!7934 b1!97))) ((_ sign_extend 32) (currentByte!14653 b1!97)) ((_ sign_extend 32) (currentBit!14648 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun res!256210 () Bool)

(assert (=> start!69588 (=> (not res!256210) (not e!225094))))

(assert (=> start!69588 (= res!256210 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8321 (buf!7934 b1!97)) (size!8321 (buf!7934 b2!97)))))))

(assert (=> start!69588 e!225094))

(assert (=> start!69588 true))

(declare-fun e!225095 () Bool)

(declare-fun inv!12 (BitStream!13746) Bool)

(assert (=> start!69588 (and (inv!12 b1!97) e!225095)))

(declare-fun e!225097 () Bool)

(assert (=> start!69588 (and (inv!12 b2!97) e!225097)))

(declare-fun b!312898 () Bool)

(declare-fun array_inv!7873 (array!19188) Bool)

(assert (=> b!312898 (= e!225097 (array_inv!7873 (buf!7934 b2!97)))))

(declare-fun lt!442072 () (_ BitVec 64))

(declare-fun lt!442073 () (_ BitVec 64))

(declare-fun b!312902 () Bool)

(assert (=> b!312902 (= e!225094 (and (bvsge (bvsub lt!442073 lt!442072) b1ValidateOffsetBits!10) (bvsle (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14653 b2!97))) ((_ sign_extend 32) (currentBit!14648 b2!97))) (bvadd lt!442072 advancedAtMostBits!9)) (not (= ((_ sign_extend 32) (size!8321 (buf!7934 b1!97))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!442073 ((_ sign_extend 32) (size!8321 (buf!7934 b1!97))))))))))

(assert (=> b!312902 (= lt!442072 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14653 b1!97))) ((_ sign_extend 32) (currentBit!14648 b1!97))))))

(assert (=> b!312902 (= lt!442073 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8321 (buf!7934 b1!97)))))))

(declare-fun b!312903 () Bool)

(assert (=> b!312903 (= e!225095 (array_inv!7873 (buf!7934 b1!97)))))

(assert (= (and start!69588 res!256210) b!312899))

(assert (= (and b!312899 res!256208) b!312900))

(assert (= (and b!312900 res!256209) b!312901))

(assert (= (and b!312901 res!256211) b!312902))

(assert (= start!69588 b!312903))

(assert (= start!69588 b!312898))

(declare-fun m!450513 () Bool)

(assert (=> b!312898 m!450513))

(declare-fun m!450515 () Bool)

(assert (=> b!312899 m!450515))

(declare-fun m!450517 () Bool)

(assert (=> start!69588 m!450517))

(declare-fun m!450519 () Bool)

(assert (=> start!69588 m!450519))

(declare-fun m!450521 () Bool)

(assert (=> b!312901 m!450521))

(declare-fun m!450523 () Bool)

(assert (=> b!312900 m!450523))

(declare-fun m!450525 () Bool)

(assert (=> b!312900 m!450525))

(declare-fun m!450527 () Bool)

(assert (=> b!312903 m!450527))

(check-sat (not start!69588) (not b!312900) (not b!312903) (not b!312899) (not b!312901) (not b!312898))
(check-sat)
