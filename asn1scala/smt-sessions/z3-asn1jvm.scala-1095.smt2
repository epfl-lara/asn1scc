; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31528 () Bool)

(assert start!31528)

(declare-fun b!157909 () Bool)

(declare-fun e!107138 () Bool)

(declare-datatypes ((array!7319 0))(
  ( (array!7320 (arr!4216 (Array (_ BitVec 32) (_ BitVec 8))) (size!3311 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5814 0))(
  ( (BitStream!5815 (buf!3781 array!7319) (currentByte!6952 (_ BitVec 32)) (currentBit!6947 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5814)

(declare-fun array_inv!3070 (array!7319) Bool)

(assert (=> b!157909 (= e!107138 (array_inv!3070 (buf!3781 bs!65)))))

(declare-fun b!157910 () Bool)

(declare-fun e!107136 () Bool)

(assert (=> b!157910 (= e!107136 false)))

(declare-fun lt!248819 () (_ BitVec 64))

(declare-fun lt!248822 () BitStream!5814)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!157910 (= lt!248819 (bitIndex!0 (size!3311 (buf!3781 lt!248822)) (currentByte!6952 lt!248822) (currentBit!6947 lt!248822)))))

(declare-fun b!157911 () Bool)

(declare-fun res!131925 () Bool)

(declare-fun e!107135 () Bool)

(assert (=> b!157911 (=> (not res!131925) (not e!107135))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157911 (= res!131925 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3311 (buf!3781 bs!65))) ((_ sign_extend 32) (currentByte!6952 bs!65)) ((_ sign_extend 32) (currentBit!6947 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157912 () Bool)

(declare-fun e!107139 () Bool)

(assert (=> b!157912 (= e!107139 e!107136)))

(declare-fun res!131926 () Bool)

(assert (=> b!157912 (=> (not res!131926) (not e!107136))))

(assert (=> b!157912 (= res!131926 (= (size!3311 (buf!3781 bs!65)) (size!3311 (buf!3781 lt!248822))))))

(declare-datatypes ((tuple2!14338 0))(
  ( (tuple2!14339 (_1!7628 BitStream!5814) (_2!7628 (_ BitVec 8))) )
))
(declare-fun lt!248821 () tuple2!14338)

(declare-fun readBytePure!0 (BitStream!5814) tuple2!14338)

(assert (=> b!157912 (= lt!248821 (readBytePure!0 lt!248822))))

(declare-fun res!131924 () Bool)

(assert (=> start!31528 (=> (not res!131924) (not e!107135))))

(declare-fun arr!153 () array!7319)

(assert (=> start!31528 (= res!131924 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3311 arr!153))))))

(assert (=> start!31528 e!107135))

(assert (=> start!31528 true))

(assert (=> start!31528 (array_inv!3070 arr!153)))

(declare-fun inv!12 (BitStream!5814) Bool)

(assert (=> start!31528 (and (inv!12 bs!65) e!107138)))

(declare-fun b!157913 () Bool)

(assert (=> b!157913 (= e!107135 e!107139)))

(declare-fun res!131927 () Bool)

(assert (=> b!157913 (=> (not res!131927) (not e!107139))))

(assert (=> b!157913 (= res!131927 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14340 0))(
  ( (tuple2!14341 (_1!7629 BitStream!5814) (_2!7629 array!7319)) )
))
(declare-fun lt!248818 () tuple2!14340)

(declare-fun readByteArrayLoopPure!0 (BitStream!5814 array!7319 (_ BitVec 32) (_ BitVec 32)) tuple2!14340)

(assert (=> b!157913 (= lt!248818 (readByteArrayLoopPure!0 lt!248822 (array!7320 (store (arr!4216 arr!153) from!240 (_2!7628 (readBytePure!0 bs!65))) (size!3311 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5814 (_ BitVec 32)) BitStream!5814)

(assert (=> b!157913 (= lt!248822 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!248820 () tuple2!14340)

(assert (=> b!157913 (= lt!248820 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(assert (= (and start!31528 res!131924) b!157911))

(assert (= (and b!157911 res!131925) b!157913))

(assert (= (and b!157913 res!131927) b!157912))

(assert (= (and b!157912 res!131926) b!157910))

(assert (= start!31528 b!157909))

(declare-fun m!247537 () Bool)

(assert (=> b!157909 m!247537))

(declare-fun m!247539 () Bool)

(assert (=> b!157911 m!247539))

(declare-fun m!247541 () Bool)

(assert (=> b!157913 m!247541))

(declare-fun m!247543 () Bool)

(assert (=> b!157913 m!247543))

(declare-fun m!247545 () Bool)

(assert (=> b!157913 m!247545))

(declare-fun m!247547 () Bool)

(assert (=> b!157913 m!247547))

(declare-fun m!247549 () Bool)

(assert (=> b!157913 m!247549))

(declare-fun m!247551 () Bool)

(assert (=> b!157910 m!247551))

(declare-fun m!247553 () Bool)

(assert (=> b!157912 m!247553))

(declare-fun m!247555 () Bool)

(assert (=> start!31528 m!247555))

(declare-fun m!247557 () Bool)

(assert (=> start!31528 m!247557))

(check-sat (not b!157909) (not start!31528) (not b!157913) (not b!157910) (not b!157911) (not b!157912))
