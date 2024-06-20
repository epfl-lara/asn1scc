; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31048 () Bool)

(assert start!31048)

(declare-fun b!156749 () Bool)

(declare-fun e!105999 () Bool)

(declare-datatypes ((array!7206 0))(
  ( (array!7207 (arr!4099 (Array (_ BitVec 32) (_ BitVec 8))) (size!3234 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5722 0))(
  ( (BitStream!5723 (buf!3735 array!7206) (currentByte!6862 (_ BitVec 32)) (currentBit!6857 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5722)

(declare-fun array_inv!3021 (array!7206) Bool)

(assert (=> b!156749 (= e!105999 (array_inv!3021 (buf!3735 bs!65)))))

(declare-fun b!156750 () Bool)

(declare-fun e!105997 () Bool)

(declare-fun e!106000 () Bool)

(assert (=> b!156750 (= e!105997 e!106000)))

(declare-fun res!131005 () Bool)

(assert (=> b!156750 (=> (not res!131005) (not e!106000))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(assert (=> b!156750 (= res!131005 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-fun lt!245359 () BitStream!5722)

(declare-datatypes ((tuple2!14068 0))(
  ( (tuple2!14069 (_1!7478 BitStream!5722) (_2!7478 array!7206)) )
))
(declare-fun lt!245363 () tuple2!14068)

(declare-fun arr!153 () array!7206)

(declare-fun readByteArrayLoopPure!0 (BitStream!5722 array!7206 (_ BitVec 32) (_ BitVec 32)) tuple2!14068)

(declare-datatypes ((tuple2!14070 0))(
  ( (tuple2!14071 (_1!7479 BitStream!5722) (_2!7479 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5722) tuple2!14070)

(assert (=> b!156750 (= lt!245363 (readByteArrayLoopPure!0 lt!245359 (array!7207 (store (arr!4099 arr!153) from!240 (_2!7479 (readBytePure!0 bs!65))) (size!3234 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5722 (_ BitVec 32)) BitStream!5722)

(assert (=> b!156750 (= lt!245359 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245364 () tuple2!14068)

(assert (=> b!156750 (= lt!245364 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156751 () Bool)

(declare-fun e!105996 () Bool)

(assert (=> b!156751 (= e!105996 true)))

(declare-fun lt!245360 () tuple2!14070)

(declare-fun lt!245362 () tuple2!14068)

(assert (=> b!156751 (= lt!245362 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!245359 #b00000000000000000000000000000001) (array!7207 (store (store (arr!4099 arr!153) from!240 (_2!7479 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7479 lt!245360)) (size!3234 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!245365 () (Array (_ BitVec 32) (_ BitVec 8)))

(assert (=> b!156751 (= lt!245365 (store (arr!4099 arr!153) from!240 (_2!7479 (readBytePure!0 bs!65))))))

(declare-fun b!156753 () Bool)

(declare-fun res!131007 () Bool)

(assert (=> b!156753 (=> res!131007 e!105996)))

(declare-fun lt!245358 () (_ BitVec 64))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156753 (= res!131007 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3234 (buf!3735 lt!245359))) lt!245358 ((_ sign_extend 32) (currentBit!6857 lt!245359)) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))))

(declare-fun b!156754 () Bool)

(declare-fun res!131008 () Bool)

(assert (=> b!156754 (=> (not res!131008) (not e!105997))))

(assert (=> b!156754 (= res!131008 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3234 (buf!3735 bs!65))) ((_ sign_extend 32) (currentByte!6862 bs!65)) ((_ sign_extend 32) (currentBit!6857 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156752 () Bool)

(assert (=> b!156752 (= e!106000 (not e!105996))))

(declare-fun res!131009 () Bool)

(assert (=> b!156752 (=> res!131009 e!105996)))

(assert (=> b!156752 (= res!131009 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(assert (=> b!156752 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3234 (buf!3735 lt!245359))) lt!245358 ((_ sign_extend 32) (currentBit!6857 lt!245359)) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!156752 (= lt!245358 ((_ sign_extend 32) (currentByte!6862 lt!245359)))))

(declare-datatypes ((Unit!10144 0))(
  ( (Unit!10145) )
))
(declare-fun lt!245361 () Unit!10144)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5722 BitStream!5722 (_ BitVec 64) (_ BitVec 32)) Unit!10144)

(assert (=> b!156752 (= lt!245361 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!245359 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(assert (=> b!156752 (= lt!245360 (readBytePure!0 lt!245359))))

(declare-fun res!131006 () Bool)

(assert (=> start!31048 (=> (not res!131006) (not e!105997))))

(assert (=> start!31048 (= res!131006 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3234 arr!153))))))

(assert (=> start!31048 e!105997))

(assert (=> start!31048 true))

(assert (=> start!31048 (array_inv!3021 arr!153)))

(declare-fun inv!12 (BitStream!5722) Bool)

(assert (=> start!31048 (and (inv!12 bs!65) e!105999)))

(assert (= (and start!31048 res!131006) b!156754))

(assert (= (and b!156754 res!131008) b!156750))

(assert (= (and b!156750 res!131005) b!156752))

(assert (= (and b!156752 (not res!131009)) b!156753))

(assert (= (and b!156753 (not res!131007)) b!156751))

(assert (= start!31048 b!156749))

(declare-fun m!244377 () Bool)

(assert (=> b!156753 m!244377))

(declare-fun m!244379 () Bool)

(assert (=> b!156751 m!244379))

(declare-fun m!244381 () Bool)

(assert (=> b!156751 m!244381))

(declare-fun m!244383 () Bool)

(assert (=> b!156751 m!244383))

(declare-fun m!244385 () Bool)

(assert (=> b!156751 m!244385))

(assert (=> b!156751 m!244379))

(declare-fun m!244387 () Bool)

(assert (=> b!156751 m!244387))

(assert (=> b!156750 m!244381))

(declare-fun m!244389 () Bool)

(assert (=> b!156750 m!244389))

(declare-fun m!244391 () Bool)

(assert (=> b!156750 m!244391))

(assert (=> b!156750 m!244383))

(declare-fun m!244393 () Bool)

(assert (=> b!156750 m!244393))

(declare-fun m!244395 () Bool)

(assert (=> b!156752 m!244395))

(declare-fun m!244397 () Bool)

(assert (=> b!156752 m!244397))

(declare-fun m!244399 () Bool)

(assert (=> b!156752 m!244399))

(declare-fun m!244401 () Bool)

(assert (=> start!31048 m!244401))

(declare-fun m!244403 () Bool)

(assert (=> start!31048 m!244403))

(declare-fun m!244405 () Bool)

(assert (=> b!156754 m!244405))

(declare-fun m!244407 () Bool)

(assert (=> b!156749 m!244407))

(push 1)

(assert (not b!156754))

(assert (not start!31048))

(assert (not b!156751))

(assert (not b!156750))

(assert (not b!156753))

(assert (not b!156749))

(assert (not b!156752))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

