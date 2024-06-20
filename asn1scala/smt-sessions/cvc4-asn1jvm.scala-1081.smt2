; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31064 () Bool)

(assert start!31064)

(declare-fun res!131128 () Bool)

(declare-fun e!106140 () Bool)

(assert (=> start!31064 (=> (not res!131128) (not e!106140))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7222 0))(
  ( (array!7223 (arr!4123 (Array (_ BitVec 32) (_ BitVec 8))) (size!3258 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7222)

(assert (=> start!31064 (= res!131128 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3258 arr!153))))))

(assert (=> start!31064 e!106140))

(assert (=> start!31064 true))

(declare-fun array_inv!3029 (array!7222) Bool)

(assert (=> start!31064 (array_inv!3029 arr!153)))

(declare-datatypes ((BitStream!5738 0))(
  ( (BitStream!5739 (buf!3743 array!7222) (currentByte!6870 (_ BitVec 32)) (currentBit!6865 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5738)

(declare-fun e!106144 () Bool)

(declare-fun inv!12 (BitStream!5738) Bool)

(assert (=> start!31064 (and (inv!12 bs!65) e!106144)))

(declare-fun b!156893 () Bool)

(assert (=> b!156893 (= e!106144 (array_inv!3029 (buf!3743 bs!65)))))

(declare-fun b!156894 () Bool)

(declare-fun e!106143 () Bool)

(assert (=> b!156894 (= e!106143 (bvsle #b00000000000000000000000000000000 to!236))))

(declare-datatypes ((tuple2!14100 0))(
  ( (tuple2!14101 (_1!7494 BitStream!5738) (_2!7494 array!7222)) )
))
(declare-fun lt!245577 () tuple2!14100)

(declare-fun lt!245576 () tuple2!14100)

(declare-fun arrayRangesEq!430 (array!7222 array!7222 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!156894 (arrayRangesEq!430 (_2!7494 lt!245577) (_2!7494 lt!245576) #b00000000000000000000000000000000 to!236)))

(declare-datatypes ((Unit!10160 0))(
  ( (Unit!10161) )
))
(declare-fun lt!245579 () Unit!10160)

(declare-fun lt!245584 () array!7222)

(declare-fun lt!245583 () BitStream!5738)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5738 array!7222 (_ BitVec 32) (_ BitVec 32)) Unit!10160)

(assert (=> b!156894 (= lt!245579 (readByteArrayLoopArrayPrefixLemma!0 lt!245583 lt!245584 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-datatypes ((tuple2!14102 0))(
  ( (tuple2!14103 (_1!7495 BitStream!5738) (_2!7495 (_ BitVec 8))) )
))
(declare-fun lt!245581 () tuple2!14102)

(declare-fun readByteArrayLoopPure!0 (BitStream!5738 array!7222 (_ BitVec 32) (_ BitVec 32)) tuple2!14100)

(declare-fun withMovedByteIndex!0 (BitStream!5738 (_ BitVec 32)) BitStream!5738)

(declare-fun readBytePure!0 (BitStream!5738) tuple2!14102)

(assert (=> b!156894 (= lt!245576 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!245583 #b00000000000000000000000000000001) (array!7223 (store (store (arr!4123 arr!153) from!240 (_2!7495 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7495 lt!245581)) (size!3258 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!245574 () (Array (_ BitVec 32) (_ BitVec 8)))

(assert (=> b!156894 (= lt!245574 (store (arr!4123 arr!153) from!240 (_2!7495 (readBytePure!0 bs!65))))))

(declare-fun b!156895 () Bool)

(declare-fun res!131126 () Bool)

(assert (=> b!156895 (=> (not res!131126) (not e!106140))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156895 (= res!131126 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3258 (buf!3743 bs!65))) ((_ sign_extend 32) (currentByte!6870 bs!65)) ((_ sign_extend 32) (currentBit!6865 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156896 () Bool)

(declare-fun e!106141 () Bool)

(assert (=> b!156896 (= e!106140 e!106141)))

(declare-fun res!131129 () Bool)

(assert (=> b!156896 (=> (not res!131129) (not e!106141))))

(assert (=> b!156896 (= res!131129 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(assert (=> b!156896 (= lt!245577 (readByteArrayLoopPure!0 lt!245583 lt!245584 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!156896 (= lt!245584 (array!7223 (store (arr!4123 arr!153) from!240 (_2!7495 (readBytePure!0 bs!65))) (size!3258 arr!153)))))

(assert (=> b!156896 (= lt!245583 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245582 () tuple2!14100)

(assert (=> b!156896 (= lt!245582 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156897 () Bool)

(assert (=> b!156897 (= e!106141 (not e!106143))))

(declare-fun res!131127 () Bool)

(assert (=> b!156897 (=> res!131127 e!106143)))

(assert (=> b!156897 (= res!131127 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(declare-fun lt!245580 () (_ BitVec 64))

(declare-fun lt!245578 () (_ BitVec 64))

(assert (=> b!156897 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3258 (buf!3743 lt!245583))) lt!245578 lt!245580 (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!156897 (= lt!245580 ((_ sign_extend 32) (currentBit!6865 lt!245583)))))

(assert (=> b!156897 (= lt!245578 ((_ sign_extend 32) (currentByte!6870 lt!245583)))))

(declare-fun lt!245575 () Unit!10160)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5738 BitStream!5738 (_ BitVec 64) (_ BitVec 32)) Unit!10160)

(assert (=> b!156897 (= lt!245575 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!245583 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(assert (=> b!156897 (= lt!245581 (readBytePure!0 lt!245583))))

(declare-fun b!156898 () Bool)

(declare-fun res!131125 () Bool)

(assert (=> b!156898 (=> res!131125 e!106143)))

(assert (=> b!156898 (= res!131125 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3258 (buf!3743 lt!245583))) lt!245578 lt!245580 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))))

(assert (= (and start!31064 res!131128) b!156895))

(assert (= (and b!156895 res!131126) b!156896))

(assert (= (and b!156896 res!131129) b!156897))

(assert (= (and b!156897 (not res!131127)) b!156898))

(assert (= (and b!156898 (not res!131125)) b!156894))

(assert (= start!31064 b!156893))

(declare-fun m!244641 () Bool)

(assert (=> b!156896 m!244641))

(declare-fun m!244643 () Bool)

(assert (=> b!156896 m!244643))

(declare-fun m!244645 () Bool)

(assert (=> b!156896 m!244645))

(declare-fun m!244647 () Bool)

(assert (=> b!156896 m!244647))

(declare-fun m!244649 () Bool)

(assert (=> b!156896 m!244649))

(declare-fun m!244651 () Bool)

(assert (=> b!156894 m!244651))

(declare-fun m!244653 () Bool)

(assert (=> b!156894 m!244653))

(assert (=> b!156894 m!244641))

(assert (=> b!156894 m!244653))

(declare-fun m!244655 () Bool)

(assert (=> b!156894 m!244655))

(assert (=> b!156894 m!244645))

(declare-fun m!244657 () Bool)

(assert (=> b!156894 m!244657))

(declare-fun m!244659 () Bool)

(assert (=> b!156894 m!244659))

(declare-fun m!244661 () Bool)

(assert (=> start!31064 m!244661))

(declare-fun m!244663 () Bool)

(assert (=> start!31064 m!244663))

(declare-fun m!244665 () Bool)

(assert (=> b!156898 m!244665))

(declare-fun m!244667 () Bool)

(assert (=> b!156893 m!244667))

(declare-fun m!244669 () Bool)

(assert (=> b!156897 m!244669))

(declare-fun m!244671 () Bool)

(assert (=> b!156897 m!244671))

(declare-fun m!244673 () Bool)

(assert (=> b!156897 m!244673))

(declare-fun m!244675 () Bool)

(assert (=> b!156895 m!244675))

(push 1)

(assert (not b!156894))

(assert (not b!156895))

(assert (not b!156898))

(assert (not b!156897))

(assert (not b!156896))

(assert (not start!31064))

(assert (not b!156893))

(check-sat)

(pop 1)

(push 1)

(check-sat)

