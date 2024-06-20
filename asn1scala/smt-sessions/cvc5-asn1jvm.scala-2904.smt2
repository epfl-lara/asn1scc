; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69544 () Bool)

(assert start!69544)

(declare-fun e!224767 () Bool)

(declare-datatypes ((array!19144 0))(
  ( (array!19145 (arr!9379 (Array (_ BitVec 32) (_ BitVec 8))) (size!8299 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13702 0))(
  ( (BitStream!13703 (buf!7912 array!19144) (currentByte!14631 (_ BitVec 32)) (currentBit!14626 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13702)

(declare-fun lt!441986 () (_ BitVec 64))

(declare-fun lt!441985 () (_ BitVec 64))

(declare-fun b!312502 () Bool)

(assert (=> b!312502 (= e!224767 (and (= lt!441986 (bvand ((_ sign_extend 32) (currentBit!14626 b1!97)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!441986 (bvand (bvadd lt!441985 ((_ sign_extend 32) (currentBit!14626 b1!97))) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!312502 (= lt!441986 (bvand lt!441985 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!312502 (= lt!441985 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14631 b1!97))))))

(declare-fun b!312503 () Bool)

(declare-fun res!255945 () Bool)

(assert (=> b!312503 (=> (not res!255945) (not e!224767))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312503 (= res!255945 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8299 (buf!7912 b1!97))) ((_ sign_extend 32) (currentByte!14631 b1!97)) ((_ sign_extend 32) (currentBit!14626 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun res!255944 () Bool)

(assert (=> start!69544 (=> (not res!255944) (not e!224767))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13702)

(assert (=> start!69544 (= res!255944 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8299 (buf!7912 b1!97)) (size!8299 (buf!7912 b2!97)))))))

(assert (=> start!69544 e!224767))

(assert (=> start!69544 true))

(declare-fun e!224764 () Bool)

(declare-fun inv!12 (BitStream!13702) Bool)

(assert (=> start!69544 (and (inv!12 b1!97) e!224764)))

(declare-fun e!224766 () Bool)

(assert (=> start!69544 (and (inv!12 b2!97) e!224766)))

(declare-fun b!312504 () Bool)

(declare-fun res!255946 () Bool)

(assert (=> b!312504 (=> (not res!255946) (not e!224767))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312504 (= res!255946 (validate_offset_bits!1 ((_ sign_extend 32) (size!8299 (buf!7912 b1!97))) ((_ sign_extend 32) (currentByte!14631 b1!97)) ((_ sign_extend 32) (currentBit!14626 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312505 () Bool)

(declare-fun array_inv!7851 (array!19144) Bool)

(assert (=> b!312505 (= e!224764 (array_inv!7851 (buf!7912 b1!97)))))

(declare-fun b!312506 () Bool)

(declare-fun res!255947 () Bool)

(assert (=> b!312506 (=> (not res!255947) (not e!224767))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312506 (= res!255947 (bvsle (bitIndex!0 (size!8299 (buf!7912 b2!97)) (currentByte!14631 b2!97) (currentBit!14626 b2!97)) (bvadd (bitIndex!0 (size!8299 (buf!7912 b1!97)) (currentByte!14631 b1!97) (currentBit!14626 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312507 () Bool)

(assert (=> b!312507 (= e!224766 (array_inv!7851 (buf!7912 b2!97)))))

(assert (= (and start!69544 res!255944) b!312504))

(assert (= (and b!312504 res!255946) b!312506))

(assert (= (and b!312506 res!255947) b!312503))

(assert (= (and b!312503 res!255945) b!312502))

(assert (= start!69544 b!312505))

(assert (= start!69544 b!312507))

(declare-fun m!450161 () Bool)

(assert (=> b!312503 m!450161))

(declare-fun m!450163 () Bool)

(assert (=> start!69544 m!450163))

(declare-fun m!450165 () Bool)

(assert (=> start!69544 m!450165))

(declare-fun m!450167 () Bool)

(assert (=> b!312504 m!450167))

(declare-fun m!450169 () Bool)

(assert (=> b!312507 m!450169))

(declare-fun m!450171 () Bool)

(assert (=> b!312505 m!450171))

(declare-fun m!450173 () Bool)

(assert (=> b!312506 m!450173))

(declare-fun m!450175 () Bool)

(assert (=> b!312506 m!450175))

(push 1)

(assert (not b!312503))

(assert (not b!312505))

(assert (not b!312504))

(assert (not start!69544))

(assert (not b!312507))

(assert (not b!312506))

(check-sat)

(pop 1)

(push 1)

(check-sat)

