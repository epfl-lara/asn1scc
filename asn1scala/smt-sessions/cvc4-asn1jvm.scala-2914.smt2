; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69608 () Bool)

(assert start!69608)

(declare-fun b!313078 () Bool)

(declare-fun res!256330 () Bool)

(declare-fun e!225244 () Bool)

(assert (=> b!313078 (=> (not res!256330) (not e!225244))))

(declare-datatypes ((array!19208 0))(
  ( (array!19209 (arr!9411 (Array (_ BitVec 32) (_ BitVec 8))) (size!8331 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13766 0))(
  ( (BitStream!13767 (buf!7944 array!19208) (currentByte!14663 (_ BitVec 32)) (currentBit!14658 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13766)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!313078 (= res!256330 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8331 (buf!7944 b1!97))) ((_ sign_extend 32) (currentByte!14663 b1!97)) ((_ sign_extend 32) (currentBit!14658 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!313079 () Bool)

(declare-fun e!225245 () Bool)

(declare-fun array_inv!7883 (array!19208) Bool)

(assert (=> b!313079 (= e!225245 (array_inv!7883 (buf!7944 b1!97)))))

(declare-fun b!313080 () Bool)

(declare-fun res!256329 () Bool)

(assert (=> b!313080 (=> (not res!256329) (not e!225244))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313080 (= res!256329 (validate_offset_bits!1 ((_ sign_extend 32) (size!8331 (buf!7944 b1!97))) ((_ sign_extend 32) (currentByte!14663 b1!97)) ((_ sign_extend 32) (currentBit!14658 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b!313081 () Bool)

(declare-fun lt!442114 () (_ BitVec 64))

(declare-fun lt!442115 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13766)

(assert (=> b!313081 (= e!225244 (and (bvsge (bvsub lt!442114 lt!442115) b1ValidateOffsetBits!10) (let ((bdg!18641 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14663 b2!97))) ((_ sign_extend 32) (currentBit!14658 b2!97))))) (and (bvsle bdg!18641 (bvadd lt!442115 advancedAtMostBits!9)) (let ((bdg!18642 (bvand lt!442114 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (not (= bdg!18642 (bvand bdg!18641 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= bdg!18642 (bvand (bvsub lt!442114 bdg!18641) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))))

(assert (=> b!313081 (= lt!442115 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14663 b1!97))) ((_ sign_extend 32) (currentBit!14658 b1!97))))))

(assert (=> b!313081 (= lt!442114 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8331 (buf!7944 b1!97)))))))

(declare-fun res!256328 () Bool)

(assert (=> start!69608 (=> (not res!256328) (not e!225244))))

(assert (=> start!69608 (= res!256328 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8331 (buf!7944 b1!97)) (size!8331 (buf!7944 b2!97)))))))

(assert (=> start!69608 e!225244))

(assert (=> start!69608 true))

(declare-fun inv!12 (BitStream!13766) Bool)

(assert (=> start!69608 (and (inv!12 b1!97) e!225245)))

(declare-fun e!225246 () Bool)

(assert (=> start!69608 (and (inv!12 b2!97) e!225246)))

(declare-fun b!313082 () Bool)

(declare-fun res!256331 () Bool)

(assert (=> b!313082 (=> (not res!256331) (not e!225244))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!313082 (= res!256331 (bvsle (bitIndex!0 (size!8331 (buf!7944 b2!97)) (currentByte!14663 b2!97) (currentBit!14658 b2!97)) (bvadd (bitIndex!0 (size!8331 (buf!7944 b1!97)) (currentByte!14663 b1!97) (currentBit!14658 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!313083 () Bool)

(assert (=> b!313083 (= e!225246 (array_inv!7883 (buf!7944 b2!97)))))

(assert (= (and start!69608 res!256328) b!313080))

(assert (= (and b!313080 res!256329) b!313082))

(assert (= (and b!313082 res!256331) b!313078))

(assert (= (and b!313078 res!256330) b!313081))

(assert (= start!69608 b!313079))

(assert (= start!69608 b!313083))

(declare-fun m!450673 () Bool)

(assert (=> b!313083 m!450673))

(declare-fun m!450675 () Bool)

(assert (=> start!69608 m!450675))

(declare-fun m!450677 () Bool)

(assert (=> start!69608 m!450677))

(declare-fun m!450679 () Bool)

(assert (=> b!313082 m!450679))

(declare-fun m!450681 () Bool)

(assert (=> b!313082 m!450681))

(declare-fun m!450683 () Bool)

(assert (=> b!313078 m!450683))

(declare-fun m!450685 () Bool)

(assert (=> b!313079 m!450685))

(declare-fun m!450687 () Bool)

(assert (=> b!313080 m!450687))

(push 1)

(assert (not b!313083))

(assert (not b!313078))

(assert (not b!313080))

(assert (not b!313079))

(assert (not start!69608))

(assert (not b!313082))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

