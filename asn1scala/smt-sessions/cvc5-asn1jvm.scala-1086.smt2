; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31282 () Bool)

(assert start!31282)

(declare-fun res!131489 () Bool)

(declare-fun e!106547 () Bool)

(assert (=> start!31282 (=> (not res!131489) (not e!106547))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7254 0))(
  ( (array!7255 (arr!4172 (Array (_ BitVec 32) (_ BitVec 8))) (size!3283 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7254)

(assert (=> start!31282 (= res!131489 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3283 arr!153))))))

(assert (=> start!31282 e!106547))

(assert (=> start!31282 true))

(declare-fun array_inv!3042 (array!7254) Bool)

(assert (=> start!31282 (array_inv!3042 arr!153)))

(declare-datatypes ((BitStream!5758 0))(
  ( (BitStream!5759 (buf!3753 array!7254) (currentByte!6898 (_ BitVec 32)) (currentBit!6893 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5758)

(declare-fun e!106549 () Bool)

(declare-fun inv!12 (BitStream!5758) Bool)

(assert (=> start!31282 (and (inv!12 bs!65) e!106549)))

(declare-fun b!157340 () Bool)

(declare-fun res!131488 () Bool)

(assert (=> b!157340 (=> (not res!131488) (not e!106547))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157340 (= res!131488 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3283 (buf!3753 bs!65))) ((_ sign_extend 32) (currentByte!6898 bs!65)) ((_ sign_extend 32) (currentBit!6893 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157341 () Bool)

(assert (=> b!157341 (= e!106547 (and (= (bvand from!240 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand from!240 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!14176 0))(
  ( (tuple2!14177 (_1!7538 BitStream!5758) (_2!7538 (_ BitVec 8))) )
))
(declare-fun lt!247250 () tuple2!14176)

(declare-fun readBytePure!0 (BitStream!5758) tuple2!14176)

(assert (=> b!157341 (= lt!247250 (readBytePure!0 bs!65))))

(declare-fun lt!247251 () BitStream!5758)

(declare-fun withMovedByteIndex!0 (BitStream!5758 (_ BitVec 32)) BitStream!5758)

(assert (=> b!157341 (= lt!247251 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-datatypes ((tuple2!14178 0))(
  ( (tuple2!14179 (_1!7539 BitStream!5758) (_2!7539 array!7254)) )
))
(declare-fun lt!247252 () tuple2!14178)

(declare-fun readByteArrayLoopPure!0 (BitStream!5758 array!7254 (_ BitVec 32) (_ BitVec 32)) tuple2!14178)

(assert (=> b!157341 (= lt!247252 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157342 () Bool)

(assert (=> b!157342 (= e!106549 (array_inv!3042 (buf!3753 bs!65)))))

(assert (= (and start!31282 res!131489) b!157340))

(assert (= (and b!157340 res!131488) b!157341))

(assert (= start!31282 b!157342))

(declare-fun m!246165 () Bool)

(assert (=> start!31282 m!246165))

(declare-fun m!246167 () Bool)

(assert (=> start!31282 m!246167))

(declare-fun m!246169 () Bool)

(assert (=> b!157340 m!246169))

(declare-fun m!246171 () Bool)

(assert (=> b!157341 m!246171))

(declare-fun m!246173 () Bool)

(assert (=> b!157341 m!246173))

(declare-fun m!246175 () Bool)

(assert (=> b!157341 m!246175))

(declare-fun m!246177 () Bool)

(assert (=> b!157342 m!246177))

(push 1)

(assert (not b!157341))

(assert (not b!157342))

(assert (not start!31282))

(assert (not b!157340))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

