; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31056 () Bool)

(assert start!31056)

(declare-fun res!131065 () Bool)

(declare-fun e!106068 () Bool)

(assert (=> start!31056 (=> (not res!131065) (not e!106068))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7214 0))(
  ( (array!7215 (arr!4111 (Array (_ BitVec 32) (_ BitVec 8))) (size!3246 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7214)

(assert (=> start!31056 (= res!131065 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3246 arr!153))))))

(assert (=> start!31056 e!106068))

(assert (=> start!31056 true))

(declare-fun array_inv!3025 (array!7214) Bool)

(assert (=> start!31056 (array_inv!3025 arr!153)))

(declare-datatypes ((BitStream!5730 0))(
  ( (BitStream!5731 (buf!3739 array!7214) (currentByte!6866 (_ BitVec 32)) (currentBit!6861 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5730)

(declare-fun e!106070 () Bool)

(declare-fun inv!12 (BitStream!5730) Bool)

(assert (=> start!31056 (and (inv!12 bs!65) e!106070)))

(declare-fun b!156821 () Bool)

(declare-fun res!131069 () Bool)

(declare-fun e!106072 () Bool)

(assert (=> b!156821 (=> res!131069 e!106072)))

(declare-fun lt!245454 () (_ BitVec 64))

(declare-fun lt!245460 () BitStream!5730)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156821 (= res!131069 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3246 (buf!3739 lt!245460))) lt!245454 ((_ sign_extend 32) (currentBit!6861 lt!245460)) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))))

(declare-fun b!156822 () Bool)

(declare-fun e!106073 () Bool)

(assert (=> b!156822 (= e!106068 e!106073)))

(declare-fun res!131066 () Bool)

(assert (=> b!156822 (=> (not res!131066) (not e!106073))))

(assert (=> b!156822 (= res!131066 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14084 0))(
  ( (tuple2!14085 (_1!7486 BitStream!5730) (_2!7486 array!7214)) )
))
(declare-fun lt!245456 () tuple2!14084)

(declare-fun readByteArrayLoopPure!0 (BitStream!5730 array!7214 (_ BitVec 32) (_ BitVec 32)) tuple2!14084)

(declare-datatypes ((tuple2!14086 0))(
  ( (tuple2!14087 (_1!7487 BitStream!5730) (_2!7487 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5730) tuple2!14086)

(assert (=> b!156822 (= lt!245456 (readByteArrayLoopPure!0 lt!245460 (array!7215 (store (arr!4111 arr!153) from!240 (_2!7487 (readBytePure!0 bs!65))) (size!3246 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5730 (_ BitVec 32)) BitStream!5730)

(assert (=> b!156822 (= lt!245460 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245458 () tuple2!14084)

(assert (=> b!156822 (= lt!245458 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156823 () Bool)

(assert (=> b!156823 (= e!106073 (not e!106072))))

(declare-fun res!131067 () Bool)

(assert (=> b!156823 (=> res!131067 e!106072)))

(assert (=> b!156823 (= res!131067 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(assert (=> b!156823 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3246 (buf!3739 lt!245460))) lt!245454 ((_ sign_extend 32) (currentBit!6861 lt!245460)) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!156823 (= lt!245454 ((_ sign_extend 32) (currentByte!6866 lt!245460)))))

(declare-datatypes ((Unit!10152 0))(
  ( (Unit!10153) )
))
(declare-fun lt!245457 () Unit!10152)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5730 BitStream!5730 (_ BitVec 64) (_ BitVec 32)) Unit!10152)

(assert (=> b!156823 (= lt!245457 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!245460 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(declare-fun lt!245461 () tuple2!14086)

(assert (=> b!156823 (= lt!245461 (readBytePure!0 lt!245460))))

(declare-fun b!156824 () Bool)

(assert (=> b!156824 (= e!106072 true)))

(declare-fun lt!245459 () tuple2!14084)

(assert (=> b!156824 (= lt!245459 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!245460 #b00000000000000000000000000000001) (array!7215 (store (store (arr!4111 arr!153) from!240 (_2!7487 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7487 lt!245461)) (size!3246 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!245455 () (Array (_ BitVec 32) (_ BitVec 8)))

(assert (=> b!156824 (= lt!245455 (store (arr!4111 arr!153) from!240 (_2!7487 (readBytePure!0 bs!65))))))

(declare-fun b!156825 () Bool)

(assert (=> b!156825 (= e!106070 (array_inv!3025 (buf!3739 bs!65)))))

(declare-fun b!156826 () Bool)

(declare-fun res!131068 () Bool)

(assert (=> b!156826 (=> (not res!131068) (not e!106068))))

(assert (=> b!156826 (= res!131068 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3246 (buf!3739 bs!65))) ((_ sign_extend 32) (currentByte!6866 bs!65)) ((_ sign_extend 32) (currentBit!6861 bs!65)) (bvsub to!236 from!240)))))

(assert (= (and start!31056 res!131065) b!156826))

(assert (= (and b!156826 res!131068) b!156822))

(assert (= (and b!156822 res!131066) b!156823))

(assert (= (and b!156823 (not res!131067)) b!156821))

(assert (= (and b!156821 (not res!131069)) b!156824))

(assert (= start!31056 b!156825))

(declare-fun m!244505 () Bool)

(assert (=> b!156822 m!244505))

(declare-fun m!244507 () Bool)

(assert (=> b!156822 m!244507))

(declare-fun m!244509 () Bool)

(assert (=> b!156822 m!244509))

(declare-fun m!244511 () Bool)

(assert (=> b!156822 m!244511))

(declare-fun m!244513 () Bool)

(assert (=> b!156822 m!244513))

(assert (=> b!156824 m!244505))

(declare-fun m!244515 () Bool)

(assert (=> b!156824 m!244515))

(declare-fun m!244517 () Bool)

(assert (=> b!156824 m!244517))

(assert (=> b!156824 m!244511))

(assert (=> b!156824 m!244515))

(declare-fun m!244519 () Bool)

(assert (=> b!156824 m!244519))

(declare-fun m!244521 () Bool)

(assert (=> b!156825 m!244521))

(declare-fun m!244523 () Bool)

(assert (=> start!31056 m!244523))

(declare-fun m!244525 () Bool)

(assert (=> start!31056 m!244525))

(declare-fun m!244527 () Bool)

(assert (=> b!156826 m!244527))

(declare-fun m!244529 () Bool)

(assert (=> b!156821 m!244529))

(declare-fun m!244531 () Bool)

(assert (=> b!156823 m!244531))

(declare-fun m!244533 () Bool)

(assert (=> b!156823 m!244533))

(declare-fun m!244535 () Bool)

(assert (=> b!156823 m!244535))

(check-sat (not b!156822) (not b!156821) (not b!156824) (not start!31056) (not b!156823) (not b!156825) (not b!156826))
