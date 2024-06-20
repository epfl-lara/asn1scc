; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43348 () Bool)

(assert start!43348)

(declare-fun b!204708 () Bool)

(declare-fun e!140149 () Bool)

(declare-datatypes ((array!10350 0))(
  ( (array!10351 (arr!5481 (Array (_ BitVec 32) (_ BitVec 8))) (size!4551 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8210 0))(
  ( (BitStream!8211 (buf!5056 array!10350) (currentByte!9541 (_ BitVec 32)) (currentBit!9536 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14593 0))(
  ( (Unit!14594) )
))
(declare-datatypes ((tuple2!17512 0))(
  ( (tuple2!17513 (_1!9408 Unit!14593) (_2!9408 BitStream!8210)) )
))
(declare-fun lt!319590 () tuple2!17512)

(declare-fun thiss!1204 () BitStream!8210)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!204708 (= e!140149 (validate_offset_bit!0 ((_ sign_extend 32) (size!4551 (buf!5056 (_2!9408 lt!319590)))) ((_ sign_extend 32) (currentByte!9541 thiss!1204)) ((_ sign_extend 32) (currentBit!9536 thiss!1204))))))

(declare-fun b!204709 () Bool)

(declare-fun e!140148 () Bool)

(assert (=> b!204709 (= e!140148 e!140149)))

(declare-fun res!171570 () Bool)

(assert (=> b!204709 (=> res!171570 e!140149)))

(declare-fun lt!319592 () tuple2!17512)

(assert (=> b!204709 (= res!171570 (not (= (size!4551 (buf!5056 (_2!9408 lt!319590))) (size!4551 (buf!5056 (_2!9408 lt!319592))))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!204709 (invariant!0 (currentBit!9536 thiss!1204) (currentByte!9541 thiss!1204) (size!4551 (buf!5056 (_2!9408 lt!319590))))))

(declare-fun b!204710 () Bool)

(declare-fun res!171562 () Bool)

(declare-fun e!140150 () Bool)

(assert (=> b!204710 (=> (not res!171562) (not e!140150))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!204710 (= res!171562 (not (= i!590 nBits!348)))))

(declare-fun b!204711 () Bool)

(declare-fun res!171575 () Bool)

(declare-fun e!140146 () Bool)

(assert (=> b!204711 (=> (not res!171575) (not e!140146))))

(declare-fun isPrefixOf!0 (BitStream!8210 BitStream!8210) Bool)

(assert (=> b!204711 (= res!171575 (isPrefixOf!0 thiss!1204 (_2!9408 lt!319590)))))

(declare-fun b!204712 () Bool)

(declare-fun res!171571 () Bool)

(assert (=> b!204712 (=> res!171571 e!140148)))

(assert (=> b!204712 (= res!171571 (not (isPrefixOf!0 thiss!1204 (_2!9408 lt!319590))))))

(declare-fun b!204713 () Bool)

(declare-fun res!171569 () Bool)

(assert (=> b!204713 (=> res!171569 e!140148)))

(assert (=> b!204713 (= res!171569 (not (isPrefixOf!0 (_2!9408 lt!319590) (_2!9408 lt!319592))))))

(declare-fun b!204714 () Bool)

(declare-fun res!171564 () Bool)

(assert (=> b!204714 (=> (not res!171564) (not e!140150))))

(assert (=> b!204714 (= res!171564 (invariant!0 (currentBit!9536 thiss!1204) (currentByte!9541 thiss!1204) (size!4551 (buf!5056 thiss!1204))))))

(declare-fun res!171568 () Bool)

(assert (=> start!43348 (=> (not res!171568) (not e!140150))))

(assert (=> start!43348 (= res!171568 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43348 e!140150))

(assert (=> start!43348 true))

(declare-fun e!140143 () Bool)

(declare-fun inv!12 (BitStream!8210) Bool)

(assert (=> start!43348 (and (inv!12 thiss!1204) e!140143)))

(declare-fun b!204715 () Bool)

(declare-fun e!140145 () Bool)

(assert (=> b!204715 (= e!140146 e!140145)))

(declare-fun res!171561 () Bool)

(assert (=> b!204715 (=> (not res!171561) (not e!140145))))

(declare-datatypes ((tuple2!17514 0))(
  ( (tuple2!17515 (_1!9409 BitStream!8210) (_2!9409 Bool)) )
))
(declare-fun lt!319594 () tuple2!17514)

(declare-fun lt!319598 () Bool)

(assert (=> b!204715 (= res!171561 (and (= (_2!9409 lt!319594) lt!319598) (= (_1!9409 lt!319594) (_2!9408 lt!319590))))))

(declare-fun readBitPure!0 (BitStream!8210) tuple2!17514)

(declare-fun readerFrom!0 (BitStream!8210 (_ BitVec 32) (_ BitVec 32)) BitStream!8210)

(assert (=> b!204715 (= lt!319594 (readBitPure!0 (readerFrom!0 (_2!9408 lt!319590) (currentBit!9536 thiss!1204) (currentByte!9541 thiss!1204))))))

(declare-fun b!204716 () Bool)

(declare-fun e!140151 () Bool)

(assert (=> b!204716 (= e!140151 e!140146)))

(declare-fun res!171565 () Bool)

(assert (=> b!204716 (=> (not res!171565) (not e!140146))))

(declare-fun lt!319593 () (_ BitVec 64))

(declare-fun lt!319591 () (_ BitVec 64))

(assert (=> b!204716 (= res!171565 (= lt!319593 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!319591)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!204716 (= lt!319593 (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!319590))) (currentByte!9541 (_2!9408 lt!319590)) (currentBit!9536 (_2!9408 lt!319590))))))

(assert (=> b!204716 (= lt!319591 (bitIndex!0 (size!4551 (buf!5056 thiss!1204)) (currentByte!9541 thiss!1204) (currentBit!9536 thiss!1204)))))

(declare-fun b!204717 () Bool)

(assert (=> b!204717 (= e!140145 (= (bitIndex!0 (size!4551 (buf!5056 (_1!9409 lt!319594))) (currentByte!9541 (_1!9409 lt!319594)) (currentBit!9536 (_1!9409 lt!319594))) lt!319593))))

(declare-fun b!204718 () Bool)

(declare-fun e!140144 () Bool)

(assert (=> b!204718 (= e!140150 (not e!140144))))

(declare-fun res!171566 () Bool)

(assert (=> b!204718 (=> res!171566 e!140144)))

(declare-fun lt!319597 () (_ BitVec 64))

(declare-fun lt!319596 () (_ BitVec 64))

(assert (=> b!204718 (= res!171566 (not (= lt!319597 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!319596))))))

(assert (=> b!204718 (= lt!319597 (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!319590))) (currentByte!9541 (_2!9408 lt!319590)) (currentBit!9536 (_2!9408 lt!319590))))))

(assert (=> b!204718 (= lt!319596 (bitIndex!0 (size!4551 (buf!5056 thiss!1204)) (currentByte!9541 thiss!1204) (currentBit!9536 thiss!1204)))))

(assert (=> b!204718 e!140151))

(declare-fun res!171574 () Bool)

(assert (=> b!204718 (=> (not res!171574) (not e!140151))))

(assert (=> b!204718 (= res!171574 (= (size!4551 (buf!5056 thiss!1204)) (size!4551 (buf!5056 (_2!9408 lt!319590)))))))

(declare-fun appendBit!0 (BitStream!8210 Bool) tuple2!17512)

