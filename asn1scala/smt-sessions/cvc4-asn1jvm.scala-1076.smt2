; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31034 () Bool)

(assert start!31034)

(declare-fun b!156623 () Bool)

(declare-fun e!105870 () Bool)

(assert (=> b!156623 (= e!105870 false)))

(declare-fun lt!245250 () (_ BitVec 64))

(declare-datatypes ((array!7192 0))(
  ( (array!7193 (arr!4090 (Array (_ BitVec 32) (_ BitVec 8))) (size!3225 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5708 0))(
  ( (BitStream!5709 (buf!3728 array!7192) (currentByte!6855 (_ BitVec 32)) (currentBit!6850 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5708)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156623 (= lt!245250 (bitIndex!0 (size!3225 (buf!3728 bs!65)) (currentByte!6855 bs!65) (currentBit!6850 bs!65)))))

(declare-fun b!156624 () Bool)

(declare-fun e!105873 () Bool)

(declare-fun array_inv!3014 (array!7192) Bool)

(assert (=> b!156624 (= e!105873 (array_inv!3014 (buf!3728 bs!65)))))

(declare-fun res!130903 () Bool)

(declare-fun e!105872 () Bool)

(assert (=> start!31034 (=> (not res!130903) (not e!105872))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7192)

(assert (=> start!31034 (= res!130903 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3225 arr!153))))))

(assert (=> start!31034 e!105872))

(assert (=> start!31034 true))

(assert (=> start!31034 (array_inv!3014 arr!153)))

(declare-fun inv!12 (BitStream!5708) Bool)

(assert (=> start!31034 (and (inv!12 bs!65) e!105873)))

(declare-fun b!156625 () Bool)

(declare-fun res!130900 () Bool)

(assert (=> b!156625 (=> (not res!130900) (not e!105872))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156625 (= res!130900 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3225 (buf!3728 bs!65))) ((_ sign_extend 32) (currentByte!6855 bs!65)) ((_ sign_extend 32) (currentBit!6850 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156626 () Bool)

(declare-fun e!105874 () Bool)

(assert (=> b!156626 (= e!105874 e!105870)))

(declare-fun res!130904 () Bool)

(assert (=> b!156626 (=> (not res!130904) (not e!105870))))

(declare-fun lt!245251 () BitStream!5708)

(assert (=> b!156626 (= res!130904 (= (size!3225 (buf!3728 bs!65)) (size!3225 (buf!3728 lt!245251))))))

(declare-datatypes ((tuple2!14040 0))(
  ( (tuple2!14041 (_1!7464 BitStream!5708) (_2!7464 (_ BitVec 8))) )
))
(declare-fun lt!245249 () tuple2!14040)

(declare-fun readBytePure!0 (BitStream!5708) tuple2!14040)

(assert (=> b!156626 (= lt!245249 (readBytePure!0 lt!245251))))

(declare-fun b!156627 () Bool)

(assert (=> b!156627 (= e!105872 e!105874)))

(declare-fun res!130901 () Bool)

(assert (=> b!156627 (=> (not res!130901) (not e!105874))))

(assert (=> b!156627 (= res!130901 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14042 0))(
  ( (tuple2!14043 (_1!7465 BitStream!5708) (_2!7465 array!7192)) )
))
(declare-fun lt!245247 () tuple2!14042)

(declare-fun readByteArrayLoopPure!0 (BitStream!5708 array!7192 (_ BitVec 32) (_ BitVec 32)) tuple2!14042)

(assert (=> b!156627 (= lt!245247 (readByteArrayLoopPure!0 lt!245251 (array!7193 (store (arr!4090 arr!153) from!240 (_2!7464 (readBytePure!0 bs!65))) (size!3225 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5708 (_ BitVec 32)) BitStream!5708)

(assert (=> b!156627 (= lt!245251 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245248 () tuple2!14042)

(assert (=> b!156627 (= lt!245248 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156628 () Bool)

(declare-fun res!130902 () Bool)

(assert (=> b!156628 (=> (not res!130902) (not e!105870))))

(assert (=> b!156628 (= res!130902 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3225 (buf!3728 lt!245251)) (currentByte!6855 lt!245251) (currentBit!6850 lt!245251))))))

(assert (= (and start!31034 res!130903) b!156625))

(assert (= (and b!156625 res!130900) b!156627))

(assert (= (and b!156627 res!130901) b!156626))

(assert (= (and b!156626 res!130904) b!156628))

(assert (= (and b!156628 res!130902) b!156623))

(assert (= start!31034 b!156624))

(declare-fun m!244209 () Bool)

(assert (=> b!156624 m!244209))

(declare-fun m!244211 () Bool)

(assert (=> b!156623 m!244211))

(declare-fun m!244213 () Bool)

(assert (=> start!31034 m!244213))

(declare-fun m!244215 () Bool)

(assert (=> start!31034 m!244215))

(declare-fun m!244217 () Bool)

(assert (=> b!156627 m!244217))

(declare-fun m!244219 () Bool)

(assert (=> b!156627 m!244219))

(declare-fun m!244221 () Bool)

(assert (=> b!156627 m!244221))

(declare-fun m!244223 () Bool)

(assert (=> b!156627 m!244223))

(declare-fun m!244225 () Bool)

(assert (=> b!156627 m!244225))

(declare-fun m!244227 () Bool)

(assert (=> b!156628 m!244227))

(declare-fun m!244229 () Bool)

(assert (=> b!156625 m!244229))

(declare-fun m!244231 () Bool)

(assert (=> b!156626 m!244231))

(push 1)

(assert (not b!156626))

(assert (not start!31034))

(assert (not b!156627))

(assert (not b!156628))

(assert (not b!156625))

(assert (not b!156624))

(assert (not b!156623))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

