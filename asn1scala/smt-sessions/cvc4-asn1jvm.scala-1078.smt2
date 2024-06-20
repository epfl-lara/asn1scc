; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31046 () Bool)

(assert start!31046)

(declare-fun res!130993 () Bool)

(declare-fun e!105979 () Bool)

(assert (=> start!31046 (=> (not res!130993) (not e!105979))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7204 0))(
  ( (array!7205 (arr!4096 (Array (_ BitVec 32) (_ BitVec 8))) (size!3231 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7204)

(assert (=> start!31046 (= res!130993 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3231 arr!153))))))

(assert (=> start!31046 e!105979))

(assert (=> start!31046 true))

(declare-fun array_inv!3020 (array!7204) Bool)

(assert (=> start!31046 (array_inv!3020 arr!153)))

(declare-datatypes ((BitStream!5720 0))(
  ( (BitStream!5721 (buf!3734 array!7204) (currentByte!6861 (_ BitVec 32)) (currentBit!6856 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5720)

(declare-fun e!105983 () Bool)

(declare-fun inv!12 (BitStream!5720) Bool)

(assert (=> start!31046 (and (inv!12 bs!65) e!105983)))

(declare-fun b!156731 () Bool)

(declare-fun e!105982 () Bool)

(declare-fun e!105980 () Bool)

(assert (=> b!156731 (= e!105982 e!105980)))

(declare-fun res!130992 () Bool)

(assert (=> b!156731 (=> (not res!130992) (not e!105980))))

(declare-fun lt!245341 () BitStream!5720)

(assert (=> b!156731 (= res!130992 (= (size!3231 (buf!3734 bs!65)) (size!3231 (buf!3734 lt!245341))))))

(declare-datatypes ((tuple2!14064 0))(
  ( (tuple2!14065 (_1!7476 BitStream!5720) (_2!7476 (_ BitVec 8))) )
))
(declare-fun lt!245337 () tuple2!14064)

(declare-fun readBytePure!0 (BitStream!5720) tuple2!14064)

(assert (=> b!156731 (= lt!245337 (readBytePure!0 lt!245341))))

(declare-fun b!156732 () Bool)

(assert (=> b!156732 (= e!105983 (array_inv!3020 (buf!3734 bs!65)))))

(declare-fun b!156733 () Bool)

(assert (=> b!156733 (= e!105979 e!105982)))

(declare-fun res!130990 () Bool)

(assert (=> b!156733 (=> (not res!130990) (not e!105982))))

(assert (=> b!156733 (= res!130990 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14066 0))(
  ( (tuple2!14067 (_1!7477 BitStream!5720) (_2!7477 array!7204)) )
))
(declare-fun lt!245338 () tuple2!14066)

(declare-fun readByteArrayLoopPure!0 (BitStream!5720 array!7204 (_ BitVec 32) (_ BitVec 32)) tuple2!14066)

(assert (=> b!156733 (= lt!245338 (readByteArrayLoopPure!0 lt!245341 (array!7205 (store (arr!4096 arr!153) from!240 (_2!7476 (readBytePure!0 bs!65))) (size!3231 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5720 (_ BitVec 32)) BitStream!5720)

(assert (=> b!156733 (= lt!245341 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245340 () tuple2!14066)

(assert (=> b!156733 (= lt!245340 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156734 () Bool)

(declare-fun res!130994 () Bool)

(assert (=> b!156734 (=> (not res!130994) (not e!105980))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156734 (= res!130994 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3231 (buf!3734 lt!245341)) (currentByte!6861 lt!245341) (currentBit!6856 lt!245341))))))

(declare-fun b!156735 () Bool)

(assert (=> b!156735 (= e!105980 false)))

(declare-fun lt!245339 () (_ BitVec 64))

(assert (=> b!156735 (= lt!245339 (bitIndex!0 (size!3231 (buf!3734 bs!65)) (currentByte!6861 bs!65) (currentBit!6856 bs!65)))))

(declare-fun b!156736 () Bool)

(declare-fun res!130991 () Bool)

(assert (=> b!156736 (=> (not res!130991) (not e!105979))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156736 (= res!130991 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3231 (buf!3734 bs!65))) ((_ sign_extend 32) (currentByte!6861 bs!65)) ((_ sign_extend 32) (currentBit!6856 bs!65)) (bvsub to!236 from!240)))))

(assert (= (and start!31046 res!130993) b!156736))

(assert (= (and b!156736 res!130991) b!156733))

(assert (= (and b!156733 res!130990) b!156731))

(assert (= (and b!156731 res!130992) b!156734))

(assert (= (and b!156734 res!130994) b!156735))

(assert (= start!31046 b!156732))

(declare-fun m!244353 () Bool)

(assert (=> b!156734 m!244353))

(declare-fun m!244355 () Bool)

(assert (=> b!156735 m!244355))

(declare-fun m!244357 () Bool)

(assert (=> start!31046 m!244357))

(declare-fun m!244359 () Bool)

(assert (=> start!31046 m!244359))

(declare-fun m!244361 () Bool)

(assert (=> b!156732 m!244361))

(declare-fun m!244363 () Bool)

(assert (=> b!156731 m!244363))

(declare-fun m!244365 () Bool)

(assert (=> b!156733 m!244365))

(declare-fun m!244367 () Bool)

(assert (=> b!156733 m!244367))

(declare-fun m!244369 () Bool)

(assert (=> b!156733 m!244369))

(declare-fun m!244371 () Bool)

(assert (=> b!156733 m!244371))

(declare-fun m!244373 () Bool)

(assert (=> b!156733 m!244373))

(declare-fun m!244375 () Bool)

(assert (=> b!156736 m!244375))

(push 1)

(assert (not b!156733))

(assert (not b!156731))

(assert (not b!156734))

(assert (not b!156732))

(assert (not b!156736))

(assert (not start!31046))

(assert (not b!156735))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

