; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24038 () Bool)

(assert start!24038)

(declare-fun b!121653 () Bool)

(declare-fun e!79685 () Bool)

(declare-fun e!79683 () Bool)

(assert (=> b!121653 (= e!79685 e!79683)))

(declare-fun res!100778 () Bool)

(assert (=> b!121653 (=> (not res!100778) (not e!79683))))

(declare-datatypes ((array!5393 0))(
  ( (array!5394 (arr!3033 (Array (_ BitVec 32) (_ BitVec 8))) (size!2440 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4354 0))(
  ( (BitStream!4355 (buf!2877 array!5393) (currentByte!5568 (_ BitVec 32)) (currentBit!5563 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4354)

(declare-fun lt!190657 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!121653 (= res!100778 (validate_offset_bits!1 ((_ sign_extend 32) (size!2440 (buf!2877 thiss!1305))) ((_ sign_extend 32) (currentByte!5568 thiss!1305)) ((_ sign_extend 32) (currentBit!5563 thiss!1305)) lt!190657))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!121653 (= lt!190657 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!100769 () Bool)

(assert (=> start!24038 (=> (not res!100769) (not e!79685))))

(assert (=> start!24038 (= res!100769 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24038 e!79685))

(assert (=> start!24038 true))

(declare-fun e!79689 () Bool)

(declare-fun inv!12 (BitStream!4354) Bool)

(assert (=> start!24038 (and (inv!12 thiss!1305) e!79689)))

(declare-fun b!121654 () Bool)

(declare-fun res!100775 () Bool)

(assert (=> b!121654 (=> (not res!100775) (not e!79683))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!121654 (= res!100775 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!121655 () Bool)

(declare-fun e!79686 () Bool)

(declare-fun e!79691 () Bool)

(assert (=> b!121655 (= e!79686 e!79691)))

(declare-fun res!100771 () Bool)

(assert (=> b!121655 (=> (not res!100771) (not e!79691))))

(declare-datatypes ((Unit!7495 0))(
  ( (Unit!7496) )
))
(declare-datatypes ((tuple2!10228 0))(
  ( (tuple2!10229 (_1!5379 Unit!7495) (_2!5379 BitStream!4354)) )
))
(declare-fun lt!190643 () tuple2!10228)

(declare-fun lt!190668 () Bool)

(declare-datatypes ((tuple2!10230 0))(
  ( (tuple2!10231 (_1!5380 BitStream!4354) (_2!5380 Bool)) )
))
(declare-fun lt!190653 () tuple2!10230)

(assert (=> b!121655 (= res!100771 (and (= (_2!5380 lt!190653) lt!190668) (= (_1!5380 lt!190653) (_2!5379 lt!190643))))))

(declare-fun readBitPure!0 (BitStream!4354) tuple2!10230)

(declare-fun readerFrom!0 (BitStream!4354 (_ BitVec 32) (_ BitVec 32)) BitStream!4354)

(assert (=> b!121655 (= lt!190653 (readBitPure!0 (readerFrom!0 (_2!5379 lt!190643) (currentBit!5563 thiss!1305) (currentByte!5568 thiss!1305))))))

(declare-fun b!121656 () Bool)

(declare-datatypes ((tuple2!10232 0))(
  ( (tuple2!10233 (_1!5381 BitStream!4354) (_2!5381 BitStream!4354)) )
))
(declare-fun lt!190646 () tuple2!10232)

(declare-fun lt!190649 () (_ BitVec 64))

(declare-fun e!79684 () Bool)

(declare-fun lt!190647 () BitStream!4354)

(declare-fun lt!190664 () tuple2!10228)

(assert (=> b!121656 (= e!79684 (or (not (= (_1!5381 lt!190646) lt!190647)) (not (= (size!2440 (buf!2877 thiss!1305)) (size!2440 (buf!2877 (_2!5379 lt!190664))))) (let ((bdg!6310 (bvand lt!190649 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (not (= bdg!6310 (bvand lt!190657 #b1000000000000000000000000000000000000000000000000000000000000000))) (= bdg!6310 (bvand (bvadd lt!190649 lt!190657) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!79682 () Bool)

(assert (=> b!121656 e!79682))

(declare-fun res!100768 () Bool)

(assert (=> b!121656 (=> (not res!100768) (not e!79682))))

(declare-fun lt!190656 () (_ BitVec 64))

(declare-fun lt!190662 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4354 (_ BitVec 64)) BitStream!4354)

(assert (=> b!121656 (= res!100768 (= (_1!5381 lt!190646) (withMovedBitIndex!0 (_2!5381 lt!190646) (bvsub lt!190656 lt!190662))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!121656 (= lt!190656 (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!190643))) (currentByte!5568 (_2!5379 lt!190643)) (currentBit!5563 (_2!5379 lt!190643))))))

(declare-fun lt!190667 () tuple2!10232)

(assert (=> b!121656 (= (_1!5381 lt!190667) (withMovedBitIndex!0 (_2!5381 lt!190667) (bvsub lt!190649 lt!190662)))))

(assert (=> b!121656 (= lt!190662 (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!190664))) (currentByte!5568 (_2!5379 lt!190664)) (currentBit!5563 (_2!5379 lt!190664))))))

(assert (=> b!121656 (= lt!190649 (bitIndex!0 (size!2440 (buf!2877 thiss!1305)) (currentByte!5568 thiss!1305) (currentBit!5563 thiss!1305)))))

(declare-datatypes ((tuple2!10234 0))(
  ( (tuple2!10235 (_1!5382 BitStream!4354) (_2!5382 (_ BitVec 64))) )
))
(declare-fun lt!190644 () tuple2!10234)

(declare-fun lt!190666 () tuple2!10234)

(assert (=> b!121656 (and (= (_2!5382 lt!190644) (_2!5382 lt!190666)) (= (_1!5382 lt!190644) (_1!5382 lt!190666)))))

(declare-fun lt!190669 () Unit!7495)

(declare-fun lt!190658 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4354 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7495)

(assert (=> b!121656 (= lt!190669 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5381 lt!190667) nBits!396 i!615 lt!190658))))

(declare-fun lt!190651 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4354 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10234)

(assert (=> b!121656 (= lt!190666 (readNLeastSignificantBitsLoopPure!0 lt!190647 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190651))))

(assert (=> b!121656 (= lt!190647 (withMovedBitIndex!0 (_1!5381 lt!190667) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!121657 () Bool)

(declare-fun e!79688 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!121657 (= e!79688 (invariant!0 (currentBit!5563 thiss!1305) (currentByte!5568 thiss!1305) (size!2440 (buf!2877 (_2!5379 lt!190664)))))))

(declare-fun b!121658 () Bool)

(declare-fun e!79690 () Bool)

(assert (=> b!121658 (= e!79690 e!79686)))

(declare-fun res!100777 () Bool)

(assert (=> b!121658 (=> (not res!100777) (not e!79686))))

(declare-fun lt!190665 () (_ BitVec 64))

(declare-fun lt!190659 () (_ BitVec 64))

(assert (=> b!121658 (= res!100777 (= lt!190665 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!190659)))))

(assert (=> b!121658 (= lt!190665 (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!190643))) (currentByte!5568 (_2!5379 lt!190643)) (currentBit!5563 (_2!5379 lt!190643))))))

(assert (=> b!121658 (= lt!190659 (bitIndex!0 (size!2440 (buf!2877 thiss!1305)) (currentByte!5568 thiss!1305) (currentBit!5563 thiss!1305)))))

(declare-fun b!121659 () Bool)

(declare-fun res!100774 () Bool)

(assert (=> b!121659 (=> (not res!100774) (not e!79688))))

(assert (=> b!121659 (= res!100774 (invariant!0 (currentBit!5563 thiss!1305) (currentByte!5568 thiss!1305) (size!2440 (buf!2877 (_2!5379 lt!190643)))))))

(declare-fun b!121660 () Bool)

(declare-fun res!100767 () Bool)

(assert (=> b!121660 (=> (not res!100767) (not e!79683))))

(assert (=> b!121660 (= res!100767 (bvslt i!615 nBits!396))))

(declare-fun b!121661 () Bool)

(declare-fun lt!190671 () tuple2!10234)

(assert (=> b!121661 (= e!79682 (and (= lt!190649 (bvsub lt!190656 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5381 lt!190646) lt!190647)) (and (= (_2!5382 lt!190644) (_2!5382 lt!190671)) (= (_1!5382 lt!190644) (_2!5381 lt!190667))))))))

(declare-fun b!121662 () Bool)

(assert (=> b!121662 (= e!79691 (= (bitIndex!0 (size!2440 (buf!2877 (_1!5380 lt!190653))) (currentByte!5568 (_1!5380 lt!190653)) (currentBit!5563 (_1!5380 lt!190653))) lt!190665))))

(declare-fun b!121663 () Bool)

(declare-fun e!79687 () Bool)

(declare-fun lt!190650 () tuple2!10230)

(declare-fun lt!190654 () tuple2!10230)

(assert (=> b!121663 (= e!79687 (= (_2!5380 lt!190650) (_2!5380 lt!190654)))))

(declare-fun b!121664 () Bool)

(assert (=> b!121664 (= e!79683 (not e!79684))))

(declare-fun res!100779 () Bool)

(assert (=> b!121664 (=> res!100779 e!79684)))

(assert (=> b!121664 (= res!100779 (not (= (_1!5382 lt!190671) (_2!5381 lt!190646))))))

(assert (=> b!121664 (= lt!190671 (readNLeastSignificantBitsLoopPure!0 (_1!5381 lt!190646) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190651))))

(declare-fun lt!190663 () (_ BitVec 64))

(assert (=> b!121664 (validate_offset_bits!1 ((_ sign_extend 32) (size!2440 (buf!2877 (_2!5379 lt!190664)))) ((_ sign_extend 32) (currentByte!5568 (_2!5379 lt!190643))) ((_ sign_extend 32) (currentBit!5563 (_2!5379 lt!190643))) lt!190663)))

(declare-fun lt!190661 () Unit!7495)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4354 array!5393 (_ BitVec 64)) Unit!7495)

(assert (=> b!121664 (= lt!190661 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5379 lt!190643) (buf!2877 (_2!5379 lt!190664)) lt!190663))))

(assert (=> b!121664 (= lt!190663 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!190670 () tuple2!10230)

(declare-fun lt!190660 () (_ BitVec 64))

(assert (=> b!121664 (= lt!190651 (bvor lt!190658 (ite (_2!5380 lt!190670) lt!190660 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121664 (= lt!190644 (readNLeastSignificantBitsLoopPure!0 (_1!5381 lt!190667) nBits!396 i!615 lt!190658))))

(assert (=> b!121664 (validate_offset_bits!1 ((_ sign_extend 32) (size!2440 (buf!2877 (_2!5379 lt!190664)))) ((_ sign_extend 32) (currentByte!5568 thiss!1305)) ((_ sign_extend 32) (currentBit!5563 thiss!1305)) lt!190657)))

(declare-fun lt!190652 () Unit!7495)

(assert (=> b!121664 (= lt!190652 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2877 (_2!5379 lt!190664)) lt!190657))))

(assert (=> b!121664 (= lt!190658 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!121664 (= (_2!5380 lt!190670) lt!190668)))

(assert (=> b!121664 (= lt!190670 (readBitPure!0 (_1!5381 lt!190667)))))

(declare-fun reader!0 (BitStream!4354 BitStream!4354) tuple2!10232)

(assert (=> b!121664 (= lt!190646 (reader!0 (_2!5379 lt!190643) (_2!5379 lt!190664)))))

(assert (=> b!121664 (= lt!190667 (reader!0 thiss!1305 (_2!5379 lt!190664)))))

(assert (=> b!121664 e!79687))

(declare-fun res!100772 () Bool)

(assert (=> b!121664 (=> (not res!100772) (not e!79687))))

(assert (=> b!121664 (= res!100772 (= (bitIndex!0 (size!2440 (buf!2877 (_1!5380 lt!190650))) (currentByte!5568 (_1!5380 lt!190650)) (currentBit!5563 (_1!5380 lt!190650))) (bitIndex!0 (size!2440 (buf!2877 (_1!5380 lt!190654))) (currentByte!5568 (_1!5380 lt!190654)) (currentBit!5563 (_1!5380 lt!190654)))))))

(declare-fun lt!190645 () Unit!7495)

(declare-fun lt!190655 () BitStream!4354)

(declare-fun readBitPrefixLemma!0 (BitStream!4354 BitStream!4354) Unit!7495)

(assert (=> b!121664 (= lt!190645 (readBitPrefixLemma!0 lt!190655 (_2!5379 lt!190664)))))

(assert (=> b!121664 (= lt!190654 (readBitPure!0 (BitStream!4355 (buf!2877 (_2!5379 lt!190664)) (currentByte!5568 thiss!1305) (currentBit!5563 thiss!1305))))))

(assert (=> b!121664 (= lt!190650 (readBitPure!0 lt!190655))))

(assert (=> b!121664 (= lt!190655 (BitStream!4355 (buf!2877 (_2!5379 lt!190643)) (currentByte!5568 thiss!1305) (currentBit!5563 thiss!1305)))))

(assert (=> b!121664 e!79688))

(declare-fun res!100776 () Bool)

(assert (=> b!121664 (=> (not res!100776) (not e!79688))))

(declare-fun isPrefixOf!0 (BitStream!4354 BitStream!4354) Bool)

(assert (=> b!121664 (= res!100776 (isPrefixOf!0 thiss!1305 (_2!5379 lt!190664)))))

(declare-fun lt!190648 () Unit!7495)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4354 BitStream!4354 BitStream!4354) Unit!7495)

(assert (=> b!121664 (= lt!190648 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5379 lt!190643) (_2!5379 lt!190664)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4354 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10228)

(assert (=> b!121664 (= lt!190664 (appendNLeastSignificantBitsLoop!0 (_2!5379 lt!190643) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!121664 e!79690))

(declare-fun res!100770 () Bool)

(assert (=> b!121664 (=> (not res!100770) (not e!79690))))

(assert (=> b!121664 (= res!100770 (= (size!2440 (buf!2877 thiss!1305)) (size!2440 (buf!2877 (_2!5379 lt!190643)))))))

(declare-fun appendBit!0 (BitStream!4354 Bool) tuple2!10228)

(assert (=> b!121664 (= lt!190643 (appendBit!0 thiss!1305 lt!190668))))

(assert (=> b!121664 (= lt!190668 (not (= (bvand v!199 lt!190660) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121664 (= lt!190660 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!121665 () Bool)

(declare-fun res!100773 () Bool)

(assert (=> b!121665 (=> (not res!100773) (not e!79686))))

(assert (=> b!121665 (= res!100773 (isPrefixOf!0 thiss!1305 (_2!5379 lt!190643)))))

(declare-fun b!121666 () Bool)

(declare-fun array_inv!2242 (array!5393) Bool)

(assert (=> b!121666 (= e!79689 (array_inv!2242 (buf!2877 thiss!1305)))))

(assert (= (and start!24038 res!100769) b!121653))

(assert (= (and b!121653 res!100778) b!121654))

(assert (= (and b!121654 res!100775) b!121660))

(assert (= (and b!121660 res!100767) b!121664))

(assert (= (and b!121664 res!100770) b!121658))

(assert (= (and b!121658 res!100777) b!121665))

(assert (= (and b!121665 res!100773) b!121655))

(assert (= (and b!121655 res!100771) b!121662))

(assert (= (and b!121664 res!100776) b!121659))

(assert (= (and b!121659 res!100774) b!121657))

(assert (= (and b!121664 res!100772) b!121663))

(assert (= (and b!121664 (not res!100779)) b!121656))

(assert (= (and b!121656 res!100768) b!121661))

(assert (= start!24038 b!121666))

(declare-fun m!184427 () Bool)

(assert (=> b!121653 m!184427))

(declare-fun m!184429 () Bool)

(assert (=> b!121654 m!184429))

(declare-fun m!184431 () Bool)

(assert (=> b!121664 m!184431))

(declare-fun m!184433 () Bool)

(assert (=> b!121664 m!184433))

(declare-fun m!184435 () Bool)

(assert (=> b!121664 m!184435))

(declare-fun m!184437 () Bool)

(assert (=> b!121664 m!184437))

(declare-fun m!184439 () Bool)

(assert (=> b!121664 m!184439))

(declare-fun m!184441 () Bool)

(assert (=> b!121664 m!184441))

(declare-fun m!184443 () Bool)

(assert (=> b!121664 m!184443))

(declare-fun m!184445 () Bool)

(assert (=> b!121664 m!184445))

(declare-fun m!184447 () Bool)

(assert (=> b!121664 m!184447))

(declare-fun m!184449 () Bool)

(assert (=> b!121664 m!184449))

(declare-fun m!184451 () Bool)

(assert (=> b!121664 m!184451))

(declare-fun m!184453 () Bool)

(assert (=> b!121664 m!184453))

(declare-fun m!184455 () Bool)

(assert (=> b!121664 m!184455))

(declare-fun m!184457 () Bool)

(assert (=> b!121664 m!184457))

(declare-fun m!184459 () Bool)

(assert (=> b!121664 m!184459))

(declare-fun m!184461 () Bool)

(assert (=> b!121664 m!184461))

(declare-fun m!184463 () Bool)

(assert (=> b!121664 m!184463))

(declare-fun m!184465 () Bool)

(assert (=> b!121664 m!184465))

(declare-fun m!184467 () Bool)

(assert (=> b!121664 m!184467))

(declare-fun m!184469 () Bool)

(assert (=> b!121656 m!184469))

(declare-fun m!184471 () Bool)

(assert (=> b!121656 m!184471))

(declare-fun m!184473 () Bool)

(assert (=> b!121656 m!184473))

(declare-fun m!184475 () Bool)

(assert (=> b!121656 m!184475))

(declare-fun m!184477 () Bool)

(assert (=> b!121656 m!184477))

(declare-fun m!184479 () Bool)

(assert (=> b!121656 m!184479))

(declare-fun m!184481 () Bool)

(assert (=> b!121656 m!184481))

(declare-fun m!184483 () Bool)

(assert (=> b!121656 m!184483))

(declare-fun m!184485 () Bool)

(assert (=> b!121665 m!184485))

(declare-fun m!184487 () Bool)

(assert (=> b!121655 m!184487))

(assert (=> b!121655 m!184487))

(declare-fun m!184489 () Bool)

(assert (=> b!121655 m!184489))

(declare-fun m!184491 () Bool)

(assert (=> b!121662 m!184491))

(declare-fun m!184493 () Bool)

(assert (=> start!24038 m!184493))

(declare-fun m!184495 () Bool)

(assert (=> b!121666 m!184495))

(assert (=> b!121658 m!184475))

(assert (=> b!121658 m!184471))

(declare-fun m!184497 () Bool)

(assert (=> b!121659 m!184497))

(declare-fun m!184499 () Bool)

(assert (=> b!121657 m!184499))

(push 1)

(assert (not b!121662))

(assert (not b!121655))

(assert (not start!24038))

(assert (not b!121656))

(assert (not b!121659))

(assert (not b!121665))

(assert (not b!121657))

(assert (not b!121653))

(assert (not b!121666))

(assert (not b!121654))

(assert (not b!121658))

(assert (not b!121664))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!39254 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!39254 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2440 (buf!2877 thiss!1305))) ((_ sign_extend 32) (currentByte!5568 thiss!1305)) ((_ sign_extend 32) (currentBit!5563 thiss!1305)) lt!190657) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2440 (buf!2877 thiss!1305))) ((_ sign_extend 32) (currentByte!5568 thiss!1305)) ((_ sign_extend 32) (currentBit!5563 thiss!1305))) lt!190657))))

(declare-fun bs!9496 () Bool)

(assert (= bs!9496 d!39254))

(declare-fun m!184695 () Bool)

(assert (=> bs!9496 m!184695))

(assert (=> b!121653 d!39254))

(declare-fun d!39256 () Bool)

(declare-fun e!79779 () Bool)

(assert (=> d!39256 e!79779))

(declare-fun res!100891 () Bool)

(assert (=> d!39256 (=> (not res!100891) (not e!79779))))

(declare-fun lt!190941 () (_ BitVec 64))

(declare-fun lt!190942 () (_ BitVec 64))

(declare-fun lt!190943 () (_ BitVec 64))

(assert (=> d!39256 (= res!100891 (= lt!190942 (bvsub lt!190943 lt!190941)))))

(assert (=> d!39256 (or (= (bvand lt!190943 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!190941 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!190943 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!190943 lt!190941) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39256 (= lt!190941 (remainingBits!0 ((_ sign_extend 32) (size!2440 (buf!2877 (_1!5380 lt!190653)))) ((_ sign_extend 32) (currentByte!5568 (_1!5380 lt!190653))) ((_ sign_extend 32) (currentBit!5563 (_1!5380 lt!190653)))))))

(declare-fun lt!190944 () (_ BitVec 64))

(declare-fun lt!190940 () (_ BitVec 64))

(assert (=> d!39256 (= lt!190943 (bvmul lt!190944 lt!190940))))

(assert (=> d!39256 (or (= lt!190944 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!190940 (bvsdiv (bvmul lt!190944 lt!190940) lt!190944)))))

(assert (=> d!39256 (= lt!190940 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39256 (= lt!190944 ((_ sign_extend 32) (size!2440 (buf!2877 (_1!5380 lt!190653)))))))

(assert (=> d!39256 (= lt!190942 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5568 (_1!5380 lt!190653))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5563 (_1!5380 lt!190653)))))))

(assert (=> d!39256 (invariant!0 (currentBit!5563 (_1!5380 lt!190653)) (currentByte!5568 (_1!5380 lt!190653)) (size!2440 (buf!2877 (_1!5380 lt!190653))))))

(assert (=> d!39256 (= (bitIndex!0 (size!2440 (buf!2877 (_1!5380 lt!190653))) (currentByte!5568 (_1!5380 lt!190653)) (currentBit!5563 (_1!5380 lt!190653))) lt!190942)))

(declare-fun b!121788 () Bool)

(declare-fun res!100890 () Bool)

(assert (=> b!121788 (=> (not res!100890) (not e!79779))))

(assert (=> b!121788 (= res!100890 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!190942))))

(declare-fun b!121789 () Bool)

(declare-fun lt!190939 () (_ BitVec 64))

(assert (=> b!121789 (= e!79779 (bvsle lt!190942 (bvmul lt!190939 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121789 (or (= lt!190939 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!190939 #b0000000000000000000000000000000000000000000000000000000000001000) lt!190939)))))

(assert (=> b!121789 (= lt!190939 ((_ sign_extend 32) (size!2440 (buf!2877 (_1!5380 lt!190653)))))))

(assert (= (and d!39256 res!100891) b!121788))

(assert (= (and b!121788 res!100890) b!121789))

(declare-fun m!184701 () Bool)

(assert (=> d!39256 m!184701))

(declare-fun m!184703 () Bool)

(assert (=> d!39256 m!184703))

(assert (=> b!121662 d!39256))

(declare-fun d!39262 () Bool)

(declare-datatypes ((tuple2!10256 0))(
  ( (tuple2!10257 (_1!5393 Bool) (_2!5393 BitStream!4354)) )
))
(declare-fun lt!190947 () tuple2!10256)

(declare-fun readBit!0 (BitStream!4354) tuple2!10256)

(assert (=> d!39262 (= lt!190947 (readBit!0 (readerFrom!0 (_2!5379 lt!190643) (currentBit!5563 thiss!1305) (currentByte!5568 thiss!1305))))))

(assert (=> d!39262 (= (readBitPure!0 (readerFrom!0 (_2!5379 lt!190643) (currentBit!5563 thiss!1305) (currentByte!5568 thiss!1305))) (tuple2!10231 (_2!5393 lt!190947) (_1!5393 lt!190947)))))

(declare-fun bs!9497 () Bool)

(assert (= bs!9497 d!39262))

(assert (=> bs!9497 m!184487))

(declare-fun m!184705 () Bool)

(assert (=> bs!9497 m!184705))

(assert (=> b!121655 d!39262))

(declare-fun d!39264 () Bool)

(declare-fun e!79782 () Bool)

(assert (=> d!39264 e!79782))

(declare-fun res!100895 () Bool)

(assert (=> d!39264 (=> (not res!100895) (not e!79782))))

(assert (=> d!39264 (= res!100895 (invariant!0 (currentBit!5563 (_2!5379 lt!190643)) (currentByte!5568 (_2!5379 lt!190643)) (size!2440 (buf!2877 (_2!5379 lt!190643)))))))

(assert (=> d!39264 (= (readerFrom!0 (_2!5379 lt!190643) (currentBit!5563 thiss!1305) (currentByte!5568 thiss!1305)) (BitStream!4355 (buf!2877 (_2!5379 lt!190643)) (currentByte!5568 thiss!1305) (currentBit!5563 thiss!1305)))))

(declare-fun b!121792 () Bool)

(assert (=> b!121792 (= e!79782 (invariant!0 (currentBit!5563 thiss!1305) (currentByte!5568 thiss!1305) (size!2440 (buf!2877 (_2!5379 lt!190643)))))))

(assert (= (and d!39264 res!100895) b!121792))

(declare-fun m!184707 () Bool)

(assert (=> d!39264 m!184707))

(assert (=> b!121792 m!184497))

(assert (=> b!121655 d!39264))

(declare-fun d!39266 () Bool)

(assert (=> d!39266 (= (array_inv!2242 (buf!2877 thiss!1305)) (bvsge (size!2440 (buf!2877 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!121666 d!39266))

(declare-fun d!39268 () Bool)

(assert (=> d!39268 (validate_offset_bits!1 ((_ sign_extend 32) (size!2440 (buf!2877 (_2!5379 lt!190664)))) ((_ sign_extend 32) (currentByte!5568 thiss!1305)) ((_ sign_extend 32) (currentBit!5563 thiss!1305)) lt!190657)))

(declare-fun lt!190962 () Unit!7495)

(declare-fun choose!9 (BitStream!4354 array!5393 (_ BitVec 64) BitStream!4354) Unit!7495)

(assert (=> d!39268 (= lt!190962 (choose!9 thiss!1305 (buf!2877 (_2!5379 lt!190664)) lt!190657 (BitStream!4355 (buf!2877 (_2!5379 lt!190664)) (currentByte!5568 thiss!1305) (currentBit!5563 thiss!1305))))))

(assert (=> d!39268 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2877 (_2!5379 lt!190664)) lt!190657) lt!190962)))

(declare-fun bs!9498 () Bool)

(assert (= bs!9498 d!39268))

(assert (=> bs!9498 m!184455))

(declare-fun m!184709 () Bool)

(assert (=> bs!9498 m!184709))

(assert (=> b!121664 d!39268))

(declare-fun d!39270 () Bool)

(assert (=> d!39270 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2440 (buf!2877 (_2!5379 lt!190664)))) ((_ sign_extend 32) (currentByte!5568 thiss!1305)) ((_ sign_extend 32) (currentBit!5563 thiss!1305)) lt!190657) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2440 (buf!2877 (_2!5379 lt!190664)))) ((_ sign_extend 32) (currentByte!5568 thiss!1305)) ((_ sign_extend 32) (currentBit!5563 thiss!1305))) lt!190657))))

(declare-fun bs!9499 () Bool)

(assert (= bs!9499 d!39270))

(declare-fun m!184711 () Bool)

(assert (=> bs!9499 m!184711))

(assert (=> b!121664 d!39270))

(declare-fun d!39272 () Bool)

(declare-fun lt!190963 () tuple2!10256)

(assert (=> d!39272 (= lt!190963 (readBit!0 (_1!5381 lt!190667)))))

(assert (=> d!39272 (= (readBitPure!0 (_1!5381 lt!190667)) (tuple2!10231 (_2!5393 lt!190963) (_1!5393 lt!190963)))))

(declare-fun bs!9500 () Bool)

(assert (= bs!9500 d!39272))

(declare-fun m!184713 () Bool)

(assert (=> bs!9500 m!184713))

(assert (=> b!121664 d!39272))

(declare-fun b!121905 () Bool)

(declare-fun e!79847 () tuple2!10228)

(declare-fun lt!191306 () tuple2!10228)

(declare-fun Unit!7509 () Unit!7495)

(assert (=> b!121905 (= e!79847 (tuple2!10229 Unit!7509 (_2!5379 lt!191306)))))

(declare-fun lt!191307 () Bool)

(assert (=> b!121905 (= lt!191307 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!191310 () tuple2!10228)

(assert (=> b!121905 (= lt!191310 (appendBit!0 (_2!5379 lt!190643) lt!191307))))

(declare-fun res!100992 () Bool)

(assert (=> b!121905 (= res!100992 (= (size!2440 (buf!2877 (_2!5379 lt!190643))) (size!2440 (buf!2877 (_2!5379 lt!191310)))))))

(declare-fun e!79848 () Bool)

(assert (=> b!121905 (=> (not res!100992) (not e!79848))))

(assert (=> b!121905 e!79848))

(declare-fun lt!191347 () tuple2!10228)

(assert (=> b!121905 (= lt!191347 lt!191310)))

(assert (=> b!121905 (= lt!191306 (appendNLeastSignificantBitsLoop!0 (_2!5379 lt!191347) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!191326 () Unit!7495)

(assert (=> b!121905 (= lt!191326 (lemmaIsPrefixTransitive!0 (_2!5379 lt!190643) (_2!5379 lt!191347) (_2!5379 lt!191306)))))

(assert (=> b!121905 (isPrefixOf!0 (_2!5379 lt!190643) (_2!5379 lt!191306))))

(declare-fun lt!191317 () Unit!7495)

(assert (=> b!121905 (= lt!191317 lt!191326)))

(assert (=> b!121905 (invariant!0 (currentBit!5563 (_2!5379 lt!190643)) (currentByte!5568 (_2!5379 lt!190643)) (size!2440 (buf!2877 (_2!5379 lt!191347))))))

(declare-fun lt!191331 () BitStream!4354)

(assert (=> b!121905 (= lt!191331 (BitStream!4355 (buf!2877 (_2!5379 lt!191347)) (currentByte!5568 (_2!5379 lt!190643)) (currentBit!5563 (_2!5379 lt!190643))))))

(assert (=> b!121905 (invariant!0 (currentBit!5563 lt!191331) (currentByte!5568 lt!191331) (size!2440 (buf!2877 (_2!5379 lt!191306))))))

(declare-fun lt!191345 () BitStream!4354)

(assert (=> b!121905 (= lt!191345 (BitStream!4355 (buf!2877 (_2!5379 lt!191306)) (currentByte!5568 lt!191331) (currentBit!5563 lt!191331)))))

(declare-fun lt!191311 () tuple2!10230)

(assert (=> b!121905 (= lt!191311 (readBitPure!0 lt!191331))))

(declare-fun lt!191328 () tuple2!10230)

(assert (=> b!121905 (= lt!191328 (readBitPure!0 lt!191345))))

(declare-fun lt!191334 () Unit!7495)

(assert (=> b!121905 (= lt!191334 (readBitPrefixLemma!0 lt!191331 (_2!5379 lt!191306)))))

(declare-fun res!100985 () Bool)

(assert (=> b!121905 (= res!100985 (= (bitIndex!0 (size!2440 (buf!2877 (_1!5380 lt!191311))) (currentByte!5568 (_1!5380 lt!191311)) (currentBit!5563 (_1!5380 lt!191311))) (bitIndex!0 (size!2440 (buf!2877 (_1!5380 lt!191328))) (currentByte!5568 (_1!5380 lt!191328)) (currentBit!5563 (_1!5380 lt!191328)))))))

(declare-fun e!79849 () Bool)

(assert (=> b!121905 (=> (not res!100985) (not e!79849))))

(assert (=> b!121905 e!79849))

(declare-fun lt!191338 () Unit!7495)

(assert (=> b!121905 (= lt!191338 lt!191334)))

(declare-fun lt!191324 () tuple2!10232)

(assert (=> b!121905 (= lt!191324 (reader!0 (_2!5379 lt!190643) (_2!5379 lt!191306)))))

(declare-fun lt!191312 () tuple2!10232)

(assert (=> b!121905 (= lt!191312 (reader!0 (_2!5379 lt!191347) (_2!5379 lt!191306)))))

(declare-fun lt!191330 () tuple2!10230)

(assert (=> b!121905 (= lt!191330 (readBitPure!0 (_1!5381 lt!191324)))))

(assert (=> b!121905 (= (_2!5380 lt!191330) lt!191307)))

(declare-fun lt!191316 () Unit!7495)

(declare-fun Unit!7510 () Unit!7495)

(assert (=> b!121905 (= lt!191316 Unit!7510)))

(declare-fun lt!191305 () (_ BitVec 64))

(assert (=> b!121905 (= lt!191305 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!191315 () (_ BitVec 64))

(assert (=> b!121905 (= lt!191315 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!191348 () Unit!7495)

(assert (=> b!121905 (= lt!191348 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5379 lt!190643) (buf!2877 (_2!5379 lt!191306)) lt!191315))))

(assert (=> b!121905 (validate_offset_bits!1 ((_ sign_extend 32) (size!2440 (buf!2877 (_2!5379 lt!191306)))) ((_ sign_extend 32) (currentByte!5568 (_2!5379 lt!190643))) ((_ sign_extend 32) (currentBit!5563 (_2!5379 lt!190643))) lt!191315)))

(declare-fun lt!191327 () Unit!7495)

(assert (=> b!121905 (= lt!191327 lt!191348)))

(declare-fun lt!191322 () tuple2!10234)

(assert (=> b!121905 (= lt!191322 (readNLeastSignificantBitsLoopPure!0 (_1!5381 lt!191324) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!191305))))

(declare-fun lt!191314 () (_ BitVec 64))

(assert (=> b!121905 (= lt!191314 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!191342 () Unit!7495)

(assert (=> b!121905 (= lt!191342 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5379 lt!191347) (buf!2877 (_2!5379 lt!191306)) lt!191314))))

(assert (=> b!121905 (validate_offset_bits!1 ((_ sign_extend 32) (size!2440 (buf!2877 (_2!5379 lt!191306)))) ((_ sign_extend 32) (currentByte!5568 (_2!5379 lt!191347))) ((_ sign_extend 32) (currentBit!5563 (_2!5379 lt!191347))) lt!191314)))

(declare-fun lt!191319 () Unit!7495)

(assert (=> b!121905 (= lt!191319 lt!191342)))

(declare-fun lt!191349 () tuple2!10234)

(assert (=> b!121905 (= lt!191349 (readNLeastSignificantBitsLoopPure!0 (_1!5381 lt!191312) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!191305 (ite (_2!5380 lt!191330) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!191309 () tuple2!10234)

(assert (=> b!121905 (= lt!191309 (readNLeastSignificantBitsLoopPure!0 (_1!5381 lt!191324) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!191305))))

(declare-fun c!7316 () Bool)

(assert (=> b!121905 (= c!7316 (_2!5380 (readBitPure!0 (_1!5381 lt!191324))))))

(declare-fun e!79846 () (_ BitVec 64))

(declare-fun lt!191320 () tuple2!10234)

(assert (=> b!121905 (= lt!191320 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5381 lt!191324) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!191305 e!79846)))))

(declare-fun lt!191332 () Unit!7495)

(assert (=> b!121905 (= lt!191332 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5381 lt!191324) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!191305))))

(assert (=> b!121905 (and (= (_2!5382 lt!191309) (_2!5382 lt!191320)) (= (_1!5382 lt!191309) (_1!5382 lt!191320)))))

(declare-fun lt!191321 () Unit!7495)

(assert (=> b!121905 (= lt!191321 lt!191332)))

(assert (=> b!121905 (= (_1!5381 lt!191324) (withMovedBitIndex!0 (_2!5381 lt!191324) (bvsub (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!190643))) (currentByte!5568 (_2!5379 lt!190643)) (currentBit!5563 (_2!5379 lt!190643))) (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!191306))) (currentByte!5568 (_2!5379 lt!191306)) (currentBit!5563 (_2!5379 lt!191306))))))))

(declare-fun lt!191323 () Unit!7495)

(declare-fun Unit!7511 () Unit!7495)

(assert (=> b!121905 (= lt!191323 Unit!7511)))

(assert (=> b!121905 (= (_1!5381 lt!191312) (withMovedBitIndex!0 (_2!5381 lt!191312) (bvsub (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!191347))) (currentByte!5568 (_2!5379 lt!191347)) (currentBit!5563 (_2!5379 lt!191347))) (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!191306))) (currentByte!5568 (_2!5379 lt!191306)) (currentBit!5563 (_2!5379 lt!191306))))))))

