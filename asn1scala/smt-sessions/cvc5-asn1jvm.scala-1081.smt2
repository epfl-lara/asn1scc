; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31060 () Bool)

(assert start!31060)

(declare-fun b!156857 () Bool)

(declare-fun e!106108 () Bool)

(declare-fun to!236 () (_ BitVec 32))

(assert (=> b!156857 (= e!106108 (bvsle #b00000000000000000000000000000000 to!236))))

(declare-datatypes ((array!7218 0))(
  ( (array!7219 (arr!4117 (Array (_ BitVec 32) (_ BitVec 8))) (size!3252 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5734 0))(
  ( (BitStream!5735 (buf!3741 array!7218) (currentByte!6868 (_ BitVec 32)) (currentBit!6863 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!14092 0))(
  ( (tuple2!14093 (_1!7490 BitStream!5734) (_2!7490 array!7218)) )
))
(declare-fun lt!245510 () tuple2!14092)

(declare-fun lt!245509 () tuple2!14092)

(declare-fun arrayRangesEq!428 (array!7218 array!7218 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!156857 (arrayRangesEq!428 (_2!7490 lt!245510) (_2!7490 lt!245509) #b00000000000000000000000000000000 to!236)))

(declare-fun lt!245516 () array!7218)

(declare-fun lt!245515 () BitStream!5734)

(declare-datatypes ((Unit!10156 0))(
  ( (Unit!10157) )
))
(declare-fun lt!245511 () Unit!10156)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5734 array!7218 (_ BitVec 32) (_ BitVec 32)) Unit!10156)

(assert (=> b!156857 (= lt!245511 (readByteArrayLoopArrayPrefixLemma!0 lt!245515 lt!245516 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun bs!65 () BitStream!5734)

(declare-datatypes ((tuple2!14094 0))(
  ( (tuple2!14095 (_1!7491 BitStream!5734) (_2!7491 (_ BitVec 8))) )
))
(declare-fun lt!245512 () tuple2!14094)

(declare-fun arr!153 () array!7218)

(declare-fun readByteArrayLoopPure!0 (BitStream!5734 array!7218 (_ BitVec 32) (_ BitVec 32)) tuple2!14092)

(declare-fun withMovedByteIndex!0 (BitStream!5734 (_ BitVec 32)) BitStream!5734)

(declare-fun readBytePure!0 (BitStream!5734) tuple2!14094)

(assert (=> b!156857 (= lt!245509 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!245515 #b00000000000000000000000000000001) (array!7219 (store (store (arr!4117 arr!153) from!240 (_2!7491 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7491 lt!245512)) (size!3252 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!245508 () (Array (_ BitVec 32) (_ BitVec 8)))

(assert (=> b!156857 (= lt!245508 (store (arr!4117 arr!153) from!240 (_2!7491 (readBytePure!0 bs!65))))))

(declare-fun b!156858 () Bool)

(declare-fun e!106105 () Bool)

(declare-fun e!106104 () Bool)

(assert (=> b!156858 (= e!106105 e!106104)))

(declare-fun res!131097 () Bool)

(assert (=> b!156858 (=> (not res!131097) (not e!106104))))

(assert (=> b!156858 (= res!131097 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(assert (=> b!156858 (= lt!245510 (readByteArrayLoopPure!0 lt!245515 lt!245516 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!156858 (= lt!245516 (array!7219 (store (arr!4117 arr!153) from!240 (_2!7491 (readBytePure!0 bs!65))) (size!3252 arr!153)))))

(assert (=> b!156858 (= lt!245515 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245513 () tuple2!14092)

(assert (=> b!156858 (= lt!245513 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156859 () Bool)

(declare-fun res!131095 () Bool)

(assert (=> b!156859 (=> res!131095 e!106108)))

(declare-fun lt!245518 () (_ BitVec 64))

(declare-fun lt!245517 () (_ BitVec 64))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156859 (= res!131095 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3252 (buf!3741 lt!245515))) lt!245517 lt!245518 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))))

(declare-fun res!131099 () Bool)

(assert (=> start!31060 (=> (not res!131099) (not e!106105))))

(assert (=> start!31060 (= res!131099 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3252 arr!153))))))

(assert (=> start!31060 e!106105))

(assert (=> start!31060 true))

(declare-fun array_inv!3027 (array!7218) Bool)

(assert (=> start!31060 (array_inv!3027 arr!153)))

(declare-fun e!106107 () Bool)

(declare-fun inv!12 (BitStream!5734) Bool)

(assert (=> start!31060 (and (inv!12 bs!65) e!106107)))

(declare-fun b!156860 () Bool)

(declare-fun res!131098 () Bool)

(assert (=> b!156860 (=> (not res!131098) (not e!106105))))

(assert (=> b!156860 (= res!131098 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3252 (buf!3741 bs!65))) ((_ sign_extend 32) (currentByte!6868 bs!65)) ((_ sign_extend 32) (currentBit!6863 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156861 () Bool)

(assert (=> b!156861 (= e!106107 (array_inv!3027 (buf!3741 bs!65)))))

(declare-fun b!156862 () Bool)

(assert (=> b!156862 (= e!106104 (not e!106108))))

(declare-fun res!131096 () Bool)

(assert (=> b!156862 (=> res!131096 e!106108)))

(assert (=> b!156862 (= res!131096 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(assert (=> b!156862 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3252 (buf!3741 lt!245515))) lt!245517 lt!245518 (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!156862 (= lt!245518 ((_ sign_extend 32) (currentBit!6863 lt!245515)))))

(assert (=> b!156862 (= lt!245517 ((_ sign_extend 32) (currentByte!6868 lt!245515)))))

(declare-fun lt!245514 () Unit!10156)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5734 BitStream!5734 (_ BitVec 64) (_ BitVec 32)) Unit!10156)

(assert (=> b!156862 (= lt!245514 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!245515 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(assert (=> b!156862 (= lt!245512 (readBytePure!0 lt!245515))))

(assert (= (and start!31060 res!131099) b!156860))

(assert (= (and b!156860 res!131098) b!156858))

(assert (= (and b!156858 res!131097) b!156862))

(assert (= (and b!156862 (not res!131096)) b!156859))

(assert (= (and b!156859 (not res!131095)) b!156857))

(assert (= start!31060 b!156861))

(declare-fun m!244569 () Bool)

(assert (=> b!156860 m!244569))

(declare-fun m!244571 () Bool)

(assert (=> b!156857 m!244571))

(declare-fun m!244573 () Bool)

(assert (=> b!156857 m!244573))

(declare-fun m!244575 () Bool)

(assert (=> b!156857 m!244575))

(declare-fun m!244577 () Bool)

(assert (=> b!156857 m!244577))

(declare-fun m!244579 () Bool)

(assert (=> b!156857 m!244579))

(declare-fun m!244581 () Bool)

(assert (=> b!156857 m!244581))

(assert (=> b!156857 m!244579))

(declare-fun m!244583 () Bool)

(assert (=> b!156857 m!244583))

(declare-fun m!244585 () Bool)

(assert (=> b!156861 m!244585))

(assert (=> b!156858 m!244575))

(declare-fun m!244587 () Bool)

(assert (=> b!156858 m!244587))

(assert (=> b!156858 m!244577))

(declare-fun m!244589 () Bool)

(assert (=> b!156858 m!244589))

(declare-fun m!244591 () Bool)

(assert (=> b!156858 m!244591))

(declare-fun m!244593 () Bool)

(assert (=> b!156859 m!244593))

(declare-fun m!244595 () Bool)

(assert (=> start!31060 m!244595))

(declare-fun m!244597 () Bool)

(assert (=> start!31060 m!244597))

(declare-fun m!244599 () Bool)

(assert (=> b!156862 m!244599))

(declare-fun m!244601 () Bool)

(assert (=> b!156862 m!244601))

(declare-fun m!244603 () Bool)

(assert (=> b!156862 m!244603))

(push 1)

(assert (not b!156860))

(assert (not b!156862))

(assert (not b!156858))

(assert (not b!156859))

(assert (not start!31060))

(assert (not b!156857))

(assert (not b!156861))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

