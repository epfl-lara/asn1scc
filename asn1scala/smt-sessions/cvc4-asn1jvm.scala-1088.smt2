; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31298 () Bool)

(assert start!31298)

(declare-fun res!131537 () Bool)

(declare-fun e!106643 () Bool)

(assert (=> start!31298 (=> (not res!131537) (not e!106643))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7270 0))(
  ( (array!7271 (arr!4180 (Array (_ BitVec 32) (_ BitVec 8))) (size!3291 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7270)

(assert (=> start!31298 (= res!131537 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3291 arr!153))))))

(assert (=> start!31298 e!106643))

(assert (=> start!31298 true))

(declare-fun array_inv!3050 (array!7270) Bool)

(assert (=> start!31298 (array_inv!3050 arr!153)))

(declare-datatypes ((BitStream!5774 0))(
  ( (BitStream!5775 (buf!3761 array!7270) (currentByte!6906 (_ BitVec 32)) (currentBit!6901 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5774)

(declare-fun e!106645 () Bool)

(declare-fun inv!12 (BitStream!5774) Bool)

(assert (=> start!31298 (and (inv!12 bs!65) e!106645)))

(declare-fun b!157412 () Bool)

(declare-fun res!131536 () Bool)

(assert (=> b!157412 (=> (not res!131536) (not e!106643))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157412 (= res!131536 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3291 (buf!3761 bs!65))) ((_ sign_extend 32) (currentByte!6906 bs!65)) ((_ sign_extend 32) (currentBit!6901 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157413 () Bool)

(assert (=> b!157413 (= e!106643 (bvslt (bvsub to!236 from!240) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!14208 0))(
  ( (tuple2!14209 (_1!7554 BitStream!5774) (_2!7554 array!7270)) )
))
(declare-fun lt!247305 () tuple2!14208)

(declare-fun readByteArrayLoopPure!0 (BitStream!5774 array!7270 (_ BitVec 32) (_ BitVec 32)) tuple2!14208)

(declare-fun withMovedByteIndex!0 (BitStream!5774 (_ BitVec 32)) BitStream!5774)

(declare-datatypes ((tuple2!14210 0))(
  ( (tuple2!14211 (_1!7555 BitStream!5774) (_2!7555 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5774) tuple2!14210)

(assert (=> b!157413 (= lt!247305 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7271 (store (arr!4180 arr!153) from!240 (_2!7555 (readBytePure!0 bs!65))) (size!3291 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!247306 () tuple2!14208)

(assert (=> b!157413 (= lt!247306 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157414 () Bool)

(assert (=> b!157414 (= e!106645 (array_inv!3050 (buf!3761 bs!65)))))

(assert (= (and start!31298 res!131537) b!157412))

(assert (= (and b!157412 res!131536) b!157413))

(assert (= start!31298 b!157414))

(declare-fun m!246297 () Bool)

(assert (=> start!31298 m!246297))

(declare-fun m!246299 () Bool)

(assert (=> start!31298 m!246299))

(declare-fun m!246301 () Bool)

(assert (=> b!157412 m!246301))

(declare-fun m!246303 () Bool)

(assert (=> b!157413 m!246303))

(declare-fun m!246305 () Bool)

(assert (=> b!157413 m!246305))

(assert (=> b!157413 m!246305))

(declare-fun m!246307 () Bool)

(assert (=> b!157413 m!246307))

(declare-fun m!246309 () Bool)

(assert (=> b!157413 m!246309))

(declare-fun m!246311 () Bool)

(assert (=> b!157413 m!246311))

(declare-fun m!246313 () Bool)

(assert (=> b!157414 m!246313))

(push 1)

(assert (not b!157414))

(assert (not b!157413))

(assert (not start!31298))

(assert (not b!157412))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