(declare-fun lt!191335 () Unit!7495)

(declare-fun Unit!7512 () Unit!7495)

(assert (=> b!121905 (= lt!191335 Unit!7512)))

(assert (=> b!121905 (= (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!190643))) (currentByte!5568 (_2!5379 lt!190643)) (currentBit!5563 (_2!5379 lt!190643))) (bvsub (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!191347))) (currentByte!5568 (_2!5379 lt!191347)) (currentBit!5563 (_2!5379 lt!191347))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!191337 () Unit!7495)

(declare-fun Unit!7513 () Unit!7495)

(assert (=> b!121905 (= lt!191337 Unit!7513)))

(assert (=> b!121905 (= (_2!5382 lt!191322) (_2!5382 lt!191349))))

(declare-fun lt!191339 () Unit!7495)

(declare-fun Unit!7514 () Unit!7495)

(assert (=> b!121905 (= lt!191339 Unit!7514)))

(assert (=> b!121905 (= (_1!5382 lt!191322) (_2!5381 lt!191324))))

(declare-fun b!121906 () Bool)

(declare-fun lt!191344 () Unit!7495)

(assert (=> b!121906 (= e!79847 (tuple2!10229 lt!191344 (_2!5379 lt!190643)))))

(declare-fun lt!191318 () BitStream!4354)

