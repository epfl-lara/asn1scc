; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31286 () Bool)

(assert start!31286)

(declare-fun res!131501 () Bool)

(declare-fun e!106574 () Bool)

(assert (=> start!31286 (=> (not res!131501) (not e!106574))))

(declare-fun from!240 () (_ BitVec 32))

(declare-datatypes ((array!7258 0))(
  ( (array!7259 (arr!4174 (Array (_ BitVec 32) (_ BitVec 8))) (size!3285 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7258)

(declare-fun to!236 () (_ BitVec 32))

(assert (=> start!31286 (= res!131501 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3285 arr!153))))))

(assert (=> start!31286 e!106574))

(assert (=> start!31286 true))

(declare-fun array_inv!3044 (array!7258) Bool)

(assert (=> start!31286 (array_inv!3044 arr!153)))

(declare-datatypes ((BitStream!5762 0))(
  ( (BitStream!5763 (buf!3755 array!7258) (currentByte!6900 (_ BitVec 32)) (currentBit!6895 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5762)

(declare-fun e!106571 () Bool)

(declare-fun inv!12 (BitStream!5762) Bool)

(assert (=> start!31286 (and (inv!12 bs!65) e!106571)))

(declare-fun b!157358 () Bool)

(declare-fun res!131500 () Bool)

(assert (=> b!157358 (=> (not res!131500) (not e!106574))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157358 (= res!131500 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3285 (buf!3755 bs!65))) ((_ sign_extend 32) (currentByte!6900 bs!65)) ((_ sign_extend 32) (currentBit!6895 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157359 () Bool)

(assert (=> b!157359 (= e!106574 (and (= (bvand from!240 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand from!240 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!14184 0))(
  ( (tuple2!14185 (_1!7542 BitStream!5762) (_2!7542 (_ BitVec 8))) )
))
(declare-fun lt!247270 () tuple2!14184)

(declare-fun readBytePure!0 (BitStream!5762) tuple2!14184)

(assert (=> b!157359 (= lt!247270 (readBytePure!0 bs!65))))

(declare-fun lt!247268 () BitStream!5762)

(declare-fun withMovedByteIndex!0 (BitStream!5762 (_ BitVec 32)) BitStream!5762)

(assert (=> b!157359 (= lt!247268 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-datatypes ((tuple2!14186 0))(
  ( (tuple2!14187 (_1!7543 BitStream!5762) (_2!7543 array!7258)) )
))
(declare-fun lt!247269 () tuple2!14186)

(declare-fun readByteArrayLoopPure!0 (BitStream!5762 array!7258 (_ BitVec 32) (_ BitVec 32)) tuple2!14186)

(assert (=> b!157359 (= lt!247269 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157360 () Bool)

(assert (=> b!157360 (= e!106571 (array_inv!3044 (buf!3755 bs!65)))))

(assert (= (and start!31286 res!131501) b!157358))

(assert (= (and b!157358 res!131500) b!157359))

(assert (= start!31286 b!157360))

(declare-fun m!246193 () Bool)

(assert (=> start!31286 m!246193))

(declare-fun m!246195 () Bool)

(assert (=> start!31286 m!246195))

(declare-fun m!246197 () Bool)

(assert (=> b!157358 m!246197))

(declare-fun m!246199 () Bool)

(assert (=> b!157359 m!246199))

(declare-fun m!246201 () Bool)

(assert (=> b!157359 m!246201))

(declare-fun m!246203 () Bool)

(assert (=> b!157359 m!246203))

(declare-fun m!246205 () Bool)

(assert (=> b!157360 m!246205))

(push 1)

(assert (not b!157358))

(assert (not b!157359))

(assert (not b!157360))

(assert (not start!31286))

(check-sat)

(pop 1)

(push 1)

(check-sat)

