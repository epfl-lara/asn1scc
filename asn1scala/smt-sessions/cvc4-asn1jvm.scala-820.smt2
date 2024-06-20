; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24186 () Bool)

(assert start!24186)

(declare-fun b!122826 () Bool)

(declare-fun e!80532 () Bool)

(declare-fun e!80538 () Bool)

(assert (=> b!122826 (= e!80532 (not e!80538))))

(declare-fun res!101824 () Bool)

(assert (=> b!122826 (=> res!101824 e!80538)))

(declare-datatypes ((array!5436 0))(
  ( (array!5437 (arr!3053 (Array (_ BitVec 32) (_ BitVec 8))) (size!2460 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4394 0))(
  ( (BitStream!4395 (buf!2900 array!5436) (currentByte!5597 (_ BitVec 32)) (currentBit!5592 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10400 0))(
  ( (tuple2!10401 (_1!5465 BitStream!4394) (_2!5465 (_ BitVec 64))) )
))
(declare-fun lt!193398 () tuple2!10400)

(declare-datatypes ((tuple2!10402 0))(
  ( (tuple2!10403 (_1!5466 BitStream!4394) (_2!5466 BitStream!4394)) )
))
(declare-fun lt!193391 () tuple2!10402)

(assert (=> b!122826 (= res!101824 (not (= (_1!5465 lt!193398) (_2!5466 lt!193391))))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun lt!193383 () (_ BitVec 64))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10400)

(assert (=> b!122826 (= lt!193398 (readNLeastSignificantBitsLoopPure!0 (_1!5466 lt!193391) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193383))))

(declare-datatypes ((Unit!7559 0))(
  ( (Unit!7560) )
))
(declare-datatypes ((tuple2!10404 0))(
  ( (tuple2!10405 (_1!5467 Unit!7559) (_2!5467 BitStream!4394)) )
))
(declare-fun lt!193395 () tuple2!10404)

(declare-fun lt!193401 () tuple2!10404)

(declare-fun lt!193382 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!122826 (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193395)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401))) lt!193382)))

(declare-fun lt!193386 () Unit!7559)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4394 array!5436 (_ BitVec 64)) Unit!7559)

(assert (=> b!122826 (= lt!193386 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5467 lt!193401) (buf!2900 (_2!5467 lt!193395)) lt!193382))))

(assert (=> b!122826 (= lt!193382 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!193388 () (_ BitVec 64))

(declare-datatypes ((tuple2!10406 0))(
  ( (tuple2!10407 (_1!5468 BitStream!4394) (_2!5468 Bool)) )
))
(declare-fun lt!193384 () tuple2!10406)

(declare-fun lt!193400 () (_ BitVec 64))

(assert (=> b!122826 (= lt!193383 (bvor lt!193388 (ite (_2!5468 lt!193384) lt!193400 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!193392 () tuple2!10400)

(declare-fun lt!193409 () tuple2!10402)

(assert (=> b!122826 (= lt!193392 (readNLeastSignificantBitsLoopPure!0 (_1!5466 lt!193409) nBits!396 i!615 lt!193388))))

(declare-fun thiss!1305 () BitStream!4394)

(declare-fun lt!193394 () (_ BitVec 64))

(assert (=> b!122826 (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193395)))) ((_ sign_extend 32) (currentByte!5597 thiss!1305)) ((_ sign_extend 32) (currentBit!5592 thiss!1305)) lt!193394)))

(declare-fun lt!193399 () Unit!7559)

(assert (=> b!122826 (= lt!193399 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2900 (_2!5467 lt!193395)) lt!193394))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122826 (= lt!193388 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!193397 () Bool)

(assert (=> b!122826 (= (_2!5468 lt!193384) lt!193397)))

(declare-fun readBitPure!0 (BitStream!4394) tuple2!10406)

(assert (=> b!122826 (= lt!193384 (readBitPure!0 (_1!5466 lt!193409)))))

(declare-fun reader!0 (BitStream!4394 BitStream!4394) tuple2!10402)

(assert (=> b!122826 (= lt!193391 (reader!0 (_2!5467 lt!193401) (_2!5467 lt!193395)))))

(assert (=> b!122826 (= lt!193409 (reader!0 thiss!1305 (_2!5467 lt!193395)))))

(declare-fun e!80535 () Bool)

(assert (=> b!122826 e!80535))

(declare-fun res!101825 () Bool)

(assert (=> b!122826 (=> (not res!101825) (not e!80535))))

(declare-fun lt!193390 () tuple2!10406)

(declare-fun lt!193385 () tuple2!10406)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122826 (= res!101825 (= (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!193390))) (currentByte!5597 (_1!5468 lt!193390)) (currentBit!5592 (_1!5468 lt!193390))) (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!193385))) (currentByte!5597 (_1!5468 lt!193385)) (currentBit!5592 (_1!5468 lt!193385)))))))

(declare-fun lt!193408 () Unit!7559)

(declare-fun lt!193404 () BitStream!4394)

(declare-fun readBitPrefixLemma!0 (BitStream!4394 BitStream!4394) Unit!7559)

(assert (=> b!122826 (= lt!193408 (readBitPrefixLemma!0 lt!193404 (_2!5467 lt!193395)))))

(assert (=> b!122826 (= lt!193385 (readBitPure!0 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))))))

(assert (=> b!122826 (= lt!193390 (readBitPure!0 lt!193404))))

(assert (=> b!122826 (= lt!193404 (BitStream!4395 (buf!2900 (_2!5467 lt!193401)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))))

(declare-fun e!80529 () Bool)

(assert (=> b!122826 e!80529))

(declare-fun res!101827 () Bool)

(assert (=> b!122826 (=> (not res!101827) (not e!80529))))

(declare-fun isPrefixOf!0 (BitStream!4394 BitStream!4394) Bool)

(assert (=> b!122826 (= res!101827 (isPrefixOf!0 thiss!1305 (_2!5467 lt!193395)))))

(declare-fun lt!193387 () Unit!7559)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4394 BitStream!4394 BitStream!4394) Unit!7559)

(assert (=> b!122826 (= lt!193387 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5467 lt!193401) (_2!5467 lt!193395)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4394 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10404)

(assert (=> b!122826 (= lt!193395 (appendNLeastSignificantBitsLoop!0 (_2!5467 lt!193401) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!80533 () Bool)

(assert (=> b!122826 e!80533))

(declare-fun res!101828 () Bool)

(assert (=> b!122826 (=> (not res!101828) (not e!80533))))

(assert (=> b!122826 (= res!101828 (= (size!2460 (buf!2900 thiss!1305)) (size!2460 (buf!2900 (_2!5467 lt!193401)))))))

(declare-fun appendBit!0 (BitStream!4394 Bool) tuple2!10404)

(assert (=> b!122826 (= lt!193401 (appendBit!0 thiss!1305 lt!193397))))

(assert (=> b!122826 (= lt!193397 (not (= (bvand v!199 lt!193400) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122826 (= lt!193400 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!122827 () Bool)

(declare-fun e!80536 () Bool)

(declare-fun array_inv!2262 (array!5436) Bool)

(assert (=> b!122827 (= e!80536 (array_inv!2262 (buf!2900 thiss!1305)))))

(declare-fun b!122828 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!122828 (= e!80529 (invariant!0 (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305) (size!2460 (buf!2900 (_2!5467 lt!193395)))))))

(declare-fun b!122829 () Bool)

(declare-fun e!80537 () Bool)

(declare-fun lt!193393 () tuple2!10406)

(declare-fun lt!193402 () (_ BitVec 64))

(assert (=> b!122829 (= e!80537 (= (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!193393))) (currentByte!5597 (_1!5468 lt!193393)) (currentBit!5592 (_1!5468 lt!193393))) lt!193402))))

(declare-fun b!122830 () Bool)

(assert (=> b!122830 (= e!80535 (= (_2!5468 lt!193390) (_2!5468 lt!193385)))))

(declare-fun res!101820 () Bool)

(declare-fun e!80528 () Bool)

(assert (=> start!24186 (=> (not res!101820) (not e!80528))))

(assert (=> start!24186 (= res!101820 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24186 e!80528))

(assert (=> start!24186 true))

(declare-fun inv!12 (BitStream!4394) Bool)

(assert (=> start!24186 (and (inv!12 thiss!1305) e!80536)))

(declare-fun b!122831 () Bool)

(declare-fun res!101829 () Bool)

(assert (=> b!122831 (=> (not res!101829) (not e!80529))))

(assert (=> b!122831 (= res!101829 (invariant!0 (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305) (size!2460 (buf!2900 (_2!5467 lt!193401)))))))

(declare-fun b!122832 () Bool)

(declare-fun e!80531 () Bool)

(assert (=> b!122832 (= e!80533 e!80531)))

(declare-fun res!101822 () Bool)

(assert (=> b!122832 (=> (not res!101822) (not e!80531))))

(declare-fun lt!193389 () (_ BitVec 64))

(assert (=> b!122832 (= res!101822 (= lt!193402 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!193389)))))

(assert (=> b!122832 (= lt!193402 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))))))

(assert (=> b!122832 (= lt!193389 (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))))

(declare-fun b!122833 () Bool)

(declare-fun res!101831 () Bool)

(assert (=> b!122833 (=> (not res!101831) (not e!80532))))

(assert (=> b!122833 (= res!101831 (bvslt i!615 nBits!396))))

(declare-fun b!122834 () Bool)

(assert (=> b!122834 (= e!80531 e!80537)))

(declare-fun res!101821 () Bool)

(assert (=> b!122834 (=> (not res!101821) (not e!80537))))

(assert (=> b!122834 (= res!101821 (and (= (_2!5468 lt!193393) lt!193397) (= (_1!5468 lt!193393) (_2!5467 lt!193401))))))

(declare-fun readerFrom!0 (BitStream!4394 (_ BitVec 32) (_ BitVec 32)) BitStream!4394)

(assert (=> b!122834 (= lt!193393 (readBitPure!0 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305))))))

(declare-fun e!80530 () Bool)

(declare-fun lt!193405 () BitStream!4394)

(declare-fun lt!193407 () (_ BitVec 64))

(declare-fun lt!193396 () (_ BitVec 64))

(declare-fun b!122835 () Bool)

(assert (=> b!122835 (= e!80530 (and (= lt!193407 (bvsub lt!193396 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5466 lt!193391) lt!193405)) (and (= (_2!5465 lt!193392) (_2!5465 lt!193398)) (= (_1!5465 lt!193392) (_2!5466 lt!193409))))))))

(declare-fun b!122836 () Bool)

(assert (=> b!122836 (= e!80528 e!80532)))

(declare-fun res!101832 () Bool)

(assert (=> b!122836 (=> (not res!101832) (not e!80532))))

(assert (=> b!122836 (= res!101832 (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 thiss!1305))) ((_ sign_extend 32) (currentByte!5597 thiss!1305)) ((_ sign_extend 32) (currentBit!5592 thiss!1305)) lt!193394))))

(assert (=> b!122836 (= lt!193394 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun lt!193410 () (_ BitVec 64))

(declare-fun b!122837 () Bool)

(assert (=> b!122837 (= e!80538 (or (not (= (_1!5466 lt!193391) lt!193405)) (and (= (size!2460 (buf!2900 thiss!1305)) (size!2460 (buf!2900 (_2!5467 lt!193395)))) (= lt!193410 (bvadd lt!193407 lt!193394)) (= (_2!5465 lt!193392) v!199))))))

(assert (=> b!122837 e!80530))

(declare-fun res!101826 () Bool)

(assert (=> b!122837 (=> (not res!101826) (not e!80530))))

(declare-fun withMovedBitIndex!0 (BitStream!4394 (_ BitVec 64)) BitStream!4394)

(assert (=> b!122837 (= res!101826 (= (_1!5466 lt!193391) (withMovedBitIndex!0 (_2!5466 lt!193391) (bvsub lt!193396 lt!193410))))))

(assert (=> b!122837 (= lt!193396 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))))))

(assert (=> b!122837 (= (_1!5466 lt!193409) (withMovedBitIndex!0 (_2!5466 lt!193409) (bvsub lt!193407 lt!193410)))))

(assert (=> b!122837 (= lt!193410 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193395))) (currentByte!5597 (_2!5467 lt!193395)) (currentBit!5592 (_2!5467 lt!193395))))))

(assert (=> b!122837 (= lt!193407 (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))))

(declare-fun lt!193403 () tuple2!10400)

(assert (=> b!122837 (and (= (_2!5465 lt!193392) (_2!5465 lt!193403)) (= (_1!5465 lt!193392) (_1!5465 lt!193403)))))

(declare-fun lt!193406 () Unit!7559)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7559)

(assert (=> b!122837 (= lt!193406 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5466 lt!193409) nBits!396 i!615 lt!193388))))

(assert (=> b!122837 (= lt!193403 (readNLeastSignificantBitsLoopPure!0 lt!193405 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193383))))

(assert (=> b!122837 (= lt!193405 (withMovedBitIndex!0 (_1!5466 lt!193409) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!122838 () Bool)

(declare-fun res!101823 () Bool)

(assert (=> b!122838 (=> (not res!101823) (not e!80531))))

(assert (=> b!122838 (= res!101823 (isPrefixOf!0 thiss!1305 (_2!5467 lt!193401)))))

(declare-fun b!122839 () Bool)

(declare-fun res!101830 () Bool)

(assert (=> b!122839 (=> (not res!101830) (not e!80532))))

(assert (=> b!122839 (= res!101830 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!24186 res!101820) b!122836))

(assert (= (and b!122836 res!101832) b!122839))

(assert (= (and b!122839 res!101830) b!122833))

(assert (= (and b!122833 res!101831) b!122826))

(assert (= (and b!122826 res!101828) b!122832))

(assert (= (and b!122832 res!101822) b!122838))

(assert (= (and b!122838 res!101823) b!122834))

(assert (= (and b!122834 res!101821) b!122829))

(assert (= (and b!122826 res!101827) b!122831))

(assert (= (and b!122831 res!101829) b!122828))

(assert (= (and b!122826 res!101825) b!122830))

(assert (= (and b!122826 (not res!101824)) b!122837))

(assert (= (and b!122837 res!101826) b!122835))

(assert (= start!24186 b!122827))

(declare-fun m!186639 () Bool)

(assert (=> b!122839 m!186639))

(declare-fun m!186641 () Bool)

(assert (=> b!122832 m!186641))

(declare-fun m!186643 () Bool)

(assert (=> b!122832 m!186643))

(declare-fun m!186645 () Bool)

(assert (=> b!122829 m!186645))

(declare-fun m!186647 () Bool)

(assert (=> b!122838 m!186647))

(declare-fun m!186649 () Bool)

(assert (=> b!122828 m!186649))

(declare-fun m!186651 () Bool)

(assert (=> b!122826 m!186651))

(declare-fun m!186653 () Bool)

(assert (=> b!122826 m!186653))

(declare-fun m!186655 () Bool)

(assert (=> b!122826 m!186655))

(declare-fun m!186657 () Bool)

(assert (=> b!122826 m!186657))

(declare-fun m!186659 () Bool)

(assert (=> b!122826 m!186659))

(declare-fun m!186661 () Bool)

(assert (=> b!122826 m!186661))

(declare-fun m!186663 () Bool)

(assert (=> b!122826 m!186663))

(declare-fun m!186665 () Bool)

(assert (=> b!122826 m!186665))

(declare-fun m!186667 () Bool)

(assert (=> b!122826 m!186667))

(declare-fun m!186669 () Bool)

(assert (=> b!122826 m!186669))

(declare-fun m!186671 () Bool)

(assert (=> b!122826 m!186671))

(declare-fun m!186673 () Bool)

(assert (=> b!122826 m!186673))

(declare-fun m!186675 () Bool)

(assert (=> b!122826 m!186675))

(declare-fun m!186677 () Bool)

(assert (=> b!122826 m!186677))

(declare-fun m!186679 () Bool)

(assert (=> b!122826 m!186679))

(declare-fun m!186681 () Bool)

(assert (=> b!122826 m!186681))

(declare-fun m!186683 () Bool)

(assert (=> b!122826 m!186683))

(declare-fun m!186685 () Bool)

(assert (=> b!122826 m!186685))

(declare-fun m!186687 () Bool)

(assert (=> b!122826 m!186687))

(declare-fun m!186689 () Bool)

(assert (=> b!122831 m!186689))

(declare-fun m!186691 () Bool)

(assert (=> b!122827 m!186691))

(declare-fun m!186693 () Bool)

(assert (=> b!122834 m!186693))

(assert (=> b!122834 m!186693))

(declare-fun m!186695 () Bool)

(assert (=> b!122834 m!186695))

(declare-fun m!186697 () Bool)

(assert (=> b!122836 m!186697))

(declare-fun m!186699 () Bool)

(assert (=> b!122837 m!186699))

(declare-fun m!186701 () Bool)

(assert (=> b!122837 m!186701))

(declare-fun m!186703 () Bool)

(assert (=> b!122837 m!186703))

(assert (=> b!122837 m!186643))

(declare-fun m!186705 () Bool)

(assert (=> b!122837 m!186705))

(declare-fun m!186707 () Bool)

(assert (=> b!122837 m!186707))

(declare-fun m!186709 () Bool)

(assert (=> b!122837 m!186709))

(assert (=> b!122837 m!186641))

(declare-fun m!186711 () Bool)

(assert (=> start!24186 m!186711))

(push 1)

(assert (not b!122836))

(assert (not b!122839))

(assert (not b!122838))

(assert (not b!122837))

(assert (not start!24186))

(assert (not b!122826))

(assert (not b!122828))

(assert (not b!122831))

(assert (not b!122829))

(assert (not b!122832))

(assert (not b!122827))

(assert (not b!122834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!39494 () Bool)

(assert (=> d!39494 (= (invariant!0 (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305) (size!2460 (buf!2900 (_2!5467 lt!193395)))) (and (bvsge (currentBit!5592 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5592 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5597 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5597 thiss!1305) (size!2460 (buf!2900 (_2!5467 lt!193395)))) (and (= (currentBit!5592 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5597 thiss!1305) (size!2460 (buf!2900 (_2!5467 lt!193395))))))))))

(assert (=> b!122828 d!39494))

(declare-fun d!39496 () Bool)

(assert (=> d!39496 (= (array_inv!2262 (buf!2900 thiss!1305)) (bvsge (size!2460 (buf!2900 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!122827 d!39496))

(declare-fun d!39498 () Bool)

(declare-fun res!101870 () Bool)

(declare-fun e!80560 () Bool)

(assert (=> d!39498 (=> (not res!101870) (not e!80560))))

(assert (=> d!39498 (= res!101870 (= (size!2460 (buf!2900 thiss!1305)) (size!2460 (buf!2900 (_2!5467 lt!193401)))))))

(assert (=> d!39498 (= (isPrefixOf!0 thiss!1305 (_2!5467 lt!193401)) e!80560)))

(declare-fun b!122874 () Bool)

(declare-fun res!101869 () Bool)

(assert (=> b!122874 (=> (not res!101869) (not e!80560))))

(assert (=> b!122874 (= res!101869 (bvsle (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401)))))))

(declare-fun b!122875 () Bool)

(declare-fun e!80561 () Bool)

(assert (=> b!122875 (= e!80560 e!80561)))

(declare-fun res!101868 () Bool)

(assert (=> b!122875 (=> res!101868 e!80561)))

(assert (=> b!122875 (= res!101868 (= (size!2460 (buf!2900 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!122876 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5436 array!5436 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!122876 (= e!80561 (arrayBitRangesEq!0 (buf!2900 thiss!1305) (buf!2900 (_2!5467 lt!193401)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))))))

(assert (= (and d!39498 res!101870) b!122874))

(assert (= (and b!122874 res!101869) b!122875))

(assert (= (and b!122875 (not res!101868)) b!122876))

(assert (=> b!122874 m!186643))

(assert (=> b!122874 m!186641))

(assert (=> b!122876 m!186643))

(assert (=> b!122876 m!186643))

(declare-fun m!186747 () Bool)

(assert (=> b!122876 m!186747))

(assert (=> b!122838 d!39498))

(declare-fun d!39502 () Bool)

(declare-fun e!80567 () Bool)

(assert (=> d!39502 e!80567))

(declare-fun res!101880 () Bool)

(assert (=> d!39502 (=> (not res!101880) (not e!80567))))

(declare-fun lt!193510 () (_ BitVec 64))

(declare-fun lt!193515 () (_ BitVec 64))

(declare-fun lt!193511 () (_ BitVec 64))

(assert (=> d!39502 (= res!101880 (= lt!193510 (bvsub lt!193511 lt!193515)))))

(assert (=> d!39502 (or (= (bvand lt!193511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!193515 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!193511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193511 lt!193515) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!39502 (= lt!193515 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193393)))) ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!193393))) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!193393)))))))

(declare-fun lt!193513 () (_ BitVec 64))

(declare-fun lt!193514 () (_ BitVec 64))

(assert (=> d!39502 (= lt!193511 (bvmul lt!193513 lt!193514))))

(assert (=> d!39502 (or (= lt!193513 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!193514 (bvsdiv (bvmul lt!193513 lt!193514) lt!193513)))))

(assert (=> d!39502 (= lt!193514 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39502 (= lt!193513 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193393)))))))

(assert (=> d!39502 (= lt!193510 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!193393))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!193393)))))))

(assert (=> d!39502 (invariant!0 (currentBit!5592 (_1!5468 lt!193393)) (currentByte!5597 (_1!5468 lt!193393)) (size!2460 (buf!2900 (_1!5468 lt!193393))))))

(assert (=> d!39502 (= (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!193393))) (currentByte!5597 (_1!5468 lt!193393)) (currentBit!5592 (_1!5468 lt!193393))) lt!193510)))

(declare-fun b!122885 () Bool)

(declare-fun res!101879 () Bool)

(assert (=> b!122885 (=> (not res!101879) (not e!80567))))

(assert (=> b!122885 (= res!101879 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!193510))))

(declare-fun b!122886 () Bool)

(declare-fun lt!193512 () (_ BitVec 64))

(assert (=> b!122886 (= e!80567 (bvsle lt!193510 (bvmul lt!193512 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!122886 (or (= lt!193512 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!193512 #b0000000000000000000000000000000000000000000000000000000000001000) lt!193512)))))

(assert (=> b!122886 (= lt!193512 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193393)))))))

(assert (= (and d!39502 res!101880) b!122885))

(assert (= (and b!122885 res!101879) b!122886))

(declare-fun m!186755 () Bool)

(assert (=> d!39502 m!186755))

(declare-fun m!186757 () Bool)

(assert (=> d!39502 m!186757))

(assert (=> b!122829 d!39502))

(declare-fun d!39508 () Bool)

(assert (=> d!39508 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305) (size!2460 (buf!2900 thiss!1305))))))

(declare-fun bs!9566 () Bool)

(assert (= bs!9566 d!39508))

(declare-fun m!186767 () Bool)

(assert (=> bs!9566 m!186767))

(assert (=> start!24186 d!39508))

(declare-fun d!39512 () Bool)

(assert (=> d!39512 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!122839 d!39512))

(declare-fun d!39516 () Bool)

(assert (=> d!39516 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 thiss!1305))) ((_ sign_extend 32) (currentByte!5597 thiss!1305)) ((_ sign_extend 32) (currentBit!5592 thiss!1305)) lt!193394) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 thiss!1305))) ((_ sign_extend 32) (currentByte!5597 thiss!1305)) ((_ sign_extend 32) (currentBit!5592 thiss!1305))) lt!193394))))

(declare-fun bs!9567 () Bool)

(assert (= bs!9567 d!39516))

(declare-fun m!186785 () Bool)

(assert (=> bs!9567 m!186785))

(assert (=> b!122836 d!39516))

(declare-fun d!39520 () Bool)

(declare-fun e!80572 () Bool)

(assert (=> d!39520 e!80572))

(declare-fun res!101887 () Bool)

(assert (=> d!39520 (=> (not res!101887) (not e!80572))))

(declare-fun lt!193529 () (_ BitVec 64))

(declare-fun lt!193533 () (_ BitVec 64))

(declare-fun lt!193528 () (_ BitVec 64))

(assert (=> d!39520 (= res!101887 (= lt!193528 (bvsub lt!193529 lt!193533)))))

(assert (=> d!39520 (or (= (bvand lt!193529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!193533 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!193529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193529 lt!193533) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39520 (= lt!193533 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193395)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193395))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193395)))))))

(declare-fun lt!193531 () (_ BitVec 64))

(declare-fun lt!193532 () (_ BitVec 64))

(assert (=> d!39520 (= lt!193529 (bvmul lt!193531 lt!193532))))

(assert (=> d!39520 (or (= lt!193531 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!193532 (bvsdiv (bvmul lt!193531 lt!193532) lt!193531)))))

(assert (=> d!39520 (= lt!193532 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39520 (= lt!193531 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193395)))))))

(assert (=> d!39520 (= lt!193528 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193395))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193395)))))))

(assert (=> d!39520 (invariant!0 (currentBit!5592 (_2!5467 lt!193395)) (currentByte!5597 (_2!5467 lt!193395)) (size!2460 (buf!2900 (_2!5467 lt!193395))))))

(assert (=> d!39520 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193395))) (currentByte!5597 (_2!5467 lt!193395)) (currentBit!5592 (_2!5467 lt!193395))) lt!193528)))

(declare-fun b!122892 () Bool)

(declare-fun res!101886 () Bool)

(assert (=> b!122892 (=> (not res!101886) (not e!80572))))

(assert (=> b!122892 (= res!101886 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!193528))))

(declare-fun b!122893 () Bool)

(declare-fun lt!193530 () (_ BitVec 64))

(assert (=> b!122893 (= e!80572 (bvsle lt!193528 (bvmul lt!193530 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!122893 (or (= lt!193530 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!193530 #b0000000000000000000000000000000000000000000000000000000000001000) lt!193530)))))

(assert (=> b!122893 (= lt!193530 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193395)))))))

(assert (= (and d!39520 res!101887) b!122892))

(assert (= (and b!122892 res!101886) b!122893))

(declare-fun m!186791 () Bool)

(assert (=> d!39520 m!186791))

(declare-fun m!186793 () Bool)

(assert (=> d!39520 m!186793))

(assert (=> b!122837 d!39520))

(declare-fun d!39524 () Bool)

(declare-datatypes ((tuple2!10412 0))(
  ( (tuple2!10413 (_1!5471 (_ BitVec 64)) (_2!5471 BitStream!4394)) )
))
(declare-fun lt!193539 () tuple2!10412)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10412)

(assert (=> d!39524 (= lt!193539 (readNLeastSignificantBitsLoop!0 lt!193405 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193383))))

(assert (=> d!39524 (= (readNLeastSignificantBitsLoopPure!0 lt!193405 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193383) (tuple2!10401 (_2!5471 lt!193539) (_1!5471 lt!193539)))))

(declare-fun bs!9569 () Bool)

(assert (= bs!9569 d!39524))

(declare-fun m!186797 () Bool)

(assert (=> bs!9569 m!186797))

(assert (=> b!122837 d!39524))

(declare-fun d!39528 () Bool)

(declare-fun e!80578 () Bool)

(assert (=> d!39528 e!80578))

(declare-fun res!101894 () Bool)

(assert (=> d!39528 (=> (not res!101894) (not e!80578))))

(declare-fun lt!193546 () (_ BitVec 64))

(declare-fun lt!193545 () BitStream!4394)

(assert (=> d!39528 (= res!101894 (= (bvadd lt!193546 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2460 (buf!2900 lt!193545)) (currentByte!5597 lt!193545) (currentBit!5592 lt!193545))))))

(assert (=> d!39528 (or (not (= (bvand lt!193546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!193546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!193546 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39528 (= lt!193546 (bitIndex!0 (size!2460 (buf!2900 (_1!5466 lt!193409))) (currentByte!5597 (_1!5466 lt!193409)) (currentBit!5592 (_1!5466 lt!193409))))))

(declare-fun moveBitIndex!0 (BitStream!4394 (_ BitVec 64)) tuple2!10404)

(assert (=> d!39528 (= lt!193545 (_2!5467 (moveBitIndex!0 (_1!5466 lt!193409) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4394 (_ BitVec 64)) Bool)

(assert (=> d!39528 (moveBitIndexPrecond!0 (_1!5466 lt!193409) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!39528 (= (withMovedBitIndex!0 (_1!5466 lt!193409) #b0000000000000000000000000000000000000000000000000000000000000001) lt!193545)))

(declare-fun b!122899 () Bool)

(assert (=> b!122899 (= e!80578 (= (size!2460 (buf!2900 (_1!5466 lt!193409))) (size!2460 (buf!2900 lt!193545))))))

(assert (= (and d!39528 res!101894) b!122899))

(declare-fun m!186801 () Bool)

(assert (=> d!39528 m!186801))

(declare-fun m!186803 () Bool)

(assert (=> d!39528 m!186803))

(declare-fun m!186805 () Bool)

(assert (=> d!39528 m!186805))

(declare-fun m!186807 () Bool)

(assert (=> d!39528 m!186807))

(assert (=> b!122837 d!39528))

(declare-fun d!39542 () Bool)

(declare-fun lt!193564 () tuple2!10400)

(declare-fun lt!193565 () tuple2!10400)

(assert (=> d!39542 (and (= (_2!5465 lt!193564) (_2!5465 lt!193565)) (= (_1!5465 lt!193564) (_1!5465 lt!193565)))))

(declare-fun lt!193566 () Bool)

(declare-fun lt!193567 () (_ BitVec 64))

(declare-fun lt!193563 () Unit!7559)

(declare-fun lt!193562 () BitStream!4394)

(declare-fun choose!45 (BitStream!4394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!10400 tuple2!10400 BitStream!4394 (_ BitVec 64) Bool BitStream!4394 (_ BitVec 64) tuple2!10400 tuple2!10400 BitStream!4394 (_ BitVec 64)) Unit!7559)

(assert (=> d!39542 (= lt!193563 (choose!45 (_1!5466 lt!193409) nBits!396 i!615 lt!193388 lt!193564 (tuple2!10401 (_1!5465 lt!193564) (_2!5465 lt!193564)) (_1!5465 lt!193564) (_2!5465 lt!193564) lt!193566 lt!193562 lt!193567 lt!193565 (tuple2!10401 (_1!5465 lt!193565) (_2!5465 lt!193565)) (_1!5465 lt!193565) (_2!5465 lt!193565)))))

(assert (=> d!39542 (= lt!193565 (readNLeastSignificantBitsLoopPure!0 lt!193562 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!193567))))

(assert (=> d!39542 (= lt!193567 (bvor lt!193388 (ite lt!193566 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39542 (= lt!193562 (withMovedBitIndex!0 (_1!5466 lt!193409) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!39542 (= lt!193566 (_2!5468 (readBitPure!0 (_1!5466 lt!193409))))))

(assert (=> d!39542 (= lt!193564 (readNLeastSignificantBitsLoopPure!0 (_1!5466 lt!193409) nBits!396 i!615 lt!193388))))

(assert (=> d!39542 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5466 lt!193409) nBits!396 i!615 lt!193388) lt!193563)))

(declare-fun bs!9575 () Bool)

(assert (= bs!9575 d!39542))

(declare-fun m!186811 () Bool)

(assert (=> bs!9575 m!186811))

(declare-fun m!186813 () Bool)

(assert (=> bs!9575 m!186813))

(assert (=> bs!9575 m!186653))

(assert (=> bs!9575 m!186681))

(assert (=> bs!9575 m!186705))

(assert (=> b!122837 d!39542))

(declare-fun d!39546 () Bool)

(declare-fun e!80579 () Bool)

(assert (=> d!39546 e!80579))

(declare-fun res!101896 () Bool)

(assert (=> d!39546 (=> (not res!101896) (not e!80579))))

(declare-fun lt!193568 () (_ BitVec 64))

(declare-fun lt!193569 () (_ BitVec 64))

(declare-fun lt!193573 () (_ BitVec 64))

(assert (=> d!39546 (= res!101896 (= lt!193568 (bvsub lt!193569 lt!193573)))))

(assert (=> d!39546 (or (= (bvand lt!193569 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!193573 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!193569 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193569 lt!193573) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39546 (= lt!193573 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193401)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401)))))))

(declare-fun lt!193571 () (_ BitVec 64))

(declare-fun lt!193572 () (_ BitVec 64))

(assert (=> d!39546 (= lt!193569 (bvmul lt!193571 lt!193572))))

(assert (=> d!39546 (or (= lt!193571 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!193572 (bvsdiv (bvmul lt!193571 lt!193572) lt!193571)))))

(assert (=> d!39546 (= lt!193572 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39546 (= lt!193571 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193401)))))))

(assert (=> d!39546 (= lt!193568 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401)))))))

(assert (=> d!39546 (invariant!0 (currentBit!5592 (_2!5467 lt!193401)) (currentByte!5597 (_2!5467 lt!193401)) (size!2460 (buf!2900 (_2!5467 lt!193401))))))

(assert (=> d!39546 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))) lt!193568)))

(declare-fun b!122900 () Bool)

(declare-fun res!101895 () Bool)

(assert (=> b!122900 (=> (not res!101895) (not e!80579))))

(assert (=> b!122900 (= res!101895 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!193568))))

(declare-fun b!122901 () Bool)

(declare-fun lt!193570 () (_ BitVec 64))

(assert (=> b!122901 (= e!80579 (bvsle lt!193568 (bvmul lt!193570 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!122901 (or (= lt!193570 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!193570 #b0000000000000000000000000000000000000000000000000000000000001000) lt!193570)))))

(assert (=> b!122901 (= lt!193570 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193401)))))))

(assert (= (and d!39546 res!101896) b!122900))

(assert (= (and b!122900 res!101895) b!122901))

(declare-fun m!186815 () Bool)

(assert (=> d!39546 m!186815))

(declare-fun m!186817 () Bool)

(assert (=> d!39546 m!186817))

(assert (=> b!122837 d!39546))

(declare-fun d!39548 () Bool)

(declare-fun e!80580 () Bool)

(assert (=> d!39548 e!80580))

(declare-fun res!101898 () Bool)

(assert (=> d!39548 (=> (not res!101898) (not e!80580))))

(declare-fun lt!193579 () (_ BitVec 64))

(declare-fun lt!193574 () (_ BitVec 64))

(declare-fun lt!193575 () (_ BitVec 64))

(assert (=> d!39548 (= res!101898 (= lt!193574 (bvsub lt!193575 lt!193579)))))

(assert (=> d!39548 (or (= (bvand lt!193575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!193579 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!193575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193575 lt!193579) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39548 (= lt!193579 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 thiss!1305))) ((_ sign_extend 32) (currentByte!5597 thiss!1305)) ((_ sign_extend 32) (currentBit!5592 thiss!1305))))))

(declare-fun lt!193577 () (_ BitVec 64))

(declare-fun lt!193578 () (_ BitVec 64))

(assert (=> d!39548 (= lt!193575 (bvmul lt!193577 lt!193578))))

(assert (=> d!39548 (or (= lt!193577 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!193578 (bvsdiv (bvmul lt!193577 lt!193578) lt!193577)))))

(assert (=> d!39548 (= lt!193578 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39548 (= lt!193577 ((_ sign_extend 32) (size!2460 (buf!2900 thiss!1305))))))

(assert (=> d!39548 (= lt!193574 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 thiss!1305))))))

(assert (=> d!39548 (invariant!0 (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305) (size!2460 (buf!2900 thiss!1305)))))

(assert (=> d!39548 (= (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)) lt!193574)))

(declare-fun b!122902 () Bool)

(declare-fun res!101897 () Bool)

(assert (=> b!122902 (=> (not res!101897) (not e!80580))))

(assert (=> b!122902 (= res!101897 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!193574))))

(declare-fun b!122903 () Bool)

(declare-fun lt!193576 () (_ BitVec 64))

(assert (=> b!122903 (= e!80580 (bvsle lt!193574 (bvmul lt!193576 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!122903 (or (= lt!193576 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!193576 #b0000000000000000000000000000000000000000000000000000000000001000) lt!193576)))))

(assert (=> b!122903 (= lt!193576 ((_ sign_extend 32) (size!2460 (buf!2900 thiss!1305))))))

(assert (= (and d!39548 res!101898) b!122902))

(assert (= (and b!122902 res!101897) b!122903))

(assert (=> d!39548 m!186785))

(assert (=> d!39548 m!186767))

(assert (=> b!122837 d!39548))

(declare-fun d!39550 () Bool)

(declare-fun e!80581 () Bool)

(assert (=> d!39550 e!80581))

(declare-fun res!101899 () Bool)

(assert (=> d!39550 (=> (not res!101899) (not e!80581))))

(declare-fun lt!193581 () (_ BitVec 64))

(declare-fun lt!193580 () BitStream!4394)

(assert (=> d!39550 (= res!101899 (= (bvadd lt!193581 (bvsub lt!193407 lt!193410)) (bitIndex!0 (size!2460 (buf!2900 lt!193580)) (currentByte!5597 lt!193580) (currentBit!5592 lt!193580))))))

(assert (=> d!39550 (or (not (= (bvand lt!193581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193407 lt!193410) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!193581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!193581 (bvsub lt!193407 lt!193410)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39550 (= lt!193581 (bitIndex!0 (size!2460 (buf!2900 (_2!5466 lt!193409))) (currentByte!5597 (_2!5466 lt!193409)) (currentBit!5592 (_2!5466 lt!193409))))))

(assert (=> d!39550 (= lt!193580 (_2!5467 (moveBitIndex!0 (_2!5466 lt!193409) (bvsub lt!193407 lt!193410))))))

(assert (=> d!39550 (moveBitIndexPrecond!0 (_2!5466 lt!193409) (bvsub lt!193407 lt!193410))))

(assert (=> d!39550 (= (withMovedBitIndex!0 (_2!5466 lt!193409) (bvsub lt!193407 lt!193410)) lt!193580)))

(declare-fun b!122904 () Bool)

(assert (=> b!122904 (= e!80581 (= (size!2460 (buf!2900 (_2!5466 lt!193409))) (size!2460 (buf!2900 lt!193580))))))

(assert (= (and d!39550 res!101899) b!122904))

(declare-fun m!186819 () Bool)

(assert (=> d!39550 m!186819))

(declare-fun m!186821 () Bool)

(assert (=> d!39550 m!186821))

(declare-fun m!186823 () Bool)

(assert (=> d!39550 m!186823))

(declare-fun m!186825 () Bool)

(assert (=> d!39550 m!186825))

(assert (=> b!122837 d!39550))

(declare-fun d!39552 () Bool)

(declare-fun e!80582 () Bool)

(assert (=> d!39552 e!80582))

(declare-fun res!101900 () Bool)

(assert (=> d!39552 (=> (not res!101900) (not e!80582))))

(declare-fun lt!193582 () BitStream!4394)

(declare-fun lt!193583 () (_ BitVec 64))

(assert (=> d!39552 (= res!101900 (= (bvadd lt!193583 (bvsub lt!193396 lt!193410)) (bitIndex!0 (size!2460 (buf!2900 lt!193582)) (currentByte!5597 lt!193582) (currentBit!5592 lt!193582))))))

(assert (=> d!39552 (or (not (= (bvand lt!193583 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193396 lt!193410) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!193583 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!193583 (bvsub lt!193396 lt!193410)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39552 (= lt!193583 (bitIndex!0 (size!2460 (buf!2900 (_2!5466 lt!193391))) (currentByte!5597 (_2!5466 lt!193391)) (currentBit!5592 (_2!5466 lt!193391))))))

(assert (=> d!39552 (= lt!193582 (_2!5467 (moveBitIndex!0 (_2!5466 lt!193391) (bvsub lt!193396 lt!193410))))))

(assert (=> d!39552 (moveBitIndexPrecond!0 (_2!5466 lt!193391) (bvsub lt!193396 lt!193410))))

(assert (=> d!39552 (= (withMovedBitIndex!0 (_2!5466 lt!193391) (bvsub lt!193396 lt!193410)) lt!193582)))

(declare-fun b!122905 () Bool)

(assert (=> b!122905 (= e!80582 (= (size!2460 (buf!2900 (_2!5466 lt!193391))) (size!2460 (buf!2900 lt!193582))))))

(assert (= (and d!39552 res!101900) b!122905))

(declare-fun m!186827 () Bool)

(assert (=> d!39552 m!186827))

(declare-fun m!186829 () Bool)

(assert (=> d!39552 m!186829))

(declare-fun m!186831 () Bool)

(assert (=> d!39552 m!186831))

(declare-fun m!186833 () Bool)

(assert (=> d!39552 m!186833))

(assert (=> b!122837 d!39552))

(declare-fun d!39554 () Bool)

(assert (=> d!39554 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!122826 d!39554))

(declare-fun d!39556 () Bool)

(declare-fun e!80585 () Bool)

(assert (=> d!39556 e!80585))

(declare-fun res!101903 () Bool)

(assert (=> d!39556 (=> (not res!101903) (not e!80585))))

(declare-fun lt!193593 () tuple2!10406)

(declare-fun lt!193595 () tuple2!10406)

(assert (=> d!39556 (= res!101903 (= (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!193593))) (currentByte!5597 (_1!5468 lt!193593)) (currentBit!5592 (_1!5468 lt!193593))) (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!193595))) (currentByte!5597 (_1!5468 lt!193595)) (currentBit!5592 (_1!5468 lt!193595)))))))

(declare-fun lt!193594 () Unit!7559)

(declare-fun lt!193592 () BitStream!4394)

(declare-fun choose!50 (BitStream!4394 BitStream!4394 BitStream!4394 tuple2!10406 tuple2!10406 BitStream!4394 Bool tuple2!10406 tuple2!10406 BitStream!4394 Bool) Unit!7559)

(assert (=> d!39556 (= lt!193594 (choose!50 lt!193404 (_2!5467 lt!193395) lt!193592 lt!193593 (tuple2!10407 (_1!5468 lt!193593) (_2!5468 lt!193593)) (_1!5468 lt!193593) (_2!5468 lt!193593) lt!193595 (tuple2!10407 (_1!5468 lt!193595) (_2!5468 lt!193595)) (_1!5468 lt!193595) (_2!5468 lt!193595)))))

(assert (=> d!39556 (= lt!193595 (readBitPure!0 lt!193592))))

(assert (=> d!39556 (= lt!193593 (readBitPure!0 lt!193404))))

(assert (=> d!39556 (= lt!193592 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 lt!193404) (currentBit!5592 lt!193404)))))

(assert (=> d!39556 (invariant!0 (currentBit!5592 lt!193404) (currentByte!5597 lt!193404) (size!2460 (buf!2900 (_2!5467 lt!193395))))))

(assert (=> d!39556 (= (readBitPrefixLemma!0 lt!193404 (_2!5467 lt!193395)) lt!193594)))

(declare-fun b!122908 () Bool)

(assert (=> b!122908 (= e!80585 (= (_2!5468 lt!193593) (_2!5468 lt!193595)))))

(assert (= (and d!39556 res!101903) b!122908))

(declare-fun m!186835 () Bool)

(assert (=> d!39556 m!186835))

(declare-fun m!186837 () Bool)

(assert (=> d!39556 m!186837))

(declare-fun m!186839 () Bool)

(assert (=> d!39556 m!186839))

(declare-fun m!186841 () Bool)

(assert (=> d!39556 m!186841))

(declare-fun m!186843 () Bool)

(assert (=> d!39556 m!186843))

(assert (=> d!39556 m!186685))

(assert (=> b!122826 d!39556))

(declare-fun d!39558 () Bool)

(declare-fun e!80591 () Bool)

(assert (=> d!39558 e!80591))

(declare-fun res!101913 () Bool)

(assert (=> d!39558 (=> (not res!101913) (not e!80591))))

(declare-fun lt!193604 () tuple2!10404)

(assert (=> d!39558 (= res!101913 (= (size!2460 (buf!2900 thiss!1305)) (size!2460 (buf!2900 (_2!5467 lt!193604)))))))

(declare-fun choose!16 (BitStream!4394 Bool) tuple2!10404)

(assert (=> d!39558 (= lt!193604 (choose!16 thiss!1305 lt!193397))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!39558 (validate_offset_bit!0 ((_ sign_extend 32) (size!2460 (buf!2900 thiss!1305))) ((_ sign_extend 32) (currentByte!5597 thiss!1305)) ((_ sign_extend 32) (currentBit!5592 thiss!1305)))))

(assert (=> d!39558 (= (appendBit!0 thiss!1305 lt!193397) lt!193604)))

(declare-fun b!122919 () Bool)

(declare-fun res!101912 () Bool)

(assert (=> b!122919 (=> (not res!101912) (not e!80591))))

(assert (=> b!122919 (= res!101912 (isPrefixOf!0 thiss!1305 (_2!5467 lt!193604)))))

(declare-fun b!122920 () Bool)

(declare-fun e!80590 () Bool)

(assert (=> b!122920 (= e!80591 e!80590)))

(declare-fun res!101914 () Bool)

(assert (=> b!122920 (=> (not res!101914) (not e!80590))))

(declare-fun lt!193605 () tuple2!10406)

(assert (=> b!122920 (= res!101914 (and (= (_2!5468 lt!193605) lt!193397) (= (_1!5468 lt!193605) (_2!5467 lt!193604))))))

(assert (=> b!122920 (= lt!193605 (readBitPure!0 (readerFrom!0 (_2!5467 lt!193604) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305))))))

(declare-fun b!122921 () Bool)

(assert (=> b!122921 (= e!80590 (= (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!193605))) (currentByte!5597 (_1!5468 lt!193605)) (currentBit!5592 (_1!5468 lt!193605))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193604))) (currentByte!5597 (_2!5467 lt!193604)) (currentBit!5592 (_2!5467 lt!193604)))))))

(declare-fun b!122918 () Bool)

(declare-fun res!101915 () Bool)

(assert (=> b!122918 (=> (not res!101915) (not e!80591))))

(declare-fun lt!193606 () (_ BitVec 64))

(declare-fun lt!193607 () (_ BitVec 64))

(assert (=> b!122918 (= res!101915 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193604))) (currentByte!5597 (_2!5467 lt!193604)) (currentBit!5592 (_2!5467 lt!193604))) (bvadd lt!193607 lt!193606)))))

(assert (=> b!122918 (or (not (= (bvand lt!193607 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!193606 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!193607 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!193607 lt!193606) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122918 (= lt!193606 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!122918 (= lt!193607 (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))))

(assert (= (and d!39558 res!101913) b!122918))

(assert (= (and b!122918 res!101915) b!122919))

(assert (= (and b!122919 res!101912) b!122920))

(assert (= (and b!122920 res!101914) b!122921))

(declare-fun m!186845 () Bool)

(assert (=> b!122920 m!186845))

(assert (=> b!122920 m!186845))

(declare-fun m!186847 () Bool)

(assert (=> b!122920 m!186847))

(declare-fun m!186849 () Bool)

(assert (=> b!122918 m!186849))

(assert (=> b!122918 m!186643))

(declare-fun m!186851 () Bool)

(assert (=> d!39558 m!186851))

(declare-fun m!186853 () Bool)

(assert (=> d!39558 m!186853))

(declare-fun m!186855 () Bool)

(assert (=> b!122921 m!186855))

(assert (=> b!122921 m!186849))

(declare-fun m!186857 () Bool)

(assert (=> b!122919 m!186857))

(assert (=> b!122826 d!39558))

(declare-fun b!122932 () Bool)

(declare-fun res!101923 () Bool)

(declare-fun e!80597 () Bool)

(assert (=> b!122932 (=> (not res!101923) (not e!80597))))

(declare-fun lt!193663 () tuple2!10402)

(assert (=> b!122932 (= res!101923 (isPrefixOf!0 (_2!5466 lt!193663) (_2!5467 lt!193395)))))

(declare-fun lt!193650 () (_ BitVec 64))

(declare-fun lt!193653 () (_ BitVec 64))

(declare-fun b!122933 () Bool)

(assert (=> b!122933 (= e!80597 (= (_1!5466 lt!193663) (withMovedBitIndex!0 (_2!5466 lt!193663) (bvsub lt!193650 lt!193653))))))

(assert (=> b!122933 (or (= (bvand lt!193650 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!193653 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!193650 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193650 lt!193653) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122933 (= lt!193653 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193395))) (currentByte!5597 (_2!5467 lt!193395)) (currentBit!5592 (_2!5467 lt!193395))))))

(assert (=> b!122933 (= lt!193650 (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))))

(declare-fun b!122934 () Bool)

(declare-fun res!101922 () Bool)

(assert (=> b!122934 (=> (not res!101922) (not e!80597))))

(assert (=> b!122934 (= res!101922 (isPrefixOf!0 (_1!5466 lt!193663) thiss!1305))))

(declare-fun b!122935 () Bool)

(declare-fun e!80596 () Unit!7559)

(declare-fun lt!193656 () Unit!7559)

(assert (=> b!122935 (= e!80596 lt!193656)))

(declare-fun lt!193649 () (_ BitVec 64))

(assert (=> b!122935 (= lt!193649 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!193655 () (_ BitVec 64))

(assert (=> b!122935 (= lt!193655 (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5436 array!5436 (_ BitVec 64) (_ BitVec 64)) Unit!7559)

(assert (=> b!122935 (= lt!193656 (arrayBitRangesEqSymmetric!0 (buf!2900 thiss!1305) (buf!2900 (_2!5467 lt!193395)) lt!193649 lt!193655))))

(assert (=> b!122935 (arrayBitRangesEq!0 (buf!2900 (_2!5467 lt!193395)) (buf!2900 thiss!1305) lt!193649 lt!193655)))

(declare-fun d!39560 () Bool)

(assert (=> d!39560 e!80597))

(declare-fun res!101924 () Bool)

(assert (=> d!39560 (=> (not res!101924) (not e!80597))))

(assert (=> d!39560 (= res!101924 (isPrefixOf!0 (_1!5466 lt!193663) (_2!5466 lt!193663)))))

(declare-fun lt!193651 () BitStream!4394)

(assert (=> d!39560 (= lt!193663 (tuple2!10403 lt!193651 (_2!5467 lt!193395)))))

(declare-fun lt!193648 () Unit!7559)

(declare-fun lt!193659 () Unit!7559)

(assert (=> d!39560 (= lt!193648 lt!193659)))

(assert (=> d!39560 (isPrefixOf!0 lt!193651 (_2!5467 lt!193395))))

(assert (=> d!39560 (= lt!193659 (lemmaIsPrefixTransitive!0 lt!193651 (_2!5467 lt!193395) (_2!5467 lt!193395)))))

(declare-fun lt!193654 () Unit!7559)

(declare-fun lt!193662 () Unit!7559)

(assert (=> d!39560 (= lt!193654 lt!193662)))

(assert (=> d!39560 (isPrefixOf!0 lt!193651 (_2!5467 lt!193395))))

(assert (=> d!39560 (= lt!193662 (lemmaIsPrefixTransitive!0 lt!193651 thiss!1305 (_2!5467 lt!193395)))))

(declare-fun lt!193657 () Unit!7559)

(assert (=> d!39560 (= lt!193657 e!80596)))

(declare-fun c!7333 () Bool)

(assert (=> d!39560 (= c!7333 (not (= (size!2460 (buf!2900 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!193666 () Unit!7559)

(declare-fun lt!193667 () Unit!7559)

(assert (=> d!39560 (= lt!193666 lt!193667)))

(assert (=> d!39560 (isPrefixOf!0 (_2!5467 lt!193395) (_2!5467 lt!193395))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4394) Unit!7559)

(assert (=> d!39560 (= lt!193667 (lemmaIsPrefixRefl!0 (_2!5467 lt!193395)))))

(declare-fun lt!193665 () Unit!7559)

(declare-fun lt!193660 () Unit!7559)

(assert (=> d!39560 (= lt!193665 lt!193660)))

(assert (=> d!39560 (= lt!193660 (lemmaIsPrefixRefl!0 (_2!5467 lt!193395)))))

(declare-fun lt!193652 () Unit!7559)

(declare-fun lt!193661 () Unit!7559)

(assert (=> d!39560 (= lt!193652 lt!193661)))

(assert (=> d!39560 (isPrefixOf!0 lt!193651 lt!193651)))

(assert (=> d!39560 (= lt!193661 (lemmaIsPrefixRefl!0 lt!193651))))

(declare-fun lt!193664 () Unit!7559)

(declare-fun lt!193658 () Unit!7559)

(assert (=> d!39560 (= lt!193664 lt!193658)))

(assert (=> d!39560 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!39560 (= lt!193658 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!39560 (= lt!193651 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))))

(assert (=> d!39560 (isPrefixOf!0 thiss!1305 (_2!5467 lt!193395))))

(assert (=> d!39560 (= (reader!0 thiss!1305 (_2!5467 lt!193395)) lt!193663)))

(declare-fun b!122936 () Bool)

(declare-fun Unit!7575 () Unit!7559)

(assert (=> b!122936 (= e!80596 Unit!7575)))

(assert (= (and d!39560 c!7333) b!122935))

(assert (= (and d!39560 (not c!7333)) b!122936))

(assert (= (and d!39560 res!101924) b!122934))

(assert (= (and b!122934 res!101922) b!122932))

(assert (= (and b!122932 res!101923) b!122933))

(declare-fun m!186859 () Bool)

(assert (=> b!122933 m!186859))

(assert (=> b!122933 m!186709))

(assert (=> b!122933 m!186643))

(declare-fun m!186861 () Bool)

(assert (=> b!122934 m!186861))

(declare-fun m!186863 () Bool)

(assert (=> d!39560 m!186863))

(declare-fun m!186865 () Bool)

(assert (=> d!39560 m!186865))

(declare-fun m!186867 () Bool)

(assert (=> d!39560 m!186867))

(declare-fun m!186869 () Bool)

(assert (=> d!39560 m!186869))

(declare-fun m!186871 () Bool)

(assert (=> d!39560 m!186871))

(assert (=> d!39560 m!186673))

(declare-fun m!186873 () Bool)

(assert (=> d!39560 m!186873))

(declare-fun m!186875 () Bool)

(assert (=> d!39560 m!186875))

(declare-fun m!186877 () Bool)

(assert (=> d!39560 m!186877))

(declare-fun m!186879 () Bool)

(assert (=> d!39560 m!186879))

(declare-fun m!186881 () Bool)

(assert (=> d!39560 m!186881))

(declare-fun m!186883 () Bool)

(assert (=> b!122932 m!186883))

(assert (=> b!122935 m!186643))

(declare-fun m!186885 () Bool)

(assert (=> b!122935 m!186885))

(declare-fun m!186887 () Bool)

(assert (=> b!122935 m!186887))

(assert (=> b!122826 d!39560))

(declare-fun d!39562 () Bool)

(declare-fun e!80598 () Bool)

(assert (=> d!39562 e!80598))

(declare-fun res!101926 () Bool)

(assert (=> d!39562 (=> (not res!101926) (not e!80598))))

(declare-fun lt!193673 () (_ BitVec 64))

(declare-fun lt!193669 () (_ BitVec 64))

(declare-fun lt!193668 () (_ BitVec 64))

(assert (=> d!39562 (= res!101926 (= lt!193668 (bvsub lt!193669 lt!193673)))))

(assert (=> d!39562 (or (= (bvand lt!193669 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!193673 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!193669 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193669 lt!193673) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39562 (= lt!193673 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193385)))) ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!193385))) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!193385)))))))

(declare-fun lt!193671 () (_ BitVec 64))

(declare-fun lt!193672 () (_ BitVec 64))

(assert (=> d!39562 (= lt!193669 (bvmul lt!193671 lt!193672))))

(assert (=> d!39562 (or (= lt!193671 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!193672 (bvsdiv (bvmul lt!193671 lt!193672) lt!193671)))))

(assert (=> d!39562 (= lt!193672 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39562 (= lt!193671 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193385)))))))

(assert (=> d!39562 (= lt!193668 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!193385))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!193385)))))))

(assert (=> d!39562 (invariant!0 (currentBit!5592 (_1!5468 lt!193385)) (currentByte!5597 (_1!5468 lt!193385)) (size!2460 (buf!2900 (_1!5468 lt!193385))))))

(assert (=> d!39562 (= (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!193385))) (currentByte!5597 (_1!5468 lt!193385)) (currentBit!5592 (_1!5468 lt!193385))) lt!193668)))

(declare-fun b!122937 () Bool)

(declare-fun res!101925 () Bool)

(assert (=> b!122937 (=> (not res!101925) (not e!80598))))

(assert (=> b!122937 (= res!101925 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!193668))))

(declare-fun b!122938 () Bool)

(declare-fun lt!193670 () (_ BitVec 64))

(assert (=> b!122938 (= e!80598 (bvsle lt!193668 (bvmul lt!193670 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!122938 (or (= lt!193670 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!193670 #b0000000000000000000000000000000000000000000000000000000000001000) lt!193670)))))

(assert (=> b!122938 (= lt!193670 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193385)))))))

(assert (= (and d!39562 res!101926) b!122937))

(assert (= (and b!122937 res!101925) b!122938))

(declare-fun m!186889 () Bool)

(assert (=> d!39562 m!186889))

(declare-fun m!186891 () Bool)

(assert (=> d!39562 m!186891))

(assert (=> b!122826 d!39562))

(declare-fun d!39564 () Bool)

(assert (=> d!39564 (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193395)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401))) lt!193382)))

(declare-fun lt!193676 () Unit!7559)

(declare-fun choose!9 (BitStream!4394 array!5436 (_ BitVec 64) BitStream!4394) Unit!7559)

(assert (=> d!39564 (= lt!193676 (choose!9 (_2!5467 lt!193401) (buf!2900 (_2!5467 lt!193395)) lt!193382 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401)))))))

(assert (=> d!39564 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5467 lt!193401) (buf!2900 (_2!5467 lt!193395)) lt!193382) lt!193676)))

(declare-fun bs!9576 () Bool)

(assert (= bs!9576 d!39564))

(assert (=> bs!9576 m!186657))

(declare-fun m!186893 () Bool)

(assert (=> bs!9576 m!186893))

(assert (=> b!122826 d!39564))

(declare-fun d!39566 () Bool)

(assert (=> d!39566 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193395)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401))) lt!193382) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193395)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401)))) lt!193382))))

(declare-fun bs!9577 () Bool)

(assert (= bs!9577 d!39566))

(declare-fun m!186895 () Bool)

(assert (=> bs!9577 m!186895))

(assert (=> b!122826 d!39566))

(declare-fun d!39568 () Bool)

(assert (=> d!39568 (isPrefixOf!0 thiss!1305 (_2!5467 lt!193395))))

(declare-fun lt!193679 () Unit!7559)

(declare-fun choose!30 (BitStream!4394 BitStream!4394 BitStream!4394) Unit!7559)

(assert (=> d!39568 (= lt!193679 (choose!30 thiss!1305 (_2!5467 lt!193401) (_2!5467 lt!193395)))))

(assert (=> d!39568 (isPrefixOf!0 thiss!1305 (_2!5467 lt!193401))))

(assert (=> d!39568 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5467 lt!193401) (_2!5467 lt!193395)) lt!193679)))

(declare-fun bs!9578 () Bool)

(assert (= bs!9578 d!39568))

(assert (=> bs!9578 m!186673))

(declare-fun m!186897 () Bool)

(assert (=> bs!9578 m!186897))

(assert (=> bs!9578 m!186647))

(assert (=> b!122826 d!39568))

(declare-fun d!39570 () Bool)

(declare-datatypes ((tuple2!10418 0))(
  ( (tuple2!10419 (_1!5474 Bool) (_2!5474 BitStream!4394)) )
))
(declare-fun lt!193682 () tuple2!10418)

(declare-fun readBit!0 (BitStream!4394) tuple2!10418)

(assert (=> d!39570 (= lt!193682 (readBit!0 lt!193404))))

(assert (=> d!39570 (= (readBitPure!0 lt!193404) (tuple2!10407 (_2!5474 lt!193682) (_1!5474 lt!193682)))))

(declare-fun bs!9579 () Bool)

(assert (= bs!9579 d!39570))

(declare-fun m!186899 () Bool)

(assert (=> bs!9579 m!186899))

(assert (=> b!122826 d!39570))

(declare-fun b!122939 () Bool)

(declare-fun res!101928 () Bool)

(declare-fun e!80600 () Bool)

(assert (=> b!122939 (=> (not res!101928) (not e!80600))))

(declare-fun lt!193698 () tuple2!10402)

(assert (=> b!122939 (= res!101928 (isPrefixOf!0 (_2!5466 lt!193698) (_2!5467 lt!193395)))))

(declare-fun lt!193685 () (_ BitVec 64))

(declare-fun b!122940 () Bool)

(declare-fun lt!193688 () (_ BitVec 64))

(assert (=> b!122940 (= e!80600 (= (_1!5466 lt!193698) (withMovedBitIndex!0 (_2!5466 lt!193698) (bvsub lt!193685 lt!193688))))))

(assert (=> b!122940 (or (= (bvand lt!193685 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!193688 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!193685 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193685 lt!193688) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122940 (= lt!193688 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193395))) (currentByte!5597 (_2!5467 lt!193395)) (currentBit!5592 (_2!5467 lt!193395))))))

(assert (=> b!122940 (= lt!193685 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))))))

(declare-fun b!122941 () Bool)

(declare-fun res!101927 () Bool)

(assert (=> b!122941 (=> (not res!101927) (not e!80600))))

(assert (=> b!122941 (= res!101927 (isPrefixOf!0 (_1!5466 lt!193698) (_2!5467 lt!193401)))))

(declare-fun b!122942 () Bool)

(declare-fun e!80599 () Unit!7559)

(declare-fun lt!193691 () Unit!7559)

(assert (=> b!122942 (= e!80599 lt!193691)))

(declare-fun lt!193684 () (_ BitVec 64))

(assert (=> b!122942 (= lt!193684 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!193690 () (_ BitVec 64))

(assert (=> b!122942 (= lt!193690 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))))))

(assert (=> b!122942 (= lt!193691 (arrayBitRangesEqSymmetric!0 (buf!2900 (_2!5467 lt!193401)) (buf!2900 (_2!5467 lt!193395)) lt!193684 lt!193690))))

(assert (=> b!122942 (arrayBitRangesEq!0 (buf!2900 (_2!5467 lt!193395)) (buf!2900 (_2!5467 lt!193401)) lt!193684 lt!193690)))

(declare-fun d!39572 () Bool)

(assert (=> d!39572 e!80600))

(declare-fun res!101929 () Bool)

(assert (=> d!39572 (=> (not res!101929) (not e!80600))))

(assert (=> d!39572 (= res!101929 (isPrefixOf!0 (_1!5466 lt!193698) (_2!5466 lt!193698)))))

(declare-fun lt!193686 () BitStream!4394)

(assert (=> d!39572 (= lt!193698 (tuple2!10403 lt!193686 (_2!5467 lt!193395)))))

(declare-fun lt!193683 () Unit!7559)

(declare-fun lt!193694 () Unit!7559)

(assert (=> d!39572 (= lt!193683 lt!193694)))

(assert (=> d!39572 (isPrefixOf!0 lt!193686 (_2!5467 lt!193395))))

(assert (=> d!39572 (= lt!193694 (lemmaIsPrefixTransitive!0 lt!193686 (_2!5467 lt!193395) (_2!5467 lt!193395)))))

(declare-fun lt!193689 () Unit!7559)

(declare-fun lt!193697 () Unit!7559)

(assert (=> d!39572 (= lt!193689 lt!193697)))

(assert (=> d!39572 (isPrefixOf!0 lt!193686 (_2!5467 lt!193395))))

(assert (=> d!39572 (= lt!193697 (lemmaIsPrefixTransitive!0 lt!193686 (_2!5467 lt!193401) (_2!5467 lt!193395)))))

(declare-fun lt!193692 () Unit!7559)

(assert (=> d!39572 (= lt!193692 e!80599)))

(declare-fun c!7334 () Bool)

(assert (=> d!39572 (= c!7334 (not (= (size!2460 (buf!2900 (_2!5467 lt!193401))) #b00000000000000000000000000000000)))))

(declare-fun lt!193701 () Unit!7559)

(declare-fun lt!193702 () Unit!7559)

(assert (=> d!39572 (= lt!193701 lt!193702)))

(assert (=> d!39572 (isPrefixOf!0 (_2!5467 lt!193395) (_2!5467 lt!193395))))

(assert (=> d!39572 (= lt!193702 (lemmaIsPrefixRefl!0 (_2!5467 lt!193395)))))

(declare-fun lt!193700 () Unit!7559)

(declare-fun lt!193695 () Unit!7559)

(assert (=> d!39572 (= lt!193700 lt!193695)))

(assert (=> d!39572 (= lt!193695 (lemmaIsPrefixRefl!0 (_2!5467 lt!193395)))))

(declare-fun lt!193687 () Unit!7559)

(declare-fun lt!193696 () Unit!7559)

(assert (=> d!39572 (= lt!193687 lt!193696)))

(assert (=> d!39572 (isPrefixOf!0 lt!193686 lt!193686)))

(assert (=> d!39572 (= lt!193696 (lemmaIsPrefixRefl!0 lt!193686))))

(declare-fun lt!193699 () Unit!7559)

(declare-fun lt!193693 () Unit!7559)

(assert (=> d!39572 (= lt!193699 lt!193693)))

(assert (=> d!39572 (isPrefixOf!0 (_2!5467 lt!193401) (_2!5467 lt!193401))))

(assert (=> d!39572 (= lt!193693 (lemmaIsPrefixRefl!0 (_2!5467 lt!193401)))))

(assert (=> d!39572 (= lt!193686 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))))))

(assert (=> d!39572 (isPrefixOf!0 (_2!5467 lt!193401) (_2!5467 lt!193395))))

(assert (=> d!39572 (= (reader!0 (_2!5467 lt!193401) (_2!5467 lt!193395)) lt!193698)))

(declare-fun b!122943 () Bool)

(declare-fun Unit!7577 () Unit!7559)

(assert (=> b!122943 (= e!80599 Unit!7577)))

(assert (= (and d!39572 c!7334) b!122942))

(assert (= (and d!39572 (not c!7334)) b!122943))

(assert (= (and d!39572 res!101929) b!122941))

(assert (= (and b!122941 res!101927) b!122939))

(assert (= (and b!122939 res!101928) b!122940))

(declare-fun m!186901 () Bool)

(assert (=> b!122940 m!186901))

(assert (=> b!122940 m!186709))

(assert (=> b!122940 m!186641))

(declare-fun m!186903 () Bool)

(assert (=> b!122941 m!186903))

(declare-fun m!186905 () Bool)

(assert (=> d!39572 m!186905))

(declare-fun m!186907 () Bool)

(assert (=> d!39572 m!186907))

(assert (=> d!39572 m!186867))

(declare-fun m!186909 () Bool)

(assert (=> d!39572 m!186909))

(declare-fun m!186911 () Bool)

(assert (=> d!39572 m!186911))

(declare-fun m!186913 () Bool)

(assert (=> d!39572 m!186913))

(declare-fun m!186915 () Bool)

(assert (=> d!39572 m!186915))

(declare-fun m!186917 () Bool)

(assert (=> d!39572 m!186917))

(assert (=> d!39572 m!186877))

(declare-fun m!186919 () Bool)

(assert (=> d!39572 m!186919))

(declare-fun m!186921 () Bool)

(assert (=> d!39572 m!186921))

(declare-fun m!186923 () Bool)

(assert (=> b!122939 m!186923))

(assert (=> b!122942 m!186641))

(declare-fun m!186925 () Bool)

(assert (=> b!122942 m!186925))

(declare-fun m!186927 () Bool)

(assert (=> b!122942 m!186927))

(assert (=> b!122826 d!39572))

(declare-fun d!39574 () Bool)

(assert (=> d!39574 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193395)))) ((_ sign_extend 32) (currentByte!5597 thiss!1305)) ((_ sign_extend 32) (currentBit!5592 thiss!1305)) lt!193394) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193395)))) ((_ sign_extend 32) (currentByte!5597 thiss!1305)) ((_ sign_extend 32) (currentBit!5592 thiss!1305))) lt!193394))))

(declare-fun bs!9580 () Bool)

(assert (= bs!9580 d!39574))

(declare-fun m!186929 () Bool)

(assert (=> bs!9580 m!186929))

(assert (=> b!122826 d!39574))

(declare-fun d!39576 () Bool)

(declare-fun lt!193703 () tuple2!10418)

(assert (=> d!39576 (= lt!193703 (readBit!0 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))))))

(assert (=> d!39576 (= (readBitPure!0 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))) (tuple2!10407 (_2!5474 lt!193703) (_1!5474 lt!193703)))))

(declare-fun bs!9581 () Bool)

(assert (= bs!9581 d!39576))

(declare-fun m!186931 () Bool)

(assert (=> bs!9581 m!186931))

(assert (=> b!122826 d!39576))

(declare-fun d!39578 () Bool)

(declare-fun lt!193704 () tuple2!10412)

(assert (=> d!39578 (= lt!193704 (readNLeastSignificantBitsLoop!0 (_1!5466 lt!193409) nBits!396 i!615 lt!193388))))

(assert (=> d!39578 (= (readNLeastSignificantBitsLoopPure!0 (_1!5466 lt!193409) nBits!396 i!615 lt!193388) (tuple2!10401 (_2!5471 lt!193704) (_1!5471 lt!193704)))))

(declare-fun bs!9582 () Bool)

(assert (= bs!9582 d!39578))

(declare-fun m!186933 () Bool)

(assert (=> bs!9582 m!186933))

(assert (=> b!122826 d!39578))

(declare-fun d!39580 () Bool)

(declare-fun lt!193705 () tuple2!10418)

(assert (=> d!39580 (= lt!193705 (readBit!0 (_1!5466 lt!193409)))))

(assert (=> d!39580 (= (readBitPure!0 (_1!5466 lt!193409)) (tuple2!10407 (_2!5474 lt!193705) (_1!5474 lt!193705)))))

(declare-fun bs!9583 () Bool)

(assert (= bs!9583 d!39580))

(declare-fun m!186935 () Bool)

(assert (=> bs!9583 m!186935))

(assert (=> b!122826 d!39580))

(declare-fun d!39582 () Bool)

(assert (=> d!39582 (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193395)))) ((_ sign_extend 32) (currentByte!5597 thiss!1305)) ((_ sign_extend 32) (currentBit!5592 thiss!1305)) lt!193394)))

(declare-fun lt!193706 () Unit!7559)

(assert (=> d!39582 (= lt!193706 (choose!9 thiss!1305 (buf!2900 (_2!5467 lt!193395)) lt!193394 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))))))

(assert (=> d!39582 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2900 (_2!5467 lt!193395)) lt!193394) lt!193706)))

(declare-fun bs!9584 () Bool)

(assert (= bs!9584 d!39582))

(assert (=> bs!9584 m!186663))

(declare-fun m!186937 () Bool)

(assert (=> bs!9584 m!186937))

(assert (=> b!122826 d!39582))

(declare-fun d!39584 () Bool)

(declare-fun res!101932 () Bool)

(declare-fun e!80601 () Bool)

(assert (=> d!39584 (=> (not res!101932) (not e!80601))))

(assert (=> d!39584 (= res!101932 (= (size!2460 (buf!2900 thiss!1305)) (size!2460 (buf!2900 (_2!5467 lt!193395)))))))

(assert (=> d!39584 (= (isPrefixOf!0 thiss!1305 (_2!5467 lt!193395)) e!80601)))

(declare-fun b!122944 () Bool)

(declare-fun res!101931 () Bool)

(assert (=> b!122944 (=> (not res!101931) (not e!80601))))

(assert (=> b!122944 (= res!101931 (bvsle (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193395))) (currentByte!5597 (_2!5467 lt!193395)) (currentBit!5592 (_2!5467 lt!193395)))))))

(declare-fun b!122945 () Bool)

(declare-fun e!80602 () Bool)

(assert (=> b!122945 (= e!80601 e!80602)))

(declare-fun res!101930 () Bool)

(assert (=> b!122945 (=> res!101930 e!80602)))

(assert (=> b!122945 (= res!101930 (= (size!2460 (buf!2900 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!122946 () Bool)

(assert (=> b!122946 (= e!80602 (arrayBitRangesEq!0 (buf!2900 thiss!1305) (buf!2900 (_2!5467 lt!193395)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))))))

(assert (= (and d!39584 res!101932) b!122944))

(assert (= (and b!122944 res!101931) b!122945))

(assert (= (and b!122945 (not res!101930)) b!122946))

(assert (=> b!122944 m!186643))

(assert (=> b!122944 m!186709))

(assert (=> b!122946 m!186643))

(assert (=> b!122946 m!186643))

(declare-fun m!186939 () Bool)

(assert (=> b!122946 m!186939))

(assert (=> b!122826 d!39584))

(declare-fun d!39586 () Bool)

(declare-fun lt!193707 () tuple2!10412)

(assert (=> d!39586 (= lt!193707 (readNLeastSignificantBitsLoop!0 (_1!5466 lt!193391) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193383))))

(assert (=> d!39586 (= (readNLeastSignificantBitsLoopPure!0 (_1!5466 lt!193391) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193383) (tuple2!10401 (_2!5471 lt!193707) (_1!5471 lt!193707)))))

(declare-fun bs!9585 () Bool)

(assert (= bs!9585 d!39586))

(declare-fun m!186941 () Bool)

(assert (=> bs!9585 m!186941))

(assert (=> b!122826 d!39586))

(declare-fun b!123117 () Bool)

(declare-fun lt!194276 () tuple2!10406)

(declare-fun lt!194272 () tuple2!10404)

(assert (=> b!123117 (= lt!194276 (readBitPure!0 (readerFrom!0 (_2!5467 lt!194272) (currentBit!5592 (_2!5467 lt!193401)) (currentByte!5597 (_2!5467 lt!193401)))))))

(declare-fun lt!194254 () Bool)

(declare-fun res!102068 () Bool)

(assert (=> b!123117 (= res!102068 (and (= (_2!5468 lt!194276) lt!194254) (= (_1!5468 lt!194276) (_2!5467 lt!194272))))))

(declare-fun e!80697 () Bool)

(assert (=> b!123117 (=> (not res!102068) (not e!80697))))

(declare-fun e!80695 () Bool)

(assert (=> b!123117 (= e!80695 e!80697)))

(declare-fun b!123118 () Bool)

(declare-fun e!80698 () tuple2!10404)

(declare-fun lt!194271 () Unit!7559)

(assert (=> b!123118 (= e!80698 (tuple2!10405 lt!194271 (_2!5467 lt!193401)))))

(declare-fun lt!194281 () BitStream!4394)

(assert (=> b!123118 (= lt!194281 (_2!5467 lt!193401))))

(assert (=> b!123118 (= lt!194271 (lemmaIsPrefixRefl!0 lt!194281))))

(declare-fun call!1607 () Bool)

(assert (=> b!123118 call!1607))

(declare-fun b!123119 () Bool)

(declare-fun lt!194258 () tuple2!10404)

(declare-fun Unit!7579 () Unit!7559)

(assert (=> b!123119 (= e!80698 (tuple2!10405 Unit!7579 (_2!5467 lt!194258)))))

(assert (=> b!123119 (= lt!194254 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123119 (= lt!194272 (appendBit!0 (_2!5467 lt!193401) lt!194254))))

(declare-fun res!102067 () Bool)

(assert (=> b!123119 (= res!102067 (= (size!2460 (buf!2900 (_2!5467 lt!193401))) (size!2460 (buf!2900 (_2!5467 lt!194272)))))))

(assert (=> b!123119 (=> (not res!102067) (not e!80695))))

(assert (=> b!123119 e!80695))

(declare-fun lt!194275 () tuple2!10404)

(assert (=> b!123119 (= lt!194275 lt!194272)))

(assert (=> b!123119 (= lt!194258 (appendNLeastSignificantBitsLoop!0 (_2!5467 lt!194275) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!194255 () Unit!7559)

(assert (=> b!123119 (= lt!194255 (lemmaIsPrefixTransitive!0 (_2!5467 lt!193401) (_2!5467 lt!194275) (_2!5467 lt!194258)))))

(assert (=> b!123119 (isPrefixOf!0 (_2!5467 lt!193401) (_2!5467 lt!194258))))

(declare-fun lt!194266 () Unit!7559)

(assert (=> b!123119 (= lt!194266 lt!194255)))

(assert (=> b!123119 (invariant!0 (currentBit!5592 (_2!5467 lt!193401)) (currentByte!5597 (_2!5467 lt!193401)) (size!2460 (buf!2900 (_2!5467 lt!194275))))))

(declare-fun lt!194257 () BitStream!4394)

(assert (=> b!123119 (= lt!194257 (BitStream!4395 (buf!2900 (_2!5467 lt!194275)) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))))))

(assert (=> b!123119 (invariant!0 (currentBit!5592 lt!194257) (currentByte!5597 lt!194257) (size!2460 (buf!2900 (_2!5467 lt!194258))))))

(declare-fun lt!194294 () BitStream!4394)

(assert (=> b!123119 (= lt!194294 (BitStream!4395 (buf!2900 (_2!5467 lt!194258)) (currentByte!5597 lt!194257) (currentBit!5592 lt!194257)))))

(declare-fun lt!194290 () tuple2!10406)

(assert (=> b!123119 (= lt!194290 (readBitPure!0 lt!194257))))

(declare-fun lt!194277 () tuple2!10406)

(assert (=> b!123119 (= lt!194277 (readBitPure!0 lt!194294))))

(declare-fun lt!194293 () Unit!7559)

(assert (=> b!123119 (= lt!194293 (readBitPrefixLemma!0 lt!194257 (_2!5467 lt!194258)))))

(declare-fun res!102061 () Bool)

(assert (=> b!123119 (= res!102061 (= (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!194290))) (currentByte!5597 (_1!5468 lt!194290)) (currentBit!5592 (_1!5468 lt!194290))) (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!194277))) (currentByte!5597 (_1!5468 lt!194277)) (currentBit!5592 (_1!5468 lt!194277)))))))

(declare-fun e!80699 () Bool)

(assert (=> b!123119 (=> (not res!102061) (not e!80699))))

(assert (=> b!123119 e!80699))

(declare-fun lt!194259 () Unit!7559)

(assert (=> b!123119 (= lt!194259 lt!194293)))

(declare-fun lt!194270 () tuple2!10402)

(assert (=> b!123119 (= lt!194270 (reader!0 (_2!5467 lt!193401) (_2!5467 lt!194258)))))

(declare-fun lt!194291 () tuple2!10402)

(assert (=> b!123119 (= lt!194291 (reader!0 (_2!5467 lt!194275) (_2!5467 lt!194258)))))

(declare-fun lt!194260 () tuple2!10406)

(assert (=> b!123119 (= lt!194260 (readBitPure!0 (_1!5466 lt!194270)))))

(assert (=> b!123119 (= (_2!5468 lt!194260) lt!194254)))

(declare-fun lt!194268 () Unit!7559)

(declare-fun Unit!7580 () Unit!7559)

(assert (=> b!123119 (= lt!194268 Unit!7580)))

(declare-fun lt!194269 () (_ BitVec 64))

(assert (=> b!123119 (= lt!194269 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!194265 () (_ BitVec 64))

(assert (=> b!123119 (= lt!194265 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!194289 () Unit!7559)

(assert (=> b!123119 (= lt!194289 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5467 lt!193401) (buf!2900 (_2!5467 lt!194258)) lt!194265))))

(assert (=> b!123119 (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194258)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401))) lt!194265)))

(declare-fun lt!194280 () Unit!7559)

(assert (=> b!123119 (= lt!194280 lt!194289)))

(declare-fun lt!194273 () tuple2!10400)

(assert (=> b!123119 (= lt!194273 (readNLeastSignificantBitsLoopPure!0 (_1!5466 lt!194270) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!194269))))

(declare-fun lt!194279 () (_ BitVec 64))

(assert (=> b!123119 (= lt!194279 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!194263 () Unit!7559)

(assert (=> b!123119 (= lt!194263 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5467 lt!194275) (buf!2900 (_2!5467 lt!194258)) lt!194279))))

(assert (=> b!123119 (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194258)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!194275))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!194275))) lt!194279)))

(declare-fun lt!194256 () Unit!7559)

(assert (=> b!123119 (= lt!194256 lt!194263)))

(declare-fun lt!194287 () tuple2!10400)

(assert (=> b!123119 (= lt!194287 (readNLeastSignificantBitsLoopPure!0 (_1!5466 lt!194291) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!194269 (ite (_2!5468 lt!194260) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!194278 () tuple2!10400)

(assert (=> b!123119 (= lt!194278 (readNLeastSignificantBitsLoopPure!0 (_1!5466 lt!194270) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!194269))))

(declare-fun c!7355 () Bool)

(assert (=> b!123119 (= c!7355 (_2!5468 (readBitPure!0 (_1!5466 lt!194270))))))

(declare-fun lt!194274 () tuple2!10400)

(declare-fun e!80700 () (_ BitVec 64))

(assert (=> b!123119 (= lt!194274 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5466 lt!194270) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!194269 e!80700)))))

(declare-fun lt!194253 () Unit!7559)

(assert (=> b!123119 (= lt!194253 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5466 lt!194270) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!194269))))

(assert (=> b!123119 (and (= (_2!5465 lt!194278) (_2!5465 lt!194274)) (= (_1!5465 lt!194278) (_1!5465 lt!194274)))))

(declare-fun lt!194261 () Unit!7559)

(assert (=> b!123119 (= lt!194261 lt!194253)))

(assert (=> b!123119 (= (_1!5466 lt!194270) (withMovedBitIndex!0 (_2!5466 lt!194270) (bvsub (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194258))) (currentByte!5597 (_2!5467 lt!194258)) (currentBit!5592 (_2!5467 lt!194258))))))))

(declare-fun lt!194288 () Unit!7559)

(declare-fun Unit!7581 () Unit!7559)

(assert (=> b!123119 (= lt!194288 Unit!7581)))

(assert (=> b!123119 (= (_1!5466 lt!194291) (withMovedBitIndex!0 (_2!5466 lt!194291) (bvsub (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194275))) (currentByte!5597 (_2!5467 lt!194275)) (currentBit!5592 (_2!5467 lt!194275))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194258))) (currentByte!5597 (_2!5467 lt!194258)) (currentBit!5592 (_2!5467 lt!194258))))))))

(declare-fun lt!194262 () Unit!7559)

(declare-fun Unit!7582 () Unit!7559)

(assert (=> b!123119 (= lt!194262 Unit!7582)))

(assert (=> b!123119 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))) (bvsub (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194275))) (currentByte!5597 (_2!5467 lt!194275)) (currentBit!5592 (_2!5467 lt!194275))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!194295 () Unit!7559)

(declare-fun Unit!7583 () Unit!7559)

(assert (=> b!123119 (= lt!194295 Unit!7583)))

(assert (=> b!123119 (= (_2!5465 lt!194273) (_2!5465 lt!194287))))

(declare-fun lt!194297 () Unit!7559)

(declare-fun Unit!7584 () Unit!7559)

(assert (=> b!123119 (= lt!194297 Unit!7584)))

(assert (=> b!123119 (= (_1!5465 lt!194273) (_2!5466 lt!194270))))

(declare-fun b!123120 () Bool)

(assert (=> b!123120 (= e!80700 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!123121 () Bool)

(declare-fun res!102069 () Bool)

(declare-fun e!80696 () Bool)

(assert (=> b!123121 (=> (not res!102069) (not e!80696))))

(declare-fun lt!194286 () tuple2!10404)

(assert (=> b!123121 (= res!102069 (isPrefixOf!0 (_2!5467 lt!193401) (_2!5467 lt!194286)))))

(declare-fun c!7356 () Bool)

(declare-fun bm!1604 () Bool)

(assert (=> bm!1604 (= call!1607 (isPrefixOf!0 (ite c!7356 (_2!5467 lt!193401) lt!194281) (ite c!7356 (_2!5467 lt!194272) lt!194281)))))

(declare-fun b!123122 () Bool)

(assert (=> b!123122 (= e!80700 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!123123 () Bool)

(assert (=> b!123123 (= e!80697 (= (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!194276))) (currentByte!5597 (_1!5468 lt!194276)) (currentBit!5592 (_1!5468 lt!194276))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194272))) (currentByte!5597 (_2!5467 lt!194272)) (currentBit!5592 (_2!5467 lt!194272)))))))

(declare-fun b!123124 () Bool)

(assert (=> b!123124 (= e!80699 (= (_2!5468 lt!194290) (_2!5468 lt!194277)))))

(declare-fun b!123125 () Bool)

(declare-fun res!102065 () Bool)

(assert (=> b!123125 (= res!102065 call!1607)))

(assert (=> b!123125 (=> (not res!102065) (not e!80695))))

(declare-fun d!39588 () Bool)

(assert (=> d!39588 e!80696))

(declare-fun res!102064 () Bool)

(assert (=> d!39588 (=> (not res!102064) (not e!80696))))

(assert (=> d!39588 (= res!102064 (= (size!2460 (buf!2900 (_2!5467 lt!193401))) (size!2460 (buf!2900 (_2!5467 lt!194286)))))))

(assert (=> d!39588 (= lt!194286 e!80698)))

(assert (=> d!39588 (= c!7356 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!39588 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!39588 (= (appendNLeastSignificantBitsLoop!0 (_2!5467 lt!193401) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!194286)))

(declare-fun b!123126 () Bool)

(declare-fun e!80701 () Bool)

(declare-fun lt!194285 () (_ BitVec 64))

(assert (=> b!123126 (= e!80701 (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193401)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401))) lt!194285))))

(declare-fun b!123127 () Bool)

(declare-fun res!102063 () Bool)

(assert (=> b!123127 (= res!102063 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194272))) (currentByte!5597 (_2!5467 lt!194272)) (currentBit!5592 (_2!5467 lt!194272))) (bvadd (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!123127 (=> (not res!102063) (not e!80695))))

(declare-fun lt!194264 () tuple2!10400)

(declare-fun lt!194284 () tuple2!10402)

(declare-fun b!123128 () Bool)

(assert (=> b!123128 (= e!80696 (and (= (_2!5465 lt!194264) v!199) (= (_1!5465 lt!194264) (_2!5466 lt!194284))))))

(declare-fun lt!194282 () (_ BitVec 64))

(assert (=> b!123128 (= lt!194264 (readNLeastSignificantBitsLoopPure!0 (_1!5466 lt!194284) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!194282))))

(declare-fun lt!194283 () Unit!7559)

(declare-fun lt!194296 () Unit!7559)

(assert (=> b!123128 (= lt!194283 lt!194296)))

(assert (=> b!123128 (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194286)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401))) lt!194285)))

(assert (=> b!123128 (= lt!194296 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5467 lt!193401) (buf!2900 (_2!5467 lt!194286)) lt!194285))))

(assert (=> b!123128 e!80701))

(declare-fun res!102066 () Bool)

(assert (=> b!123128 (=> (not res!102066) (not e!80701))))

(assert (=> b!123128 (= res!102066 (and (= (size!2460 (buf!2900 (_2!5467 lt!193401))) (size!2460 (buf!2900 (_2!5467 lt!194286)))) (bvsge lt!194285 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123128 (= lt!194285 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123128 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123128 (= lt!194282 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!123128 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123128 (= lt!194284 (reader!0 (_2!5467 lt!193401) (_2!5467 lt!194286)))))

(declare-fun b!123129 () Bool)

(declare-fun res!102062 () Bool)

(assert (=> b!123129 (=> (not res!102062) (not e!80696))))

(declare-fun lt!194267 () (_ BitVec 64))

(declare-fun lt!194292 () (_ BitVec 64))

(assert (=> b!123129 (= res!102062 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194286))) (currentByte!5597 (_2!5467 lt!194286)) (currentBit!5592 (_2!5467 lt!194286))) (bvadd lt!194292 lt!194267)))))

(assert (=> b!123129 (or (not (= (bvand lt!194292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194267 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194292 lt!194267) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123129 (= lt!194267 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123129 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123129 (= lt!194292 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))))))

(assert (= (and d!39588 c!7356) b!123119))

(assert (= (and d!39588 (not c!7356)) b!123118))

(assert (= (and b!123119 res!102067) b!123127))

(assert (= (and b!123127 res!102063) b!123125))

(assert (= (and b!123125 res!102065) b!123117))

(assert (= (and b!123117 res!102068) b!123123))

(assert (= (and b!123119 res!102061) b!123124))

(assert (= (and b!123119 c!7355) b!123122))

(assert (= (and b!123119 (not c!7355)) b!123120))

(assert (= (or b!123125 b!123118) bm!1604))

(assert (= (and d!39588 res!102064) b!123129))

(assert (= (and b!123129 res!102062) b!123121))

(assert (= (and b!123121 res!102069) b!123128))

(assert (= (and b!123128 res!102066) b!123126))

(declare-fun m!187273 () Bool)

(assert (=> b!123126 m!187273))

(declare-fun m!187275 () Bool)

(assert (=> b!123118 m!187275))

(declare-fun m!187277 () Bool)

(assert (=> b!123128 m!187277))

(declare-fun m!187279 () Bool)

(assert (=> b!123128 m!187279))

(declare-fun m!187281 () Bool)

(assert (=> b!123128 m!187281))

(declare-fun m!187283 () Bool)

(assert (=> b!123128 m!187283))

(declare-fun m!187285 () Bool)

(assert (=> b!123128 m!187285))

(declare-fun m!187287 () Bool)

(assert (=> b!123129 m!187287))

(assert (=> b!123129 m!186641))

(declare-fun m!187289 () Bool)

(assert (=> b!123121 m!187289))

(declare-fun m!187291 () Bool)

(assert (=> b!123127 m!187291))

(assert (=> b!123127 m!186641))

(declare-fun m!187293 () Bool)

(assert (=> b!123117 m!187293))

(assert (=> b!123117 m!187293))

(declare-fun m!187295 () Bool)

(assert (=> b!123117 m!187295))

(declare-fun m!187297 () Bool)

(assert (=> b!123119 m!187297))

(declare-fun m!187299 () Bool)

(assert (=> b!123119 m!187299))

(assert (=> b!123119 m!186641))

(declare-fun m!187301 () Bool)

(assert (=> b!123119 m!187301))

(declare-fun m!187303 () Bool)

(assert (=> b!123119 m!187303))

(declare-fun m!187305 () Bool)

(assert (=> b!123119 m!187305))

(declare-fun m!187307 () Bool)

(assert (=> b!123119 m!187307))

(declare-fun m!187309 () Bool)

(assert (=> b!123119 m!187309))

(declare-fun m!187311 () Bool)

(assert (=> b!123119 m!187311))

(declare-fun m!187313 () Bool)

(assert (=> b!123119 m!187313))

(assert (=> b!123119 m!187305))

(declare-fun m!187315 () Bool)

(assert (=> b!123119 m!187315))

(declare-fun m!187317 () Bool)

(assert (=> b!123119 m!187317))

(declare-fun m!187319 () Bool)

(assert (=> b!123119 m!187319))

(declare-fun m!187321 () Bool)

(assert (=> b!123119 m!187321))

(declare-fun m!187323 () Bool)

(assert (=> b!123119 m!187323))

(declare-fun m!187325 () Bool)

(assert (=> b!123119 m!187325))

(declare-fun m!187327 () Bool)

(assert (=> b!123119 m!187327))

(declare-fun m!187329 () Bool)

(assert (=> b!123119 m!187329))

(declare-fun m!187331 () Bool)

(assert (=> b!123119 m!187331))

(declare-fun m!187333 () Bool)

(assert (=> b!123119 m!187333))

(declare-fun m!187335 () Bool)

(assert (=> b!123119 m!187335))

(declare-fun m!187337 () Bool)

(assert (=> b!123119 m!187337))

(declare-fun m!187339 () Bool)

(assert (=> b!123119 m!187339))

(declare-fun m!187341 () Bool)

(assert (=> b!123119 m!187341))

(declare-fun m!187343 () Bool)

(assert (=> b!123119 m!187343))

(declare-fun m!187345 () Bool)

(assert (=> b!123119 m!187345))

(assert (=> b!123119 m!187281))

(declare-fun m!187347 () Bool)

(assert (=> b!123119 m!187347))

(declare-fun m!187349 () Bool)

(assert (=> b!123119 m!187349))

(declare-fun m!187351 () Bool)

(assert (=> b!123123 m!187351))

(assert (=> b!123123 m!187291))

(declare-fun m!187353 () Bool)

(assert (=> bm!1604 m!187353))

(assert (=> b!122826 d!39588))

(declare-fun d!39648 () Bool)

(declare-fun e!80702 () Bool)

(assert (=> d!39648 e!80702))

(declare-fun res!102071 () Bool)

(assert (=> d!39648 (=> (not res!102071) (not e!80702))))

(declare-fun lt!194303 () (_ BitVec 64))

(declare-fun lt!194298 () (_ BitVec 64))

(declare-fun lt!194299 () (_ BitVec 64))

(assert (=> d!39648 (= res!102071 (= lt!194298 (bvsub lt!194299 lt!194303)))))

(assert (=> d!39648 (or (= (bvand lt!194299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194303 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194299 lt!194303) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39648 (= lt!194303 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193390)))) ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!193390))) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!193390)))))))

(declare-fun lt!194301 () (_ BitVec 64))

(declare-fun lt!194302 () (_ BitVec 64))

(assert (=> d!39648 (= lt!194299 (bvmul lt!194301 lt!194302))))

(assert (=> d!39648 (or (= lt!194301 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194302 (bvsdiv (bvmul lt!194301 lt!194302) lt!194301)))))

(assert (=> d!39648 (= lt!194302 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39648 (= lt!194301 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193390)))))))

(assert (=> d!39648 (= lt!194298 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!193390))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!193390)))))))

(assert (=> d!39648 (invariant!0 (currentBit!5592 (_1!5468 lt!193390)) (currentByte!5597 (_1!5468 lt!193390)) (size!2460 (buf!2900 (_1!5468 lt!193390))))))

(assert (=> d!39648 (= (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!193390))) (currentByte!5597 (_1!5468 lt!193390)) (currentBit!5592 (_1!5468 lt!193390))) lt!194298)))

(declare-fun b!123130 () Bool)

(declare-fun res!102070 () Bool)

(assert (=> b!123130 (=> (not res!102070) (not e!80702))))

(assert (=> b!123130 (= res!102070 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194298))))

(declare-fun b!123131 () Bool)

(declare-fun lt!194300 () (_ BitVec 64))

(assert (=> b!123131 (= e!80702 (bvsle lt!194298 (bvmul lt!194300 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123131 (or (= lt!194300 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194300 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194300)))))

(assert (=> b!123131 (= lt!194300 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193390)))))))

(assert (= (and d!39648 res!102071) b!123130))

(assert (= (and b!123130 res!102070) b!123131))

(declare-fun m!187355 () Bool)

(assert (=> d!39648 m!187355))

(declare-fun m!187357 () Bool)

(assert (=> d!39648 m!187357))

(assert (=> b!122826 d!39648))

(declare-fun d!39650 () Bool)

(declare-fun lt!194304 () tuple2!10418)

(assert (=> d!39650 (= lt!194304 (readBit!0 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305))))))

(assert (=> d!39650 (= (readBitPure!0 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305))) (tuple2!10407 (_2!5474 lt!194304) (_1!5474 lt!194304)))))

(declare-fun bs!9599 () Bool)

(assert (= bs!9599 d!39650))

(assert (=> bs!9599 m!186693))

(declare-fun m!187359 () Bool)

(assert (=> bs!9599 m!187359))

(assert (=> b!122834 d!39650))

(declare-fun d!39652 () Bool)

(declare-fun e!80705 () Bool)

(assert (=> d!39652 e!80705))

(declare-fun res!102075 () Bool)

(assert (=> d!39652 (=> (not res!102075) (not e!80705))))

(assert (=> d!39652 (= res!102075 (invariant!0 (currentBit!5592 (_2!5467 lt!193401)) (currentByte!5597 (_2!5467 lt!193401)) (size!2460 (buf!2900 (_2!5467 lt!193401)))))))

(assert (=> d!39652 (= (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305)) (BitStream!4395 (buf!2900 (_2!5467 lt!193401)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))))

(declare-fun b!123134 () Bool)

(assert (=> b!123134 (= e!80705 (invariant!0 (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305) (size!2460 (buf!2900 (_2!5467 lt!193401)))))))

(assert (= (and d!39652 res!102075) b!123134))

(assert (=> d!39652 m!186817))

(assert (=> b!123134 m!186689))

(assert (=> b!122834 d!39652))

(assert (=> b!122832 d!39546))

(assert (=> b!122832 d!39548))

(declare-fun d!39654 () Bool)

(assert (=> d!39654 (= (invariant!0 (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305) (size!2460 (buf!2900 (_2!5467 lt!193401)))) (and (bvsge (currentBit!5592 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5592 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5597 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5597 thiss!1305) (size!2460 (buf!2900 (_2!5467 lt!193401)))) (and (= (currentBit!5592 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5597 thiss!1305) (size!2460 (buf!2900 (_2!5467 lt!193401))))))))))

(assert (=> b!122831 d!39654))

(push 1)

(assert (not d!39528))

(assert (not b!122939))

(assert (not b!122876))

(assert (not b!123134))

(assert (not b!122921))

(assert (not b!123126))

(assert (not d!39558))

(assert (not d!39516))

(assert (not b!122932))

(assert (not d!39568))

(assert (not bm!1604))

(assert (not d!39552))

(assert (not b!122940))

(assert (not d!39548))

(assert (not d!39542))

(assert (not b!122918))

(assert (not b!122934))

(assert (not d!39520))

(assert (not d!39580))

(assert (not d!39560))

(assert (not d!39502))

(assert (not d!39578))

(assert (not b!122942))

(assert (not b!122933))

(assert (not d!39572))

(assert (not d!39564))

(assert (not d!39650))

(assert (not d!39566))

(assert (not b!123128))

(assert (not b!122874))

(assert (not d!39550))

(assert (not b!122944))

(assert (not d!39508))

(assert (not b!123127))

(assert (not d!39546))

(assert (not d!39652))

(assert (not b!123129))

(assert (not d!39648))

(assert (not b!122920))

(assert (not d!39586))

(assert (not b!122919))

(assert (not b!123119))

(assert (not b!122946))

(assert (not b!122941))

(assert (not b!123121))

(assert (not b!123123))

(assert (not d!39576))

(assert (not d!39570))

(assert (not b!123117))

(assert (not d!39582))

(assert (not d!39574))

(assert (not b!122935))

(assert (not d!39524))

(assert (not b!123118))

(assert (not d!39562))

(assert (not d!39556))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!39930 () Bool)

(assert (=> d!39930 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193401)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401))) lt!194285) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193401)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401)))) lt!194285))))

(declare-fun bs!9643 () Bool)

(assert (= bs!9643 d!39930))

(assert (=> bs!9643 m!186815))

(assert (=> b!123126 d!39930))

(declare-fun d!39932 () Bool)

(declare-fun e!80895 () Bool)

(assert (=> d!39932 e!80895))

(declare-fun res!102316 () Bool)

(assert (=> d!39932 (=> (not res!102316) (not e!80895))))

(declare-fun lt!194830 () (_ BitVec 64))

(declare-fun lt!194831 () (_ BitVec 64))

(declare-fun lt!194835 () (_ BitVec 64))

(assert (=> d!39932 (= res!102316 (= lt!194830 (bvsub lt!194831 lt!194835)))))

(assert (=> d!39932 (or (= (bvand lt!194831 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194835 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194831 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194831 lt!194835) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39932 (= lt!194835 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193595)))) ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!193595))) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!193595)))))))

(declare-fun lt!194833 () (_ BitVec 64))

(declare-fun lt!194834 () (_ BitVec 64))

(assert (=> d!39932 (= lt!194831 (bvmul lt!194833 lt!194834))))

(assert (=> d!39932 (or (= lt!194833 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194834 (bvsdiv (bvmul lt!194833 lt!194834) lt!194833)))))

(assert (=> d!39932 (= lt!194834 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39932 (= lt!194833 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193595)))))))

(assert (=> d!39932 (= lt!194830 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!193595))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!193595)))))))

(assert (=> d!39932 (invariant!0 (currentBit!5592 (_1!5468 lt!193595)) (currentByte!5597 (_1!5468 lt!193595)) (size!2460 (buf!2900 (_1!5468 lt!193595))))))

(assert (=> d!39932 (= (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!193595))) (currentByte!5597 (_1!5468 lt!193595)) (currentBit!5592 (_1!5468 lt!193595))) lt!194830)))

(declare-fun b!123425 () Bool)

(declare-fun res!102315 () Bool)

(assert (=> b!123425 (=> (not res!102315) (not e!80895))))

(assert (=> b!123425 (= res!102315 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194830))))

(declare-fun b!123426 () Bool)

(declare-fun lt!194832 () (_ BitVec 64))

(assert (=> b!123426 (= e!80895 (bvsle lt!194830 (bvmul lt!194832 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123426 (or (= lt!194832 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194832 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194832)))))

(assert (=> b!123426 (= lt!194832 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193595)))))))

(assert (= (and d!39932 res!102316) b!123425))

(assert (= (and b!123425 res!102315) b!123426))

(declare-fun m!188023 () Bool)

(assert (=> d!39932 m!188023))

(declare-fun m!188025 () Bool)

(assert (=> d!39932 m!188025))

(assert (=> d!39556 d!39932))

(declare-fun d!39934 () Bool)

(declare-fun e!80896 () Bool)

(assert (=> d!39934 e!80896))

(declare-fun res!102318 () Bool)

(assert (=> d!39934 (=> (not res!102318) (not e!80896))))

(declare-fun lt!194836 () (_ BitVec 64))

(declare-fun lt!194837 () (_ BitVec 64))

(declare-fun lt!194841 () (_ BitVec 64))

(assert (=> d!39934 (= res!102318 (= lt!194836 (bvsub lt!194837 lt!194841)))))

(assert (=> d!39934 (or (= (bvand lt!194837 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194841 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194837 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194837 lt!194841) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39934 (= lt!194841 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193593)))) ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!193593))) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!193593)))))))

(declare-fun lt!194839 () (_ BitVec 64))

(declare-fun lt!194840 () (_ BitVec 64))

(assert (=> d!39934 (= lt!194837 (bvmul lt!194839 lt!194840))))

(assert (=> d!39934 (or (= lt!194839 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194840 (bvsdiv (bvmul lt!194839 lt!194840) lt!194839)))))

(assert (=> d!39934 (= lt!194840 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39934 (= lt!194839 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193593)))))))

(assert (=> d!39934 (= lt!194836 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!193593))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!193593)))))))

(assert (=> d!39934 (invariant!0 (currentBit!5592 (_1!5468 lt!193593)) (currentByte!5597 (_1!5468 lt!193593)) (size!2460 (buf!2900 (_1!5468 lt!193593))))))

(assert (=> d!39934 (= (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!193593))) (currentByte!5597 (_1!5468 lt!193593)) (currentBit!5592 (_1!5468 lt!193593))) lt!194836)))

(declare-fun b!123427 () Bool)

(declare-fun res!102317 () Bool)

(assert (=> b!123427 (=> (not res!102317) (not e!80896))))

(assert (=> b!123427 (= res!102317 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194836))))

(declare-fun b!123428 () Bool)

(declare-fun lt!194838 () (_ BitVec 64))

(assert (=> b!123428 (= e!80896 (bvsle lt!194836 (bvmul lt!194838 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123428 (or (= lt!194838 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194838 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194838)))))

(assert (=> b!123428 (= lt!194838 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193593)))))))

(assert (= (and d!39934 res!102318) b!123427))

(assert (= (and b!123427 res!102317) b!123428))

(declare-fun m!188027 () Bool)

(assert (=> d!39934 m!188027))

(declare-fun m!188029 () Bool)

(assert (=> d!39934 m!188029))

(assert (=> d!39556 d!39934))

(declare-fun d!39936 () Bool)

(declare-fun e!80899 () Bool)

(assert (=> d!39936 e!80899))

(declare-fun res!102321 () Bool)

(assert (=> d!39936 (=> (not res!102321) (not e!80899))))

(declare-fun lt!194848 () tuple2!10406)

(declare-fun lt!194849 () tuple2!10406)

(assert (=> d!39936 (= res!102321 (= (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!194848))) (currentByte!5597 (_1!5468 lt!194848)) (currentBit!5592 (_1!5468 lt!194848))) (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!194849))) (currentByte!5597 (_1!5468 lt!194849)) (currentBit!5592 (_1!5468 lt!194849)))))))

(declare-fun lt!194850 () BitStream!4394)

(assert (=> d!39936 (= lt!194849 (readBitPure!0 lt!194850))))

(assert (=> d!39936 (= lt!194848 (readBitPure!0 lt!193404))))

(assert (=> d!39936 (= lt!194850 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 lt!193404) (currentBit!5592 lt!193404)))))

(assert (=> d!39936 (invariant!0 (currentBit!5592 lt!193404) (currentByte!5597 lt!193404) (size!2460 (buf!2900 (_2!5467 lt!193395))))))

(assert (=> d!39936 true))

(declare-fun _$9!63 () Unit!7559)

(assert (=> d!39936 (= (choose!50 lt!193404 (_2!5467 lt!193395) lt!193592 lt!193593 (tuple2!10407 (_1!5468 lt!193593) (_2!5468 lt!193593)) (_1!5468 lt!193593) (_2!5468 lt!193593) lt!193595 (tuple2!10407 (_1!5468 lt!193595) (_2!5468 lt!193595)) (_1!5468 lt!193595) (_2!5468 lt!193595)) _$9!63)))

(declare-fun b!123431 () Bool)

(assert (=> b!123431 (= e!80899 (= (_2!5468 lt!194848) (_2!5468 lt!194849)))))

(assert (= (and d!39936 res!102321) b!123431))

(assert (=> d!39936 m!186835))

(declare-fun m!188031 () Bool)

(assert (=> d!39936 m!188031))

(declare-fun m!188033 () Bool)

(assert (=> d!39936 m!188033))

(declare-fun m!188035 () Bool)

(assert (=> d!39936 m!188035))

(assert (=> d!39936 m!186685))

(assert (=> d!39556 d!39936))

(declare-fun d!39938 () Bool)

(declare-fun lt!194851 () tuple2!10418)

(assert (=> d!39938 (= lt!194851 (readBit!0 lt!193592))))

(assert (=> d!39938 (= (readBitPure!0 lt!193592) (tuple2!10407 (_2!5474 lt!194851) (_1!5474 lt!194851)))))

(declare-fun bs!9644 () Bool)

(assert (= bs!9644 d!39938))

(declare-fun m!188037 () Bool)

(assert (=> bs!9644 m!188037))

(assert (=> d!39556 d!39938))

(declare-fun d!39940 () Bool)

(assert (=> d!39940 (= (invariant!0 (currentBit!5592 lt!193404) (currentByte!5597 lt!193404) (size!2460 (buf!2900 (_2!5467 lt!193395)))) (and (bvsge (currentBit!5592 lt!193404) #b00000000000000000000000000000000) (bvslt (currentBit!5592 lt!193404) #b00000000000000000000000000001000) (bvsge (currentByte!5597 lt!193404) #b00000000000000000000000000000000) (or (bvslt (currentByte!5597 lt!193404) (size!2460 (buf!2900 (_2!5467 lt!193395)))) (and (= (currentBit!5592 lt!193404) #b00000000000000000000000000000000) (= (currentByte!5597 lt!193404) (size!2460 (buf!2900 (_2!5467 lt!193395))))))))))

(assert (=> d!39556 d!39940))

(assert (=> d!39556 d!39570))

(declare-fun d!39942 () Bool)

(declare-fun e!80900 () Bool)

(assert (=> d!39942 e!80900))

(declare-fun res!102322 () Bool)

(assert (=> d!39942 (=> (not res!102322) (not e!80900))))

(declare-fun lt!194853 () (_ BitVec 64))

(declare-fun lt!194852 () BitStream!4394)

(assert (=> d!39942 (= res!102322 (= (bvadd lt!194853 (bvsub lt!193650 lt!193653)) (bitIndex!0 (size!2460 (buf!2900 lt!194852)) (currentByte!5597 lt!194852) (currentBit!5592 lt!194852))))))

(assert (=> d!39942 (or (not (= (bvand lt!194853 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193650 lt!193653) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194853 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194853 (bvsub lt!193650 lt!193653)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39942 (= lt!194853 (bitIndex!0 (size!2460 (buf!2900 (_2!5466 lt!193663))) (currentByte!5597 (_2!5466 lt!193663)) (currentBit!5592 (_2!5466 lt!193663))))))

(assert (=> d!39942 (= lt!194852 (_2!5467 (moveBitIndex!0 (_2!5466 lt!193663) (bvsub lt!193650 lt!193653))))))

(assert (=> d!39942 (moveBitIndexPrecond!0 (_2!5466 lt!193663) (bvsub lt!193650 lt!193653))))

(assert (=> d!39942 (= (withMovedBitIndex!0 (_2!5466 lt!193663) (bvsub lt!193650 lt!193653)) lt!194852)))

(declare-fun b!123432 () Bool)

(assert (=> b!123432 (= e!80900 (= (size!2460 (buf!2900 (_2!5466 lt!193663))) (size!2460 (buf!2900 lt!194852))))))

(assert (= (and d!39942 res!102322) b!123432))

(declare-fun m!188039 () Bool)

(assert (=> d!39942 m!188039))

(declare-fun m!188041 () Bool)

(assert (=> d!39942 m!188041))

(declare-fun m!188043 () Bool)

(assert (=> d!39942 m!188043))

(declare-fun m!188045 () Bool)

(assert (=> d!39942 m!188045))

(assert (=> b!122933 d!39942))

(assert (=> b!122933 d!39520))

(assert (=> b!122933 d!39548))

(declare-fun d!39944 () Bool)

(declare-fun e!80907 () Bool)

(assert (=> d!39944 e!80907))

(declare-fun res!102325 () Bool)

(assert (=> d!39944 (=> (not res!102325) (not e!80907))))

(declare-fun increaseBitIndex!0 (BitStream!4394) tuple2!10404)

(assert (=> d!39944 (= res!102325 (= (buf!2900 (_2!5467 (increaseBitIndex!0 (_1!5466 lt!193409)))) (buf!2900 (_1!5466 lt!193409))))))

(declare-fun lt!194869 () Bool)

(assert (=> d!39944 (= lt!194869 (not (= (bvand ((_ sign_extend 24) (select (arr!3053 (buf!2900 (_1!5466 lt!193409))) (currentByte!5597 (_1!5466 lt!193409)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5592 (_1!5466 lt!193409))))) #b00000000000000000000000000000000)))))

(declare-fun lt!194872 () tuple2!10418)

(assert (=> d!39944 (= lt!194872 (tuple2!10419 (not (= (bvand ((_ sign_extend 24) (select (arr!3053 (buf!2900 (_1!5466 lt!193409))) (currentByte!5597 (_1!5466 lt!193409)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5592 (_1!5466 lt!193409))))) #b00000000000000000000000000000000)) (_2!5467 (increaseBitIndex!0 (_1!5466 lt!193409)))))))

(assert (=> d!39944 (validate_offset_bit!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5466 lt!193409)))) ((_ sign_extend 32) (currentByte!5597 (_1!5466 lt!193409))) ((_ sign_extend 32) (currentBit!5592 (_1!5466 lt!193409))))))

(assert (=> d!39944 (= (readBit!0 (_1!5466 lt!193409)) lt!194872)))

(declare-fun lt!194873 () (_ BitVec 64))

(declare-fun lt!194868 () (_ BitVec 64))

(declare-fun b!123435 () Bool)

(assert (=> b!123435 (= e!80907 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5467 (increaseBitIndex!0 (_1!5466 lt!193409))))) (currentByte!5597 (_2!5467 (increaseBitIndex!0 (_1!5466 lt!193409)))) (currentBit!5592 (_2!5467 (increaseBitIndex!0 (_1!5466 lt!193409))))) (bvadd lt!194868 lt!194873)))))

(assert (=> b!123435 (or (not (= (bvand lt!194868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194873 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194868 lt!194873) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123435 (= lt!194873 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!123435 (= lt!194868 (bitIndex!0 (size!2460 (buf!2900 (_1!5466 lt!193409))) (currentByte!5597 (_1!5466 lt!193409)) (currentBit!5592 (_1!5466 lt!193409))))))

(declare-fun lt!194871 () Bool)

(assert (=> b!123435 (= lt!194871 (not (= (bvand ((_ sign_extend 24) (select (arr!3053 (buf!2900 (_1!5466 lt!193409))) (currentByte!5597 (_1!5466 lt!193409)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5592 (_1!5466 lt!193409))))) #b00000000000000000000000000000000)))))

(declare-fun lt!194874 () Bool)

(assert (=> b!123435 (= lt!194874 (not (= (bvand ((_ sign_extend 24) (select (arr!3053 (buf!2900 (_1!5466 lt!193409))) (currentByte!5597 (_1!5466 lt!193409)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5592 (_1!5466 lt!193409))))) #b00000000000000000000000000000000)))))

(declare-fun lt!194870 () Bool)

(assert (=> b!123435 (= lt!194870 (not (= (bvand ((_ sign_extend 24) (select (arr!3053 (buf!2900 (_1!5466 lt!193409))) (currentByte!5597 (_1!5466 lt!193409)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5592 (_1!5466 lt!193409))))) #b00000000000000000000000000000000)))))

(assert (= (and d!39944 res!102325) b!123435))

(declare-fun m!188047 () Bool)

(assert (=> d!39944 m!188047))

(declare-fun m!188049 () Bool)

(assert (=> d!39944 m!188049))

(declare-fun m!188051 () Bool)

(assert (=> d!39944 m!188051))

(declare-fun m!188053 () Bool)

(assert (=> d!39944 m!188053))

(assert (=> b!123435 m!188051))

(assert (=> b!123435 m!186803))

(assert (=> b!123435 m!188049))

(assert (=> b!123435 m!188047))

(declare-fun m!188055 () Bool)

(assert (=> b!123435 m!188055))

(assert (=> d!39580 d!39944))

(declare-fun b!123436 () Bool)

(declare-fun res!102327 () Bool)

(declare-fun e!80909 () Bool)

(assert (=> b!123436 (=> (not res!102327) (not e!80909))))

(declare-fun lt!194890 () tuple2!10402)

(assert (=> b!123436 (= res!102327 (isPrefixOf!0 (_2!5466 lt!194890) (_2!5467 lt!194286)))))

(declare-fun lt!194877 () (_ BitVec 64))

(declare-fun lt!194880 () (_ BitVec 64))

(declare-fun b!123437 () Bool)

(assert (=> b!123437 (= e!80909 (= (_1!5466 lt!194890) (withMovedBitIndex!0 (_2!5466 lt!194890) (bvsub lt!194877 lt!194880))))))

(assert (=> b!123437 (or (= (bvand lt!194877 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194880 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194877 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194877 lt!194880) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123437 (= lt!194880 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194286))) (currentByte!5597 (_2!5467 lt!194286)) (currentBit!5592 (_2!5467 lt!194286))))))

(assert (=> b!123437 (= lt!194877 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))))))

(declare-fun b!123438 () Bool)

(declare-fun res!102326 () Bool)

(assert (=> b!123438 (=> (not res!102326) (not e!80909))))

(assert (=> b!123438 (= res!102326 (isPrefixOf!0 (_1!5466 lt!194890) (_2!5467 lt!193401)))))

(declare-fun b!123439 () Bool)

(declare-fun e!80908 () Unit!7559)

(declare-fun lt!194883 () Unit!7559)

(assert (=> b!123439 (= e!80908 lt!194883)))

(declare-fun lt!194876 () (_ BitVec 64))

(assert (=> b!123439 (= lt!194876 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!194882 () (_ BitVec 64))

(assert (=> b!123439 (= lt!194882 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))))))

(assert (=> b!123439 (= lt!194883 (arrayBitRangesEqSymmetric!0 (buf!2900 (_2!5467 lt!193401)) (buf!2900 (_2!5467 lt!194286)) lt!194876 lt!194882))))

(assert (=> b!123439 (arrayBitRangesEq!0 (buf!2900 (_2!5467 lt!194286)) (buf!2900 (_2!5467 lt!193401)) lt!194876 lt!194882)))

(declare-fun d!39946 () Bool)

(assert (=> d!39946 e!80909))

(declare-fun res!102328 () Bool)

(assert (=> d!39946 (=> (not res!102328) (not e!80909))))

(assert (=> d!39946 (= res!102328 (isPrefixOf!0 (_1!5466 lt!194890) (_2!5466 lt!194890)))))

(declare-fun lt!194878 () BitStream!4394)

(assert (=> d!39946 (= lt!194890 (tuple2!10403 lt!194878 (_2!5467 lt!194286)))))

(declare-fun lt!194875 () Unit!7559)

(declare-fun lt!194886 () Unit!7559)

(assert (=> d!39946 (= lt!194875 lt!194886)))

(assert (=> d!39946 (isPrefixOf!0 lt!194878 (_2!5467 lt!194286))))

(assert (=> d!39946 (= lt!194886 (lemmaIsPrefixTransitive!0 lt!194878 (_2!5467 lt!194286) (_2!5467 lt!194286)))))

(declare-fun lt!194881 () Unit!7559)

(declare-fun lt!194889 () Unit!7559)

(assert (=> d!39946 (= lt!194881 lt!194889)))

(assert (=> d!39946 (isPrefixOf!0 lt!194878 (_2!5467 lt!194286))))

(assert (=> d!39946 (= lt!194889 (lemmaIsPrefixTransitive!0 lt!194878 (_2!5467 lt!193401) (_2!5467 lt!194286)))))

(declare-fun lt!194884 () Unit!7559)

(assert (=> d!39946 (= lt!194884 e!80908)))

(declare-fun c!7380 () Bool)

(assert (=> d!39946 (= c!7380 (not (= (size!2460 (buf!2900 (_2!5467 lt!193401))) #b00000000000000000000000000000000)))))

(declare-fun lt!194893 () Unit!7559)

(declare-fun lt!194894 () Unit!7559)

(assert (=> d!39946 (= lt!194893 lt!194894)))

(assert (=> d!39946 (isPrefixOf!0 (_2!5467 lt!194286) (_2!5467 lt!194286))))

(assert (=> d!39946 (= lt!194894 (lemmaIsPrefixRefl!0 (_2!5467 lt!194286)))))

(declare-fun lt!194892 () Unit!7559)

(declare-fun lt!194887 () Unit!7559)

(assert (=> d!39946 (= lt!194892 lt!194887)))

(assert (=> d!39946 (= lt!194887 (lemmaIsPrefixRefl!0 (_2!5467 lt!194286)))))

(declare-fun lt!194879 () Unit!7559)

(declare-fun lt!194888 () Unit!7559)

(assert (=> d!39946 (= lt!194879 lt!194888)))

(assert (=> d!39946 (isPrefixOf!0 lt!194878 lt!194878)))

(assert (=> d!39946 (= lt!194888 (lemmaIsPrefixRefl!0 lt!194878))))

(declare-fun lt!194891 () Unit!7559)

(declare-fun lt!194885 () Unit!7559)

(assert (=> d!39946 (= lt!194891 lt!194885)))

(assert (=> d!39946 (isPrefixOf!0 (_2!5467 lt!193401) (_2!5467 lt!193401))))

(assert (=> d!39946 (= lt!194885 (lemmaIsPrefixRefl!0 (_2!5467 lt!193401)))))

(assert (=> d!39946 (= lt!194878 (BitStream!4395 (buf!2900 (_2!5467 lt!194286)) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))))))

(assert (=> d!39946 (isPrefixOf!0 (_2!5467 lt!193401) (_2!5467 lt!194286))))

(assert (=> d!39946 (= (reader!0 (_2!5467 lt!193401) (_2!5467 lt!194286)) lt!194890)))

(declare-fun b!123440 () Bool)

(declare-fun Unit!7612 () Unit!7559)

(assert (=> b!123440 (= e!80908 Unit!7612)))

(assert (= (and d!39946 c!7380) b!123439))

(assert (= (and d!39946 (not c!7380)) b!123440))

(assert (= (and d!39946 res!102328) b!123438))

(assert (= (and b!123438 res!102326) b!123436))

(assert (= (and b!123436 res!102327) b!123437))

(declare-fun m!188057 () Bool)

(assert (=> b!123437 m!188057))

(assert (=> b!123437 m!187287))

(assert (=> b!123437 m!186641))

(declare-fun m!188059 () Bool)

(assert (=> b!123438 m!188059))

(declare-fun m!188061 () Bool)

(assert (=> d!39946 m!188061))

(declare-fun m!188063 () Bool)

(assert (=> d!39946 m!188063))

(declare-fun m!188065 () Bool)

(assert (=> d!39946 m!188065))

(assert (=> d!39946 m!186909))

(declare-fun m!188067 () Bool)

(assert (=> d!39946 m!188067))

(assert (=> d!39946 m!187289))

(assert (=> d!39946 m!186915))

(declare-fun m!188069 () Bool)

(assert (=> d!39946 m!188069))

(declare-fun m!188071 () Bool)

(assert (=> d!39946 m!188071))

(declare-fun m!188073 () Bool)

(assert (=> d!39946 m!188073))

(declare-fun m!188075 () Bool)

(assert (=> d!39946 m!188075))

(declare-fun m!188077 () Bool)

(assert (=> b!123436 m!188077))

(assert (=> b!123439 m!186641))

(declare-fun m!188079 () Bool)

(assert (=> b!123439 m!188079))

(declare-fun m!188081 () Bool)

(assert (=> b!123439 m!188081))

(assert (=> b!123128 d!39946))

(declare-fun d!39948 () Bool)

(assert (=> d!39948 (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194286)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401))) lt!194285)))

(declare-fun lt!194895 () Unit!7559)

(assert (=> d!39948 (= lt!194895 (choose!9 (_2!5467 lt!193401) (buf!2900 (_2!5467 lt!194286)) lt!194285 (BitStream!4395 (buf!2900 (_2!5467 lt!194286)) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401)))))))

(assert (=> d!39948 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5467 lt!193401) (buf!2900 (_2!5467 lt!194286)) lt!194285) lt!194895)))

(declare-fun bs!9645 () Bool)

(assert (= bs!9645 d!39948))

(assert (=> bs!9645 m!187283))

(declare-fun m!188083 () Bool)

(assert (=> bs!9645 m!188083))

(assert (=> b!123128 d!39948))

(declare-fun d!39950 () Bool)

(assert (=> d!39950 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194286)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401))) lt!194285) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194286)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401)))) lt!194285))))

(declare-fun bs!9646 () Bool)

(assert (= bs!9646 d!39950))

(declare-fun m!188085 () Bool)

(assert (=> bs!9646 m!188085))

(assert (=> b!123128 d!39950))

(declare-fun d!39952 () Bool)

(assert (=> d!39952 (= (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!123128 d!39952))

(declare-fun d!39954 () Bool)

(declare-fun lt!194896 () tuple2!10412)

(assert (=> d!39954 (= lt!194896 (readNLeastSignificantBitsLoop!0 (_1!5466 lt!194284) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!194282))))

(assert (=> d!39954 (= (readNLeastSignificantBitsLoopPure!0 (_1!5466 lt!194284) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!194282) (tuple2!10401 (_2!5471 lt!194896) (_1!5471 lt!194896)))))

(declare-fun bs!9647 () Bool)

(assert (= bs!9647 d!39954))

(declare-fun m!188087 () Bool)

(assert (=> bs!9647 m!188087))

(assert (=> b!123128 d!39954))

(declare-fun d!39956 () Bool)

(assert (=> d!39956 (= (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193395)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193395))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193395)))) (bvsub (bvmul ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193395)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193395))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193395))))))))

(assert (=> d!39520 d!39956))

(declare-fun d!39958 () Bool)

(assert (=> d!39958 (= (invariant!0 (currentBit!5592 (_2!5467 lt!193395)) (currentByte!5597 (_2!5467 lt!193395)) (size!2460 (buf!2900 (_2!5467 lt!193395)))) (and (bvsge (currentBit!5592 (_2!5467 lt!193395)) #b00000000000000000000000000000000) (bvslt (currentBit!5592 (_2!5467 lt!193395)) #b00000000000000000000000000001000) (bvsge (currentByte!5597 (_2!5467 lt!193395)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5597 (_2!5467 lt!193395)) (size!2460 (buf!2900 (_2!5467 lt!193395)))) (and (= (currentBit!5592 (_2!5467 lt!193395)) #b00000000000000000000000000000000) (= (currentByte!5597 (_2!5467 lt!193395)) (size!2460 (buf!2900 (_2!5467 lt!193395))))))))))

(assert (=> d!39520 d!39958))

(declare-fun d!39960 () Bool)

(assert (=> d!39960 (= (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193395)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401)))) (bvsub (bvmul ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193395)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401))))))))

(assert (=> d!39566 d!39960))

(declare-fun d!39962 () Bool)

(declare-fun e!80910 () Bool)

(assert (=> d!39962 e!80910))

(declare-fun res!102329 () Bool)

(assert (=> d!39962 (=> (not res!102329) (not e!80910))))

(declare-fun lt!194898 () (_ BitVec 64))

(declare-fun lt!194897 () BitStream!4394)

(assert (=> d!39962 (= res!102329 (= (bvadd lt!194898 (bvsub lt!193685 lt!193688)) (bitIndex!0 (size!2460 (buf!2900 lt!194897)) (currentByte!5597 lt!194897) (currentBit!5592 lt!194897))))))

(assert (=> d!39962 (or (not (= (bvand lt!194898 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193685 lt!193688) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194898 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194898 (bvsub lt!193685 lt!193688)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39962 (= lt!194898 (bitIndex!0 (size!2460 (buf!2900 (_2!5466 lt!193698))) (currentByte!5597 (_2!5466 lt!193698)) (currentBit!5592 (_2!5466 lt!193698))))))

(assert (=> d!39962 (= lt!194897 (_2!5467 (moveBitIndex!0 (_2!5466 lt!193698) (bvsub lt!193685 lt!193688))))))

(assert (=> d!39962 (moveBitIndexPrecond!0 (_2!5466 lt!193698) (bvsub lt!193685 lt!193688))))

(assert (=> d!39962 (= (withMovedBitIndex!0 (_2!5466 lt!193698) (bvsub lt!193685 lt!193688)) lt!194897)))

(declare-fun b!123441 () Bool)

(assert (=> b!123441 (= e!80910 (= (size!2460 (buf!2900 (_2!5466 lt!193698))) (size!2460 (buf!2900 lt!194897))))))

(assert (= (and d!39962 res!102329) b!123441))

(declare-fun m!188089 () Bool)

(assert (=> d!39962 m!188089))

(declare-fun m!188091 () Bool)

(assert (=> d!39962 m!188091))

(declare-fun m!188093 () Bool)

(assert (=> d!39962 m!188093))

(declare-fun m!188095 () Bool)

(assert (=> d!39962 m!188095))

(assert (=> b!122940 d!39962))

(assert (=> b!122940 d!39520))

(assert (=> b!122940 d!39546))

(declare-fun d!39964 () Bool)

(declare-fun e!80911 () Bool)

(assert (=> d!39964 e!80911))

(declare-fun res!102331 () Bool)

(assert (=> d!39964 (=> (not res!102331) (not e!80911))))

(declare-fun lt!194900 () (_ BitVec 64))

(declare-fun lt!194899 () (_ BitVec 64))

(declare-fun lt!194904 () (_ BitVec 64))

(assert (=> d!39964 (= res!102331 (= lt!194899 (bvsub lt!194900 lt!194904)))))

(assert (=> d!39964 (or (= (bvand lt!194900 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194904 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194900 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194900 lt!194904) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39964 (= lt!194904 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193604)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193604))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193604)))))))

(declare-fun lt!194902 () (_ BitVec 64))

(declare-fun lt!194903 () (_ BitVec 64))

(assert (=> d!39964 (= lt!194900 (bvmul lt!194902 lt!194903))))

(assert (=> d!39964 (or (= lt!194902 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194903 (bvsdiv (bvmul lt!194902 lt!194903) lt!194902)))))

(assert (=> d!39964 (= lt!194903 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39964 (= lt!194902 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193604)))))))

(assert (=> d!39964 (= lt!194899 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193604))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193604)))))))

(assert (=> d!39964 (invariant!0 (currentBit!5592 (_2!5467 lt!193604)) (currentByte!5597 (_2!5467 lt!193604)) (size!2460 (buf!2900 (_2!5467 lt!193604))))))

(assert (=> d!39964 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193604))) (currentByte!5597 (_2!5467 lt!193604)) (currentBit!5592 (_2!5467 lt!193604))) lt!194899)))

(declare-fun b!123442 () Bool)

(declare-fun res!102330 () Bool)

(assert (=> b!123442 (=> (not res!102330) (not e!80911))))

(assert (=> b!123442 (= res!102330 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194899))))

(declare-fun b!123443 () Bool)

(declare-fun lt!194901 () (_ BitVec 64))

(assert (=> b!123443 (= e!80911 (bvsle lt!194899 (bvmul lt!194901 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123443 (or (= lt!194901 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194901 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194901)))))

(assert (=> b!123443 (= lt!194901 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193604)))))))

(assert (= (and d!39964 res!102331) b!123442))

(assert (= (and b!123442 res!102330) b!123443))

(declare-fun m!188097 () Bool)

(assert (=> d!39964 m!188097))

(declare-fun m!188099 () Bool)

(assert (=> d!39964 m!188099))

(assert (=> b!122918 d!39964))

(assert (=> b!122918 d!39548))

(declare-fun b!123458 () Bool)

(declare-fun e!80918 () Bool)

(declare-fun e!80919 () Bool)

(assert (=> b!123458 (= e!80918 e!80919)))

(declare-fun res!102343 () Bool)

(assert (=> b!123458 (=> res!102343 e!80919)))

(assert (=> b!123458 (= res!102343 (bvsge i!615 nBits!396))))

(declare-fun lt!194927 () tuple2!10412)

(declare-fun lt!194923 () (_ BitVec 64))

(declare-fun b!123459 () Bool)

(assert (=> b!123459 (= e!80919 (= (= (bvand (bvlshr (_1!5471 lt!194927) lt!194923) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!5468 (readBitPure!0 (_1!5466 lt!193409)))))))

(assert (=> b!123459 (and (bvsge lt!194923 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!194923 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!194925 () (_ BitVec 32))

(assert (=> b!123459 (= lt!194923 ((_ sign_extend 32) (bvsub lt!194925 i!615)))))

(assert (=> b!123459 (or (= (bvand lt!194925 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand lt!194925 #b10000000000000000000000000000000) (bvand (bvsub lt!194925 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!123459 (= lt!194925 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!123459 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!123460 () Bool)

(declare-fun res!102342 () Bool)

(assert (=> b!123460 (=> (not res!102342) (not e!80918))))

(declare-fun lt!194926 () (_ BitVec 64))

(declare-fun lt!194931 () (_ BitVec 64))

(assert (=> b!123460 (= res!102342 (= (bvlshr (_1!5471 lt!194927) lt!194926) (bvlshr lt!193388 lt!194931)))))

(assert (=> b!123460 (and (bvsge lt!194931 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!194931 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!123460 (= lt!194931 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!123460 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!123460 (and (bvsge lt!194926 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!194926 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!123460 (= lt!194926 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!123460 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(declare-fun b!123461 () Bool)

(declare-fun e!80920 () tuple2!10412)

(declare-fun lt!194928 () tuple2!10412)

(assert (=> b!123461 (= e!80920 (tuple2!10413 (_1!5471 lt!194928) (_2!5471 lt!194928)))))

(declare-fun lt!194929 () tuple2!10418)

(assert (=> b!123461 (= lt!194929 (readBit!0 (_1!5466 lt!193409)))))

(assert (=> b!123461 (= lt!194928 (readNLeastSignificantBitsLoop!0 (_2!5474 lt!194929) nBits!396 (bvadd i!615 #b00000000000000000000000000000001) (bvor lt!193388 (ite (_1!5474 lt!194929) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!123462 () Bool)

(declare-fun res!102344 () Bool)

(assert (=> b!123462 (=> (not res!102344) (not e!80918))))

(declare-fun lt!194924 () (_ BitVec 64))

(declare-fun lt!194930 () (_ BitVec 64))

(assert (=> b!123462 (= res!102344 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5471 lt!194927))) (currentByte!5597 (_2!5471 lt!194927)) (currentBit!5592 (_2!5471 lt!194927))) (bvadd lt!194924 lt!194930)))))

(assert (=> b!123462 (or (not (= (bvand lt!194924 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194930 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194924 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194924 lt!194930) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123462 (= lt!194930 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!123462 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!123462 (= lt!194924 (bitIndex!0 (size!2460 (buf!2900 (_1!5466 lt!193409))) (currentByte!5597 (_1!5466 lt!193409)) (currentBit!5592 (_1!5466 lt!193409))))))

(declare-fun b!123463 () Bool)

(assert (=> b!123463 (= e!80920 (tuple2!10413 lt!193388 (_1!5466 lt!193409)))))

(declare-fun d!39966 () Bool)

(assert (=> d!39966 e!80918))

(declare-fun res!102345 () Bool)

(assert (=> d!39966 (=> (not res!102345) (not e!80918))))

(assert (=> d!39966 (= res!102345 (= (buf!2900 (_2!5471 lt!194927)) (buf!2900 (_1!5466 lt!193409))))))

(assert (=> d!39966 (= lt!194927 e!80920)))

(declare-fun c!7383 () Bool)

(assert (=> d!39966 (= c!7383 (= nBits!396 i!615))))

(assert (=> d!39966 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!39966 (= (readNLeastSignificantBitsLoop!0 (_1!5466 lt!193409) nBits!396 i!615 lt!193388) lt!194927)))

(declare-fun b!123464 () Bool)

(declare-fun res!102346 () Bool)

(assert (=> b!123464 (=> (not res!102346) (not e!80918))))

(assert (=> b!123464 (= res!102346 (= (bvand (_1!5471 lt!194927) (onesLSBLong!0 nBits!396)) (_1!5471 lt!194927)))))

(assert (= (and d!39966 c!7383) b!123463))

(assert (= (and d!39966 (not c!7383)) b!123461))

(assert (= (and d!39966 res!102345) b!123462))

(assert (= (and b!123462 res!102344) b!123460))

(assert (= (and b!123460 res!102342) b!123464))

(assert (= (and b!123464 res!102346) b!123458))

(assert (= (and b!123458 (not res!102343)) b!123459))

(assert (=> b!123459 m!186681))

(assert (=> b!123461 m!186935))

(declare-fun m!188101 () Bool)

(assert (=> b!123461 m!188101))

(declare-fun m!188103 () Bool)

(assert (=> b!123462 m!188103))

(assert (=> b!123462 m!186803))

(assert (=> b!123464 m!186639))

(assert (=> d!39578 d!39966))

(assert (=> b!122942 d!39546))

(declare-fun d!39968 () Bool)

(assert (=> d!39968 (arrayBitRangesEq!0 (buf!2900 (_2!5467 lt!193395)) (buf!2900 (_2!5467 lt!193401)) lt!193684 lt!193690)))

(declare-fun lt!194934 () Unit!7559)

(declare-fun choose!8 (array!5436 array!5436 (_ BitVec 64) (_ BitVec 64)) Unit!7559)

(assert (=> d!39968 (= lt!194934 (choose!8 (buf!2900 (_2!5467 lt!193401)) (buf!2900 (_2!5467 lt!193395)) lt!193684 lt!193690))))

(assert (=> d!39968 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!193684) (bvsle lt!193684 lt!193690))))

(assert (=> d!39968 (= (arrayBitRangesEqSymmetric!0 (buf!2900 (_2!5467 lt!193401)) (buf!2900 (_2!5467 lt!193395)) lt!193684 lt!193690) lt!194934)))

(declare-fun bs!9648 () Bool)

(assert (= bs!9648 d!39968))

(assert (=> bs!9648 m!186927))

(declare-fun m!188105 () Bool)

(assert (=> bs!9648 m!188105))

(assert (=> b!122942 d!39968))

(declare-fun d!39970 () Bool)

(declare-fun res!102357 () Bool)

(declare-fun e!80936 () Bool)

(assert (=> d!39970 (=> res!102357 e!80936)))

(assert (=> d!39970 (= res!102357 (bvsge lt!193684 lt!193690))))

(assert (=> d!39970 (= (arrayBitRangesEq!0 (buf!2900 (_2!5467 lt!193395)) (buf!2900 (_2!5467 lt!193401)) lt!193684 lt!193690) e!80936)))

(declare-fun e!80935 () Bool)

(declare-fun b!123479 () Bool)

(declare-datatypes ((tuple4!90 0))(
  ( (tuple4!91 (_1!5476 (_ BitVec 32)) (_2!5476 (_ BitVec 32)) (_3!266 (_ BitVec 32)) (_4!45 (_ BitVec 32))) )
))
(declare-fun lt!194943 () tuple4!90)

(declare-fun arrayRangesEq!46 (array!5436 array!5436 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!123479 (= e!80935 (arrayRangesEq!46 (buf!2900 (_2!5467 lt!193395)) (buf!2900 (_2!5467 lt!193401)) (_1!5476 lt!194943) (_2!5476 lt!194943)))))

(declare-fun b!123480 () Bool)

(declare-fun e!80934 () Bool)

(declare-fun call!1617 () Bool)

(assert (=> b!123480 (= e!80934 call!1617)))

(declare-fun b!123481 () Bool)

(declare-fun res!102361 () Bool)

(declare-fun lt!194942 () (_ BitVec 32))

(assert (=> b!123481 (= res!102361 (= lt!194942 #b00000000000000000000000000000000))))

(declare-fun e!80937 () Bool)

(assert (=> b!123481 (=> res!102361 e!80937)))

(declare-fun e!80933 () Bool)

(assert (=> b!123481 (= e!80933 e!80937)))

(declare-fun bm!1614 () Bool)

(declare-fun lt!194941 () (_ BitVec 32))

(declare-fun c!7386 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1614 (= call!1617 (byteRangesEq!0 (ite c!7386 (select (arr!3053 (buf!2900 (_2!5467 lt!193395))) (_3!266 lt!194943)) (select (arr!3053 (buf!2900 (_2!5467 lt!193395))) (_4!45 lt!194943))) (ite c!7386 (select (arr!3053 (buf!2900 (_2!5467 lt!193401))) (_3!266 lt!194943)) (select (arr!3053 (buf!2900 (_2!5467 lt!193401))) (_4!45 lt!194943))) (ite c!7386 lt!194941 #b00000000000000000000000000000000) lt!194942))))

(declare-fun b!123482 () Bool)

(declare-fun e!80938 () Bool)

(assert (=> b!123482 (= e!80938 e!80934)))

(assert (=> b!123482 (= c!7386 (= (_3!266 lt!194943) (_4!45 lt!194943)))))

(declare-fun b!123483 () Bool)

(assert (=> b!123483 (= e!80934 e!80933)))

(declare-fun res!102358 () Bool)

(assert (=> b!123483 (= res!102358 (byteRangesEq!0 (select (arr!3053 (buf!2900 (_2!5467 lt!193395))) (_3!266 lt!194943)) (select (arr!3053 (buf!2900 (_2!5467 lt!193401))) (_3!266 lt!194943)) lt!194941 #b00000000000000000000000000001000))))

(assert (=> b!123483 (=> (not res!102358) (not e!80933))))

(declare-fun b!123484 () Bool)

(assert (=> b!123484 (= e!80937 call!1617)))

(declare-fun b!123485 () Bool)

(assert (=> b!123485 (= e!80936 e!80938)))

(declare-fun res!102359 () Bool)

(assert (=> b!123485 (=> (not res!102359) (not e!80938))))

(assert (=> b!123485 (= res!102359 e!80935)))

(declare-fun res!102360 () Bool)

(assert (=> b!123485 (=> res!102360 e!80935)))

(assert (=> b!123485 (= res!102360 (bvsge (_1!5476 lt!194943) (_2!5476 lt!194943)))))

(assert (=> b!123485 (= lt!194942 ((_ extract 31 0) (bvsrem lt!193690 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123485 (= lt!194941 ((_ extract 31 0) (bvsrem lt!193684 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!90)

(assert (=> b!123485 (= lt!194943 (arrayBitIndices!0 lt!193684 lt!193690))))

(assert (= (and d!39970 (not res!102357)) b!123485))

(assert (= (and b!123485 (not res!102360)) b!123479))

(assert (= (and b!123485 res!102359) b!123482))

(assert (= (and b!123482 c!7386) b!123480))

(assert (= (and b!123482 (not c!7386)) b!123483))

(assert (= (and b!123483 res!102358) b!123481))

(assert (= (and b!123481 (not res!102361)) b!123484))

(assert (= (or b!123480 b!123484) bm!1614))

(declare-fun m!188107 () Bool)

(assert (=> b!123479 m!188107))

(declare-fun m!188109 () Bool)

(assert (=> bm!1614 m!188109))

(declare-fun m!188111 () Bool)

(assert (=> bm!1614 m!188111))

(declare-fun m!188113 () Bool)

(assert (=> bm!1614 m!188113))

(declare-fun m!188115 () Bool)

(assert (=> bm!1614 m!188115))

(declare-fun m!188117 () Bool)

(assert (=> bm!1614 m!188117))

(assert (=> b!123483 m!188109))

(assert (=> b!123483 m!188111))

(assert (=> b!123483 m!188109))

(assert (=> b!123483 m!188111))

(declare-fun m!188119 () Bool)

(assert (=> b!123483 m!188119))

(declare-fun m!188121 () Bool)

(assert (=> b!123485 m!188121))

(assert (=> b!122942 d!39970))

(declare-fun d!39972 () Bool)

(declare-fun lt!194944 () tuple2!10418)

(assert (=> d!39972 (= lt!194944 (readBit!0 (readerFrom!0 (_2!5467 lt!193604) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305))))))

(assert (=> d!39972 (= (readBitPure!0 (readerFrom!0 (_2!5467 lt!193604) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305))) (tuple2!10407 (_2!5474 lt!194944) (_1!5474 lt!194944)))))

(declare-fun bs!9649 () Bool)

(assert (= bs!9649 d!39972))

(assert (=> bs!9649 m!186845))

(declare-fun m!188123 () Bool)

(assert (=> bs!9649 m!188123))

(assert (=> b!122920 d!39972))

(declare-fun d!39974 () Bool)

(declare-fun e!80939 () Bool)

(assert (=> d!39974 e!80939))

(declare-fun res!102362 () Bool)

(assert (=> d!39974 (=> (not res!102362) (not e!80939))))

(assert (=> d!39974 (= res!102362 (invariant!0 (currentBit!5592 (_2!5467 lt!193604)) (currentByte!5597 (_2!5467 lt!193604)) (size!2460 (buf!2900 (_2!5467 lt!193604)))))))

(assert (=> d!39974 (= (readerFrom!0 (_2!5467 lt!193604) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305)) (BitStream!4395 (buf!2900 (_2!5467 lt!193604)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))))

(declare-fun b!123486 () Bool)

(assert (=> b!123486 (= e!80939 (invariant!0 (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305) (size!2460 (buf!2900 (_2!5467 lt!193604)))))))

(assert (= (and d!39974 res!102362) b!123486))

(assert (=> d!39974 m!188099))

(declare-fun m!188125 () Bool)

(assert (=> b!123486 m!188125))

(assert (=> b!122920 d!39974))

(declare-fun d!39976 () Bool)

(assert (=> d!39976 (isPrefixOf!0 lt!193651 lt!193651)))

(declare-fun lt!194947 () Unit!7559)

(declare-fun choose!11 (BitStream!4394) Unit!7559)

(assert (=> d!39976 (= lt!194947 (choose!11 lt!193651))))

(assert (=> d!39976 (= (lemmaIsPrefixRefl!0 lt!193651) lt!194947)))

(declare-fun bs!9651 () Bool)

(assert (= bs!9651 d!39976))

(assert (=> bs!9651 m!186865))

(declare-fun m!188127 () Bool)

(assert (=> bs!9651 m!188127))

(assert (=> d!39560 d!39976))

(declare-fun d!39978 () Bool)

(assert (=> d!39978 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!194948 () Unit!7559)

(assert (=> d!39978 (= lt!194948 (choose!11 thiss!1305))))

(assert (=> d!39978 (= (lemmaIsPrefixRefl!0 thiss!1305) lt!194948)))

(declare-fun bs!9652 () Bool)

(assert (= bs!9652 d!39978))

(assert (=> bs!9652 m!186869))

(declare-fun m!188129 () Bool)

(assert (=> bs!9652 m!188129))

(assert (=> d!39560 d!39978))

(declare-fun d!39980 () Bool)

(assert (=> d!39980 (isPrefixOf!0 (_2!5467 lt!193395) (_2!5467 lt!193395))))

(declare-fun lt!194949 () Unit!7559)

(assert (=> d!39980 (= lt!194949 (choose!11 (_2!5467 lt!193395)))))

(assert (=> d!39980 (= (lemmaIsPrefixRefl!0 (_2!5467 lt!193395)) lt!194949)))

(declare-fun bs!9653 () Bool)

(assert (= bs!9653 d!39980))

(assert (=> bs!9653 m!186877))

(declare-fun m!188131 () Bool)

(assert (=> bs!9653 m!188131))

(assert (=> d!39560 d!39980))

(declare-fun d!39982 () Bool)

(declare-fun res!102365 () Bool)

(declare-fun e!80940 () Bool)

(assert (=> d!39982 (=> (not res!102365) (not e!80940))))

(assert (=> d!39982 (= res!102365 (= (size!2460 (buf!2900 (_2!5467 lt!193395))) (size!2460 (buf!2900 (_2!5467 lt!193395)))))))

(assert (=> d!39982 (= (isPrefixOf!0 (_2!5467 lt!193395) (_2!5467 lt!193395)) e!80940)))

(declare-fun b!123487 () Bool)

(declare-fun res!102364 () Bool)

(assert (=> b!123487 (=> (not res!102364) (not e!80940))))

(assert (=> b!123487 (= res!102364 (bvsle (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193395))) (currentByte!5597 (_2!5467 lt!193395)) (currentBit!5592 (_2!5467 lt!193395))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193395))) (currentByte!5597 (_2!5467 lt!193395)) (currentBit!5592 (_2!5467 lt!193395)))))))

(declare-fun b!123488 () Bool)

(declare-fun e!80941 () Bool)

(assert (=> b!123488 (= e!80940 e!80941)))

(declare-fun res!102363 () Bool)

(assert (=> b!123488 (=> res!102363 e!80941)))

(assert (=> b!123488 (= res!102363 (= (size!2460 (buf!2900 (_2!5467 lt!193395))) #b00000000000000000000000000000000))))

(declare-fun b!123489 () Bool)

(assert (=> b!123489 (= e!80941 (arrayBitRangesEq!0 (buf!2900 (_2!5467 lt!193395)) (buf!2900 (_2!5467 lt!193395)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193395))) (currentByte!5597 (_2!5467 lt!193395)) (currentBit!5592 (_2!5467 lt!193395)))))))

(assert (= (and d!39982 res!102365) b!123487))

(assert (= (and b!123487 res!102364) b!123488))

(assert (= (and b!123488 (not res!102363)) b!123489))

(assert (=> b!123487 m!186709))

(assert (=> b!123487 m!186709))

(assert (=> b!123489 m!186709))

(assert (=> b!123489 m!186709))

(declare-fun m!188133 () Bool)

(assert (=> b!123489 m!188133))

(assert (=> d!39560 d!39982))

(declare-fun d!39984 () Bool)

(declare-fun res!102368 () Bool)

(declare-fun e!80942 () Bool)

(assert (=> d!39984 (=> (not res!102368) (not e!80942))))

(assert (=> d!39984 (= res!102368 (= (size!2460 (buf!2900 lt!193651)) (size!2460 (buf!2900 (_2!5467 lt!193395)))))))

(assert (=> d!39984 (= (isPrefixOf!0 lt!193651 (_2!5467 lt!193395)) e!80942)))

(declare-fun b!123490 () Bool)

(declare-fun res!102367 () Bool)

(assert (=> b!123490 (=> (not res!102367) (not e!80942))))

(assert (=> b!123490 (= res!102367 (bvsle (bitIndex!0 (size!2460 (buf!2900 lt!193651)) (currentByte!5597 lt!193651) (currentBit!5592 lt!193651)) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193395))) (currentByte!5597 (_2!5467 lt!193395)) (currentBit!5592 (_2!5467 lt!193395)))))))

(declare-fun b!123491 () Bool)

(declare-fun e!80943 () Bool)

(assert (=> b!123491 (= e!80942 e!80943)))

(declare-fun res!102366 () Bool)

(assert (=> b!123491 (=> res!102366 e!80943)))

(assert (=> b!123491 (= res!102366 (= (size!2460 (buf!2900 lt!193651)) #b00000000000000000000000000000000))))

(declare-fun b!123492 () Bool)

(assert (=> b!123492 (= e!80943 (arrayBitRangesEq!0 (buf!2900 lt!193651) (buf!2900 (_2!5467 lt!193395)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 lt!193651)) (currentByte!5597 lt!193651) (currentBit!5592 lt!193651))))))

(assert (= (and d!39984 res!102368) b!123490))

(assert (= (and b!123490 res!102367) b!123491))

(assert (= (and b!123491 (not res!102366)) b!123492))

(declare-fun m!188135 () Bool)

(assert (=> b!123490 m!188135))

(assert (=> b!123490 m!186709))

(assert (=> b!123492 m!188135))

(assert (=> b!123492 m!188135))

(declare-fun m!188137 () Bool)

(assert (=> b!123492 m!188137))

(assert (=> d!39560 d!39984))

(assert (=> d!39560 d!39584))

(declare-fun d!39986 () Bool)

(assert (=> d!39986 (isPrefixOf!0 lt!193651 (_2!5467 lt!193395))))

(declare-fun lt!194950 () Unit!7559)

(assert (=> d!39986 (= lt!194950 (choose!30 lt!193651 thiss!1305 (_2!5467 lt!193395)))))

(assert (=> d!39986 (isPrefixOf!0 lt!193651 thiss!1305)))

(assert (=> d!39986 (= (lemmaIsPrefixTransitive!0 lt!193651 thiss!1305 (_2!5467 lt!193395)) lt!194950)))

(declare-fun bs!9654 () Bool)

(assert (= bs!9654 d!39986))

(assert (=> bs!9654 m!186881))

(declare-fun m!188139 () Bool)

(assert (=> bs!9654 m!188139))

(declare-fun m!188141 () Bool)

(assert (=> bs!9654 m!188141))

(assert (=> d!39560 d!39986))

(declare-fun d!39988 () Bool)

(assert (=> d!39988 (isPrefixOf!0 lt!193651 (_2!5467 lt!193395))))

(declare-fun lt!194951 () Unit!7559)

(assert (=> d!39988 (= lt!194951 (choose!30 lt!193651 (_2!5467 lt!193395) (_2!5467 lt!193395)))))

(assert (=> d!39988 (isPrefixOf!0 lt!193651 (_2!5467 lt!193395))))

(assert (=> d!39988 (= (lemmaIsPrefixTransitive!0 lt!193651 (_2!5467 lt!193395) (_2!5467 lt!193395)) lt!194951)))

(declare-fun bs!9655 () Bool)

(assert (= bs!9655 d!39988))

(assert (=> bs!9655 m!186881))

(declare-fun m!188143 () Bool)

(assert (=> bs!9655 m!188143))

(assert (=> bs!9655 m!186881))

(assert (=> d!39560 d!39988))

(declare-fun d!39990 () Bool)

(declare-fun res!102371 () Bool)

(declare-fun e!80944 () Bool)

(assert (=> d!39990 (=> (not res!102371) (not e!80944))))

(assert (=> d!39990 (= res!102371 (= (size!2460 (buf!2900 thiss!1305)) (size!2460 (buf!2900 thiss!1305))))))

(assert (=> d!39990 (= (isPrefixOf!0 thiss!1305 thiss!1305) e!80944)))

(declare-fun b!123493 () Bool)

(declare-fun res!102370 () Bool)

(assert (=> b!123493 (=> (not res!102370) (not e!80944))))

(assert (=> b!123493 (= res!102370 (bvsle (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)) (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))))))

(declare-fun b!123494 () Bool)

(declare-fun e!80945 () Bool)

(assert (=> b!123494 (= e!80944 e!80945)))

(declare-fun res!102369 () Bool)

(assert (=> b!123494 (=> res!102369 e!80945)))

(assert (=> b!123494 (= res!102369 (= (size!2460 (buf!2900 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!123495 () Bool)

(assert (=> b!123495 (= e!80945 (arrayBitRangesEq!0 (buf!2900 thiss!1305) (buf!2900 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))))))

(assert (= (and d!39990 res!102371) b!123493))

(assert (= (and b!123493 res!102370) b!123494))

(assert (= (and b!123494 (not res!102369)) b!123495))

(assert (=> b!123493 m!186643))

(assert (=> b!123493 m!186643))

(assert (=> b!123495 m!186643))

(assert (=> b!123495 m!186643))

(declare-fun m!188145 () Bool)

(assert (=> b!123495 m!188145))

(assert (=> d!39560 d!39990))

(declare-fun d!39992 () Bool)

(declare-fun res!102374 () Bool)

(declare-fun e!80946 () Bool)

(assert (=> d!39992 (=> (not res!102374) (not e!80946))))

(assert (=> d!39992 (= res!102374 (= (size!2460 (buf!2900 (_1!5466 lt!193663))) (size!2460 (buf!2900 (_2!5466 lt!193663)))))))

(assert (=> d!39992 (= (isPrefixOf!0 (_1!5466 lt!193663) (_2!5466 lt!193663)) e!80946)))

(declare-fun b!123496 () Bool)

(declare-fun res!102373 () Bool)

(assert (=> b!123496 (=> (not res!102373) (not e!80946))))

(assert (=> b!123496 (= res!102373 (bvsle (bitIndex!0 (size!2460 (buf!2900 (_1!5466 lt!193663))) (currentByte!5597 (_1!5466 lt!193663)) (currentBit!5592 (_1!5466 lt!193663))) (bitIndex!0 (size!2460 (buf!2900 (_2!5466 lt!193663))) (currentByte!5597 (_2!5466 lt!193663)) (currentBit!5592 (_2!5466 lt!193663)))))))

(declare-fun b!123497 () Bool)

(declare-fun e!80947 () Bool)

(assert (=> b!123497 (= e!80946 e!80947)))

(declare-fun res!102372 () Bool)

(assert (=> b!123497 (=> res!102372 e!80947)))

(assert (=> b!123497 (= res!102372 (= (size!2460 (buf!2900 (_1!5466 lt!193663))) #b00000000000000000000000000000000))))

(declare-fun b!123498 () Bool)

(assert (=> b!123498 (= e!80947 (arrayBitRangesEq!0 (buf!2900 (_1!5466 lt!193663)) (buf!2900 (_2!5466 lt!193663)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 (_1!5466 lt!193663))) (currentByte!5597 (_1!5466 lt!193663)) (currentBit!5592 (_1!5466 lt!193663)))))))

(assert (= (and d!39992 res!102374) b!123496))

(assert (= (and b!123496 res!102373) b!123497))

(assert (= (and b!123497 (not res!102372)) b!123498))

(declare-fun m!188147 () Bool)

(assert (=> b!123496 m!188147))

(assert (=> b!123496 m!188041))

(assert (=> b!123498 m!188147))

(assert (=> b!123498 m!188147))

(declare-fun m!188149 () Bool)

(assert (=> b!123498 m!188149))

(assert (=> d!39560 d!39992))

(declare-fun d!39994 () Bool)

(declare-fun res!102377 () Bool)

(declare-fun e!80948 () Bool)

(assert (=> d!39994 (=> (not res!102377) (not e!80948))))

(assert (=> d!39994 (= res!102377 (= (size!2460 (buf!2900 lt!193651)) (size!2460 (buf!2900 lt!193651))))))

(assert (=> d!39994 (= (isPrefixOf!0 lt!193651 lt!193651) e!80948)))

(declare-fun b!123499 () Bool)

(declare-fun res!102376 () Bool)

(assert (=> b!123499 (=> (not res!102376) (not e!80948))))

(assert (=> b!123499 (= res!102376 (bvsle (bitIndex!0 (size!2460 (buf!2900 lt!193651)) (currentByte!5597 lt!193651) (currentBit!5592 lt!193651)) (bitIndex!0 (size!2460 (buf!2900 lt!193651)) (currentByte!5597 lt!193651) (currentBit!5592 lt!193651))))))

(declare-fun b!123500 () Bool)

(declare-fun e!80949 () Bool)

(assert (=> b!123500 (= e!80948 e!80949)))

(declare-fun res!102375 () Bool)

(assert (=> b!123500 (=> res!102375 e!80949)))

(assert (=> b!123500 (= res!102375 (= (size!2460 (buf!2900 lt!193651)) #b00000000000000000000000000000000))))

(declare-fun b!123501 () Bool)

(assert (=> b!123501 (= e!80949 (arrayBitRangesEq!0 (buf!2900 lt!193651) (buf!2900 lt!193651) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 lt!193651)) (currentByte!5597 lt!193651) (currentBit!5592 lt!193651))))))

(assert (= (and d!39994 res!102377) b!123499))

(assert (= (and b!123499 res!102376) b!123500))

(assert (= (and b!123500 (not res!102375)) b!123501))

(assert (=> b!123499 m!188135))

(assert (=> b!123499 m!188135))

(assert (=> b!123501 m!188135))

(assert (=> b!123501 m!188135))

(declare-fun m!188151 () Bool)

(assert (=> b!123501 m!188151))

(assert (=> d!39560 d!39994))

(declare-fun b!123502 () Bool)

(declare-fun res!102379 () Bool)

(declare-fun e!80951 () Bool)

(assert (=> b!123502 (=> (not res!102379) (not e!80951))))

(declare-fun lt!194967 () tuple2!10402)

(assert (=> b!123502 (= res!102379 (isPrefixOf!0 (_2!5466 lt!194967) (_2!5467 lt!194258)))))

(declare-fun lt!194954 () (_ BitVec 64))

(declare-fun lt!194957 () (_ BitVec 64))

(declare-fun b!123503 () Bool)

(assert (=> b!123503 (= e!80951 (= (_1!5466 lt!194967) (withMovedBitIndex!0 (_2!5466 lt!194967) (bvsub lt!194954 lt!194957))))))

(assert (=> b!123503 (or (= (bvand lt!194954 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194957 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194954 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194954 lt!194957) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123503 (= lt!194957 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194258))) (currentByte!5597 (_2!5467 lt!194258)) (currentBit!5592 (_2!5467 lt!194258))))))

(assert (=> b!123503 (= lt!194954 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194275))) (currentByte!5597 (_2!5467 lt!194275)) (currentBit!5592 (_2!5467 lt!194275))))))

(declare-fun b!123504 () Bool)

(declare-fun res!102378 () Bool)

(assert (=> b!123504 (=> (not res!102378) (not e!80951))))

(assert (=> b!123504 (= res!102378 (isPrefixOf!0 (_1!5466 lt!194967) (_2!5467 lt!194275)))))

(declare-fun b!123505 () Bool)

(declare-fun e!80950 () Unit!7559)

(declare-fun lt!194960 () Unit!7559)

(assert (=> b!123505 (= e!80950 lt!194960)))

(declare-fun lt!194953 () (_ BitVec 64))

(assert (=> b!123505 (= lt!194953 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!194959 () (_ BitVec 64))

(assert (=> b!123505 (= lt!194959 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194275))) (currentByte!5597 (_2!5467 lt!194275)) (currentBit!5592 (_2!5467 lt!194275))))))

(assert (=> b!123505 (= lt!194960 (arrayBitRangesEqSymmetric!0 (buf!2900 (_2!5467 lt!194275)) (buf!2900 (_2!5467 lt!194258)) lt!194953 lt!194959))))

(assert (=> b!123505 (arrayBitRangesEq!0 (buf!2900 (_2!5467 lt!194258)) (buf!2900 (_2!5467 lt!194275)) lt!194953 lt!194959)))

(declare-fun d!39996 () Bool)

(assert (=> d!39996 e!80951))

(declare-fun res!102380 () Bool)

(assert (=> d!39996 (=> (not res!102380) (not e!80951))))

(assert (=> d!39996 (= res!102380 (isPrefixOf!0 (_1!5466 lt!194967) (_2!5466 lt!194967)))))

(declare-fun lt!194955 () BitStream!4394)

(assert (=> d!39996 (= lt!194967 (tuple2!10403 lt!194955 (_2!5467 lt!194258)))))

(declare-fun lt!194952 () Unit!7559)

(declare-fun lt!194963 () Unit!7559)

(assert (=> d!39996 (= lt!194952 lt!194963)))

(assert (=> d!39996 (isPrefixOf!0 lt!194955 (_2!5467 lt!194258))))

(assert (=> d!39996 (= lt!194963 (lemmaIsPrefixTransitive!0 lt!194955 (_2!5467 lt!194258) (_2!5467 lt!194258)))))

(declare-fun lt!194958 () Unit!7559)

(declare-fun lt!194966 () Unit!7559)

(assert (=> d!39996 (= lt!194958 lt!194966)))

(assert (=> d!39996 (isPrefixOf!0 lt!194955 (_2!5467 lt!194258))))

(assert (=> d!39996 (= lt!194966 (lemmaIsPrefixTransitive!0 lt!194955 (_2!5467 lt!194275) (_2!5467 lt!194258)))))

(declare-fun lt!194961 () Unit!7559)

(assert (=> d!39996 (= lt!194961 e!80950)))

(declare-fun c!7387 () Bool)

(assert (=> d!39996 (= c!7387 (not (= (size!2460 (buf!2900 (_2!5467 lt!194275))) #b00000000000000000000000000000000)))))

(declare-fun lt!194970 () Unit!7559)

(declare-fun lt!194971 () Unit!7559)

(assert (=> d!39996 (= lt!194970 lt!194971)))

(assert (=> d!39996 (isPrefixOf!0 (_2!5467 lt!194258) (_2!5467 lt!194258))))

(assert (=> d!39996 (= lt!194971 (lemmaIsPrefixRefl!0 (_2!5467 lt!194258)))))

(declare-fun lt!194969 () Unit!7559)

(declare-fun lt!194964 () Unit!7559)

(assert (=> d!39996 (= lt!194969 lt!194964)))

(assert (=> d!39996 (= lt!194964 (lemmaIsPrefixRefl!0 (_2!5467 lt!194258)))))

(declare-fun lt!194956 () Unit!7559)

(declare-fun lt!194965 () Unit!7559)

(assert (=> d!39996 (= lt!194956 lt!194965)))

(assert (=> d!39996 (isPrefixOf!0 lt!194955 lt!194955)))

(assert (=> d!39996 (= lt!194965 (lemmaIsPrefixRefl!0 lt!194955))))

(declare-fun lt!194968 () Unit!7559)

(declare-fun lt!194962 () Unit!7559)

(assert (=> d!39996 (= lt!194968 lt!194962)))

(assert (=> d!39996 (isPrefixOf!0 (_2!5467 lt!194275) (_2!5467 lt!194275))))

(assert (=> d!39996 (= lt!194962 (lemmaIsPrefixRefl!0 (_2!5467 lt!194275)))))

(assert (=> d!39996 (= lt!194955 (BitStream!4395 (buf!2900 (_2!5467 lt!194258)) (currentByte!5597 (_2!5467 lt!194275)) (currentBit!5592 (_2!5467 lt!194275))))))

(assert (=> d!39996 (isPrefixOf!0 (_2!5467 lt!194275) (_2!5467 lt!194258))))

(assert (=> d!39996 (= (reader!0 (_2!5467 lt!194275) (_2!5467 lt!194258)) lt!194967)))

(declare-fun b!123506 () Bool)

(declare-fun Unit!7613 () Unit!7559)

(assert (=> b!123506 (= e!80950 Unit!7613)))

(assert (= (and d!39996 c!7387) b!123505))

(assert (= (and d!39996 (not c!7387)) b!123506))

(assert (= (and d!39996 res!102380) b!123504))

(assert (= (and b!123504 res!102378) b!123502))

(assert (= (and b!123502 res!102379) b!123503))

(declare-fun m!188153 () Bool)

(assert (=> b!123503 m!188153))

(assert (=> b!123503 m!187341))

(assert (=> b!123503 m!187333))

(declare-fun m!188155 () Bool)

(assert (=> b!123504 m!188155))

(declare-fun m!188157 () Bool)

(assert (=> d!39996 m!188157))

(declare-fun m!188159 () Bool)

(assert (=> d!39996 m!188159))

(declare-fun m!188161 () Bool)

(assert (=> d!39996 m!188161))

(declare-fun m!188163 () Bool)

(assert (=> d!39996 m!188163))

(declare-fun m!188165 () Bool)

(assert (=> d!39996 m!188165))

(declare-fun m!188167 () Bool)

(assert (=> d!39996 m!188167))

(declare-fun m!188169 () Bool)

(assert (=> d!39996 m!188169))

(declare-fun m!188171 () Bool)

(assert (=> d!39996 m!188171))

(declare-fun m!188173 () Bool)

(assert (=> d!39996 m!188173))

(declare-fun m!188175 () Bool)

(assert (=> d!39996 m!188175))

(declare-fun m!188177 () Bool)

(assert (=> d!39996 m!188177))

(declare-fun m!188179 () Bool)

(assert (=> b!123502 m!188179))

(assert (=> b!123505 m!187333))

(declare-fun m!188181 () Bool)

(assert (=> b!123505 m!188181))

(declare-fun m!188183 () Bool)

(assert (=> b!123505 m!188183))

(assert (=> b!123119 d!39996))

(declare-fun b!123507 () Bool)

(declare-fun lt!194995 () tuple2!10406)

(declare-fun lt!194991 () tuple2!10404)

(assert (=> b!123507 (= lt!194995 (readBitPure!0 (readerFrom!0 (_2!5467 lt!194991) (currentBit!5592 (_2!5467 lt!194275)) (currentByte!5597 (_2!5467 lt!194275)))))))

(declare-fun res!102388 () Bool)

(declare-fun lt!194973 () Bool)

(assert (=> b!123507 (= res!102388 (and (= (_2!5468 lt!194995) lt!194973) (= (_1!5468 lt!194995) (_2!5467 lt!194991))))))

(declare-fun e!80954 () Bool)

(assert (=> b!123507 (=> (not res!102388) (not e!80954))))

(declare-fun e!80952 () Bool)

(assert (=> b!123507 (= e!80952 e!80954)))

(declare-fun b!123508 () Bool)

(declare-fun e!80955 () tuple2!10404)

(declare-fun lt!194990 () Unit!7559)

(assert (=> b!123508 (= e!80955 (tuple2!10405 lt!194990 (_2!5467 lt!194275)))))

(declare-fun lt!195000 () BitStream!4394)

(assert (=> b!123508 (= lt!195000 (_2!5467 lt!194275))))

(assert (=> b!123508 (= lt!194990 (lemmaIsPrefixRefl!0 lt!195000))))

(declare-fun call!1618 () Bool)

(assert (=> b!123508 call!1618))

(declare-fun b!123509 () Bool)

(declare-fun lt!194977 () tuple2!10404)

(declare-fun Unit!7614 () Unit!7559)

(assert (=> b!123509 (= e!80955 (tuple2!10405 Unit!7614 (_2!5467 lt!194977)))))

(assert (=> b!123509 (= lt!194973 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123509 (= lt!194991 (appendBit!0 (_2!5467 lt!194275) lt!194973))))

(declare-fun res!102387 () Bool)

(assert (=> b!123509 (= res!102387 (= (size!2460 (buf!2900 (_2!5467 lt!194275))) (size!2460 (buf!2900 (_2!5467 lt!194991)))))))

(assert (=> b!123509 (=> (not res!102387) (not e!80952))))

(assert (=> b!123509 e!80952))

(declare-fun lt!194994 () tuple2!10404)

(assert (=> b!123509 (= lt!194994 lt!194991)))

(assert (=> b!123509 (= lt!194977 (appendNLeastSignificantBitsLoop!0 (_2!5467 lt!194994) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!194974 () Unit!7559)

(assert (=> b!123509 (= lt!194974 (lemmaIsPrefixTransitive!0 (_2!5467 lt!194275) (_2!5467 lt!194994) (_2!5467 lt!194977)))))

(assert (=> b!123509 (isPrefixOf!0 (_2!5467 lt!194275) (_2!5467 lt!194977))))

(declare-fun lt!194985 () Unit!7559)

(assert (=> b!123509 (= lt!194985 lt!194974)))

(assert (=> b!123509 (invariant!0 (currentBit!5592 (_2!5467 lt!194275)) (currentByte!5597 (_2!5467 lt!194275)) (size!2460 (buf!2900 (_2!5467 lt!194994))))))

(declare-fun lt!194976 () BitStream!4394)

(assert (=> b!123509 (= lt!194976 (BitStream!4395 (buf!2900 (_2!5467 lt!194994)) (currentByte!5597 (_2!5467 lt!194275)) (currentBit!5592 (_2!5467 lt!194275))))))

(assert (=> b!123509 (invariant!0 (currentBit!5592 lt!194976) (currentByte!5597 lt!194976) (size!2460 (buf!2900 (_2!5467 lt!194977))))))

(declare-fun lt!195013 () BitStream!4394)

(assert (=> b!123509 (= lt!195013 (BitStream!4395 (buf!2900 (_2!5467 lt!194977)) (currentByte!5597 lt!194976) (currentBit!5592 lt!194976)))))

(declare-fun lt!195009 () tuple2!10406)

(assert (=> b!123509 (= lt!195009 (readBitPure!0 lt!194976))))

(declare-fun lt!194996 () tuple2!10406)

(assert (=> b!123509 (= lt!194996 (readBitPure!0 lt!195013))))

(declare-fun lt!195012 () Unit!7559)

(assert (=> b!123509 (= lt!195012 (readBitPrefixLemma!0 lt!194976 (_2!5467 lt!194977)))))

(declare-fun res!102381 () Bool)

(assert (=> b!123509 (= res!102381 (= (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!195009))) (currentByte!5597 (_1!5468 lt!195009)) (currentBit!5592 (_1!5468 lt!195009))) (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!194996))) (currentByte!5597 (_1!5468 lt!194996)) (currentBit!5592 (_1!5468 lt!194996)))))))

(declare-fun e!80956 () Bool)

(assert (=> b!123509 (=> (not res!102381) (not e!80956))))

(assert (=> b!123509 e!80956))

(declare-fun lt!194978 () Unit!7559)

(assert (=> b!123509 (= lt!194978 lt!195012)))

(declare-fun lt!194989 () tuple2!10402)

(assert (=> b!123509 (= lt!194989 (reader!0 (_2!5467 lt!194275) (_2!5467 lt!194977)))))

(declare-fun lt!195010 () tuple2!10402)

(assert (=> b!123509 (= lt!195010 (reader!0 (_2!5467 lt!194994) (_2!5467 lt!194977)))))

(declare-fun lt!194979 () tuple2!10406)

(assert (=> b!123509 (= lt!194979 (readBitPure!0 (_1!5466 lt!194989)))))

(assert (=> b!123509 (= (_2!5468 lt!194979) lt!194973)))

(declare-fun lt!194987 () Unit!7559)

(declare-fun Unit!7615 () Unit!7559)

(assert (=> b!123509 (= lt!194987 Unit!7615)))

(declare-fun lt!194988 () (_ BitVec 64))

(assert (=> b!123509 (= lt!194988 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(declare-fun lt!194984 () (_ BitVec 64))

(assert (=> b!123509 (= lt!194984 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(declare-fun lt!195008 () Unit!7559)

(assert (=> b!123509 (= lt!195008 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5467 lt!194275) (buf!2900 (_2!5467 lt!194977)) lt!194984))))

(assert (=> b!123509 (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194977)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!194275))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!194275))) lt!194984)))

(declare-fun lt!194999 () Unit!7559)

(assert (=> b!123509 (= lt!194999 lt!195008)))

(declare-fun lt!194992 () tuple2!10400)

(assert (=> b!123509 (= lt!194992 (readNLeastSignificantBitsLoopPure!0 (_1!5466 lt!194989) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!194988))))

(declare-fun lt!194998 () (_ BitVec 64))

(assert (=> b!123509 (= lt!194998 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!194982 () Unit!7559)

(assert (=> b!123509 (= lt!194982 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5467 lt!194994) (buf!2900 (_2!5467 lt!194977)) lt!194998))))

(assert (=> b!123509 (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194977)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!194994))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!194994))) lt!194998)))

(declare-fun lt!194975 () Unit!7559)

(assert (=> b!123509 (= lt!194975 lt!194982)))

(declare-fun lt!195006 () tuple2!10400)

(assert (=> b!123509 (= lt!195006 (readNLeastSignificantBitsLoopPure!0 (_1!5466 lt!195010) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!194988 (ite (_2!5468 lt!194979) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!194997 () tuple2!10400)

(assert (=> b!123509 (= lt!194997 (readNLeastSignificantBitsLoopPure!0 (_1!5466 lt!194989) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!194988))))

(declare-fun c!7388 () Bool)

(assert (=> b!123509 (= c!7388 (_2!5468 (readBitPure!0 (_1!5466 lt!194989))))))

(declare-fun e!80957 () (_ BitVec 64))

(declare-fun lt!194993 () tuple2!10400)

(assert (=> b!123509 (= lt!194993 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5466 lt!194989) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!194988 e!80957)))))

(declare-fun lt!194972 () Unit!7559)

(assert (=> b!123509 (= lt!194972 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5466 lt!194989) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!194988))))

(assert (=> b!123509 (and (= (_2!5465 lt!194997) (_2!5465 lt!194993)) (= (_1!5465 lt!194997) (_1!5465 lt!194993)))))

(declare-fun lt!194980 () Unit!7559)

(assert (=> b!123509 (= lt!194980 lt!194972)))

(assert (=> b!123509 (= (_1!5466 lt!194989) (withMovedBitIndex!0 (_2!5466 lt!194989) (bvsub (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194275))) (currentByte!5597 (_2!5467 lt!194275)) (currentBit!5592 (_2!5467 lt!194275))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194977))) (currentByte!5597 (_2!5467 lt!194977)) (currentBit!5592 (_2!5467 lt!194977))))))))

(declare-fun lt!195007 () Unit!7559)

(declare-fun Unit!7616 () Unit!7559)

(assert (=> b!123509 (= lt!195007 Unit!7616)))

(assert (=> b!123509 (= (_1!5466 lt!195010) (withMovedBitIndex!0 (_2!5466 lt!195010) (bvsub (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194994))) (currentByte!5597 (_2!5467 lt!194994)) (currentBit!5592 (_2!5467 lt!194994))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194977))) (currentByte!5597 (_2!5467 lt!194977)) (currentBit!5592 (_2!5467 lt!194977))))))))

(declare-fun lt!194981 () Unit!7559)

(declare-fun Unit!7617 () Unit!7559)

(assert (=> b!123509 (= lt!194981 Unit!7617)))

(assert (=> b!123509 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194275))) (currentByte!5597 (_2!5467 lt!194275)) (currentBit!5592 (_2!5467 lt!194275))) (bvsub (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194994))) (currentByte!5597 (_2!5467 lt!194994)) (currentBit!5592 (_2!5467 lt!194994))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!195014 () Unit!7559)

(declare-fun Unit!7618 () Unit!7559)

(assert (=> b!123509 (= lt!195014 Unit!7618)))

(assert (=> b!123509 (= (_2!5465 lt!194992) (_2!5465 lt!195006))))

(declare-fun lt!195016 () Unit!7559)

(declare-fun Unit!7619 () Unit!7559)

(assert (=> b!123509 (= lt!195016 Unit!7619)))

(assert (=> b!123509 (= (_1!5465 lt!194992) (_2!5466 lt!194989))))

(declare-fun b!123510 () Bool)

(assert (=> b!123510 (= e!80957 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!123511 () Bool)

(declare-fun res!102389 () Bool)

(declare-fun e!80953 () Bool)

(assert (=> b!123511 (=> (not res!102389) (not e!80953))))

(declare-fun lt!195005 () tuple2!10404)

(assert (=> b!123511 (= res!102389 (isPrefixOf!0 (_2!5467 lt!194275) (_2!5467 lt!195005)))))

(declare-fun bm!1615 () Bool)

(declare-fun c!7389 () Bool)

(assert (=> bm!1615 (= call!1618 (isPrefixOf!0 (ite c!7389 (_2!5467 lt!194275) lt!195000) (ite c!7389 (_2!5467 lt!194991) lt!195000)))))

(declare-fun b!123512 () Bool)

(assert (=> b!123512 (= e!80957 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))))

(declare-fun b!123513 () Bool)

(assert (=> b!123513 (= e!80954 (= (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!194995))) (currentByte!5597 (_1!5468 lt!194995)) (currentBit!5592 (_1!5468 lt!194995))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194991))) (currentByte!5597 (_2!5467 lt!194991)) (currentBit!5592 (_2!5467 lt!194991)))))))

(declare-fun b!123514 () Bool)

(assert (=> b!123514 (= e!80956 (= (_2!5468 lt!195009) (_2!5468 lt!194996)))))

(declare-fun b!123515 () Bool)

(declare-fun res!102385 () Bool)

(assert (=> b!123515 (= res!102385 call!1618)))

(assert (=> b!123515 (=> (not res!102385) (not e!80952))))

(declare-fun d!39998 () Bool)

(assert (=> d!39998 e!80953))

(declare-fun res!102384 () Bool)

(assert (=> d!39998 (=> (not res!102384) (not e!80953))))

(assert (=> d!39998 (= res!102384 (= (size!2460 (buf!2900 (_2!5467 lt!194275))) (size!2460 (buf!2900 (_2!5467 lt!195005)))))))

(assert (=> d!39998 (= lt!195005 e!80955)))

(assert (=> d!39998 (= c!7389 (bvslt (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396))))

(assert (=> d!39998 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!39998 (= (appendNLeastSignificantBitsLoop!0 (_2!5467 lt!194275) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) lt!195005)))

(declare-fun b!123516 () Bool)

(declare-fun e!80958 () Bool)

(declare-fun lt!195004 () (_ BitVec 64))

(assert (=> b!123516 (= e!80958 (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194275)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!194275))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!194275))) lt!195004))))

(declare-fun b!123517 () Bool)

(declare-fun res!102383 () Bool)

(assert (=> b!123517 (= res!102383 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194991))) (currentByte!5597 (_2!5467 lt!194991)) (currentBit!5592 (_2!5467 lt!194991))) (bvadd (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194275))) (currentByte!5597 (_2!5467 lt!194275)) (currentBit!5592 (_2!5467 lt!194275))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!123517 (=> (not res!102383) (not e!80952))))

(declare-fun lt!195003 () tuple2!10402)

(declare-fun lt!194983 () tuple2!10400)

(declare-fun b!123518 () Bool)

(assert (=> b!123518 (= e!80953 (and (= (_2!5465 lt!194983) v!199) (= (_1!5465 lt!194983) (_2!5466 lt!195003))))))

(declare-fun lt!195001 () (_ BitVec 64))

(assert (=> b!123518 (= lt!194983 (readNLeastSignificantBitsLoopPure!0 (_1!5466 lt!195003) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!195001))))

(declare-fun lt!195002 () Unit!7559)

(declare-fun lt!195015 () Unit!7559)

(assert (=> b!123518 (= lt!195002 lt!195015)))

(assert (=> b!123518 (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!195005)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!194275))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!194275))) lt!195004)))

(assert (=> b!123518 (= lt!195015 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5467 lt!194275) (buf!2900 (_2!5467 lt!195005)) lt!195004))))

(assert (=> b!123518 e!80958))

(declare-fun res!102386 () Bool)

(assert (=> b!123518 (=> (not res!102386) (not e!80958))))

(assert (=> b!123518 (= res!102386 (and (= (size!2460 (buf!2900 (_2!5467 lt!194275))) (size!2460 (buf!2900 (_2!5467 lt!195005)))) (bvsge lt!195004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123518 (= lt!195004 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!123518 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!123518 (= lt!195001 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(assert (=> b!123518 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!123518 (= lt!195003 (reader!0 (_2!5467 lt!194275) (_2!5467 lt!195005)))))

(declare-fun b!123519 () Bool)

(declare-fun res!102382 () Bool)

(assert (=> b!123519 (=> (not res!102382) (not e!80953))))

(declare-fun lt!194986 () (_ BitVec 64))

(declare-fun lt!195011 () (_ BitVec 64))

(assert (=> b!123519 (= res!102382 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!195005))) (currentByte!5597 (_2!5467 lt!195005)) (currentBit!5592 (_2!5467 lt!195005))) (bvadd lt!195011 lt!194986)))))

(assert (=> b!123519 (or (not (= (bvand lt!195011 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194986 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195011 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195011 lt!194986) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123519 (= lt!194986 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!123519 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!123519 (= lt!195011 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194275))) (currentByte!5597 (_2!5467 lt!194275)) (currentBit!5592 (_2!5467 lt!194275))))))

(assert (= (and d!39998 c!7389) b!123509))

(assert (= (and d!39998 (not c!7389)) b!123508))

(assert (= (and b!123509 res!102387) b!123517))

(assert (= (and b!123517 res!102383) b!123515))

(assert (= (and b!123515 res!102385) b!123507))

(assert (= (and b!123507 res!102388) b!123513))

(assert (= (and b!123509 res!102381) b!123514))

(assert (= (and b!123509 c!7388) b!123512))

(assert (= (and b!123509 (not c!7388)) b!123510))

(assert (= (or b!123515 b!123508) bm!1615))

(assert (= (and d!39998 res!102384) b!123519))

(assert (= (and b!123519 res!102382) b!123511))

(assert (= (and b!123511 res!102389) b!123518))

(assert (= (and b!123518 res!102386) b!123516))

(declare-fun m!188185 () Bool)

(assert (=> b!123516 m!188185))

(declare-fun m!188187 () Bool)

(assert (=> b!123508 m!188187))

(declare-fun m!188189 () Bool)

(assert (=> b!123518 m!188189))

(declare-fun m!188191 () Bool)

(assert (=> b!123518 m!188191))

(declare-fun m!188193 () Bool)

(assert (=> b!123518 m!188193))

(declare-fun m!188195 () Bool)

(assert (=> b!123518 m!188195))

(declare-fun m!188197 () Bool)

(assert (=> b!123518 m!188197))

(declare-fun m!188199 () Bool)

(assert (=> b!123519 m!188199))

(assert (=> b!123519 m!187333))

(declare-fun m!188201 () Bool)

(assert (=> b!123511 m!188201))

(declare-fun m!188203 () Bool)

(assert (=> b!123517 m!188203))

(assert (=> b!123517 m!187333))

(declare-fun m!188205 () Bool)

(assert (=> b!123507 m!188205))

(assert (=> b!123507 m!188205))

(declare-fun m!188207 () Bool)

(assert (=> b!123507 m!188207))

(declare-fun m!188209 () Bool)

(assert (=> b!123509 m!188209))

(declare-fun m!188211 () Bool)

(assert (=> b!123509 m!188211))

(assert (=> b!123509 m!187333))

(declare-fun m!188213 () Bool)

(assert (=> b!123509 m!188213))

(declare-fun m!188215 () Bool)

(assert (=> b!123509 m!188215))

(declare-fun m!188217 () Bool)

(assert (=> b!123509 m!188217))

(declare-fun m!188219 () Bool)

(assert (=> b!123509 m!188219))

(declare-fun m!188221 () Bool)

(assert (=> b!123509 m!188221))

(declare-fun m!188223 () Bool)

(assert (=> b!123509 m!188223))

(declare-fun m!188225 () Bool)

(assert (=> b!123509 m!188225))

(assert (=> b!123509 m!188217))

(declare-fun m!188227 () Bool)

(assert (=> b!123509 m!188227))

(declare-fun m!188229 () Bool)

(assert (=> b!123509 m!188229))

(declare-fun m!188231 () Bool)

(assert (=> b!123509 m!188231))

(declare-fun m!188233 () Bool)

(assert (=> b!123509 m!188233))

(declare-fun m!188235 () Bool)

(assert (=> b!123509 m!188235))

(declare-fun m!188237 () Bool)

(assert (=> b!123509 m!188237))

(declare-fun m!188239 () Bool)

(assert (=> b!123509 m!188239))

(declare-fun m!188241 () Bool)

(assert (=> b!123509 m!188241))

(declare-fun m!188243 () Bool)

(assert (=> b!123509 m!188243))

(declare-fun m!188245 () Bool)

(assert (=> b!123509 m!188245))

(declare-fun m!188247 () Bool)

(assert (=> b!123509 m!188247))

(declare-fun m!188249 () Bool)

(assert (=> b!123509 m!188249))

(declare-fun m!188251 () Bool)

(assert (=> b!123509 m!188251))

(declare-fun m!188253 () Bool)

(assert (=> b!123509 m!188253))

(declare-fun m!188255 () Bool)

(assert (=> b!123509 m!188255))

(declare-fun m!188257 () Bool)

(assert (=> b!123509 m!188257))

(assert (=> b!123509 m!188193))

(declare-fun m!188259 () Bool)

(assert (=> b!123509 m!188259))

(declare-fun m!188261 () Bool)

(assert (=> b!123509 m!188261))

(declare-fun m!188263 () Bool)

(assert (=> b!123513 m!188263))

(assert (=> b!123513 m!188203))

(declare-fun m!188265 () Bool)

(assert (=> bm!1615 m!188265))

(assert (=> b!123119 d!39998))

(declare-fun d!40000 () Bool)

(assert (=> d!40000 (= (invariant!0 (currentBit!5592 lt!194257) (currentByte!5597 lt!194257) (size!2460 (buf!2900 (_2!5467 lt!194258)))) (and (bvsge (currentBit!5592 lt!194257) #b00000000000000000000000000000000) (bvslt (currentBit!5592 lt!194257) #b00000000000000000000000000001000) (bvsge (currentByte!5597 lt!194257) #b00000000000000000000000000000000) (or (bvslt (currentByte!5597 lt!194257) (size!2460 (buf!2900 (_2!5467 lt!194258)))) (and (= (currentBit!5592 lt!194257) #b00000000000000000000000000000000) (= (currentByte!5597 lt!194257) (size!2460 (buf!2900 (_2!5467 lt!194258))))))))))

(assert (=> b!123119 d!40000))

(declare-fun lt!195017 () tuple2!10412)

(declare-fun d!40002 () Bool)

(assert (=> d!40002 (= lt!195017 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!5466 lt!194270) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!194269 e!80700)))))

(assert (=> d!40002 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5466 lt!194270) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!194269 e!80700)) (tuple2!10401 (_2!5471 lt!195017) (_1!5471 lt!195017)))))

(declare-fun bs!9656 () Bool)

(assert (= bs!9656 d!40002))

(assert (=> bs!9656 m!187305))

(declare-fun m!188267 () Bool)

(assert (=> bs!9656 m!188267))

(assert (=> b!123119 d!40002))

(declare-fun d!40004 () Bool)

(declare-fun e!80959 () Bool)

(assert (=> d!40004 e!80959))

(declare-fun res!102390 () Bool)

(assert (=> d!40004 (=> (not res!102390) (not e!80959))))

(declare-fun lt!195019 () tuple2!10406)

(declare-fun lt!195021 () tuple2!10406)

(assert (=> d!40004 (= res!102390 (= (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!195019))) (currentByte!5597 (_1!5468 lt!195019)) (currentBit!5592 (_1!5468 lt!195019))) (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!195021))) (currentByte!5597 (_1!5468 lt!195021)) (currentBit!5592 (_1!5468 lt!195021)))))))

(declare-fun lt!195020 () Unit!7559)

(declare-fun lt!195018 () BitStream!4394)

(assert (=> d!40004 (= lt!195020 (choose!50 lt!194257 (_2!5467 lt!194258) lt!195018 lt!195019 (tuple2!10407 (_1!5468 lt!195019) (_2!5468 lt!195019)) (_1!5468 lt!195019) (_2!5468 lt!195019) lt!195021 (tuple2!10407 (_1!5468 lt!195021) (_2!5468 lt!195021)) (_1!5468 lt!195021) (_2!5468 lt!195021)))))

(assert (=> d!40004 (= lt!195021 (readBitPure!0 lt!195018))))

(assert (=> d!40004 (= lt!195019 (readBitPure!0 lt!194257))))

(assert (=> d!40004 (= lt!195018 (BitStream!4395 (buf!2900 (_2!5467 lt!194258)) (currentByte!5597 lt!194257) (currentBit!5592 lt!194257)))))

(assert (=> d!40004 (invariant!0 (currentBit!5592 lt!194257) (currentByte!5597 lt!194257) (size!2460 (buf!2900 (_2!5467 lt!194258))))))

(assert (=> d!40004 (= (readBitPrefixLemma!0 lt!194257 (_2!5467 lt!194258)) lt!195020)))

(declare-fun b!123520 () Bool)

(assert (=> b!123520 (= e!80959 (= (_2!5468 lt!195019) (_2!5468 lt!195021)))))

(assert (= (and d!40004 res!102390) b!123520))

(assert (=> d!40004 m!187297))

(declare-fun m!188269 () Bool)

(assert (=> d!40004 m!188269))

(declare-fun m!188271 () Bool)

(assert (=> d!40004 m!188271))

(declare-fun m!188273 () Bool)

(assert (=> d!40004 m!188273))

(declare-fun m!188275 () Bool)

(assert (=> d!40004 m!188275))

(assert (=> d!40004 m!187323))

(assert (=> b!123119 d!40004))

(declare-fun b!123521 () Bool)

(declare-fun res!102392 () Bool)

(declare-fun e!80961 () Bool)

(assert (=> b!123521 (=> (not res!102392) (not e!80961))))

(declare-fun lt!195037 () tuple2!10402)

(assert (=> b!123521 (= res!102392 (isPrefixOf!0 (_2!5466 lt!195037) (_2!5467 lt!194258)))))

(declare-fun b!123522 () Bool)

(declare-fun lt!195024 () (_ BitVec 64))

(declare-fun lt!195027 () (_ BitVec 64))

(assert (=> b!123522 (= e!80961 (= (_1!5466 lt!195037) (withMovedBitIndex!0 (_2!5466 lt!195037) (bvsub lt!195024 lt!195027))))))

(assert (=> b!123522 (or (= (bvand lt!195024 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195027 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195024 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195024 lt!195027) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123522 (= lt!195027 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194258))) (currentByte!5597 (_2!5467 lt!194258)) (currentBit!5592 (_2!5467 lt!194258))))))

(assert (=> b!123522 (= lt!195024 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))))))

(declare-fun b!123523 () Bool)

(declare-fun res!102391 () Bool)

(assert (=> b!123523 (=> (not res!102391) (not e!80961))))

(assert (=> b!123523 (= res!102391 (isPrefixOf!0 (_1!5466 lt!195037) (_2!5467 lt!193401)))))

(declare-fun b!123524 () Bool)

(declare-fun e!80960 () Unit!7559)

(declare-fun lt!195030 () Unit!7559)

(assert (=> b!123524 (= e!80960 lt!195030)))

(declare-fun lt!195023 () (_ BitVec 64))

(assert (=> b!123524 (= lt!195023 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!195029 () (_ BitVec 64))

(assert (=> b!123524 (= lt!195029 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))))))

(assert (=> b!123524 (= lt!195030 (arrayBitRangesEqSymmetric!0 (buf!2900 (_2!5467 lt!193401)) (buf!2900 (_2!5467 lt!194258)) lt!195023 lt!195029))))

(assert (=> b!123524 (arrayBitRangesEq!0 (buf!2900 (_2!5467 lt!194258)) (buf!2900 (_2!5467 lt!193401)) lt!195023 lt!195029)))

(declare-fun d!40006 () Bool)

(assert (=> d!40006 e!80961))

(declare-fun res!102393 () Bool)

(assert (=> d!40006 (=> (not res!102393) (not e!80961))))

(assert (=> d!40006 (= res!102393 (isPrefixOf!0 (_1!5466 lt!195037) (_2!5466 lt!195037)))))

(declare-fun lt!195025 () BitStream!4394)

(assert (=> d!40006 (= lt!195037 (tuple2!10403 lt!195025 (_2!5467 lt!194258)))))

(declare-fun lt!195022 () Unit!7559)

(declare-fun lt!195033 () Unit!7559)

(assert (=> d!40006 (= lt!195022 lt!195033)))

(assert (=> d!40006 (isPrefixOf!0 lt!195025 (_2!5467 lt!194258))))

(assert (=> d!40006 (= lt!195033 (lemmaIsPrefixTransitive!0 lt!195025 (_2!5467 lt!194258) (_2!5467 lt!194258)))))

(declare-fun lt!195028 () Unit!7559)

(declare-fun lt!195036 () Unit!7559)

(assert (=> d!40006 (= lt!195028 lt!195036)))

(assert (=> d!40006 (isPrefixOf!0 lt!195025 (_2!5467 lt!194258))))

(assert (=> d!40006 (= lt!195036 (lemmaIsPrefixTransitive!0 lt!195025 (_2!5467 lt!193401) (_2!5467 lt!194258)))))

(declare-fun lt!195031 () Unit!7559)

(assert (=> d!40006 (= lt!195031 e!80960)))

(declare-fun c!7390 () Bool)

(assert (=> d!40006 (= c!7390 (not (= (size!2460 (buf!2900 (_2!5467 lt!193401))) #b00000000000000000000000000000000)))))

(declare-fun lt!195040 () Unit!7559)

(declare-fun lt!195041 () Unit!7559)

(assert (=> d!40006 (= lt!195040 lt!195041)))

(assert (=> d!40006 (isPrefixOf!0 (_2!5467 lt!194258) (_2!5467 lt!194258))))

(assert (=> d!40006 (= lt!195041 (lemmaIsPrefixRefl!0 (_2!5467 lt!194258)))))

(declare-fun lt!195039 () Unit!7559)

(declare-fun lt!195034 () Unit!7559)

(assert (=> d!40006 (= lt!195039 lt!195034)))

(assert (=> d!40006 (= lt!195034 (lemmaIsPrefixRefl!0 (_2!5467 lt!194258)))))

(declare-fun lt!195026 () Unit!7559)

(declare-fun lt!195035 () Unit!7559)

(assert (=> d!40006 (= lt!195026 lt!195035)))

(assert (=> d!40006 (isPrefixOf!0 lt!195025 lt!195025)))

(assert (=> d!40006 (= lt!195035 (lemmaIsPrefixRefl!0 lt!195025))))

(declare-fun lt!195038 () Unit!7559)

(declare-fun lt!195032 () Unit!7559)

(assert (=> d!40006 (= lt!195038 lt!195032)))

(assert (=> d!40006 (isPrefixOf!0 (_2!5467 lt!193401) (_2!5467 lt!193401))))

(assert (=> d!40006 (= lt!195032 (lemmaIsPrefixRefl!0 (_2!5467 lt!193401)))))

(assert (=> d!40006 (= lt!195025 (BitStream!4395 (buf!2900 (_2!5467 lt!194258)) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))))))

(assert (=> d!40006 (isPrefixOf!0 (_2!5467 lt!193401) (_2!5467 lt!194258))))

(assert (=> d!40006 (= (reader!0 (_2!5467 lt!193401) (_2!5467 lt!194258)) lt!195037)))

(declare-fun b!123525 () Bool)

(declare-fun Unit!7620 () Unit!7559)

(assert (=> b!123525 (= e!80960 Unit!7620)))

(assert (= (and d!40006 c!7390) b!123524))

(assert (= (and d!40006 (not c!7390)) b!123525))

(assert (= (and d!40006 res!102393) b!123523))

(assert (= (and b!123523 res!102391) b!123521))

(assert (= (and b!123521 res!102392) b!123522))

(declare-fun m!188277 () Bool)

(assert (=> b!123522 m!188277))

(assert (=> b!123522 m!187341))

(assert (=> b!123522 m!186641))

(declare-fun m!188279 () Bool)

(assert (=> b!123523 m!188279))

(declare-fun m!188281 () Bool)

(assert (=> d!40006 m!188281))

(declare-fun m!188283 () Bool)

(assert (=> d!40006 m!188283))

(assert (=> d!40006 m!188161))

(assert (=> d!40006 m!186909))

(declare-fun m!188285 () Bool)

(assert (=> d!40006 m!188285))

(assert (=> d!40006 m!187337))

(assert (=> d!40006 m!186915))

(declare-fun m!188287 () Bool)

(assert (=> d!40006 m!188287))

(assert (=> d!40006 m!188173))

(declare-fun m!188289 () Bool)

(assert (=> d!40006 m!188289))

(declare-fun m!188291 () Bool)

(assert (=> d!40006 m!188291))

(declare-fun m!188293 () Bool)

(assert (=> b!123521 m!188293))

(assert (=> b!123524 m!186641))

(declare-fun m!188295 () Bool)

(assert (=> b!123524 m!188295))

(declare-fun m!188297 () Bool)

(assert (=> b!123524 m!188297))

(assert (=> b!123119 d!40006))

(declare-fun d!40008 () Bool)

(assert (=> d!40008 (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194258)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401))) lt!194265)))

(declare-fun lt!195042 () Unit!7559)

(assert (=> d!40008 (= lt!195042 (choose!9 (_2!5467 lt!193401) (buf!2900 (_2!5467 lt!194258)) lt!194265 (BitStream!4395 (buf!2900 (_2!5467 lt!194258)) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401)))))))

(assert (=> d!40008 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5467 lt!193401) (buf!2900 (_2!5467 lt!194258)) lt!194265) lt!195042)))

(declare-fun bs!9657 () Bool)

(assert (= bs!9657 d!40008))

(assert (=> bs!9657 m!187345))

(declare-fun m!188299 () Bool)

(assert (=> bs!9657 m!188299))

(assert (=> b!123119 d!40008))

(declare-fun d!40010 () Bool)

(declare-fun e!80962 () Bool)

(assert (=> d!40010 e!80962))

(declare-fun res!102395 () Bool)

(assert (=> d!40010 (=> (not res!102395) (not e!80962))))

(declare-fun lt!195043 () (_ BitVec 64))

(declare-fun lt!195048 () (_ BitVec 64))

(declare-fun lt!195044 () (_ BitVec 64))

(assert (=> d!40010 (= res!102395 (= lt!195043 (bvsub lt!195044 lt!195048)))))

(assert (=> d!40010 (or (= (bvand lt!195044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195048 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195044 lt!195048) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40010 (= lt!195048 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!194290)))) ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!194290))) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!194290)))))))

(declare-fun lt!195046 () (_ BitVec 64))

(declare-fun lt!195047 () (_ BitVec 64))

(assert (=> d!40010 (= lt!195044 (bvmul lt!195046 lt!195047))))

(assert (=> d!40010 (or (= lt!195046 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195047 (bvsdiv (bvmul lt!195046 lt!195047) lt!195046)))))

(assert (=> d!40010 (= lt!195047 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40010 (= lt!195046 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!194290)))))))

(assert (=> d!40010 (= lt!195043 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!194290))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!194290)))))))

(assert (=> d!40010 (invariant!0 (currentBit!5592 (_1!5468 lt!194290)) (currentByte!5597 (_1!5468 lt!194290)) (size!2460 (buf!2900 (_1!5468 lt!194290))))))

(assert (=> d!40010 (= (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!194290))) (currentByte!5597 (_1!5468 lt!194290)) (currentBit!5592 (_1!5468 lt!194290))) lt!195043)))

(declare-fun b!123526 () Bool)

(declare-fun res!102394 () Bool)

(assert (=> b!123526 (=> (not res!102394) (not e!80962))))

(assert (=> b!123526 (= res!102394 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195043))))

(declare-fun b!123527 () Bool)

(declare-fun lt!195045 () (_ BitVec 64))

(assert (=> b!123527 (= e!80962 (bvsle lt!195043 (bvmul lt!195045 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123527 (or (= lt!195045 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195045 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195045)))))

(assert (=> b!123527 (= lt!195045 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!194290)))))))

(assert (= (and d!40010 res!102395) b!123526))

(assert (= (and b!123526 res!102394) b!123527))

(declare-fun m!188301 () Bool)

(assert (=> d!40010 m!188301))

(declare-fun m!188303 () Bool)

(assert (=> d!40010 m!188303))

(assert (=> b!123119 d!40010))

(declare-fun d!40012 () Bool)

(declare-fun e!80963 () Bool)

(assert (=> d!40012 e!80963))

(declare-fun res!102396 () Bool)

(assert (=> d!40012 (=> (not res!102396) (not e!80963))))

(declare-fun lt!195050 () (_ BitVec 64))

(declare-fun lt!195049 () BitStream!4394)

(assert (=> d!40012 (= res!102396 (= (bvadd lt!195050 (bvsub (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194258))) (currentByte!5597 (_2!5467 lt!194258)) (currentBit!5592 (_2!5467 lt!194258))))) (bitIndex!0 (size!2460 (buf!2900 lt!195049)) (currentByte!5597 lt!195049) (currentBit!5592 lt!195049))))))

(assert (=> d!40012 (or (not (= (bvand lt!195050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194258))) (currentByte!5597 (_2!5467 lt!194258)) (currentBit!5592 (_2!5467 lt!194258)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195050 (bvsub (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194258))) (currentByte!5597 (_2!5467 lt!194258)) (currentBit!5592 (_2!5467 lt!194258))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40012 (= lt!195050 (bitIndex!0 (size!2460 (buf!2900 (_2!5466 lt!194270))) (currentByte!5597 (_2!5466 lt!194270)) (currentBit!5592 (_2!5466 lt!194270))))))

(assert (=> d!40012 (= lt!195049 (_2!5467 (moveBitIndex!0 (_2!5466 lt!194270) (bvsub (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194258))) (currentByte!5597 (_2!5467 lt!194258)) (currentBit!5592 (_2!5467 lt!194258)))))))))

(assert (=> d!40012 (moveBitIndexPrecond!0 (_2!5466 lt!194270) (bvsub (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194258))) (currentByte!5597 (_2!5467 lt!194258)) (currentBit!5592 (_2!5467 lt!194258)))))))

(assert (=> d!40012 (= (withMovedBitIndex!0 (_2!5466 lt!194270) (bvsub (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194258))) (currentByte!5597 (_2!5467 lt!194258)) (currentBit!5592 (_2!5467 lt!194258))))) lt!195049)))

(declare-fun b!123528 () Bool)

(assert (=> b!123528 (= e!80963 (= (size!2460 (buf!2900 (_2!5466 lt!194270))) (size!2460 (buf!2900 lt!195049))))))

(assert (= (and d!40012 res!102396) b!123528))

(declare-fun m!188305 () Bool)

(assert (=> d!40012 m!188305))

(declare-fun m!188307 () Bool)

(assert (=> d!40012 m!188307))

(declare-fun m!188309 () Bool)

(assert (=> d!40012 m!188309))

(declare-fun m!188311 () Bool)

(assert (=> d!40012 m!188311))

(assert (=> b!123119 d!40012))

(declare-fun d!40014 () Bool)

(assert (=> d!40014 (isPrefixOf!0 (_2!5467 lt!193401) (_2!5467 lt!194258))))

(declare-fun lt!195051 () Unit!7559)

(assert (=> d!40014 (= lt!195051 (choose!30 (_2!5467 lt!193401) (_2!5467 lt!194275) (_2!5467 lt!194258)))))

(assert (=> d!40014 (isPrefixOf!0 (_2!5467 lt!193401) (_2!5467 lt!194275))))

(assert (=> d!40014 (= (lemmaIsPrefixTransitive!0 (_2!5467 lt!193401) (_2!5467 lt!194275) (_2!5467 lt!194258)) lt!195051)))

(declare-fun bs!9658 () Bool)

(assert (= bs!9658 d!40014))

(assert (=> bs!9658 m!187337))

(declare-fun m!188313 () Bool)

(assert (=> bs!9658 m!188313))

(declare-fun m!188315 () Bool)

(assert (=> bs!9658 m!188315))

(assert (=> b!123119 d!40014))

(declare-fun d!40016 () Bool)

(declare-fun lt!195052 () tuple2!10418)

(assert (=> d!40016 (= lt!195052 (readBit!0 lt!194257))))

(assert (=> d!40016 (= (readBitPure!0 lt!194257) (tuple2!10407 (_2!5474 lt!195052) (_1!5474 lt!195052)))))

(declare-fun bs!9659 () Bool)

(assert (= bs!9659 d!40016))

(declare-fun m!188317 () Bool)

(assert (=> bs!9659 m!188317))

(assert (=> b!123119 d!40016))

(declare-fun lt!195053 () tuple2!10412)

(declare-fun d!40018 () Bool)

(assert (=> d!40018 (= lt!195053 (readNLeastSignificantBitsLoop!0 (_1!5466 lt!194291) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!194269 (ite (_2!5468 lt!194260) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!40018 (= (readNLeastSignificantBitsLoopPure!0 (_1!5466 lt!194291) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!194269 (ite (_2!5468 lt!194260) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!10401 (_2!5471 lt!195053) (_1!5471 lt!195053)))))

(declare-fun bs!9660 () Bool)

(assert (= bs!9660 d!40018))

(declare-fun m!188319 () Bool)

(assert (=> bs!9660 m!188319))

(assert (=> b!123119 d!40018))

(declare-fun d!40020 () Bool)

(declare-fun lt!195054 () tuple2!10418)

(assert (=> d!40020 (= lt!195054 (readBit!0 lt!194294))))

(assert (=> d!40020 (= (readBitPure!0 lt!194294) (tuple2!10407 (_2!5474 lt!195054) (_1!5474 lt!195054)))))

(declare-fun bs!9661 () Bool)

(assert (= bs!9661 d!40020))

(declare-fun m!188321 () Bool)

(assert (=> bs!9661 m!188321))

(assert (=> b!123119 d!40020))

(declare-fun d!40022 () Bool)

(declare-fun e!80964 () Bool)

(assert (=> d!40022 e!80964))

(declare-fun res!102398 () Bool)

(assert (=> d!40022 (=> (not res!102398) (not e!80964))))

(declare-fun lt!195060 () (_ BitVec 64))

(declare-fun lt!195056 () (_ BitVec 64))

(declare-fun lt!195055 () (_ BitVec 64))

(assert (=> d!40022 (= res!102398 (= lt!195055 (bvsub lt!195056 lt!195060)))))

(assert (=> d!40022 (or (= (bvand lt!195056 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195060 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195056 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195056 lt!195060) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40022 (= lt!195060 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194258)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!194258))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!194258)))))))

(declare-fun lt!195058 () (_ BitVec 64))

(declare-fun lt!195059 () (_ BitVec 64))

(assert (=> d!40022 (= lt!195056 (bvmul lt!195058 lt!195059))))

(assert (=> d!40022 (or (= lt!195058 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195059 (bvsdiv (bvmul lt!195058 lt!195059) lt!195058)))))

(assert (=> d!40022 (= lt!195059 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40022 (= lt!195058 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194258)))))))

(assert (=> d!40022 (= lt!195055 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!194258))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!194258)))))))

(assert (=> d!40022 (invariant!0 (currentBit!5592 (_2!5467 lt!194258)) (currentByte!5597 (_2!5467 lt!194258)) (size!2460 (buf!2900 (_2!5467 lt!194258))))))

(assert (=> d!40022 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194258))) (currentByte!5597 (_2!5467 lt!194258)) (currentBit!5592 (_2!5467 lt!194258))) lt!195055)))

(declare-fun b!123529 () Bool)

(declare-fun res!102397 () Bool)

(assert (=> b!123529 (=> (not res!102397) (not e!80964))))

(assert (=> b!123529 (= res!102397 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195055))))

(declare-fun b!123530 () Bool)

(declare-fun lt!195057 () (_ BitVec 64))

(assert (=> b!123530 (= e!80964 (bvsle lt!195055 (bvmul lt!195057 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123530 (or (= lt!195057 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195057 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195057)))))

(assert (=> b!123530 (= lt!195057 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194258)))))))

(assert (= (and d!40022 res!102398) b!123529))

(assert (= (and b!123529 res!102397) b!123530))

(declare-fun m!188323 () Bool)

(assert (=> d!40022 m!188323))

(declare-fun m!188325 () Bool)

(assert (=> d!40022 m!188325))

(assert (=> b!123119 d!40022))

(declare-fun d!40024 () Bool)

(assert (=> d!40024 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194258)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401))) lt!194265) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194258)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401)))) lt!194265))))

(declare-fun bs!9662 () Bool)

(assert (= bs!9662 d!40024))

(declare-fun m!188327 () Bool)

(assert (=> bs!9662 m!188327))

(assert (=> b!123119 d!40024))

(assert (=> b!123119 d!39952))

(declare-fun d!40026 () Bool)

(assert (=> d!40026 (= (invariant!0 (currentBit!5592 (_2!5467 lt!193401)) (currentByte!5597 (_2!5467 lt!193401)) (size!2460 (buf!2900 (_2!5467 lt!194275)))) (and (bvsge (currentBit!5592 (_2!5467 lt!193401)) #b00000000000000000000000000000000) (bvslt (currentBit!5592 (_2!5467 lt!193401)) #b00000000000000000000000000001000) (bvsge (currentByte!5597 (_2!5467 lt!193401)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5597 (_2!5467 lt!193401)) (size!2460 (buf!2900 (_2!5467 lt!194275)))) (and (= (currentBit!5592 (_2!5467 lt!193401)) #b00000000000000000000000000000000) (= (currentByte!5597 (_2!5467 lt!193401)) (size!2460 (buf!2900 (_2!5467 lt!194275))))))))))

(assert (=> b!123119 d!40026))

(declare-fun d!40028 () Bool)

(declare-fun res!102401 () Bool)

(declare-fun e!80965 () Bool)

(assert (=> d!40028 (=> (not res!102401) (not e!80965))))

(assert (=> d!40028 (= res!102401 (= (size!2460 (buf!2900 (_2!5467 lt!193401))) (size!2460 (buf!2900 (_2!5467 lt!194258)))))))

(assert (=> d!40028 (= (isPrefixOf!0 (_2!5467 lt!193401) (_2!5467 lt!194258)) e!80965)))

(declare-fun b!123531 () Bool)

(declare-fun res!102400 () Bool)

(assert (=> b!123531 (=> (not res!102400) (not e!80965))))

(assert (=> b!123531 (= res!102400 (bvsle (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194258))) (currentByte!5597 (_2!5467 lt!194258)) (currentBit!5592 (_2!5467 lt!194258)))))))

(declare-fun b!123532 () Bool)

(declare-fun e!80966 () Bool)

(assert (=> b!123532 (= e!80965 e!80966)))

(declare-fun res!102399 () Bool)

(assert (=> b!123532 (=> res!102399 e!80966)))

(assert (=> b!123532 (= res!102399 (= (size!2460 (buf!2900 (_2!5467 lt!193401))) #b00000000000000000000000000000000))))

(declare-fun b!123533 () Bool)

(assert (=> b!123533 (= e!80966 (arrayBitRangesEq!0 (buf!2900 (_2!5467 lt!193401)) (buf!2900 (_2!5467 lt!194258)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401)))))))

(assert (= (and d!40028 res!102401) b!123531))

(assert (= (and b!123531 res!102400) b!123532))

(assert (= (and b!123532 (not res!102399)) b!123533))

(assert (=> b!123531 m!186641))

(assert (=> b!123531 m!187341))

(assert (=> b!123533 m!186641))

(assert (=> b!123533 m!186641))

(declare-fun m!188329 () Bool)

(assert (=> b!123533 m!188329))

(assert (=> b!123119 d!40028))

(declare-fun d!40030 () Bool)

(declare-fun e!80968 () Bool)

(assert (=> d!40030 e!80968))

(declare-fun res!102403 () Bool)

(assert (=> d!40030 (=> (not res!102403) (not e!80968))))

(declare-fun lt!195061 () tuple2!10404)

(assert (=> d!40030 (= res!102403 (= (size!2460 (buf!2900 (_2!5467 lt!193401))) (size!2460 (buf!2900 (_2!5467 lt!195061)))))))

(assert (=> d!40030 (= lt!195061 (choose!16 (_2!5467 lt!193401) lt!194254))))

(assert (=> d!40030 (validate_offset_bit!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193401)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401))))))

(assert (=> d!40030 (= (appendBit!0 (_2!5467 lt!193401) lt!194254) lt!195061)))

(declare-fun b!123535 () Bool)

(declare-fun res!102402 () Bool)

(assert (=> b!123535 (=> (not res!102402) (not e!80968))))

(assert (=> b!123535 (= res!102402 (isPrefixOf!0 (_2!5467 lt!193401) (_2!5467 lt!195061)))))

(declare-fun b!123536 () Bool)

(declare-fun e!80967 () Bool)

(assert (=> b!123536 (= e!80968 e!80967)))

(declare-fun res!102404 () Bool)

(assert (=> b!123536 (=> (not res!102404) (not e!80967))))

(declare-fun lt!195062 () tuple2!10406)

(assert (=> b!123536 (= res!102404 (and (= (_2!5468 lt!195062) lt!194254) (= (_1!5468 lt!195062) (_2!5467 lt!195061))))))

(assert (=> b!123536 (= lt!195062 (readBitPure!0 (readerFrom!0 (_2!5467 lt!195061) (currentBit!5592 (_2!5467 lt!193401)) (currentByte!5597 (_2!5467 lt!193401)))))))

(declare-fun b!123537 () Bool)

(assert (=> b!123537 (= e!80967 (= (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!195062))) (currentByte!5597 (_1!5468 lt!195062)) (currentBit!5592 (_1!5468 lt!195062))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!195061))) (currentByte!5597 (_2!5467 lt!195061)) (currentBit!5592 (_2!5467 lt!195061)))))))

(declare-fun b!123534 () Bool)

(declare-fun res!102405 () Bool)

(assert (=> b!123534 (=> (not res!102405) (not e!80968))))

(declare-fun lt!195064 () (_ BitVec 64))

(declare-fun lt!195063 () (_ BitVec 64))

(assert (=> b!123534 (= res!102405 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!195061))) (currentByte!5597 (_2!5467 lt!195061)) (currentBit!5592 (_2!5467 lt!195061))) (bvadd lt!195064 lt!195063)))))

(assert (=> b!123534 (or (not (= (bvand lt!195064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195063 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195064 lt!195063) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123534 (= lt!195063 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!123534 (= lt!195064 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))))))

(assert (= (and d!40030 res!102403) b!123534))

(assert (= (and b!123534 res!102405) b!123535))

(assert (= (and b!123535 res!102402) b!123536))

(assert (= (and b!123536 res!102404) b!123537))

(declare-fun m!188331 () Bool)

(assert (=> b!123536 m!188331))

(assert (=> b!123536 m!188331))

(declare-fun m!188333 () Bool)

(assert (=> b!123536 m!188333))

(declare-fun m!188335 () Bool)

(assert (=> b!123534 m!188335))

(assert (=> b!123534 m!186641))

(declare-fun m!188337 () Bool)

(assert (=> d!40030 m!188337))

(declare-fun m!188339 () Bool)

(assert (=> d!40030 m!188339))

(declare-fun m!188341 () Bool)

(assert (=> b!123537 m!188341))

(assert (=> b!123537 m!188335))

(declare-fun m!188343 () Bool)

(assert (=> b!123535 m!188343))

(assert (=> b!123119 d!40030))

(declare-fun d!40032 () Bool)

(assert (=> d!40032 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194258)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!194275))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!194275))) lt!194279) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194258)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!194275))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!194275)))) lt!194279))))

(declare-fun bs!9663 () Bool)

(assert (= bs!9663 d!40032))

(declare-fun m!188345 () Bool)

(assert (=> bs!9663 m!188345))

(assert (=> b!123119 d!40032))

(declare-fun d!40034 () Bool)

(declare-fun e!80969 () Bool)

(assert (=> d!40034 e!80969))

(declare-fun res!102406 () Bool)

(assert (=> d!40034 (=> (not res!102406) (not e!80969))))

(declare-fun lt!195065 () BitStream!4394)

(declare-fun lt!195066 () (_ BitVec 64))

(assert (=> d!40034 (= res!102406 (= (bvadd lt!195066 (bvsub (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194275))) (currentByte!5597 (_2!5467 lt!194275)) (currentBit!5592 (_2!5467 lt!194275))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194258))) (currentByte!5597 (_2!5467 lt!194258)) (currentBit!5592 (_2!5467 lt!194258))))) (bitIndex!0 (size!2460 (buf!2900 lt!195065)) (currentByte!5597 lt!195065) (currentBit!5592 lt!195065))))))

(assert (=> d!40034 (or (not (= (bvand lt!195066 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194275))) (currentByte!5597 (_2!5467 lt!194275)) (currentBit!5592 (_2!5467 lt!194275))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194258))) (currentByte!5597 (_2!5467 lt!194258)) (currentBit!5592 (_2!5467 lt!194258)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195066 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195066 (bvsub (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194275))) (currentByte!5597 (_2!5467 lt!194275)) (currentBit!5592 (_2!5467 lt!194275))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194258))) (currentByte!5597 (_2!5467 lt!194258)) (currentBit!5592 (_2!5467 lt!194258))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40034 (= lt!195066 (bitIndex!0 (size!2460 (buf!2900 (_2!5466 lt!194291))) (currentByte!5597 (_2!5466 lt!194291)) (currentBit!5592 (_2!5466 lt!194291))))))

(assert (=> d!40034 (= lt!195065 (_2!5467 (moveBitIndex!0 (_2!5466 lt!194291) (bvsub (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194275))) (currentByte!5597 (_2!5467 lt!194275)) (currentBit!5592 (_2!5467 lt!194275))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194258))) (currentByte!5597 (_2!5467 lt!194258)) (currentBit!5592 (_2!5467 lt!194258)))))))))

(assert (=> d!40034 (moveBitIndexPrecond!0 (_2!5466 lt!194291) (bvsub (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194275))) (currentByte!5597 (_2!5467 lt!194275)) (currentBit!5592 (_2!5467 lt!194275))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194258))) (currentByte!5597 (_2!5467 lt!194258)) (currentBit!5592 (_2!5467 lt!194258)))))))

(assert (=> d!40034 (= (withMovedBitIndex!0 (_2!5466 lt!194291) (bvsub (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194275))) (currentByte!5597 (_2!5467 lt!194275)) (currentBit!5592 (_2!5467 lt!194275))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194258))) (currentByte!5597 (_2!5467 lt!194258)) (currentBit!5592 (_2!5467 lt!194258))))) lt!195065)))

(declare-fun b!123538 () Bool)

(assert (=> b!123538 (= e!80969 (= (size!2460 (buf!2900 (_2!5466 lt!194291))) (size!2460 (buf!2900 lt!195065))))))

(assert (= (and d!40034 res!102406) b!123538))

(declare-fun m!188347 () Bool)

(assert (=> d!40034 m!188347))

(declare-fun m!188349 () Bool)

(assert (=> d!40034 m!188349))

(declare-fun m!188351 () Bool)

(assert (=> d!40034 m!188351))

(declare-fun m!188353 () Bool)

(assert (=> d!40034 m!188353))

(assert (=> b!123119 d!40034))

(declare-fun d!40036 () Bool)

(declare-fun e!80970 () Bool)

(assert (=> d!40036 e!80970))

(declare-fun res!102408 () Bool)

(assert (=> d!40036 (=> (not res!102408) (not e!80970))))

(declare-fun lt!195067 () (_ BitVec 64))

(declare-fun lt!195072 () (_ BitVec 64))

(declare-fun lt!195068 () (_ BitVec 64))

(assert (=> d!40036 (= res!102408 (= lt!195067 (bvsub lt!195068 lt!195072)))))

(assert (=> d!40036 (or (= (bvand lt!195068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195072 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195068 lt!195072) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40036 (= lt!195072 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194275)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!194275))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!194275)))))))

(declare-fun lt!195070 () (_ BitVec 64))

(declare-fun lt!195071 () (_ BitVec 64))

(assert (=> d!40036 (= lt!195068 (bvmul lt!195070 lt!195071))))

(assert (=> d!40036 (or (= lt!195070 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195071 (bvsdiv (bvmul lt!195070 lt!195071) lt!195070)))))

(assert (=> d!40036 (= lt!195071 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40036 (= lt!195070 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194275)))))))

(assert (=> d!40036 (= lt!195067 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!194275))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!194275)))))))

(assert (=> d!40036 (invariant!0 (currentBit!5592 (_2!5467 lt!194275)) (currentByte!5597 (_2!5467 lt!194275)) (size!2460 (buf!2900 (_2!5467 lt!194275))))))

(assert (=> d!40036 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194275))) (currentByte!5597 (_2!5467 lt!194275)) (currentBit!5592 (_2!5467 lt!194275))) lt!195067)))

(declare-fun b!123539 () Bool)

(declare-fun res!102407 () Bool)

(assert (=> b!123539 (=> (not res!102407) (not e!80970))))

(assert (=> b!123539 (= res!102407 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195067))))

(declare-fun b!123540 () Bool)

(declare-fun lt!195069 () (_ BitVec 64))

(assert (=> b!123540 (= e!80970 (bvsle lt!195067 (bvmul lt!195069 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123540 (or (= lt!195069 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195069 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195069)))))

(assert (=> b!123540 (= lt!195069 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194275)))))))

(assert (= (and d!40036 res!102408) b!123539))

(assert (= (and b!123539 res!102407) b!123540))

(declare-fun m!188355 () Bool)

(assert (=> d!40036 m!188355))

(declare-fun m!188357 () Bool)

(assert (=> d!40036 m!188357))

(assert (=> b!123119 d!40036))

(declare-fun d!40038 () Bool)

(declare-fun e!80971 () Bool)

(assert (=> d!40038 e!80971))

(declare-fun res!102409 () Bool)

(assert (=> d!40038 (=> (not res!102409) (not e!80971))))

(declare-fun lt!195074 () (_ BitVec 64))

(declare-fun lt!195073 () BitStream!4394)

(assert (=> d!40038 (= res!102409 (= (bvadd lt!195074 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2460 (buf!2900 lt!195073)) (currentByte!5597 lt!195073) (currentBit!5592 lt!195073))))))

(assert (=> d!40038 (or (not (= (bvand lt!195074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195074 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40038 (= lt!195074 (bitIndex!0 (size!2460 (buf!2900 (_1!5466 lt!194270))) (currentByte!5597 (_1!5466 lt!194270)) (currentBit!5592 (_1!5466 lt!194270))))))

(assert (=> d!40038 (= lt!195073 (_2!5467 (moveBitIndex!0 (_1!5466 lt!194270) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!40038 (moveBitIndexPrecond!0 (_1!5466 lt!194270) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!40038 (= (withMovedBitIndex!0 (_1!5466 lt!194270) #b0000000000000000000000000000000000000000000000000000000000000001) lt!195073)))

(declare-fun b!123541 () Bool)

(assert (=> b!123541 (= e!80971 (= (size!2460 (buf!2900 (_1!5466 lt!194270))) (size!2460 (buf!2900 lt!195073))))))

(assert (= (and d!40038 res!102409) b!123541))

(declare-fun m!188359 () Bool)

(assert (=> d!40038 m!188359))

(declare-fun m!188361 () Bool)

(assert (=> d!40038 m!188361))

(declare-fun m!188363 () Bool)

(assert (=> d!40038 m!188363))

(declare-fun m!188365 () Bool)

(assert (=> d!40038 m!188365))

(assert (=> b!123119 d!40038))

(declare-fun d!40040 () Bool)

(declare-fun lt!195075 () tuple2!10418)

(assert (=> d!40040 (= lt!195075 (readBit!0 (_1!5466 lt!194270)))))

(assert (=> d!40040 (= (readBitPure!0 (_1!5466 lt!194270)) (tuple2!10407 (_2!5474 lt!195075) (_1!5474 lt!195075)))))

(declare-fun bs!9664 () Bool)

(assert (= bs!9664 d!40040))

(declare-fun m!188367 () Bool)

(assert (=> bs!9664 m!188367))

(assert (=> b!123119 d!40040))

(declare-fun d!40042 () Bool)

(assert (=> d!40042 (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194258)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!194275))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!194275))) lt!194279)))

(declare-fun lt!195076 () Unit!7559)

(assert (=> d!40042 (= lt!195076 (choose!9 (_2!5467 lt!194275) (buf!2900 (_2!5467 lt!194258)) lt!194279 (BitStream!4395 (buf!2900 (_2!5467 lt!194258)) (currentByte!5597 (_2!5467 lt!194275)) (currentBit!5592 (_2!5467 lt!194275)))))))

(assert (=> d!40042 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5467 lt!194275) (buf!2900 (_2!5467 lt!194258)) lt!194279) lt!195076)))

(declare-fun bs!9665 () Bool)

(assert (= bs!9665 d!40042))

(assert (=> bs!9665 m!187347))

(declare-fun m!188369 () Bool)

(assert (=> bs!9665 m!188369))

(assert (=> b!123119 d!40042))

(declare-fun d!40044 () Bool)

(declare-fun e!80972 () Bool)

(assert (=> d!40044 e!80972))

(declare-fun res!102411 () Bool)

(assert (=> d!40044 (=> (not res!102411) (not e!80972))))

(declare-fun lt!195077 () (_ BitVec 64))

(declare-fun lt!195082 () (_ BitVec 64))

(declare-fun lt!195078 () (_ BitVec 64))

(assert (=> d!40044 (= res!102411 (= lt!195077 (bvsub lt!195078 lt!195082)))))

(assert (=> d!40044 (or (= (bvand lt!195078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195082 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195078 lt!195082) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40044 (= lt!195082 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!194277)))) ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!194277))) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!194277)))))))

(declare-fun lt!195080 () (_ BitVec 64))

(declare-fun lt!195081 () (_ BitVec 64))

(assert (=> d!40044 (= lt!195078 (bvmul lt!195080 lt!195081))))

(assert (=> d!40044 (or (= lt!195080 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195081 (bvsdiv (bvmul lt!195080 lt!195081) lt!195080)))))

(assert (=> d!40044 (= lt!195081 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40044 (= lt!195080 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!194277)))))))

(assert (=> d!40044 (= lt!195077 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!194277))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!194277)))))))

(assert (=> d!40044 (invariant!0 (currentBit!5592 (_1!5468 lt!194277)) (currentByte!5597 (_1!5468 lt!194277)) (size!2460 (buf!2900 (_1!5468 lt!194277))))))

(assert (=> d!40044 (= (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!194277))) (currentByte!5597 (_1!5468 lt!194277)) (currentBit!5592 (_1!5468 lt!194277))) lt!195077)))

(declare-fun b!123542 () Bool)

(declare-fun res!102410 () Bool)

(assert (=> b!123542 (=> (not res!102410) (not e!80972))))

(assert (=> b!123542 (= res!102410 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195077))))

(declare-fun b!123543 () Bool)

(declare-fun lt!195079 () (_ BitVec 64))

(assert (=> b!123543 (= e!80972 (bvsle lt!195077 (bvmul lt!195079 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123543 (or (= lt!195079 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195079 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195079)))))

(assert (=> b!123543 (= lt!195079 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!194277)))))))

(assert (= (and d!40044 res!102411) b!123542))

(assert (= (and b!123542 res!102410) b!123543))

(declare-fun m!188371 () Bool)

(assert (=> d!40044 m!188371))

(declare-fun m!188373 () Bool)

(assert (=> d!40044 m!188373))

(assert (=> b!123119 d!40044))

(declare-fun d!40046 () Bool)

(declare-fun lt!195085 () tuple2!10400)

(declare-fun lt!195086 () tuple2!10400)

(assert (=> d!40046 (and (= (_2!5465 lt!195085) (_2!5465 lt!195086)) (= (_1!5465 lt!195085) (_1!5465 lt!195086)))))

(declare-fun lt!195087 () Bool)

(declare-fun lt!195083 () BitStream!4394)

(declare-fun lt!195088 () (_ BitVec 64))

(declare-fun lt!195084 () Unit!7559)

(assert (=> d!40046 (= lt!195084 (choose!45 (_1!5466 lt!194270) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!194269 lt!195085 (tuple2!10401 (_1!5465 lt!195085) (_2!5465 lt!195085)) (_1!5465 lt!195085) (_2!5465 lt!195085) lt!195087 lt!195083 lt!195088 lt!195086 (tuple2!10401 (_1!5465 lt!195086) (_2!5465 lt!195086)) (_1!5465 lt!195086) (_2!5465 lt!195086)))))

(assert (=> d!40046 (= lt!195086 (readNLeastSignificantBitsLoopPure!0 lt!195083 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!195088))))

(assert (=> d!40046 (= lt!195088 (bvor lt!194269 (ite lt!195087 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40046 (= lt!195083 (withMovedBitIndex!0 (_1!5466 lt!194270) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!40046 (= lt!195087 (_2!5468 (readBitPure!0 (_1!5466 lt!194270))))))

(assert (=> d!40046 (= lt!195085 (readNLeastSignificantBitsLoopPure!0 (_1!5466 lt!194270) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!194269))))

(assert (=> d!40046 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5466 lt!194270) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!194269) lt!195084)))

(declare-fun bs!9666 () Bool)

(assert (= bs!9666 d!40046))

(declare-fun m!188375 () Bool)

(assert (=> bs!9666 m!188375))

(declare-fun m!188377 () Bool)

(assert (=> bs!9666 m!188377))

(assert (=> bs!9666 m!187327))

(assert (=> bs!9666 m!187329))

(assert (=> bs!9666 m!187305))

(assert (=> b!123119 d!40046))

(assert (=> b!123119 d!39546))

(declare-fun lt!195089 () tuple2!10412)

(declare-fun d!40048 () Bool)

(assert (=> d!40048 (= lt!195089 (readNLeastSignificantBitsLoop!0 (_1!5466 lt!194270) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!194269))))

(assert (=> d!40048 (= (readNLeastSignificantBitsLoopPure!0 (_1!5466 lt!194270) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!194269) (tuple2!10401 (_2!5471 lt!195089) (_1!5471 lt!195089)))))

(declare-fun bs!9667 () Bool)

(assert (= bs!9667 d!40048))

(declare-fun m!188379 () Bool)

(assert (=> bs!9667 m!188379))

(assert (=> b!123119 d!40048))

(declare-fun d!40050 () Bool)

(declare-fun res!102414 () Bool)

(declare-fun e!80973 () Bool)

(assert (=> d!40050 (=> (not res!102414) (not e!80973))))

(assert (=> d!40050 (= res!102414 (= (size!2460 (buf!2900 (_2!5467 lt!193401))) (size!2460 (buf!2900 (_2!5467 lt!194286)))))))

(assert (=> d!40050 (= (isPrefixOf!0 (_2!5467 lt!193401) (_2!5467 lt!194286)) e!80973)))

(declare-fun b!123544 () Bool)

(declare-fun res!102413 () Bool)

(assert (=> b!123544 (=> (not res!102413) (not e!80973))))

(assert (=> b!123544 (= res!102413 (bvsle (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194286))) (currentByte!5597 (_2!5467 lt!194286)) (currentBit!5592 (_2!5467 lt!194286)))))))

(declare-fun b!123545 () Bool)

(declare-fun e!80974 () Bool)

(assert (=> b!123545 (= e!80973 e!80974)))

(declare-fun res!102412 () Bool)

(assert (=> b!123545 (=> res!102412 e!80974)))

(assert (=> b!123545 (= res!102412 (= (size!2460 (buf!2900 (_2!5467 lt!193401))) #b00000000000000000000000000000000))))

(declare-fun b!123546 () Bool)

(assert (=> b!123546 (= e!80974 (arrayBitRangesEq!0 (buf!2900 (_2!5467 lt!193401)) (buf!2900 (_2!5467 lt!194286)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401)))))))

(assert (= (and d!40050 res!102414) b!123544))

(assert (= (and b!123544 res!102413) b!123545))

(assert (= (and b!123545 (not res!102412)) b!123546))

(assert (=> b!123544 m!186641))

(assert (=> b!123544 m!187287))

(assert (=> b!123546 m!186641))

(assert (=> b!123546 m!186641))

(declare-fun m!188381 () Bool)

(assert (=> b!123546 m!188381))

(assert (=> b!123121 d!40050))

(declare-fun d!40052 () Bool)

(declare-fun e!80975 () Bool)

(assert (=> d!40052 e!80975))

(declare-fun res!102416 () Bool)

(assert (=> d!40052 (=> (not res!102416) (not e!80975))))

(declare-fun lt!195095 () (_ BitVec 64))

(declare-fun lt!195091 () (_ BitVec 64))

(declare-fun lt!195090 () (_ BitVec 64))

(assert (=> d!40052 (= res!102416 (= lt!195090 (bvsub lt!195091 lt!195095)))))

(assert (=> d!40052 (or (= (bvand lt!195091 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195095 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195091 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195091 lt!195095) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40052 (= lt!195095 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 lt!193580))) ((_ sign_extend 32) (currentByte!5597 lt!193580)) ((_ sign_extend 32) (currentBit!5592 lt!193580))))))

(declare-fun lt!195093 () (_ BitVec 64))

(declare-fun lt!195094 () (_ BitVec 64))

(assert (=> d!40052 (= lt!195091 (bvmul lt!195093 lt!195094))))

(assert (=> d!40052 (or (= lt!195093 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195094 (bvsdiv (bvmul lt!195093 lt!195094) lt!195093)))))

(assert (=> d!40052 (= lt!195094 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40052 (= lt!195093 ((_ sign_extend 32) (size!2460 (buf!2900 lt!193580))))))

(assert (=> d!40052 (= lt!195090 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 lt!193580)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 lt!193580))))))

(assert (=> d!40052 (invariant!0 (currentBit!5592 lt!193580) (currentByte!5597 lt!193580) (size!2460 (buf!2900 lt!193580)))))

(assert (=> d!40052 (= (bitIndex!0 (size!2460 (buf!2900 lt!193580)) (currentByte!5597 lt!193580) (currentBit!5592 lt!193580)) lt!195090)))

(declare-fun b!123547 () Bool)

(declare-fun res!102415 () Bool)

(assert (=> b!123547 (=> (not res!102415) (not e!80975))))

(assert (=> b!123547 (= res!102415 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195090))))

(declare-fun b!123548 () Bool)

(declare-fun lt!195092 () (_ BitVec 64))

(assert (=> b!123548 (= e!80975 (bvsle lt!195090 (bvmul lt!195092 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123548 (or (= lt!195092 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195092 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195092)))))

(assert (=> b!123548 (= lt!195092 ((_ sign_extend 32) (size!2460 (buf!2900 lt!193580))))))

(assert (= (and d!40052 res!102416) b!123547))

(assert (= (and b!123547 res!102415) b!123548))

(declare-fun m!188383 () Bool)

(assert (=> d!40052 m!188383))

(declare-fun m!188385 () Bool)

(assert (=> d!40052 m!188385))

(assert (=> d!39550 d!40052))

(declare-fun d!40054 () Bool)

(declare-fun e!80976 () Bool)

(assert (=> d!40054 e!80976))

(declare-fun res!102418 () Bool)

(assert (=> d!40054 (=> (not res!102418) (not e!80976))))

(declare-fun lt!195097 () (_ BitVec 64))

(declare-fun lt!195096 () (_ BitVec 64))

(declare-fun lt!195101 () (_ BitVec 64))

(assert (=> d!40054 (= res!102418 (= lt!195096 (bvsub lt!195097 lt!195101)))))

(assert (=> d!40054 (or (= (bvand lt!195097 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195101 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195097 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195097 lt!195101) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40054 (= lt!195101 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5466 lt!193409)))) ((_ sign_extend 32) (currentByte!5597 (_2!5466 lt!193409))) ((_ sign_extend 32) (currentBit!5592 (_2!5466 lt!193409)))))))

(declare-fun lt!195099 () (_ BitVec 64))

(declare-fun lt!195100 () (_ BitVec 64))

(assert (=> d!40054 (= lt!195097 (bvmul lt!195099 lt!195100))))

(assert (=> d!40054 (or (= lt!195099 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195100 (bvsdiv (bvmul lt!195099 lt!195100) lt!195099)))))

(assert (=> d!40054 (= lt!195100 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40054 (= lt!195099 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5466 lt!193409)))))))

(assert (=> d!40054 (= lt!195096 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_2!5466 lt!193409))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_2!5466 lt!193409)))))))

(assert (=> d!40054 (invariant!0 (currentBit!5592 (_2!5466 lt!193409)) (currentByte!5597 (_2!5466 lt!193409)) (size!2460 (buf!2900 (_2!5466 lt!193409))))))

(assert (=> d!40054 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5466 lt!193409))) (currentByte!5597 (_2!5466 lt!193409)) (currentBit!5592 (_2!5466 lt!193409))) lt!195096)))

(declare-fun b!123549 () Bool)

(declare-fun res!102417 () Bool)

(assert (=> b!123549 (=> (not res!102417) (not e!80976))))

(assert (=> b!123549 (= res!102417 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195096))))

(declare-fun b!123550 () Bool)

(declare-fun lt!195098 () (_ BitVec 64))

(assert (=> b!123550 (= e!80976 (bvsle lt!195096 (bvmul lt!195098 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123550 (or (= lt!195098 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195098 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195098)))))

(assert (=> b!123550 (= lt!195098 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5466 lt!193409)))))))

(assert (= (and d!40054 res!102418) b!123549))

(assert (= (and b!123549 res!102417) b!123550))

(declare-fun m!188387 () Bool)

(assert (=> d!40054 m!188387))

(declare-fun m!188389 () Bool)

(assert (=> d!40054 m!188389))

(assert (=> d!39550 d!40054))

(declare-fun d!40056 () Bool)

(declare-fun lt!195118 () (_ BitVec 32))

(assert (=> d!40056 (= lt!195118 ((_ extract 31 0) (bvsrem (bvsub lt!193407 lt!193410) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!195116 () (_ BitVec 32))

(assert (=> d!40056 (= lt!195116 ((_ extract 31 0) (bvsdiv (bvsub lt!193407 lt!193410) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!80982 () Bool)

(assert (=> d!40056 e!80982))

(declare-fun res!102424 () Bool)

(assert (=> d!40056 (=> (not res!102424) (not e!80982))))

(assert (=> d!40056 (= res!102424 (moveBitIndexPrecond!0 (_2!5466 lt!193409) (bvsub lt!193407 lt!193410)))))

(declare-fun Unit!7621 () Unit!7559)

(declare-fun Unit!7622 () Unit!7559)

(declare-fun Unit!7623 () Unit!7559)

(assert (=> d!40056 (= (moveBitIndex!0 (_2!5466 lt!193409) (bvsub lt!193407 lt!193410)) (ite (bvslt (bvadd (currentBit!5592 (_2!5466 lt!193409)) lt!195118) #b00000000000000000000000000000000) (tuple2!10405 Unit!7621 (BitStream!4395 (buf!2900 (_2!5466 lt!193409)) (bvsub (bvadd (currentByte!5597 (_2!5466 lt!193409)) lt!195116) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!195118 (currentBit!5592 (_2!5466 lt!193409))))) (ite (bvsge (bvadd (currentBit!5592 (_2!5466 lt!193409)) lt!195118) #b00000000000000000000000000001000) (tuple2!10405 Unit!7622 (BitStream!4395 (buf!2900 (_2!5466 lt!193409)) (bvadd (currentByte!5597 (_2!5466 lt!193409)) lt!195116 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5592 (_2!5466 lt!193409)) lt!195118) #b00000000000000000000000000001000))) (tuple2!10405 Unit!7623 (BitStream!4395 (buf!2900 (_2!5466 lt!193409)) (bvadd (currentByte!5597 (_2!5466 lt!193409)) lt!195116) (bvadd (currentBit!5592 (_2!5466 lt!193409)) lt!195118))))))))

(declare-fun b!123555 () Bool)

(declare-fun e!80981 () Bool)

(assert (=> b!123555 (= e!80982 e!80981)))

(declare-fun res!102423 () Bool)

(assert (=> b!123555 (=> (not res!102423) (not e!80981))))

(declare-fun lt!195114 () (_ BitVec 64))

(declare-fun lt!195119 () tuple2!10404)

(assert (=> b!123555 (= res!102423 (= (bvadd lt!195114 (bvsub lt!193407 lt!193410)) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!195119))) (currentByte!5597 (_2!5467 lt!195119)) (currentBit!5592 (_2!5467 lt!195119)))))))

(assert (=> b!123555 (or (not (= (bvand lt!195114 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193407 lt!193410) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195114 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195114 (bvsub lt!193407 lt!193410)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123555 (= lt!195114 (bitIndex!0 (size!2460 (buf!2900 (_2!5466 lt!193409))) (currentByte!5597 (_2!5466 lt!193409)) (currentBit!5592 (_2!5466 lt!193409))))))

(declare-fun lt!195115 () (_ BitVec 32))

(declare-fun lt!195117 () (_ BitVec 32))

(declare-fun Unit!7624 () Unit!7559)

(declare-fun Unit!7625 () Unit!7559)

(declare-fun Unit!7626 () Unit!7559)

(assert (=> b!123555 (= lt!195119 (ite (bvslt (bvadd (currentBit!5592 (_2!5466 lt!193409)) lt!195115) #b00000000000000000000000000000000) (tuple2!10405 Unit!7624 (BitStream!4395 (buf!2900 (_2!5466 lt!193409)) (bvsub (bvadd (currentByte!5597 (_2!5466 lt!193409)) lt!195117) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!195115 (currentBit!5592 (_2!5466 lt!193409))))) (ite (bvsge (bvadd (currentBit!5592 (_2!5466 lt!193409)) lt!195115) #b00000000000000000000000000001000) (tuple2!10405 Unit!7625 (BitStream!4395 (buf!2900 (_2!5466 lt!193409)) (bvadd (currentByte!5597 (_2!5466 lt!193409)) lt!195117 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5592 (_2!5466 lt!193409)) lt!195115) #b00000000000000000000000000001000))) (tuple2!10405 Unit!7626 (BitStream!4395 (buf!2900 (_2!5466 lt!193409)) (bvadd (currentByte!5597 (_2!5466 lt!193409)) lt!195117) (bvadd (currentBit!5592 (_2!5466 lt!193409)) lt!195115))))))))

(assert (=> b!123555 (= lt!195115 ((_ extract 31 0) (bvsrem (bvsub lt!193407 lt!193410) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123555 (= lt!195117 ((_ extract 31 0) (bvsdiv (bvsub lt!193407 lt!193410) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!123556 () Bool)

(assert (=> b!123556 (= e!80981 (and (= (size!2460 (buf!2900 (_2!5466 lt!193409))) (size!2460 (buf!2900 (_2!5467 lt!195119)))) (= (buf!2900 (_2!5466 lt!193409)) (buf!2900 (_2!5467 lt!195119)))))))

(assert (= (and d!40056 res!102424) b!123555))

(assert (= (and b!123555 res!102423) b!123556))

(assert (=> d!40056 m!186825))

(declare-fun m!188391 () Bool)

(assert (=> b!123555 m!188391))

(assert (=> b!123555 m!186821))

(assert (=> d!39550 d!40056))

(declare-fun d!40060 () Bool)

(declare-fun res!102427 () Bool)

(declare-fun e!80985 () Bool)

(assert (=> d!40060 (=> (not res!102427) (not e!80985))))

(assert (=> d!40060 (= res!102427 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5466 lt!193409))))) (bvsub lt!193407 lt!193410)) (bvsle (bvsub lt!193407 lt!193410) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5466 lt!193409))))))))))

(assert (=> d!40060 (= (moveBitIndexPrecond!0 (_2!5466 lt!193409) (bvsub lt!193407 lt!193410)) e!80985)))

(declare-fun b!123560 () Bool)

(declare-fun lt!195122 () (_ BitVec 64))

(assert (=> b!123560 (= e!80985 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195122) (bvsle lt!195122 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5466 lt!193409))))))))))

(assert (=> b!123560 (= lt!195122 (bvadd (bitIndex!0 (size!2460 (buf!2900 (_2!5466 lt!193409))) (currentByte!5597 (_2!5466 lt!193409)) (currentBit!5592 (_2!5466 lt!193409))) (bvsub lt!193407 lt!193410)))))

(assert (= (and d!40060 res!102427) b!123560))

(assert (=> b!123560 m!186821))

(assert (=> d!39550 d!40060))

(assert (=> b!122874 d!39548))

(assert (=> b!122874 d!39546))

(declare-fun d!40062 () Bool)

(assert (=> d!40062 (isPrefixOf!0 lt!194281 lt!194281)))

(declare-fun lt!195123 () Unit!7559)

(assert (=> d!40062 (= lt!195123 (choose!11 lt!194281))))

(assert (=> d!40062 (= (lemmaIsPrefixRefl!0 lt!194281) lt!195123)))

(declare-fun bs!9668 () Bool)

(assert (= bs!9668 d!40062))

(declare-fun m!188393 () Bool)

(assert (=> bs!9668 m!188393))

(declare-fun m!188395 () Bool)

(assert (=> bs!9668 m!188395))

(assert (=> b!123118 d!40062))

(declare-fun d!40064 () Bool)

(assert (=> d!40064 (= (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 thiss!1305))) ((_ sign_extend 32) (currentByte!5597 thiss!1305)) ((_ sign_extend 32) (currentBit!5592 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2460 (buf!2900 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 thiss!1305)))))))

(assert (=> d!39516 d!40064))

(assert (=> d!39582 d!39574))

(declare-fun d!40066 () Bool)

(assert (=> d!40066 (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193395)))) ((_ sign_extend 32) (currentByte!5597 thiss!1305)) ((_ sign_extend 32) (currentBit!5592 thiss!1305)) lt!193394)))

(assert (=> d!40066 true))

(declare-fun _$6!260 () Unit!7559)

(assert (=> d!40066 (= (choose!9 thiss!1305 (buf!2900 (_2!5467 lt!193395)) lt!193394 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))) _$6!260)))

(declare-fun bs!9669 () Bool)

(assert (= bs!9669 d!40066))

(assert (=> bs!9669 m!186663))

(assert (=> d!39582 d!40066))

(declare-fun d!40068 () Bool)

(assert (=> d!40068 (isPrefixOf!0 (_2!5467 lt!193401) (_2!5467 lt!193401))))

(declare-fun lt!195124 () Unit!7559)

(assert (=> d!40068 (= lt!195124 (choose!11 (_2!5467 lt!193401)))))

(assert (=> d!40068 (= (lemmaIsPrefixRefl!0 (_2!5467 lt!193401)) lt!195124)))

(declare-fun bs!9670 () Bool)

(assert (= bs!9670 d!40068))

(assert (=> bs!9670 m!186909))

(declare-fun m!188397 () Bool)

(assert (=> bs!9670 m!188397))

(assert (=> d!39572 d!40068))

(declare-fun d!40070 () Bool)

(declare-fun res!102430 () Bool)

(declare-fun e!80986 () Bool)

(assert (=> d!40070 (=> (not res!102430) (not e!80986))))

(assert (=> d!40070 (= res!102430 (= (size!2460 (buf!2900 lt!193686)) (size!2460 (buf!2900 lt!193686))))))

(assert (=> d!40070 (= (isPrefixOf!0 lt!193686 lt!193686) e!80986)))

(declare-fun b!123561 () Bool)

(declare-fun res!102429 () Bool)

(assert (=> b!123561 (=> (not res!102429) (not e!80986))))

(assert (=> b!123561 (= res!102429 (bvsle (bitIndex!0 (size!2460 (buf!2900 lt!193686)) (currentByte!5597 lt!193686) (currentBit!5592 lt!193686)) (bitIndex!0 (size!2460 (buf!2900 lt!193686)) (currentByte!5597 lt!193686) (currentBit!5592 lt!193686))))))

(declare-fun b!123562 () Bool)

(declare-fun e!80987 () Bool)

(assert (=> b!123562 (= e!80986 e!80987)))

(declare-fun res!102428 () Bool)

(assert (=> b!123562 (=> res!102428 e!80987)))

(assert (=> b!123562 (= res!102428 (= (size!2460 (buf!2900 lt!193686)) #b00000000000000000000000000000000))))

(declare-fun b!123563 () Bool)

(assert (=> b!123563 (= e!80987 (arrayBitRangesEq!0 (buf!2900 lt!193686) (buf!2900 lt!193686) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 lt!193686)) (currentByte!5597 lt!193686) (currentBit!5592 lt!193686))))))

(assert (= (and d!40070 res!102430) b!123561))

(assert (= (and b!123561 res!102429) b!123562))

(assert (= (and b!123562 (not res!102428)) b!123563))

(declare-fun m!188399 () Bool)

(assert (=> b!123561 m!188399))

(assert (=> b!123561 m!188399))

(assert (=> b!123563 m!188399))

(assert (=> b!123563 m!188399))

(declare-fun m!188401 () Bool)

(assert (=> b!123563 m!188401))

(assert (=> d!39572 d!40070))

(assert (=> d!39572 d!39980))

(assert (=> d!39572 d!39982))

(declare-fun d!40072 () Bool)

(declare-fun res!102433 () Bool)

(declare-fun e!80988 () Bool)

(assert (=> d!40072 (=> (not res!102433) (not e!80988))))

(assert (=> d!40072 (= res!102433 (= (size!2460 (buf!2900 (_2!5467 lt!193401))) (size!2460 (buf!2900 (_2!5467 lt!193395)))))))

(assert (=> d!40072 (= (isPrefixOf!0 (_2!5467 lt!193401) (_2!5467 lt!193395)) e!80988)))

(declare-fun b!123564 () Bool)

(declare-fun res!102432 () Bool)

(assert (=> b!123564 (=> (not res!102432) (not e!80988))))

(assert (=> b!123564 (= res!102432 (bvsle (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193395))) (currentByte!5597 (_2!5467 lt!193395)) (currentBit!5592 (_2!5467 lt!193395)))))))

(declare-fun b!123565 () Bool)

(declare-fun e!80989 () Bool)

(assert (=> b!123565 (= e!80988 e!80989)))

(declare-fun res!102431 () Bool)

(assert (=> b!123565 (=> res!102431 e!80989)))

(assert (=> b!123565 (= res!102431 (= (size!2460 (buf!2900 (_2!5467 lt!193401))) #b00000000000000000000000000000000))))

(declare-fun b!123566 () Bool)

(assert (=> b!123566 (= e!80989 (arrayBitRangesEq!0 (buf!2900 (_2!5467 lt!193401)) (buf!2900 (_2!5467 lt!193395)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401)))))))

(assert (= (and d!40072 res!102433) b!123564))

(assert (= (and b!123564 res!102432) b!123565))

(assert (= (and b!123565 (not res!102431)) b!123566))

(assert (=> b!123564 m!186641))

(assert (=> b!123564 m!186709))

(assert (=> b!123566 m!186641))

(assert (=> b!123566 m!186641))

(declare-fun m!188403 () Bool)

(assert (=> b!123566 m!188403))

(assert (=> d!39572 d!40072))

(declare-fun d!40074 () Bool)

(declare-fun res!102436 () Bool)

(declare-fun e!80990 () Bool)

(assert (=> d!40074 (=> (not res!102436) (not e!80990))))

(assert (=> d!40074 (= res!102436 (= (size!2460 (buf!2900 (_2!5467 lt!193401))) (size!2460 (buf!2900 (_2!5467 lt!193401)))))))

(assert (=> d!40074 (= (isPrefixOf!0 (_2!5467 lt!193401) (_2!5467 lt!193401)) e!80990)))

(declare-fun b!123567 () Bool)

(declare-fun res!102435 () Bool)

(assert (=> b!123567 (=> (not res!102435) (not e!80990))))

(assert (=> b!123567 (= res!102435 (bvsle (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401)))))))

(declare-fun b!123568 () Bool)

(declare-fun e!80991 () Bool)

(assert (=> b!123568 (= e!80990 e!80991)))

(declare-fun res!102434 () Bool)

(assert (=> b!123568 (=> res!102434 e!80991)))

(assert (=> b!123568 (= res!102434 (= (size!2460 (buf!2900 (_2!5467 lt!193401))) #b00000000000000000000000000000000))))

(declare-fun b!123569 () Bool)

(assert (=> b!123569 (= e!80991 (arrayBitRangesEq!0 (buf!2900 (_2!5467 lt!193401)) (buf!2900 (_2!5467 lt!193401)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401)))))))

(assert (= (and d!40074 res!102436) b!123567))

(assert (= (and b!123567 res!102435) b!123568))

(assert (= (and b!123568 (not res!102434)) b!123569))

(assert (=> b!123567 m!186641))

(assert (=> b!123567 m!186641))

(assert (=> b!123569 m!186641))

(assert (=> b!123569 m!186641))

(declare-fun m!188405 () Bool)

(assert (=> b!123569 m!188405))

(assert (=> d!39572 d!40074))

(declare-fun d!40076 () Bool)

(assert (=> d!40076 (isPrefixOf!0 lt!193686 (_2!5467 lt!193395))))

(declare-fun lt!195125 () Unit!7559)

(assert (=> d!40076 (= lt!195125 (choose!30 lt!193686 (_2!5467 lt!193395) (_2!5467 lt!193395)))))

(assert (=> d!40076 (isPrefixOf!0 lt!193686 (_2!5467 lt!193395))))

(assert (=> d!40076 (= (lemmaIsPrefixTransitive!0 lt!193686 (_2!5467 lt!193395) (_2!5467 lt!193395)) lt!195125)))

(declare-fun bs!9671 () Bool)

(assert (= bs!9671 d!40076))

(assert (=> bs!9671 m!186921))

(declare-fun m!188407 () Bool)

(assert (=> bs!9671 m!188407))

(assert (=> bs!9671 m!186921))

(assert (=> d!39572 d!40076))

(declare-fun d!40078 () Bool)

(declare-fun res!102439 () Bool)

(declare-fun e!80992 () Bool)

(assert (=> d!40078 (=> (not res!102439) (not e!80992))))

(assert (=> d!40078 (= res!102439 (= (size!2460 (buf!2900 (_1!5466 lt!193698))) (size!2460 (buf!2900 (_2!5466 lt!193698)))))))

(assert (=> d!40078 (= (isPrefixOf!0 (_1!5466 lt!193698) (_2!5466 lt!193698)) e!80992)))

(declare-fun b!123570 () Bool)

(declare-fun res!102438 () Bool)

(assert (=> b!123570 (=> (not res!102438) (not e!80992))))

(assert (=> b!123570 (= res!102438 (bvsle (bitIndex!0 (size!2460 (buf!2900 (_1!5466 lt!193698))) (currentByte!5597 (_1!5466 lt!193698)) (currentBit!5592 (_1!5466 lt!193698))) (bitIndex!0 (size!2460 (buf!2900 (_2!5466 lt!193698))) (currentByte!5597 (_2!5466 lt!193698)) (currentBit!5592 (_2!5466 lt!193698)))))))

(declare-fun b!123571 () Bool)

(declare-fun e!80993 () Bool)

(assert (=> b!123571 (= e!80992 e!80993)))

(declare-fun res!102437 () Bool)

(assert (=> b!123571 (=> res!102437 e!80993)))

(assert (=> b!123571 (= res!102437 (= (size!2460 (buf!2900 (_1!5466 lt!193698))) #b00000000000000000000000000000000))))

(declare-fun b!123572 () Bool)

(assert (=> b!123572 (= e!80993 (arrayBitRangesEq!0 (buf!2900 (_1!5466 lt!193698)) (buf!2900 (_2!5466 lt!193698)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 (_1!5466 lt!193698))) (currentByte!5597 (_1!5466 lt!193698)) (currentBit!5592 (_1!5466 lt!193698)))))))

(assert (= (and d!40078 res!102439) b!123570))

(assert (= (and b!123570 res!102438) b!123571))

(assert (= (and b!123571 (not res!102437)) b!123572))

(declare-fun m!188409 () Bool)

(assert (=> b!123570 m!188409))

(assert (=> b!123570 m!188091))

(assert (=> b!123572 m!188409))

(assert (=> b!123572 m!188409))

(declare-fun m!188411 () Bool)

(assert (=> b!123572 m!188411))

(assert (=> d!39572 d!40078))

(declare-fun d!40080 () Bool)

(assert (=> d!40080 (isPrefixOf!0 lt!193686 lt!193686)))

(declare-fun lt!195126 () Unit!7559)

(assert (=> d!40080 (= lt!195126 (choose!11 lt!193686))))

(assert (=> d!40080 (= (lemmaIsPrefixRefl!0 lt!193686) lt!195126)))

(declare-fun bs!9672 () Bool)

(assert (= bs!9672 d!40080))

(assert (=> bs!9672 m!186907))

(declare-fun m!188413 () Bool)

(assert (=> bs!9672 m!188413))

(assert (=> d!39572 d!40080))

(declare-fun d!40082 () Bool)

(assert (=> d!40082 (isPrefixOf!0 lt!193686 (_2!5467 lt!193395))))

(declare-fun lt!195127 () Unit!7559)

(assert (=> d!40082 (= lt!195127 (choose!30 lt!193686 (_2!5467 lt!193401) (_2!5467 lt!193395)))))

(assert (=> d!40082 (isPrefixOf!0 lt!193686 (_2!5467 lt!193401))))

(assert (=> d!40082 (= (lemmaIsPrefixTransitive!0 lt!193686 (_2!5467 lt!193401) (_2!5467 lt!193395)) lt!195127)))

(declare-fun bs!9673 () Bool)

(assert (= bs!9673 d!40082))

(assert (=> bs!9673 m!186921))

(declare-fun m!188415 () Bool)

(assert (=> bs!9673 m!188415))

(declare-fun m!188417 () Bool)

(assert (=> bs!9673 m!188417))

(assert (=> d!39572 d!40082))

(declare-fun d!40084 () Bool)

(declare-fun res!102442 () Bool)

(declare-fun e!80994 () Bool)

(assert (=> d!40084 (=> (not res!102442) (not e!80994))))

(assert (=> d!40084 (= res!102442 (= (size!2460 (buf!2900 lt!193686)) (size!2460 (buf!2900 (_2!5467 lt!193395)))))))

(assert (=> d!40084 (= (isPrefixOf!0 lt!193686 (_2!5467 lt!193395)) e!80994)))

(declare-fun b!123573 () Bool)

(declare-fun res!102441 () Bool)

(assert (=> b!123573 (=> (not res!102441) (not e!80994))))

(assert (=> b!123573 (= res!102441 (bvsle (bitIndex!0 (size!2460 (buf!2900 lt!193686)) (currentByte!5597 lt!193686) (currentBit!5592 lt!193686)) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193395))) (currentByte!5597 (_2!5467 lt!193395)) (currentBit!5592 (_2!5467 lt!193395)))))))

(declare-fun b!123574 () Bool)

(declare-fun e!80995 () Bool)

(assert (=> b!123574 (= e!80994 e!80995)))

(declare-fun res!102440 () Bool)

(assert (=> b!123574 (=> res!102440 e!80995)))

(assert (=> b!123574 (= res!102440 (= (size!2460 (buf!2900 lt!193686)) #b00000000000000000000000000000000))))

(declare-fun b!123575 () Bool)

(assert (=> b!123575 (= e!80995 (arrayBitRangesEq!0 (buf!2900 lt!193686) (buf!2900 (_2!5467 lt!193395)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 lt!193686)) (currentByte!5597 lt!193686) (currentBit!5592 lt!193686))))))

(assert (= (and d!40084 res!102442) b!123573))

(assert (= (and b!123573 res!102441) b!123574))

(assert (= (and b!123574 (not res!102440)) b!123575))

(assert (=> b!123573 m!188399))

(assert (=> b!123573 m!186709))

(assert (=> b!123575 m!188399))

(assert (=> b!123575 m!188399))

(declare-fun m!188419 () Bool)

(assert (=> b!123575 m!188419))

(assert (=> d!39572 d!40084))

(assert (=> d!39564 d!39566))

(declare-fun d!40086 () Bool)

(assert (=> d!40086 (validate_offset_bits!1 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193395)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401))) lt!193382)))

(assert (=> d!40086 true))

(declare-fun _$6!261 () Unit!7559)

(assert (=> d!40086 (= (choose!9 (_2!5467 lt!193401) (buf!2900 (_2!5467 lt!193395)) lt!193382 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401)))) _$6!261)))

(declare-fun bs!9674 () Bool)

(assert (= bs!9674 d!40086))

(assert (=> bs!9674 m!186657))

(assert (=> d!39564 d!40086))

(declare-fun d!40088 () Bool)

(assert (=> d!40088 (= (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193395)))) ((_ sign_extend 32) (currentByte!5597 thiss!1305)) ((_ sign_extend 32) (currentBit!5592 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193395)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 thiss!1305)))))))

(assert (=> d!39574 d!40088))

(declare-fun d!40090 () Bool)

(assert (=> d!40090 (= (invariant!0 (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305) (size!2460 (buf!2900 thiss!1305))) (and (bvsge (currentBit!5592 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5592 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5597 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5597 thiss!1305) (size!2460 (buf!2900 thiss!1305))) (and (= (currentBit!5592 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5597 thiss!1305) (size!2460 (buf!2900 thiss!1305)))))))))

(assert (=> d!39508 d!40090))

(declare-fun b!123576 () Bool)

(declare-fun e!80996 () Bool)

(declare-fun e!80997 () Bool)

(assert (=> b!123576 (= e!80996 e!80997)))

(declare-fun res!102444 () Bool)

(assert (=> b!123576 (=> res!102444 e!80997)))

(assert (=> b!123576 (= res!102444 (bvsge (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(declare-fun lt!195132 () tuple2!10412)

(declare-fun b!123577 () Bool)

(declare-fun lt!195128 () (_ BitVec 64))

(assert (=> b!123577 (= e!80997 (= (= (bvand (bvlshr (_1!5471 lt!195132) lt!195128) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!5468 (readBitPure!0 lt!193405))))))

(assert (=> b!123577 (and (bvsge lt!195128 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!195128 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!195130 () (_ BitVec 32))

(assert (=> b!123577 (= lt!195128 ((_ sign_extend 32) (bvsub lt!195130 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123577 (or (= (bvand lt!195130 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand lt!195130 #b10000000000000000000000000000000) (bvand (bvsub lt!195130 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123577 (= lt!195130 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!123577 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!123578 () Bool)

(declare-fun res!102443 () Bool)

(assert (=> b!123578 (=> (not res!102443) (not e!80996))))

(declare-fun lt!195136 () (_ BitVec 64))

(declare-fun lt!195131 () (_ BitVec 64))

(assert (=> b!123578 (= res!102443 (= (bvlshr (_1!5471 lt!195132) lt!195131) (bvlshr lt!193383 lt!195136)))))

(assert (=> b!123578 (and (bvsge lt!195136 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!195136 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!123578 (= lt!195136 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123578 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123578 (and (bvsge lt!195131 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!195131 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!123578 (= lt!195131 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123578 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(declare-fun b!123579 () Bool)

(declare-fun e!80998 () tuple2!10412)

(declare-fun lt!195133 () tuple2!10412)

(assert (=> b!123579 (= e!80998 (tuple2!10413 (_1!5471 lt!195133) (_2!5471 lt!195133)))))

(declare-fun lt!195134 () tuple2!10418)

(assert (=> b!123579 (= lt!195134 (readBit!0 lt!193405))))

(assert (=> b!123579 (= lt!195133 (readNLeastSignificantBitsLoop!0 (_2!5474 lt!195134) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!193383 (ite (_1!5474 lt!195134) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!123580 () Bool)

(declare-fun res!102445 () Bool)

(assert (=> b!123580 (=> (not res!102445) (not e!80996))))

(declare-fun lt!195129 () (_ BitVec 64))

(declare-fun lt!195135 () (_ BitVec 64))

(assert (=> b!123580 (= res!102445 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5471 lt!195132))) (currentByte!5597 (_2!5471 lt!195132)) (currentBit!5592 (_2!5471 lt!195132))) (bvadd lt!195129 lt!195135)))))

(assert (=> b!123580 (or (not (= (bvand lt!195129 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195135 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195129 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195129 lt!195135) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123580 (= lt!195135 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123580 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123580 (= lt!195129 (bitIndex!0 (size!2460 (buf!2900 lt!193405)) (currentByte!5597 lt!193405) (currentBit!5592 lt!193405)))))

(declare-fun b!123581 () Bool)

(assert (=> b!123581 (= e!80998 (tuple2!10413 lt!193383 lt!193405))))

(declare-fun d!40092 () Bool)

(assert (=> d!40092 e!80996))

(declare-fun res!102446 () Bool)

(assert (=> d!40092 (=> (not res!102446) (not e!80996))))

(assert (=> d!40092 (= res!102446 (= (buf!2900 (_2!5471 lt!195132)) (buf!2900 lt!193405)))))

(assert (=> d!40092 (= lt!195132 e!80998)))

(declare-fun c!7391 () Bool)

(assert (=> d!40092 (= c!7391 (= nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> d!40092 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!40092 (= (readNLeastSignificantBitsLoop!0 lt!193405 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193383) lt!195132)))

(declare-fun b!123582 () Bool)

(declare-fun res!102447 () Bool)

(assert (=> b!123582 (=> (not res!102447) (not e!80996))))

(assert (=> b!123582 (= res!102447 (= (bvand (_1!5471 lt!195132) (onesLSBLong!0 nBits!396)) (_1!5471 lt!195132)))))

(assert (= (and d!40092 c!7391) b!123581))

(assert (= (and d!40092 (not c!7391)) b!123579))

(assert (= (and d!40092 res!102446) b!123580))

(assert (= (and b!123580 res!102445) b!123578))

(assert (= (and b!123578 res!102443) b!123582))

(assert (= (and b!123582 res!102447) b!123576))

(assert (= (and b!123576 (not res!102444)) b!123577))

(declare-fun m!188421 () Bool)

(assert (=> b!123577 m!188421))

(declare-fun m!188423 () Bool)

(assert (=> b!123579 m!188423))

(declare-fun m!188425 () Bool)

(assert (=> b!123579 m!188425))

(declare-fun m!188427 () Bool)

(assert (=> b!123580 m!188427))

(declare-fun m!188429 () Bool)

(assert (=> b!123580 m!188429))

(assert (=> b!123582 m!186639))

(assert (=> d!39524 d!40092))

(assert (=> b!122935 d!39548))

(declare-fun d!40094 () Bool)

(assert (=> d!40094 (arrayBitRangesEq!0 (buf!2900 (_2!5467 lt!193395)) (buf!2900 thiss!1305) lt!193649 lt!193655)))

(declare-fun lt!195137 () Unit!7559)

(assert (=> d!40094 (= lt!195137 (choose!8 (buf!2900 thiss!1305) (buf!2900 (_2!5467 lt!193395)) lt!193649 lt!193655))))

(assert (=> d!40094 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!193649) (bvsle lt!193649 lt!193655))))

(assert (=> d!40094 (= (arrayBitRangesEqSymmetric!0 (buf!2900 thiss!1305) (buf!2900 (_2!5467 lt!193395)) lt!193649 lt!193655) lt!195137)))

(declare-fun bs!9675 () Bool)

(assert (= bs!9675 d!40094))

(assert (=> bs!9675 m!186887))

(declare-fun m!188431 () Bool)

(assert (=> bs!9675 m!188431))

(assert (=> b!122935 d!40094))

(declare-fun d!40096 () Bool)

(declare-fun res!102448 () Bool)

(declare-fun e!81002 () Bool)

(assert (=> d!40096 (=> res!102448 e!81002)))

(assert (=> d!40096 (= res!102448 (bvsge lt!193649 lt!193655))))

(assert (=> d!40096 (= (arrayBitRangesEq!0 (buf!2900 (_2!5467 lt!193395)) (buf!2900 thiss!1305) lt!193649 lt!193655) e!81002)))

(declare-fun e!81001 () Bool)

(declare-fun b!123583 () Bool)

(declare-fun lt!195140 () tuple4!90)

(assert (=> b!123583 (= e!81001 (arrayRangesEq!46 (buf!2900 (_2!5467 lt!193395)) (buf!2900 thiss!1305) (_1!5476 lt!195140) (_2!5476 lt!195140)))))

(declare-fun b!123584 () Bool)

(declare-fun e!81000 () Bool)

(declare-fun call!1619 () Bool)

(assert (=> b!123584 (= e!81000 call!1619)))

(declare-fun b!123585 () Bool)

(declare-fun res!102452 () Bool)

(declare-fun lt!195139 () (_ BitVec 32))

(assert (=> b!123585 (= res!102452 (= lt!195139 #b00000000000000000000000000000000))))

(declare-fun e!81003 () Bool)

(assert (=> b!123585 (=> res!102452 e!81003)))

(declare-fun e!80999 () Bool)

(assert (=> b!123585 (= e!80999 e!81003)))

(declare-fun c!7392 () Bool)

(declare-fun bm!1616 () Bool)

(declare-fun lt!195138 () (_ BitVec 32))

(assert (=> bm!1616 (= call!1619 (byteRangesEq!0 (ite c!7392 (select (arr!3053 (buf!2900 (_2!5467 lt!193395))) (_3!266 lt!195140)) (select (arr!3053 (buf!2900 (_2!5467 lt!193395))) (_4!45 lt!195140))) (ite c!7392 (select (arr!3053 (buf!2900 thiss!1305)) (_3!266 lt!195140)) (select (arr!3053 (buf!2900 thiss!1305)) (_4!45 lt!195140))) (ite c!7392 lt!195138 #b00000000000000000000000000000000) lt!195139))))

(declare-fun b!123586 () Bool)

(declare-fun e!81004 () Bool)

(assert (=> b!123586 (= e!81004 e!81000)))

(assert (=> b!123586 (= c!7392 (= (_3!266 lt!195140) (_4!45 lt!195140)))))

(declare-fun b!123587 () Bool)

(assert (=> b!123587 (= e!81000 e!80999)))

(declare-fun res!102449 () Bool)

(assert (=> b!123587 (= res!102449 (byteRangesEq!0 (select (arr!3053 (buf!2900 (_2!5467 lt!193395))) (_3!266 lt!195140)) (select (arr!3053 (buf!2900 thiss!1305)) (_3!266 lt!195140)) lt!195138 #b00000000000000000000000000001000))))

(assert (=> b!123587 (=> (not res!102449) (not e!80999))))

(declare-fun b!123588 () Bool)

(assert (=> b!123588 (= e!81003 call!1619)))

(declare-fun b!123589 () Bool)

(assert (=> b!123589 (= e!81002 e!81004)))

(declare-fun res!102450 () Bool)

(assert (=> b!123589 (=> (not res!102450) (not e!81004))))

(assert (=> b!123589 (= res!102450 e!81001)))

(declare-fun res!102451 () Bool)

(assert (=> b!123589 (=> res!102451 e!81001)))

(assert (=> b!123589 (= res!102451 (bvsge (_1!5476 lt!195140) (_2!5476 lt!195140)))))

(assert (=> b!123589 (= lt!195139 ((_ extract 31 0) (bvsrem lt!193655 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123589 (= lt!195138 ((_ extract 31 0) (bvsrem lt!193649 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123589 (= lt!195140 (arrayBitIndices!0 lt!193649 lt!193655))))

(assert (= (and d!40096 (not res!102448)) b!123589))

(assert (= (and b!123589 (not res!102451)) b!123583))

(assert (= (and b!123589 res!102450) b!123586))

(assert (= (and b!123586 c!7392) b!123584))

(assert (= (and b!123586 (not c!7392)) b!123587))

(assert (= (and b!123587 res!102449) b!123585))

(assert (= (and b!123585 (not res!102452)) b!123588))

(assert (= (or b!123584 b!123588) bm!1616))

(declare-fun m!188433 () Bool)

(assert (=> b!123583 m!188433))

(declare-fun m!188435 () Bool)

(assert (=> bm!1616 m!188435))

(declare-fun m!188437 () Bool)

(assert (=> bm!1616 m!188437))

(declare-fun m!188439 () Bool)

(assert (=> bm!1616 m!188439))

(declare-fun m!188441 () Bool)

(assert (=> bm!1616 m!188441))

(declare-fun m!188443 () Bool)

(assert (=> bm!1616 m!188443))

(assert (=> b!123587 m!188435))

(assert (=> b!123587 m!188437))

(assert (=> b!123587 m!188435))

(assert (=> b!123587 m!188437))

(declare-fun m!188445 () Bool)

(assert (=> b!123587 m!188445))

(declare-fun m!188447 () Bool)

(assert (=> b!123589 m!188447))

(assert (=> b!122935 d!40096))

(declare-fun d!40098 () Bool)

(declare-fun e!81005 () Bool)

(assert (=> d!40098 e!81005))

(declare-fun res!102454 () Bool)

(assert (=> d!40098 (=> (not res!102454) (not e!81005))))

(declare-fun lt!195141 () (_ BitVec 64))

(declare-fun lt!195146 () (_ BitVec 64))

(declare-fun lt!195142 () (_ BitVec 64))

(assert (=> d!40098 (= res!102454 (= lt!195141 (bvsub lt!195142 lt!195146)))))

(assert (=> d!40098 (or (= (bvand lt!195142 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195146 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195142 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195142 lt!195146) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40098 (= lt!195146 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 lt!193582))) ((_ sign_extend 32) (currentByte!5597 lt!193582)) ((_ sign_extend 32) (currentBit!5592 lt!193582))))))

(declare-fun lt!195144 () (_ BitVec 64))

(declare-fun lt!195145 () (_ BitVec 64))

(assert (=> d!40098 (= lt!195142 (bvmul lt!195144 lt!195145))))

(assert (=> d!40098 (or (= lt!195144 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195145 (bvsdiv (bvmul lt!195144 lt!195145) lt!195144)))))

(assert (=> d!40098 (= lt!195145 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40098 (= lt!195144 ((_ sign_extend 32) (size!2460 (buf!2900 lt!193582))))))

(assert (=> d!40098 (= lt!195141 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 lt!193582)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 lt!193582))))))

(assert (=> d!40098 (invariant!0 (currentBit!5592 lt!193582) (currentByte!5597 lt!193582) (size!2460 (buf!2900 lt!193582)))))

(assert (=> d!40098 (= (bitIndex!0 (size!2460 (buf!2900 lt!193582)) (currentByte!5597 lt!193582) (currentBit!5592 lt!193582)) lt!195141)))

(declare-fun b!123590 () Bool)

(declare-fun res!102453 () Bool)

(assert (=> b!123590 (=> (not res!102453) (not e!81005))))

(assert (=> b!123590 (= res!102453 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195141))))

(declare-fun b!123591 () Bool)

(declare-fun lt!195143 () (_ BitVec 64))

(assert (=> b!123591 (= e!81005 (bvsle lt!195141 (bvmul lt!195143 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123591 (or (= lt!195143 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195143 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195143)))))

(assert (=> b!123591 (= lt!195143 ((_ sign_extend 32) (size!2460 (buf!2900 lt!193582))))))

(assert (= (and d!40098 res!102454) b!123590))

(assert (= (and b!123590 res!102453) b!123591))

(declare-fun m!188449 () Bool)

(assert (=> d!40098 m!188449))

(declare-fun m!188451 () Bool)

(assert (=> d!40098 m!188451))

(assert (=> d!39552 d!40098))

(declare-fun d!40100 () Bool)

(declare-fun e!81006 () Bool)

(assert (=> d!40100 e!81006))

(declare-fun res!102456 () Bool)

(assert (=> d!40100 (=> (not res!102456) (not e!81006))))

(declare-fun lt!195152 () (_ BitVec 64))

(declare-fun lt!195147 () (_ BitVec 64))

(declare-fun lt!195148 () (_ BitVec 64))

(assert (=> d!40100 (= res!102456 (= lt!195147 (bvsub lt!195148 lt!195152)))))

(assert (=> d!40100 (or (= (bvand lt!195148 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195152 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195148 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195148 lt!195152) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40100 (= lt!195152 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5466 lt!193391)))) ((_ sign_extend 32) (currentByte!5597 (_2!5466 lt!193391))) ((_ sign_extend 32) (currentBit!5592 (_2!5466 lt!193391)))))))

(declare-fun lt!195150 () (_ BitVec 64))

(declare-fun lt!195151 () (_ BitVec 64))

(assert (=> d!40100 (= lt!195148 (bvmul lt!195150 lt!195151))))

(assert (=> d!40100 (or (= lt!195150 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195151 (bvsdiv (bvmul lt!195150 lt!195151) lt!195150)))))

(assert (=> d!40100 (= lt!195151 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40100 (= lt!195150 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5466 lt!193391)))))))

(assert (=> d!40100 (= lt!195147 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_2!5466 lt!193391))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_2!5466 lt!193391)))))))

(assert (=> d!40100 (invariant!0 (currentBit!5592 (_2!5466 lt!193391)) (currentByte!5597 (_2!5466 lt!193391)) (size!2460 (buf!2900 (_2!5466 lt!193391))))))

(assert (=> d!40100 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5466 lt!193391))) (currentByte!5597 (_2!5466 lt!193391)) (currentBit!5592 (_2!5466 lt!193391))) lt!195147)))

(declare-fun b!123592 () Bool)

(declare-fun res!102455 () Bool)

(assert (=> b!123592 (=> (not res!102455) (not e!81006))))

(assert (=> b!123592 (= res!102455 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195147))))

(declare-fun b!123593 () Bool)

(declare-fun lt!195149 () (_ BitVec 64))

(assert (=> b!123593 (= e!81006 (bvsle lt!195147 (bvmul lt!195149 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123593 (or (= lt!195149 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195149 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195149)))))

(assert (=> b!123593 (= lt!195149 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5466 lt!193391)))))))

(assert (= (and d!40100 res!102456) b!123592))

(assert (= (and b!123592 res!102455) b!123593))

(declare-fun m!188453 () Bool)

(assert (=> d!40100 m!188453))

(declare-fun m!188455 () Bool)

(assert (=> d!40100 m!188455))

(assert (=> d!39552 d!40100))

(declare-fun d!40102 () Bool)

(declare-fun lt!195157 () (_ BitVec 32))

(assert (=> d!40102 (= lt!195157 ((_ extract 31 0) (bvsrem (bvsub lt!193396 lt!193410) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!195155 () (_ BitVec 32))

(assert (=> d!40102 (= lt!195155 ((_ extract 31 0) (bvsdiv (bvsub lt!193396 lt!193410) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!81008 () Bool)

(assert (=> d!40102 e!81008))

(declare-fun res!102458 () Bool)

(assert (=> d!40102 (=> (not res!102458) (not e!81008))))

(assert (=> d!40102 (= res!102458 (moveBitIndexPrecond!0 (_2!5466 lt!193391) (bvsub lt!193396 lt!193410)))))

(declare-fun Unit!7627 () Unit!7559)

(declare-fun Unit!7628 () Unit!7559)

(declare-fun Unit!7629 () Unit!7559)

(assert (=> d!40102 (= (moveBitIndex!0 (_2!5466 lt!193391) (bvsub lt!193396 lt!193410)) (ite (bvslt (bvadd (currentBit!5592 (_2!5466 lt!193391)) lt!195157) #b00000000000000000000000000000000) (tuple2!10405 Unit!7627 (BitStream!4395 (buf!2900 (_2!5466 lt!193391)) (bvsub (bvadd (currentByte!5597 (_2!5466 lt!193391)) lt!195155) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!195157 (currentBit!5592 (_2!5466 lt!193391))))) (ite (bvsge (bvadd (currentBit!5592 (_2!5466 lt!193391)) lt!195157) #b00000000000000000000000000001000) (tuple2!10405 Unit!7628 (BitStream!4395 (buf!2900 (_2!5466 lt!193391)) (bvadd (currentByte!5597 (_2!5466 lt!193391)) lt!195155 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5592 (_2!5466 lt!193391)) lt!195157) #b00000000000000000000000000001000))) (tuple2!10405 Unit!7629 (BitStream!4395 (buf!2900 (_2!5466 lt!193391)) (bvadd (currentByte!5597 (_2!5466 lt!193391)) lt!195155) (bvadd (currentBit!5592 (_2!5466 lt!193391)) lt!195157))))))))

(declare-fun b!123594 () Bool)

(declare-fun e!81007 () Bool)

(assert (=> b!123594 (= e!81008 e!81007)))

(declare-fun res!102457 () Bool)

(assert (=> b!123594 (=> (not res!102457) (not e!81007))))

(declare-fun lt!195158 () tuple2!10404)

(declare-fun lt!195153 () (_ BitVec 64))

(assert (=> b!123594 (= res!102457 (= (bvadd lt!195153 (bvsub lt!193396 lt!193410)) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!195158))) (currentByte!5597 (_2!5467 lt!195158)) (currentBit!5592 (_2!5467 lt!195158)))))))

(assert (=> b!123594 (or (not (= (bvand lt!195153 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193396 lt!193410) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195153 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195153 (bvsub lt!193396 lt!193410)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123594 (= lt!195153 (bitIndex!0 (size!2460 (buf!2900 (_2!5466 lt!193391))) (currentByte!5597 (_2!5466 lt!193391)) (currentBit!5592 (_2!5466 lt!193391))))))

(declare-fun lt!195154 () (_ BitVec 32))

(declare-fun lt!195156 () (_ BitVec 32))

(declare-fun Unit!7630 () Unit!7559)

(declare-fun Unit!7631 () Unit!7559)

(declare-fun Unit!7632 () Unit!7559)

(assert (=> b!123594 (= lt!195158 (ite (bvslt (bvadd (currentBit!5592 (_2!5466 lt!193391)) lt!195154) #b00000000000000000000000000000000) (tuple2!10405 Unit!7630 (BitStream!4395 (buf!2900 (_2!5466 lt!193391)) (bvsub (bvadd (currentByte!5597 (_2!5466 lt!193391)) lt!195156) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!195154 (currentBit!5592 (_2!5466 lt!193391))))) (ite (bvsge (bvadd (currentBit!5592 (_2!5466 lt!193391)) lt!195154) #b00000000000000000000000000001000) (tuple2!10405 Unit!7631 (BitStream!4395 (buf!2900 (_2!5466 lt!193391)) (bvadd (currentByte!5597 (_2!5466 lt!193391)) lt!195156 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5592 (_2!5466 lt!193391)) lt!195154) #b00000000000000000000000000001000))) (tuple2!10405 Unit!7632 (BitStream!4395 (buf!2900 (_2!5466 lt!193391)) (bvadd (currentByte!5597 (_2!5466 lt!193391)) lt!195156) (bvadd (currentBit!5592 (_2!5466 lt!193391)) lt!195154))))))))

(assert (=> b!123594 (= lt!195154 ((_ extract 31 0) (bvsrem (bvsub lt!193396 lt!193410) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123594 (= lt!195156 ((_ extract 31 0) (bvsdiv (bvsub lt!193396 lt!193410) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!123595 () Bool)

(assert (=> b!123595 (= e!81007 (and (= (size!2460 (buf!2900 (_2!5466 lt!193391))) (size!2460 (buf!2900 (_2!5467 lt!195158)))) (= (buf!2900 (_2!5466 lt!193391)) (buf!2900 (_2!5467 lt!195158)))))))

(assert (= (and d!40102 res!102458) b!123594))

(assert (= (and b!123594 res!102457) b!123595))

(assert (=> d!40102 m!186833))

(declare-fun m!188457 () Bool)

(assert (=> b!123594 m!188457))

(assert (=> b!123594 m!186829))

(assert (=> d!39552 d!40102))

(declare-fun d!40104 () Bool)

(declare-fun res!102459 () Bool)

(declare-fun e!81009 () Bool)

(assert (=> d!40104 (=> (not res!102459) (not e!81009))))

(assert (=> d!40104 (= res!102459 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5466 lt!193391))))) (bvsub lt!193396 lt!193410)) (bvsle (bvsub lt!193396 lt!193410) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5466 lt!193391))))))))))

(assert (=> d!40104 (= (moveBitIndexPrecond!0 (_2!5466 lt!193391) (bvsub lt!193396 lt!193410)) e!81009)))

(declare-fun b!123596 () Bool)

(declare-fun lt!195159 () (_ BitVec 64))

(assert (=> b!123596 (= e!81009 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195159) (bvsle lt!195159 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5466 lt!193391))))))))))

(assert (=> b!123596 (= lt!195159 (bvadd (bitIndex!0 (size!2460 (buf!2900 (_2!5466 lt!193391))) (currentByte!5597 (_2!5466 lt!193391)) (currentBit!5592 (_2!5466 lt!193391))) (bvsub lt!193396 lt!193410)))))

(assert (= (and d!40104 res!102459) b!123596))

(assert (=> b!123596 m!186829))

(assert (=> d!39552 d!40104))

(assert (=> d!39542 d!39578))

(assert (=> d!39542 d!39580))

(assert (=> d!39542 d!39528))

(declare-fun d!40106 () Bool)

(declare-fun lt!195160 () tuple2!10412)

(assert (=> d!40106 (= lt!195160 (readNLeastSignificantBitsLoop!0 lt!193562 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!193567))))

(assert (=> d!40106 (= (readNLeastSignificantBitsLoopPure!0 lt!193562 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!193567) (tuple2!10401 (_2!5471 lt!195160) (_1!5471 lt!195160)))))

(declare-fun bs!9676 () Bool)

(assert (= bs!9676 d!40106))

(declare-fun m!188459 () Bool)

(assert (=> bs!9676 m!188459))

(assert (=> d!39542 d!40106))

(declare-fun d!40108 () Bool)

(declare-fun lt!195166 () tuple2!10400)

(declare-fun lt!195165 () tuple2!10400)

(assert (=> d!40108 (and (= (_2!5465 lt!195166) (_2!5465 lt!195165)) (= (_1!5465 lt!195166) (_1!5465 lt!195165)))))

(declare-fun e!81012 () (_ BitVec 64))

(assert (=> d!40108 (= lt!195165 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5466 lt!193409) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd i!615 #b00000000000000000000000000000001) (bvor lt!193388 e!81012)))))

(declare-fun c!7395 () Bool)

(assert (=> d!40108 (= c!7395 (_2!5468 (readBitPure!0 (_1!5466 lt!193409))))))

(assert (=> d!40108 (= lt!195166 (readNLeastSignificantBitsLoopPure!0 (_1!5466 lt!193409) nBits!396 i!615 lt!193388))))

(assert (=> d!40108 true))

(declare-fun _$11!50 () Unit!7559)

(assert (=> d!40108 (= (choose!45 (_1!5466 lt!193409) nBits!396 i!615 lt!193388 lt!193564 (tuple2!10401 (_1!5465 lt!193564) (_2!5465 lt!193564)) (_1!5465 lt!193564) (_2!5465 lt!193564) lt!193566 lt!193562 lt!193567 lt!193565 (tuple2!10401 (_1!5465 lt!193565) (_2!5465 lt!193565)) (_1!5465 lt!193565) (_2!5465 lt!193565)) _$11!50)))

(declare-fun b!123601 () Bool)

(assert (=> b!123601 (= e!81012 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!123602 () Bool)

(assert (=> b!123602 (= e!81012 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!40108 c!7395) b!123601))

(assert (= (and d!40108 (not c!7395)) b!123602))

(assert (=> d!40108 m!186705))

(assert (=> d!40108 m!186705))

(declare-fun m!188461 () Bool)

(assert (=> d!40108 m!188461))

(assert (=> d!40108 m!186681))

(assert (=> d!40108 m!186653))

(assert (=> d!39542 d!40108))

(declare-fun d!40110 () Bool)

(declare-fun res!102462 () Bool)

(declare-fun e!81013 () Bool)

(assert (=> d!40110 (=> (not res!102462) (not e!81013))))

(assert (=> d!40110 (= res!102462 (= (size!2460 (buf!2900 (_2!5466 lt!193663))) (size!2460 (buf!2900 (_2!5467 lt!193395)))))))

(assert (=> d!40110 (= (isPrefixOf!0 (_2!5466 lt!193663) (_2!5467 lt!193395)) e!81013)))

(declare-fun b!123603 () Bool)

(declare-fun res!102461 () Bool)

(assert (=> b!123603 (=> (not res!102461) (not e!81013))))

(assert (=> b!123603 (= res!102461 (bvsle (bitIndex!0 (size!2460 (buf!2900 (_2!5466 lt!193663))) (currentByte!5597 (_2!5466 lt!193663)) (currentBit!5592 (_2!5466 lt!193663))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193395))) (currentByte!5597 (_2!5467 lt!193395)) (currentBit!5592 (_2!5467 lt!193395)))))))

(declare-fun b!123604 () Bool)

(declare-fun e!81014 () Bool)

(assert (=> b!123604 (= e!81013 e!81014)))

(declare-fun res!102460 () Bool)

(assert (=> b!123604 (=> res!102460 e!81014)))

(assert (=> b!123604 (= res!102460 (= (size!2460 (buf!2900 (_2!5466 lt!193663))) #b00000000000000000000000000000000))))

(declare-fun b!123605 () Bool)

(assert (=> b!123605 (= e!81014 (arrayBitRangesEq!0 (buf!2900 (_2!5466 lt!193663)) (buf!2900 (_2!5467 lt!193395)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 (_2!5466 lt!193663))) (currentByte!5597 (_2!5466 lt!193663)) (currentBit!5592 (_2!5466 lt!193663)))))))

(assert (= (and d!40110 res!102462) b!123603))

(assert (= (and b!123603 res!102461) b!123604))

(assert (= (and b!123604 (not res!102460)) b!123605))

(assert (=> b!123603 m!188041))

(assert (=> b!123603 m!186709))

(assert (=> b!123605 m!188041))

(assert (=> b!123605 m!188041))

(declare-fun m!188463 () Bool)

(assert (=> b!123605 m!188463))

(assert (=> b!122932 d!40110))

(declare-fun d!40112 () Bool)

(declare-fun res!102463 () Bool)

(declare-fun e!81018 () Bool)

(assert (=> d!40112 (=> res!102463 e!81018)))

(assert (=> d!40112 (= res!102463 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))))))

(assert (=> d!40112 (= (arrayBitRangesEq!0 (buf!2900 thiss!1305) (buf!2900 (_2!5467 lt!193395)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))) e!81018)))

(declare-fun lt!195169 () tuple4!90)

(declare-fun b!123606 () Bool)

(declare-fun e!81017 () Bool)

(assert (=> b!123606 (= e!81017 (arrayRangesEq!46 (buf!2900 thiss!1305) (buf!2900 (_2!5467 lt!193395)) (_1!5476 lt!195169) (_2!5476 lt!195169)))))

(declare-fun b!123607 () Bool)

(declare-fun e!81016 () Bool)

(declare-fun call!1620 () Bool)

(assert (=> b!123607 (= e!81016 call!1620)))

(declare-fun b!123608 () Bool)

(declare-fun res!102467 () Bool)

(declare-fun lt!195168 () (_ BitVec 32))

(assert (=> b!123608 (= res!102467 (= lt!195168 #b00000000000000000000000000000000))))

(declare-fun e!81019 () Bool)

(assert (=> b!123608 (=> res!102467 e!81019)))

(declare-fun e!81015 () Bool)

(assert (=> b!123608 (= e!81015 e!81019)))

(declare-fun lt!195167 () (_ BitVec 32))

(declare-fun c!7396 () Bool)

(declare-fun bm!1617 () Bool)

(assert (=> bm!1617 (= call!1620 (byteRangesEq!0 (ite c!7396 (select (arr!3053 (buf!2900 thiss!1305)) (_3!266 lt!195169)) (select (arr!3053 (buf!2900 thiss!1305)) (_4!45 lt!195169))) (ite c!7396 (select (arr!3053 (buf!2900 (_2!5467 lt!193395))) (_3!266 lt!195169)) (select (arr!3053 (buf!2900 (_2!5467 lt!193395))) (_4!45 lt!195169))) (ite c!7396 lt!195167 #b00000000000000000000000000000000) lt!195168))))

(declare-fun b!123609 () Bool)

(declare-fun e!81020 () Bool)

(assert (=> b!123609 (= e!81020 e!81016)))

(assert (=> b!123609 (= c!7396 (= (_3!266 lt!195169) (_4!45 lt!195169)))))

(declare-fun b!123610 () Bool)

(assert (=> b!123610 (= e!81016 e!81015)))

(declare-fun res!102464 () Bool)

(assert (=> b!123610 (= res!102464 (byteRangesEq!0 (select (arr!3053 (buf!2900 thiss!1305)) (_3!266 lt!195169)) (select (arr!3053 (buf!2900 (_2!5467 lt!193395))) (_3!266 lt!195169)) lt!195167 #b00000000000000000000000000001000))))

(assert (=> b!123610 (=> (not res!102464) (not e!81015))))

(declare-fun b!123611 () Bool)

(assert (=> b!123611 (= e!81019 call!1620)))

(declare-fun b!123612 () Bool)

(assert (=> b!123612 (= e!81018 e!81020)))

(declare-fun res!102465 () Bool)

(assert (=> b!123612 (=> (not res!102465) (not e!81020))))

(assert (=> b!123612 (= res!102465 e!81017)))

(declare-fun res!102466 () Bool)

(assert (=> b!123612 (=> res!102466 e!81017)))

(assert (=> b!123612 (= res!102466 (bvsge (_1!5476 lt!195169) (_2!5476 lt!195169)))))

(assert (=> b!123612 (= lt!195168 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123612 (= lt!195167 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123612 (= lt!195169 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))))))

(assert (= (and d!40112 (not res!102463)) b!123612))

(assert (= (and b!123612 (not res!102466)) b!123606))

(assert (= (and b!123612 res!102465) b!123609))

(assert (= (and b!123609 c!7396) b!123607))

(assert (= (and b!123609 (not c!7396)) b!123610))

(assert (= (and b!123610 res!102464) b!123608))

(assert (= (and b!123608 (not res!102467)) b!123611))

(assert (= (or b!123607 b!123611) bm!1617))

(declare-fun m!188465 () Bool)

(assert (=> b!123606 m!188465))

(declare-fun m!188467 () Bool)

(assert (=> bm!1617 m!188467))

(declare-fun m!188469 () Bool)

(assert (=> bm!1617 m!188469))

(declare-fun m!188471 () Bool)

(assert (=> bm!1617 m!188471))

(declare-fun m!188473 () Bool)

(assert (=> bm!1617 m!188473))

(declare-fun m!188475 () Bool)

(assert (=> bm!1617 m!188475))

(assert (=> b!123610 m!188467))

(assert (=> b!123610 m!188469))

(assert (=> b!123610 m!188467))

(assert (=> b!123610 m!188469))

(declare-fun m!188477 () Bool)

(assert (=> b!123610 m!188477))

(assert (=> b!123612 m!186643))

(declare-fun m!188479 () Bool)

(assert (=> b!123612 m!188479))

(assert (=> b!122946 d!40112))

(assert (=> b!122946 d!39548))

(declare-fun d!40114 () Bool)

(declare-fun e!81021 () Bool)

(assert (=> d!40114 e!81021))

(declare-fun res!102469 () Bool)

(assert (=> d!40114 (=> (not res!102469) (not e!81021))))

(declare-fun lt!195175 () (_ BitVec 64))

(declare-fun lt!195171 () (_ BitVec 64))

(declare-fun lt!195170 () (_ BitVec 64))

(assert (=> d!40114 (= res!102469 (= lt!195170 (bvsub lt!195171 lt!195175)))))

(assert (=> d!40114 (or (= (bvand lt!195171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195175 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195171 lt!195175) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40114 (= lt!195175 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194272)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!194272))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!194272)))))))

(declare-fun lt!195173 () (_ BitVec 64))

(declare-fun lt!195174 () (_ BitVec 64))

(assert (=> d!40114 (= lt!195171 (bvmul lt!195173 lt!195174))))

(assert (=> d!40114 (or (= lt!195173 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195174 (bvsdiv (bvmul lt!195173 lt!195174) lt!195173)))))

(assert (=> d!40114 (= lt!195174 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40114 (= lt!195173 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194272)))))))

(assert (=> d!40114 (= lt!195170 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!194272))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!194272)))))))

(assert (=> d!40114 (invariant!0 (currentBit!5592 (_2!5467 lt!194272)) (currentByte!5597 (_2!5467 lt!194272)) (size!2460 (buf!2900 (_2!5467 lt!194272))))))

(assert (=> d!40114 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194272))) (currentByte!5597 (_2!5467 lt!194272)) (currentBit!5592 (_2!5467 lt!194272))) lt!195170)))

(declare-fun b!123613 () Bool)

(declare-fun res!102468 () Bool)

(assert (=> b!123613 (=> (not res!102468) (not e!81021))))

(assert (=> b!123613 (= res!102468 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195170))))

(declare-fun b!123614 () Bool)

(declare-fun lt!195172 () (_ BitVec 64))

(assert (=> b!123614 (= e!81021 (bvsle lt!195170 (bvmul lt!195172 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123614 (or (= lt!195172 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195172 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195172)))))

(assert (=> b!123614 (= lt!195172 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194272)))))))

(assert (= (and d!40114 res!102469) b!123613))

(assert (= (and b!123613 res!102468) b!123614))

(declare-fun m!188481 () Bool)

(assert (=> d!40114 m!188481))

(declare-fun m!188483 () Bool)

(assert (=> d!40114 m!188483))

(assert (=> b!123127 d!40114))

(assert (=> b!123127 d!39546))

(declare-fun d!40116 () Bool)

(assert (=> d!40116 (= (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193401)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401)))) (bvsub (bvmul ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!193401)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!193401))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!193401))))))))

(assert (=> d!39546 d!40116))

(declare-fun d!40118 () Bool)

(assert (=> d!40118 (= (invariant!0 (currentBit!5592 (_2!5467 lt!193401)) (currentByte!5597 (_2!5467 lt!193401)) (size!2460 (buf!2900 (_2!5467 lt!193401)))) (and (bvsge (currentBit!5592 (_2!5467 lt!193401)) #b00000000000000000000000000000000) (bvslt (currentBit!5592 (_2!5467 lt!193401)) #b00000000000000000000000000001000) (bvsge (currentByte!5597 (_2!5467 lt!193401)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5597 (_2!5467 lt!193401)) (size!2460 (buf!2900 (_2!5467 lt!193401)))) (and (= (currentBit!5592 (_2!5467 lt!193401)) #b00000000000000000000000000000000) (= (currentByte!5597 (_2!5467 lt!193401)) (size!2460 (buf!2900 (_2!5467 lt!193401))))))))))

(assert (=> d!39546 d!40118))

(declare-fun d!40120 () Bool)

(assert (=> d!40120 (= (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193390)))) ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!193390))) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!193390)))) (bvsub (bvmul ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193390)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!193390))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!193390))))))))

(assert (=> d!39648 d!40120))

(declare-fun d!40122 () Bool)

(assert (=> d!40122 (= (invariant!0 (currentBit!5592 (_1!5468 lt!193390)) (currentByte!5597 (_1!5468 lt!193390)) (size!2460 (buf!2900 (_1!5468 lt!193390)))) (and (bvsge (currentBit!5592 (_1!5468 lt!193390)) #b00000000000000000000000000000000) (bvslt (currentBit!5592 (_1!5468 lt!193390)) #b00000000000000000000000000001000) (bvsge (currentByte!5597 (_1!5468 lt!193390)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5597 (_1!5468 lt!193390)) (size!2460 (buf!2900 (_1!5468 lt!193390)))) (and (= (currentBit!5592 (_1!5468 lt!193390)) #b00000000000000000000000000000000) (= (currentByte!5597 (_1!5468 lt!193390)) (size!2460 (buf!2900 (_1!5468 lt!193390))))))))))

(assert (=> d!39648 d!40122))

(declare-fun d!40124 () Bool)

(declare-fun res!102472 () Bool)

(declare-fun e!81022 () Bool)

(assert (=> d!40124 (=> (not res!102472) (not e!81022))))

(assert (=> d!40124 (= res!102472 (= (size!2460 (buf!2900 (_1!5466 lt!193663))) (size!2460 (buf!2900 thiss!1305))))))

(assert (=> d!40124 (= (isPrefixOf!0 (_1!5466 lt!193663) thiss!1305) e!81022)))

(declare-fun b!123615 () Bool)

(declare-fun res!102471 () Bool)

(assert (=> b!123615 (=> (not res!102471) (not e!81022))))

(assert (=> b!123615 (= res!102471 (bvsle (bitIndex!0 (size!2460 (buf!2900 (_1!5466 lt!193663))) (currentByte!5597 (_1!5466 lt!193663)) (currentBit!5592 (_1!5466 lt!193663))) (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))))))

(declare-fun b!123616 () Bool)

(declare-fun e!81023 () Bool)

(assert (=> b!123616 (= e!81022 e!81023)))

(declare-fun res!102470 () Bool)

(assert (=> b!123616 (=> res!102470 e!81023)))

(assert (=> b!123616 (= res!102470 (= (size!2460 (buf!2900 (_1!5466 lt!193663))) #b00000000000000000000000000000000))))

(declare-fun b!123617 () Bool)

(assert (=> b!123617 (= e!81023 (arrayBitRangesEq!0 (buf!2900 (_1!5466 lt!193663)) (buf!2900 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 (_1!5466 lt!193663))) (currentByte!5597 (_1!5466 lt!193663)) (currentBit!5592 (_1!5466 lt!193663)))))))

(assert (= (and d!40124 res!102472) b!123615))

(assert (= (and b!123615 res!102471) b!123616))

(assert (= (and b!123616 (not res!102470)) b!123617))

(assert (=> b!123615 m!188147))

(assert (=> b!123615 m!186643))

(assert (=> b!123617 m!188147))

(assert (=> b!123617 m!188147))

(declare-fun m!188485 () Bool)

(assert (=> b!123617 m!188485))

(assert (=> b!122934 d!40124))

(declare-fun d!40126 () Bool)

(declare-fun e!81024 () Bool)

(assert (=> d!40126 e!81024))

(declare-fun res!102474 () Bool)

(assert (=> d!40126 (=> (not res!102474) (not e!81024))))

(declare-fun lt!195181 () (_ BitVec 64))

(declare-fun lt!195176 () (_ BitVec 64))

(declare-fun lt!195177 () (_ BitVec 64))

(assert (=> d!40126 (= res!102474 (= lt!195176 (bvsub lt!195177 lt!195181)))))

(assert (=> d!40126 (or (= (bvand lt!195177 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195181 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195177 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195177 lt!195181) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40126 (= lt!195181 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193605)))) ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!193605))) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!193605)))))))

(declare-fun lt!195179 () (_ BitVec 64))

(declare-fun lt!195180 () (_ BitVec 64))

(assert (=> d!40126 (= lt!195177 (bvmul lt!195179 lt!195180))))

(assert (=> d!40126 (or (= lt!195179 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195180 (bvsdiv (bvmul lt!195179 lt!195180) lt!195179)))))

(assert (=> d!40126 (= lt!195180 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40126 (= lt!195179 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193605)))))))

(assert (=> d!40126 (= lt!195176 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!193605))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!193605)))))))

(assert (=> d!40126 (invariant!0 (currentBit!5592 (_1!5468 lt!193605)) (currentByte!5597 (_1!5468 lt!193605)) (size!2460 (buf!2900 (_1!5468 lt!193605))))))

(assert (=> d!40126 (= (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!193605))) (currentByte!5597 (_1!5468 lt!193605)) (currentBit!5592 (_1!5468 lt!193605))) lt!195176)))

(declare-fun b!123618 () Bool)

(declare-fun res!102473 () Bool)

(assert (=> b!123618 (=> (not res!102473) (not e!81024))))

(assert (=> b!123618 (= res!102473 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195176))))

(declare-fun b!123619 () Bool)

(declare-fun lt!195178 () (_ BitVec 64))

(assert (=> b!123619 (= e!81024 (bvsle lt!195176 (bvmul lt!195178 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123619 (or (= lt!195178 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195178 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195178)))))

(assert (=> b!123619 (= lt!195178 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193605)))))))

(assert (= (and d!40126 res!102474) b!123618))

(assert (= (and b!123618 res!102473) b!123619))

(declare-fun m!188487 () Bool)

(assert (=> d!40126 m!188487))

(declare-fun m!188489 () Bool)

(assert (=> d!40126 m!188489))

(assert (=> b!122921 d!40126))

(assert (=> b!122921 d!39964))

(declare-fun d!40128 () Bool)

(declare-fun e!81025 () Bool)

(assert (=> d!40128 e!81025))

(declare-fun res!102475 () Bool)

(assert (=> d!40128 (=> (not res!102475) (not e!81025))))

(assert (=> d!40128 (= res!102475 (= (buf!2900 (_2!5467 (increaseBitIndex!0 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305))))) (buf!2900 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305)))))))

(declare-fun lt!195183 () Bool)

(assert (=> d!40128 (= lt!195183 (not (= (bvand ((_ sign_extend 24) (select (arr!3053 (buf!2900 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305)))) (currentByte!5597 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5592 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!195186 () tuple2!10418)

(assert (=> d!40128 (= lt!195186 (tuple2!10419 (not (= (bvand ((_ sign_extend 24) (select (arr!3053 (buf!2900 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305)))) (currentByte!5597 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5592 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305)))))) #b00000000000000000000000000000000)) (_2!5467 (increaseBitIndex!0 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305))))))))

(assert (=> d!40128 (validate_offset_bit!0 ((_ sign_extend 32) (size!2460 (buf!2900 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305))))) ((_ sign_extend 32) (currentByte!5597 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305)))) ((_ sign_extend 32) (currentBit!5592 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305)))))))

(assert (=> d!40128 (= (readBit!0 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305))) lt!195186)))

(declare-fun lt!195182 () (_ BitVec 64))

(declare-fun b!123620 () Bool)

(declare-fun lt!195187 () (_ BitVec 64))

(assert (=> b!123620 (= e!81025 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5467 (increaseBitIndex!0 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305)))))) (currentByte!5597 (_2!5467 (increaseBitIndex!0 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305))))) (currentBit!5592 (_2!5467 (increaseBitIndex!0 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305)))))) (bvadd lt!195182 lt!195187)))))

(assert (=> b!123620 (or (not (= (bvand lt!195182 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195187 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195182 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195182 lt!195187) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123620 (= lt!195187 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!123620 (= lt!195182 (bitIndex!0 (size!2460 (buf!2900 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305)))) (currentByte!5597 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305))) (currentBit!5592 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305)))))))

(declare-fun lt!195185 () Bool)

(assert (=> b!123620 (= lt!195185 (not (= (bvand ((_ sign_extend 24) (select (arr!3053 (buf!2900 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305)))) (currentByte!5597 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5592 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!195188 () Bool)

(assert (=> b!123620 (= lt!195188 (not (= (bvand ((_ sign_extend 24) (select (arr!3053 (buf!2900 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305)))) (currentByte!5597 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5592 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!195184 () Bool)

(assert (=> b!123620 (= lt!195184 (not (= (bvand ((_ sign_extend 24) (select (arr!3053 (buf!2900 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305)))) (currentByte!5597 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5592 (readerFrom!0 (_2!5467 lt!193401) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!40128 res!102475) b!123620))

(assert (=> d!40128 m!186693))

(declare-fun m!188491 () Bool)

(assert (=> d!40128 m!188491))

(declare-fun m!188493 () Bool)

(assert (=> d!40128 m!188493))

(declare-fun m!188495 () Bool)

(assert (=> d!40128 m!188495))

(declare-fun m!188497 () Bool)

(assert (=> d!40128 m!188497))

(assert (=> b!123620 m!188495))

(declare-fun m!188499 () Bool)

(assert (=> b!123620 m!188499))

(assert (=> b!123620 m!188493))

(assert (=> b!123620 m!186693))

(assert (=> b!123620 m!188491))

(declare-fun m!188501 () Bool)

(assert (=> b!123620 m!188501))

(assert (=> d!39650 d!40128))

(assert (=> d!39548 d!40064))

(assert (=> d!39548 d!40090))

(assert (=> b!122944 d!39548))

(assert (=> b!122944 d!39520))

(declare-fun d!40130 () Bool)

(declare-fun e!81026 () Bool)

(assert (=> d!40130 e!81026))

(declare-fun res!102476 () Bool)

(assert (=> d!40130 (=> (not res!102476) (not e!81026))))

(assert (=> d!40130 (= res!102476 (= (buf!2900 (_2!5467 (increaseBitIndex!0 lt!193404))) (buf!2900 lt!193404)))))

(declare-fun lt!195190 () Bool)

(assert (=> d!40130 (= lt!195190 (not (= (bvand ((_ sign_extend 24) (select (arr!3053 (buf!2900 lt!193404)) (currentByte!5597 lt!193404))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5592 lt!193404)))) #b00000000000000000000000000000000)))))

(declare-fun lt!195193 () tuple2!10418)

(assert (=> d!40130 (= lt!195193 (tuple2!10419 (not (= (bvand ((_ sign_extend 24) (select (arr!3053 (buf!2900 lt!193404)) (currentByte!5597 lt!193404))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5592 lt!193404)))) #b00000000000000000000000000000000)) (_2!5467 (increaseBitIndex!0 lt!193404))))))

(assert (=> d!40130 (validate_offset_bit!0 ((_ sign_extend 32) (size!2460 (buf!2900 lt!193404))) ((_ sign_extend 32) (currentByte!5597 lt!193404)) ((_ sign_extend 32) (currentBit!5592 lt!193404)))))

(assert (=> d!40130 (= (readBit!0 lt!193404) lt!195193)))

(declare-fun b!123621 () Bool)

(declare-fun lt!195189 () (_ BitVec 64))

(declare-fun lt!195194 () (_ BitVec 64))

(assert (=> b!123621 (= e!81026 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5467 (increaseBitIndex!0 lt!193404)))) (currentByte!5597 (_2!5467 (increaseBitIndex!0 lt!193404))) (currentBit!5592 (_2!5467 (increaseBitIndex!0 lt!193404)))) (bvadd lt!195189 lt!195194)))))

(assert (=> b!123621 (or (not (= (bvand lt!195189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195194 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195189 lt!195194) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123621 (= lt!195194 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!123621 (= lt!195189 (bitIndex!0 (size!2460 (buf!2900 lt!193404)) (currentByte!5597 lt!193404) (currentBit!5592 lt!193404)))))

(declare-fun lt!195192 () Bool)

(assert (=> b!123621 (= lt!195192 (not (= (bvand ((_ sign_extend 24) (select (arr!3053 (buf!2900 lt!193404)) (currentByte!5597 lt!193404))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5592 lt!193404)))) #b00000000000000000000000000000000)))))

(declare-fun lt!195195 () Bool)

(assert (=> b!123621 (= lt!195195 (not (= (bvand ((_ sign_extend 24) (select (arr!3053 (buf!2900 lt!193404)) (currentByte!5597 lt!193404))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5592 lt!193404)))) #b00000000000000000000000000000000)))))

(declare-fun lt!195191 () Bool)

(assert (=> b!123621 (= lt!195191 (not (= (bvand ((_ sign_extend 24) (select (arr!3053 (buf!2900 lt!193404)) (currentByte!5597 lt!193404))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5592 lt!193404)))) #b00000000000000000000000000000000)))))

(assert (= (and d!40130 res!102476) b!123621))

(declare-fun m!188503 () Bool)

(assert (=> d!40130 m!188503))

(declare-fun m!188505 () Bool)

(assert (=> d!40130 m!188505))

(declare-fun m!188507 () Bool)

(assert (=> d!40130 m!188507))

(declare-fun m!188509 () Bool)

(assert (=> d!40130 m!188509))

(assert (=> b!123621 m!188507))

(declare-fun m!188511 () Bool)

(assert (=> b!123621 m!188511))

(assert (=> b!123621 m!188505))

(assert (=> b!123621 m!188503))

(declare-fun m!188513 () Bool)

(assert (=> b!123621 m!188513))

(assert (=> d!39570 d!40130))

(declare-fun d!40132 () Bool)

(declare-fun res!102479 () Bool)

(declare-fun e!81027 () Bool)

(assert (=> d!40132 (=> (not res!102479) (not e!81027))))

(assert (=> d!40132 (= res!102479 (= (size!2460 (buf!2900 (ite c!7356 (_2!5467 lt!193401) lt!194281))) (size!2460 (buf!2900 (ite c!7356 (_2!5467 lt!194272) lt!194281)))))))

(assert (=> d!40132 (= (isPrefixOf!0 (ite c!7356 (_2!5467 lt!193401) lt!194281) (ite c!7356 (_2!5467 lt!194272) lt!194281)) e!81027)))

(declare-fun b!123622 () Bool)

(declare-fun res!102478 () Bool)

(assert (=> b!123622 (=> (not res!102478) (not e!81027))))

(assert (=> b!123622 (= res!102478 (bvsle (bitIndex!0 (size!2460 (buf!2900 (ite c!7356 (_2!5467 lt!193401) lt!194281))) (currentByte!5597 (ite c!7356 (_2!5467 lt!193401) lt!194281)) (currentBit!5592 (ite c!7356 (_2!5467 lt!193401) lt!194281))) (bitIndex!0 (size!2460 (buf!2900 (ite c!7356 (_2!5467 lt!194272) lt!194281))) (currentByte!5597 (ite c!7356 (_2!5467 lt!194272) lt!194281)) (currentBit!5592 (ite c!7356 (_2!5467 lt!194272) lt!194281)))))))

(declare-fun b!123623 () Bool)

(declare-fun e!81028 () Bool)

(assert (=> b!123623 (= e!81027 e!81028)))

(declare-fun res!102477 () Bool)

(assert (=> b!123623 (=> res!102477 e!81028)))

(assert (=> b!123623 (= res!102477 (= (size!2460 (buf!2900 (ite c!7356 (_2!5467 lt!193401) lt!194281))) #b00000000000000000000000000000000))))

(declare-fun b!123624 () Bool)

(assert (=> b!123624 (= e!81028 (arrayBitRangesEq!0 (buf!2900 (ite c!7356 (_2!5467 lt!193401) lt!194281)) (buf!2900 (ite c!7356 (_2!5467 lt!194272) lt!194281)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 (ite c!7356 (_2!5467 lt!193401) lt!194281))) (currentByte!5597 (ite c!7356 (_2!5467 lt!193401) lt!194281)) (currentBit!5592 (ite c!7356 (_2!5467 lt!193401) lt!194281)))))))

(assert (= (and d!40132 res!102479) b!123622))

(assert (= (and b!123622 res!102478) b!123623))

(assert (= (and b!123623 (not res!102477)) b!123624))

(declare-fun m!188515 () Bool)

(assert (=> b!123622 m!188515))

(declare-fun m!188517 () Bool)

(assert (=> b!123622 m!188517))

(assert (=> b!123624 m!188515))

(assert (=> b!123624 m!188515))

(declare-fun m!188519 () Bool)

(assert (=> b!123624 m!188519))

(assert (=> bm!1604 d!40132))

(declare-fun d!40134 () Bool)

(declare-fun res!102482 () Bool)

(declare-fun e!81029 () Bool)

(assert (=> d!40134 (=> (not res!102482) (not e!81029))))

(assert (=> d!40134 (= res!102482 (= (size!2460 (buf!2900 thiss!1305)) (size!2460 (buf!2900 (_2!5467 lt!193604)))))))

(assert (=> d!40134 (= (isPrefixOf!0 thiss!1305 (_2!5467 lt!193604)) e!81029)))

(declare-fun b!123625 () Bool)

(declare-fun res!102481 () Bool)

(assert (=> b!123625 (=> (not res!102481) (not e!81029))))

(assert (=> b!123625 (= res!102481 (bvsle (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193604))) (currentByte!5597 (_2!5467 lt!193604)) (currentBit!5592 (_2!5467 lt!193604)))))))

(declare-fun b!123626 () Bool)

(declare-fun e!81030 () Bool)

(assert (=> b!123626 (= e!81029 e!81030)))

(declare-fun res!102480 () Bool)

(assert (=> b!123626 (=> res!102480 e!81030)))

(assert (=> b!123626 (= res!102480 (= (size!2460 (buf!2900 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!123627 () Bool)

(assert (=> b!123627 (= e!81030 (arrayBitRangesEq!0 (buf!2900 thiss!1305) (buf!2900 (_2!5467 lt!193604)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))))))

(assert (= (and d!40134 res!102482) b!123625))

(assert (= (and b!123625 res!102481) b!123626))

(assert (= (and b!123626 (not res!102480)) b!123627))

(assert (=> b!123625 m!186643))

(assert (=> b!123625 m!186849))

(assert (=> b!123627 m!186643))

(assert (=> b!123627 m!186643))

(declare-fun m!188521 () Bool)

(assert (=> b!123627 m!188521))

(assert (=> b!122919 d!40134))

(declare-fun d!40136 () Bool)

(declare-fun res!102485 () Bool)

(declare-fun e!81031 () Bool)

(assert (=> d!40136 (=> (not res!102485) (not e!81031))))

(assert (=> d!40136 (= res!102485 (= (size!2460 (buf!2900 (_1!5466 lt!193698))) (size!2460 (buf!2900 (_2!5467 lt!193401)))))))

(assert (=> d!40136 (= (isPrefixOf!0 (_1!5466 lt!193698) (_2!5467 lt!193401)) e!81031)))

(declare-fun b!123628 () Bool)

(declare-fun res!102484 () Bool)

(assert (=> b!123628 (=> (not res!102484) (not e!81031))))

(assert (=> b!123628 (= res!102484 (bvsle (bitIndex!0 (size!2460 (buf!2900 (_1!5466 lt!193698))) (currentByte!5597 (_1!5466 lt!193698)) (currentBit!5592 (_1!5466 lt!193698))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193401))) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401)))))))

(declare-fun b!123629 () Bool)

(declare-fun e!81032 () Bool)

(assert (=> b!123629 (= e!81031 e!81032)))

(declare-fun res!102483 () Bool)

(assert (=> b!123629 (=> res!102483 e!81032)))

(assert (=> b!123629 (= res!102483 (= (size!2460 (buf!2900 (_1!5466 lt!193698))) #b00000000000000000000000000000000))))

(declare-fun b!123630 () Bool)

(assert (=> b!123630 (= e!81032 (arrayBitRangesEq!0 (buf!2900 (_1!5466 lt!193698)) (buf!2900 (_2!5467 lt!193401)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 (_1!5466 lt!193698))) (currentByte!5597 (_1!5466 lt!193698)) (currentBit!5592 (_1!5466 lt!193698)))))))

(assert (= (and d!40136 res!102485) b!123628))

(assert (= (and b!123628 res!102484) b!123629))

(assert (= (and b!123629 (not res!102483)) b!123630))

(assert (=> b!123628 m!188409))

(assert (=> b!123628 m!186641))

(assert (=> b!123630 m!188409))

(assert (=> b!123630 m!188409))

(declare-fun m!188523 () Bool)

(assert (=> b!123630 m!188523))

(assert (=> b!122941 d!40136))

(assert (=> b!123134 d!39654))

(declare-fun d!40138 () Bool)

(declare-fun e!81033 () Bool)

(assert (=> d!40138 e!81033))

(declare-fun res!102487 () Bool)

(assert (=> d!40138 (=> (not res!102487) (not e!81033))))

(declare-fun lt!195201 () (_ BitVec 64))

(declare-fun lt!195196 () (_ BitVec 64))

(declare-fun lt!195197 () (_ BitVec 64))

(assert (=> d!40138 (= res!102487 (= lt!195196 (bvsub lt!195197 lt!195201)))))

(assert (=> d!40138 (or (= (bvand lt!195197 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195201 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195197 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195197 lt!195201) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40138 (= lt!195201 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!194276)))) ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!194276))) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!194276)))))))

(declare-fun lt!195199 () (_ BitVec 64))

(declare-fun lt!195200 () (_ BitVec 64))

(assert (=> d!40138 (= lt!195197 (bvmul lt!195199 lt!195200))))

(assert (=> d!40138 (or (= lt!195199 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195200 (bvsdiv (bvmul lt!195199 lt!195200) lt!195199)))))

(assert (=> d!40138 (= lt!195200 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40138 (= lt!195199 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!194276)))))))

(assert (=> d!40138 (= lt!195196 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!194276))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!194276)))))))

(assert (=> d!40138 (invariant!0 (currentBit!5592 (_1!5468 lt!194276)) (currentByte!5597 (_1!5468 lt!194276)) (size!2460 (buf!2900 (_1!5468 lt!194276))))))

(assert (=> d!40138 (= (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!194276))) (currentByte!5597 (_1!5468 lt!194276)) (currentBit!5592 (_1!5468 lt!194276))) lt!195196)))

(declare-fun b!123631 () Bool)

(declare-fun res!102486 () Bool)

(assert (=> b!123631 (=> (not res!102486) (not e!81033))))

(assert (=> b!123631 (= res!102486 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195196))))

(declare-fun b!123632 () Bool)

(declare-fun lt!195198 () (_ BitVec 64))

(assert (=> b!123632 (= e!81033 (bvsle lt!195196 (bvmul lt!195198 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123632 (or (= lt!195198 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195198 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195198)))))

(assert (=> b!123632 (= lt!195198 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!194276)))))))

(assert (= (and d!40138 res!102487) b!123631))

(assert (= (and b!123631 res!102486) b!123632))

(declare-fun m!188525 () Bool)

(assert (=> d!40138 m!188525))

(declare-fun m!188527 () Bool)

(assert (=> d!40138 m!188527))

(assert (=> b!123123 d!40138))

(assert (=> b!123123 d!40114))

(declare-fun b!123644 () Bool)

(declare-fun e!81045 () Bool)

(declare-fun lt!195204 () tuple2!10406)

(declare-fun _$19!120 () tuple2!10404)

(assert (=> b!123644 (= e!81045 (= (bitIndex!0 (size!2460 (buf!2900 (_1!5468 lt!195204))) (currentByte!5597 (_1!5468 lt!195204)) (currentBit!5592 (_1!5468 lt!195204))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 _$19!120))) (currentByte!5597 (_2!5467 _$19!120)) (currentBit!5592 (_2!5467 _$19!120)))))))

(declare-fun d!40140 () Bool)

(declare-fun e!81042 () Bool)

(assert (=> d!40140 e!81042))

(declare-fun res!102498 () Bool)

(assert (=> d!40140 (=> (not res!102498) (not e!81042))))

(assert (=> d!40140 (= res!102498 (= (size!2460 (buf!2900 thiss!1305)) (size!2460 (buf!2900 (_2!5467 _$19!120)))))))

(declare-fun e!81044 () Bool)

(assert (=> d!40140 (and (inv!12 (_2!5467 _$19!120)) e!81044)))

(assert (=> d!40140 (= (choose!16 thiss!1305 lt!193397) _$19!120)))

(declare-fun b!123645 () Bool)

(assert (=> b!123645 (= e!81042 e!81045)))

(declare-fun res!102496 () Bool)

(assert (=> b!123645 (=> (not res!102496) (not e!81045))))

(assert (=> b!123645 (= res!102496 (and (= (_2!5468 lt!195204) lt!193397) (= (_1!5468 lt!195204) (_2!5467 _$19!120))))))

(assert (=> b!123645 (= lt!195204 (readBitPure!0 (readerFrom!0 (_2!5467 _$19!120) (currentBit!5592 thiss!1305) (currentByte!5597 thiss!1305))))))

(declare-fun b!123646 () Bool)

(declare-fun res!102499 () Bool)

(assert (=> b!123646 (=> (not res!102499) (not e!81042))))

(assert (=> b!123646 (= res!102499 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5467 _$19!120))) (currentByte!5597 (_2!5467 _$19!120)) (currentBit!5592 (_2!5467 _$19!120))) (bvadd (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!123647 () Bool)

(assert (=> b!123647 (= e!81044 (array_inv!2262 (buf!2900 (_2!5467 _$19!120))))))

(declare-fun b!123648 () Bool)

(declare-fun res!102497 () Bool)

(assert (=> b!123648 (=> (not res!102497) (not e!81042))))

(assert (=> b!123648 (= res!102497 (isPrefixOf!0 thiss!1305 (_2!5467 _$19!120)))))

(assert (= d!40140 b!123647))

(assert (= (and d!40140 res!102498) b!123646))

(assert (= (and b!123646 res!102499) b!123648))

(assert (= (and b!123648 res!102497) b!123645))

(assert (= (and b!123645 res!102496) b!123644))

(declare-fun m!188529 () Bool)

(assert (=> b!123647 m!188529))

(declare-fun m!188531 () Bool)

(assert (=> b!123648 m!188531))

(declare-fun m!188533 () Bool)

(assert (=> b!123646 m!188533))

(assert (=> b!123646 m!186643))

(declare-fun m!188535 () Bool)

(assert (=> b!123644 m!188535))

(assert (=> b!123644 m!188533))

(declare-fun m!188537 () Bool)

(assert (=> b!123645 m!188537))

(assert (=> b!123645 m!188537))

(declare-fun m!188539 () Bool)

(assert (=> b!123645 m!188539))

(declare-fun m!188541 () Bool)

(assert (=> d!40140 m!188541))

(assert (=> d!39558 d!40140))

(declare-fun d!40142 () Bool)

(assert (=> d!40142 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2460 (buf!2900 thiss!1305))) ((_ sign_extend 32) (currentByte!5597 thiss!1305)) ((_ sign_extend 32) (currentBit!5592 thiss!1305))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 thiss!1305))) ((_ sign_extend 32) (currentByte!5597 thiss!1305)) ((_ sign_extend 32) (currentBit!5592 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!9678 () Bool)

(assert (= bs!9678 d!40142))

(assert (=> bs!9678 m!186785))

(assert (=> d!39558 d!40142))

(declare-fun d!40144 () Bool)

(assert (=> d!40144 (= (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193385)))) ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!193385))) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!193385)))) (bvsub (bvmul ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193385)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!193385))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!193385))))))))

(assert (=> d!39562 d!40144))

(declare-fun d!40146 () Bool)

(assert (=> d!40146 (= (invariant!0 (currentBit!5592 (_1!5468 lt!193385)) (currentByte!5597 (_1!5468 lt!193385)) (size!2460 (buf!2900 (_1!5468 lt!193385)))) (and (bvsge (currentBit!5592 (_1!5468 lt!193385)) #b00000000000000000000000000000000) (bvslt (currentBit!5592 (_1!5468 lt!193385)) #b00000000000000000000000000001000) (bvsge (currentByte!5597 (_1!5468 lt!193385)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5597 (_1!5468 lt!193385)) (size!2460 (buf!2900 (_1!5468 lt!193385)))) (and (= (currentBit!5592 (_1!5468 lt!193385)) #b00000000000000000000000000000000) (= (currentByte!5597 (_1!5468 lt!193385)) (size!2460 (buf!2900 (_1!5468 lt!193385))))))))))

(assert (=> d!39562 d!40146))

(declare-fun d!40148 () Bool)

(declare-fun res!102500 () Bool)

(declare-fun e!81049 () Bool)

(assert (=> d!40148 (=> res!102500 e!81049)))

(assert (=> d!40148 (= res!102500 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))))))

(assert (=> d!40148 (= (arrayBitRangesEq!0 (buf!2900 thiss!1305) (buf!2900 (_2!5467 lt!193401)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))) e!81049)))

(declare-fun b!123649 () Bool)

(declare-fun lt!195207 () tuple4!90)

(declare-fun e!81048 () Bool)

(assert (=> b!123649 (= e!81048 (arrayRangesEq!46 (buf!2900 thiss!1305) (buf!2900 (_2!5467 lt!193401)) (_1!5476 lt!195207) (_2!5476 lt!195207)))))

(declare-fun b!123650 () Bool)

(declare-fun e!81047 () Bool)

(declare-fun call!1621 () Bool)

(assert (=> b!123650 (= e!81047 call!1621)))

(declare-fun b!123651 () Bool)

(declare-fun res!102504 () Bool)

(declare-fun lt!195206 () (_ BitVec 32))

(assert (=> b!123651 (= res!102504 (= lt!195206 #b00000000000000000000000000000000))))

(declare-fun e!81050 () Bool)

(assert (=> b!123651 (=> res!102504 e!81050)))

(declare-fun e!81046 () Bool)

(assert (=> b!123651 (= e!81046 e!81050)))

(declare-fun c!7397 () Bool)

(declare-fun lt!195205 () (_ BitVec 32))

(declare-fun bm!1618 () Bool)

(assert (=> bm!1618 (= call!1621 (byteRangesEq!0 (ite c!7397 (select (arr!3053 (buf!2900 thiss!1305)) (_3!266 lt!195207)) (select (arr!3053 (buf!2900 thiss!1305)) (_4!45 lt!195207))) (ite c!7397 (select (arr!3053 (buf!2900 (_2!5467 lt!193401))) (_3!266 lt!195207)) (select (arr!3053 (buf!2900 (_2!5467 lt!193401))) (_4!45 lt!195207))) (ite c!7397 lt!195205 #b00000000000000000000000000000000) lt!195206))))

(declare-fun b!123652 () Bool)

(declare-fun e!81051 () Bool)

(assert (=> b!123652 (= e!81051 e!81047)))

(assert (=> b!123652 (= c!7397 (= (_3!266 lt!195207) (_4!45 lt!195207)))))

(declare-fun b!123653 () Bool)

(assert (=> b!123653 (= e!81047 e!81046)))

(declare-fun res!102501 () Bool)

(assert (=> b!123653 (= res!102501 (byteRangesEq!0 (select (arr!3053 (buf!2900 thiss!1305)) (_3!266 lt!195207)) (select (arr!3053 (buf!2900 (_2!5467 lt!193401))) (_3!266 lt!195207)) lt!195205 #b00000000000000000000000000001000))))

(assert (=> b!123653 (=> (not res!102501) (not e!81046))))

(declare-fun b!123654 () Bool)

(assert (=> b!123654 (= e!81050 call!1621)))

(declare-fun b!123655 () Bool)

(assert (=> b!123655 (= e!81049 e!81051)))

(declare-fun res!102502 () Bool)

(assert (=> b!123655 (=> (not res!102502) (not e!81051))))

(assert (=> b!123655 (= res!102502 e!81048)))

(declare-fun res!102503 () Bool)

(assert (=> b!123655 (=> res!102503 e!81048)))

(assert (=> b!123655 (= res!102503 (bvsge (_1!5476 lt!195207) (_2!5476 lt!195207)))))

(assert (=> b!123655 (= lt!195206 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123655 (= lt!195205 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123655 (= lt!195207 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 thiss!1305)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))))))

(assert (= (and d!40148 (not res!102500)) b!123655))

(assert (= (and b!123655 (not res!102503)) b!123649))

(assert (= (and b!123655 res!102502) b!123652))

(assert (= (and b!123652 c!7397) b!123650))

(assert (= (and b!123652 (not c!7397)) b!123653))

(assert (= (and b!123653 res!102501) b!123651))

(assert (= (and b!123651 (not res!102504)) b!123654))

(assert (= (or b!123650 b!123654) bm!1618))

(declare-fun m!188543 () Bool)

(assert (=> b!123649 m!188543))

(declare-fun m!188545 () Bool)

(assert (=> bm!1618 m!188545))

(declare-fun m!188547 () Bool)

(assert (=> bm!1618 m!188547))

(declare-fun m!188549 () Bool)

(assert (=> bm!1618 m!188549))

(declare-fun m!188551 () Bool)

(assert (=> bm!1618 m!188551))

(declare-fun m!188553 () Bool)

(assert (=> bm!1618 m!188553))

(assert (=> b!123653 m!188545))

(assert (=> b!123653 m!188547))

(assert (=> b!123653 m!188545))

(assert (=> b!123653 m!188547))

(declare-fun m!188555 () Bool)

(assert (=> b!123653 m!188555))

(assert (=> b!123655 m!186643))

(assert (=> b!123655 m!188479))

(assert (=> b!122876 d!40148))

(assert (=> b!122876 d!39548))

(declare-fun d!40150 () Bool)

(declare-fun res!102507 () Bool)

(declare-fun e!81052 () Bool)

(assert (=> d!40150 (=> (not res!102507) (not e!81052))))

(assert (=> d!40150 (= res!102507 (= (size!2460 (buf!2900 (_2!5466 lt!193698))) (size!2460 (buf!2900 (_2!5467 lt!193395)))))))

(assert (=> d!40150 (= (isPrefixOf!0 (_2!5466 lt!193698) (_2!5467 lt!193395)) e!81052)))

(declare-fun b!123656 () Bool)

(declare-fun res!102506 () Bool)

(assert (=> b!123656 (=> (not res!102506) (not e!81052))))

(assert (=> b!123656 (= res!102506 (bvsle (bitIndex!0 (size!2460 (buf!2900 (_2!5466 lt!193698))) (currentByte!5597 (_2!5466 lt!193698)) (currentBit!5592 (_2!5466 lt!193698))) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!193395))) (currentByte!5597 (_2!5467 lt!193395)) (currentBit!5592 (_2!5467 lt!193395)))))))

(declare-fun b!123657 () Bool)

(declare-fun e!81053 () Bool)

(assert (=> b!123657 (= e!81052 e!81053)))

(declare-fun res!102505 () Bool)

(assert (=> b!123657 (=> res!102505 e!81053)))

(assert (=> b!123657 (= res!102505 (= (size!2460 (buf!2900 (_2!5466 lt!193698))) #b00000000000000000000000000000000))))

(declare-fun b!123658 () Bool)

(assert (=> b!123658 (= e!81053 (arrayBitRangesEq!0 (buf!2900 (_2!5466 lt!193698)) (buf!2900 (_2!5467 lt!193395)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2460 (buf!2900 (_2!5466 lt!193698))) (currentByte!5597 (_2!5466 lt!193698)) (currentBit!5592 (_2!5466 lt!193698)))))))

(assert (= (and d!40150 res!102507) b!123656))

(assert (= (and b!123656 res!102506) b!123657))

(assert (= (and b!123657 (not res!102505)) b!123658))

(assert (=> b!123656 m!188091))

(assert (=> b!123656 m!186709))

(assert (=> b!123658 m!188091))

(assert (=> b!123658 m!188091))

(declare-fun m!188557 () Bool)

(assert (=> b!123658 m!188557))

(assert (=> b!122939 d!40150))

(declare-fun d!40152 () Bool)

(declare-fun e!81054 () Bool)

(assert (=> d!40152 e!81054))

(declare-fun res!102508 () Bool)

(assert (=> d!40152 (=> (not res!102508) (not e!81054))))

(assert (=> d!40152 (= res!102508 (= (buf!2900 (_2!5467 (increaseBitIndex!0 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))))) (buf!2900 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))))))

(declare-fun lt!195209 () Bool)

(assert (=> d!40152 (= lt!195209 (not (= (bvand ((_ sign_extend 24) (select (arr!3053 (buf!2900 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))) (currentByte!5597 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5592 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!195212 () tuple2!10418)

(assert (=> d!40152 (= lt!195212 (tuple2!10419 (not (= (bvand ((_ sign_extend 24) (select (arr!3053 (buf!2900 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))) (currentByte!5597 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5592 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))))) #b00000000000000000000000000000000)) (_2!5467 (increaseBitIndex!0 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))))))))

(assert (=> d!40152 (validate_offset_bit!0 ((_ sign_extend 32) (size!2460 (buf!2900 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))))) ((_ sign_extend 32) (currentByte!5597 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))) ((_ sign_extend 32) (currentBit!5592 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))))))

(assert (=> d!40152 (= (readBit!0 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))) lt!195212)))

(declare-fun lt!195208 () (_ BitVec 64))

(declare-fun b!123659 () Bool)

(declare-fun lt!195213 () (_ BitVec 64))

(assert (=> b!123659 (= e!81054 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5467 (increaseBitIndex!0 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))))) (currentByte!5597 (_2!5467 (increaseBitIndex!0 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))))) (currentBit!5592 (_2!5467 (increaseBitIndex!0 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))))) (bvadd lt!195208 lt!195213)))))

(assert (=> b!123659 (or (not (= (bvand lt!195208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195213 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195208 lt!195213) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123659 (= lt!195213 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!123659 (= lt!195208 (bitIndex!0 (size!2460 (buf!2900 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))) (currentByte!5597 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))) (currentBit!5592 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))))))

(declare-fun lt!195211 () Bool)

(assert (=> b!123659 (= lt!195211 (not (= (bvand ((_ sign_extend 24) (select (arr!3053 (buf!2900 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))) (currentByte!5597 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5592 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!195214 () Bool)

(assert (=> b!123659 (= lt!195214 (not (= (bvand ((_ sign_extend 24) (select (arr!3053 (buf!2900 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))) (currentByte!5597 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5592 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!195210 () Bool)

(assert (=> b!123659 (= lt!195210 (not (= (bvand ((_ sign_extend 24) (select (arr!3053 (buf!2900 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))) (currentByte!5597 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5592 (BitStream!4395 (buf!2900 (_2!5467 lt!193395)) (currentByte!5597 thiss!1305) (currentBit!5592 thiss!1305)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!40152 res!102508) b!123659))

(declare-fun m!188559 () Bool)

(assert (=> d!40152 m!188559))

(declare-fun m!188561 () Bool)

(assert (=> d!40152 m!188561))

(declare-fun m!188563 () Bool)

(assert (=> d!40152 m!188563))

(declare-fun m!188565 () Bool)

(assert (=> d!40152 m!188565))

(assert (=> b!123659 m!188563))

(declare-fun m!188567 () Bool)

(assert (=> b!123659 m!188567))

(assert (=> b!123659 m!188561))

(assert (=> b!123659 m!188559))

(declare-fun m!188569 () Bool)

(assert (=> b!123659 m!188569))

(assert (=> d!39576 d!40152))

(declare-fun d!40154 () Bool)

(declare-fun lt!195215 () tuple2!10418)

(assert (=> d!40154 (= lt!195215 (readBit!0 (readerFrom!0 (_2!5467 lt!194272) (currentBit!5592 (_2!5467 lt!193401)) (currentByte!5597 (_2!5467 lt!193401)))))))

(assert (=> d!40154 (= (readBitPure!0 (readerFrom!0 (_2!5467 lt!194272) (currentBit!5592 (_2!5467 lt!193401)) (currentByte!5597 (_2!5467 lt!193401)))) (tuple2!10407 (_2!5474 lt!195215) (_1!5474 lt!195215)))))

(declare-fun bs!9679 () Bool)

(assert (= bs!9679 d!40154))

(assert (=> bs!9679 m!187293))

(declare-fun m!188571 () Bool)

(assert (=> bs!9679 m!188571))

(assert (=> b!123117 d!40154))

(declare-fun d!40156 () Bool)

(declare-fun e!81055 () Bool)

(assert (=> d!40156 e!81055))

(declare-fun res!102509 () Bool)

(assert (=> d!40156 (=> (not res!102509) (not e!81055))))

(assert (=> d!40156 (= res!102509 (invariant!0 (currentBit!5592 (_2!5467 lt!194272)) (currentByte!5597 (_2!5467 lt!194272)) (size!2460 (buf!2900 (_2!5467 lt!194272)))))))

(assert (=> d!40156 (= (readerFrom!0 (_2!5467 lt!194272) (currentBit!5592 (_2!5467 lt!193401)) (currentByte!5597 (_2!5467 lt!193401))) (BitStream!4395 (buf!2900 (_2!5467 lt!194272)) (currentByte!5597 (_2!5467 lt!193401)) (currentBit!5592 (_2!5467 lt!193401))))))

(declare-fun b!123660 () Bool)

(assert (=> b!123660 (= e!81055 (invariant!0 (currentBit!5592 (_2!5467 lt!193401)) (currentByte!5597 (_2!5467 lt!193401)) (size!2460 (buf!2900 (_2!5467 lt!194272)))))))

(assert (= (and d!40156 res!102509) b!123660))

(assert (=> d!40156 m!188483))

(declare-fun m!188573 () Bool)

(assert (=> b!123660 m!188573))

(assert (=> b!123117 d!40156))

(declare-fun d!40158 () Bool)

(declare-fun e!81056 () Bool)

(assert (=> d!40158 e!81056))

(declare-fun res!102511 () Bool)

(assert (=> d!40158 (=> (not res!102511) (not e!81056))))

(declare-fun lt!195216 () (_ BitVec 64))

(declare-fun lt!195217 () (_ BitVec 64))

(declare-fun lt!195221 () (_ BitVec 64))

(assert (=> d!40158 (= res!102511 (= lt!195216 (bvsub lt!195217 lt!195221)))))

(assert (=> d!40158 (or (= (bvand lt!195217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195221 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195217 lt!195221) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40158 (= lt!195221 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 lt!193545))) ((_ sign_extend 32) (currentByte!5597 lt!193545)) ((_ sign_extend 32) (currentBit!5592 lt!193545))))))

(declare-fun lt!195219 () (_ BitVec 64))

(declare-fun lt!195220 () (_ BitVec 64))

(assert (=> d!40158 (= lt!195217 (bvmul lt!195219 lt!195220))))

(assert (=> d!40158 (or (= lt!195219 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195220 (bvsdiv (bvmul lt!195219 lt!195220) lt!195219)))))

(assert (=> d!40158 (= lt!195220 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40158 (= lt!195219 ((_ sign_extend 32) (size!2460 (buf!2900 lt!193545))))))

(assert (=> d!40158 (= lt!195216 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 lt!193545)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 lt!193545))))))

(assert (=> d!40158 (invariant!0 (currentBit!5592 lt!193545) (currentByte!5597 lt!193545) (size!2460 (buf!2900 lt!193545)))))

(assert (=> d!40158 (= (bitIndex!0 (size!2460 (buf!2900 lt!193545)) (currentByte!5597 lt!193545) (currentBit!5592 lt!193545)) lt!195216)))

(declare-fun b!123661 () Bool)

(declare-fun res!102510 () Bool)

(assert (=> b!123661 (=> (not res!102510) (not e!81056))))

(assert (=> b!123661 (= res!102510 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195216))))

(declare-fun b!123662 () Bool)

(declare-fun lt!195218 () (_ BitVec 64))

(assert (=> b!123662 (= e!81056 (bvsle lt!195216 (bvmul lt!195218 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123662 (or (= lt!195218 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195218 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195218)))))

(assert (=> b!123662 (= lt!195218 ((_ sign_extend 32) (size!2460 (buf!2900 lt!193545))))))

(assert (= (and d!40158 res!102511) b!123661))

(assert (= (and b!123661 res!102510) b!123662))

(declare-fun m!188575 () Bool)

(assert (=> d!40158 m!188575))

(declare-fun m!188577 () Bool)

(assert (=> d!40158 m!188577))

(assert (=> d!39528 d!40158))

(declare-fun d!40160 () Bool)

(declare-fun e!81057 () Bool)

(assert (=> d!40160 e!81057))

(declare-fun res!102513 () Bool)

(assert (=> d!40160 (=> (not res!102513) (not e!81057))))

(declare-fun lt!195222 () (_ BitVec 64))

(declare-fun lt!195223 () (_ BitVec 64))

(declare-fun lt!195227 () (_ BitVec 64))

(assert (=> d!40160 (= res!102513 (= lt!195222 (bvsub lt!195223 lt!195227)))))

(assert (=> d!40160 (or (= (bvand lt!195223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195227 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195223 lt!195227) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40160 (= lt!195227 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5466 lt!193409)))) ((_ sign_extend 32) (currentByte!5597 (_1!5466 lt!193409))) ((_ sign_extend 32) (currentBit!5592 (_1!5466 lt!193409)))))))

(declare-fun lt!195225 () (_ BitVec 64))

(declare-fun lt!195226 () (_ BitVec 64))

(assert (=> d!40160 (= lt!195223 (bvmul lt!195225 lt!195226))))

(assert (=> d!40160 (or (= lt!195225 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195226 (bvsdiv (bvmul lt!195225 lt!195226) lt!195225)))))

(assert (=> d!40160 (= lt!195226 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40160 (= lt!195225 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5466 lt!193409)))))))

(assert (=> d!40160 (= lt!195222 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_1!5466 lt!193409))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_1!5466 lt!193409)))))))

(assert (=> d!40160 (invariant!0 (currentBit!5592 (_1!5466 lt!193409)) (currentByte!5597 (_1!5466 lt!193409)) (size!2460 (buf!2900 (_1!5466 lt!193409))))))

(assert (=> d!40160 (= (bitIndex!0 (size!2460 (buf!2900 (_1!5466 lt!193409))) (currentByte!5597 (_1!5466 lt!193409)) (currentBit!5592 (_1!5466 lt!193409))) lt!195222)))

(declare-fun b!123663 () Bool)

(declare-fun res!102512 () Bool)

(assert (=> b!123663 (=> (not res!102512) (not e!81057))))

(assert (=> b!123663 (= res!102512 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195222))))

(declare-fun b!123664 () Bool)

(declare-fun lt!195224 () (_ BitVec 64))

(assert (=> b!123664 (= e!81057 (bvsle lt!195222 (bvmul lt!195224 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123664 (or (= lt!195224 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195224 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195224)))))

(assert (=> b!123664 (= lt!195224 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5466 lt!193409)))))))

(assert (= (and d!40160 res!102513) b!123663))

(assert (= (and b!123663 res!102512) b!123664))

(declare-fun m!188579 () Bool)

(assert (=> d!40160 m!188579))

(declare-fun m!188581 () Bool)

(assert (=> d!40160 m!188581))

(assert (=> d!39528 d!40160))

(declare-fun d!40162 () Bool)

(declare-fun lt!195232 () (_ BitVec 32))

(assert (=> d!40162 (= lt!195232 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!195230 () (_ BitVec 32))

(assert (=> d!40162 (= lt!195230 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!81059 () Bool)

(assert (=> d!40162 e!81059))

(declare-fun res!102515 () Bool)

(assert (=> d!40162 (=> (not res!102515) (not e!81059))))

(assert (=> d!40162 (= res!102515 (moveBitIndexPrecond!0 (_1!5466 lt!193409) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!7633 () Unit!7559)

(declare-fun Unit!7634 () Unit!7559)

(declare-fun Unit!7635 () Unit!7559)

(assert (=> d!40162 (= (moveBitIndex!0 (_1!5466 lt!193409) #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!5592 (_1!5466 lt!193409)) lt!195232) #b00000000000000000000000000000000) (tuple2!10405 Unit!7633 (BitStream!4395 (buf!2900 (_1!5466 lt!193409)) (bvsub (bvadd (currentByte!5597 (_1!5466 lt!193409)) lt!195230) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!195232 (currentBit!5592 (_1!5466 lt!193409))))) (ite (bvsge (bvadd (currentBit!5592 (_1!5466 lt!193409)) lt!195232) #b00000000000000000000000000001000) (tuple2!10405 Unit!7634 (BitStream!4395 (buf!2900 (_1!5466 lt!193409)) (bvadd (currentByte!5597 (_1!5466 lt!193409)) lt!195230 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5592 (_1!5466 lt!193409)) lt!195232) #b00000000000000000000000000001000))) (tuple2!10405 Unit!7635 (BitStream!4395 (buf!2900 (_1!5466 lt!193409)) (bvadd (currentByte!5597 (_1!5466 lt!193409)) lt!195230) (bvadd (currentBit!5592 (_1!5466 lt!193409)) lt!195232))))))))

(declare-fun b!123665 () Bool)

(declare-fun e!81058 () Bool)

(assert (=> b!123665 (= e!81059 e!81058)))

(declare-fun res!102514 () Bool)

(assert (=> b!123665 (=> (not res!102514) (not e!81058))))

(declare-fun lt!195228 () (_ BitVec 64))

(declare-fun lt!195233 () tuple2!10404)

(assert (=> b!123665 (= res!102514 (= (bvadd lt!195228 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!195233))) (currentByte!5597 (_2!5467 lt!195233)) (currentBit!5592 (_2!5467 lt!195233)))))))

(assert (=> b!123665 (or (not (= (bvand lt!195228 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195228 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195228 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123665 (= lt!195228 (bitIndex!0 (size!2460 (buf!2900 (_1!5466 lt!193409))) (currentByte!5597 (_1!5466 lt!193409)) (currentBit!5592 (_1!5466 lt!193409))))))

(declare-fun lt!195229 () (_ BitVec 32))

(declare-fun lt!195231 () (_ BitVec 32))

(declare-fun Unit!7636 () Unit!7559)

(declare-fun Unit!7637 () Unit!7559)

(declare-fun Unit!7638 () Unit!7559)

(assert (=> b!123665 (= lt!195233 (ite (bvslt (bvadd (currentBit!5592 (_1!5466 lt!193409)) lt!195229) #b00000000000000000000000000000000) (tuple2!10405 Unit!7636 (BitStream!4395 (buf!2900 (_1!5466 lt!193409)) (bvsub (bvadd (currentByte!5597 (_1!5466 lt!193409)) lt!195231) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!195229 (currentBit!5592 (_1!5466 lt!193409))))) (ite (bvsge (bvadd (currentBit!5592 (_1!5466 lt!193409)) lt!195229) #b00000000000000000000000000001000) (tuple2!10405 Unit!7637 (BitStream!4395 (buf!2900 (_1!5466 lt!193409)) (bvadd (currentByte!5597 (_1!5466 lt!193409)) lt!195231 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5592 (_1!5466 lt!193409)) lt!195229) #b00000000000000000000000000001000))) (tuple2!10405 Unit!7638 (BitStream!4395 (buf!2900 (_1!5466 lt!193409)) (bvadd (currentByte!5597 (_1!5466 lt!193409)) lt!195231) (bvadd (currentBit!5592 (_1!5466 lt!193409)) lt!195229))))))))

(assert (=> b!123665 (= lt!195229 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123665 (= lt!195231 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!123666 () Bool)

(assert (=> b!123666 (= e!81058 (and (= (size!2460 (buf!2900 (_1!5466 lt!193409))) (size!2460 (buf!2900 (_2!5467 lt!195233)))) (= (buf!2900 (_1!5466 lt!193409)) (buf!2900 (_2!5467 lt!195233)))))))

(assert (= (and d!40162 res!102515) b!123665))

(assert (= (and b!123665 res!102514) b!123666))

(assert (=> d!40162 m!186807))

(declare-fun m!188583 () Bool)

(assert (=> b!123665 m!188583))

(assert (=> b!123665 m!186803))

(assert (=> d!39528 d!40162))

(declare-fun d!40164 () Bool)

(declare-fun res!102516 () Bool)

(declare-fun e!81060 () Bool)

(assert (=> d!40164 (=> (not res!102516) (not e!81060))))

(assert (=> d!40164 (= res!102516 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5466 lt!193409))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5466 lt!193409))))))))))

(assert (=> d!40164 (= (moveBitIndexPrecond!0 (_1!5466 lt!193409) #b0000000000000000000000000000000000000000000000000000000000000001) e!81060)))

(declare-fun b!123667 () Bool)

(declare-fun lt!195234 () (_ BitVec 64))

(assert (=> b!123667 (= e!81060 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195234) (bvsle lt!195234 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5466 lt!193409))))))))))

(assert (=> b!123667 (= lt!195234 (bvadd (bitIndex!0 (size!2460 (buf!2900 (_1!5466 lt!193409))) (currentByte!5597 (_1!5466 lt!193409)) (currentBit!5592 (_1!5466 lt!193409))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!40164 res!102516) b!123667))

(assert (=> b!123667 m!186803))

(assert (=> d!39528 d!40164))

(assert (=> d!39568 d!39584))

(declare-fun d!40166 () Bool)

(assert (=> d!40166 (isPrefixOf!0 thiss!1305 (_2!5467 lt!193395))))

(assert (=> d!40166 true))

(declare-fun _$15!195 () Unit!7559)

(assert (=> d!40166 (= (choose!30 thiss!1305 (_2!5467 lt!193401) (_2!5467 lt!193395)) _$15!195)))

(declare-fun bs!9680 () Bool)

(assert (= bs!9680 d!40166))

(assert (=> bs!9680 m!186673))

(assert (=> d!39568 d!40166))

(assert (=> d!39568 d!39498))

(declare-fun d!40168 () Bool)

(assert (=> d!40168 (= (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193393)))) ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!193393))) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!193393)))) (bvsub (bvmul ((_ sign_extend 32) (size!2460 (buf!2900 (_1!5468 lt!193393)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_1!5468 lt!193393))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_1!5468 lt!193393))))))))

(assert (=> d!39502 d!40168))

(declare-fun d!40170 () Bool)

(assert (=> d!40170 (= (invariant!0 (currentBit!5592 (_1!5468 lt!193393)) (currentByte!5597 (_1!5468 lt!193393)) (size!2460 (buf!2900 (_1!5468 lt!193393)))) (and (bvsge (currentBit!5592 (_1!5468 lt!193393)) #b00000000000000000000000000000000) (bvslt (currentBit!5592 (_1!5468 lt!193393)) #b00000000000000000000000000001000) (bvsge (currentByte!5597 (_1!5468 lt!193393)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5597 (_1!5468 lt!193393)) (size!2460 (buf!2900 (_1!5468 lt!193393)))) (and (= (currentBit!5592 (_1!5468 lt!193393)) #b00000000000000000000000000000000) (= (currentByte!5597 (_1!5468 lt!193393)) (size!2460 (buf!2900 (_1!5468 lt!193393))))))))))

(assert (=> d!39502 d!40170))

(declare-fun d!40172 () Bool)

(declare-fun e!81061 () Bool)

(assert (=> d!40172 e!81061))

(declare-fun res!102518 () Bool)

(assert (=> d!40172 (=> (not res!102518) (not e!81061))))

(declare-fun lt!195236 () (_ BitVec 64))

(declare-fun lt!195235 () (_ BitVec 64))

(declare-fun lt!195240 () (_ BitVec 64))

(assert (=> d!40172 (= res!102518 (= lt!195235 (bvsub lt!195236 lt!195240)))))

(assert (=> d!40172 (or (= (bvand lt!195236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195240 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195236 lt!195240) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40172 (= lt!195240 (remainingBits!0 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194286)))) ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!194286))) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!194286)))))))

(declare-fun lt!195238 () (_ BitVec 64))

(declare-fun lt!195239 () (_ BitVec 64))

(assert (=> d!40172 (= lt!195236 (bvmul lt!195238 lt!195239))))

(assert (=> d!40172 (or (= lt!195238 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195239 (bvsdiv (bvmul lt!195238 lt!195239) lt!195238)))))

(assert (=> d!40172 (= lt!195239 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40172 (= lt!195238 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194286)))))))

(assert (=> d!40172 (= lt!195235 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5597 (_2!5467 lt!194286))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5592 (_2!5467 lt!194286)))))))

(assert (=> d!40172 (invariant!0 (currentBit!5592 (_2!5467 lt!194286)) (currentByte!5597 (_2!5467 lt!194286)) (size!2460 (buf!2900 (_2!5467 lt!194286))))))

(assert (=> d!40172 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5467 lt!194286))) (currentByte!5597 (_2!5467 lt!194286)) (currentBit!5592 (_2!5467 lt!194286))) lt!195235)))

(declare-fun b!123668 () Bool)

(declare-fun res!102517 () Bool)

(assert (=> b!123668 (=> (not res!102517) (not e!81061))))

(assert (=> b!123668 (= res!102517 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195235))))

(declare-fun b!123669 () Bool)

(declare-fun lt!195237 () (_ BitVec 64))

(assert (=> b!123669 (= e!81061 (bvsle lt!195235 (bvmul lt!195237 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123669 (or (= lt!195237 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195237 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195237)))))

(assert (=> b!123669 (= lt!195237 ((_ sign_extend 32) (size!2460 (buf!2900 (_2!5467 lt!194286)))))))

(assert (= (and d!40172 res!102518) b!123668))

(assert (= (and b!123668 res!102517) b!123669))

(declare-fun m!188585 () Bool)

(assert (=> d!40172 m!188585))

(declare-fun m!188587 () Bool)

(assert (=> d!40172 m!188587))

(assert (=> b!123129 d!40172))

(assert (=> b!123129 d!39546))

(assert (=> d!39652 d!40118))

(declare-fun b!123670 () Bool)

(declare-fun e!81062 () Bool)

(declare-fun e!81063 () Bool)

(assert (=> b!123670 (= e!81062 e!81063)))

(declare-fun res!102520 () Bool)

(assert (=> b!123670 (=> res!102520 e!81063)))

(assert (=> b!123670 (= res!102520 (bvsge (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(declare-fun lt!195241 () (_ BitVec 64))

(declare-fun lt!195245 () tuple2!10412)

(declare-fun b!123671 () Bool)

(assert (=> b!123671 (= e!81063 (= (= (bvand (bvlshr (_1!5471 lt!195245) lt!195241) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!5468 (readBitPure!0 (_1!5466 lt!193391)))))))

(assert (=> b!123671 (and (bvsge lt!195241 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!195241 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!195243 () (_ BitVec 32))

(assert (=> b!123671 (= lt!195241 ((_ sign_extend 32) (bvsub lt!195243 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123671 (or (= (bvand lt!195243 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand lt!195243 #b10000000000000000000000000000000) (bvand (bvsub lt!195243 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123671 (= lt!195243 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!123671 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!123672 () Bool)

(declare-fun res!102519 () Bool)

(assert (=> b!123672 (=> (not res!102519) (not e!81062))))

(declare-fun lt!195244 () (_ BitVec 64))

(declare-fun lt!195249 () (_ BitVec 64))

(assert (=> b!123672 (= res!102519 (= (bvlshr (_1!5471 lt!195245) lt!195244) (bvlshr lt!193383 lt!195249)))))

(assert (=> b!123672 (and (bvsge lt!195249 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!195249 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!123672 (= lt!195249 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123672 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123672 (and (bvsge lt!195244 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!195244 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!123672 (= lt!195244 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123672 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(declare-fun b!123673 () Bool)

(declare-fun e!81064 () tuple2!10412)

(declare-fun lt!195246 () tuple2!10412)

(assert (=> b!123673 (= e!81064 (tuple2!10413 (_1!5471 lt!195246) (_2!5471 lt!195246)))))

(declare-fun lt!195247 () tuple2!10418)

(assert (=> b!123673 (= lt!195247 (readBit!0 (_1!5466 lt!193391)))))

(assert (=> b!123673 (= lt!195246 (readNLeastSignificantBitsLoop!0 (_2!5474 lt!195247) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!193383 (ite (_1!5474 lt!195247) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!123674 () Bool)

(declare-fun res!102521 () Bool)

(assert (=> b!123674 (=> (not res!102521) (not e!81062))))

(declare-fun lt!195242 () (_ BitVec 64))

(declare-fun lt!195248 () (_ BitVec 64))

(assert (=> b!123674 (= res!102521 (= (bitIndex!0 (size!2460 (buf!2900 (_2!5471 lt!195245))) (currentByte!5597 (_2!5471 lt!195245)) (currentBit!5592 (_2!5471 lt!195245))) (bvadd lt!195242 lt!195248)))))

(assert (=> b!123674 (or (not (= (bvand lt!195242 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195248 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195242 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195242 lt!195248) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123674 (= lt!195248 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123674 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123674 (= lt!195242 (bitIndex!0 (size!2460 (buf!2900 (_1!5466 lt!193391))) (currentByte!5597 (_1!5466 lt!193391)) (currentBit!5592 (_1!5466 lt!193391))))))

(declare-fun b!123675 () Bool)

(assert (=> b!123675 (= e!81064 (tuple2!10413 lt!193383 (_1!5466 lt!193391)))))

(declare-fun d!40174 () Bool)

(assert (=> d!40174 e!81062))

(declare-fun res!102522 () Bool)

(assert (=> d!40174 (=> (not res!102522) (not e!81062))))

(assert (=> d!40174 (= res!102522 (= (buf!2900 (_2!5471 lt!195245)) (buf!2900 (_1!5466 lt!193391))))))

(assert (=> d!40174 (= lt!195245 e!81064)))

(declare-fun c!7398 () Bool)

(assert (=> d!40174 (= c!7398 (= nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> d!40174 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!40174 (= (readNLeastSignificantBitsLoop!0 (_1!5466 lt!193391) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193383) lt!195245)))

(declare-fun b!123676 () Bool)

(declare-fun res!102523 () Bool)

(assert (=> b!123676 (=> (not res!102523) (not e!81062))))

(assert (=> b!123676 (= res!102523 (= (bvand (_1!5471 lt!195245) (onesLSBLong!0 nBits!396)) (_1!5471 lt!195245)))))

(assert (= (and d!40174 c!7398) b!123675))

(assert (= (and d!40174 (not c!7398)) b!123673))

(assert (= (and d!40174 res!102522) b!123674))

(assert (= (and b!123674 res!102521) b!123672))

(assert (= (and b!123672 res!102519) b!123676))

(assert (= (and b!123676 res!102523) b!123670))

(assert (= (and b!123670 (not res!102520)) b!123671))

(declare-fun m!188589 () Bool)

(assert (=> b!123671 m!188589))

(declare-fun m!188591 () Bool)

(assert (=> b!123673 m!188591))

(declare-fun m!188593 () Bool)

(assert (=> b!123673 m!188593))

(declare-fun m!188595 () Bool)

(assert (=> b!123674 m!188595))

(declare-fun m!188597 () Bool)

(assert (=> b!123674 m!188597))

(assert (=> b!123676 m!186639))

(assert (=> d!39586 d!40174))

(push 1)

(assert (not b!123486))

(assert (not d!40086))

(assert (not d!40032))

(assert (not d!40162))

(assert (not b!123492))

(assert (not b!123436))

(assert (not b!123671))

(assert (not b!123523))

(assert (not b!123522))

(assert (not d!40046))

(assert (not b!123577))

(assert (not b!123517))

(assert (not b!123624))

(assert (not b!123561))

(assert (not d!39954))

(assert (not d!40106))

(assert (not b!123479))

(assert (not b!123587))

(assert (not b!123620))

(assert (not b!123648))

(assert (not b!123649))

(assert (not b!123667))

(assert (not b!123653))

(assert (not d!40080))

(assert (not b!123575))

(assert (not b!123487))

(assert (not d!39976))

(assert (not b!123603))

(assert (not d!40018))

(assert (not d!39948))

(assert (not d!40056))

(assert (not d!40012))

(assert (not b!123437))

(assert (not b!123566))

(assert (not d!40020))

(assert (not d!40172))

(assert (not b!123563))

(assert (not d!39980))

(assert (not b!123493))

(assert (not b!123503))

(assert (not d!40044))

(assert (not d!40082))

(assert (not b!123544))

(assert (not b!123555))

(assert (not b!123490))

(assert (not d!40128))

(assert (not b!123617))

(assert (not b!123647))

(assert (not d!39950))

(assert (not d!39964))

(assert (not b!123461))

(assert (not b!123658))

(assert (not d!40062))

(assert (not d!40114))

(assert (not b!123656))

(assert (not b!123459))

(assert (not d!40052))

(assert (not b!123531))

(assert (not d!40158))

(assert (not d!40094))

(assert (not d!40102))

(assert (not b!123524))

(assert (not d!39978))

(assert (not b!123569))

(assert (not d!40040))

(assert (not d!40042))

(assert (not d!40034))

(assert (not b!123511))

(assert (not b!123621))

(assert (not b!123660))

(assert (not b!123536))

(assert (not b!123606))

(assert (not d!40068))

(assert (not b!123627))

(assert (not b!123659))

(assert (not d!40100))

(assert (not b!123505))

(assert (not b!123499))

(assert (not b!123533))

(assert (not d!39944))

(assert (not bm!1614))

(assert (not b!123615))

(assert (not d!40024))

(assert (not b!123519))

(assert (not b!123596))

(assert (not d!39946))

(assert (not b!123498))

(assert (not b!123518))

(assert (not d!39938))

(assert (not b!123535))

(assert (not b!123573))

(assert (not d!39974))

(assert (not d!40002))

(assert (not b!123501))

(assert (not b!123507))

(assert (not d!39932))

(assert (not b!123676))

(assert (not bm!1618))

(assert (not d!40054))

(assert (not b!123496))

(assert (not b!123665))

(assert (not bm!1617))

(assert (not b!123462))

(assert (not b!123630))

(assert (not b!123572))

(assert (not b!123570))

(assert (not d!40098))

(assert (not b!123485))

(assert (not b!123464))

(assert (not d!40166))

(assert (not d!40014))

(assert (not b!123610))

(assert (not d!40142))

(assert (not b!123622))

(assert (not d!40016))

(assert (not b!123537))

(assert (not d!39936))

(assert (not b!123567))

(assert (not b!123564))

(assert (not b!123594))

(assert (not b!123580))

(assert (not d!39930))

(assert (not d!39968))

(assert (not d!40160))

(assert (not b!123513))

(assert (not d!40006))

(assert (not d!40066))

(assert (not d!40022))

(assert (not d!40036))

(assert (not d!40138))

(assert (not b!123534))

(assert (not b!123516))

(assert (not b!123673))

(assert (not bm!1615))

(assert (not d!40152))

(assert (not b!123495))

(assert (not b!123483))

(assert (not d!40130))

(assert (not b!123508))

(assert (not b!123645))

(assert (not d!40038))

(assert (not d!39986))

(assert (not d!40108))

(assert (not d!40154))

(assert (not b!123438))

(assert (not b!123625))

(assert (not b!123502))

(assert (not d!40010))

(assert (not b!123612))

(assert (not b!123489))

(assert (not b!123546))

(assert (not d!40030))

(assert (not b!123674))

(assert (not b!123644))

(assert (not b!123439))

(assert (not d!39942))

(assert (not d!40008))

(assert (not bm!1616))

(assert (not d!40156))

(assert (not d!39996))

(assert (not b!123589))

(assert (not d!39972))

(assert (not d!39962))

(assert (not b!123435))

(assert (not b!123504))

(assert (not d!40140))

(assert (not b!123579))

(assert (not d!39988))

(assert (not b!123583))

(assert (not b!123560))

(assert (not b!123646))

(assert (not d!39934))

(assert (not b!123521))

(assert (not d!40076))

(assert (not b!123509))

(assert (not b!123582))

(assert (not b!123628))

(assert (not d!40004))

(assert (not b!123655))

(assert (not b!123605))

(assert (not d!40048))

(assert (not d!40126))

(check-sat)

(pop 1)

(push 1)

(check-sat)