(assert (=> b!121906 (= lt!191318 (_2!5379 lt!190643))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4354) Unit!7495)

(assert (=> b!121906 (= lt!191344 (lemmaIsPrefixRefl!0 lt!191318))))

(declare-fun call!1595 () Bool)

(assert (=> b!121906 call!1595))

(declare-fun b!121907 () Bool)

(assert (=> b!121907 (= e!79846 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!121908 () Bool)

(declare-fun lt!191313 () tuple2!10230)

(assert (=> b!121908 (= lt!191313 (readBitPure!0 (readerFrom!0 (_2!5379 lt!191310) (currentBit!5563 (_2!5379 lt!190643)) (currentByte!5568 (_2!5379 lt!190643)))))))

(declare-fun res!100991 () Bool)

(assert (=> b!121908 (= res!100991 (and (= (_2!5380 lt!191313) lt!191307) (= (_1!5380 lt!191313) (_2!5379 lt!191310))))))

(declare-fun e!79851 () Bool)

(assert (=> b!121908 (=> (not res!100991) (not e!79851))))

(assert (=> b!121908 (= e!79848 e!79851)))

(declare-fun b!121909 () Bool)

(declare-fun res!100987 () Bool)

(declare-fun e!79852 () Bool)

(assert (=> b!121909 (=> (not res!100987) (not e!79852))))

(declare-fun lt!191329 () (_ BitVec 64))

(declare-fun lt!191336 () tuple2!10228)

(declare-fun lt!191346 () (_ BitVec 64))

(assert (=> b!121909 (= res!100987 (= (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!191336))) (currentByte!5568 (_2!5379 lt!191336)) (currentBit!5563 (_2!5379 lt!191336))) (bvadd lt!191329 lt!191346)))))

(assert (=> b!121909 (or (not (= (bvand lt!191329 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191346 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!191329 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!191329 lt!191346) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121909 (= lt!191346 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!121909 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!121909 (= lt!191329 (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!190643))) (currentByte!5568 (_2!5379 lt!190643)) (currentBit!5563 (_2!5379 lt!190643))))))

(declare-fun d!39274 () Bool)

(assert (=> d!39274 e!79852))

(declare-fun res!100990 () Bool)

(assert (=> d!39274 (=> (not res!100990) (not e!79852))))

(assert (=> d!39274 (= res!100990 (= (size!2440 (buf!2877 (_2!5379 lt!190643))) (size!2440 (buf!2877 (_2!5379 lt!191336)))))))

(assert (=> d!39274 (= lt!191336 e!79847)))

(declare-fun c!7315 () Bool)

(assert (=> d!39274 (= c!7315 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!39274 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!39274 (= (appendNLeastSignificantBitsLoop!0 (_2!5379 lt!190643) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!191336)))

(declare-fun b!121910 () Bool)

(assert (=> b!121910 (= e!79849 (= (_2!5380 lt!191311) (_2!5380 lt!191328)))))

(declare-fun b!121911 () Bool)

(assert (=> b!121911 (= e!79851 (= (bitIndex!0 (size!2440 (buf!2877 (_1!5380 lt!191313))) (currentByte!5568 (_1!5380 lt!191313)) (currentBit!5563 (_1!5380 lt!191313))) (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!191310))) (currentByte!5568 (_2!5379 lt!191310)) (currentBit!5563 (_2!5379 lt!191310)))))))

(declare-fun b!121912 () Bool)

(declare-fun res!100986 () Bool)

