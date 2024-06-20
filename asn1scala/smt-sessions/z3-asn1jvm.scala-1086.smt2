; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31284 () Bool)

(assert start!31284)

(declare-fun res!131495 () Bool)

(declare-fun e!106562 () Bool)

(assert (=> start!31284 (=> (not res!131495) (not e!106562))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7256 0))(
  ( (array!7257 (arr!4173 (Array (_ BitVec 32) (_ BitVec 8))) (size!3284 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7256)

(assert (=> start!31284 (= res!131495 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3284 arr!153))))))

(assert (=> start!31284 e!106562))

(assert (=> start!31284 true))

(declare-fun array_inv!3043 (array!7256) Bool)

(assert (=> start!31284 (array_inv!3043 arr!153)))

(declare-datatypes ((BitStream!5760 0))(
  ( (BitStream!5761 (buf!3754 array!7256) (currentByte!6899 (_ BitVec 32)) (currentBit!6894 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5760)

(declare-fun e!106560 () Bool)

(declare-fun inv!12 (BitStream!5760) Bool)

(assert (=> start!31284 (and (inv!12 bs!65) e!106560)))

(declare-fun b!157349 () Bool)

(declare-fun res!131494 () Bool)

(assert (=> b!157349 (=> (not res!131494) (not e!106562))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157349 (= res!131494 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3284 (buf!3754 bs!65))) ((_ sign_extend 32) (currentByte!6899 bs!65)) ((_ sign_extend 32) (currentBit!6894 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157350 () Bool)

(assert (=> b!157350 (= e!106562 (and (= (bvand from!240 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand from!240 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!14180 0))(
  ( (tuple2!14181 (_1!7540 BitStream!5760) (_2!7540 (_ BitVec 8))) )
))
(declare-fun lt!247261 () tuple2!14180)

(declare-fun readBytePure!0 (BitStream!5760) tuple2!14180)

(assert (=> b!157350 (= lt!247261 (readBytePure!0 bs!65))))

(declare-fun lt!247260 () BitStream!5760)

(declare-fun withMovedByteIndex!0 (BitStream!5760 (_ BitVec 32)) BitStream!5760)

(assert (=> b!157350 (= lt!247260 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-datatypes ((tuple2!14182 0))(
  ( (tuple2!14183 (_1!7541 BitStream!5760) (_2!7541 array!7256)) )
))
(declare-fun lt!247259 () tuple2!14182)

(declare-fun readByteArrayLoopPure!0 (BitStream!5760 array!7256 (_ BitVec 32) (_ BitVec 32)) tuple2!14182)

(assert (=> b!157350 (= lt!247259 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157351 () Bool)

(assert (=> b!157351 (= e!106560 (array_inv!3043 (buf!3754 bs!65)))))

(assert (= (and start!31284 res!131495) b!157349))

(assert (= (and b!157349 res!131494) b!157350))

(assert (= start!31284 b!157351))

(declare-fun m!246179 () Bool)

(assert (=> start!31284 m!246179))

(declare-fun m!246181 () Bool)

(assert (=> start!31284 m!246181))

(declare-fun m!246183 () Bool)

(assert (=> b!157349 m!246183))

(declare-fun m!246185 () Bool)

(assert (=> b!157350 m!246185))

(declare-fun m!246187 () Bool)

(assert (=> b!157350 m!246187))

(declare-fun m!246189 () Bool)

(assert (=> b!157350 m!246189))

(declare-fun m!246191 () Bool)

(assert (=> b!157351 m!246191))

(check-sat (not b!157350) (not b!157349) (not b!157351) (not start!31284))
(check-sat)
