; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30940 () Bool)

(assert start!30940)

(declare-fun b!156355 () Bool)

(declare-fun e!105618 () Bool)

(declare-datatypes ((array!7167 0))(
  ( (array!7168 (arr!4073 (Array (_ BitVec 32) (_ BitVec 8))) (size!3214 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5686 0))(
  ( (BitStream!5687 (buf!3717 array!7167) (currentByte!6832 (_ BitVec 32)) (currentBit!6827 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5686)

(declare-fun array_inv!3003 (array!7167) Bool)

(assert (=> b!156355 (= e!105618 (array_inv!3003 (buf!3717 bs!65)))))

(declare-fun res!130683 () Bool)

(declare-fun e!105619 () Bool)

(assert (=> start!30940 (=> (not res!130683) (not e!105619))))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7167)

(declare-fun from!240 () (_ BitVec 32))

(assert (=> start!30940 (= res!130683 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3214 arr!153))))))

(assert (=> start!30940 e!105619))

(assert (=> start!30940 true))

(assert (=> start!30940 (array_inv!3003 arr!153)))

(declare-fun inv!12 (BitStream!5686) Bool)

(assert (=> start!30940 (and (inv!12 bs!65) e!105618)))

(declare-fun b!156352 () Bool)

(declare-fun res!130684 () Bool)

(assert (=> b!156352 (=> (not res!130684) (not e!105619))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156352 (= res!130684 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3214 (buf!3717 bs!65))) ((_ sign_extend 32) (currentByte!6832 bs!65)) ((_ sign_extend 32) (currentBit!6827 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156354 () Bool)

(declare-fun e!105620 () Bool)

(declare-fun lt!244581 () BitStream!5686)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!156354 (= e!105620 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!3214 (buf!3717 lt!244581))) ((_ sign_extend 32) (currentByte!6832 lt!244581)) ((_ sign_extend 32) (currentBit!6827 lt!244581)))))))

(declare-fun b!156353 () Bool)

(assert (=> b!156353 (= e!105619 e!105620)))

(declare-fun res!130685 () Bool)

(assert (=> b!156353 (=> (not res!130685) (not e!105620))))

(assert (=> b!156353 (= res!130685 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!13978 0))(
  ( (tuple2!13979 (_1!7430 BitStream!5686) (_2!7430 array!7167)) )
))
(declare-fun lt!244582 () tuple2!13978)

(declare-fun readByteArrayLoopPure!0 (BitStream!5686 array!7167 (_ BitVec 32) (_ BitVec 32)) tuple2!13978)

