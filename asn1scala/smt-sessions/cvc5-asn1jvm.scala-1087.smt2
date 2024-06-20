; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31288 () Bool)

(assert start!31288)

(declare-fun res!131506 () Bool)

(declare-fun e!106585 () Bool)

(assert (=> start!31288 (=> (not res!131506) (not e!106585))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7260 0))(
  ( (array!7261 (arr!4175 (Array (_ BitVec 32) (_ BitVec 8))) (size!3286 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7260)

(assert (=> start!31288 (= res!131506 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3286 arr!153))))))

(assert (=> start!31288 e!106585))

(assert (=> start!31288 true))

(declare-fun array_inv!3045 (array!7260) Bool)

(assert (=> start!31288 (array_inv!3045 arr!153)))

(declare-datatypes ((BitStream!5764 0))(
  ( (BitStream!5765 (buf!3756 array!7260) (currentByte!6901 (_ BitVec 32)) (currentBit!6896 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5764)

(declare-fun e!106586 () Bool)

(declare-fun inv!12 (BitStream!5764) Bool)

(assert (=> start!31288 (and (inv!12 bs!65) e!106586)))

(declare-fun b!157367 () Bool)

(declare-fun res!131507 () Bool)

(assert (=> b!157367 (=> (not res!131507) (not e!106585))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157367 (= res!131507 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3286 (buf!3756 bs!65))) ((_ sign_extend 32) (currentByte!6901 bs!65)) ((_ sign_extend 32) (currentBit!6896 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157368 () Bool)

(assert (=> b!157368 (= e!106585 (and (not (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000))) (not (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!14188 0))(
  ( (tuple2!14189 (_1!7544 BitStream!5764) (_2!7544 array!7260)) )
))
(declare-fun lt!247276 () tuple2!14188)

(declare-fun readByteArrayLoopPure!0 (BitStream!5764 array!7260 (_ BitVec 32) (_ BitVec 32)) tuple2!14188)

(declare-fun withMovedByteIndex!0 (BitStream!5764 (_ BitVec 32)) BitStream!5764)

(declare-datatypes ((tuple2!14190 0))(
  ( (tuple2!14191 (_1!7545 BitStream!5764) (_2!7545 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5764) tuple2!14190)

(assert (=> b!157368 (= lt!247276 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7261 (store (arr!4175 arr!153) from!240 (_2!7545 (readBytePure!0 bs!65))) (size!3286 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!247275 () tuple2!14188)

(assert (=> b!157368 (= lt!247275 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157369 () Bool)

(assert (=> b!157369 (= e!106586 (array_inv!3045 (buf!3756 bs!65)))))

(assert (= (and start!31288 res!131506) b!157367))

(assert (= (and b!157367 res!131507) b!157368))

(assert (= start!31288 b!157369))

(declare-fun m!246207 () Bool)

(assert (=> start!31288 m!246207))

(declare-fun m!246209 () Bool)

(assert (=> start!31288 m!246209))

(declare-fun m!246211 () Bool)

(assert (=> b!157367 m!246211))

(declare-fun m!246213 () Bool)

(assert (=> b!157368 m!246213))

(declare-fun m!246215 () Bool)

(assert (=> b!157368 m!246215))

(assert (=> b!157368 m!246215))

(declare-fun m!246217 () Bool)

(assert (=> b!157368 m!246217))

(declare-fun m!246219 () Bool)

(assert (=> b!157368 m!246219))

(declare-fun m!246221 () Bool)

(assert (=> b!157368 m!246221))

(declare-fun m!246223 () Bool)

(assert (=> b!157369 m!246223))

(push 1)

(assert (not b!157368))

(assert (not start!31288))

(assert (not b!157369))

(assert (not b!157367))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

