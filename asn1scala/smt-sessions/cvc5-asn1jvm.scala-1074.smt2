; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31018 () Bool)

(assert start!31018)

(declare-fun b!156479 () Bool)

(declare-fun e!105727 () Bool)

(assert (=> b!156479 (= e!105727 false)))

(declare-fun lt!245128 () (_ BitVec 64))

(declare-datatypes ((array!7176 0))(
  ( (array!7177 (arr!4082 (Array (_ BitVec 32) (_ BitVec 8))) (size!3217 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5692 0))(
  ( (BitStream!5693 (buf!3720 array!7176) (currentByte!6847 (_ BitVec 32)) (currentBit!6842 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5692)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156479 (= lt!245128 (bitIndex!0 (size!3217 (buf!3720 bs!65)) (currentByte!6847 bs!65) (currentBit!6842 bs!65)))))

(declare-fun res!130784 () Bool)

(declare-fun e!105730 () Bool)

(assert (=> start!31018 (=> (not res!130784) (not e!105730))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun arr!153 () array!7176)

(declare-fun to!236 () (_ BitVec 32))

(assert (=> start!31018 (= res!130784 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3217 arr!153))))))

(assert (=> start!31018 e!105730))

(assert (=> start!31018 true))

(declare-fun array_inv!3006 (array!7176) Bool)

(assert (=> start!31018 (array_inv!3006 arr!153)))

(declare-fun e!105729 () Bool)

(declare-fun inv!12 (BitStream!5692) Bool)

(assert (=> start!31018 (and (inv!12 bs!65) e!105729)))

(declare-fun b!156480 () Bool)

(declare-fun e!105728 () Bool)

(assert (=> b!156480 (= e!105730 e!105728)))

(declare-fun res!130781 () Bool)

(assert (=> b!156480 (=> (not res!130781) (not e!105728))))

(assert (=> b!156480 (= res!130781 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-fun lt!245129 () BitStream!5692)

(declare-datatypes ((tuple2!14008 0))(
  ( (tuple2!14009 (_1!7448 BitStream!5692) (_2!7448 array!7176)) )
))
(declare-fun lt!245130 () tuple2!14008)

(declare-fun readByteArrayLoopPure!0 (BitStream!5692 array!7176 (_ BitVec 32) (_ BitVec 32)) tuple2!14008)

(declare-datatypes ((tuple2!14010 0))(
  ( (tuple2!14011 (_1!7449 BitStream!5692) (_2!7449 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5692) tuple2!14010)

(assert (=> b!156480 (= lt!245130 (readByteArrayLoopPure!0 lt!245129 (array!7177 (store (arr!4082 arr!153) from!240 (_2!7449 (readBytePure!0 bs!65))) (size!3217 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5692 (_ BitVec 32)) BitStream!5692)

(assert (=> b!156480 (= lt!245129 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245127 () tuple2!14008)

(assert (=> b!156480 (= lt!245127 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156481 () Bool)

(declare-fun res!130780 () Bool)

(assert (=> b!156481 (=> (not res!130780) (not e!105730))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156481 (= res!130780 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3217 (buf!3720 bs!65))) ((_ sign_extend 32) (currentByte!6847 bs!65)) ((_ sign_extend 32) (currentBit!6842 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156482 () Bool)

(declare-fun res!130782 () Bool)

(assert (=> b!156482 (=> (not res!130782) (not e!105727))))

(assert (=> b!156482 (= res!130782 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3217 (buf!3720 lt!245129)) (currentByte!6847 lt!245129) (currentBit!6842 lt!245129))))))

(declare-fun b!156483 () Bool)

(assert (=> b!156483 (= e!105729 (array_inv!3006 (buf!3720 bs!65)))))

(declare-fun b!156484 () Bool)

(assert (=> b!156484 (= e!105728 e!105727)))

(declare-fun res!130783 () Bool)

(assert (=> b!156484 (=> (not res!130783) (not e!105727))))

(assert (=> b!156484 (= res!130783 (= (size!3217 (buf!3720 bs!65)) (size!3217 (buf!3720 lt!245129))))))

(declare-fun lt!245131 () tuple2!14010)

(assert (=> b!156484 (= lt!245131 (readBytePure!0 lt!245129))))

(assert (= (and start!31018 res!130784) b!156481))

(assert (= (and b!156481 res!130780) b!156480))

(assert (= (and b!156480 res!130781) b!156484))

(assert (= (and b!156484 res!130783) b!156482))

(assert (= (and b!156482 res!130782) b!156479))

(assert (= start!31018 b!156483))

(declare-fun m!244017 () Bool)

(assert (=> b!156484 m!244017))

(declare-fun m!244019 () Bool)

(assert (=> start!31018 m!244019))

(declare-fun m!244021 () Bool)

(assert (=> start!31018 m!244021))

(declare-fun m!244023 () Bool)

(assert (=> b!156483 m!244023))

(declare-fun m!244025 () Bool)

(assert (=> b!156482 m!244025))

(declare-fun m!244027 () Bool)

(assert (=> b!156480 m!244027))

(declare-fun m!244029 () Bool)

(assert (=> b!156480 m!244029))

(declare-fun m!244031 () Bool)

(assert (=> b!156480 m!244031))

(declare-fun m!244033 () Bool)

(assert (=> b!156480 m!244033))

(declare-fun m!244035 () Bool)

(assert (=> b!156480 m!244035))

(declare-fun m!244037 () Bool)

(assert (=> b!156479 m!244037))

(declare-fun m!244039 () Bool)

(assert (=> b!156481 m!244039))

(push 1)

(assert (not b!156480))

(assert (not b!156481))

(assert (not start!31018))

(assert (not b!156484))

(assert (not b!156483))

(assert (not b!156479))

(assert (not b!156482))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