(declare-datatypes ((tuple2!13980 0))(
  ( (tuple2!13981 (_1!7431 BitStream!5686) (_2!7431 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5686) tuple2!13980)

(assert (=> b!156353 (= lt!244582 (readByteArrayLoopPure!0 lt!244581 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5686 (_ BitVec 32)) BitStream!5686)

(assert (=> b!156353 (= lt!244581 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!244580 () tuple2!13978)

(assert (=> b!156353 (= lt!244580 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(assert (= (and start!30940 res!130683) b!156352))

(assert (= (and b!156352 res!130684) b!156353))

(assert (= (and b!156353 res!130685) b!156354))

(assert (= start!30940 b!156355))

(declare-fun m!243633 () Bool)

(assert (=> b!156353 m!243633))

(declare-fun m!243635 () Bool)

(assert (=> b!156353 m!243635))

(declare-fun m!243637 () Bool)

(assert (=> b!156353 m!243637))

(declare-fun m!243639 () Bool)

(assert (=> b!156353 m!243639))

(declare-fun m!243641 () Bool)

(assert (=> b!156353 m!243641))

(declare-fun m!243643 () Bool)

(assert (=> start!30940 m!243643))

(declare-fun m!243645 () Bool)

(assert (=> start!30940 m!243645))

(declare-fun m!243647 () Bool)

(assert (=> b!156352 m!243647))

(declare-fun m!243649 () Bool)

(assert (=> b!156354 m!243649))

(declare-fun m!243651 () Bool)

(assert (=> b!156355 m!243651))

(push 1)

(assert (not b!156355))

(assert (not b!156354))

(assert (not b!156352))

(assert (not b!156353))

(assert (not start!30940))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52024 () Bool)

(declare-datatypes ((Unit!10081 0))(
  ( (Unit!10082) )
))
(declare-datatypes ((tuple3!648 0))(
  ( (tuple3!649 (_1!7436 Unit!10081) (_2!7436 BitStream!5686) (_3!441 array!7167)) )
))
(declare-fun lt!244603 () tuple3!648)

(declare-fun readByteArrayLoop!0 (BitStream!5686 array!7167 (_ BitVec 32) (_ BitVec 32)) tuple3!648)

(assert (=> d!52024 (= lt!244603 (readByteArrayLoop!0 lt!244581 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52024 (= (readByteArrayLoopPure!0 lt!244581 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!13979 (_2!7436 lt!244603) (_3!441 lt!244603)))))

(declare-fun bs!12741 () Bool)

(assert (= bs!12741 d!52024))

(declare-fun m!243693 () Bool)

(assert (=> bs!12741 m!243693))

(assert (=> b!156353 d!52024))

(declare-fun d!52026 () Bool)

(declare-datatypes ((tuple2!13990 0))(
  ( (tuple2!13991 (_1!7437 (_ BitVec 8)) (_2!7437 BitStream!5686)) )
))
(declare-fun lt!244606 () tuple2!13990)

(declare-fun readByte!0 (BitStream!5686) tuple2!13990)

(assert (=> d!52026 (= lt!244606 (readByte!0 bs!65))))

(assert (=> d!52026 (= (readBytePure!0 bs!65) (tuple2!13981 (_2!7437 lt!244606) (_1!7437 lt!244606)))))

(declare-fun bs!12742 () Bool)

(assert (= bs!12742 d!52026))

(declare-fun m!243695 () Bool)

(assert (=> bs!12742 m!243695))

(assert (=> b!156353 d!52026))

(declare-fun d!52028 () Bool)

(declare-datatypes ((tuple2!13992 0))(
  ( (tuple2!13993 (_1!7438 Unit!10081) (_2!7438 BitStream!5686)) )
))
(declare-fun moveByteIndex!0 (BitStream!5686 (_ BitVec 32)) tuple2!13992)

(assert (=> d!52028 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7438 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12743 () Bool)

(assert (= bs!12743 d!52028))

(declare-fun m!243697 () Bool)

(assert (=> bs!12743 m!243697))

(assert (=> b!156353 d!52028))

(declare-fun d!52030 () Bool)

(declare-fun lt!244607 () tuple3!648)

(assert (=> d!52030 (= lt!244607 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52030 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13979 (_2!7436 lt!244607) (_3!441 lt!244607)))))

(declare-fun bs!12744 () Bool)

(assert (= bs!12744 d!52030))

(declare-fun m!243699 () Bool)

(assert (=> bs!12744 m!243699))

(assert (=> b!156353 d!52030))

(declare-fun d!52032 () Bool)

(assert (=> d!52032 (= (array_inv!3003 arr!153) (bvsge (size!3214 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30940 d!52032))

(declare-fun d!52034 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52034 (= (inv!12 bs!65) (invariant!0 (currentBit!6827 bs!65) (currentByte!6832 bs!65) (size!3214 (buf!3717 bs!65))))))

(declare-fun bs!12745 () Bool)

(assert (= bs!12745 d!52034))

(declare-fun m!243701 () Bool)

(assert (=> bs!12745 m!243701))

(assert (=> start!30940 d!52034))

(declare-fun d!52036 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52036 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3214 (buf!3717 bs!65))) ((_ sign_extend 32) (currentByte!6832 bs!65)) ((_ sign_extend 32) (currentBit!6827 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3214 (buf!3717 bs!65))) ((_ sign_extend 32) (currentByte!6832 bs!65)) ((_ sign_extend 32) (currentBit!6827 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12746 () Bool)

(assert (= bs!12746 d!52036))

(declare-fun m!243703 () Bool)

(assert (=> bs!12746 m!243703))

(assert (=> b!156352 d!52036))

(declare-fun d!52040 () Bool)

(assert (=> d!52040 (= (array_inv!3003 (buf!3717 bs!65)) (bvsge (size!3214 (buf!3717 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!156355 d!52040))

(declare-fun d!52042 () Bool)

(assert (=> d!52042 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3214 (buf!3717 lt!244581))) ((_ sign_extend 32) (currentByte!6832 lt!244581)) ((_ sign_extend 32) (currentBit!6827 lt!244581))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3214 (buf!3717 lt!244581))) ((_ sign_extend 32) (currentByte!6832 lt!244581)) ((_ sign_extend 32) (currentBit!6827 lt!244581))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!12748 () Bool)

(assert (= bs!12748 d!52042))

(declare-fun m!243707 () Bool)

(assert (=> bs!12748 m!243707))

(assert (=> b!156354 d!52042))

(push 1)

(assert (not d!52036))

(assert (not d!52024))

(assert (not d!52028))

(assert (not d!52030))

(assert (not d!52042))

(assert (not d!52026))

(assert (not d!52034))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!244695 () tuple2!13990)

(declare-fun bm!2424 () Bool)

(declare-fun lt!244727 () (_ BitVec 32))

(declare-fun lt!244718 () array!7167)

(declare-fun lt!244717 () array!7167)

(declare-fun c!8331 () Bool)

(declare-fun lt!244712 () (_ BitVec 32))

(declare-fun call!2429 () Bool)

(declare-fun arrayRangesEq!425 (array!7167 array!7167 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2424 (= call!2429 (arrayRangesEq!425 (ite c!8331 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153)) lt!244718) (ite c!8331 (array!7168 (store (arr!4073 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7437 lt!244695)) (size!3214 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153)))) lt!244717) (ite c!8331 #b00000000000000000000000000000000 lt!244727) (ite c!8331 (bvadd #b00000000000000000000000000000001 from!240) lt!244712)))))

(declare-fun b!156390 () Bool)

(declare-fun res!130711 () Bool)

(declare-fun e!105658 () Bool)

(assert (=> b!156390 (=> (not res!130711) (not e!105658))))

(declare-fun lt!244714 () tuple3!648)

(assert (=> b!156390 (= res!130711 (and (= (buf!3717 lt!244581) (buf!3717 (_2!7436 lt!244714))) (= (size!3214 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153))) (size!3214 (_3!441 lt!244714)))))))

(declare-fun lt!244696 () tuple3!648)

(declare-fun bm!2425 () Bool)

(declare-fun call!2427 () Bool)

(assert (=> bm!2425 (= call!2427 (arrayRangesEq!425 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153)) (ite c!8331 (_3!441 lt!244696) (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153))) #b00000000000000000000000000000000 (ite c!8331 (bvadd #b00000000000000000000000000000001 from!240) (size!3214 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153))))))))

(declare-fun b!156391 () Bool)

(declare-fun e!105659 () tuple3!648)

(declare-fun lt!244715 () Unit!10081)

(assert (=> b!156391 (= e!105659 (tuple3!649 lt!244715 (_2!7436 lt!244696) (_3!441 lt!244696)))))

(assert (=> b!156391 (= lt!244695 (readByte!0 lt!244581))))

(declare-fun lt!244724 () array!7167)

(assert (=> b!156391 (= lt!244724 (array!7168 (store (arr!4073 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7437 lt!244695)) (size!3214 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153)))))))

(declare-fun lt!244699 () (_ BitVec 64))

(assert (=> b!156391 (= lt!244699 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!244711 () (_ BitVec 32))

(assert (=> b!156391 (= lt!244711 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!244706 () Unit!10081)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5686 BitStream!5686 (_ BitVec 64) (_ BitVec 32)) Unit!10081)

(assert (=> b!156391 (= lt!244706 (validateOffsetBytesFromBitIndexLemma!0 lt!244581 (_2!7437 lt!244695) lt!244699 lt!244711))))

(assert (=> b!156391 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3214 (buf!3717 (_2!7437 lt!244695)))) ((_ sign_extend 32) (currentByte!6832 (_2!7437 lt!244695))) ((_ sign_extend 32) (currentBit!6827 (_2!7437 lt!244695))) (bvsub lt!244711 ((_ extract 31 0) (bvsdiv (bvadd lt!244699 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!244725 () Unit!10081)

(assert (=> b!156391 (= lt!244725 lt!244706)))

(assert (=> b!156391 (= lt!244696 (readByteArrayLoop!0 (_2!7437 lt!244695) lt!244724 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(declare-fun call!2428 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156391 (= call!2428 (bvadd (bitIndex!0 (size!3214 (buf!3717 lt!244581)) (currentByte!6832 lt!244581) (currentBit!6827 lt!244581)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!244726 () Unit!10081)

(declare-fun Unit!10087 () Unit!10081)

(assert (=> b!156391 (= lt!244726 Unit!10087)))

(assert (=> b!156391 (= (bvadd call!2428 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3214 (buf!3717 (_2!7436 lt!244696))) (currentByte!6832 (_2!7436 lt!244696)) (currentBit!6827 (_2!7436 lt!244696))))))

(declare-fun lt!244723 () Unit!10081)

(declare-fun Unit!10088 () Unit!10081)

(assert (=> b!156391 (= lt!244723 Unit!10088)))

(assert (=> b!156391 (= (bvadd (bitIndex!0 (size!3214 (buf!3717 lt!244581)) (currentByte!6832 lt!244581) (currentBit!6827 lt!244581)) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3214 (buf!3717 (_2!7436 lt!244696))) (currentByte!6832 (_2!7436 lt!244696)) (currentBit!6827 (_2!7436 lt!244696))))))

(declare-fun lt!244697 () Unit!10081)

(declare-fun Unit!10089 () Unit!10081)

(assert (=> b!156391 (= lt!244697 Unit!10089)))

(assert (=> b!156391 (and (= (buf!3717 lt!244581) (buf!3717 (_2!7436 lt!244696))) (= (size!3214 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153))) (size!3214 (_3!441 lt!244696))))))

(declare-fun lt!244716 () Unit!10081)

(declare-fun Unit!10090 () Unit!10081)

(assert (=> b!156391 (= lt!244716 Unit!10090)))

(declare-fun lt!244704 () Unit!10081)

(declare-fun arrayUpdatedAtPrefixLemma!36 (array!7167 (_ BitVec 32) (_ BitVec 8)) Unit!10081)

(assert (=> b!156391 (= lt!244704 (arrayUpdatedAtPrefixLemma!36 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) (_1!7437 lt!244695)))))

(assert (=> b!156391 call!2429))

(declare-fun lt!244702 () Unit!10081)

(assert (=> b!156391 (= lt!244702 lt!244704)))

(declare-fun lt!244722 () (_ BitVec 32))

(assert (=> b!156391 (= lt!244722 #b00000000000000000000000000000000)))

(declare-fun lt!244709 () Unit!10081)

(declare-fun arrayRangesEqTransitive!101 (array!7167 array!7167 array!7167 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10081)

(assert (=> b!156391 (= lt!244709 (arrayRangesEqTransitive!101 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153)) lt!244724 (_3!441 lt!244696) lt!244722 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156391 (arrayRangesEq!425 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153)) (_3!441 lt!244696) lt!244722 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!244710 () Unit!10081)

(assert (=> b!156391 (= lt!244710 lt!244709)))

(assert (=> b!156391 call!2427))

(declare-fun lt!244707 () Unit!10081)

(declare-fun Unit!10091 () Unit!10081)

(assert (=> b!156391 (= lt!244707 Unit!10091)))

(declare-fun lt!244729 () Unit!10081)

(declare-fun arrayRangesEqImpliesEq!45 (array!7167 array!7167 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10081)

(assert (=> b!156391 (= lt!244729 (arrayRangesEqImpliesEq!45 lt!244724 (_3!441 lt!244696) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156391 (= (select (store (arr!4073 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7437 lt!244695)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4073 (_3!441 lt!244696)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!244701 () Unit!10081)

(assert (=> b!156391 (= lt!244701 lt!244729)))

(declare-fun lt!244698 () Bool)

(assert (=> b!156391 (= lt!244698 (= (select (arr!4073 (_3!441 lt!244696)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7437 lt!244695)))))

(declare-fun Unit!10092 () Unit!10081)

(assert (=> b!156391 (= lt!244715 Unit!10092)))

(assert (=> b!156391 lt!244698))

(declare-fun d!52082 () Bool)

(declare-fun e!105657 () Bool)

(assert (=> d!52082 e!105657))

(declare-fun res!130710 () Bool)

(assert (=> d!52082 (=> res!130710 e!105657)))

(assert (=> d!52082 (= res!130710 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!244694 () Bool)

(assert (=> d!52082 (= lt!244694 e!105658)))

(declare-fun res!130712 () Bool)

(assert (=> d!52082 (=> (not res!130712) (not e!105658))))

(declare-fun lt!244705 () (_ BitVec 64))

(declare-fun lt!244728 () (_ BitVec 64))

(assert (=> d!52082 (= res!130712 (= (bvadd lt!244728 lt!244705) (bitIndex!0 (size!3214 (buf!3717 (_2!7436 lt!244714))) (currentByte!6832 (_2!7436 lt!244714)) (currentBit!6827 (_2!7436 lt!244714)))))))

(assert (=> d!52082 (or (not (= (bvand lt!244728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!244705 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!244728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!244728 lt!244705) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!244719 () (_ BitVec 64))

(assert (=> d!52082 (= lt!244705 (bvmul lt!244719 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52082 (or (= lt!244719 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!244719 #b0000000000000000000000000000000000000000000000000000000000001000) lt!244719)))))

(assert (=> d!52082 (= lt!244719 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!52082 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52082 (= lt!244728 (bitIndex!0 (size!3214 (buf!3717 lt!244581)) (currentByte!6832 lt!244581) (currentBit!6827 lt!244581)))))

(assert (=> d!52082 (= lt!244714 e!105659)))

(assert (=> d!52082 (= c!8331 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52082 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3214 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153)))))))

(assert (=> d!52082 (= (readByteArrayLoop!0 lt!244581 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!244714)))

(declare-fun bm!2426 () Bool)

(assert (=> bm!2426 (= call!2428 (bitIndex!0 (ite c!8331 (size!3214 (buf!3717 (_2!7437 lt!244695))) (size!3214 (buf!3717 lt!244581))) (ite c!8331 (currentByte!6832 (_2!7437 lt!244695)) (currentByte!6832 lt!244581)) (ite c!8331 (currentBit!6827 (_2!7437 lt!244695)) (currentBit!6827 lt!244581))))))

(declare-fun b!156392 () Bool)

(declare-fun lt!244720 () Unit!10081)

(assert (=> b!156392 (= e!105659 (tuple3!649 lt!244720 lt!244581 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153))))))

(assert (=> b!156392 (= call!2428 call!2428)))

(declare-fun lt!244703 () Unit!10081)

(declare-fun Unit!10093 () Unit!10081)

(assert (=> b!156392 (= lt!244703 Unit!10093)))

(declare-fun lt!244721 () Unit!10081)

(declare-fun arrayRangesEqReflexiveLemma!36 (array!7167) Unit!10081)

(assert (=> b!156392 (= lt!244721 (arrayRangesEqReflexiveLemma!36 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153))))))

(assert (=> b!156392 call!2427))

(declare-fun lt!244713 () Unit!10081)

(assert (=> b!156392 (= lt!244713 lt!244721)))

(assert (=> b!156392 (= lt!244718 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153)))))

(assert (=> b!156392 (= lt!244717 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153)))))

(declare-fun lt!244708 () (_ BitVec 32))

(assert (=> b!156392 (= lt!244708 #b00000000000000000000000000000000)))

(declare-fun lt!244700 () (_ BitVec 32))

(assert (=> b!156392 (= lt!244700 (size!3214 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153))))))

(assert (=> b!156392 (= lt!244727 #b00000000000000000000000000000000)))

(assert (=> b!156392 (= lt!244712 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun arrayRangesEqSlicedLemma!36 (array!7167 array!7167 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10081)

(assert (=> b!156392 (= lt!244720 (arrayRangesEqSlicedLemma!36 lt!244718 lt!244717 lt!244708 lt!244700 lt!244727 lt!244712))))

(assert (=> b!156392 call!2429))

(declare-fun b!156393 () Bool)

(assert (=> b!156393 (= e!105657 (= (select (arr!4073 (_3!441 lt!244714)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7431 (readBytePure!0 lt!244581))))))

(assert (=> b!156393 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3214 (_3!441 lt!244714))))))

(declare-fun b!156394 () Bool)

(assert (=> b!156394 (= e!105658 (arrayRangesEq!425 (array!7168 (store (arr!4073 arr!153) from!240 (_2!7431 (readBytePure!0 bs!65))) (size!3214 arr!153)) (_3!441 lt!244714) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(assert (= (and d!52082 c!8331) b!156391))

(assert (= (and d!52082 (not c!8331)) b!156392))

(assert (= (or b!156391 b!156392) bm!2424))

(assert (= (or b!156391 b!156392) bm!2425))

(assert (= (or b!156391 b!156392) bm!2426))

(assert (= (and d!52082 res!130712) b!156390))

(assert (= (and b!156390 res!130711) b!156394))

(assert (= (and d!52082 (not res!130710)) b!156393))

(declare-fun m!243735 () Bool)

(assert (=> b!156391 m!243735))

(declare-fun m!243737 () Bool)

(assert (=> b!156391 m!243737))

(declare-fun m!243739 () Bool)

(assert (=> b!156391 m!243739))

(declare-fun m!243741 () Bool)

(assert (=> b!156391 m!243741))

(declare-fun m!243743 () Bool)

(assert (=> b!156391 m!243743))

(declare-fun m!243745 () Bool)

(assert (=> b!156391 m!243745))

(declare-fun m!243747 () Bool)

(assert (=> b!156391 m!243747))

(declare-fun m!243749 () Bool)

(assert (=> b!156391 m!243749))

(declare-fun m!243751 () Bool)

(assert (=> b!156391 m!243751))

(declare-fun m!243753 () Bool)

(assert (=> b!156391 m!243753))

(declare-fun m!243755 () Bool)

(assert (=> b!156391 m!243755))

(declare-fun m!243757 () Bool)

(assert (=> b!156391 m!243757))

(declare-fun m!243759 () Bool)

(assert (=> b!156391 m!243759))

(declare-fun m!243761 () Bool)

(assert (=> bm!2425 m!243761))

(declare-fun m!243763 () Bool)

(assert (=> d!52082 m!243763))

(assert (=> d!52082 m!243755))

(declare-fun m!243765 () Bool)

(assert (=> b!156394 m!243765))

(assert (=> bm!2424 m!243747))

(declare-fun m!243767 () Bool)

(assert (=> bm!2424 m!243767))

(declare-fun m!243769 () Bool)

(assert (=> b!156393 m!243769))

(declare-fun m!243771 () Bool)

(assert (=> b!156393 m!243771))

(declare-fun m!243773 () Bool)

(assert (=> b!156392 m!243773))

(declare-fun m!243775 () Bool)

(assert (=> b!156392 m!243775))

(declare-fun m!243777 () Bool)

(assert (=> bm!2426 m!243777))

(assert (=> d!52024 d!52082))

(declare-fun d!52086 () Bool)

(assert (=> d!52086 (= (remainingBits!0 ((_ sign_extend 32) (size!3214 (buf!3717 bs!65))) ((_ sign_extend 32) (currentByte!6832 bs!65)) ((_ sign_extend 32) (currentBit!6827 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3214 (buf!3717 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6832 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6827 bs!65)))))))

(assert (=> d!52036 d!52086))

(declare-fun d!52088 () Bool)

(assert (=> d!52088 (= (remainingBits!0 ((_ sign_extend 32) (size!3214 (buf!3717 lt!244581))) ((_ sign_extend 32) (currentByte!6832 lt!244581)) ((_ sign_extend 32) (currentBit!6827 lt!244581))) (bvsub (bvmul ((_ sign_extend 32) (size!3214 (buf!3717 lt!244581))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6832 lt!244581)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6827 lt!244581)))))))

(assert (=> d!52042 d!52088))

(declare-fun d!52090 () Bool)

(declare-fun e!105664 () Bool)

(assert (=> d!52090 e!105664))

(declare-fun res!130715 () Bool)

(assert (=> d!52090 (=> (not res!130715) (not e!105664))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5686 (_ BitVec 32)) Bool)

(assert (=> d!52090 (= res!130715 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10094 () Unit!10081)

(assert (=> d!52090 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!13993 Unit!10094 (BitStream!5687 (buf!3717 bs!65) (bvadd (currentByte!6832 bs!65) #b00000000000000000000000000000001) (currentBit!6827 bs!65))))))

(declare-fun b!156401 () Bool)

(assert (=> b!156401 (= e!105664 (and (or (not (= (bvand (currentByte!6832 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6832 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6832 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6832 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6832 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!52090 res!130715) b!156401))

(declare-fun m!243779 () Bool)

(assert (=> d!52090 m!243779))

(assert (=> d!52028 d!52090))

(declare-fun d!52092 () Bool)

(declare-fun lt!244929 () (_ BitVec 8))

(declare-fun lt!244930 () (_ BitVec 8))

(assert (=> d!52092 (= lt!244929 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4073 (buf!3717 bs!65)) (currentByte!6832 bs!65))) ((_ sign_extend 24) lt!244930))))))

(assert (=> d!52092 (= lt!244930 ((_ extract 7 0) (currentBit!6827 bs!65)))))

(declare-fun e!105685 () Bool)

(assert (=> d!52092 e!105685))

(declare-fun res!130740 () Bool)

(assert (=> d!52092 (=> (not res!130740) (not e!105685))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!52092 (= res!130740 (validate_offset_bits!1 ((_ sign_extend 32) (size!3214 (buf!3717 bs!65))) ((_ sign_extend 32) (currentByte!6832 bs!65)) ((_ sign_extend 32) (currentBit!6827 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14002 0))(
  ( (tuple2!14003 (_1!7445 Unit!10081) (_2!7445 (_ BitVec 8))) )
))
(declare-fun Unit!10099 () Unit!10081)

(declare-fun Unit!10100 () Unit!10081)

(assert (=> d!52092 (= (readByte!0 bs!65) (tuple2!13991 (_2!7445 (ite (bvsgt ((_ sign_extend 24) lt!244930) #b00000000000000000000000000000000) (tuple2!14003 Unit!10099 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!244929) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4073 (buf!3717 bs!65)) (bvadd (currentByte!6832 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!244930)))))))) (tuple2!14003 Unit!10100 lt!244929))) (BitStream!5687 (buf!3717 bs!65) (bvadd (currentByte!6832 bs!65) #b00000000000000000000000000000001) (currentBit!6827 bs!65))))))

(declare-fun b!156430 () Bool)

(declare-fun e!105686 () Bool)

(assert (=> b!156430 (= e!105685 e!105686)))

(declare-fun res!130739 () Bool)

(assert (=> b!156430 (=> (not res!130739) (not e!105686))))

(declare-fun lt!244924 () tuple2!13990)

(assert (=> b!156430 (= res!130739 (= (buf!3717 (_2!7437 lt!244924)) (buf!3717 bs!65)))))

(declare-fun lt!244928 () (_ BitVec 8))

(declare-fun lt!244927 () (_ BitVec 8))

(declare-fun Unit!10102 () Unit!10081)

(declare-fun Unit!10104 () Unit!10081)

(assert (=> b!156430 (= lt!244924 (tuple2!13991 (_2!7445 (ite (bvsgt ((_ sign_extend 24) lt!244928) #b00000000000000000000000000000000) (tuple2!14003 Unit!10102 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!244927) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4073 (buf!3717 bs!65)) (bvadd (currentByte!6832 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!244928)))))))) (tuple2!14003 Unit!10104 lt!244927))) (BitStream!5687 (buf!3717 bs!65) (bvadd (currentByte!6832 bs!65) #b00000000000000000000000000000001) (currentBit!6827 bs!65))))))

(assert (=> b!156430 (= lt!244927 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4073 (buf!3717 bs!65)) (currentByte!6832 bs!65))) ((_ sign_extend 24) lt!244928))))))

(assert (=> b!156430 (= lt!244928 ((_ extract 7 0) (currentBit!6827 bs!65)))))

(declare-fun lt!244925 () (_ BitVec 64))

(declare-fun b!156431 () Bool)

(declare-fun lt!244926 () (_ BitVec 64))

(assert (=> b!156431 (= e!105686 (= (bitIndex!0 (size!3214 (buf!3717 (_2!7437 lt!244924))) (currentByte!6832 (_2!7437 lt!244924)) (currentBit!6827 (_2!7437 lt!244924))) (bvadd lt!244926 lt!244925)))))

(assert (=> b!156431 (or (not (= (bvand lt!244926 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!244925 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!244926 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!244926 lt!244925) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!156431 (= lt!244925 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!156431 (= lt!244926 (bitIndex!0 (size!3214 (buf!3717 bs!65)) (currentByte!6832 bs!65) (currentBit!6827 bs!65)))))

(assert (= (and d!52092 res!130740) b!156430))

(assert (= (and b!156430 res!130739) b!156431))

(declare-fun m!243827 () Bool)

(assert (=> d!52092 m!243827))

(declare-fun m!243829 () Bool)

(assert (=> d!52092 m!243829))

(declare-fun m!243831 () Bool)

(assert (=> d!52092 m!243831))

(assert (=> b!156430 m!243831))

(assert (=> b!156430 m!243827))

(declare-fun m!243833 () Bool)

(assert (=> b!156431 m!243833))

(declare-fun m!243835 () Bool)

(assert (=> b!156431 m!243835))

(assert (=> d!52026 d!52092))

(declare-fun d!52100 () Bool)

(assert (=> d!52100 (= (invariant!0 (currentBit!6827 bs!65) (currentByte!6832 bs!65) (size!3214 (buf!3717 bs!65))) (and (bvsge (currentBit!6827 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6827 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6832 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6832 bs!65) (size!3214 (buf!3717 bs!65))) (and (= (currentBit!6827 bs!65) #b00000000000000000000000000000000) (= (currentByte!6832 bs!65) (size!3214 (buf!3717 bs!65)))))))))

(assert (=> d!52034 d!52100))

(declare-fun bm!2442 () Bool)

(declare-fun lt!244954 () array!7167)

(declare-fun lt!244949 () (_ BitVec 32))

(declare-fun lt!244964 () (_ BitVec 32))

(declare-fun c!8337 () Bool)

(declare-fun lt!244932 () tuple2!13990)

(declare-fun lt!244955 () array!7167)

(declare-fun call!2447 () Bool)

(assert (=> bm!2442 (= call!2447 (arrayRangesEq!425 (ite c!8337 arr!153 lt!244955) (ite c!8337 (array!7168 (store (arr!4073 arr!153) from!240 (_1!7437 lt!244932)) (size!3214 arr!153)) lt!244954) (ite c!8337 #b00000000000000000000000000000000 lt!244964) (ite c!8337 from!240 lt!244949)))))

(declare-fun b!156432 () Bool)

(declare-fun res!130743 () Bool)

(declare-fun e!105688 () Bool)

(assert (=> b!156432 (=> (not res!130743) (not e!105688))))

(declare-fun lt!244951 () tuple3!648)

(assert (=> b!156432 (= res!130743 (and (= (buf!3717 bs!65) (buf!3717 (_2!7436 lt!244951))) (= (size!3214 arr!153) (size!3214 (_3!441 lt!244951)))))))

(declare-fun bm!2443 () Bool)

(declare-fun lt!244933 () tuple3!648)

(declare-fun call!2445 () Bool)

(assert (=> bm!2443 (= call!2445 (arrayRangesEq!425 arr!153 (ite c!8337 (_3!441 lt!244933) arr!153) #b00000000000000000000000000000000 (ite c!8337 from!240 (size!3214 arr!153))))))

(declare-fun b!156433 () Bool)

(declare-fun e!105689 () tuple3!648)

(declare-fun lt!244952 () Unit!10081)

(assert (=> b!156433 (= e!105689 (tuple3!649 lt!244952 (_2!7436 lt!244933) (_3!441 lt!244933)))))

(assert (=> b!156433 (= lt!244932 (readByte!0 bs!65))))

(declare-fun lt!244961 () array!7167)

(assert (=> b!156433 (= lt!244961 (array!7168 (store (arr!4073 arr!153) from!240 (_1!7437 lt!244932)) (size!3214 arr!153)))))

(declare-fun lt!244936 () (_ BitVec 64))

(assert (=> b!156433 (= lt!244936 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!244948 () (_ BitVec 32))

(assert (=> b!156433 (= lt!244948 (bvsub to!236 from!240))))

(declare-fun lt!244943 () Unit!10081)

(assert (=> b!156433 (= lt!244943 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7437 lt!244932) lt!244936 lt!244948))))

(assert (=> b!156433 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3214 (buf!3717 (_2!7437 lt!244932)))) ((_ sign_extend 32) (currentByte!6832 (_2!7437 lt!244932))) ((_ sign_extend 32) (currentBit!6827 (_2!7437 lt!244932))) (bvsub lt!244948 ((_ extract 31 0) (bvsdiv (bvadd lt!244936 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!244962 () Unit!10081)

(assert (=> b!156433 (= lt!244962 lt!244943)))

(assert (=> b!156433 (= lt!244933 (readByteArrayLoop!0 (_2!7437 lt!244932) lt!244961 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(declare-fun call!2446 () (_ BitVec 64))

(assert (=> b!156433 (= call!2446 (bvadd (bitIndex!0 (size!3214 (buf!3717 bs!65)) (currentByte!6832 bs!65) (currentBit!6827 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!244963 () Unit!10081)

(declare-fun Unit!10106 () Unit!10081)

(assert (=> b!156433 (= lt!244963 Unit!10106)))

(assert (=> b!156433 (= (bvadd call!2446 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3214 (buf!3717 (_2!7436 lt!244933))) (currentByte!6832 (_2!7436 lt!244933)) (currentBit!6827 (_2!7436 lt!244933))))))

(declare-fun lt!244960 () Unit!10081)

(declare-fun Unit!10107 () Unit!10081)

(assert (=> b!156433 (= lt!244960 Unit!10107)))

(assert (=> b!156433 (= (bvadd (bitIndex!0 (size!3214 (buf!3717 bs!65)) (currentByte!6832 bs!65) (currentBit!6827 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3214 (buf!3717 (_2!7436 lt!244933))) (currentByte!6832 (_2!7436 lt!244933)) (currentBit!6827 (_2!7436 lt!244933))))))

(declare-fun lt!244934 () Unit!10081)

(declare-fun Unit!10108 () Unit!10081)

(assert (=> b!156433 (= lt!244934 Unit!10108)))

(assert (=> b!156433 (and (= (buf!3717 bs!65) (buf!3717 (_2!7436 lt!244933))) (= (size!3214 arr!153) (size!3214 (_3!441 lt!244933))))))

(declare-fun lt!244953 () Unit!10081)

(declare-fun Unit!10109 () Unit!10081)

(assert (=> b!156433 (= lt!244953 Unit!10109)))

(declare-fun lt!244941 () Unit!10081)

(assert (=> b!156433 (= lt!244941 (arrayUpdatedAtPrefixLemma!36 arr!153 from!240 (_1!7437 lt!244932)))))

(assert (=> b!156433 call!2447))

(declare-fun lt!244939 () Unit!10081)

(assert (=> b!156433 (= lt!244939 lt!244941)))

(declare-fun lt!244959 () (_ BitVec 32))

(assert (=> b!156433 (= lt!244959 #b00000000000000000000000000000000)))

(declare-fun lt!244946 () Unit!10081)

(assert (=> b!156433 (= lt!244946 (arrayRangesEqTransitive!101 arr!153 lt!244961 (_3!441 lt!244933) lt!244959 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156433 (arrayRangesEq!425 arr!153 (_3!441 lt!244933) lt!244959 from!240)))

(declare-fun lt!244947 () Unit!10081)

(assert (=> b!156433 (= lt!244947 lt!244946)))

(assert (=> b!156433 call!2445))

(declare-fun lt!244944 () Unit!10081)

(declare-fun Unit!10110 () Unit!10081)

(assert (=> b!156433 (= lt!244944 Unit!10110)))

(declare-fun lt!244966 () Unit!10081)

(assert (=> b!156433 (= lt!244966 (arrayRangesEqImpliesEq!45 lt!244961 (_3!441 lt!244933) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156433 (= (select (store (arr!4073 arr!153) from!240 (_1!7437 lt!244932)) from!240) (select (arr!4073 (_3!441 lt!244933)) from!240))))

(declare-fun lt!244938 () Unit!10081)

(assert (=> b!156433 (= lt!244938 lt!244966)))

(declare-fun lt!244935 () Bool)

(assert (=> b!156433 (= lt!244935 (= (select (arr!4073 (_3!441 lt!244933)) from!240) (_1!7437 lt!244932)))))

(declare-fun Unit!10111 () Unit!10081)

(assert (=> b!156433 (= lt!244952 Unit!10111)))

(assert (=> b!156433 lt!244935))

(declare-fun d!52102 () Bool)

(declare-fun e!105687 () Bool)

(assert (=> d!52102 e!105687))

(declare-fun res!130742 () Bool)

(assert (=> d!52102 (=> res!130742 e!105687)))

(assert (=> d!52102 (= res!130742 (bvsge from!240 to!236))))

(declare-fun lt!244931 () Bool)

(assert (=> d!52102 (= lt!244931 e!105688)))

(declare-fun res!130744 () Bool)

(assert (=> d!52102 (=> (not res!130744) (not e!105688))))

(declare-fun lt!244965 () (_ BitVec 64))

(declare-fun lt!244942 () (_ BitVec 64))

(assert (=> d!52102 (= res!130744 (= (bvadd lt!244965 lt!244942) (bitIndex!0 (size!3214 (buf!3717 (_2!7436 lt!244951))) (currentByte!6832 (_2!7436 lt!244951)) (currentBit!6827 (_2!7436 lt!244951)))))))

(assert (=> d!52102 (or (not (= (bvand lt!244965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!244942 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!244965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!244965 lt!244942) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!244956 () (_ BitVec 64))

(assert (=> d!52102 (= lt!244942 (bvmul lt!244956 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52102 (or (= lt!244956 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!244956 #b0000000000000000000000000000000000000000000000000000000000001000) lt!244956)))))

(assert (=> d!52102 (= lt!244956 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!52102 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!52102 (= lt!244965 (bitIndex!0 (size!3214 (buf!3717 bs!65)) (currentByte!6832 bs!65) (currentBit!6827 bs!65)))))

(assert (=> d!52102 (= lt!244951 e!105689)))

(assert (=> d!52102 (= c!8337 (bvslt from!240 to!236))))

(assert (=> d!52102 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3214 arr!153)))))

(assert (=> d!52102 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!244951)))

(declare-fun bm!2444 () Bool)

(assert (=> bm!2444 (= call!2446 (bitIndex!0 (ite c!8337 (size!3214 (buf!3717 (_2!7437 lt!244932))) (size!3214 (buf!3717 bs!65))) (ite c!8337 (currentByte!6832 (_2!7437 lt!244932)) (currentByte!6832 bs!65)) (ite c!8337 (currentBit!6827 (_2!7437 lt!244932)) (currentBit!6827 bs!65))))))

(declare-fun lt!244957 () Unit!10081)

(declare-fun b!156434 () Bool)

(assert (=> b!156434 (= e!105689 (tuple3!649 lt!244957 bs!65 arr!153))))

(assert (=> b!156434 (= call!2446 call!2446)))

(declare-fun lt!244940 () Unit!10081)

(declare-fun Unit!10114 () Unit!10081)

(assert (=> b!156434 (= lt!244940 Unit!10114)))

(declare-fun lt!244958 () Unit!10081)

(assert (=> b!156434 (= lt!244958 (arrayRangesEqReflexiveLemma!36 arr!153))))

(assert (=> b!156434 call!2445))

(declare-fun lt!244950 () Unit!10081)

(assert (=> b!156434 (= lt!244950 lt!244958)))

(assert (=> b!156434 (= lt!244955 arr!153)))

(assert (=> b!156434 (= lt!244954 arr!153)))

(declare-fun lt!244945 () (_ BitVec 32))

(assert (=> b!156434 (= lt!244945 #b00000000000000000000000000000000)))

(declare-fun lt!244937 () (_ BitVec 32))

(assert (=> b!156434 (= lt!244937 (size!3214 arr!153))))

(assert (=> b!156434 (= lt!244964 #b00000000000000000000000000000000)))

(assert (=> b!156434 (= lt!244949 from!240)))

(assert (=> b!156434 (= lt!244957 (arrayRangesEqSlicedLemma!36 lt!244955 lt!244954 lt!244945 lt!244937 lt!244964 lt!244949))))

(assert (=> b!156434 call!2447))

(declare-fun b!156435 () Bool)

(assert (=> b!156435 (= e!105687 (= (select (arr!4073 (_3!441 lt!244951)) from!240) (_2!7431 (readBytePure!0 bs!65))))))

(assert (=> b!156435 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3214 (_3!441 lt!244951))))))

(declare-fun b!156436 () Bool)

(assert (=> b!156436 (= e!105688 (arrayRangesEq!425 arr!153 (_3!441 lt!244951) #b00000000000000000000000000000000 from!240))))

(assert (= (and d!52102 c!8337) b!156433))

(assert (= (and d!52102 (not c!8337)) b!156434))

(assert (= (or b!156433 b!156434) bm!2442))

(assert (= (or b!156433 b!156434) bm!2443))

(assert (= (or b!156433 b!156434) bm!2444))

(assert (= (and d!52102 res!130744) b!156432))

(assert (= (and b!156432 res!130743) b!156436))

(assert (= (and d!52102 (not res!130742)) b!156435))

(declare-fun m!243837 () Bool)

(assert (=> b!156433 m!243837))

(declare-fun m!243839 () Bool)

(assert (=> b!156433 m!243839))

(declare-fun m!243841 () Bool)

(assert (=> b!156433 m!243841))

(declare-fun m!243843 () Bool)

(assert (=> b!156433 m!243843))

(declare-fun m!243845 () Bool)

(assert (=> b!156433 m!243845))

(declare-fun m!243847 () Bool)

(assert (=> b!156433 m!243847))

(declare-fun m!243849 () Bool)

(assert (=> b!156433 m!243849))

(declare-fun m!243851 () Bool)

(assert (=> b!156433 m!243851))

(assert (=> b!156433 m!243695))

(declare-fun m!243853 () Bool)

(assert (=> b!156433 m!243853))

(assert (=> b!156433 m!243835))

(declare-fun m!243855 () Bool)

(assert (=> b!156433 m!243855))

(declare-fun m!243857 () Bool)

(assert (=> b!156433 m!243857))

(declare-fun m!243859 () Bool)

(assert (=> bm!2443 m!243859))

(declare-fun m!243861 () Bool)

(assert (=> d!52102 m!243861))

(assert (=> d!52102 m!243835))

(declare-fun m!243863 () Bool)

(assert (=> b!156436 m!243863))

(assert (=> bm!2442 m!243849))

(declare-fun m!243865 () Bool)

(assert (=> bm!2442 m!243865))

(declare-fun m!243867 () Bool)

(assert (=> b!156435 m!243867))

(assert (=> b!156435 m!243633))

(declare-fun m!243869 () Bool)

(assert (=> b!156434 m!243869))

(declare-fun m!243871 () Bool)

(assert (=> b!156434 m!243871))

(declare-fun m!243873 () Bool)

(assert (=> bm!2444 m!243873))

(assert (=> d!52030 d!52102))

(push 1)

(assert (not b!156434))

(assert (not b!156391))

(assert (not bm!2442))

(assert (not bm!2443))

(assert (not d!52102))

(assert (not bm!2426))

(assert (not b!156431))

(assert (not b!156433))

(assert (not b!156393))

(assert (not bm!2424))

(assert (not bm!2444))

(assert (not b!156435))

(assert (not b!156392))

(assert (not b!156436))

(assert (not d!52082))

(assert (not d!52092))

(assert (not b!156394))

(assert (not bm!2425))

(assert (not d!52090))

(check-sat)

(pop 1)

(push 1)

(check-sat)

