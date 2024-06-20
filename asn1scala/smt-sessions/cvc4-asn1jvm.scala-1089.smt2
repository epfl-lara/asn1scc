; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31304 () Bool)

(assert start!31304)

(declare-fun res!131554 () Bool)

(declare-fun e!106682 () Bool)

(assert (=> start!31304 (=> (not res!131554) (not e!106682))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7276 0))(
  ( (array!7277 (arr!4183 (Array (_ BitVec 32) (_ BitVec 8))) (size!3294 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7276)

(assert (=> start!31304 (= res!131554 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3294 arr!153))))))

(assert (=> start!31304 e!106682))

(assert (=> start!31304 true))

(declare-fun array_inv!3053 (array!7276) Bool)

(assert (=> start!31304 (array_inv!3053 arr!153)))

(declare-datatypes ((BitStream!5780 0))(
  ( (BitStream!5781 (buf!3764 array!7276) (currentByte!6909 (_ BitVec 32)) (currentBit!6904 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5780)

(declare-fun e!106679 () Bool)

(declare-fun inv!12 (BitStream!5780) Bool)

(assert (=> start!31304 (and (inv!12 bs!65) e!106679)))

(declare-fun b!157439 () Bool)

(declare-fun res!131555 () Bool)

(assert (=> b!157439 (=> (not res!131555) (not e!106682))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157439 (= res!131555 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3294 (buf!3764 bs!65))) ((_ sign_extend 32) (currentByte!6909 bs!65)) ((_ sign_extend 32) (currentBit!6904 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157440 () Bool)

(assert (=> b!157440 (= e!106682 (and (not (= (bvand to!236 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!14220 0))(
  ( (tuple2!14221 (_1!7560 BitStream!5780) (_2!7560 array!7276)) )
))
(declare-fun lt!247324 () tuple2!14220)

(declare-fun readByteArrayLoopPure!0 (BitStream!5780 array!7276 (_ BitVec 32) (_ BitVec 32)) tuple2!14220)

(declare-fun withMovedByteIndex!0 (BitStream!5780 (_ BitVec 32)) BitStream!5780)

(declare-datatypes ((tuple2!14222 0))(
  ( (tuple2!14223 (_1!7561 BitStream!5780) (_2!7561 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5780) tuple2!14222)

(assert (=> b!157440 (= lt!247324 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7277 (store (arr!4183 arr!153) from!240 (_2!7561 (readBytePure!0 bs!65))) (size!3294 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!247323 () tuple2!14220)

(assert (=> b!157440 (= lt!247323 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157441 () Bool)

(assert (=> b!157441 (= e!106679 (array_inv!3053 (buf!3764 bs!65)))))

(assert (= (and start!31304 res!131554) b!157439))

(assert (= (and b!157439 res!131555) b!157440))

(assert (= start!31304 b!157441))

(declare-fun m!246351 () Bool)

(assert (=> start!31304 m!246351))

(declare-fun m!246353 () Bool)

(assert (=> start!31304 m!246353))

(declare-fun m!246355 () Bool)

(assert (=> b!157439 m!246355))

(declare-fun m!246357 () Bool)

(assert (=> b!157440 m!246357))

(declare-fun m!246359 () Bool)

(assert (=> b!157440 m!246359))

(assert (=> b!157440 m!246359))

(declare-fun m!246361 () Bool)

(assert (=> b!157440 m!246361))

(declare-fun m!246363 () Bool)

(assert (=> b!157440 m!246363))

(declare-fun m!246365 () Bool)

(assert (=> b!157440 m!246365))

(declare-fun m!246367 () Bool)

(assert (=> b!157441 m!246367))

(push 1)

(assert (not b!157440))

(assert (not start!31304))

(assert (not b!157441))

(assert (not b!157439))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

