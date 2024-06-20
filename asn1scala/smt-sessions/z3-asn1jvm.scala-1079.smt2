; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31050 () Bool)

(assert start!31050)

(declare-fun b!156767 () Bool)

(declare-fun e!106014 () Bool)

(assert (=> b!156767 (= e!106014 true)))

(declare-datatypes ((array!7208 0))(
  ( (array!7209 (arr!4102 (Array (_ BitVec 32) (_ BitVec 8))) (size!3237 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5724 0))(
  ( (BitStream!5725 (buf!3736 array!7208) (currentByte!6863 (_ BitVec 32)) (currentBit!6858 (_ BitVec 32))) )
))
(declare-fun lt!245386 () BitStream!5724)

(declare-fun from!240 () (_ BitVec 32))

(declare-datatypes ((tuple2!14072 0))(
  ( (tuple2!14073 (_1!7480 BitStream!5724) (_2!7480 (_ BitVec 8))) )
))
(declare-fun lt!245385 () tuple2!14072)

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7208)

(declare-datatypes ((tuple2!14074 0))(
  ( (tuple2!14075 (_1!7481 BitStream!5724) (_2!7481 array!7208)) )
))
(declare-fun lt!245384 () tuple2!14074)

(declare-fun bs!65 () BitStream!5724)

(declare-fun readByteArrayLoopPure!0 (BitStream!5724 array!7208 (_ BitVec 32) (_ BitVec 32)) tuple2!14074)

(declare-fun withMovedByteIndex!0 (BitStream!5724 (_ BitVec 32)) BitStream!5724)

(declare-fun readBytePure!0 (BitStream!5724) tuple2!14072)

(assert (=> b!156767 (= lt!245384 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!245386 #b00000000000000000000000000000001) (array!7209 (store (store (arr!4102 arr!153) from!240 (_2!7480 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7480 lt!245385)) (size!3237 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!245387 () (Array (_ BitVec 32) (_ BitVec 8)))

(assert (=> b!156767 (= lt!245387 (store (arr!4102 arr!153) from!240 (_2!7480 (readBytePure!0 bs!65))))))

(declare-fun b!156768 () Bool)

(declare-fun res!131021 () Bool)

(declare-fun e!106015 () Bool)

(assert (=> b!156768 (=> (not res!131021) (not e!106015))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156768 (= res!131021 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3237 (buf!3736 bs!65))) ((_ sign_extend 32) (currentByte!6863 bs!65)) ((_ sign_extend 32) (currentBit!6858 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156769 () Bool)

(declare-fun res!131020 () Bool)

(assert (=> b!156769 (=> res!131020 e!106014)))

(declare-fun lt!245389 () (_ BitVec 64))

(assert (=> b!156769 (= res!131020 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3237 (buf!3736 lt!245386))) lt!245389 ((_ sign_extend 32) (currentBit!6858 lt!245386)) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))))

(declare-fun b!156770 () Bool)

(declare-fun e!106019 () Bool)

(assert (=> b!156770 (= e!106019 (not e!106014))))

(declare-fun res!131023 () Bool)

(assert (=> b!156770 (=> res!131023 e!106014)))

(assert (=> b!156770 (= res!131023 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(assert (=> b!156770 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3237 (buf!3736 lt!245386))) lt!245389 ((_ sign_extend 32) (currentBit!6858 lt!245386)) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!156770 (= lt!245389 ((_ sign_extend 32) (currentByte!6863 lt!245386)))))

(declare-datatypes ((Unit!10146 0))(
  ( (Unit!10147) )
))
(declare-fun lt!245388 () Unit!10146)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5724 BitStream!5724 (_ BitVec 64) (_ BitVec 32)) Unit!10146)

(assert (=> b!156770 (= lt!245388 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!245386 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(assert (=> b!156770 (= lt!245385 (readBytePure!0 lt!245386))))

(declare-fun res!131022 () Bool)

(assert (=> start!31050 (=> (not res!131022) (not e!106015))))

(assert (=> start!31050 (= res!131022 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3237 arr!153))))))

(assert (=> start!31050 e!106015))

(assert (=> start!31050 true))

(declare-fun array_inv!3022 (array!7208) Bool)

(assert (=> start!31050 (array_inv!3022 arr!153)))

(declare-fun e!106017 () Bool)

(declare-fun inv!12 (BitStream!5724) Bool)

(assert (=> start!31050 (and (inv!12 bs!65) e!106017)))

(declare-fun b!156771 () Bool)

(assert (=> b!156771 (= e!106017 (array_inv!3022 (buf!3736 bs!65)))))

(declare-fun b!156772 () Bool)

(assert (=> b!156772 (= e!106015 e!106019)))

(declare-fun res!131024 () Bool)

(assert (=> b!156772 (=> (not res!131024) (not e!106019))))

(assert (=> b!156772 (= res!131024 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-fun lt!245382 () tuple2!14074)

(assert (=> b!156772 (= lt!245382 (readByteArrayLoopPure!0 lt!245386 (array!7209 (store (arr!4102 arr!153) from!240 (_2!7480 (readBytePure!0 bs!65))) (size!3237 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!156772 (= lt!245386 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245383 () tuple2!14074)

(assert (=> b!156772 (= lt!245383 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(assert (= (and start!31050 res!131022) b!156768))

(assert (= (and b!156768 res!131021) b!156772))

(assert (= (and b!156772 res!131024) b!156770))

(assert (= (and b!156770 (not res!131023)) b!156769))

(assert (= (and b!156769 (not res!131020)) b!156767))

(assert (= start!31050 b!156771))

(declare-fun m!244409 () Bool)

(assert (=> b!156771 m!244409))

(declare-fun m!244411 () Bool)

(assert (=> start!31050 m!244411))

(declare-fun m!244413 () Bool)

(assert (=> start!31050 m!244413))

(declare-fun m!244415 () Bool)

(assert (=> b!156767 m!244415))

(declare-fun m!244417 () Bool)

(assert (=> b!156767 m!244417))

(declare-fun m!244419 () Bool)

(assert (=> b!156767 m!244419))

(declare-fun m!244421 () Bool)

(assert (=> b!156767 m!244421))

(assert (=> b!156767 m!244417))

(declare-fun m!244423 () Bool)

(assert (=> b!156767 m!244423))

(declare-fun m!244425 () Bool)

(assert (=> b!156768 m!244425))

(declare-fun m!244427 () Bool)

(assert (=> b!156772 m!244427))

(assert (=> b!156772 m!244415))

(declare-fun m!244429 () Bool)

(assert (=> b!156772 m!244429))

(assert (=> b!156772 m!244421))

(declare-fun m!244431 () Bool)

(assert (=> b!156772 m!244431))

(declare-fun m!244433 () Bool)

(assert (=> b!156770 m!244433))

(declare-fun m!244435 () Bool)

(assert (=> b!156770 m!244435))

(declare-fun m!244437 () Bool)

(assert (=> b!156770 m!244437))

(declare-fun m!244439 () Bool)

(assert (=> b!156769 m!244439))

(check-sat (not b!156771) (not b!156770) (not b!156772) (not b!156767) (not start!31050) (not b!156768) (not b!156769))
