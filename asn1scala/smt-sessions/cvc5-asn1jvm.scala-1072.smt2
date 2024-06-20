; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30892 () Bool)

(assert start!30892)

(declare-fun b!156319 () Bool)

(declare-fun e!105575 () Bool)

(declare-datatypes ((array!7158 0))(
  ( (array!7159 (arr!4067 (Array (_ BitVec 32) (_ BitVec 8))) (size!3211 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5680 0))(
  ( (BitStream!5681 (buf!3714 array!7158) (currentByte!6823 (_ BitVec 32)) (currentBit!6818 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5680)

(declare-fun array_inv!3000 (array!7158) Bool)

(assert (=> b!156319 (= e!105575 (array_inv!3000 (buf!3714 bs!65)))))

(declare-fun res!130657 () Bool)

(declare-fun e!105574 () Bool)

(assert (=> start!30892 (=> (not res!130657) (not e!105574))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7158)

(assert (=> start!30892 (= res!130657 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3211 arr!153))))))

(assert (=> start!30892 e!105574))

(assert (=> start!30892 true))

(assert (=> start!30892 (array_inv!3000 arr!153)))

(declare-fun inv!12 (BitStream!5680) Bool)

(assert (=> start!30892 (and (inv!12 bs!65) e!105575)))

(declare-fun b!156316 () Bool)

(declare-fun res!130656 () Bool)

(assert (=> b!156316 (=> (not res!130656) (not e!105574))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156316 (= res!130656 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3211 (buf!3714 bs!65))) ((_ sign_extend 32) (currentByte!6823 bs!65)) ((_ sign_extend 32) (currentBit!6818 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156317 () Bool)

(declare-fun e!105573 () Bool)

(assert (=> b!156317 (= e!105574 e!105573)))

(declare-fun res!130658 () Bool)

(assert (=> b!156317 (=> (not res!130658) (not e!105573))))

(assert (=> b!156317 (= res!130658 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!13954 0))(
  ( (tuple2!13955 (_1!7415 BitStream!5680) (_2!7415 array!7158)) )
))
(declare-fun lt!244539 () tuple2!13954)

(declare-fun readByteArrayLoopPure!0 (BitStream!5680 array!7158 (_ BitVec 32) (_ BitVec 32)) tuple2!13954)

(declare-fun withMovedByteIndex!0 (BitStream!5680 (_ BitVec 32)) BitStream!5680)

(declare-datatypes ((tuple2!13956 0))(
  ( (tuple2!13957 (_1!7416 BitStream!5680) (_2!7416 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5680) tuple2!13956)

(assert (=> b!156317 (= lt!244539 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7159 (store (arr!4067 arr!153) from!240 (_2!7416 (readBytePure!0 bs!65))) (size!3211 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!244540 () tuple2!13954)

(assert (=> b!156317 (= lt!244540 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156318 () Bool)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!156318 (= e!105573 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!3211 (buf!3714 bs!65))) ((_ sign_extend 32) (currentByte!6823 bs!65)) ((_ sign_extend 32) (currentBit!6818 bs!65)))))))

(assert (= (and start!30892 res!130657) b!156316))

(assert (= (and b!156316 res!130656) b!156317))

(assert (= (and b!156317 res!130658) b!156318))

(assert (= start!30892 b!156319))

(declare-fun m!243537 () Bool)

(assert (=> b!156318 m!243537))

(declare-fun m!243539 () Bool)

(assert (=> b!156316 m!243539))

(declare-fun m!243541 () Bool)

(assert (=> b!156319 m!243541))

(declare-fun m!243543 () Bool)

(assert (=> b!156317 m!243543))

(declare-fun m!243545 () Bool)

(assert (=> b!156317 m!243545))

(assert (=> b!156317 m!243545))

(declare-fun m!243547 () Bool)

(assert (=> b!156317 m!243547))

(declare-fun m!243549 () Bool)

(assert (=> b!156317 m!243549))

(declare-fun m!243551 () Bool)

(assert (=> b!156317 m!243551))

(declare-fun m!243553 () Bool)

(assert (=> start!30892 m!243553))

(declare-fun m!243555 () Bool)

(assert (=> start!30892 m!243555))

(push 1)

(assert (not start!30892))

(assert (not b!156318))

(assert (not b!156319))

(assert (not b!156316))

(assert (not b!156317))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51968 () Bool)

(assert (=> d!51968 (= (array_inv!3000 arr!153) (bvsge (size!3211 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30892 d!51968))

(declare-fun d!51970 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51970 (= (inv!12 bs!65) (invariant!0 (currentBit!6818 bs!65) (currentByte!6823 bs!65) (size!3211 (buf!3714 bs!65))))))

(declare-fun bs!12717 () Bool)

(assert (= bs!12717 d!51970))

(declare-fun m!243597 () Bool)

(assert (=> bs!12717 m!243597))

(assert (=> start!30892 d!51970))

(declare-fun d!51972 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51972 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3211 (buf!3714 bs!65))) ((_ sign_extend 32) (currentByte!6823 bs!65)) ((_ sign_extend 32) (currentBit!6818 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3211 (buf!3714 bs!65))) ((_ sign_extend 32) (currentByte!6823 bs!65)) ((_ sign_extend 32) (currentBit!6818 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12718 () Bool)

(assert (= bs!12718 d!51972))

(declare-fun m!243599 () Bool)

(assert (=> bs!12718 m!243599))

(assert (=> b!156316 d!51972))

(declare-fun d!51974 () Bool)

(declare-datatypes ((Unit!10075 0))(
  ( (Unit!10076) )
))
(declare-datatypes ((tuple3!642 0))(
  ( (tuple3!643 (_1!7421 Unit!10075) (_2!7421 BitStream!5680) (_3!438 array!7158)) )
))
(declare-fun lt!244555 () tuple3!642)

(declare-fun readByteArrayLoop!0 (BitStream!5680 array!7158 (_ BitVec 32) (_ BitVec 32)) tuple3!642)

(assert (=> d!51974 (= lt!244555 (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7159 (store (arr!4067 arr!153) from!240 (_2!7416 (readBytePure!0 bs!65))) (size!3211 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!51974 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7159 (store (arr!4067 arr!153) from!240 (_2!7416 (readBytePure!0 bs!65))) (size!3211 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!13955 (_2!7421 lt!244555) (_3!438 lt!244555)))))

(declare-fun bs!12719 () Bool)

(assert (= bs!12719 d!51974))

(assert (=> bs!12719 m!243545))

(declare-fun m!243601 () Bool)

(assert (=> bs!12719 m!243601))

(assert (=> b!156317 d!51974))

(declare-fun d!51980 () Bool)

(declare-datatypes ((tuple2!13966 0))(
  ( (tuple2!13967 (_1!7422 Unit!10075) (_2!7422 BitStream!5680)) )
))
(declare-fun moveByteIndex!0 (BitStream!5680 (_ BitVec 32)) tuple2!13966)

(assert (=> d!51980 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7422 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12721 () Bool)

(assert (= bs!12721 d!51980))

(declare-fun m!243605 () Bool)

(assert (=> bs!12721 m!243605))

(assert (=> b!156317 d!51980))

(declare-fun d!51986 () Bool)

(declare-datatypes ((tuple2!13968 0))(
  ( (tuple2!13969 (_1!7423 (_ BitVec 8)) (_2!7423 BitStream!5680)) )
))
(declare-fun lt!244558 () tuple2!13968)

(declare-fun readByte!0 (BitStream!5680) tuple2!13968)

(assert (=> d!51986 (= lt!244558 (readByte!0 bs!65))))

(assert (=> d!51986 (= (readBytePure!0 bs!65) (tuple2!13957 (_2!7423 lt!244558) (_1!7423 lt!244558)))))

(declare-fun bs!12723 () Bool)

(assert (= bs!12723 d!51986))

(declare-fun m!243609 () Bool)

(assert (=> bs!12723 m!243609))

(assert (=> b!156317 d!51986))

(declare-fun lt!244559 () tuple3!642)

(declare-fun d!51990 () Bool)

(assert (=> d!51990 (= lt!244559 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!51990 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13955 (_2!7421 lt!244559) (_3!438 lt!244559)))))

(declare-fun bs!12724 () Bool)

(assert (= bs!12724 d!51990))

(declare-fun m!243611 () Bool)

(assert (=> bs!12724 m!243611))

(assert (=> b!156317 d!51990))

(declare-fun d!51992 () Bool)

(assert (=> d!51992 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3211 (buf!3714 bs!65))) ((_ sign_extend 32) (currentByte!6823 bs!65)) ((_ sign_extend 32) (currentBit!6818 bs!65))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3211 (buf!3714 bs!65))) ((_ sign_extend 32) (currentByte!6823 bs!65)) ((_ sign_extend 32) (currentBit!6818 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!12725 () Bool)

(assert (= bs!12725 d!51992))

(assert (=> bs!12725 m!243599))

(assert (=> b!156318 d!51992))

(declare-fun d!51994 () Bool)

(assert (=> d!51994 (= (array_inv!3000 (buf!3714 bs!65)) (bvsge (size!3211 (buf!3714 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!156319 d!51994))

(push 1)

(assert (not d!51972))

(assert (not d!51970))

(assert (not d!51986))

(assert (not d!51990))

(assert (not d!51980))

(assert (not d!51974))

(assert (not d!51992))

(check-sat)

(pop 1)

(push 1)

(check-sat)