(assert (=> b!121912 (= res!100986 (= (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!191310))) (currentByte!5568 (_2!5379 lt!191310)) (currentBit!5563 (_2!5379 lt!191310))) (bvadd (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!190643))) (currentByte!5568 (_2!5379 lt!190643)) (currentBit!5563 (_2!5379 lt!190643))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!121912 (=> (not res!100986) (not e!79848))))

(declare-fun lt!191325 () tuple2!10234)

(declare-fun b!121913 () Bool)

(declare-fun lt!191308 () tuple2!10232)

(assert (=> b!121913 (= e!79852 (and (= (_2!5382 lt!191325) v!199) (= (_1!5382 lt!191325) (_2!5381 lt!191308))))))

(declare-fun lt!191341 () (_ BitVec 64))

(assert (=> b!121913 (= lt!191325 (readNLeastSignificantBitsLoopPure!0 (_1!5381 lt!191308) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!191341))))

(declare-fun lt!191343 () Unit!7495)

(declare-fun lt!191340 () Unit!7495)

(assert (=> b!121913 (= lt!191343 lt!191340)))

(declare-fun lt!191333 () (_ BitVec 64))

(assert (=> b!121913 (validate_offset_bits!1 ((_ sign_extend 32) (size!2440 (buf!2877 (_2!5379 lt!191336)))) ((_ sign_extend 32) (currentByte!5568 (_2!5379 lt!190643))) ((_ sign_extend 32) (currentBit!5563 (_2!5379 lt!190643))) lt!191333)))

(assert (=> b!121913 (= lt!191340 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5379 lt!190643) (buf!2877 (_2!5379 lt!191336)) lt!191333))))

(declare-fun e!79850 () Bool)

(assert (=> b!121913 e!79850))

(declare-fun res!100988 () Bool)

(assert (=> b!121913 (=> (not res!100988) (not e!79850))))

