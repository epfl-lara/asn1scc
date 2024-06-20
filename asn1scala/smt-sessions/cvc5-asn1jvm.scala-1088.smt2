; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31294 () Bool)

(assert start!31294)

(declare-fun res!131524 () Bool)

(declare-fun e!106621 () Bool)

(assert (=> start!31294 (=> (not res!131524) (not e!106621))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7266 0))(
  ( (array!7267 (arr!4178 (Array (_ BitVec 32) (_ BitVec 8))) (size!3289 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7266)

(assert (=> start!31294 (= res!131524 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3289 arr!153))))))

(assert (=> start!31294 e!106621))

(assert (=> start!31294 true))

(declare-fun array_inv!3048 (array!7266) Bool)

(assert (=> start!31294 (array_inv!3048 arr!153)))

(declare-datatypes ((BitStream!5770 0))(
  ( (BitStream!5771 (buf!3759 array!7266) (currentByte!6904 (_ BitVec 32)) (currentBit!6899 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5770)

(declare-fun e!106622 () Bool)

(declare-fun inv!12 (BitStream!5770) Bool)

(assert (=> start!31294 (and (inv!12 bs!65) e!106622)))

(declare-fun b!157394 () Bool)

(declare-fun res!131525 () Bool)

(assert (=> b!157394 (=> (not res!131525) (not e!106621))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157394 (= res!131525 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3289 (buf!3759 bs!65))) ((_ sign_extend 32) (currentByte!6904 bs!65)) ((_ sign_extend 32) (currentBit!6899 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157395 () Bool)

(assert (=> b!157395 (= e!106621 (bvslt (bvsub to!236 from!240) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!14200 0))(
  ( (tuple2!14201 (_1!7550 BitStream!5770) (_2!7550 array!7266)) )
))
(declare-fun lt!247294 () tuple2!14200)

(declare-fun readByteArrayLoopPure!0 (BitStream!5770 array!7266 (_ BitVec 32) (_ BitVec 32)) tuple2!14200)

(declare-fun withMovedByteIndex!0 (BitStream!5770 (_ BitVec 32)) BitStream!5770)

(declare-datatypes ((tuple2!14202 0))(
  ( (tuple2!14203 (_1!7551 BitStream!5770) (_2!7551 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5770) tuple2!14202)

(assert (=> b!157395 (= lt!247294 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7267 (store (arr!4178 arr!153) from!240 (_2!7551 (readBytePure!0 bs!65))) (size!3289 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!247293 () tuple2!14200)

(assert (=> b!157395 (= lt!247293 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157396 () Bool)

(assert (=> b!157396 (= e!106622 (array_inv!3048 (buf!3759 bs!65)))))

(assert (= (and start!31294 res!131524) b!157394))

(assert (= (and b!157394 res!131525) b!157395))

(assert (= start!31294 b!157396))

(declare-fun m!246261 () Bool)

(assert (=> start!31294 m!246261))

(declare-fun m!246263 () Bool)

(assert (=> start!31294 m!246263))

(declare-fun m!246265 () Bool)

(assert (=> b!157394 m!246265))

(declare-fun m!246267 () Bool)

(assert (=> b!157395 m!246267))

(declare-fun m!246269 () Bool)

(assert (=> b!157395 m!246269))

(assert (=> b!157395 m!246269))

(declare-fun m!246271 () Bool)

(assert (=> b!157395 m!246271))

(declare-fun m!246273 () Bool)

(assert (=> b!157395 m!246273))

(declare-fun m!246275 () Bool)

(assert (=> b!157395 m!246275))

(declare-fun m!246277 () Bool)

(assert (=> b!157396 m!246277))

(push 1)

(assert (not b!157394))

(assert (not b!157395))

(assert (not start!31294))

(assert (not b!157396))

(check-sat)

(pop 1)

(push 1)

(check-sat)