(assert (=> b!204718 (= lt!319590 (appendBit!0 thiss!1204 lt!319598))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!204718 (= lt!319598 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!204719 () Bool)

(declare-fun res!171567 () Bool)

(assert (=> b!204719 (=> res!171567 e!140148)))

(declare-fun lt!319589 () (_ BitVec 64))

(assert (=> b!204719 (= res!171567 (or (not (= (size!4551 (buf!5056 (_2!9408 lt!319592))) (size!4551 (buf!5056 thiss!1204)))) (not (= lt!319589 (bvsub (bvadd lt!319596 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!204720 () Bool)

(declare-fun array_inv!4292 (array!10350) Bool)

(assert (=> b!204720 (= e!140143 (array_inv!4292 (buf!5056 thiss!1204)))))

(declare-fun b!204721 () Bool)

(declare-fun res!171572 () Bool)

(assert (=> b!204721 (=> res!171572 e!140148)))

(assert (=> b!204721 (= res!171572 (not (invariant!0 (currentBit!9536 (_2!9408 lt!319592)) (currentByte!9541 (_2!9408 lt!319592)) (size!4551 (buf!5056 (_2!9408 lt!319592))))))))

(declare-fun b!204722 () Bool)

(assert (=> b!204722 (= e!140144 e!140148)))

(declare-fun res!171563 () Bool)

(assert (=> b!204722 (=> res!171563 e!140148)))

(assert (=> b!204722 (= res!171563 (not (= lt!319589 (bvsub (bvsub (bvadd lt!319597 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!204722 (= lt!319589 (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!319592))) (currentByte!9541 (_2!9408 lt!319592)) (currentBit!9536 (_2!9408 lt!319592))))))

(assert (=> b!204722 (isPrefixOf!0 thiss!1204 (_2!9408 lt!319592))))

(declare-fun lt!319595 () Unit!14593)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8210 BitStream!8210 BitStream!8210) Unit!14593)

(assert (=> b!204722 (= lt!319595 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9408 lt!319590) (_2!9408 lt!319592)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8210 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17512)

(assert (=> b!204722 (= lt!319592 (appendBitsLSBFirstLoopTR!0 (_2!9408 lt!319590) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!204723 () Bool)

(declare-fun res!171573 () Bool)

(assert (=> b!204723 (=> (not res!171573) (not e!140150))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!204723 (= res!171573 (validate_offset_bits!1 ((_ sign_extend 32) (size!4551 (buf!5056 thiss!1204))) ((_ sign_extend 32) (currentByte!9541 thiss!1204)) ((_ sign_extend 32) (currentBit!9536 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(assert (= (and start!43348 res!171568) b!204723))

(assert (= (and b!204723 res!171573) b!204714))

(assert (= (and b!204714 res!171564) b!204710))

(assert (= (and b!204710 res!171562) b!204718))

(assert (= (and b!204718 res!171574) b!204716))

(assert (= (and b!204716 res!171565) b!204711))

(assert (= (and b!204711 res!171575) b!204715))

(assert (= (and b!204715 res!171561) b!204717))

(assert (= (and b!204718 (not res!171566)) b!204722))

(assert (= (and b!204722 (not res!171563)) b!204721))

(assert (= (and b!204721 (not res!171572)) b!204719))

(assert (= (and b!204719 (not res!171567)) b!204713))

(assert (= (and b!204713 (not res!171569)) b!204712))

(assert (= (and b!204712 (not res!171571)) b!204709))

(assert (= (and b!204709 (not res!171570)) b!204708))

(assert (= start!43348 b!204720))

(declare-fun m!315781 () Bool)

(assert (=> b!204718 m!315781))

(declare-fun m!315783 () Bool)

(assert (=> b!204718 m!315783))

(declare-fun m!315785 () Bool)

(assert (=> b!204718 m!315785))

(declare-fun m!315787 () Bool)

(assert (=> b!204717 m!315787))

(declare-fun m!315789 () Bool)

(assert (=> b!204720 m!315789))

(declare-fun m!315791 () Bool)

(assert (=> b!204709 m!315791))

(declare-fun m!315793 () Bool)

(assert (=> start!43348 m!315793))

(declare-fun m!315795 () Bool)

(assert (=> b!204723 m!315795))

(declare-fun m!315797 () Bool)

(assert (=> b!204712 m!315797))

(declare-fun m!315799 () Bool)

(assert (=> b!204722 m!315799))

(declare-fun m!315801 () Bool)

(assert (=> b!204722 m!315801))

(declare-fun m!315803 () Bool)

(assert (=> b!204722 m!315803))

(declare-fun m!315805 () Bool)

(assert (=> b!204722 m!315805))

(declare-fun m!315807 () Bool)

(assert (=> b!204713 m!315807))

(assert (=> b!204716 m!315781))

(assert (=> b!204716 m!315783))

(declare-fun m!315809 () Bool)

(assert (=> b!204708 m!315809))

(declare-fun m!315811 () Bool)

(assert (=> b!204714 m!315811))

(declare-fun m!315813 () Bool)

(assert (=> b!204715 m!315813))

(assert (=> b!204715 m!315813))

(declare-fun m!315815 () Bool)

(assert (=> b!204715 m!315815))

(assert (=> b!204711 m!315797))

(declare-fun m!315817 () Bool)

(assert (=> b!204721 m!315817))

(push 1)

(assert (not b!204716))

(assert (not b!204718))

(assert (not b!204721))

(assert (not b!204708))

(assert (not start!43348))

(assert (not b!204717))

(assert (not b!204712))

(assert (not b!204722))

(assert (not b!204714))

(assert (not b!204723))

(assert (not b!204720))

(assert (not b!204715))

(assert (not b!204711))

(assert (not b!204709))

(assert (not b!204713))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69759 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69759 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4551 (buf!5056 thiss!1204))) ((_ sign_extend 32) (currentByte!9541 thiss!1204)) ((_ sign_extend 32) (currentBit!9536 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4551 (buf!5056 thiss!1204))) ((_ sign_extend 32) (currentByte!9541 thiss!1204)) ((_ sign_extend 32) (currentBit!9536 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17176 () Bool)

(assert (= bs!17176 d!69759))

(declare-fun m!315831 () Bool)

(assert (=> bs!17176 m!315831))

(assert (=> b!204723 d!69759))

(declare-fun d!69761 () Bool)

(assert (=> d!69761 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9536 thiss!1204) (currentByte!9541 thiss!1204) (size!4551 (buf!5056 thiss!1204))))))

(declare-fun bs!17177 () Bool)

(assert (= bs!17177 d!69761))

(assert (=> bs!17177 m!315811))

(assert (=> start!43348 d!69761))

(declare-fun d!69763 () Bool)

(declare-fun res!171603 () Bool)

(declare-fun e!140168 () Bool)

(assert (=> d!69763 (=> (not res!171603) (not e!140168))))

(assert (=> d!69763 (= res!171603 (= (size!4551 (buf!5056 thiss!1204)) (size!4551 (buf!5056 (_2!9408 lt!319590)))))))

(assert (=> d!69763 (= (isPrefixOf!0 thiss!1204 (_2!9408 lt!319590)) e!140168)))

(declare-fun b!204749 () Bool)

(declare-fun res!171601 () Bool)

(assert (=> b!204749 (=> (not res!171601) (not e!140168))))

(assert (=> b!204749 (= res!171601 (bvsle (bitIndex!0 (size!4551 (buf!5056 thiss!1204)) (currentByte!9541 thiss!1204) (currentBit!9536 thiss!1204)) (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!319590))) (currentByte!9541 (_2!9408 lt!319590)) (currentBit!9536 (_2!9408 lt!319590)))))))

(declare-fun b!204750 () Bool)

(declare-fun e!140167 () Bool)

(assert (=> b!204750 (= e!140168 e!140167)))

(declare-fun res!171602 () Bool)

(assert (=> b!204750 (=> res!171602 e!140167)))

(assert (=> b!204750 (= res!171602 (= (size!4551 (buf!5056 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!204751 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10350 array!10350 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!204751 (= e!140167 (arrayBitRangesEq!0 (buf!5056 thiss!1204) (buf!5056 (_2!9408 lt!319590)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4551 (buf!5056 thiss!1204)) (currentByte!9541 thiss!1204) (currentBit!9536 thiss!1204))))))

(assert (= (and d!69763 res!171603) b!204749))

(assert (= (and b!204749 res!171601) b!204750))

(assert (= (and b!204750 (not res!171602)) b!204751))

(assert (=> b!204749 m!315783))

(assert (=> b!204749 m!315781))

(assert (=> b!204751 m!315783))

(assert (=> b!204751 m!315783))

(declare-fun m!315833 () Bool)

(assert (=> b!204751 m!315833))

(assert (=> b!204712 d!69763))

(declare-fun d!69767 () Bool)

(assert (=> d!69767 (= (invariant!0 (currentBit!9536 thiss!1204) (currentByte!9541 thiss!1204) (size!4551 (buf!5056 thiss!1204))) (and (bvsge (currentBit!9536 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9536 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9541 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9541 thiss!1204) (size!4551 (buf!5056 thiss!1204))) (and (= (currentBit!9536 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9541 thiss!1204) (size!4551 (buf!5056 thiss!1204)))))))))

(assert (=> b!204714 d!69767))

(declare-fun d!69769 () Bool)

(declare-fun res!171606 () Bool)

(declare-fun e!140170 () Bool)

(assert (=> d!69769 (=> (not res!171606) (not e!140170))))

(assert (=> d!69769 (= res!171606 (= (size!4551 (buf!5056 (_2!9408 lt!319590))) (size!4551 (buf!5056 (_2!9408 lt!319592)))))))

(assert (=> d!69769 (= (isPrefixOf!0 (_2!9408 lt!319590) (_2!9408 lt!319592)) e!140170)))

(declare-fun b!204752 () Bool)

(declare-fun res!171604 () Bool)

(assert (=> b!204752 (=> (not res!171604) (not e!140170))))

(assert (=> b!204752 (= res!171604 (bvsle (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!319590))) (currentByte!9541 (_2!9408 lt!319590)) (currentBit!9536 (_2!9408 lt!319590))) (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!319592))) (currentByte!9541 (_2!9408 lt!319592)) (currentBit!9536 (_2!9408 lt!319592)))))))

(declare-fun b!204753 () Bool)

(declare-fun e!140169 () Bool)

(assert (=> b!204753 (= e!140170 e!140169)))

(declare-fun res!171605 () Bool)

(assert (=> b!204753 (=> res!171605 e!140169)))

(assert (=> b!204753 (= res!171605 (= (size!4551 (buf!5056 (_2!9408 lt!319590))) #b00000000000000000000000000000000))))

(declare-fun b!204754 () Bool)

(assert (=> b!204754 (= e!140169 (arrayBitRangesEq!0 (buf!5056 (_2!9408 lt!319590)) (buf!5056 (_2!9408 lt!319592)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!319590))) (currentByte!9541 (_2!9408 lt!319590)) (currentBit!9536 (_2!9408 lt!319590)))))))

(assert (= (and d!69769 res!171606) b!204752))

(assert (= (and b!204752 res!171604) b!204753))

(assert (= (and b!204753 (not res!171605)) b!204754))

(assert (=> b!204752 m!315781))

(assert (=> b!204752 m!315799))

(assert (=> b!204754 m!315781))

(assert (=> b!204754 m!315781))

(declare-fun m!315835 () Bool)

(assert (=> b!204754 m!315835))

(assert (=> b!204713 d!69769))

(declare-fun d!69771 () Bool)

(assert (=> d!69771 (= (invariant!0 (currentBit!9536 thiss!1204) (currentByte!9541 thiss!1204) (size!4551 (buf!5056 (_2!9408 lt!319590)))) (and (bvsge (currentBit!9536 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9536 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9541 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9541 thiss!1204) (size!4551 (buf!5056 (_2!9408 lt!319590)))) (and (= (currentBit!9536 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9541 thiss!1204) (size!4551 (buf!5056 (_2!9408 lt!319590))))))))))

(assert (=> b!204709 d!69771))

(declare-fun d!69773 () Bool)

(assert (=> d!69773 (= (array_inv!4292 (buf!5056 thiss!1204)) (bvsge (size!4551 (buf!5056 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!204720 d!69773))

(assert (=> b!204711 d!69763))

(declare-fun d!69775 () Bool)

(declare-fun e!140176 () Bool)

(assert (=> d!69775 e!140176))

(declare-fun res!171618 () Bool)

(assert (=> d!69775 (=> (not res!171618) (not e!140176))))

(declare-fun lt!319662 () (_ BitVec 64))

(declare-fun lt!319663 () (_ BitVec 64))

(declare-fun lt!319667 () (_ BitVec 64))

(assert (=> d!69775 (= res!171618 (= lt!319667 (bvsub lt!319662 lt!319663)))))

(assert (=> d!69775 (or (= (bvand lt!319662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!319663 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!319662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!319662 lt!319663) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69775 (= lt!319663 (remainingBits!0 ((_ sign_extend 32) (size!4551 (buf!5056 (_2!9408 lt!319592)))) ((_ sign_extend 32) (currentByte!9541 (_2!9408 lt!319592))) ((_ sign_extend 32) (currentBit!9536 (_2!9408 lt!319592)))))))

(declare-fun lt!319666 () (_ BitVec 64))

(declare-fun lt!319664 () (_ BitVec 64))

(assert (=> d!69775 (= lt!319662 (bvmul lt!319666 lt!319664))))

(assert (=> d!69775 (or (= lt!319666 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!319664 (bvsdiv (bvmul lt!319666 lt!319664) lt!319666)))))

(assert (=> d!69775 (= lt!319664 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69775 (= lt!319666 ((_ sign_extend 32) (size!4551 (buf!5056 (_2!9408 lt!319592)))))))

(assert (=> d!69775 (= lt!319667 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9541 (_2!9408 lt!319592))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9536 (_2!9408 lt!319592)))))))

(assert (=> d!69775 (invariant!0 (currentBit!9536 (_2!9408 lt!319592)) (currentByte!9541 (_2!9408 lt!319592)) (size!4551 (buf!5056 (_2!9408 lt!319592))))))

(assert (=> d!69775 (= (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!319592))) (currentByte!9541 (_2!9408 lt!319592)) (currentBit!9536 (_2!9408 lt!319592))) lt!319667)))

(declare-fun b!204765 () Bool)

(declare-fun res!171617 () Bool)

(assert (=> b!204765 (=> (not res!171617) (not e!140176))))

(assert (=> b!204765 (= res!171617 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!319667))))

(declare-fun b!204766 () Bool)

(declare-fun lt!319665 () (_ BitVec 64))

(assert (=> b!204766 (= e!140176 (bvsle lt!319667 (bvmul lt!319665 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204766 (or (= lt!319665 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!319665 #b0000000000000000000000000000000000000000000000000000000000001000) lt!319665)))))

(assert (=> b!204766 (= lt!319665 ((_ sign_extend 32) (size!4551 (buf!5056 (_2!9408 lt!319592)))))))

(assert (= (and d!69775 res!171618) b!204765))

(assert (= (and b!204765 res!171617) b!204766))

(declare-fun m!315841 () Bool)

(assert (=> d!69775 m!315841))

(assert (=> d!69775 m!315817))

(assert (=> b!204722 d!69775))

(declare-fun d!69779 () Bool)

(declare-fun res!171623 () Bool)

(declare-fun e!140179 () Bool)

(assert (=> d!69779 (=> (not res!171623) (not e!140179))))

(assert (=> d!69779 (= res!171623 (= (size!4551 (buf!5056 thiss!1204)) (size!4551 (buf!5056 (_2!9408 lt!319592)))))))

(assert (=> d!69779 (= (isPrefixOf!0 thiss!1204 (_2!9408 lt!319592)) e!140179)))

(declare-fun b!204769 () Bool)

(declare-fun res!171621 () Bool)

(assert (=> b!204769 (=> (not res!171621) (not e!140179))))

(assert (=> b!204769 (= res!171621 (bvsle (bitIndex!0 (size!4551 (buf!5056 thiss!1204)) (currentByte!9541 thiss!1204) (currentBit!9536 thiss!1204)) (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!319592))) (currentByte!9541 (_2!9408 lt!319592)) (currentBit!9536 (_2!9408 lt!319592)))))))

(declare-fun b!204770 () Bool)

(declare-fun e!140178 () Bool)

(assert (=> b!204770 (= e!140179 e!140178)))

(declare-fun res!171622 () Bool)

(assert (=> b!204770 (=> res!171622 e!140178)))

(assert (=> b!204770 (= res!171622 (= (size!4551 (buf!5056 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!204771 () Bool)

(assert (=> b!204771 (= e!140178 (arrayBitRangesEq!0 (buf!5056 thiss!1204) (buf!5056 (_2!9408 lt!319592)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4551 (buf!5056 thiss!1204)) (currentByte!9541 thiss!1204) (currentBit!9536 thiss!1204))))))

(assert (= (and d!69779 res!171623) b!204769))

(assert (= (and b!204769 res!171621) b!204770))

(assert (= (and b!204770 (not res!171622)) b!204771))

(assert (=> b!204769 m!315783))

(assert (=> b!204769 m!315799))

(assert (=> b!204771 m!315783))

(assert (=> b!204771 m!315783))

(declare-fun m!315845 () Bool)

(assert (=> b!204771 m!315845))

(assert (=> b!204722 d!69779))

(declare-fun d!69783 () Bool)

(assert (=> d!69783 (isPrefixOf!0 thiss!1204 (_2!9408 lt!319592))))

(declare-fun lt!319676 () Unit!14593)

(declare-fun choose!30 (BitStream!8210 BitStream!8210 BitStream!8210) Unit!14593)

(assert (=> d!69783 (= lt!319676 (choose!30 thiss!1204 (_2!9408 lt!319590) (_2!9408 lt!319592)))))

(assert (=> d!69783 (isPrefixOf!0 thiss!1204 (_2!9408 lt!319590))))

(assert (=> d!69783 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9408 lt!319590) (_2!9408 lt!319592)) lt!319676)))

(declare-fun bs!17178 () Bool)

(assert (= bs!17178 d!69783))

(assert (=> bs!17178 m!315801))

(declare-fun m!315847 () Bool)

(assert (=> bs!17178 m!315847))

(assert (=> bs!17178 m!315797))

(assert (=> b!204722 d!69783))

(declare-fun b!204911 () Bool)

(declare-fun res!171744 () Bool)

(declare-fun e!140260 () Bool)

(assert (=> b!204911 (=> (not res!171744) (not e!140260))))

(declare-fun lt!320023 () (_ BitVec 64))

(declare-fun lt!320008 () tuple2!17512)

(declare-fun lt!320014 () (_ BitVec 64))

(assert (=> b!204911 (= res!171744 (= (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!320008))) (currentByte!9541 (_2!9408 lt!320008)) (currentBit!9536 (_2!9408 lt!320008))) (bvsub lt!320023 lt!320014)))))

(assert (=> b!204911 (or (= (bvand lt!320023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320014 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!320023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!320023 lt!320014) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204911 (= lt!320014 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!320050 () (_ BitVec 64))

(declare-fun lt!320031 () (_ BitVec 64))

(assert (=> b!204911 (= lt!320023 (bvadd lt!320050 lt!320031))))

(assert (=> b!204911 (or (not (= (bvand lt!320050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320031 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!320050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!320050 lt!320031) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204911 (= lt!320031 ((_ sign_extend 32) nBits!348))))

(assert (=> b!204911 (= lt!320050 (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!319590))) (currentByte!9541 (_2!9408 lt!319590)) (currentBit!9536 (_2!9408 lt!319590))))))

(declare-fun b!204912 () Bool)

(declare-fun res!171751 () Bool)

(assert (=> b!204912 (=> (not res!171751) (not e!140260))))

(assert (=> b!204912 (= res!171751 (isPrefixOf!0 (_2!9408 lt!319590) (_2!9408 lt!320008)))))

(declare-fun b!204913 () Bool)

(declare-fun e!140261 () Bool)

(declare-fun lt!320022 () (_ BitVec 64))

(assert (=> b!204913 (= e!140261 (validate_offset_bits!1 ((_ sign_extend 32) (size!4551 (buf!5056 (_2!9408 lt!319590)))) ((_ sign_extend 32) (currentByte!9541 (_2!9408 lt!319590))) ((_ sign_extend 32) (currentBit!9536 (_2!9408 lt!319590))) lt!320022))))

(declare-fun b!204914 () Bool)

(declare-fun lt!320048 () tuple2!17514)

(declare-fun lt!320013 () tuple2!17512)

(assert (=> b!204914 (= lt!320048 (readBitPure!0 (readerFrom!0 (_2!9408 lt!320013) (currentBit!9536 (_2!9408 lt!319590)) (currentByte!9541 (_2!9408 lt!319590)))))))

(declare-fun lt!320062 () Bool)

(declare-fun res!171748 () Bool)

(assert (=> b!204914 (= res!171748 (and (= (_2!9409 lt!320048) lt!320062) (= (_1!9409 lt!320048) (_2!9408 lt!320013))))))

(declare-fun e!140262 () Bool)

(assert (=> b!204914 (=> (not res!171748) (not e!140262))))

(declare-fun e!140264 () Bool)

(assert (=> b!204914 (= e!140264 e!140262)))

(declare-fun b!204915 () Bool)

(assert (=> b!204915 (= e!140262 (= (bitIndex!0 (size!4551 (buf!5056 (_1!9409 lt!320048))) (currentByte!9541 (_1!9409 lt!320048)) (currentBit!9536 (_1!9409 lt!320048))) (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!320013))) (currentByte!9541 (_2!9408 lt!320013)) (currentBit!9536 (_2!9408 lt!320013)))))))

(declare-fun b!204916 () Bool)

(declare-fun e!140268 () Bool)

(declare-datatypes ((tuple2!17522 0))(
  ( (tuple2!17523 (_1!9413 BitStream!8210) (_2!9413 (_ BitVec 64))) )
))
(declare-fun lt!320047 () tuple2!17522)

(declare-datatypes ((tuple2!17524 0))(
  ( (tuple2!17525 (_1!9414 BitStream!8210) (_2!9414 BitStream!8210)) )
))
(declare-fun lt!320012 () tuple2!17524)

(assert (=> b!204916 (= e!140268 (= (_1!9413 lt!320047) (_2!9414 lt!320012)))))

(declare-fun b!204917 () Bool)

(declare-fun e!140263 () Bool)

(declare-fun lt!320058 () tuple2!17522)

(declare-fun lt!320035 () tuple2!17524)

(assert (=> b!204917 (= e!140263 (= (_1!9413 lt!320058) (_2!9414 lt!320035)))))

(declare-fun b!204918 () Bool)

(declare-fun e!140265 () (_ BitVec 64))

(assert (=> b!204918 (= e!140265 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!204919 () Bool)

(declare-fun e!140266 () Bool)

(declare-fun lt!320010 () tuple2!17514)

(declare-fun lt!320041 () tuple2!17514)

(assert (=> b!204919 (= e!140266 (= (_2!9409 lt!320010) (_2!9409 lt!320041)))))

(declare-fun b!204920 () Bool)

(declare-fun res!171752 () Bool)

(assert (=> b!204920 (= res!171752 (= (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!320013))) (currentByte!9541 (_2!9408 lt!320013)) (currentBit!9536 (_2!9408 lt!320013))) (bvadd (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!319590))) (currentByte!9541 (_2!9408 lt!319590)) (currentBit!9536 (_2!9408 lt!319590))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!204920 (=> (not res!171752) (not e!140264))))

(declare-fun b!204921 () Bool)

(assert (=> b!204921 (= e!140265 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun c!10145 () Bool)

(declare-fun lt!320063 () tuple2!17512)

(declare-fun bm!3237 () Bool)

(declare-fun call!3240 () Bool)

(assert (=> bm!3237 (= call!3240 (isPrefixOf!0 (_2!9408 lt!319590) (ite c!10145 (_2!9408 lt!319590) (_2!9408 lt!320063))))))

(declare-fun b!204922 () Bool)

(declare-fun e!140267 () tuple2!17512)

(declare-fun Unit!14606 () Unit!14593)

(assert (=> b!204922 (= e!140267 (tuple2!17513 Unit!14606 (_2!9408 lt!319590)))))

(declare-fun lt!320017 () Unit!14593)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8210) Unit!14593)

(assert (=> b!204922 (= lt!320017 (lemmaIsPrefixRefl!0 (_2!9408 lt!319590)))))

(assert (=> b!204922 call!3240))

(declare-fun lt!320045 () Unit!14593)

(assert (=> b!204922 (= lt!320045 lt!320017)))

(declare-fun b!204923 () Bool)

(declare-fun res!171749 () Bool)

(assert (=> b!204923 (= res!171749 (isPrefixOf!0 (_2!9408 lt!319590) (_2!9408 lt!320013)))))

(assert (=> b!204923 (=> (not res!171749) (not e!140264))))

(declare-fun d!69785 () Bool)

(assert (=> d!69785 e!140260))

(declare-fun res!171754 () Bool)

(assert (=> d!69785 (=> (not res!171754) (not e!140260))))

(assert (=> d!69785 (= res!171754 (invariant!0 (currentBit!9536 (_2!9408 lt!320008)) (currentByte!9541 (_2!9408 lt!320008)) (size!4551 (buf!5056 (_2!9408 lt!320008)))))))

(assert (=> d!69785 (= lt!320008 e!140267)))

(assert (=> d!69785 (= c!10145 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69785 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69785 (= (appendBitsLSBFirstLoopTR!0 (_2!9408 lt!319590) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!320008)))

(declare-fun b!204924 () Bool)

(assert (=> b!204924 (= e!140260 e!140263)))

(declare-fun res!171746 () Bool)

(assert (=> b!204924 (=> (not res!171746) (not e!140263))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!204924 (= res!171746 (= (_2!9413 lt!320058) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8210 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17522)

(assert (=> b!204924 (= lt!320058 (readNBitsLSBFirstsLoopPure!0 (_1!9414 lt!320035) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!320026 () Unit!14593)

(declare-fun lt!320033 () Unit!14593)

(assert (=> b!204924 (= lt!320026 lt!320033)))

(assert (=> b!204924 (validate_offset_bits!1 ((_ sign_extend 32) (size!4551 (buf!5056 (_2!9408 lt!320008)))) ((_ sign_extend 32) (currentByte!9541 (_2!9408 lt!319590))) ((_ sign_extend 32) (currentBit!9536 (_2!9408 lt!319590))) lt!320022)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8210 array!10350 (_ BitVec 64)) Unit!14593)

(assert (=> b!204924 (= lt!320033 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9408 lt!319590) (buf!5056 (_2!9408 lt!320008)) lt!320022))))

(assert (=> b!204924 e!140261))

(declare-fun res!171747 () Bool)

(assert (=> b!204924 (=> (not res!171747) (not e!140261))))

(assert (=> b!204924 (= res!171747 (and (= (size!4551 (buf!5056 (_2!9408 lt!319590))) (size!4551 (buf!5056 (_2!9408 lt!320008)))) (bvsge lt!320022 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204924 (= lt!320022 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!204924 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!8210 BitStream!8210) tuple2!17524)

(assert (=> b!204924 (= lt!320035 (reader!0 (_2!9408 lt!319590) (_2!9408 lt!320008)))))

(declare-fun b!204925 () Bool)

(declare-fun res!171743 () Bool)

(assert (=> b!204925 (=> (not res!171743) (not e!140260))))

(assert (=> b!204925 (= res!171743 (= (size!4551 (buf!5056 (_2!9408 lt!319590))) (size!4551 (buf!5056 (_2!9408 lt!320008)))))))

(declare-fun b!204926 () Bool)

(assert (=> b!204926 (= e!140267 (tuple2!17513 (_1!9408 lt!320063) (_2!9408 lt!320063)))))

(assert (=> b!204926 (= lt!320062 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204926 (= lt!320013 (appendBit!0 (_2!9408 lt!319590) lt!320062))))

(declare-fun res!171750 () Bool)

(assert (=> b!204926 (= res!171750 (= (size!4551 (buf!5056 (_2!9408 lt!319590))) (size!4551 (buf!5056 (_2!9408 lt!320013)))))))

(assert (=> b!204926 (=> (not res!171750) (not e!140264))))

(assert (=> b!204926 e!140264))

(declare-fun lt!320055 () tuple2!17512)

(assert (=> b!204926 (= lt!320055 lt!320013)))

(assert (=> b!204926 (= lt!320063 (appendBitsLSBFirstLoopTR!0 (_2!9408 lt!320055) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!320036 () Unit!14593)

(assert (=> b!204926 (= lt!320036 (lemmaIsPrefixTransitive!0 (_2!9408 lt!319590) (_2!9408 lt!320055) (_2!9408 lt!320063)))))

(assert (=> b!204926 call!3240))

(declare-fun lt!320049 () Unit!14593)

(assert (=> b!204926 (= lt!320049 lt!320036)))

(assert (=> b!204926 (invariant!0 (currentBit!9536 (_2!9408 lt!319590)) (currentByte!9541 (_2!9408 lt!319590)) (size!4551 (buf!5056 (_2!9408 lt!320055))))))

(declare-fun lt!320030 () BitStream!8210)

(assert (=> b!204926 (= lt!320030 (BitStream!8211 (buf!5056 (_2!9408 lt!320055)) (currentByte!9541 (_2!9408 lt!319590)) (currentBit!9536 (_2!9408 lt!319590))))))

(assert (=> b!204926 (invariant!0 (currentBit!9536 lt!320030) (currentByte!9541 lt!320030) (size!4551 (buf!5056 (_2!9408 lt!320063))))))

(declare-fun lt!320020 () BitStream!8210)

(assert (=> b!204926 (= lt!320020 (BitStream!8211 (buf!5056 (_2!9408 lt!320063)) (currentByte!9541 lt!320030) (currentBit!9536 lt!320030)))))

(assert (=> b!204926 (= lt!320010 (readBitPure!0 lt!320030))))

(assert (=> b!204926 (= lt!320041 (readBitPure!0 lt!320020))))

(declare-fun lt!320060 () Unit!14593)

(declare-fun readBitPrefixLemma!0 (BitStream!8210 BitStream!8210) Unit!14593)

(assert (=> b!204926 (= lt!320060 (readBitPrefixLemma!0 lt!320030 (_2!9408 lt!320063)))))

(declare-fun res!171745 () Bool)

(assert (=> b!204926 (= res!171745 (= (bitIndex!0 (size!4551 (buf!5056 (_1!9409 lt!320010))) (currentByte!9541 (_1!9409 lt!320010)) (currentBit!9536 (_1!9409 lt!320010))) (bitIndex!0 (size!4551 (buf!5056 (_1!9409 lt!320041))) (currentByte!9541 (_1!9409 lt!320041)) (currentBit!9536 (_1!9409 lt!320041)))))))

(assert (=> b!204926 (=> (not res!171745) (not e!140266))))

(assert (=> b!204926 e!140266))

(declare-fun lt!320043 () Unit!14593)

(assert (=> b!204926 (= lt!320043 lt!320060)))

(declare-fun lt!320057 () tuple2!17524)

(assert (=> b!204926 (= lt!320057 (reader!0 (_2!9408 lt!319590) (_2!9408 lt!320063)))))

(declare-fun lt!320046 () tuple2!17524)

(assert (=> b!204926 (= lt!320046 (reader!0 (_2!9408 lt!320055) (_2!9408 lt!320063)))))

(declare-fun lt!320042 () tuple2!17514)

(assert (=> b!204926 (= lt!320042 (readBitPure!0 (_1!9414 lt!320057)))))

(assert (=> b!204926 (= (_2!9409 lt!320042) lt!320062)))

(declare-fun lt!320051 () Unit!14593)

(declare-fun Unit!14607 () Unit!14593)

(assert (=> b!204926 (= lt!320051 Unit!14607)))

(declare-fun lt!320054 () (_ BitVec 64))

(assert (=> b!204926 (= lt!320054 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!320028 () (_ BitVec 64))

(assert (=> b!204926 (= lt!320028 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!320061 () Unit!14593)

(assert (=> b!204926 (= lt!320061 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9408 lt!319590) (buf!5056 (_2!9408 lt!320063)) lt!320028))))

(assert (=> b!204926 (validate_offset_bits!1 ((_ sign_extend 32) (size!4551 (buf!5056 (_2!9408 lt!320063)))) ((_ sign_extend 32) (currentByte!9541 (_2!9408 lt!319590))) ((_ sign_extend 32) (currentBit!9536 (_2!9408 lt!319590))) lt!320028)))

(declare-fun lt!320016 () Unit!14593)

(assert (=> b!204926 (= lt!320016 lt!320061)))

(declare-fun lt!320015 () tuple2!17522)

(assert (=> b!204926 (= lt!320015 (readNBitsLSBFirstsLoopPure!0 (_1!9414 lt!320057) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!320054))))

(declare-fun lt!320038 () (_ BitVec 64))

(assert (=> b!204926 (= lt!320038 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!320029 () Unit!14593)

(assert (=> b!204926 (= lt!320029 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9408 lt!320055) (buf!5056 (_2!9408 lt!320063)) lt!320038))))

(assert (=> b!204926 (validate_offset_bits!1 ((_ sign_extend 32) (size!4551 (buf!5056 (_2!9408 lt!320063)))) ((_ sign_extend 32) (currentByte!9541 (_2!9408 lt!320055))) ((_ sign_extend 32) (currentBit!9536 (_2!9408 lt!320055))) lt!320038)))

(declare-fun lt!320032 () Unit!14593)

(assert (=> b!204926 (= lt!320032 lt!320029)))

(declare-fun lt!320044 () tuple2!17522)

(assert (=> b!204926 (= lt!320044 (readNBitsLSBFirstsLoopPure!0 (_1!9414 lt!320046) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!320054 (ite (_2!9409 lt!320042) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!320018 () tuple2!17522)

(assert (=> b!204926 (= lt!320018 (readNBitsLSBFirstsLoopPure!0 (_1!9414 lt!320057) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!320054))))

(declare-fun c!10144 () Bool)

(assert (=> b!204926 (= c!10144 (_2!9409 (readBitPure!0 (_1!9414 lt!320057))))))

(declare-fun lt!320021 () tuple2!17522)

(declare-fun withMovedBitIndex!0 (BitStream!8210 (_ BitVec 64)) BitStream!8210)

(assert (=> b!204926 (= lt!320021 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9414 lt!320057) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!320054 e!140265)))))

(declare-fun lt!320024 () Unit!14593)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8210 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14593)

(assert (=> b!204926 (= lt!320024 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9414 lt!320057) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!320054))))

(assert (=> b!204926 (and (= (_2!9413 lt!320018) (_2!9413 lt!320021)) (= (_1!9413 lt!320018) (_1!9413 lt!320021)))))

(declare-fun lt!320056 () Unit!14593)

(assert (=> b!204926 (= lt!320056 lt!320024)))

(assert (=> b!204926 (= (_1!9414 lt!320057) (withMovedBitIndex!0 (_2!9414 lt!320057) (bvsub (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!319590))) (currentByte!9541 (_2!9408 lt!319590)) (currentBit!9536 (_2!9408 lt!319590))) (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!320063))) (currentByte!9541 (_2!9408 lt!320063)) (currentBit!9536 (_2!9408 lt!320063))))))))

(declare-fun lt!320052 () Unit!14593)

(declare-fun Unit!14608 () Unit!14593)

(assert (=> b!204926 (= lt!320052 Unit!14608)))

(assert (=> b!204926 (= (_1!9414 lt!320046) (withMovedBitIndex!0 (_2!9414 lt!320046) (bvsub (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!320055))) (currentByte!9541 (_2!9408 lt!320055)) (currentBit!9536 (_2!9408 lt!320055))) (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!320063))) (currentByte!9541 (_2!9408 lt!320063)) (currentBit!9536 (_2!9408 lt!320063))))))))

(declare-fun lt!320025 () Unit!14593)

(declare-fun Unit!14609 () Unit!14593)

(assert (=> b!204926 (= lt!320025 Unit!14609)))

(assert (=> b!204926 (= (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!319590))) (currentByte!9541 (_2!9408 lt!319590)) (currentBit!9536 (_2!9408 lt!319590))) (bvsub (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!320055))) (currentByte!9541 (_2!9408 lt!320055)) (currentBit!9536 (_2!9408 lt!320055))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!320019 () Unit!14593)

(declare-fun Unit!14610 () Unit!14593)

(assert (=> b!204926 (= lt!320019 Unit!14610)))

(assert (=> b!204926 (= (_2!9413 lt!320015) (_2!9413 lt!320044))))

(declare-fun lt!320053 () Unit!14593)

(declare-fun Unit!14611 () Unit!14593)

(assert (=> b!204926 (= lt!320053 Unit!14611)))

(assert (=> b!204926 (invariant!0 (currentBit!9536 (_2!9408 lt!320063)) (currentByte!9541 (_2!9408 lt!320063)) (size!4551 (buf!5056 (_2!9408 lt!320063))))))

(declare-fun lt!320011 () Unit!14593)

(declare-fun Unit!14612 () Unit!14593)

(assert (=> b!204926 (= lt!320011 Unit!14612)))

(assert (=> b!204926 (= (size!4551 (buf!5056 (_2!9408 lt!319590))) (size!4551 (buf!5056 (_2!9408 lt!320063))))))

(declare-fun lt!320040 () Unit!14593)

(declare-fun Unit!14613 () Unit!14593)

(assert (=> b!204926 (= lt!320040 Unit!14613)))

(assert (=> b!204926 (= (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!320063))) (currentByte!9541 (_2!9408 lt!320063)) (currentBit!9536 (_2!9408 lt!320063))) (bvsub (bvadd (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!319590))) (currentByte!9541 (_2!9408 lt!319590)) (currentBit!9536 (_2!9408 lt!319590))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!320027 () Unit!14593)

(declare-fun Unit!14614 () Unit!14593)

(assert (=> b!204926 (= lt!320027 Unit!14614)))

(declare-fun lt!320037 () Unit!14593)

(declare-fun Unit!14615 () Unit!14593)

(assert (=> b!204926 (= lt!320037 Unit!14615)))

(assert (=> b!204926 (= lt!320012 (reader!0 (_2!9408 lt!319590) (_2!9408 lt!320063)))))

(declare-fun lt!320009 () (_ BitVec 64))

(assert (=> b!204926 (= lt!320009 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!320059 () Unit!14593)

(assert (=> b!204926 (= lt!320059 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9408 lt!319590) (buf!5056 (_2!9408 lt!320063)) lt!320009))))

(assert (=> b!204926 (validate_offset_bits!1 ((_ sign_extend 32) (size!4551 (buf!5056 (_2!9408 lt!320063)))) ((_ sign_extend 32) (currentByte!9541 (_2!9408 lt!319590))) ((_ sign_extend 32) (currentBit!9536 (_2!9408 lt!319590))) lt!320009)))

(declare-fun lt!320034 () Unit!14593)

(assert (=> b!204926 (= lt!320034 lt!320059)))

(assert (=> b!204926 (= lt!320047 (readNBitsLSBFirstsLoopPure!0 (_1!9414 lt!320012) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!171753 () Bool)

(assert (=> b!204926 (= res!171753 (= (_2!9413 lt!320047) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!204926 (=> (not res!171753) (not e!140268))))

(assert (=> b!204926 e!140268))

(declare-fun lt!320039 () Unit!14593)

(declare-fun Unit!14616 () Unit!14593)

(assert (=> b!204926 (= lt!320039 Unit!14616)))

(assert (= (and d!69785 c!10145) b!204922))

(assert (= (and d!69785 (not c!10145)) b!204926))

(assert (= (and b!204926 res!171750) b!204920))

(assert (= (and b!204920 res!171752) b!204923))

(assert (= (and b!204923 res!171749) b!204914))

(assert (= (and b!204914 res!171748) b!204915))

(assert (= (and b!204926 res!171745) b!204919))

(assert (= (and b!204926 c!10144) b!204918))

(assert (= (and b!204926 (not c!10144)) b!204921))

(assert (= (and b!204926 res!171753) b!204916))

(assert (= (or b!204922 b!204926) bm!3237))

(assert (= (and d!69785 res!171754) b!204925))

(assert (= (and b!204925 res!171743) b!204911))

(assert (= (and b!204911 res!171744) b!204912))

(assert (= (and b!204912 res!171751) b!204924))

(assert (= (and b!204924 res!171747) b!204913))

(assert (= (and b!204924 res!171746) b!204917))

(declare-fun m!315999 () Bool)

(assert (=> b!204922 m!315999))

(declare-fun m!316001 () Bool)

(assert (=> b!204920 m!316001))

(assert (=> b!204920 m!315781))

(declare-fun m!316003 () Bool)

(assert (=> b!204924 m!316003))

(declare-fun m!316005 () Bool)

(assert (=> b!204924 m!316005))

(declare-fun m!316007 () Bool)

(assert (=> b!204924 m!316007))

(declare-fun m!316009 () Bool)

(assert (=> b!204924 m!316009))

(declare-fun m!316011 () Bool)

(assert (=> b!204924 m!316011))

(declare-fun m!316013 () Bool)

(assert (=> b!204924 m!316013))

(declare-fun m!316015 () Bool)

(assert (=> b!204915 m!316015))

(assert (=> b!204915 m!316001))

(declare-fun m!316017 () Bool)

(assert (=> b!204913 m!316017))

(declare-fun m!316019 () Bool)

(assert (=> b!204914 m!316019))

(assert (=> b!204914 m!316019))

(declare-fun m!316021 () Bool)

(assert (=> b!204914 m!316021))

(declare-fun m!316023 () Bool)

(assert (=> d!69785 m!316023))

(declare-fun m!316025 () Bool)

(assert (=> b!204923 m!316025))

(declare-fun m!316027 () Bool)

(assert (=> b!204912 m!316027))

(declare-fun m!316029 () Bool)

(assert (=> b!204911 m!316029))

(assert (=> b!204911 m!315781))

(assert (=> b!204926 m!316011))

(declare-fun m!316031 () Bool)

(assert (=> b!204926 m!316031))

(declare-fun m!316033 () Bool)

(assert (=> b!204926 m!316033))

(declare-fun m!316035 () Bool)

(assert (=> b!204926 m!316035))

(declare-fun m!316037 () Bool)

(assert (=> b!204926 m!316037))

(declare-fun m!316039 () Bool)

(assert (=> b!204926 m!316039))

(declare-fun m!316041 () Bool)

(assert (=> b!204926 m!316041))

(assert (=> b!204926 m!316007))

(declare-fun m!316043 () Bool)

(assert (=> b!204926 m!316043))

(declare-fun m!316045 () Bool)

(assert (=> b!204926 m!316045))

(declare-fun m!316047 () Bool)

(assert (=> b!204926 m!316047))

(declare-fun m!316049 () Bool)

(assert (=> b!204926 m!316049))

(declare-fun m!316051 () Bool)

(assert (=> b!204926 m!316051))

(declare-fun m!316053 () Bool)

(assert (=> b!204926 m!316053))

(declare-fun m!316055 () Bool)

(assert (=> b!204926 m!316055))

(declare-fun m!316057 () Bool)

(assert (=> b!204926 m!316057))

(declare-fun m!316059 () Bool)

(assert (=> b!204926 m!316059))

(declare-fun m!316061 () Bool)

(assert (=> b!204926 m!316061))

(declare-fun m!316063 () Bool)

(assert (=> b!204926 m!316063))

(declare-fun m!316065 () Bool)

(assert (=> b!204926 m!316065))

(declare-fun m!316067 () Bool)

(assert (=> b!204926 m!316067))

(declare-fun m!316069 () Bool)

(assert (=> b!204926 m!316069))

(assert (=> b!204926 m!316033))

(declare-fun m!316071 () Bool)

(assert (=> b!204926 m!316071))

(declare-fun m!316073 () Bool)

(assert (=> b!204926 m!316073))

(declare-fun m!316075 () Bool)

(assert (=> b!204926 m!316075))

(declare-fun m!316077 () Bool)

(assert (=> b!204926 m!316077))

(declare-fun m!316079 () Bool)

(assert (=> b!204926 m!316079))

(declare-fun m!316081 () Bool)

(assert (=> b!204926 m!316081))

(declare-fun m!316083 () Bool)

(assert (=> b!204926 m!316083))

(declare-fun m!316085 () Bool)

(assert (=> b!204926 m!316085))

(declare-fun m!316087 () Bool)

(assert (=> b!204926 m!316087))

(assert (=> b!204926 m!315781))

(declare-fun m!316089 () Bool)

(assert (=> b!204926 m!316089))

(declare-fun m!316091 () Bool)

(assert (=> bm!3237 m!316091))

(assert (=> b!204722 d!69785))

(declare-fun d!69843 () Bool)

(assert (=> d!69843 (= (invariant!0 (currentBit!9536 (_2!9408 lt!319592)) (currentByte!9541 (_2!9408 lt!319592)) (size!4551 (buf!5056 (_2!9408 lt!319592)))) (and (bvsge (currentBit!9536 (_2!9408 lt!319592)) #b00000000000000000000000000000000) (bvslt (currentBit!9536 (_2!9408 lt!319592)) #b00000000000000000000000000001000) (bvsge (currentByte!9541 (_2!9408 lt!319592)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9541 (_2!9408 lt!319592)) (size!4551 (buf!5056 (_2!9408 lt!319592)))) (and (= (currentBit!9536 (_2!9408 lt!319592)) #b00000000000000000000000000000000) (= (currentByte!9541 (_2!9408 lt!319592)) (size!4551 (buf!5056 (_2!9408 lt!319592))))))))))

(assert (=> b!204721 d!69843))

(declare-fun d!69845 () Bool)

(declare-fun e!140269 () Bool)

(assert (=> d!69845 e!140269))

(declare-fun res!171756 () Bool)

(assert (=> d!69845 (=> (not res!171756) (not e!140269))))

(declare-fun lt!320065 () (_ BitVec 64))

(declare-fun lt!320069 () (_ BitVec 64))

(declare-fun lt!320064 () (_ BitVec 64))

(assert (=> d!69845 (= res!171756 (= lt!320069 (bvsub lt!320064 lt!320065)))))

(assert (=> d!69845 (or (= (bvand lt!320064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320065 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!320064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!320064 lt!320065) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69845 (= lt!320065 (remainingBits!0 ((_ sign_extend 32) (size!4551 (buf!5056 (_2!9408 lt!319590)))) ((_ sign_extend 32) (currentByte!9541 (_2!9408 lt!319590))) ((_ sign_extend 32) (currentBit!9536 (_2!9408 lt!319590)))))))

(declare-fun lt!320068 () (_ BitVec 64))

(declare-fun lt!320066 () (_ BitVec 64))

(assert (=> d!69845 (= lt!320064 (bvmul lt!320068 lt!320066))))

(assert (=> d!69845 (or (= lt!320068 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!320066 (bvsdiv (bvmul lt!320068 lt!320066) lt!320068)))))

(assert (=> d!69845 (= lt!320066 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69845 (= lt!320068 ((_ sign_extend 32) (size!4551 (buf!5056 (_2!9408 lt!319590)))))))

(assert (=> d!69845 (= lt!320069 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9541 (_2!9408 lt!319590))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9536 (_2!9408 lt!319590)))))))

(assert (=> d!69845 (invariant!0 (currentBit!9536 (_2!9408 lt!319590)) (currentByte!9541 (_2!9408 lt!319590)) (size!4551 (buf!5056 (_2!9408 lt!319590))))))

(assert (=> d!69845 (= (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!319590))) (currentByte!9541 (_2!9408 lt!319590)) (currentBit!9536 (_2!9408 lt!319590))) lt!320069)))

(declare-fun b!204927 () Bool)

(declare-fun res!171755 () Bool)

(assert (=> b!204927 (=> (not res!171755) (not e!140269))))

(assert (=> b!204927 (= res!171755 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!320069))))

(declare-fun b!204928 () Bool)

(declare-fun lt!320067 () (_ BitVec 64))

(assert (=> b!204928 (= e!140269 (bvsle lt!320069 (bvmul lt!320067 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204928 (or (= lt!320067 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!320067 #b0000000000000000000000000000000000000000000000000000000000001000) lt!320067)))))

(assert (=> b!204928 (= lt!320067 ((_ sign_extend 32) (size!4551 (buf!5056 (_2!9408 lt!319590)))))))

(assert (= (and d!69845 res!171756) b!204927))

(assert (= (and b!204927 res!171755) b!204928))

(declare-fun m!316093 () Bool)

(assert (=> d!69845 m!316093))

(declare-fun m!316095 () Bool)

(assert (=> d!69845 m!316095))

(assert (=> b!204718 d!69845))

(declare-fun d!69847 () Bool)

(declare-fun e!140270 () Bool)

(assert (=> d!69847 e!140270))

(declare-fun res!171758 () Bool)

(assert (=> d!69847 (=> (not res!171758) (not e!140270))))

(declare-fun lt!320075 () (_ BitVec 64))

(declare-fun lt!320071 () (_ BitVec 64))

(declare-fun lt!320070 () (_ BitVec 64))

(assert (=> d!69847 (= res!171758 (= lt!320075 (bvsub lt!320070 lt!320071)))))

(assert (=> d!69847 (or (= (bvand lt!320070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320071 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!320070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!320070 lt!320071) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69847 (= lt!320071 (remainingBits!0 ((_ sign_extend 32) (size!4551 (buf!5056 thiss!1204))) ((_ sign_extend 32) (currentByte!9541 thiss!1204)) ((_ sign_extend 32) (currentBit!9536 thiss!1204))))))

(declare-fun lt!320074 () (_ BitVec 64))

(declare-fun lt!320072 () (_ BitVec 64))

(assert (=> d!69847 (= lt!320070 (bvmul lt!320074 lt!320072))))

(assert (=> d!69847 (or (= lt!320074 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!320072 (bvsdiv (bvmul lt!320074 lt!320072) lt!320074)))))

(assert (=> d!69847 (= lt!320072 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69847 (= lt!320074 ((_ sign_extend 32) (size!4551 (buf!5056 thiss!1204))))))

(assert (=> d!69847 (= lt!320075 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9541 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9536 thiss!1204))))))

(assert (=> d!69847 (invariant!0 (currentBit!9536 thiss!1204) (currentByte!9541 thiss!1204) (size!4551 (buf!5056 thiss!1204)))))

(assert (=> d!69847 (= (bitIndex!0 (size!4551 (buf!5056 thiss!1204)) (currentByte!9541 thiss!1204) (currentBit!9536 thiss!1204)) lt!320075)))

(declare-fun b!204929 () Bool)

(declare-fun res!171757 () Bool)

(assert (=> b!204929 (=> (not res!171757) (not e!140270))))

(assert (=> b!204929 (= res!171757 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!320075))))

(declare-fun b!204930 () Bool)

(declare-fun lt!320073 () (_ BitVec 64))

(assert (=> b!204930 (= e!140270 (bvsle lt!320075 (bvmul lt!320073 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204930 (or (= lt!320073 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!320073 #b0000000000000000000000000000000000000000000000000000000000001000) lt!320073)))))

(assert (=> b!204930 (= lt!320073 ((_ sign_extend 32) (size!4551 (buf!5056 thiss!1204))))))

(assert (= (and d!69847 res!171758) b!204929))

(assert (= (and b!204929 res!171757) b!204930))

(assert (=> d!69847 m!315831))

(assert (=> d!69847 m!315811))

(assert (=> b!204718 d!69847))

(declare-fun b!204942 () Bool)

(declare-fun e!140276 () Bool)

(declare-fun e!140275 () Bool)

(assert (=> b!204942 (= e!140276 e!140275)))

(declare-fun res!171770 () Bool)

(assert (=> b!204942 (=> (not res!171770) (not e!140275))))

(declare-fun lt!320084 () tuple2!17514)

(declare-fun lt!320086 () tuple2!17512)

(assert (=> b!204942 (= res!171770 (and (= (_2!9409 lt!320084) lt!319598) (= (_1!9409 lt!320084) (_2!9408 lt!320086))))))

(assert (=> b!204942 (= lt!320084 (readBitPure!0 (readerFrom!0 (_2!9408 lt!320086) (currentBit!9536 thiss!1204) (currentByte!9541 thiss!1204))))))

(declare-fun b!204941 () Bool)

(declare-fun res!171767 () Bool)

(assert (=> b!204941 (=> (not res!171767) (not e!140276))))

(assert (=> b!204941 (= res!171767 (isPrefixOf!0 thiss!1204 (_2!9408 lt!320086)))))

(declare-fun b!204943 () Bool)

(assert (=> b!204943 (= e!140275 (= (bitIndex!0 (size!4551 (buf!5056 (_1!9409 lt!320084))) (currentByte!9541 (_1!9409 lt!320084)) (currentBit!9536 (_1!9409 lt!320084))) (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!320086))) (currentByte!9541 (_2!9408 lt!320086)) (currentBit!9536 (_2!9408 lt!320086)))))))

(declare-fun d!69849 () Bool)

(assert (=> d!69849 e!140276))

(declare-fun res!171769 () Bool)

(assert (=> d!69849 (=> (not res!171769) (not e!140276))))

(assert (=> d!69849 (= res!171769 (= (size!4551 (buf!5056 thiss!1204)) (size!4551 (buf!5056 (_2!9408 lt!320086)))))))

(declare-fun choose!16 (BitStream!8210 Bool) tuple2!17512)

(assert (=> d!69849 (= lt!320086 (choose!16 thiss!1204 lt!319598))))

(assert (=> d!69849 (validate_offset_bit!0 ((_ sign_extend 32) (size!4551 (buf!5056 thiss!1204))) ((_ sign_extend 32) (currentByte!9541 thiss!1204)) ((_ sign_extend 32) (currentBit!9536 thiss!1204)))))

(assert (=> d!69849 (= (appendBit!0 thiss!1204 lt!319598) lt!320086)))

(declare-fun b!204940 () Bool)

(declare-fun res!171768 () Bool)

(assert (=> b!204940 (=> (not res!171768) (not e!140276))))

(declare-fun lt!320085 () (_ BitVec 64))

(declare-fun lt!320087 () (_ BitVec 64))

(assert (=> b!204940 (= res!171768 (= (bitIndex!0 (size!4551 (buf!5056 (_2!9408 lt!320086))) (currentByte!9541 (_2!9408 lt!320086)) (currentBit!9536 (_2!9408 lt!320086))) (bvadd lt!320085 lt!320087)))))

(assert (=> b!204940 (or (not (= (bvand lt!320085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320087 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!320085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!320085 lt!320087) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204940 (= lt!320087 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!204940 (= lt!320085 (bitIndex!0 (size!4551 (buf!5056 thiss!1204)) (currentByte!9541 thiss!1204) (currentBit!9536 thiss!1204)))))

(assert (= (and d!69849 res!171769) b!204940))

(assert (= (and b!204940 res!171768) b!204941))

(assert (= (and b!204941 res!171767) b!204942))

(assert (= (and b!204942 res!171770) b!204943))

(declare-fun m!316097 () Bool)

(assert (=> b!204943 m!316097))

(declare-fun m!316099 () Bool)

(assert (=> b!204943 m!316099))

(declare-fun m!316101 () Bool)

(assert (=> d!69849 m!316101))

(declare-fun m!316103 () Bool)

(assert (=> d!69849 m!316103))

(declare-fun m!316105 () Bool)

(assert (=> b!204941 m!316105))

(assert (=> b!204940 m!316099))

(assert (=> b!204940 m!315783))

(declare-fun m!316107 () Bool)

(assert (=> b!204942 m!316107))

(assert (=> b!204942 m!316107))

(declare-fun m!316109 () Bool)

(assert (=> b!204942 m!316109))

(assert (=> b!204718 d!69849))

(declare-fun d!69851 () Bool)

(declare-fun e!140277 () Bool)

(assert (=> d!69851 e!140277))

(declare-fun res!171772 () Bool)

(assert (=> d!69851 (=> (not res!171772) (not e!140277))))

(declare-fun lt!320089 () (_ BitVec 64))

(declare-fun lt!320093 () (_ BitVec 64))

(declare-fun lt!320088 () (_ BitVec 64))

(assert (=> d!69851 (= res!171772 (= lt!320093 (bvsub lt!320088 lt!320089)))))

(assert (=> d!69851 (or (= (bvand lt!320088 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320089 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!320088 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!320088 lt!320089) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69851 (= lt!320089 (remainingBits!0 ((_ sign_extend 32) (size!4551 (buf!5056 (_1!9409 lt!319594)))) ((_ sign_extend 32) (currentByte!9541 (_1!9409 lt!319594))) ((_ sign_extend 32) (currentBit!9536 (_1!9409 lt!319594)))))))

(declare-fun lt!320092 () (_ BitVec 64))

(declare-fun lt!320090 () (_ BitVec 64))

(assert (=> d!69851 (= lt!320088 (bvmul lt!320092 lt!320090))))

(assert (=> d!69851 (or (= lt!320092 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!320090 (bvsdiv (bvmul lt!320092 lt!320090) lt!320092)))))

(assert (=> d!69851 (= lt!320090 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69851 (= lt!320092 ((_ sign_extend 32) (size!4551 (buf!5056 (_1!9409 lt!319594)))))))

(assert (=> d!69851 (= lt!320093 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9541 (_1!9409 lt!319594))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9536 (_1!9409 lt!319594)))))))

(assert (=> d!69851 (invariant!0 (currentBit!9536 (_1!9409 lt!319594)) (currentByte!9541 (_1!9409 lt!319594)) (size!4551 (buf!5056 (_1!9409 lt!319594))))))

(assert (=> d!69851 (= (bitIndex!0 (size!4551 (buf!5056 (_1!9409 lt!319594))) (currentByte!9541 (_1!9409 lt!319594)) (currentBit!9536 (_1!9409 lt!319594))) lt!320093)))

(declare-fun b!204944 () Bool)

(declare-fun res!171771 () Bool)

(assert (=> b!204944 (=> (not res!171771) (not e!140277))))

(assert (=> b!204944 (= res!171771 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!320093))))

(declare-fun b!204945 () Bool)

(declare-fun lt!320091 () (_ BitVec 64))

(assert (=> b!204945 (= e!140277 (bvsle lt!320093 (bvmul lt!320091 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204945 (or (= lt!320091 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!320091 #b0000000000000000000000000000000000000000000000000000000000001000) lt!320091)))))

(assert (=> b!204945 (= lt!320091 ((_ sign_extend 32) (size!4551 (buf!5056 (_1!9409 lt!319594)))))))

(assert (= (and d!69851 res!171772) b!204944))

(assert (= (and b!204944 res!171771) b!204945))

(declare-fun m!316111 () Bool)

(assert (=> d!69851 m!316111))

(declare-fun m!316113 () Bool)

(assert (=> d!69851 m!316113))

(assert (=> b!204717 d!69851))

(declare-fun d!69853 () Bool)

(assert (=> d!69853 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4551 (buf!5056 (_2!9408 lt!319590)))) ((_ sign_extend 32) (currentByte!9541 thiss!1204)) ((_ sign_extend 32) (currentBit!9536 thiss!1204))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4551 (buf!5056 (_2!9408 lt!319590)))) ((_ sign_extend 32) (currentByte!9541 thiss!1204)) ((_ sign_extend 32) (currentBit!9536 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!17187 () Bool)

(assert (= bs!17187 d!69853))

(declare-fun m!316115 () Bool)

(assert (=> bs!17187 m!316115))

(assert (=> b!204708 d!69853))

(declare-fun d!69855 () Bool)

(declare-datatypes ((tuple2!17526 0))(
  ( (tuple2!17527 (_1!9415 Bool) (_2!9415 BitStream!8210)) )
))
(declare-fun lt!320096 () tuple2!17526)

(declare-fun readBit!0 (BitStream!8210) tuple2!17526)

(assert (=> d!69855 (= lt!320096 (readBit!0 (readerFrom!0 (_2!9408 lt!319590) (currentBit!9536 thiss!1204) (currentByte!9541 thiss!1204))))))

(assert (=> d!69855 (= (readBitPure!0 (readerFrom!0 (_2!9408 lt!319590) (currentBit!9536 thiss!1204) (currentByte!9541 thiss!1204))) (tuple2!17515 (_2!9415 lt!320096) (_1!9415 lt!320096)))))

(declare-fun bs!17188 () Bool)

(assert (= bs!17188 d!69855))

(assert (=> bs!17188 m!315813))

(declare-fun m!316117 () Bool)

(assert (=> bs!17188 m!316117))

(assert (=> b!204715 d!69855))

(declare-fun d!69857 () Bool)

(declare-fun e!140280 () Bool)

(assert (=> d!69857 e!140280))

(declare-fun res!171776 () Bool)

(assert (=> d!69857 (=> (not res!171776) (not e!140280))))

(assert (=> d!69857 (= res!171776 (invariant!0 (currentBit!9536 (_2!9408 lt!319590)) (currentByte!9541 (_2!9408 lt!319590)) (size!4551 (buf!5056 (_2!9408 lt!319590)))))))

(assert (=> d!69857 (= (readerFrom!0 (_2!9408 lt!319590) (currentBit!9536 thiss!1204) (currentByte!9541 thiss!1204)) (BitStream!8211 (buf!5056 (_2!9408 lt!319590)) (currentByte!9541 thiss!1204) (currentBit!9536 thiss!1204)))))

(declare-fun b!204948 () Bool)

(assert (=> b!204948 (= e!140280 (invariant!0 (currentBit!9536 thiss!1204) (currentByte!9541 thiss!1204) (size!4551 (buf!5056 (_2!9408 lt!319590)))))))

(assert (= (and d!69857 res!171776) b!204948))

(assert (=> d!69857 m!316095))

(assert (=> b!204948 m!315791))

(assert (=> b!204715 d!69857))

(assert (=> b!204716 d!69845))

(assert (=> b!204716 d!69847))

(push 1)

(assert (not b!204913))

(assert (not b!204769))

(assert (not b!204920))

(assert (not d!69847))

(assert (not b!204915))

(assert (not b!204914))

(assert (not b!204926))

(assert (not b!204752))

(assert (not d!69775))

(assert (not d!69857))

(assert (not d!69761))

(assert (not b!204911))

(assert (not d!69851))

(assert (not b!204942))

(assert (not b!204923))

(assert (not d!69853))

(assert (not d!69855))

(assert (not b!204941))

(assert (not b!204922))

(assert (not d!69845))

(assert (not d!69785))

(assert (not d!69849))

(assert (not d!69783))

(assert (not b!204924))

(assert (not b!204751))

(assert (not b!204943))

(assert (not b!204771))

(assert (not b!204754))

(assert (not bm!3237))

(assert (not b!204948))

(assert (not b!204912))

(assert (not b!204749))

(assert (not d!69759))

(assert (not b!204940))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