(assert (=> b!121913 (= res!100988 (and (= (size!2440 (buf!2877 (_2!5379 lt!190643))) (size!2440 (buf!2877 (_2!5379 lt!191336)))) (bvsge lt!191333 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121913 (= lt!191333 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!121913 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!121913 (= lt!191341 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!121913 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!121913 (= lt!191308 (reader!0 (_2!5379 lt!190643) (_2!5379 lt!191336)))))

(declare-fun bm!1592 () Bool)

(assert (=> bm!1592 (= call!1595 (isPrefixOf!0 (ite c!7315 (_2!5379 lt!190643) lt!191318) (ite c!7315 (_2!5379 lt!191310) lt!191318)))))

(declare-fun b!121914 () Bool)

(assert (=> b!121914 (= e!79846 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!121915 () Bool)

(declare-fun res!100989 () Bool)

(assert (=> b!121915 (=> (not res!100989) (not e!79852))))

(assert (=> b!121915 (= res!100989 (isPrefixOf!0 (_2!5379 lt!190643) (_2!5379 lt!191336)))))

(declare-fun b!121916 () Bool)

(declare-fun res!100993 () Bool)

(assert (=> b!121916 (= res!100993 call!1595)))

(assert (=> b!121916 (=> (not res!100993) (not e!79848))))

(declare-fun b!121917 () Bool)

(assert (=> b!121917 (= e!79850 (validate_offset_bits!1 ((_ sign_extend 32) (size!2440 (buf!2877 (_2!5379 lt!190643)))) ((_ sign_extend 32) (currentByte!5568 (_2!5379 lt!190643))) ((_ sign_extend 32) (currentBit!5563 (_2!5379 lt!190643))) lt!191333))))

(assert (= (and d!39274 c!7315) b!121905))

(assert (= (and d!39274 (not c!7315)) b!121906))

(assert (= (and b!121905 res!100992) b!121912))

(assert (= (and b!121912 res!100986) b!121916))

(assert (= (and b!121916 res!100993) b!121908))

(assert (= (and b!121908 res!100991) b!121911))

(assert (= (and b!121905 res!100985) b!121910))

(assert (= (and b!121905 c!7316) b!121914))

(assert (= (and b!121905 (not c!7316)) b!121907))

(assert (= (or b!121916 b!121906) bm!1592))

(assert (= (and d!39274 res!100990) b!121909))

(assert (= (and b!121909 res!100987) b!121915))

(assert (= (and b!121915 res!100989) b!121913))

(assert (= (and b!121913 res!100988) b!121917))

(declare-fun m!184923 () Bool)

(assert (=> b!121913 m!184923))

(declare-fun m!184925 () Bool)

(assert (=> b!121913 m!184925))

(declare-fun m!184927 () Bool)

(assert (=> b!121913 m!184927))

(declare-fun m!184929 () Bool)

(assert (=> b!121913 m!184929))

(declare-fun m!184931 () Bool)

(assert (=> b!121913 m!184931))

(declare-fun m!184933 () Bool)

(assert (=> b!121912 m!184933))

(assert (=> b!121912 m!184475))

(declare-fun m!184935 () Bool)

(assert (=> b!121905 m!184935))

(declare-fun m!184937 () Bool)

(assert (=> b!121905 m!184937))

(declare-fun m!184939 () Bool)

(assert (=> b!121905 m!184939))

(declare-fun m!184941 () Bool)

(assert (=> b!121905 m!184941))

(declare-fun m!184943 () Bool)

(assert (=> b!121905 m!184943))

(declare-fun m!184945 () Bool)

(assert (=> b!121905 m!184945))

(declare-fun m!184947 () Bool)

(assert (=> b!121905 m!184947))

(declare-fun m!184949 () Bool)

(assert (=> b!121905 m!184949))

(declare-fun m!184951 () Bool)

(assert (=> b!121905 m!184951))

(declare-fun m!184953 () Bool)

(assert (=> b!121905 m!184953))

(declare-fun m!184955 () Bool)

(assert (=> b!121905 m!184955))

(declare-fun m!184957 () Bool)

(assert (=> b!121905 m!184957))

(assert (=> b!121905 m!184923))

(declare-fun m!184959 () Bool)

(assert (=> b!121905 m!184959))

(declare-fun m!184961 () Bool)

(assert (=> b!121905 m!184961))

(declare-fun m!184963 () Bool)

(assert (=> b!121905 m!184963))

(declare-fun m!184965 () Bool)

(assert (=> b!121905 m!184965))

(declare-fun m!184967 () Bool)

(assert (=> b!121905 m!184967))

(declare-fun m!184969 () Bool)

(assert (=> b!121905 m!184969))

(declare-fun m!184971 () Bool)

(assert (=> b!121905 m!184971))

(declare-fun m!184973 () Bool)

(assert (=> b!121905 m!184973))

(declare-fun m!184975 () Bool)

(assert (=> b!121905 m!184975))

(declare-fun m!184977 () Bool)

(assert (=> b!121905 m!184977))

(declare-fun m!184979 () Bool)

(assert (=> b!121905 m!184979))

(declare-fun m!184981 () Bool)

(assert (=> b!121905 m!184981))

(declare-fun m!184983 () Bool)

(assert (=> b!121905 m!184983))

(assert (=> b!121905 m!184475))

(declare-fun m!184985 () Bool)

(assert (=> b!121905 m!184985))

(assert (=> b!121905 m!184959))

(declare-fun m!184987 () Bool)

(assert (=> b!121905 m!184987))

(declare-fun m!184989 () Bool)

(assert (=> b!121908 m!184989))

(assert (=> b!121908 m!184989))

(declare-fun m!184991 () Bool)

(assert (=> b!121908 m!184991))

(declare-fun m!184993 () Bool)

(assert (=> bm!1592 m!184993))

(declare-fun m!184995 () Bool)

(assert (=> b!121909 m!184995))

(assert (=> b!121909 m!184475))

(declare-fun m!184997 () Bool)

(assert (=> b!121917 m!184997))

(declare-fun m!184999 () Bool)

(assert (=> b!121911 m!184999))

(assert (=> b!121911 m!184933))

(declare-fun m!185001 () Bool)

(assert (=> b!121915 m!185001))

(declare-fun m!185003 () Bool)

(assert (=> b!121906 m!185003))

(assert (=> b!121664 d!39274))

(declare-fun d!39336 () Bool)

(assert (=> d!39336 (validate_offset_bits!1 ((_ sign_extend 32) (size!2440 (buf!2877 (_2!5379 lt!190664)))) ((_ sign_extend 32) (currentByte!5568 (_2!5379 lt!190643))) ((_ sign_extend 32) (currentBit!5563 (_2!5379 lt!190643))) lt!190663)))

(declare-fun lt!191364 () Unit!7495)

(assert (=> d!39336 (= lt!191364 (choose!9 (_2!5379 lt!190643) (buf!2877 (_2!5379 lt!190664)) lt!190663 (BitStream!4355 (buf!2877 (_2!5379 lt!190664)) (currentByte!5568 (_2!5379 lt!190643)) (currentBit!5563 (_2!5379 lt!190643)))))))

(assert (=> d!39336 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5379 lt!190643) (buf!2877 (_2!5379 lt!190664)) lt!190663) lt!191364)))

(declare-fun bs!9516 () Bool)

(assert (= bs!9516 d!39336))

(assert (=> bs!9516 m!184445))

(declare-fun m!185005 () Bool)

(assert (=> bs!9516 m!185005))

(assert (=> b!121664 d!39336))

(declare-fun d!39338 () Bool)

(declare-fun res!101011 () Bool)

(declare-fun e!79864 () Bool)

(assert (=> d!39338 (=> (not res!101011) (not e!79864))))

(assert (=> d!39338 (= res!101011 (= (size!2440 (buf!2877 thiss!1305)) (size!2440 (buf!2877 (_2!5379 lt!190664)))))))

(assert (=> d!39338 (= (isPrefixOf!0 thiss!1305 (_2!5379 lt!190664)) e!79864)))

(declare-fun b!121934 () Bool)

(declare-fun res!101010 () Bool)

(assert (=> b!121934 (=> (not res!101010) (not e!79864))))

(assert (=> b!121934 (= res!101010 (bvsle (bitIndex!0 (size!2440 (buf!2877 thiss!1305)) (currentByte!5568 thiss!1305) (currentBit!5563 thiss!1305)) (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!190664))) (currentByte!5568 (_2!5379 lt!190664)) (currentBit!5563 (_2!5379 lt!190664)))))))

(declare-fun b!121935 () Bool)

(declare-fun e!79865 () Bool)

(assert (=> b!121935 (= e!79864 e!79865)))

(declare-fun res!101012 () Bool)

(assert (=> b!121935 (=> res!101012 e!79865)))

(assert (=> b!121935 (= res!101012 (= (size!2440 (buf!2877 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!121936 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5393 array!5393 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!121936 (= e!79865 (arrayBitRangesEq!0 (buf!2877 thiss!1305) (buf!2877 (_2!5379 lt!190664)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2440 (buf!2877 thiss!1305)) (currentByte!5568 thiss!1305) (currentBit!5563 thiss!1305))))))

(assert (= (and d!39338 res!101011) b!121934))

(assert (= (and b!121934 res!101010) b!121935))

(assert (= (and b!121935 (not res!101012)) b!121936))

(assert (=> b!121934 m!184471))

(assert (=> b!121934 m!184479))

(assert (=> b!121936 m!184471))

(assert (=> b!121936 m!184471))

(declare-fun m!185027 () Bool)

(assert (=> b!121936 m!185027))

(assert (=> b!121664 d!39338))

(declare-fun d!39346 () Bool)

(declare-fun e!79878 () Bool)

(assert (=> d!39346 e!79878))

(declare-fun res!101031 () Bool)

(assert (=> d!39346 (=> (not res!101031) (not e!79878))))

(declare-fun lt!191465 () tuple2!10232)

(assert (=> d!39346 (= res!101031 (isPrefixOf!0 (_1!5381 lt!191465) (_2!5381 lt!191465)))))

(declare-fun lt!191464 () BitStream!4354)

(assert (=> d!39346 (= lt!191465 (tuple2!10233 lt!191464 (_2!5379 lt!190664)))))

(declare-fun lt!191455 () Unit!7495)

(declare-fun lt!191458 () Unit!7495)

(assert (=> d!39346 (= lt!191455 lt!191458)))

(assert (=> d!39346 (isPrefixOf!0 lt!191464 (_2!5379 lt!190664))))

(assert (=> d!39346 (= lt!191458 (lemmaIsPrefixTransitive!0 lt!191464 (_2!5379 lt!190664) (_2!5379 lt!190664)))))

(declare-fun lt!191467 () Unit!7495)

(declare-fun lt!191456 () Unit!7495)

(assert (=> d!39346 (= lt!191467 lt!191456)))

(assert (=> d!39346 (isPrefixOf!0 lt!191464 (_2!5379 lt!190664))))

(assert (=> d!39346 (= lt!191456 (lemmaIsPrefixTransitive!0 lt!191464 thiss!1305 (_2!5379 lt!190664)))))

(declare-fun lt!191472 () Unit!7495)

(declare-fun e!79879 () Unit!7495)

(assert (=> d!39346 (= lt!191472 e!79879)))

(declare-fun c!7319 () Bool)

(assert (=> d!39346 (= c!7319 (not (= (size!2440 (buf!2877 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!191459 () Unit!7495)

(declare-fun lt!191466 () Unit!7495)

(assert (=> d!39346 (= lt!191459 lt!191466)))

(assert (=> d!39346 (isPrefixOf!0 (_2!5379 lt!190664) (_2!5379 lt!190664))))

(assert (=> d!39346 (= lt!191466 (lemmaIsPrefixRefl!0 (_2!5379 lt!190664)))))

(declare-fun lt!191463 () Unit!7495)

(declare-fun lt!191460 () Unit!7495)

(assert (=> d!39346 (= lt!191463 lt!191460)))

(assert (=> d!39346 (= lt!191460 (lemmaIsPrefixRefl!0 (_2!5379 lt!190664)))))

(declare-fun lt!191469 () Unit!7495)

(declare-fun lt!191468 () Unit!7495)

(assert (=> d!39346 (= lt!191469 lt!191468)))

(assert (=> d!39346 (isPrefixOf!0 lt!191464 lt!191464)))

(assert (=> d!39346 (= lt!191468 (lemmaIsPrefixRefl!0 lt!191464))))

(declare-fun lt!191471 () Unit!7495)

(declare-fun lt!191462 () Unit!7495)

(assert (=> d!39346 (= lt!191471 lt!191462)))

(assert (=> d!39346 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!39346 (= lt!191462 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!39346 (= lt!191464 (BitStream!4355 (buf!2877 (_2!5379 lt!190664)) (currentByte!5568 thiss!1305) (currentBit!5563 thiss!1305)))))

(assert (=> d!39346 (isPrefixOf!0 thiss!1305 (_2!5379 lt!190664))))

(assert (=> d!39346 (= (reader!0 thiss!1305 (_2!5379 lt!190664)) lt!191465)))

(declare-fun b!121958 () Bool)

(declare-fun lt!191461 () Unit!7495)

(assert (=> b!121958 (= e!79879 lt!191461)))

(declare-fun lt!191457 () (_ BitVec 64))

(assert (=> b!121958 (= lt!191457 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!191470 () (_ BitVec 64))

(assert (=> b!121958 (= lt!191470 (bitIndex!0 (size!2440 (buf!2877 thiss!1305)) (currentByte!5568 thiss!1305) (currentBit!5563 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5393 array!5393 (_ BitVec 64) (_ BitVec 64)) Unit!7495)

(assert (=> b!121958 (= lt!191461 (arrayBitRangesEqSymmetric!0 (buf!2877 thiss!1305) (buf!2877 (_2!5379 lt!190664)) lt!191457 lt!191470))))

(assert (=> b!121958 (arrayBitRangesEq!0 (buf!2877 (_2!5379 lt!190664)) (buf!2877 thiss!1305) lt!191457 lt!191470)))

(declare-fun b!121959 () Bool)

(declare-fun Unit!7515 () Unit!7495)

(assert (=> b!121959 (= e!79879 Unit!7515)))

(declare-fun lt!191453 () (_ BitVec 64))

(declare-fun lt!191454 () (_ BitVec 64))

(declare-fun b!121960 () Bool)

(assert (=> b!121960 (= e!79878 (= (_1!5381 lt!191465) (withMovedBitIndex!0 (_2!5381 lt!191465) (bvsub lt!191454 lt!191453))))))

(assert (=> b!121960 (or (= (bvand lt!191454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191453 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!191454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!191454 lt!191453) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121960 (= lt!191453 (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!190664))) (currentByte!5568 (_2!5379 lt!190664)) (currentBit!5563 (_2!5379 lt!190664))))))

(assert (=> b!121960 (= lt!191454 (bitIndex!0 (size!2440 (buf!2877 thiss!1305)) (currentByte!5568 thiss!1305) (currentBit!5563 thiss!1305)))))

(declare-fun b!121961 () Bool)

(declare-fun res!101033 () Bool)

(assert (=> b!121961 (=> (not res!101033) (not e!79878))))

(assert (=> b!121961 (= res!101033 (isPrefixOf!0 (_2!5381 lt!191465) (_2!5379 lt!190664)))))

(declare-fun b!121962 () Bool)

(declare-fun res!101032 () Bool)

(assert (=> b!121962 (=> (not res!101032) (not e!79878))))

(assert (=> b!121962 (= res!101032 (isPrefixOf!0 (_1!5381 lt!191465) thiss!1305))))

(assert (= (and d!39346 c!7319) b!121958))

(assert (= (and d!39346 (not c!7319)) b!121959))

(assert (= (and d!39346 res!101031) b!121962))

(assert (= (and b!121962 res!101032) b!121961))

(assert (= (and b!121961 res!101033) b!121960))

(assert (=> b!121958 m!184471))

(declare-fun m!185051 () Bool)

(assert (=> b!121958 m!185051))

(declare-fun m!185053 () Bool)

(assert (=> b!121958 m!185053))

(declare-fun m!185055 () Bool)

(assert (=> b!121961 m!185055))

(declare-fun m!185057 () Bool)

(assert (=> b!121960 m!185057))

(assert (=> b!121960 m!184479))

(assert (=> b!121960 m!184471))

(declare-fun m!185059 () Bool)

(assert (=> b!121962 m!185059))

(declare-fun m!185061 () Bool)

(assert (=> d!39346 m!185061))

(declare-fun m!185063 () Bool)

(assert (=> d!39346 m!185063))

(declare-fun m!185065 () Bool)

(assert (=> d!39346 m!185065))

(declare-fun m!185067 () Bool)

(assert (=> d!39346 m!185067))

(declare-fun m!185069 () Bool)

(assert (=> d!39346 m!185069))

(assert (=> d!39346 m!184431))

(declare-fun m!185071 () Bool)

(assert (=> d!39346 m!185071))

(declare-fun m!185073 () Bool)

(assert (=> d!39346 m!185073))

(declare-fun m!185075 () Bool)

(assert (=> d!39346 m!185075))

(declare-fun m!185077 () Bool)

(assert (=> d!39346 m!185077))

(declare-fun m!185079 () Bool)

(assert (=> d!39346 m!185079))

(assert (=> b!121664 d!39346))

(declare-fun d!39366 () Bool)

(declare-fun lt!191473 () tuple2!10256)

(assert (=> d!39366 (= lt!191473 (readBit!0 lt!190655))))

(assert (=> d!39366 (= (readBitPure!0 lt!190655) (tuple2!10231 (_2!5393 lt!191473) (_1!5393 lt!191473)))))

(declare-fun bs!9521 () Bool)

(assert (= bs!9521 d!39366))

(declare-fun m!185081 () Bool)

(assert (=> bs!9521 m!185081))

(assert (=> b!121664 d!39366))

(declare-fun d!39368 () Bool)

(declare-fun e!79880 () Bool)

(assert (=> d!39368 e!79880))

(declare-fun res!101035 () Bool)

(assert (=> d!39368 (=> (not res!101035) (not e!79880))))

(declare-fun lt!191476 () (_ BitVec 64))

(declare-fun lt!191477 () (_ BitVec 64))

(declare-fun lt!191478 () (_ BitVec 64))

(assert (=> d!39368 (= res!101035 (= lt!191477 (bvsub lt!191478 lt!191476)))))

(assert (=> d!39368 (or (= (bvand lt!191478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191476 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!191478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!191478 lt!191476) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39368 (= lt!191476 (remainingBits!0 ((_ sign_extend 32) (size!2440 (buf!2877 (_1!5380 lt!190654)))) ((_ sign_extend 32) (currentByte!5568 (_1!5380 lt!190654))) ((_ sign_extend 32) (currentBit!5563 (_1!5380 lt!190654)))))))

(declare-fun lt!191479 () (_ BitVec 64))

(declare-fun lt!191475 () (_ BitVec 64))

(assert (=> d!39368 (= lt!191478 (bvmul lt!191479 lt!191475))))

(assert (=> d!39368 (or (= lt!191479 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!191475 (bvsdiv (bvmul lt!191479 lt!191475) lt!191479)))))

(assert (=> d!39368 (= lt!191475 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39368 (= lt!191479 ((_ sign_extend 32) (size!2440 (buf!2877 (_1!5380 lt!190654)))))))

(assert (=> d!39368 (= lt!191477 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5568 (_1!5380 lt!190654))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5563 (_1!5380 lt!190654)))))))

(assert (=> d!39368 (invariant!0 (currentBit!5563 (_1!5380 lt!190654)) (currentByte!5568 (_1!5380 lt!190654)) (size!2440 (buf!2877 (_1!5380 lt!190654))))))

(assert (=> d!39368 (= (bitIndex!0 (size!2440 (buf!2877 (_1!5380 lt!190654))) (currentByte!5568 (_1!5380 lt!190654)) (currentBit!5563 (_1!5380 lt!190654))) lt!191477)))

(declare-fun b!121963 () Bool)

(declare-fun res!101034 () Bool)

(assert (=> b!121963 (=> (not res!101034) (not e!79880))))

(assert (=> b!121963 (= res!101034 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!191477))))

(declare-fun b!121964 () Bool)

(declare-fun lt!191474 () (_ BitVec 64))

(assert (=> b!121964 (= e!79880 (bvsle lt!191477 (bvmul lt!191474 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121964 (or (= lt!191474 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!191474 #b0000000000000000000000000000000000000000000000000000000000001000) lt!191474)))))

(assert (=> b!121964 (= lt!191474 ((_ sign_extend 32) (size!2440 (buf!2877 (_1!5380 lt!190654)))))))

(assert (= (and d!39368 res!101035) b!121963))

(assert (= (and b!121963 res!101034) b!121964))

(declare-fun m!185083 () Bool)

(assert (=> d!39368 m!185083))

(declare-fun m!185085 () Bool)

(assert (=> d!39368 m!185085))

(assert (=> b!121664 d!39368))

(declare-fun d!39370 () Bool)

(assert (=> d!39370 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2440 (buf!2877 (_2!5379 lt!190664)))) ((_ sign_extend 32) (currentByte!5568 (_2!5379 lt!190643))) ((_ sign_extend 32) (currentBit!5563 (_2!5379 lt!190643))) lt!190663) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2440 (buf!2877 (_2!5379 lt!190664)))) ((_ sign_extend 32) (currentByte!5568 (_2!5379 lt!190643))) ((_ sign_extend 32) (currentBit!5563 (_2!5379 lt!190643)))) lt!190663))))

(declare-fun bs!9522 () Bool)

(assert (= bs!9522 d!39370))

(declare-fun m!185087 () Bool)

(assert (=> bs!9522 m!185087))

(assert (=> b!121664 d!39370))

(declare-fun d!39372 () Bool)

(declare-fun e!79881 () Bool)

(assert (=> d!39372 e!79881))

(declare-fun res!101036 () Bool)

(assert (=> d!39372 (=> (not res!101036) (not e!79881))))

(declare-fun lt!191494 () tuple2!10232)

(assert (=> d!39372 (= res!101036 (isPrefixOf!0 (_1!5381 lt!191494) (_2!5381 lt!191494)))))

(declare-fun lt!191493 () BitStream!4354)

(assert (=> d!39372 (= lt!191494 (tuple2!10233 lt!191493 (_2!5379 lt!190664)))))

(declare-fun lt!191484 () Unit!7495)

(declare-fun lt!191487 () Unit!7495)

(assert (=> d!39372 (= lt!191484 lt!191487)))

(assert (=> d!39372 (isPrefixOf!0 lt!191493 (_2!5379 lt!190664))))

(assert (=> d!39372 (= lt!191487 (lemmaIsPrefixTransitive!0 lt!191493 (_2!5379 lt!190664) (_2!5379 lt!190664)))))

(declare-fun lt!191496 () Unit!7495)

(declare-fun lt!191485 () Unit!7495)

(assert (=> d!39372 (= lt!191496 lt!191485)))

(assert (=> d!39372 (isPrefixOf!0 lt!191493 (_2!5379 lt!190664))))

(assert (=> d!39372 (= lt!191485 (lemmaIsPrefixTransitive!0 lt!191493 (_2!5379 lt!190643) (_2!5379 lt!190664)))))

(declare-fun lt!191501 () Unit!7495)

(declare-fun e!79882 () Unit!7495)

(assert (=> d!39372 (= lt!191501 e!79882)))

(declare-fun c!7320 () Bool)

(assert (=> d!39372 (= c!7320 (not (= (size!2440 (buf!2877 (_2!5379 lt!190643))) #b00000000000000000000000000000000)))))

(declare-fun lt!191488 () Unit!7495)

(declare-fun lt!191495 () Unit!7495)

(assert (=> d!39372 (= lt!191488 lt!191495)))

(assert (=> d!39372 (isPrefixOf!0 (_2!5379 lt!190664) (_2!5379 lt!190664))))

(assert (=> d!39372 (= lt!191495 (lemmaIsPrefixRefl!0 (_2!5379 lt!190664)))))

(declare-fun lt!191492 () Unit!7495)

(declare-fun lt!191489 () Unit!7495)

(assert (=> d!39372 (= lt!191492 lt!191489)))

(assert (=> d!39372 (= lt!191489 (lemmaIsPrefixRefl!0 (_2!5379 lt!190664)))))

(declare-fun lt!191498 () Unit!7495)

(declare-fun lt!191497 () Unit!7495)

(assert (=> d!39372 (= lt!191498 lt!191497)))

(assert (=> d!39372 (isPrefixOf!0 lt!191493 lt!191493)))

(assert (=> d!39372 (= lt!191497 (lemmaIsPrefixRefl!0 lt!191493))))

(declare-fun lt!191500 () Unit!7495)

(declare-fun lt!191491 () Unit!7495)

(assert (=> d!39372 (= lt!191500 lt!191491)))

(assert (=> d!39372 (isPrefixOf!0 (_2!5379 lt!190643) (_2!5379 lt!190643))))

(assert (=> d!39372 (= lt!191491 (lemmaIsPrefixRefl!0 (_2!5379 lt!190643)))))

(assert (=> d!39372 (= lt!191493 (BitStream!4355 (buf!2877 (_2!5379 lt!190664)) (currentByte!5568 (_2!5379 lt!190643)) (currentBit!5563 (_2!5379 lt!190643))))))

(assert (=> d!39372 (isPrefixOf!0 (_2!5379 lt!190643) (_2!5379 lt!190664))))

(assert (=> d!39372 (= (reader!0 (_2!5379 lt!190643) (_2!5379 lt!190664)) lt!191494)))

(declare-fun b!121965 () Bool)

(declare-fun lt!191490 () Unit!7495)

(assert (=> b!121965 (= e!79882 lt!191490)))

(declare-fun lt!191486 () (_ BitVec 64))

(assert (=> b!121965 (= lt!191486 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!191499 () (_ BitVec 64))

(assert (=> b!121965 (= lt!191499 (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!190643))) (currentByte!5568 (_2!5379 lt!190643)) (currentBit!5563 (_2!5379 lt!190643))))))

(assert (=> b!121965 (= lt!191490 (arrayBitRangesEqSymmetric!0 (buf!2877 (_2!5379 lt!190643)) (buf!2877 (_2!5379 lt!190664)) lt!191486 lt!191499))))

(assert (=> b!121965 (arrayBitRangesEq!0 (buf!2877 (_2!5379 lt!190664)) (buf!2877 (_2!5379 lt!190643)) lt!191486 lt!191499)))

(declare-fun b!121966 () Bool)

(declare-fun Unit!7516 () Unit!7495)

(assert (=> b!121966 (= e!79882 Unit!7516)))

(declare-fun b!121967 () Bool)

(declare-fun lt!191482 () (_ BitVec 64))

(declare-fun lt!191483 () (_ BitVec 64))

(assert (=> b!121967 (= e!79881 (= (_1!5381 lt!191494) (withMovedBitIndex!0 (_2!5381 lt!191494) (bvsub lt!191483 lt!191482))))))

(assert (=> b!121967 (or (= (bvand lt!191483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191482 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!191483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!191483 lt!191482) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121967 (= lt!191482 (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!190664))) (currentByte!5568 (_2!5379 lt!190664)) (currentBit!5563 (_2!5379 lt!190664))))))

(assert (=> b!121967 (= lt!191483 (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!190643))) (currentByte!5568 (_2!5379 lt!190643)) (currentBit!5563 (_2!5379 lt!190643))))))

(declare-fun b!121968 () Bool)

(declare-fun res!101038 () Bool)

(assert (=> b!121968 (=> (not res!101038) (not e!79881))))

(assert (=> b!121968 (= res!101038 (isPrefixOf!0 (_2!5381 lt!191494) (_2!5379 lt!190664)))))

(declare-fun b!121969 () Bool)

(declare-fun res!101037 () Bool)

(assert (=> b!121969 (=> (not res!101037) (not e!79881))))

(assert (=> b!121969 (= res!101037 (isPrefixOf!0 (_1!5381 lt!191494) (_2!5379 lt!190643)))))

(assert (= (and d!39372 c!7320) b!121965))

(assert (= (and d!39372 (not c!7320)) b!121966))

(assert (= (and d!39372 res!101036) b!121969))

(assert (= (and b!121969 res!101037) b!121968))

(assert (= (and b!121968 res!101038) b!121967))

(assert (=> b!121965 m!184475))

(declare-fun m!185089 () Bool)

(assert (=> b!121965 m!185089))

(declare-fun m!185091 () Bool)

(assert (=> b!121965 m!185091))

(declare-fun m!185093 () Bool)

(assert (=> b!121968 m!185093))

(declare-fun m!185095 () Bool)

(assert (=> b!121967 m!185095))

(assert (=> b!121967 m!184479))

(assert (=> b!121967 m!184475))

(declare-fun m!185097 () Bool)

(assert (=> b!121969 m!185097))

(declare-fun m!185099 () Bool)

(assert (=> d!39372 m!185099))

(declare-fun m!185101 () Bool)

(assert (=> d!39372 m!185101))

(assert (=> d!39372 m!185065))

(declare-fun m!185103 () Bool)

(assert (=> d!39372 m!185103))

(assert (=> d!39372 m!185069))

(declare-fun m!185105 () Bool)

(assert (=> d!39372 m!185105))

(declare-fun m!185107 () Bool)

(assert (=> d!39372 m!185107))

(declare-fun m!185109 () Bool)

(assert (=> d!39372 m!185109))

(declare-fun m!185111 () Bool)

(assert (=> d!39372 m!185111))

(declare-fun m!185113 () Bool)

(assert (=> d!39372 m!185113))

(declare-fun m!185115 () Bool)

(assert (=> d!39372 m!185115))

(assert (=> b!121664 d!39372))

(declare-fun d!39374 () Bool)

(assert (=> d!39374 (isPrefixOf!0 thiss!1305 (_2!5379 lt!190664))))

(declare-fun lt!191532 () Unit!7495)

(declare-fun choose!30 (BitStream!4354 BitStream!4354 BitStream!4354) Unit!7495)

(assert (=> d!39374 (= lt!191532 (choose!30 thiss!1305 (_2!5379 lt!190643) (_2!5379 lt!190664)))))

(assert (=> d!39374 (isPrefixOf!0 thiss!1305 (_2!5379 lt!190643))))

(assert (=> d!39374 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5379 lt!190643) (_2!5379 lt!190664)) lt!191532)))

(declare-fun bs!9523 () Bool)

(assert (= bs!9523 d!39374))

(assert (=> bs!9523 m!184431))

(declare-fun m!185117 () Bool)

(assert (=> bs!9523 m!185117))

(assert (=> bs!9523 m!184485))

(assert (=> b!121664 d!39374))

(declare-fun d!39376 () Bool)

(declare-datatypes ((tuple2!10262 0))(
  ( (tuple2!10263 (_1!5396 (_ BitVec 64)) (_2!5396 BitStream!4354)) )
))
(declare-fun lt!191579 () tuple2!10262)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4354 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10262)

(assert (=> d!39376 (= lt!191579 (readNLeastSignificantBitsLoop!0 (_1!5381 lt!190667) nBits!396 i!615 lt!190658))))

(assert (=> d!39376 (= (readNLeastSignificantBitsLoopPure!0 (_1!5381 lt!190667) nBits!396 i!615 lt!190658) (tuple2!10235 (_2!5396 lt!191579) (_1!5396 lt!191579)))))

(declare-fun bs!9524 () Bool)

(assert (= bs!9524 d!39376))

(declare-fun m!185119 () Bool)

(assert (=> bs!9524 m!185119))

(assert (=> b!121664 d!39376))

(declare-fun d!39378 () Bool)

(declare-fun lt!191580 () tuple2!10256)

(assert (=> d!39378 (= lt!191580 (readBit!0 (BitStream!4355 (buf!2877 (_2!5379 lt!190664)) (currentByte!5568 thiss!1305) (currentBit!5563 thiss!1305))))))

(assert (=> d!39378 (= (readBitPure!0 (BitStream!4355 (buf!2877 (_2!5379 lt!190664)) (currentByte!5568 thiss!1305) (currentBit!5563 thiss!1305))) (tuple2!10231 (_2!5393 lt!191580) (_1!5393 lt!191580)))))

(declare-fun bs!9525 () Bool)

(assert (= bs!9525 d!39378))

(declare-fun m!185121 () Bool)

(assert (=> bs!9525 m!185121))

(assert (=> b!121664 d!39378))

(declare-fun d!39380 () Bool)

(declare-fun e!79909 () Bool)

(assert (=> d!39380 e!79909))

(declare-fun res!101077 () Bool)

(assert (=> d!39380 (=> (not res!101077) (not e!79909))))

(declare-fun lt!191652 () tuple2!10228)

(assert (=> d!39380 (= res!101077 (= (size!2440 (buf!2877 thiss!1305)) (size!2440 (buf!2877 (_2!5379 lt!191652)))))))

(declare-fun choose!16 (BitStream!4354 Bool) tuple2!10228)

(assert (=> d!39380 (= lt!191652 (choose!16 thiss!1305 lt!190668))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!39380 (validate_offset_bit!0 ((_ sign_extend 32) (size!2440 (buf!2877 thiss!1305))) ((_ sign_extend 32) (currentByte!5568 thiss!1305)) ((_ sign_extend 32) (currentBit!5563 thiss!1305)))))

(assert (=> d!39380 (= (appendBit!0 thiss!1305 lt!190668) lt!191652)))

(declare-fun b!122019 () Bool)

(declare-fun res!101076 () Bool)

(assert (=> b!122019 (=> (not res!101076) (not e!79909))))

(assert (=> b!122019 (= res!101076 (isPrefixOf!0 thiss!1305 (_2!5379 lt!191652)))))

(declare-fun b!122021 () Bool)

(declare-fun e!79908 () Bool)

(declare-fun lt!191653 () tuple2!10230)

(assert (=> b!122021 (= e!79908 (= (bitIndex!0 (size!2440 (buf!2877 (_1!5380 lt!191653))) (currentByte!5568 (_1!5380 lt!191653)) (currentBit!5563 (_1!5380 lt!191653))) (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!191652))) (currentByte!5568 (_2!5379 lt!191652)) (currentBit!5563 (_2!5379 lt!191652)))))))

(declare-fun b!122018 () Bool)

(declare-fun res!101074 () Bool)

(assert (=> b!122018 (=> (not res!101074) (not e!79909))))

(declare-fun lt!191651 () (_ BitVec 64))

(declare-fun lt!191650 () (_ BitVec 64))

(assert (=> b!122018 (= res!101074 (= (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!191652))) (currentByte!5568 (_2!5379 lt!191652)) (currentBit!5563 (_2!5379 lt!191652))) (bvadd lt!191650 lt!191651)))))

(assert (=> b!122018 (or (not (= (bvand lt!191650 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191651 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!191650 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!191650 lt!191651) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122018 (= lt!191651 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!122018 (= lt!191650 (bitIndex!0 (size!2440 (buf!2877 thiss!1305)) (currentByte!5568 thiss!1305) (currentBit!5563 thiss!1305)))))

(declare-fun b!122020 () Bool)

(assert (=> b!122020 (= e!79909 e!79908)))

(declare-fun res!101075 () Bool)

(assert (=> b!122020 (=> (not res!101075) (not e!79908))))

(assert (=> b!122020 (= res!101075 (and (= (_2!5380 lt!191653) lt!190668) (= (_1!5380 lt!191653) (_2!5379 lt!191652))))))

(assert (=> b!122020 (= lt!191653 (readBitPure!0 (readerFrom!0 (_2!5379 lt!191652) (currentBit!5563 thiss!1305) (currentByte!5568 thiss!1305))))))

(assert (= (and d!39380 res!101077) b!122018))

(assert (= (and b!122018 res!101074) b!122019))

(assert (= (and b!122019 res!101076) b!122020))

(assert (= (and b!122020 res!101075) b!122021))

(declare-fun m!185123 () Bool)

(assert (=> b!122019 m!185123))

(declare-fun m!185125 () Bool)

(assert (=> d!39380 m!185125))

(declare-fun m!185129 () Bool)

(assert (=> d!39380 m!185129))

(declare-fun m!185133 () Bool)

(assert (=> b!122020 m!185133))

(assert (=> b!122020 m!185133))

(declare-fun m!185137 () Bool)

(assert (=> b!122020 m!185137))

(declare-fun m!185141 () Bool)

(assert (=> b!122021 m!185141))

(declare-fun m!185145 () Bool)

(assert (=> b!122021 m!185145))

(assert (=> b!122018 m!185145))

(assert (=> b!122018 m!184471))

(assert (=> b!121664 d!39380))

(declare-fun d!39382 () Bool)

(declare-fun e!79912 () Bool)

(assert (=> d!39382 e!79912))

(declare-fun res!101080 () Bool)

(assert (=> d!39382 (=> (not res!101080) (not e!79912))))

(declare-fun lt!191665 () tuple2!10230)

(declare-fun lt!191663 () tuple2!10230)

(assert (=> d!39382 (= res!101080 (= (bitIndex!0 (size!2440 (buf!2877 (_1!5380 lt!191665))) (currentByte!5568 (_1!5380 lt!191665)) (currentBit!5563 (_1!5380 lt!191665))) (bitIndex!0 (size!2440 (buf!2877 (_1!5380 lt!191663))) (currentByte!5568 (_1!5380 lt!191663)) (currentBit!5563 (_1!5380 lt!191663)))))))

(declare-fun lt!191666 () BitStream!4354)

(declare-fun lt!191664 () Unit!7495)

(declare-fun choose!50 (BitStream!4354 BitStream!4354 BitStream!4354 tuple2!10230 tuple2!10230 BitStream!4354 Bool tuple2!10230 tuple2!10230 BitStream!4354 Bool) Unit!7495)

(assert (=> d!39382 (= lt!191664 (choose!50 lt!190655 (_2!5379 lt!190664) lt!191666 lt!191665 (tuple2!10231 (_1!5380 lt!191665) (_2!5380 lt!191665)) (_1!5380 lt!191665) (_2!5380 lt!191665) lt!191663 (tuple2!10231 (_1!5380 lt!191663) (_2!5380 lt!191663)) (_1!5380 lt!191663) (_2!5380 lt!191663)))))

(assert (=> d!39382 (= lt!191663 (readBitPure!0 lt!191666))))

(assert (=> d!39382 (= lt!191665 (readBitPure!0 lt!190655))))

(assert (=> d!39382 (= lt!191666 (BitStream!4355 (buf!2877 (_2!5379 lt!190664)) (currentByte!5568 lt!190655) (currentBit!5563 lt!190655)))))

(assert (=> d!39382 (invariant!0 (currentBit!5563 lt!190655) (currentByte!5568 lt!190655) (size!2440 (buf!2877 (_2!5379 lt!190664))))))

(assert (=> d!39382 (= (readBitPrefixLemma!0 lt!190655 (_2!5379 lt!190664)) lt!191664)))

(declare-fun b!122024 () Bool)

(assert (=> b!122024 (= e!79912 (= (_2!5380 lt!191665) (_2!5380 lt!191663)))))

(assert (= (and d!39382 res!101080) b!122024))

(declare-fun m!185221 () Bool)

(assert (=> d!39382 m!185221))

(declare-fun m!185223 () Bool)

(assert (=> d!39382 m!185223))

(declare-fun m!185225 () Bool)

(assert (=> d!39382 m!185225))

(declare-fun m!185227 () Bool)

(assert (=> d!39382 m!185227))

(declare-fun m!185229 () Bool)

(assert (=> d!39382 m!185229))

(assert (=> d!39382 m!184461))

(assert (=> b!121664 d!39382))

(declare-fun d!39388 () Bool)

(assert (=> d!39388 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!121664 d!39388))

(declare-fun lt!191667 () tuple2!10262)

(declare-fun d!39390 () Bool)

(assert (=> d!39390 (= lt!191667 (readNLeastSignificantBitsLoop!0 (_1!5381 lt!190646) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190651))))

(assert (=> d!39390 (= (readNLeastSignificantBitsLoopPure!0 (_1!5381 lt!190646) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190651) (tuple2!10235 (_2!5396 lt!191667) (_1!5396 lt!191667)))))

(declare-fun bs!9527 () Bool)

(assert (= bs!9527 d!39390))

(declare-fun m!185231 () Bool)

(assert (=> bs!9527 m!185231))

(assert (=> b!121664 d!39390))

(declare-fun d!39392 () Bool)

(declare-fun e!79913 () Bool)

(assert (=> d!39392 e!79913))

(declare-fun res!101082 () Bool)

(assert (=> d!39392 (=> (not res!101082) (not e!79913))))

(declare-fun lt!191670 () (_ BitVec 64))

(declare-fun lt!191672 () (_ BitVec 64))

(declare-fun lt!191671 () (_ BitVec 64))

(assert (=> d!39392 (= res!101082 (= lt!191671 (bvsub lt!191672 lt!191670)))))

(assert (=> d!39392 (or (= (bvand lt!191672 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191670 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!191672 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!191672 lt!191670) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39392 (= lt!191670 (remainingBits!0 ((_ sign_extend 32) (size!2440 (buf!2877 (_1!5380 lt!190650)))) ((_ sign_extend 32) (currentByte!5568 (_1!5380 lt!190650))) ((_ sign_extend 32) (currentBit!5563 (_1!5380 lt!190650)))))))

(declare-fun lt!191673 () (_ BitVec 64))

(declare-fun lt!191669 () (_ BitVec 64))

(assert (=> d!39392 (= lt!191672 (bvmul lt!191673 lt!191669))))

(assert (=> d!39392 (or (= lt!191673 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!191669 (bvsdiv (bvmul lt!191673 lt!191669) lt!191673)))))

(assert (=> d!39392 (= lt!191669 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39392 (= lt!191673 ((_ sign_extend 32) (size!2440 (buf!2877 (_1!5380 lt!190650)))))))

(assert (=> d!39392 (= lt!191671 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5568 (_1!5380 lt!190650))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5563 (_1!5380 lt!190650)))))))

(assert (=> d!39392 (invariant!0 (currentBit!5563 (_1!5380 lt!190650)) (currentByte!5568 (_1!5380 lt!190650)) (size!2440 (buf!2877 (_1!5380 lt!190650))))))

(assert (=> d!39392 (= (bitIndex!0 (size!2440 (buf!2877 (_1!5380 lt!190650))) (currentByte!5568 (_1!5380 lt!190650)) (currentBit!5563 (_1!5380 lt!190650))) lt!191671)))

(declare-fun b!122025 () Bool)

(declare-fun res!101081 () Bool)

(assert (=> b!122025 (=> (not res!101081) (not e!79913))))

(assert (=> b!122025 (= res!101081 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!191671))))

(declare-fun b!122026 () Bool)

(declare-fun lt!191668 () (_ BitVec 64))

(assert (=> b!122026 (= e!79913 (bvsle lt!191671 (bvmul lt!191668 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!122026 (or (= lt!191668 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!191668 #b0000000000000000000000000000000000000000000000000000000000001000) lt!191668)))))

(assert (=> b!122026 (= lt!191668 ((_ sign_extend 32) (size!2440 (buf!2877 (_1!5380 lt!190650)))))))

(assert (= (and d!39392 res!101082) b!122025))

(assert (= (and b!122025 res!101081) b!122026))

(declare-fun m!185233 () Bool)

(assert (=> d!39392 m!185233))

(declare-fun m!185235 () Bool)

(assert (=> d!39392 m!185235))

(assert (=> b!121664 d!39392))

(declare-fun d!39394 () Bool)

(assert (=> d!39394 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!121654 d!39394))

(declare-fun d!39396 () Bool)

(declare-fun res!101084 () Bool)

(declare-fun e!79914 () Bool)

(assert (=> d!39396 (=> (not res!101084) (not e!79914))))

(assert (=> d!39396 (= res!101084 (= (size!2440 (buf!2877 thiss!1305)) (size!2440 (buf!2877 (_2!5379 lt!190643)))))))

(assert (=> d!39396 (= (isPrefixOf!0 thiss!1305 (_2!5379 lt!190643)) e!79914)))

(declare-fun b!122027 () Bool)

(declare-fun res!101083 () Bool)

(assert (=> b!122027 (=> (not res!101083) (not e!79914))))

(assert (=> b!122027 (= res!101083 (bvsle (bitIndex!0 (size!2440 (buf!2877 thiss!1305)) (currentByte!5568 thiss!1305) (currentBit!5563 thiss!1305)) (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!190643))) (currentByte!5568 (_2!5379 lt!190643)) (currentBit!5563 (_2!5379 lt!190643)))))))

(declare-fun b!122028 () Bool)

(declare-fun e!79915 () Bool)

(assert (=> b!122028 (= e!79914 e!79915)))

(declare-fun res!101085 () Bool)

(assert (=> b!122028 (=> res!101085 e!79915)))

(assert (=> b!122028 (= res!101085 (= (size!2440 (buf!2877 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!122029 () Bool)

(assert (=> b!122029 (= e!79915 (arrayBitRangesEq!0 (buf!2877 thiss!1305) (buf!2877 (_2!5379 lt!190643)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2440 (buf!2877 thiss!1305)) (currentByte!5568 thiss!1305) (currentBit!5563 thiss!1305))))))

(assert (= (and d!39396 res!101084) b!122027))

(assert (= (and b!122027 res!101083) b!122028))

(assert (= (and b!122028 (not res!101085)) b!122029))

(assert (=> b!122027 m!184471))

(assert (=> b!122027 m!184475))

(assert (=> b!122029 m!184471))

(assert (=> b!122029 m!184471))

(declare-fun m!185237 () Bool)

(assert (=> b!122029 m!185237))

(assert (=> b!121665 d!39396))

(declare-fun d!39398 () Bool)

(declare-fun e!79916 () Bool)

(assert (=> d!39398 e!79916))

(declare-fun res!101087 () Bool)

(assert (=> d!39398 (=> (not res!101087) (not e!79916))))

(declare-fun lt!191676 () (_ BitVec 64))

(declare-fun lt!191678 () (_ BitVec 64))

(declare-fun lt!191677 () (_ BitVec 64))

(assert (=> d!39398 (= res!101087 (= lt!191677 (bvsub lt!191678 lt!191676)))))

(assert (=> d!39398 (or (= (bvand lt!191678 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191676 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!191678 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!191678 lt!191676) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39398 (= lt!191676 (remainingBits!0 ((_ sign_extend 32) (size!2440 (buf!2877 (_2!5379 lt!190643)))) ((_ sign_extend 32) (currentByte!5568 (_2!5379 lt!190643))) ((_ sign_extend 32) (currentBit!5563 (_2!5379 lt!190643)))))))

(declare-fun lt!191679 () (_ BitVec 64))

(declare-fun lt!191675 () (_ BitVec 64))

(assert (=> d!39398 (= lt!191678 (bvmul lt!191679 lt!191675))))

(assert (=> d!39398 (or (= lt!191679 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!191675 (bvsdiv (bvmul lt!191679 lt!191675) lt!191679)))))

(assert (=> d!39398 (= lt!191675 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39398 (= lt!191679 ((_ sign_extend 32) (size!2440 (buf!2877 (_2!5379 lt!190643)))))))

(assert (=> d!39398 (= lt!191677 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5568 (_2!5379 lt!190643))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5563 (_2!5379 lt!190643)))))))

(assert (=> d!39398 (invariant!0 (currentBit!5563 (_2!5379 lt!190643)) (currentByte!5568 (_2!5379 lt!190643)) (size!2440 (buf!2877 (_2!5379 lt!190643))))))

(assert (=> d!39398 (= (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!190643))) (currentByte!5568 (_2!5379 lt!190643)) (currentBit!5563 (_2!5379 lt!190643))) lt!191677)))

(declare-fun b!122030 () Bool)

(declare-fun res!101086 () Bool)

(assert (=> b!122030 (=> (not res!101086) (not e!79916))))

(assert (=> b!122030 (= res!101086 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!191677))))

(declare-fun b!122031 () Bool)

(declare-fun lt!191674 () (_ BitVec 64))

(assert (=> b!122031 (= e!79916 (bvsle lt!191677 (bvmul lt!191674 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!122031 (or (= lt!191674 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!191674 #b0000000000000000000000000000000000000000000000000000000000001000) lt!191674)))))

(assert (=> b!122031 (= lt!191674 ((_ sign_extend 32) (size!2440 (buf!2877 (_2!5379 lt!190643)))))))

(assert (= (and d!39398 res!101087) b!122030))

(assert (= (and b!122030 res!101086) b!122031))

(declare-fun m!185239 () Bool)

(assert (=> d!39398 m!185239))

(assert (=> d!39398 m!184707))

(assert (=> b!121658 d!39398))

(declare-fun d!39400 () Bool)

(declare-fun e!79917 () Bool)

(assert (=> d!39400 e!79917))

(declare-fun res!101089 () Bool)

(assert (=> d!39400 (=> (not res!101089) (not e!79917))))

(declare-fun lt!191684 () (_ BitVec 64))

(declare-fun lt!191682 () (_ BitVec 64))

(declare-fun lt!191683 () (_ BitVec 64))

(assert (=> d!39400 (= res!101089 (= lt!191683 (bvsub lt!191684 lt!191682)))))

(assert (=> d!39400 (or (= (bvand lt!191684 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191682 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!191684 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!191684 lt!191682) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39400 (= lt!191682 (remainingBits!0 ((_ sign_extend 32) (size!2440 (buf!2877 thiss!1305))) ((_ sign_extend 32) (currentByte!5568 thiss!1305)) ((_ sign_extend 32) (currentBit!5563 thiss!1305))))))

(declare-fun lt!191685 () (_ BitVec 64))

(declare-fun lt!191681 () (_ BitVec 64))

(assert (=> d!39400 (= lt!191684 (bvmul lt!191685 lt!191681))))

(assert (=> d!39400 (or (= lt!191685 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!191681 (bvsdiv (bvmul lt!191685 lt!191681) lt!191685)))))

(assert (=> d!39400 (= lt!191681 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39400 (= lt!191685 ((_ sign_extend 32) (size!2440 (buf!2877 thiss!1305))))))

(assert (=> d!39400 (= lt!191683 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5568 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5563 thiss!1305))))))

(assert (=> d!39400 (invariant!0 (currentBit!5563 thiss!1305) (currentByte!5568 thiss!1305) (size!2440 (buf!2877 thiss!1305)))))

(assert (=> d!39400 (= (bitIndex!0 (size!2440 (buf!2877 thiss!1305)) (currentByte!5568 thiss!1305) (currentBit!5563 thiss!1305)) lt!191683)))

(declare-fun b!122032 () Bool)

(declare-fun res!101088 () Bool)

(assert (=> b!122032 (=> (not res!101088) (not e!79917))))

(assert (=> b!122032 (= res!101088 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!191683))))

(declare-fun b!122033 () Bool)

(declare-fun lt!191680 () (_ BitVec 64))

(assert (=> b!122033 (= e!79917 (bvsle lt!191683 (bvmul lt!191680 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!122033 (or (= lt!191680 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!191680 #b0000000000000000000000000000000000000000000000000000000000001000) lt!191680)))))

(assert (=> b!122033 (= lt!191680 ((_ sign_extend 32) (size!2440 (buf!2877 thiss!1305))))))

(assert (= (and d!39400 res!101089) b!122032))

(assert (= (and b!122032 res!101088) b!122033))

(assert (=> d!39400 m!184695))

(declare-fun m!185241 () Bool)

(assert (=> d!39400 m!185241))

(assert (=> b!121658 d!39400))

(declare-fun lt!191686 () tuple2!10262)

(declare-fun d!39402 () Bool)

(assert (=> d!39402 (= lt!191686 (readNLeastSignificantBitsLoop!0 lt!190647 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190651))))

(assert (=> d!39402 (= (readNLeastSignificantBitsLoopPure!0 lt!190647 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190651) (tuple2!10235 (_2!5396 lt!191686) (_1!5396 lt!191686)))))

(declare-fun bs!9528 () Bool)

(assert (= bs!9528 d!39402))

(declare-fun m!185243 () Bool)

(assert (=> bs!9528 m!185243))

(assert (=> b!121656 d!39402))

(declare-fun d!39404 () Bool)

(declare-fun e!79920 () Bool)

(assert (=> d!39404 e!79920))

(declare-fun res!101092 () Bool)

(assert (=> d!39404 (=> (not res!101092) (not e!79920))))

(declare-fun lt!191691 () BitStream!4354)

(declare-fun lt!191692 () (_ BitVec 64))

(assert (=> d!39404 (= res!101092 (= (bvadd lt!191692 (bvsub lt!190649 lt!190662)) (bitIndex!0 (size!2440 (buf!2877 lt!191691)) (currentByte!5568 lt!191691) (currentBit!5563 lt!191691))))))

(assert (=> d!39404 (or (not (= (bvand lt!191692 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!190649 lt!190662) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!191692 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!191692 (bvsub lt!190649 lt!190662)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39404 (= lt!191692 (bitIndex!0 (size!2440 (buf!2877 (_2!5381 lt!190667))) (currentByte!5568 (_2!5381 lt!190667)) (currentBit!5563 (_2!5381 lt!190667))))))

(declare-fun moveBitIndex!0 (BitStream!4354 (_ BitVec 64)) tuple2!10228)

(assert (=> d!39404 (= lt!191691 (_2!5379 (moveBitIndex!0 (_2!5381 lt!190667) (bvsub lt!190649 lt!190662))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4354 (_ BitVec 64)) Bool)

(assert (=> d!39404 (moveBitIndexPrecond!0 (_2!5381 lt!190667) (bvsub lt!190649 lt!190662))))

(assert (=> d!39404 (= (withMovedBitIndex!0 (_2!5381 lt!190667) (bvsub lt!190649 lt!190662)) lt!191691)))

(declare-fun b!122036 () Bool)

(assert (=> b!122036 (= e!79920 (= (size!2440 (buf!2877 (_2!5381 lt!190667))) (size!2440 (buf!2877 lt!191691))))))

(assert (= (and d!39404 res!101092) b!122036))

(declare-fun m!185245 () Bool)

(assert (=> d!39404 m!185245))

(declare-fun m!185247 () Bool)

(assert (=> d!39404 m!185247))

(declare-fun m!185249 () Bool)

(assert (=> d!39404 m!185249))

(declare-fun m!185251 () Bool)

(assert (=> d!39404 m!185251))

(assert (=> b!121656 d!39404))

(declare-fun d!39406 () Bool)

(declare-fun e!79921 () Bool)

(assert (=> d!39406 e!79921))

(declare-fun res!101093 () Bool)

(assert (=> d!39406 (=> (not res!101093) (not e!79921))))

(declare-fun lt!191694 () (_ BitVec 64))

(declare-fun lt!191693 () BitStream!4354)

(assert (=> d!39406 (= res!101093 (= (bvadd lt!191694 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2440 (buf!2877 lt!191693)) (currentByte!5568 lt!191693) (currentBit!5563 lt!191693))))))

(assert (=> d!39406 (or (not (= (bvand lt!191694 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!191694 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!191694 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39406 (= lt!191694 (bitIndex!0 (size!2440 (buf!2877 (_1!5381 lt!190667))) (currentByte!5568 (_1!5381 lt!190667)) (currentBit!5563 (_1!5381 lt!190667))))))

(assert (=> d!39406 (= lt!191693 (_2!5379 (moveBitIndex!0 (_1!5381 lt!190667) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!39406 (moveBitIndexPrecond!0 (_1!5381 lt!190667) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!39406 (= (withMovedBitIndex!0 (_1!5381 lt!190667) #b0000000000000000000000000000000000000000000000000000000000000001) lt!191693)))

(declare-fun b!122037 () Bool)

(assert (=> b!122037 (= e!79921 (= (size!2440 (buf!2877 (_1!5381 lt!190667))) (size!2440 (buf!2877 lt!191693))))))

(assert (= (and d!39406 res!101093) b!122037))

(declare-fun m!185253 () Bool)

(assert (=> d!39406 m!185253))

(declare-fun m!185255 () Bool)

(assert (=> d!39406 m!185255))

(declare-fun m!185257 () Bool)

(assert (=> d!39406 m!185257))

(declare-fun m!185259 () Bool)

(assert (=> d!39406 m!185259))

(assert (=> b!121656 d!39406))

(declare-fun d!39408 () Bool)

(declare-fun e!79922 () Bool)

(assert (=> d!39408 e!79922))

(declare-fun res!101095 () Bool)

(assert (=> d!39408 (=> (not res!101095) (not e!79922))))

(declare-fun lt!191697 () (_ BitVec 64))

(declare-fun lt!191699 () (_ BitVec 64))

(declare-fun lt!191698 () (_ BitVec 64))

(assert (=> d!39408 (= res!101095 (= lt!191698 (bvsub lt!191699 lt!191697)))))

(assert (=> d!39408 (or (= (bvand lt!191699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191697 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!191699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!191699 lt!191697) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39408 (= lt!191697 (remainingBits!0 ((_ sign_extend 32) (size!2440 (buf!2877 (_2!5379 lt!190664)))) ((_ sign_extend 32) (currentByte!5568 (_2!5379 lt!190664))) ((_ sign_extend 32) (currentBit!5563 (_2!5379 lt!190664)))))))

(declare-fun lt!191700 () (_ BitVec 64))

(declare-fun lt!191696 () (_ BitVec 64))

(assert (=> d!39408 (= lt!191699 (bvmul lt!191700 lt!191696))))

(assert (=> d!39408 (or (= lt!191700 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!191696 (bvsdiv (bvmul lt!191700 lt!191696) lt!191700)))))

(assert (=> d!39408 (= lt!191696 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39408 (= lt!191700 ((_ sign_extend 32) (size!2440 (buf!2877 (_2!5379 lt!190664)))))))

(assert (=> d!39408 (= lt!191698 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5568 (_2!5379 lt!190664))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5563 (_2!5379 lt!190664)))))))

(assert (=> d!39408 (invariant!0 (currentBit!5563 (_2!5379 lt!190664)) (currentByte!5568 (_2!5379 lt!190664)) (size!2440 (buf!2877 (_2!5379 lt!190664))))))

(assert (=> d!39408 (= (bitIndex!0 (size!2440 (buf!2877 (_2!5379 lt!190664))) (currentByte!5568 (_2!5379 lt!190664)) (currentBit!5563 (_2!5379 lt!190664))) lt!191698)))

(declare-fun b!122038 () Bool)

(declare-fun res!101094 () Bool)

(assert (=> b!122038 (=> (not res!101094) (not e!79922))))

(assert (=> b!122038 (= res!101094 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!191698))))

(declare-fun b!122039 () Bool)

(declare-fun lt!191695 () (_ BitVec 64))

(assert (=> b!122039 (= e!79922 (bvsle lt!191698 (bvmul lt!191695 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!122039 (or (= lt!191695 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!191695 #b0000000000000000000000000000000000000000000000000000000000001000) lt!191695)))))

(assert (=> b!122039 (= lt!191695 ((_ sign_extend 32) (size!2440 (buf!2877 (_2!5379 lt!190664)))))))

(assert (= (and d!39408 res!101095) b!122038))

(assert (= (and b!122038 res!101094) b!122039))

(declare-fun m!185261 () Bool)

(assert (=> d!39408 m!185261))

(declare-fun m!185263 () Bool)

(assert (=> d!39408 m!185263))

(assert (=> b!121656 d!39408))

(declare-fun d!39410 () Bool)

(declare-fun e!79923 () Bool)

(assert (=> d!39410 e!79923))

(declare-fun res!101096 () Bool)

(assert (=> d!39410 (=> (not res!101096) (not e!79923))))

(declare-fun lt!191702 () (_ BitVec 64))

(declare-fun lt!191701 () BitStream!4354)

(assert (=> d!39410 (= res!101096 (= (bvadd lt!191702 (bvsub lt!190656 lt!190662)) (bitIndex!0 (size!2440 (buf!2877 lt!191701)) (currentByte!5568 lt!191701) (currentBit!5563 lt!191701))))))

(assert (=> d!39410 (or (not (= (bvand lt!191702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!190656 lt!190662) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!191702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!191702 (bvsub lt!190656 lt!190662)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39410 (= lt!191702 (bitIndex!0 (size!2440 (buf!2877 (_2!5381 lt!190646))) (currentByte!5568 (_2!5381 lt!190646)) (currentBit!5563 (_2!5381 lt!190646))))))

(assert (=> d!39410 (= lt!191701 (_2!5379 (moveBitIndex!0 (_2!5381 lt!190646) (bvsub lt!190656 lt!190662))))))

(assert (=> d!39410 (moveBitIndexPrecond!0 (_2!5381 lt!190646) (bvsub lt!190656 lt!190662))))

(assert (=> d!39410 (= (withMovedBitIndex!0 (_2!5381 lt!190646) (bvsub lt!190656 lt!190662)) lt!191701)))

(declare-fun b!122040 () Bool)

(assert (=> b!122040 (= e!79923 (= (size!2440 (buf!2877 (_2!5381 lt!190646))) (size!2440 (buf!2877 lt!191701))))))

(assert (= (and d!39410 res!101096) b!122040))

(declare-fun m!185265 () Bool)

(assert (=> d!39410 m!185265))

(declare-fun m!185267 () Bool)

(assert (=> d!39410 m!185267))

(declare-fun m!185269 () Bool)

(assert (=> d!39410 m!185269))

(declare-fun m!185271 () Bool)

(assert (=> d!39410 m!185271))

(assert (=> b!121656 d!39410))

(declare-fun d!39412 () Bool)

(declare-fun lt!191784 () tuple2!10234)

(declare-fun lt!191786 () tuple2!10234)

(assert (=> d!39412 (and (= (_2!5382 lt!191784) (_2!5382 lt!191786)) (= (_1!5382 lt!191784) (_1!5382 lt!191786)))))

(declare-fun lt!191788 () Bool)

(declare-fun lt!191787 () (_ BitVec 64))

(declare-fun lt!191789 () Unit!7495)

(declare-fun lt!191785 () BitStream!4354)

(declare-fun choose!45 (BitStream!4354 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!10234 tuple2!10234 BitStream!4354 (_ BitVec 64) Bool BitStream!4354 (_ BitVec 64) tuple2!10234 tuple2!10234 BitStream!4354 (_ BitVec 64)) Unit!7495)

(assert (=> d!39412 (= lt!191789 (choose!45 (_1!5381 lt!190667) nBits!396 i!615 lt!190658 lt!191784 (tuple2!10235 (_1!5382 lt!191784) (_2!5382 lt!191784)) (_1!5382 lt!191784) (_2!5382 lt!191784) lt!191788 lt!191785 lt!191787 lt!191786 (tuple2!10235 (_1!5382 lt!191786) (_2!5382 lt!191786)) (_1!5382 lt!191786) (_2!5382 lt!191786)))))

(assert (=> d!39412 (= lt!191786 (readNLeastSignificantBitsLoopPure!0 lt!191785 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!191787))))

(assert (=> d!39412 (= lt!191787 (bvor lt!190658 (ite lt!191788 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39412 (= lt!191785 (withMovedBitIndex!0 (_1!5381 lt!190667) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!39412 (= lt!191788 (_2!5380 (readBitPure!0 (_1!5381 lt!190667))))))

(assert (=> d!39412 (= lt!191784 (readNLeastSignificantBitsLoopPure!0 (_1!5381 lt!190667) nBits!396 i!615 lt!190658))))

(assert (=> d!39412 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5381 lt!190667) nBits!396 i!615 lt!190658) lt!191789)))

(declare-fun bs!9533 () Bool)

(assert (= bs!9533 d!39412))

(declare-fun m!185315 () Bool)

(assert (=> bs!9533 m!185315))

(assert (=> bs!9533 m!184459))

(assert (=> bs!9533 m!184483))

(assert (=> bs!9533 m!184439))

(declare-fun m!185317 () Bool)

(assert (=> bs!9533 m!185317))

(assert (=> b!121656 d!39412))

(assert (=> b!121656 d!39398))

(assert (=> b!121656 d!39400))

(declare-fun d!39424 () Bool)

(assert (=> d!39424 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5563 thiss!1305) (currentByte!5568 thiss!1305) (size!2440 (buf!2877 thiss!1305))))))

(declare-fun bs!9534 () Bool)

(assert (= bs!9534 d!39424))

(assert (=> bs!9534 m!185241))

(assert (=> start!24038 d!39424))

(declare-fun d!39426 () Bool)

(assert (=> d!39426 (= (invariant!0 (currentBit!5563 thiss!1305) (currentByte!5568 thiss!1305) (size!2440 (buf!2877 (_2!5379 lt!190664)))) (and (bvsge (currentBit!5563 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5563 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5568 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5568 thiss!1305) (size!2440 (buf!2877 (_2!5379 lt!190664)))) (and (= (currentBit!5563 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5568 thiss!1305) (size!2440 (buf!2877 (_2!5379 lt!190664))))))))))

(assert (=> b!121657 d!39426))

(declare-fun d!39428 () Bool)

(assert (=> d!39428 (= (invariant!0 (currentBit!5563 thiss!1305) (currentByte!5568 thiss!1305) (size!2440 (buf!2877 (_2!5379 lt!190643)))) (and (bvsge (currentBit!5563 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5563 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5568 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5568 thiss!1305) (size!2440 (buf!2877 (_2!5379 lt!190643)))) (and (= (currentBit!5563 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5568 thiss!1305) (size!2440 (buf!2877 (_2!5379 lt!190643))))))))))

(assert (=> b!121659 d!39428))

(push 1)

(assert (not b!121913))

(assert (not b!121968))

(assert (not b!121961))

(assert (not d!39370))

(assert (not d!39270))

(assert (not d!39380))

(assert (not b!122027))

(assert (not b!121911))

(assert (not b!121915))

(assert (not b!121967))

(assert (not b!121969))

(assert (not d!39368))

(assert (not d!39392))

(assert (not d!39408))

(assert (not b!121905))

(assert (not d!39256))

(assert (not b!121906))

(assert (not b!121962))

(assert (not d!39410))

(assert (not d!39346))

(assert (not b!121917))

(assert (not b!121936))

(assert (not d!39268))

(assert (not b!121958))

(assert (not d!39412))

(assert (not d!39398))

(assert (not b!122029))

(assert (not d!39264))

(assert (not b!122020))

(assert (not b!121792))

(assert (not d!39374))

(assert (not b!122021))

(assert (not d!39254))

(assert (not d!39400))

(assert (not d!39336))

(assert (not d!39404))

(assert (not d!39390))

(assert (not d!39378))

(assert (not b!122018))

(assert (not d!39382))

(assert (not b!121965))

(assert (not d!39272))

(assert (not d!39262))

(assert (not d!39424))

(assert (not b!121912))

(assert (not b!121934))

(assert (not d!39402))

(assert (not b!121908))

(assert (not b!121909))

(assert (not d!39372))

(assert (not d!39366))

(assert (not bm!1592))

(assert (not d!39406))

(assert (not b!122019))

(assert (not d!39376))

(assert (not b!121960))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

