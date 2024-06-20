; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31300 () Bool)

(assert start!31300)

(declare-fun res!131543 () Bool)

(declare-fun e!106655 () Bool)

(assert (=> start!31300 (=> (not res!131543) (not e!106655))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7272 0))(
  ( (array!7273 (arr!4181 (Array (_ BitVec 32) (_ BitVec 8))) (size!3292 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7272)

(assert (=> start!31300 (= res!131543 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3292 arr!153))))))

(assert (=> start!31300 e!106655))

(assert (=> start!31300 true))

(declare-fun array_inv!3051 (array!7272) Bool)

(assert (=> start!31300 (array_inv!3051 arr!153)))

(declare-datatypes ((BitStream!5776 0))(
  ( (BitStream!5777 (buf!3762 array!7272) (currentByte!6907 (_ BitVec 32)) (currentBit!6902 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5776)

(declare-fun e!106656 () Bool)

(declare-fun inv!12 (BitStream!5776) Bool)

(assert (=> start!31300 (and (inv!12 bs!65) e!106656)))

(declare-fun b!157421 () Bool)

(declare-fun res!131542 () Bool)

(assert (=> b!157421 (=> (not res!131542) (not e!106655))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157421 (= res!131542 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3292 (buf!3762 bs!65))) ((_ sign_extend 32) (currentByte!6907 bs!65)) ((_ sign_extend 32) (currentBit!6902 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157422 () Bool)

(assert (=> b!157422 (= e!106655 (and (not (= (bvand to!236 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!14212 0))(
  ( (tuple2!14213 (_1!7556 BitStream!5776) (_2!7556 array!7272)) )
))
(declare-fun lt!247311 () tuple2!14212)

(declare-fun readByteArrayLoopPure!0 (BitStream!5776 array!7272 (_ BitVec 32) (_ BitVec 32)) tuple2!14212)

(declare-fun withMovedByteIndex!0 (BitStream!5776 (_ BitVec 32)) BitStream!5776)

(declare-datatypes ((tuple2!14214 0))(
  ( (tuple2!14215 (_1!7557 BitStream!5776) (_2!7557 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5776) tuple2!14214)

(assert (=> b!157422 (= lt!247311 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7273 (store (arr!4181 arr!153) from!240 (_2!7557 (readBytePure!0 bs!65))) (size!3292 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!247312 () tuple2!14212)

(assert (=> b!157422 (= lt!247312 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157423 () Bool)

(assert (=> b!157423 (= e!106656 (array_inv!3051 (buf!3762 bs!65)))))

(assert (= (and start!31300 res!131543) b!157421))

(assert (= (and b!157421 res!131542) b!157422))

(assert (= start!31300 b!157423))

(declare-fun m!246315 () Bool)

(assert (=> start!31300 m!246315))

(declare-fun m!246317 () Bool)

(assert (=> start!31300 m!246317))

(declare-fun m!246319 () Bool)

(assert (=> b!157421 m!246319))

(declare-fun m!246321 () Bool)

(assert (=> b!157422 m!246321))

(declare-fun m!246323 () Bool)

(assert (=> b!157422 m!246323))

(assert (=> b!157422 m!246323))

(declare-fun m!246325 () Bool)

(assert (=> b!157422 m!246325))

(declare-fun m!246327 () Bool)

(assert (=> b!157422 m!246327))

(declare-fun m!246329 () Bool)

(assert (=> b!157422 m!246329))

(declare-fun m!246331 () Bool)

(assert (=> b!157423 m!246331))

(push 1)

(assert (not b!157421))

(assert (not b!157423))

(assert (not b!157422))

(assert (not start!31300))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

