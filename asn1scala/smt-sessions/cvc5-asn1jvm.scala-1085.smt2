; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31276 () Bool)

(assert start!31276)

(declare-fun res!131470 () Bool)

(declare-fun e!106513 () Bool)

(assert (=> start!31276 (=> (not res!131470) (not e!106513))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7248 0))(
  ( (array!7249 (arr!4169 (Array (_ BitVec 32) (_ BitVec 8))) (size!3280 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7248)

(assert (=> start!31276 (= res!131470 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3280 arr!153))))))

(assert (=> start!31276 e!106513))

(assert (=> start!31276 true))

(declare-fun array_inv!3039 (array!7248) Bool)

(assert (=> start!31276 (array_inv!3039 arr!153)))

(declare-datatypes ((BitStream!5752 0))(
  ( (BitStream!5753 (buf!3750 array!7248) (currentByte!6895 (_ BitVec 32)) (currentBit!6890 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5752)

(declare-fun e!106511 () Bool)

(declare-fun inv!12 (BitStream!5752) Bool)

(assert (=> start!31276 (and (inv!12 bs!65) e!106511)))

(declare-fun b!157313 () Bool)

(declare-fun res!131471 () Bool)

(assert (=> b!157313 (=> (not res!131471) (not e!106513))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157313 (= res!131471 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3280 (buf!3750 bs!65))) ((_ sign_extend 32) (currentByte!6895 bs!65)) ((_ sign_extend 32) (currentBit!6890 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157314 () Bool)

(assert (=> b!157314 (= e!106513 (bvsge from!240 (size!3280 arr!153)))))

(declare-datatypes ((tuple2!14164 0))(
  ( (tuple2!14165 (_1!7532 BitStream!5752) (_2!7532 (_ BitVec 8))) )
))
(declare-fun lt!247225 () tuple2!14164)

(declare-fun readBytePure!0 (BitStream!5752) tuple2!14164)

(assert (=> b!157314 (= lt!247225 (readBytePure!0 bs!65))))

(declare-fun lt!247223 () BitStream!5752)

(declare-fun withMovedByteIndex!0 (BitStream!5752 (_ BitVec 32)) BitStream!5752)

(assert (=> b!157314 (= lt!247223 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-datatypes ((tuple2!14166 0))(
  ( (tuple2!14167 (_1!7533 BitStream!5752) (_2!7533 array!7248)) )
))
(declare-fun lt!247224 () tuple2!14166)

(declare-fun readByteArrayLoopPure!0 (BitStream!5752 array!7248 (_ BitVec 32) (_ BitVec 32)) tuple2!14166)

(assert (=> b!157314 (= lt!247224 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157315 () Bool)

(assert (=> b!157315 (= e!106511 (array_inv!3039 (buf!3750 bs!65)))))

(assert (= (and start!31276 res!131470) b!157313))

(assert (= (and b!157313 res!131471) b!157314))

(assert (= start!31276 b!157315))

(declare-fun m!246123 () Bool)

(assert (=> start!31276 m!246123))

(declare-fun m!246125 () Bool)

(assert (=> start!31276 m!246125))

(declare-fun m!246127 () Bool)

(assert (=> b!157313 m!246127))

(declare-fun m!246129 () Bool)

(assert (=> b!157314 m!246129))

(declare-fun m!246131 () Bool)

(assert (=> b!157314 m!246131))

(declare-fun m!246133 () Bool)

(assert (=> b!157314 m!246133))

(declare-fun m!246135 () Bool)

(assert (=> b!157315 m!246135))

(push 1)

(assert (not b!157313))

(assert (not b!157315))

(assert (not b!157314))

(assert (not start!31276))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

