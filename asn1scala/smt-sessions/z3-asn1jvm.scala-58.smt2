; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1108 () Bool)

(assert start!1108)

(declare-fun b!4678 () Bool)

(declare-fun res!6005 () Bool)

(declare-fun e!3068 () Bool)

(assert (=> b!4678 (=> (not res!6005) (not e!3068))))

(declare-datatypes ((array!371 0))(
  ( (array!372 (arr!548 (Array (_ BitVec 32) (_ BitVec 8))) (size!158 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!294 0))(
  ( (BitStream!295 (buf!479 array!371) (currentByte!1458 (_ BitVec 32)) (currentBit!1453 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!294)

(declare-datatypes ((Unit!366 0))(
  ( (Unit!367) )
))
(declare-datatypes ((tuple2!592 0))(
  ( (tuple2!593 (_1!312 Unit!366) (_2!312 BitStream!294)) )
))
(declare-fun lt!5600 () tuple2!592)

(declare-fun isPrefixOf!0 (BitStream!294 BitStream!294) Bool)

(assert (=> b!4678 (= res!6005 (isPrefixOf!0 thiss!1486 (_2!312 lt!5600)))))

(declare-fun b!4679 () Bool)

(declare-fun e!3066 () Bool)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((tuple2!594 0))(
  ( (tuple2!595 (_1!313 array!371) (_2!313 BitStream!294)) )
))
(declare-fun lt!5599 () tuple2!594)

(assert (=> b!4679 (= e!3066 (or (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle nBits!460 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!158 (_1!313 lt!5599)))))))))

(declare-fun b!4680 () Bool)

(declare-fun res!6010 () Bool)

(assert (=> b!4680 (=> (not res!6010) (not e!3068))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4680 (= res!6010 (= (bitIndex!0 (size!158 (buf!479 (_2!312 lt!5600))) (currentByte!1458 (_2!312 lt!5600)) (currentBit!1453 (_2!312 lt!5600))) (bvadd (bitIndex!0 (size!158 (buf!479 thiss!1486)) (currentByte!1458 thiss!1486) (currentBit!1453 thiss!1486)) nBits!460)))))

(declare-fun b!4681 () Bool)

(declare-fun res!6007 () Bool)

(declare-fun e!3067 () Bool)

(assert (=> b!4681 (=> (not res!6007) (not e!3067))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4681 (= res!6007 (validate_offset_bits!1 ((_ sign_extend 32) (size!158 (buf!479 thiss!1486))) ((_ sign_extend 32) (currentByte!1458 thiss!1486)) ((_ sign_extend 32) (currentBit!1453 thiss!1486)) nBits!460))))

(declare-fun b!4682 () Bool)

(assert (=> b!4682 (= e!3068 (not e!3066))))

(declare-fun res!6008 () Bool)

(assert (=> b!4682 (=> res!6008 e!3066)))

(declare-datatypes ((List!58 0))(
  ( (Nil!55) (Cons!54 (h!173 Bool) (t!808 List!58)) )
))
(declare-fun lt!5598 () List!58)

(declare-fun byteArrayBitContentToList!0 (BitStream!294 array!371 (_ BitVec 64) (_ BitVec 64)) List!58)

(assert (=> b!4682 (= res!6008 (not (= (byteArrayBitContentToList!0 (_2!312 lt!5600) (_1!313 lt!5599) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!5598)))))

(declare-datatypes ((tuple2!596 0))(
  ( (tuple2!597 (_1!314 BitStream!294) (_2!314 BitStream!294)) )
))
(declare-fun lt!5596 () tuple2!596)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!294 BitStream!294 (_ BitVec 64)) List!58)

(assert (=> b!4682 (= lt!5598 (bitStreamReadBitsIntoList!0 (_2!312 lt!5600) (_1!314 lt!5596) nBits!460))))

(declare-fun readBits!0 (BitStream!294 (_ BitVec 64)) tuple2!594)

(assert (=> b!4682 (= lt!5599 (readBits!0 (_1!314 lt!5596) nBits!460))))

(assert (=> b!4682 (validate_offset_bits!1 ((_ sign_extend 32) (size!158 (buf!479 (_2!312 lt!5600)))) ((_ sign_extend 32) (currentByte!1458 thiss!1486)) ((_ sign_extend 32) (currentBit!1453 thiss!1486)) nBits!460)))

(declare-fun lt!5597 () Unit!366)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!294 array!371 (_ BitVec 64)) Unit!366)

(assert (=> b!4682 (= lt!5597 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!479 (_2!312 lt!5600)) nBits!460))))

(declare-fun reader!0 (BitStream!294 BitStream!294) tuple2!596)

(assert (=> b!4682 (= lt!5596 (reader!0 thiss!1486 (_2!312 lt!5600)))))

(declare-fun b!4683 () Bool)

(declare-fun res!6003 () Bool)

(assert (=> b!4683 (=> res!6003 e!3066)))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!371)

