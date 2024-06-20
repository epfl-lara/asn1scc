; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31020 () Bool)

(assert start!31020)

(declare-fun b!156497 () Bool)

(declare-fun res!130795 () Bool)

(declare-fun e!105749 () Bool)

(assert (=> b!156497 (=> (not res!130795) (not e!105749))))

(declare-datatypes ((array!7178 0))(
  ( (array!7179 (arr!4083 (Array (_ BitVec 32) (_ BitVec 8))) (size!3218 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5694 0))(
  ( (BitStream!5695 (buf!3721 array!7178) (currentByte!6848 (_ BitVec 32)) (currentBit!6843 (_ BitVec 32))) )
))
(declare-fun lt!245143 () BitStream!5694)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156497 (= res!130795 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3218 (buf!3721 lt!245143)) (currentByte!6848 lt!245143) (currentBit!6843 lt!245143))))))

(declare-fun b!156498 () Bool)

(declare-fun e!105744 () Bool)

(declare-fun e!105746 () Bool)

(assert (=> b!156498 (= e!105744 e!105746)))

(declare-fun res!130796 () Bool)

(assert (=> b!156498 (=> (not res!130796) (not e!105746))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(assert (=> b!156498 (= res!130796 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-fun bs!65 () BitStream!5694)

(declare-datatypes ((tuple2!14012 0))(
  ( (tuple2!14013 (_1!7450 BitStream!5694) (_2!7450 array!7178)) )
))
(declare-fun lt!245146 () tuple2!14012)

(declare-fun arr!153 () array!7178)

(declare-fun readByteArrayLoopPure!0 (BitStream!5694 array!7178 (_ BitVec 32) (_ BitVec 32)) tuple2!14012)

(declare-datatypes ((tuple2!14014 0))(
  ( (tuple2!14015 (_1!7451 BitStream!5694) (_2!7451 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5694) tuple2!14014)

(assert (=> b!156498 (= lt!245146 (readByteArrayLoopPure!0 lt!245143 (array!7179 (store (arr!4083 arr!153) from!240 (_2!7451 (readBytePure!0 bs!65))) (size!3218 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5694 (_ BitVec 32)) BitStream!5694)

(assert (=> b!156498 (= lt!245143 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245142 () tuple2!14012)

(assert (=> b!156498 (= lt!245142 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156499 () Bool)

(declare-fun res!130797 () Bool)

(assert (=> b!156499 (=> (not res!130797) (not e!105744))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156499 (= res!130797 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3218 (buf!3721 bs!65))) ((_ sign_extend 32) (currentByte!6848 bs!65)) ((_ sign_extend 32) (currentBit!6843 bs!65)) (bvsub to!236 from!240)))))

(declare-fun res!130798 () Bool)

(assert (=> start!31020 (=> (not res!130798) (not e!105744))))

(assert (=> start!31020 (= res!130798 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3218 arr!153))))))

(assert (=> start!31020 e!105744))

(assert (=> start!31020 true))

(declare-fun array_inv!3007 (array!7178) Bool)

(assert (=> start!31020 (array_inv!3007 arr!153)))

(declare-fun e!105748 () Bool)

(declare-fun inv!12 (BitStream!5694) Bool)

(assert (=> start!31020 (and (inv!12 bs!65) e!105748)))

(declare-fun b!156500 () Bool)

(assert (=> b!156500 (= e!105746 e!105749)))

(declare-fun res!130799 () Bool)

(assert (=> b!156500 (=> (not res!130799) (not e!105749))))

(assert (=> b!156500 (= res!130799 (= (size!3218 (buf!3721 bs!65)) (size!3218 (buf!3721 lt!245143))))))

(declare-fun lt!245145 () tuple2!14014)

(assert (=> b!156500 (= lt!245145 (readBytePure!0 lt!245143))))

(declare-fun b!156501 () Bool)

(assert (=> b!156501 (= e!105749 false)))

(declare-fun lt!245144 () (_ BitVec 64))

(assert (=> b!156501 (= lt!245144 (bitIndex!0 (size!3218 (buf!3721 bs!65)) (currentByte!6848 bs!65) (currentBit!6843 bs!65)))))

(declare-fun b!156502 () Bool)

(assert (=> b!156502 (= e!105748 (array_inv!3007 (buf!3721 bs!65)))))

(assert (= (and start!31020 res!130798) b!156499))

(assert (= (and b!156499 res!130797) b!156498))

(assert (= (and b!156498 res!130796) b!156500))

(assert (= (and b!156500 res!130799) b!156497))

(assert (= (and b!156497 res!130795) b!156501))

(assert (= start!31020 b!156502))

(declare-fun m!244041 () Bool)

(assert (=> start!31020 m!244041))

(declare-fun m!244043 () Bool)

(assert (=> start!31020 m!244043))

(declare-fun m!244045 () Bool)

(assert (=> b!156500 m!244045))

(declare-fun m!244047 () Bool)

(assert (=> b!156497 m!244047))

(declare-fun m!244049 () Bool)

(assert (=> b!156501 m!244049))

(declare-fun m!244051 () Bool)

(assert (=> b!156499 m!244051))

(declare-fun m!244053 () Bool)

(assert (=> b!156502 m!244053))

(declare-fun m!244055 () Bool)

(assert (=> b!156498 m!244055))

(declare-fun m!244057 () Bool)

(assert (=> b!156498 m!244057))

(declare-fun m!244059 () Bool)

(assert (=> b!156498 m!244059))

(declare-fun m!244061 () Bool)

(assert (=> b!156498 m!244061))

(declare-fun m!244063 () Bool)

(assert (=> b!156498 m!244063))

(check-sat (not start!31020) (not b!156499) (not b!156502) (not b!156498) (not b!156497) (not b!156500) (not b!156501))
