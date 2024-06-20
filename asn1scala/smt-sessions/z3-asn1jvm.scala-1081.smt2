; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31062 () Bool)

(assert start!31062)

(declare-fun b!156875 () Bool)

(declare-fun res!131114 () Bool)

(declare-fun e!106126 () Bool)

(assert (=> b!156875 (=> (not res!131114) (not e!106126))))

(declare-datatypes ((array!7220 0))(
  ( (array!7221 (arr!4120 (Array (_ BitVec 32) (_ BitVec 8))) (size!3255 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5736 0))(
  ( (BitStream!5737 (buf!3742 array!7220) (currentByte!6869 (_ BitVec 32)) (currentBit!6864 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5736)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156875 (= res!131114 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3255 (buf!3742 bs!65))) ((_ sign_extend 32) (currentByte!6869 bs!65)) ((_ sign_extend 32) (currentBit!6864 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156876 () Bool)

(declare-fun res!131113 () Bool)

(declare-fun e!106127 () Bool)

(assert (=> b!156876 (=> res!131113 e!106127)))

(declare-fun lt!245541 () BitStream!5736)

(declare-fun lt!245545 () (_ BitVec 64))

(declare-fun lt!245542 () (_ BitVec 64))

(assert (=> b!156876 (= res!131113 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3255 (buf!3742 lt!245541))) lt!245545 lt!245542 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))))

(declare-fun b!156877 () Bool)

(declare-fun e!106122 () Bool)

(declare-fun array_inv!3028 (array!7220) Bool)

(assert (=> b!156877 (= e!106122 (array_inv!3028 (buf!3742 bs!65)))))

(declare-fun b!156878 () Bool)

(declare-fun e!106125 () Bool)

(assert (=> b!156878 (= e!106126 e!106125)))

(declare-fun res!131111 () Bool)

(assert (=> b!156878 (=> (not res!131111) (not e!106125))))

(assert (=> b!156878 (= res!131111 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14096 0))(
  ( (tuple2!14097 (_1!7492 BitStream!5736) (_2!7492 array!7220)) )
))
(declare-fun lt!245543 () tuple2!14096)

(declare-fun lt!245546 () array!7220)

(declare-fun readByteArrayLoopPure!0 (BitStream!5736 array!7220 (_ BitVec 32) (_ BitVec 32)) tuple2!14096)

(assert (=> b!156878 (= lt!245543 (readByteArrayLoopPure!0 lt!245541 lt!245546 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun arr!153 () array!7220)

(declare-datatypes ((tuple2!14098 0))(
  ( (tuple2!14099 (_1!7493 BitStream!5736) (_2!7493 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5736) tuple2!14098)

(assert (=> b!156878 (= lt!245546 (array!7221 (store (arr!4120 arr!153) from!240 (_2!7493 (readBytePure!0 bs!65))) (size!3255 arr!153)))))

(declare-fun withMovedByteIndex!0 (BitStream!5736 (_ BitVec 32)) BitStream!5736)

(assert (=> b!156878 (= lt!245541 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245548 () tuple2!14096)

(assert (=> b!156878 (= lt!245548 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun res!131110 () Bool)

(assert (=> start!31062 (=> (not res!131110) (not e!106126))))

(assert (=> start!31062 (= res!131110 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3255 arr!153))))))

(assert (=> start!31062 e!106126))

(assert (=> start!31062 true))

(assert (=> start!31062 (array_inv!3028 arr!153)))

(declare-fun inv!12 (BitStream!5736) Bool)

(assert (=> start!31062 (and (inv!12 bs!65) e!106122)))

(declare-fun b!156879 () Bool)

(assert (=> b!156879 (= e!106125 (not e!106127))))

(declare-fun res!131112 () Bool)

(assert (=> b!156879 (=> res!131112 e!106127)))

(assert (=> b!156879 (= res!131112 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(assert (=> b!156879 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3255 (buf!3742 lt!245541))) lt!245545 lt!245542 (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!156879 (= lt!245542 ((_ sign_extend 32) (currentBit!6864 lt!245541)))))

(assert (=> b!156879 (= lt!245545 ((_ sign_extend 32) (currentByte!6869 lt!245541)))))

(declare-datatypes ((Unit!10158 0))(
  ( (Unit!10159) )
))
(declare-fun lt!245551 () Unit!10158)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5736 BitStream!5736 (_ BitVec 64) (_ BitVec 32)) Unit!10158)

(assert (=> b!156879 (= lt!245551 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!245541 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(declare-fun lt!245544 () tuple2!14098)

(assert (=> b!156879 (= lt!245544 (readBytePure!0 lt!245541))))

(declare-fun b!156880 () Bool)

(assert (=> b!156880 (= e!106127 (bvsle #b00000000000000000000000000000000 to!236))))

(declare-fun lt!245549 () tuple2!14096)

(declare-fun arrayRangesEq!429 (array!7220 array!7220 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!156880 (arrayRangesEq!429 (_2!7492 lt!245543) (_2!7492 lt!245549) #b00000000000000000000000000000000 to!236)))

(declare-fun lt!245550 () Unit!10158)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5736 array!7220 (_ BitVec 32) (_ BitVec 32)) Unit!10158)

(assert (=> b!156880 (= lt!245550 (readByteArrayLoopArrayPrefixLemma!0 lt!245541 lt!245546 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!156880 (= lt!245549 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!245541 #b00000000000000000000000000000001) (array!7221 (store (store (arr!4120 arr!153) from!240 (_2!7493 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7493 lt!245544)) (size!3255 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!245547 () (Array (_ BitVec 32) (_ BitVec 8)))

(assert (=> b!156880 (= lt!245547 (store (arr!4120 arr!153) from!240 (_2!7493 (readBytePure!0 bs!65))))))

(assert (= (and start!31062 res!131110) b!156875))

(assert (= (and b!156875 res!131114) b!156878))

(assert (= (and b!156878 res!131111) b!156879))

(assert (= (and b!156879 (not res!131112)) b!156876))

(assert (= (and b!156876 (not res!131113)) b!156880))

(assert (= start!31062 b!156877))

(declare-fun m!244605 () Bool)

(assert (=> b!156878 m!244605))

(declare-fun m!244607 () Bool)

(assert (=> b!156878 m!244607))

(declare-fun m!244609 () Bool)

(assert (=> b!156878 m!244609))

(declare-fun m!244611 () Bool)

(assert (=> b!156878 m!244611))

(declare-fun m!244613 () Bool)

(assert (=> b!156878 m!244613))

(assert (=> b!156880 m!244605))

(declare-fun m!244615 () Bool)

(assert (=> b!156880 m!244615))

(declare-fun m!244617 () Bool)

(assert (=> b!156880 m!244617))

(assert (=> b!156880 m!244615))

(assert (=> b!156880 m!244609))

(declare-fun m!244619 () Bool)

(assert (=> b!156880 m!244619))

(declare-fun m!244621 () Bool)

(assert (=> b!156880 m!244621))

(declare-fun m!244623 () Bool)

(assert (=> b!156880 m!244623))

(declare-fun m!244625 () Bool)

(assert (=> b!156876 m!244625))

(declare-fun m!244627 () Bool)

(assert (=> start!31062 m!244627))

(declare-fun m!244629 () Bool)

(assert (=> start!31062 m!244629))

(declare-fun m!244631 () Bool)

(assert (=> b!156879 m!244631))

(declare-fun m!244633 () Bool)

(assert (=> b!156879 m!244633))

(declare-fun m!244635 () Bool)

(assert (=> b!156879 m!244635))

(declare-fun m!244637 () Bool)

(assert (=> b!156877 m!244637))

(declare-fun m!244639 () Bool)

(assert (=> b!156875 m!244639))

(check-sat (not b!156877) (not b!156880) (not start!31062) (not b!156876) (not b!156875) (not b!156879) (not b!156878))