(assert (=> b!4683 (= res!6003 (not (= lt!5598 (byteArrayBitContentToList!0 (_2!312 lt!5600) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!4684 () Bool)

(assert (=> b!4684 (= e!3067 e!3068)))

(declare-fun res!6004 () Bool)

(assert (=> b!4684 (=> (not res!6004) (not e!3068))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4684 (= res!6004 (invariant!0 (currentBit!1453 (_2!312 lt!5600)) (currentByte!1458 (_2!312 lt!5600)) (size!158 (buf!479 (_2!312 lt!5600)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!294 array!371 (_ BitVec 64) (_ BitVec 64)) tuple2!592)

(assert (=> b!4684 (= lt!5600 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!6009 () Bool)

(assert (=> start!1108 (=> (not res!6009) (not e!3067))))

(assert (=> start!1108 (= res!6009 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!158 srcBuffer!6))))))))

(assert (=> start!1108 e!3067))

(assert (=> start!1108 true))

(declare-fun array_inv!153 (array!371) Bool)

(assert (=> start!1108 (array_inv!153 srcBuffer!6)))

(declare-fun e!3070 () Bool)

(declare-fun inv!12 (BitStream!294) Bool)

(assert (=> start!1108 (and (inv!12 thiss!1486) e!3070)))

(declare-fun b!4685 () Bool)

(declare-fun res!6006 () Bool)

(assert (=> b!4685 (=> (not res!6006) (not e!3068))))

(assert (=> b!4685 (= res!6006 (= (size!158 (buf!479 thiss!1486)) (size!158 (buf!479 (_2!312 lt!5600)))))))

(declare-fun b!4686 () Bool)

(assert (=> b!4686 (= e!3070 (array_inv!153 (buf!479 thiss!1486)))))

(assert (= (and start!1108 res!6009) b!4681))

(assert (= (and b!4681 res!6007) b!4684))

(assert (= (and b!4684 res!6004) b!4685))

(assert (= (and b!4685 res!6006) b!4680))

(assert (= (and b!4680 res!6010) b!4678))

(assert (= (and b!4678 res!6005) b!4682))

(assert (= (and b!4682 (not res!6008)) b!4683))

(assert (= (and b!4683 (not res!6003)) b!4679))

(assert (= start!1108 b!4686))

(declare-fun m!5549 () Bool)

(assert (=> b!4681 m!5549))

(declare-fun m!5551 () Bool)

(assert (=> b!4683 m!5551))

(declare-fun m!5553 () Bool)

(assert (=> b!4680 m!5553))

(declare-fun m!5555 () Bool)

(assert (=> b!4680 m!5555))

(declare-fun m!5557 () Bool)

(assert (=> b!4686 m!5557))

(declare-fun m!5559 () Bool)

(assert (=> b!4682 m!5559))

(declare-fun m!5561 () Bool)

(assert (=> b!4682 m!5561))

(declare-fun m!5563 () Bool)

(assert (=> b!4682 m!5563))

(declare-fun m!5565 () Bool)

(assert (=> b!4682 m!5565))

(declare-fun m!5567 () Bool)

(assert (=> b!4682 m!5567))

(declare-fun m!5569 () Bool)

(assert (=> b!4682 m!5569))

(declare-fun m!5571 () Bool)

(assert (=> b!4678 m!5571))

(declare-fun m!5573 () Bool)

(assert (=> start!1108 m!5573))

(declare-fun m!5575 () Bool)

(assert (=> start!1108 m!5575))

(declare-fun m!5577 () Bool)

(assert (=> b!4684 m!5577))

(declare-fun m!5579 () Bool)

(assert (=> b!4684 m!5579))

(check-sat (not start!1108) (not b!4682) (not b!4684) (not b!4680) (not b!4683) (not b!4686) (not b!4678) (not b!4681))
(check-sat)
(get-model)

(declare-fun d!1784 () Bool)

(declare-fun e!3092 () Bool)

(assert (=> d!1784 e!3092))

(declare-fun res!6040 () Bool)

(assert (=> d!1784 (=> (not res!6040) (not e!3092))))

(declare-fun lt!5629 () (_ BitVec 64))

(declare-fun lt!5632 () (_ BitVec 64))

(declare-fun lt!5628 () (_ BitVec 64))

(assert (=> d!1784 (= res!6040 (= lt!5632 (bvsub lt!5628 lt!5629)))))

(assert (=> d!1784 (or (= (bvand lt!5628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!5629 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!5628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!5628 lt!5629) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1784 (= lt!5629 (remainingBits!0 ((_ sign_extend 32) (size!158 (buf!479 (_2!312 lt!5600)))) ((_ sign_extend 32) (currentByte!1458 (_2!312 lt!5600))) ((_ sign_extend 32) (currentBit!1453 (_2!312 lt!5600)))))))

(declare-fun lt!5633 () (_ BitVec 64))

(declare-fun lt!5631 () (_ BitVec 64))

(assert (=> d!1784 (= lt!5628 (bvmul lt!5633 lt!5631))))

(assert (=> d!1784 (or (= lt!5633 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!5631 (bvsdiv (bvmul lt!5633 lt!5631) lt!5633)))))

(assert (=> d!1784 (= lt!5631 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1784 (= lt!5633 ((_ sign_extend 32) (size!158 (buf!479 (_2!312 lt!5600)))))))

(assert (=> d!1784 (= lt!5632 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1458 (_2!312 lt!5600))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1453 (_2!312 lt!5600)))))))

(assert (=> d!1784 (invariant!0 (currentBit!1453 (_2!312 lt!5600)) (currentByte!1458 (_2!312 lt!5600)) (size!158 (buf!479 (_2!312 lt!5600))))))

(assert (=> d!1784 (= (bitIndex!0 (size!158 (buf!479 (_2!312 lt!5600))) (currentByte!1458 (_2!312 lt!5600)) (currentBit!1453 (_2!312 lt!5600))) lt!5632)))

(declare-fun b!4718 () Bool)

(declare-fun res!6039 () Bool)

(assert (=> b!4718 (=> (not res!6039) (not e!3092))))

(assert (=> b!4718 (= res!6039 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!5632))))

(declare-fun b!4719 () Bool)

(declare-fun lt!5630 () (_ BitVec 64))

(assert (=> b!4719 (= e!3092 (bvsle lt!5632 (bvmul lt!5630 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!4719 (or (= lt!5630 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!5630 #b0000000000000000000000000000000000000000000000000000000000001000) lt!5630)))))

(assert (=> b!4719 (= lt!5630 ((_ sign_extend 32) (size!158 (buf!479 (_2!312 lt!5600)))))))

(assert (= (and d!1784 res!6040) b!4718))

(assert (= (and b!4718 res!6039) b!4719))

(declare-fun m!5617 () Bool)

(assert (=> d!1784 m!5617))

(assert (=> d!1784 m!5577))

(assert (=> b!4680 d!1784))

(declare-fun d!1788 () Bool)

(declare-fun e!3093 () Bool)

(assert (=> d!1788 e!3093))

(declare-fun res!6042 () Bool)

(assert (=> d!1788 (=> (not res!6042) (not e!3093))))

(declare-fun lt!5634 () (_ BitVec 64))

(declare-fun lt!5638 () (_ BitVec 64))

(declare-fun lt!5635 () (_ BitVec 64))

(assert (=> d!1788 (= res!6042 (= lt!5638 (bvsub lt!5634 lt!5635)))))

(assert (=> d!1788 (or (= (bvand lt!5634 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!5635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!5634 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!5634 lt!5635) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1788 (= lt!5635 (remainingBits!0 ((_ sign_extend 32) (size!158 (buf!479 thiss!1486))) ((_ sign_extend 32) (currentByte!1458 thiss!1486)) ((_ sign_extend 32) (currentBit!1453 thiss!1486))))))

(declare-fun lt!5639 () (_ BitVec 64))

(declare-fun lt!5637 () (_ BitVec 64))

(assert (=> d!1788 (= lt!5634 (bvmul lt!5639 lt!5637))))

(assert (=> d!1788 (or (= lt!5639 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!5637 (bvsdiv (bvmul lt!5639 lt!5637) lt!5639)))))

(assert (=> d!1788 (= lt!5637 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1788 (= lt!5639 ((_ sign_extend 32) (size!158 (buf!479 thiss!1486))))))

(assert (=> d!1788 (= lt!5638 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1458 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1453 thiss!1486))))))

(assert (=> d!1788 (invariant!0 (currentBit!1453 thiss!1486) (currentByte!1458 thiss!1486) (size!158 (buf!479 thiss!1486)))))

(assert (=> d!1788 (= (bitIndex!0 (size!158 (buf!479 thiss!1486)) (currentByte!1458 thiss!1486) (currentBit!1453 thiss!1486)) lt!5638)))

(declare-fun b!4720 () Bool)

(declare-fun res!6041 () Bool)

(assert (=> b!4720 (=> (not res!6041) (not e!3093))))

(assert (=> b!4720 (= res!6041 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!5638))))

(declare-fun b!4721 () Bool)

(declare-fun lt!5636 () (_ BitVec 64))

(assert (=> b!4721 (= e!3093 (bvsle lt!5638 (bvmul lt!5636 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!4721 (or (= lt!5636 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!5636 #b0000000000000000000000000000000000000000000000000000000000001000) lt!5636)))))

(assert (=> b!4721 (= lt!5636 ((_ sign_extend 32) (size!158 (buf!479 thiss!1486))))))

(assert (= (and d!1788 res!6042) b!4720))

(assert (= (and b!4720 res!6041) b!4721))

(declare-fun m!5619 () Bool)

(assert (=> d!1788 m!5619))

(declare-fun m!5621 () Bool)

(assert (=> d!1788 m!5621))

(assert (=> b!4680 d!1788))

(declare-fun d!1790 () Bool)

(declare-fun c!200 () Bool)

(assert (=> d!1790 (= c!200 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!3096 () List!58)

(assert (=> d!1790 (= (byteArrayBitContentToList!0 (_2!312 lt!5600) srcBuffer!6 from!367 nBits!460) e!3096)))

(declare-fun b!4726 () Bool)

(assert (=> b!4726 (= e!3096 Nil!55)))

(declare-fun b!4727 () Bool)

(assert (=> b!4727 (= e!3096 (Cons!54 (not (= (bvand ((_ sign_extend 24) (select (arr!548 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!312 lt!5600) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!1790 c!200) b!4726))

(assert (= (and d!1790 (not c!200)) b!4727))

(declare-fun m!5623 () Bool)

(assert (=> b!4727 m!5623))

(declare-fun m!5625 () Bool)

(assert (=> b!4727 m!5625))

(declare-fun m!5627 () Bool)

(assert (=> b!4727 m!5627))

(assert (=> b!4683 d!1790))

(declare-fun d!1792 () Bool)

(declare-fun res!6049 () Bool)

(declare-fun e!3101 () Bool)

(assert (=> d!1792 (=> (not res!6049) (not e!3101))))

(assert (=> d!1792 (= res!6049 (= (size!158 (buf!479 thiss!1486)) (size!158 (buf!479 (_2!312 lt!5600)))))))

(assert (=> d!1792 (= (isPrefixOf!0 thiss!1486 (_2!312 lt!5600)) e!3101)))

(declare-fun b!4734 () Bool)

(declare-fun res!6050 () Bool)

(assert (=> b!4734 (=> (not res!6050) (not e!3101))))

(assert (=> b!4734 (= res!6050 (bvsle (bitIndex!0 (size!158 (buf!479 thiss!1486)) (currentByte!1458 thiss!1486) (currentBit!1453 thiss!1486)) (bitIndex!0 (size!158 (buf!479 (_2!312 lt!5600))) (currentByte!1458 (_2!312 lt!5600)) (currentBit!1453 (_2!312 lt!5600)))))))

(declare-fun b!4735 () Bool)

(declare-fun e!3102 () Bool)

(assert (=> b!4735 (= e!3101 e!3102)))

(declare-fun res!6051 () Bool)

(assert (=> b!4735 (=> res!6051 e!3102)))

(assert (=> b!4735 (= res!6051 (= (size!158 (buf!479 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!4736 () Bool)

(declare-fun arrayBitRangesEq!0 (array!371 array!371 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4736 (= e!3102 (arrayBitRangesEq!0 (buf!479 thiss!1486) (buf!479 (_2!312 lt!5600)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!158 (buf!479 thiss!1486)) (currentByte!1458 thiss!1486) (currentBit!1453 thiss!1486))))))

(assert (= (and d!1792 res!6049) b!4734))

(assert (= (and b!4734 res!6050) b!4735))

(assert (= (and b!4735 (not res!6051)) b!4736))

(assert (=> b!4734 m!5555))

(assert (=> b!4734 m!5553))

(assert (=> b!4736 m!5555))

(assert (=> b!4736 m!5555))

(declare-fun m!5629 () Bool)

(assert (=> b!4736 m!5629))

(assert (=> b!4678 d!1792))

(declare-fun d!1796 () Bool)

(assert (=> d!1796 (= (invariant!0 (currentBit!1453 (_2!312 lt!5600)) (currentByte!1458 (_2!312 lt!5600)) (size!158 (buf!479 (_2!312 lt!5600)))) (and (bvsge (currentBit!1453 (_2!312 lt!5600)) #b00000000000000000000000000000000) (bvslt (currentBit!1453 (_2!312 lt!5600)) #b00000000000000000000000000001000) (bvsge (currentByte!1458 (_2!312 lt!5600)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1458 (_2!312 lt!5600)) (size!158 (buf!479 (_2!312 lt!5600)))) (and (= (currentBit!1453 (_2!312 lt!5600)) #b00000000000000000000000000000000) (= (currentByte!1458 (_2!312 lt!5600)) (size!158 (buf!479 (_2!312 lt!5600))))))))))

(assert (=> b!4684 d!1796))

(declare-fun b!4807 () Bool)

(declare-fun res!6103 () Bool)

(declare-fun e!3131 () Bool)

(assert (=> b!4807 (=> (not res!6103) (not e!3131))))

(declare-fun lt!6013 () tuple2!592)

(assert (=> b!4807 (= res!6103 (= (size!158 (buf!479 thiss!1486)) (size!158 (buf!479 (_2!312 lt!6013)))))))

(declare-fun call!56 () tuple2!596)

(declare-fun bm!53 () Bool)

(declare-fun lt!6018 () tuple2!592)

(declare-fun c!212 () Bool)

(declare-fun lt!5998 () tuple2!592)

(assert (=> bm!53 (= call!56 (reader!0 (ite c!212 (_2!312 lt!5998) thiss!1486) (ite c!212 (_2!312 lt!6018) thiss!1486)))))

(declare-fun b!4809 () Bool)

(declare-fun res!6105 () Bool)

(assert (=> b!4809 (=> (not res!6105) (not e!3131))))

(assert (=> b!4809 (= res!6105 (= (size!158 (buf!479 (_2!312 lt!6013))) (size!158 (buf!479 thiss!1486))))))

(declare-fun b!4810 () Bool)

(declare-fun e!3132 () tuple2!592)

(declare-fun Unit!377 () Unit!366)

(assert (=> b!4810 (= e!3132 (tuple2!593 Unit!377 thiss!1486))))

(assert (=> b!4810 (= (size!158 (buf!479 thiss!1486)) (size!158 (buf!479 thiss!1486)))))

(declare-fun lt!6030 () Unit!366)

(declare-fun Unit!378 () Unit!366)

(assert (=> b!4810 (= lt!6030 Unit!378)))

(declare-fun checkByteArrayBitContent!0 (BitStream!294 array!371 array!371 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4810 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!313 (readBits!0 (_1!314 call!56) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!4811 () Bool)

(declare-fun res!6104 () Bool)

(assert (=> b!4811 (=> (not res!6104) (not e!3131))))

(assert (=> b!4811 (= res!6104 (invariant!0 (currentBit!1453 (_2!312 lt!6013)) (currentByte!1458 (_2!312 lt!6013)) (size!158 (buf!479 (_2!312 lt!6013)))))))

(declare-fun lt!6006 () tuple2!596)

(declare-fun b!4812 () Bool)

(assert (=> b!4812 (= e!3131 (= (bitStreamReadBitsIntoList!0 (_2!312 lt!6013) (_1!314 lt!6006) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!312 lt!6013) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!4812 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!4812 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!6025 () Unit!366)

(declare-fun lt!6011 () Unit!366)

(assert (=> b!4812 (= lt!6025 lt!6011)))

(declare-fun lt!6012 () (_ BitVec 64))

(assert (=> b!4812 (validate_offset_bits!1 ((_ sign_extend 32) (size!158 (buf!479 (_2!312 lt!6013)))) ((_ sign_extend 32) (currentByte!1458 thiss!1486)) ((_ sign_extend 32) (currentBit!1453 thiss!1486)) lt!6012)))

(assert (=> b!4812 (= lt!6011 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!479 (_2!312 lt!6013)) lt!6012))))

(declare-fun e!3130 () Bool)

(assert (=> b!4812 e!3130))

(declare-fun res!6100 () Bool)

(assert (=> b!4812 (=> (not res!6100) (not e!3130))))

(assert (=> b!4812 (= res!6100 (and (= (size!158 (buf!479 thiss!1486)) (size!158 (buf!479 (_2!312 lt!6013)))) (bvsge lt!6012 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!4812 (= lt!6012 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!4812 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!4812 (= lt!6006 (reader!0 thiss!1486 (_2!312 lt!6013)))))

(declare-fun b!4813 () Bool)

(assert (=> b!4813 (= e!3130 (validate_offset_bits!1 ((_ sign_extend 32) (size!158 (buf!479 thiss!1486))) ((_ sign_extend 32) (currentByte!1458 thiss!1486)) ((_ sign_extend 32) (currentBit!1453 thiss!1486)) lt!6012))))

(declare-fun b!4814 () Bool)

(declare-fun Unit!379 () Unit!366)

(assert (=> b!4814 (= e!3132 (tuple2!593 Unit!379 (_2!312 lt!6018)))))

(declare-fun appendBitFromByte!0 (BitStream!294 (_ BitVec 8) (_ BitVec 32)) tuple2!592)

(assert (=> b!4814 (= lt!5998 (appendBitFromByte!0 thiss!1486 (select (arr!548 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!6035 () (_ BitVec 64))

(assert (=> b!4814 (= lt!6035 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!6032 () (_ BitVec 64))

(assert (=> b!4814 (= lt!6032 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!6024 () Unit!366)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!294 BitStream!294 (_ BitVec 64) (_ BitVec 64)) Unit!366)

(assert (=> b!4814 (= lt!6024 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!312 lt!5998) lt!6035 lt!6032))))

(assert (=> b!4814 (validate_offset_bits!1 ((_ sign_extend 32) (size!158 (buf!479 (_2!312 lt!5998)))) ((_ sign_extend 32) (currentByte!1458 (_2!312 lt!5998))) ((_ sign_extend 32) (currentBit!1453 (_2!312 lt!5998))) (bvsub lt!6035 lt!6032))))

(declare-fun lt!6026 () Unit!366)

(assert (=> b!4814 (= lt!6026 lt!6024)))

(declare-fun lt!6031 () tuple2!596)

(assert (=> b!4814 (= lt!6031 (reader!0 thiss!1486 (_2!312 lt!5998)))))

(declare-fun lt!6016 () (_ BitVec 64))

(assert (=> b!4814 (= lt!6016 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!6010 () Unit!366)

(assert (=> b!4814 (= lt!6010 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!479 (_2!312 lt!5998)) lt!6016))))

(assert (=> b!4814 (validate_offset_bits!1 ((_ sign_extend 32) (size!158 (buf!479 (_2!312 lt!5998)))) ((_ sign_extend 32) (currentByte!1458 thiss!1486)) ((_ sign_extend 32) (currentBit!1453 thiss!1486)) lt!6016)))

(declare-fun lt!6028 () Unit!366)

(assert (=> b!4814 (= lt!6028 lt!6010)))

(declare-fun head!21 (List!58) Bool)

(assert (=> b!4814 (= (head!21 (byteArrayBitContentToList!0 (_2!312 lt!5998) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!21 (bitStreamReadBitsIntoList!0 (_2!312 lt!5998) (_1!314 lt!6031) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!6019 () Unit!366)

(declare-fun Unit!380 () Unit!366)

(assert (=> b!4814 (= lt!6019 Unit!380)))

(assert (=> b!4814 (= lt!6018 (appendBitsMSBFirstLoop!0 (_2!312 lt!5998) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!6003 () Unit!366)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!294 BitStream!294 BitStream!294) Unit!366)

(assert (=> b!4814 (= lt!6003 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!312 lt!5998) (_2!312 lt!6018)))))

(assert (=> b!4814 (isPrefixOf!0 thiss!1486 (_2!312 lt!6018))))

(declare-fun lt!6021 () Unit!366)

(assert (=> b!4814 (= lt!6021 lt!6003)))

(assert (=> b!4814 (= (size!158 (buf!479 (_2!312 lt!6018))) (size!158 (buf!479 thiss!1486)))))

(declare-fun lt!6002 () Unit!366)

(declare-fun Unit!381 () Unit!366)

(assert (=> b!4814 (= lt!6002 Unit!381)))

(assert (=> b!4814 (= (bitIndex!0 (size!158 (buf!479 (_2!312 lt!6018))) (currentByte!1458 (_2!312 lt!6018)) (currentBit!1453 (_2!312 lt!6018))) (bvsub (bvadd (bitIndex!0 (size!158 (buf!479 thiss!1486)) (currentByte!1458 thiss!1486) (currentBit!1453 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!6027 () Unit!366)

(declare-fun Unit!382 () Unit!366)

(assert (=> b!4814 (= lt!6027 Unit!382)))

(assert (=> b!4814 (= (bitIndex!0 (size!158 (buf!479 (_2!312 lt!6018))) (currentByte!1458 (_2!312 lt!6018)) (currentBit!1453 (_2!312 lt!6018))) (bvsub (bvsub (bvadd (bitIndex!0 (size!158 (buf!479 (_2!312 lt!5998))) (currentByte!1458 (_2!312 lt!5998)) (currentBit!1453 (_2!312 lt!5998))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!6001 () Unit!366)

(declare-fun Unit!383 () Unit!366)

(assert (=> b!4814 (= lt!6001 Unit!383)))

(declare-fun lt!6034 () tuple2!596)

(assert (=> b!4814 (= lt!6034 (reader!0 thiss!1486 (_2!312 lt!6018)))))

(declare-fun lt!5992 () (_ BitVec 64))

(assert (=> b!4814 (= lt!5992 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!6007 () Unit!366)

(assert (=> b!4814 (= lt!6007 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!479 (_2!312 lt!6018)) lt!5992))))

(assert (=> b!4814 (validate_offset_bits!1 ((_ sign_extend 32) (size!158 (buf!479 (_2!312 lt!6018)))) ((_ sign_extend 32) (currentByte!1458 thiss!1486)) ((_ sign_extend 32) (currentBit!1453 thiss!1486)) lt!5992)))

(declare-fun lt!6004 () Unit!366)

(assert (=> b!4814 (= lt!6004 lt!6007)))

(declare-fun lt!6008 () tuple2!596)

(assert (=> b!4814 (= lt!6008 call!56)))

(declare-fun lt!6015 () (_ BitVec 64))

(assert (=> b!4814 (= lt!6015 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!6023 () Unit!366)

(assert (=> b!4814 (= lt!6023 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!312 lt!5998) (buf!479 (_2!312 lt!6018)) lt!6015))))

(assert (=> b!4814 (validate_offset_bits!1 ((_ sign_extend 32) (size!158 (buf!479 (_2!312 lt!6018)))) ((_ sign_extend 32) (currentByte!1458 (_2!312 lt!5998))) ((_ sign_extend 32) (currentBit!1453 (_2!312 lt!5998))) lt!6015)))

(declare-fun lt!5994 () Unit!366)

(assert (=> b!4814 (= lt!5994 lt!6023)))

(declare-fun lt!6014 () List!58)

(assert (=> b!4814 (= lt!6014 (byteArrayBitContentToList!0 (_2!312 lt!6018) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!6005 () List!58)

(assert (=> b!4814 (= lt!6005 (byteArrayBitContentToList!0 (_2!312 lt!6018) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!6033 () List!58)

(assert (=> b!4814 (= lt!6033 (bitStreamReadBitsIntoList!0 (_2!312 lt!6018) (_1!314 lt!6034) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!5995 () List!58)

(assert (=> b!4814 (= lt!5995 (bitStreamReadBitsIntoList!0 (_2!312 lt!6018) (_1!314 lt!6008) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!5999 () (_ BitVec 64))

(assert (=> b!4814 (= lt!5999 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!6017 () Unit!366)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!294 BitStream!294 BitStream!294 BitStream!294 (_ BitVec 64) List!58) Unit!366)

(assert (=> b!4814 (= lt!6017 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!312 lt!6018) (_2!312 lt!6018) (_1!314 lt!6034) (_1!314 lt!6008) lt!5999 lt!6033))))

(declare-fun tail!29 (List!58) List!58)

(assert (=> b!4814 (= (bitStreamReadBitsIntoList!0 (_2!312 lt!6018) (_1!314 lt!6008) (bvsub lt!5999 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!29 lt!6033))))

(declare-fun lt!6020 () Unit!366)

(assert (=> b!4814 (= lt!6020 lt!6017)))

(declare-fun lt!5996 () Unit!366)

(declare-fun lt!6029 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!371 array!371 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!366)

(assert (=> b!4814 (= lt!5996 (arrayBitRangesEqImpliesEq!0 (buf!479 (_2!312 lt!5998)) (buf!479 (_2!312 lt!6018)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!6029 (bitIndex!0 (size!158 (buf!479 (_2!312 lt!5998))) (currentByte!1458 (_2!312 lt!5998)) (currentBit!1453 (_2!312 lt!5998)))))))

(declare-fun bitAt!0 (array!371 (_ BitVec 64)) Bool)

(assert (=> b!4814 (= (bitAt!0 (buf!479 (_2!312 lt!5998)) lt!6029) (bitAt!0 (buf!479 (_2!312 lt!6018)) lt!6029))))

(declare-fun lt!5997 () Unit!366)

(assert (=> b!4814 (= lt!5997 lt!5996)))

(declare-fun b!4808 () Bool)

(declare-fun res!6102 () Bool)

(assert (=> b!4808 (=> (not res!6102) (not e!3131))))

(assert (=> b!4808 (= res!6102 (isPrefixOf!0 thiss!1486 (_2!312 lt!6013)))))

(declare-fun d!1800 () Bool)

(assert (=> d!1800 e!3131))

(declare-fun res!6101 () Bool)

(assert (=> d!1800 (=> (not res!6101) (not e!3131))))

(declare-fun lt!5993 () (_ BitVec 64))

(assert (=> d!1800 (= res!6101 (= (bitIndex!0 (size!158 (buf!479 (_2!312 lt!6013))) (currentByte!1458 (_2!312 lt!6013)) (currentBit!1453 (_2!312 lt!6013))) (bvsub lt!5993 from!367)))))

(assert (=> d!1800 (or (= (bvand lt!5993 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!5993 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!5993 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!6022 () (_ BitVec 64))

(assert (=> d!1800 (= lt!5993 (bvadd lt!6022 from!367 nBits!460))))

(assert (=> d!1800 (or (not (= (bvand lt!6022 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!6022 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!6022 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1800 (= lt!6022 (bitIndex!0 (size!158 (buf!479 thiss!1486)) (currentByte!1458 thiss!1486) (currentBit!1453 thiss!1486)))))

(assert (=> d!1800 (= lt!6013 e!3132)))

(assert (=> d!1800 (= c!212 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!6009 () Unit!366)

(declare-fun lt!6000 () Unit!366)

(assert (=> d!1800 (= lt!6009 lt!6000)))

(assert (=> d!1800 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!294) Unit!366)

(assert (=> d!1800 (= lt!6000 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1800 (= lt!6029 (bitIndex!0 (size!158 (buf!479 thiss!1486)) (currentByte!1458 thiss!1486) (currentBit!1453 thiss!1486)))))

(assert (=> d!1800 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1800 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!6013)))

(assert (= (and d!1800 c!212) b!4814))

(assert (= (and d!1800 (not c!212)) b!4810))

(assert (= (or b!4814 b!4810) bm!53))

(assert (= (and d!1800 res!6101) b!4811))

(assert (= (and b!4811 res!6104) b!4807))

(assert (= (and b!4807 res!6103) b!4808))

(assert (= (and b!4808 res!6102) b!4809))

(assert (= (and b!4809 res!6105) b!4812))

(assert (= (and b!4812 res!6100) b!4813))

(declare-fun m!5823 () Bool)

(assert (=> b!4811 m!5823))

(declare-fun m!5825 () Bool)

(assert (=> d!1800 m!5825))

(assert (=> d!1800 m!5555))

(declare-fun m!5827 () Bool)

(assert (=> d!1800 m!5827))

(declare-fun m!5829 () Bool)

(assert (=> d!1800 m!5829))

(declare-fun m!5831 () Bool)

(assert (=> b!4810 m!5831))

(declare-fun m!5833 () Bool)

(assert (=> b!4810 m!5833))

(assert (=> b!4814 m!5623))

(declare-fun m!5835 () Bool)

(assert (=> b!4814 m!5835))

(declare-fun m!5837 () Bool)

(assert (=> b!4814 m!5837))

(declare-fun m!5839 () Bool)

(assert (=> b!4814 m!5839))

(declare-fun m!5841 () Bool)

(assert (=> b!4814 m!5841))

(assert (=> b!4814 m!5555))

(declare-fun m!5843 () Bool)

(assert (=> b!4814 m!5843))

(declare-fun m!5845 () Bool)

(assert (=> b!4814 m!5845))

(declare-fun m!5847 () Bool)

(assert (=> b!4814 m!5847))

(declare-fun m!5849 () Bool)

(assert (=> b!4814 m!5849))

(declare-fun m!5851 () Bool)

(assert (=> b!4814 m!5851))

(declare-fun m!5853 () Bool)

(assert (=> b!4814 m!5853))

(declare-fun m!5855 () Bool)

(assert (=> b!4814 m!5855))

(declare-fun m!5857 () Bool)

(assert (=> b!4814 m!5857))

(declare-fun m!5859 () Bool)

(assert (=> b!4814 m!5859))

(declare-fun m!5861 () Bool)

(assert (=> b!4814 m!5861))

(assert (=> b!4814 m!5835))

(assert (=> b!4814 m!5853))

(declare-fun m!5863 () Bool)

(assert (=> b!4814 m!5863))

(declare-fun m!5865 () Bool)

(assert (=> b!4814 m!5865))

(declare-fun m!5867 () Bool)

(assert (=> b!4814 m!5867))

(declare-fun m!5869 () Bool)

(assert (=> b!4814 m!5869))

(declare-fun m!5871 () Bool)

(assert (=> b!4814 m!5871))

(declare-fun m!5873 () Bool)

(assert (=> b!4814 m!5873))

(declare-fun m!5875 () Bool)

(assert (=> b!4814 m!5875))

(declare-fun m!5877 () Bool)

(assert (=> b!4814 m!5877))

(assert (=> b!4814 m!5623))

(declare-fun m!5879 () Bool)

(assert (=> b!4814 m!5879))

(declare-fun m!5881 () Bool)

(assert (=> b!4814 m!5881))

(declare-fun m!5883 () Bool)

(assert (=> b!4814 m!5883))

(declare-fun m!5885 () Bool)

(assert (=> b!4814 m!5885))

(declare-fun m!5887 () Bool)

(assert (=> b!4814 m!5887))

(declare-fun m!5889 () Bool)

(assert (=> b!4814 m!5889))

(declare-fun m!5891 () Bool)

(assert (=> b!4814 m!5891))

(declare-fun m!5893 () Bool)

(assert (=> b!4814 m!5893))

(assert (=> b!4814 m!5845))

(declare-fun m!5895 () Bool)

(assert (=> b!4813 m!5895))

(declare-fun m!5897 () Bool)

(assert (=> b!4812 m!5897))

(declare-fun m!5899 () Bool)

(assert (=> b!4812 m!5899))

(declare-fun m!5901 () Bool)

(assert (=> b!4812 m!5901))

(declare-fun m!5903 () Bool)

(assert (=> b!4812 m!5903))

(declare-fun m!5905 () Bool)

(assert (=> b!4812 m!5905))

(declare-fun m!5907 () Bool)

(assert (=> b!4808 m!5907))

(declare-fun m!5909 () Bool)

(assert (=> bm!53 m!5909))

(assert (=> b!4684 d!1800))

(declare-fun d!1816 () Bool)

(assert (=> d!1816 (validate_offset_bits!1 ((_ sign_extend 32) (size!158 (buf!479 (_2!312 lt!5600)))) ((_ sign_extend 32) (currentByte!1458 thiss!1486)) ((_ sign_extend 32) (currentBit!1453 thiss!1486)) nBits!460)))

(declare-fun lt!6060 () Unit!366)

(declare-fun choose!9 (BitStream!294 array!371 (_ BitVec 64) BitStream!294) Unit!366)

(assert (=> d!1816 (= lt!6060 (choose!9 thiss!1486 (buf!479 (_2!312 lt!5600)) nBits!460 (BitStream!295 (buf!479 (_2!312 lt!5600)) (currentByte!1458 thiss!1486) (currentBit!1453 thiss!1486))))))

(assert (=> d!1816 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!479 (_2!312 lt!5600)) nBits!460) lt!6060)))

(declare-fun bs!667 () Bool)

(assert (= bs!667 d!1816))

(assert (=> bs!667 m!5569))

(declare-fun m!5911 () Bool)

(assert (=> bs!667 m!5911))

(assert (=> b!4682 d!1816))

(declare-fun d!1818 () Bool)

(declare-fun e!3144 () Bool)

(assert (=> d!1818 e!3144))

(declare-fun res!6140 () Bool)

(assert (=> d!1818 (=> (not res!6140) (not e!3144))))

(declare-fun lt!6150 () tuple2!594)

(assert (=> d!1818 (= res!6140 (= (buf!479 (_2!313 lt!6150)) (buf!479 (_1!314 lt!5596))))))

(declare-datatypes ((tuple3!32 0))(
  ( (tuple3!33 (_1!318 Unit!366) (_2!318 BitStream!294) (_3!16 array!371)) )
))
(declare-fun lt!6145 () tuple3!32)

(assert (=> d!1818 (= lt!6150 (tuple2!595 (_3!16 lt!6145) (_2!318 lt!6145)))))

(declare-fun readBitsLoop!0 (BitStream!294 (_ BitVec 64) array!371 (_ BitVec 64) (_ BitVec 64)) tuple3!32)

(assert (=> d!1818 (= lt!6145 (readBitsLoop!0 (_1!314 lt!5596) nBits!460 (array!372 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!1818 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!1818 (= (readBits!0 (_1!314 lt!5596) nBits!460) lt!6150)))

(declare-fun b!4855 () Bool)

(declare-fun res!6142 () Bool)

(assert (=> b!4855 (=> (not res!6142) (not e!3144))))

(assert (=> b!4855 (= res!6142 (bvsle (currentByte!1458 (_1!314 lt!5596)) (currentByte!1458 (_2!313 lt!6150))))))

(declare-fun b!4856 () Bool)

(declare-fun res!6141 () Bool)

(assert (=> b!4856 (=> (not res!6141) (not e!3144))))

(assert (=> b!4856 (= res!6141 (invariant!0 (currentBit!1453 (_2!313 lt!6150)) (currentByte!1458 (_2!313 lt!6150)) (size!158 (buf!479 (_2!313 lt!6150)))))))

(declare-fun b!4857 () Bool)

(declare-fun res!6143 () Bool)

(assert (=> b!4857 (=> (not res!6143) (not e!3144))))

(declare-fun lt!6146 () (_ BitVec 64))

(assert (=> b!4857 (= res!6143 (= (bvadd lt!6146 nBits!460) (bitIndex!0 (size!158 (buf!479 (_2!313 lt!6150))) (currentByte!1458 (_2!313 lt!6150)) (currentBit!1453 (_2!313 lt!6150)))))))

(assert (=> b!4857 (or (not (= (bvand lt!6146 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!6146 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!6146 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!4857 (= lt!6146 (bitIndex!0 (size!158 (buf!479 (_1!314 lt!5596))) (currentByte!1458 (_1!314 lt!5596)) (currentBit!1453 (_1!314 lt!5596))))))

(declare-fun b!4858 () Bool)

(declare-fun res!6144 () Bool)

(assert (=> b!4858 (=> (not res!6144) (not e!3144))))

(declare-fun lt!6147 () (_ BitVec 64))

(assert (=> b!4858 (= res!6144 (= (size!158 (_1!313 lt!6150)) ((_ extract 31 0) lt!6147)))))

(assert (=> b!4858 (and (bvslt lt!6147 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!6147 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!6151 () (_ BitVec 64))

(declare-fun lt!6144 () (_ BitVec 64))

(assert (=> b!4858 (= lt!6147 (bvsdiv lt!6151 lt!6144))))

(assert (=> b!4858 (and (not (= lt!6144 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!6151 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!6144 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!4858 (= lt!6144 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!6149 () (_ BitVec 64))

(declare-fun lt!6148 () (_ BitVec 64))

(assert (=> b!4858 (= lt!6151 (bvsub lt!6149 lt!6148))))

(assert (=> b!4858 (or (= (bvand lt!6149 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!6148 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!6149 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!6149 lt!6148) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!4858 (= lt!6148 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!6152 () (_ BitVec 64))

(assert (=> b!4858 (= lt!6149 (bvadd nBits!460 lt!6152))))

(assert (=> b!4858 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!6152 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!6152) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!4858 (= lt!6152 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!4859 () Bool)

(assert (=> b!4859 (= e!3144 (= (byteArrayBitContentToList!0 (_2!313 lt!6150) (_1!313 lt!6150) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!313 lt!6150) (_1!314 lt!5596) nBits!460)))))

(assert (= (and d!1818 res!6140) b!4857))

(assert (= (and b!4857 res!6143) b!4856))

(assert (= (and b!4856 res!6141) b!4858))

(assert (= (and b!4858 res!6144) b!4855))

(assert (= (and b!4855 res!6142) b!4859))

(declare-fun m!5951 () Bool)

(assert (=> d!1818 m!5951))

(declare-fun m!5953 () Bool)

(assert (=> b!4856 m!5953))

(declare-fun m!5955 () Bool)

(assert (=> b!4857 m!5955))

(declare-fun m!5957 () Bool)

(assert (=> b!4857 m!5957))

(declare-fun m!5959 () Bool)

(assert (=> b!4859 m!5959))

(declare-fun m!5961 () Bool)

(assert (=> b!4859 m!5961))

(assert (=> b!4682 d!1818))

(declare-fun b!4924 () Bool)

(declare-fun res!6177 () Bool)

(declare-fun e!3174 () Bool)

(assert (=> b!4924 (=> (not res!6177) (not e!3174))))

(declare-fun lt!6249 () tuple2!596)

(assert (=> b!4924 (= res!6177 (isPrefixOf!0 (_1!314 lt!6249) thiss!1486))))

(declare-fun b!4925 () Bool)

(declare-fun e!3173 () Unit!366)

(declare-fun lt!6259 () Unit!366)

(assert (=> b!4925 (= e!3173 lt!6259)))

(declare-fun lt!6251 () (_ BitVec 64))

(assert (=> b!4925 (= lt!6251 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6255 () (_ BitVec 64))

(assert (=> b!4925 (= lt!6255 (bitIndex!0 (size!158 (buf!479 thiss!1486)) (currentByte!1458 thiss!1486) (currentBit!1453 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!371 array!371 (_ BitVec 64) (_ BitVec 64)) Unit!366)

(assert (=> b!4925 (= lt!6259 (arrayBitRangesEqSymmetric!0 (buf!479 thiss!1486) (buf!479 (_2!312 lt!5600)) lt!6251 lt!6255))))

(assert (=> b!4925 (arrayBitRangesEq!0 (buf!479 (_2!312 lt!5600)) (buf!479 thiss!1486) lt!6251 lt!6255)))

(declare-fun lt!6258 () (_ BitVec 64))

(declare-fun lt!6254 () (_ BitVec 64))

(declare-fun b!4926 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!294 (_ BitVec 64)) BitStream!294)

(assert (=> b!4926 (= e!3174 (= (_1!314 lt!6249) (withMovedBitIndex!0 (_2!314 lt!6249) (bvsub lt!6258 lt!6254))))))

(assert (=> b!4926 (or (= (bvand lt!6258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!6254 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!6258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!6258 lt!6254) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!4926 (= lt!6254 (bitIndex!0 (size!158 (buf!479 (_2!312 lt!5600))) (currentByte!1458 (_2!312 lt!5600)) (currentBit!1453 (_2!312 lt!5600))))))

(assert (=> b!4926 (= lt!6258 (bitIndex!0 (size!158 (buf!479 thiss!1486)) (currentByte!1458 thiss!1486) (currentBit!1453 thiss!1486)))))

(declare-fun b!4928 () Bool)

(declare-fun res!6175 () Bool)

(assert (=> b!4928 (=> (not res!6175) (not e!3174))))

(assert (=> b!4928 (= res!6175 (isPrefixOf!0 (_2!314 lt!6249) (_2!312 lt!5600)))))

(declare-fun d!1824 () Bool)

(assert (=> d!1824 e!3174))

(declare-fun res!6176 () Bool)

(assert (=> d!1824 (=> (not res!6176) (not e!3174))))

(assert (=> d!1824 (= res!6176 (isPrefixOf!0 (_1!314 lt!6249) (_2!314 lt!6249)))))

(declare-fun lt!6243 () BitStream!294)

(assert (=> d!1824 (= lt!6249 (tuple2!597 lt!6243 (_2!312 lt!5600)))))

(declare-fun lt!6242 () Unit!366)

(declare-fun lt!6246 () Unit!366)

(assert (=> d!1824 (= lt!6242 lt!6246)))

(assert (=> d!1824 (isPrefixOf!0 lt!6243 (_2!312 lt!5600))))

(assert (=> d!1824 (= lt!6246 (lemmaIsPrefixTransitive!0 lt!6243 (_2!312 lt!5600) (_2!312 lt!5600)))))

(declare-fun lt!6245 () Unit!366)

(declare-fun lt!6250 () Unit!366)

(assert (=> d!1824 (= lt!6245 lt!6250)))

(assert (=> d!1824 (isPrefixOf!0 lt!6243 (_2!312 lt!5600))))

(assert (=> d!1824 (= lt!6250 (lemmaIsPrefixTransitive!0 lt!6243 thiss!1486 (_2!312 lt!5600)))))

(declare-fun lt!6248 () Unit!366)

(assert (=> d!1824 (= lt!6248 e!3173)))

(declare-fun c!233 () Bool)

(assert (=> d!1824 (= c!233 (not (= (size!158 (buf!479 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!6247 () Unit!366)

(declare-fun lt!6260 () Unit!366)

(assert (=> d!1824 (= lt!6247 lt!6260)))

(assert (=> d!1824 (isPrefixOf!0 (_2!312 lt!5600) (_2!312 lt!5600))))

(assert (=> d!1824 (= lt!6260 (lemmaIsPrefixRefl!0 (_2!312 lt!5600)))))

(declare-fun lt!6252 () Unit!366)

(declare-fun lt!6244 () Unit!366)

(assert (=> d!1824 (= lt!6252 lt!6244)))

(assert (=> d!1824 (= lt!6244 (lemmaIsPrefixRefl!0 (_2!312 lt!5600)))))

(declare-fun lt!6257 () Unit!366)

(declare-fun lt!6241 () Unit!366)

(assert (=> d!1824 (= lt!6257 lt!6241)))

(assert (=> d!1824 (isPrefixOf!0 lt!6243 lt!6243)))

(assert (=> d!1824 (= lt!6241 (lemmaIsPrefixRefl!0 lt!6243))))

(declare-fun lt!6253 () Unit!366)

(declare-fun lt!6256 () Unit!366)

(assert (=> d!1824 (= lt!6253 lt!6256)))

(assert (=> d!1824 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1824 (= lt!6256 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1824 (= lt!6243 (BitStream!295 (buf!479 (_2!312 lt!5600)) (currentByte!1458 thiss!1486) (currentBit!1453 thiss!1486)))))

(assert (=> d!1824 (isPrefixOf!0 thiss!1486 (_2!312 lt!5600))))

(assert (=> d!1824 (= (reader!0 thiss!1486 (_2!312 lt!5600)) lt!6249)))

(declare-fun b!4927 () Bool)

(declare-fun Unit!392 () Unit!366)

(assert (=> b!4927 (= e!3173 Unit!392)))

(assert (= (and d!1824 c!233) b!4925))

(assert (= (and d!1824 (not c!233)) b!4927))

(assert (= (and d!1824 res!6176) b!4924))

(assert (= (and b!4924 res!6177) b!4928))

(assert (= (and b!4928 res!6175) b!4926))

(declare-fun m!6001 () Bool)

(assert (=> b!4926 m!6001))

(assert (=> b!4926 m!5553))

(assert (=> b!4926 m!5555))

(assert (=> b!4925 m!5555))

(declare-fun m!6003 () Bool)

(assert (=> b!4925 m!6003))

(declare-fun m!6005 () Bool)

(assert (=> b!4925 m!6005))

(declare-fun m!6007 () Bool)

(assert (=> b!4928 m!6007))

(assert (=> d!1824 m!5571))

(assert (=> d!1824 m!5829))

(declare-fun m!6009 () Bool)

(assert (=> d!1824 m!6009))

(declare-fun m!6011 () Bool)

(assert (=> d!1824 m!6011))

(declare-fun m!6013 () Bool)

(assert (=> d!1824 m!6013))

(declare-fun m!6015 () Bool)

(assert (=> d!1824 m!6015))

(declare-fun m!6017 () Bool)

(assert (=> d!1824 m!6017))

(declare-fun m!6019 () Bool)

(assert (=> d!1824 m!6019))

(declare-fun m!6021 () Bool)

(assert (=> d!1824 m!6021))

(declare-fun m!6023 () Bool)

(assert (=> d!1824 m!6023))

(assert (=> d!1824 m!5827))

(declare-fun m!6025 () Bool)

(assert (=> b!4924 m!6025))

(assert (=> b!4682 d!1824))

(declare-fun d!1840 () Bool)

(assert (=> d!1840 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!158 (buf!479 (_2!312 lt!5600)))) ((_ sign_extend 32) (currentByte!1458 thiss!1486)) ((_ sign_extend 32) (currentBit!1453 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!158 (buf!479 (_2!312 lt!5600)))) ((_ sign_extend 32) (currentByte!1458 thiss!1486)) ((_ sign_extend 32) (currentBit!1453 thiss!1486))) nBits!460))))

(declare-fun bs!669 () Bool)

(assert (= bs!669 d!1840))

(declare-fun m!6027 () Bool)

(assert (=> bs!669 m!6027))

(assert (=> b!4682 d!1840))

(declare-datatypes ((tuple2!604 0))(
  ( (tuple2!605 (_1!320 Bool) (_2!320 BitStream!294)) )
))
(declare-fun lt!6351 () tuple2!604)

(declare-datatypes ((tuple2!606 0))(
  ( (tuple2!607 (_1!321 List!58) (_2!321 BitStream!294)) )
))
(declare-fun e!3190 () tuple2!606)

(declare-fun b!4963 () Bool)

(declare-fun lt!6353 () (_ BitVec 64))

(assert (=> b!4963 (= e!3190 (tuple2!607 (Cons!54 (_1!320 lt!6351) (bitStreamReadBitsIntoList!0 (_2!312 lt!5600) (_2!320 lt!6351) (bvsub nBits!460 lt!6353))) (_2!320 lt!6351)))))

(declare-fun readBit!0 (BitStream!294) tuple2!604)

(assert (=> b!4963 (= lt!6351 (readBit!0 (_1!314 lt!5596)))))

(assert (=> b!4963 (= lt!6353 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!1842 () Bool)

(declare-fun e!3191 () Bool)

(assert (=> d!1842 e!3191))

(declare-fun c!243 () Bool)

(assert (=> d!1842 (= c!243 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!6352 () List!58)

(assert (=> d!1842 (= lt!6352 (_1!321 e!3190))))

(declare-fun c!242 () Bool)

(assert (=> d!1842 (= c!242 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!1842 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1842 (= (bitStreamReadBitsIntoList!0 (_2!312 lt!5600) (_1!314 lt!5596) nBits!460) lt!6352)))

(declare-fun b!4965 () Bool)

(declare-fun length!5 (List!58) Int)

(assert (=> b!4965 (= e!3191 (> (length!5 lt!6352) 0))))

(declare-fun b!4962 () Bool)

(assert (=> b!4962 (= e!3190 (tuple2!607 Nil!55 (_1!314 lt!5596)))))

(declare-fun b!4964 () Bool)

(declare-fun isEmpty!10 (List!58) Bool)

(assert (=> b!4964 (= e!3191 (isEmpty!10 lt!6352))))

(assert (= (and d!1842 c!242) b!4962))

(assert (= (and d!1842 (not c!242)) b!4963))

(assert (= (and d!1842 c!243) b!4964))

(assert (= (and d!1842 (not c!243)) b!4965))

(declare-fun m!6035 () Bool)

(assert (=> b!4963 m!6035))

(declare-fun m!6037 () Bool)

(assert (=> b!4963 m!6037))

(declare-fun m!6039 () Bool)

(assert (=> b!4965 m!6039))

(declare-fun m!6041 () Bool)

(assert (=> b!4964 m!6041))

(assert (=> b!4682 d!1842))

(declare-fun d!1848 () Bool)

(declare-fun c!244 () Bool)

(assert (=> d!1848 (= c!244 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!3192 () List!58)

(assert (=> d!1848 (= (byteArrayBitContentToList!0 (_2!312 lt!5600) (_1!313 lt!5599) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!3192)))

(declare-fun b!4966 () Bool)

(assert (=> b!4966 (= e!3192 Nil!55)))

(declare-fun b!4967 () Bool)

(assert (=> b!4967 (= e!3192 (Cons!54 (not (= (bvand ((_ sign_extend 24) (select (arr!548 (_1!313 lt!5599)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!312 lt!5600) (_1!313 lt!5599) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!1848 c!244) b!4966))

(assert (= (and d!1848 (not c!244)) b!4967))

(declare-fun m!6043 () Bool)

(assert (=> b!4967 m!6043))

(declare-fun m!6047 () Bool)

(assert (=> b!4967 m!6047))

(declare-fun m!6051 () Bool)

(assert (=> b!4967 m!6051))

(assert (=> b!4682 d!1848))

(declare-fun d!1850 () Bool)

(assert (=> d!1850 (= (array_inv!153 srcBuffer!6) (bvsge (size!158 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1108 d!1850))

(declare-fun d!1852 () Bool)

(assert (=> d!1852 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1453 thiss!1486) (currentByte!1458 thiss!1486) (size!158 (buf!479 thiss!1486))))))

(declare-fun bs!670 () Bool)

(assert (= bs!670 d!1852))

(assert (=> bs!670 m!5621))

(assert (=> start!1108 d!1852))

(declare-fun d!1856 () Bool)

(assert (=> d!1856 (= (array_inv!153 (buf!479 thiss!1486)) (bvsge (size!158 (buf!479 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!4686 d!1856))

(declare-fun d!1858 () Bool)

(assert (=> d!1858 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!158 (buf!479 thiss!1486))) ((_ sign_extend 32) (currentByte!1458 thiss!1486)) ((_ sign_extend 32) (currentBit!1453 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!158 (buf!479 thiss!1486))) ((_ sign_extend 32) (currentByte!1458 thiss!1486)) ((_ sign_extend 32) (currentBit!1453 thiss!1486))) nBits!460))))

(declare-fun bs!671 () Bool)

(assert (= bs!671 d!1858))

(assert (=> bs!671 m!5619))

(assert (=> b!4681 d!1858))

(check-sat (not b!4736) (not b!4727) (not d!1852) (not d!1784) (not b!4928) (not b!4814) (not d!1818) (not b!4965) (not b!4967) (not d!1858) (not b!4734) (not b!4964) (not d!1816) (not b!4812) (not d!1788) (not b!4808) (not b!4813) (not b!4925) (not b!4859) (not b!4857) (not bm!53) (not b!4811) (not d!1824) (not b!4926) (not b!4924) (not d!1800) (not d!1840) (not b!4810) (not b!4856) (not b!4963))
(check-sat)
