; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24972 () Bool)

(assert start!24972)

(declare-fun b!126504 () Bool)

(declare-fun res!104833 () Bool)

(declare-fun e!83384 () Bool)

(assert (=> b!126504 (=> res!104833 e!83384)))

(declare-datatypes ((array!5723 0))(
  ( (array!5724 (arr!3195 (Array (_ BitVec 32) (_ BitVec 8))) (size!2590 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4504 0))(
  ( (BitStream!4505 (buf!2972 array!5723) (currentByte!5705 (_ BitVec 32)) (currentBit!5700 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4504)

(declare-datatypes ((Unit!7783 0))(
  ( (Unit!7784) )
))
(declare-datatypes ((tuple2!10606 0))(
  ( (tuple2!10607 (_1!5585 Unit!7783) (_2!5585 BitStream!4504)) )
))
(declare-fun lt!197628 () tuple2!10606)

(declare-fun isPrefixOf!0 (BitStream!4504 BitStream!4504) Bool)

(assert (=> b!126504 (= res!104833 (not (isPrefixOf!0 thiss!1614 (_2!5585 lt!197628))))))

(declare-fun b!126505 () Bool)

(declare-fun e!83383 () Bool)

(assert (=> b!126505 (= e!83383 (not e!83384))))

(declare-fun res!104832 () Bool)

(assert (=> b!126505 (=> res!104832 e!83384)))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126505 (= res!104832 (not (= (bitIndex!0 (size!2590 (buf!2972 (_2!5585 lt!197628))) (currentByte!5705 (_2!5585 lt!197628)) (currentBit!5700 (_2!5585 lt!197628))) (bvadd (bitIndex!0 (size!2590 (buf!2972 thiss!1614)) (currentByte!5705 thiss!1614) (currentBit!5700 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun e!83386 () Bool)

(assert (=> b!126505 e!83386))

(declare-fun res!104831 () Bool)

(assert (=> b!126505 (=> (not res!104831) (not e!83386))))

(assert (=> b!126505 (= res!104831 (= (size!2590 (buf!2972 thiss!1614)) (size!2590 (buf!2972 (_2!5585 lt!197628)))))))

(declare-fun arr!227 () array!5723)

(declare-fun appendByteArrayLoop!0 (BitStream!4504 array!5723 (_ BitVec 32) (_ BitVec 32)) tuple2!10606)

(assert (=> b!126505 (= lt!197628 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126506 () Bool)

(declare-fun e!83388 () Bool)

(declare-fun e!83389 () Bool)

(assert (=> b!126506 (= e!83388 (not e!83389))))

(declare-fun res!104836 () Bool)

(assert (=> b!126506 (=> res!104836 e!83389)))

(declare-datatypes ((tuple2!10608 0))(
  ( (tuple2!10609 (_1!5586 BitStream!4504) (_2!5586 array!5723)) )
))
(declare-fun lt!197629 () tuple2!10608)

(declare-datatypes ((tuple2!10610 0))(
  ( (tuple2!10611 (_1!5587 BitStream!4504) (_2!5587 BitStream!4504)) )
))
(declare-fun lt!197625 () tuple2!10610)

(assert (=> b!126506 (= res!104836 (or (not (= (size!2590 (_2!5586 lt!197629)) (size!2590 arr!227))) (not (= (_1!5586 lt!197629) (_2!5587 lt!197625)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4504 array!5723 (_ BitVec 32) (_ BitVec 32)) tuple2!10608)

(assert (=> b!126506 (= lt!197629 (readByteArrayLoopPure!0 (_1!5587 lt!197625) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!197624 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126506 (validate_offset_bits!1 ((_ sign_extend 32) (size!2590 (buf!2972 (_2!5585 lt!197628)))) ((_ sign_extend 32) (currentByte!5705 thiss!1614)) ((_ sign_extend 32) (currentBit!5700 thiss!1614)) lt!197624)))

(declare-fun lt!197626 () Unit!7783)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4504 array!5723 (_ BitVec 64)) Unit!7783)

(assert (=> b!126506 (= lt!197626 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2972 (_2!5585 lt!197628)) lt!197624))))

(declare-fun reader!0 (BitStream!4504 BitStream!4504) tuple2!10610)

(assert (=> b!126506 (= lt!197625 (reader!0 thiss!1614 (_2!5585 lt!197628)))))

(declare-fun b!126507 () Bool)

(declare-fun res!104835 () Bool)

(assert (=> b!126507 (=> (not res!104835) (not e!83388))))

(assert (=> b!126507 (= res!104835 (isPrefixOf!0 thiss!1614 (_2!5585 lt!197628)))))

(declare-fun res!104834 () Bool)

(assert (=> start!24972 (=> (not res!104834) (not e!83383))))

(assert (=> start!24972 (= res!104834 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2590 arr!227))))))

(assert (=> start!24972 e!83383))

(assert (=> start!24972 true))

(declare-fun array_inv!2379 (array!5723) Bool)

(assert (=> start!24972 (array_inv!2379 arr!227)))

(declare-fun e!83390 () Bool)

(declare-fun inv!12 (BitStream!4504) Bool)

(assert (=> start!24972 (and (inv!12 thiss!1614) e!83390)))

(declare-fun b!126508 () Bool)

(assert (=> b!126508 (= e!83386 e!83388)))

(declare-fun res!104830 () Bool)

(assert (=> b!126508 (=> (not res!104830) (not e!83388))))

(assert (=> b!126508 (= res!104830 (= (bitIndex!0 (size!2590 (buf!2972 (_2!5585 lt!197628))) (currentByte!5705 (_2!5585 lt!197628)) (currentBit!5700 (_2!5585 lt!197628))) (bvadd (bitIndex!0 (size!2590 (buf!2972 thiss!1614)) (currentByte!5705 thiss!1614) (currentBit!5700 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!197624))))))

(assert (=> b!126508 (= lt!197624 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!126509 () Bool)

(declare-fun lt!197630 () tuple2!10610)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126509 (= e!83384 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2590 (buf!2972 (_1!5587 lt!197630)))) ((_ sign_extend 32) (currentByte!5705 (_1!5587 lt!197630))) ((_ sign_extend 32) (currentBit!5700 (_1!5587 lt!197630))) noOfBytes!1))))

(assert (=> b!126509 (validate_offset_bits!1 ((_ sign_extend 32) (size!2590 (buf!2972 (_2!5585 lt!197628)))) ((_ sign_extend 32) (currentByte!5705 thiss!1614)) ((_ sign_extend 32) (currentBit!5700 thiss!1614)) ((_ sign_extend 32) noOfBytes!1))))

(declare-fun lt!197627 () Unit!7783)

(assert (=> b!126509 (= lt!197627 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2972 (_2!5585 lt!197628)) ((_ sign_extend 32) noOfBytes!1)))))

(assert (=> b!126509 (= lt!197630 (reader!0 thiss!1614 (_2!5585 lt!197628)))))

(declare-fun b!126510 () Bool)

(declare-fun res!104829 () Bool)

(assert (=> b!126510 (=> (not res!104829) (not e!83383))))

(assert (=> b!126510 (= res!104829 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2590 (buf!2972 thiss!1614))) ((_ sign_extend 32) (currentByte!5705 thiss!1614)) ((_ sign_extend 32) (currentBit!5700 thiss!1614)) noOfBytes!1))))

(declare-fun b!126511 () Bool)

(declare-fun arrayRangesEq!77 (array!5723 array!5723 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126511 (= e!83389 (not (arrayRangesEq!77 arr!227 (_2!5586 lt!197629) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!126512 () Bool)

(assert (=> b!126512 (= e!83390 (array_inv!2379 (buf!2972 thiss!1614)))))

(assert (= (and start!24972 res!104834) b!126510))

(assert (= (and b!126510 res!104829) b!126505))

(assert (= (and b!126505 res!104831) b!126508))

(assert (= (and b!126508 res!104830) b!126507))

(assert (= (and b!126507 res!104835) b!126506))

(assert (= (and b!126506 (not res!104836)) b!126511))

(assert (= (and b!126505 (not res!104832)) b!126504))

(assert (= (and b!126504 (not res!104833)) b!126509))

(assert (= start!24972 b!126512))

(declare-fun m!192003 () Bool)

(assert (=> b!126510 m!192003))

(declare-fun m!192005 () Bool)

(assert (=> start!24972 m!192005))

(declare-fun m!192007 () Bool)

(assert (=> start!24972 m!192007))

(declare-fun m!192009 () Bool)

(assert (=> b!126506 m!192009))

(declare-fun m!192011 () Bool)

(assert (=> b!126506 m!192011))

(declare-fun m!192013 () Bool)

(assert (=> b!126506 m!192013))

(declare-fun m!192015 () Bool)

(assert (=> b!126506 m!192015))

(declare-fun m!192017 () Bool)

(assert (=> b!126505 m!192017))

(declare-fun m!192019 () Bool)

(assert (=> b!126505 m!192019))

(declare-fun m!192021 () Bool)

(assert (=> b!126505 m!192021))

(assert (=> b!126508 m!192017))

(assert (=> b!126508 m!192019))

(declare-fun m!192023 () Bool)

(assert (=> b!126504 m!192023))

(declare-fun m!192025 () Bool)

(assert (=> b!126509 m!192025))

(declare-fun m!192027 () Bool)

(assert (=> b!126509 m!192027))

(declare-fun m!192029 () Bool)

(assert (=> b!126509 m!192029))

(assert (=> b!126509 m!192015))

(declare-fun m!192031 () Bool)

(assert (=> b!126512 m!192031))

(assert (=> b!126507 m!192023))

(declare-fun m!192033 () Bool)

(assert (=> b!126511 m!192033))

(push 1)

(assert (not b!126509))

(assert (not b!126508))

(assert (not start!24972))

(assert (not b!126510))

(assert (not b!126504))

(assert (not b!126505))

(assert (not b!126507))

(assert (not b!126506))

(assert (not b!126511))

(assert (not b!126512))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!41030 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!41030 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2590 (buf!2972 (_1!5587 lt!197630)))) ((_ sign_extend 32) (currentByte!5705 (_1!5587 lt!197630))) ((_ sign_extend 32) (currentBit!5700 (_1!5587 lt!197630))) noOfBytes!1) (bvsle ((_ sign_extend 32) noOfBytes!1) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2590 (buf!2972 (_1!5587 lt!197630)))) ((_ sign_extend 32) (currentByte!5705 (_1!5587 lt!197630))) ((_ sign_extend 32) (currentBit!5700 (_1!5587 lt!197630)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!9944 () Bool)

(assert (= bs!9944 d!41030))

(declare-fun m!192099 () Bool)

(assert (=> bs!9944 m!192099))

(assert (=> b!126509 d!41030))

(declare-fun d!41032 () Bool)

(assert (=> d!41032 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2590 (buf!2972 (_2!5585 lt!197628)))) ((_ sign_extend 32) (currentByte!5705 thiss!1614)) ((_ sign_extend 32) (currentBit!5700 thiss!1614)) ((_ sign_extend 32) noOfBytes!1)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2590 (buf!2972 (_2!5585 lt!197628)))) ((_ sign_extend 32) (currentByte!5705 thiss!1614)) ((_ sign_extend 32) (currentBit!5700 thiss!1614))) ((_ sign_extend 32) noOfBytes!1)))))

(declare-fun bs!9945 () Bool)

(assert (= bs!9945 d!41032))

(declare-fun m!192101 () Bool)

(assert (=> bs!9945 m!192101))

(assert (=> b!126509 d!41032))

(declare-fun d!41034 () Bool)

(assert (=> d!41034 (validate_offset_bits!1 ((_ sign_extend 32) (size!2590 (buf!2972 (_2!5585 lt!197628)))) ((_ sign_extend 32) (currentByte!5705 thiss!1614)) ((_ sign_extend 32) (currentBit!5700 thiss!1614)) ((_ sign_extend 32) noOfBytes!1))))

(declare-fun lt!197675 () Unit!7783)

(declare-fun choose!9 (BitStream!4504 array!5723 (_ BitVec 64) BitStream!4504) Unit!7783)

(assert (=> d!41034 (= lt!197675 (choose!9 thiss!1614 (buf!2972 (_2!5585 lt!197628)) ((_ sign_extend 32) noOfBytes!1) (BitStream!4505 (buf!2972 (_2!5585 lt!197628)) (currentByte!5705 thiss!1614) (currentBit!5700 thiss!1614))))))

(assert (=> d!41034 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2972 (_2!5585 lt!197628)) ((_ sign_extend 32) noOfBytes!1)) lt!197675)))

(declare-fun bs!9946 () Bool)

(assert (= bs!9946 d!41034))

(assert (=> bs!9946 m!192027))

(declare-fun m!192103 () Bool)

(assert (=> bs!9946 m!192103))

(assert (=> b!126509 d!41034))

(declare-fun lt!197749 () (_ BitVec 64))

(declare-fun e!83460 () Bool)

(declare-fun b!126603 () Bool)

(declare-fun lt!197765 () tuple2!10610)

(declare-fun lt!197758 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4504 (_ BitVec 64)) BitStream!4504)

(assert (=> b!126603 (= e!83460 (= (_1!5587 lt!197765) (withMovedBitIndex!0 (_2!5587 lt!197765) (bvsub lt!197749 lt!197758))))))

(assert (=> b!126603 (or (= (bvand lt!197749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197758 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!197749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!197749 lt!197758) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126603 (= lt!197758 (bitIndex!0 (size!2590 (buf!2972 (_2!5585 lt!197628))) (currentByte!5705 (_2!5585 lt!197628)) (currentBit!5700 (_2!5585 lt!197628))))))

(assert (=> b!126603 (= lt!197749 (bitIndex!0 (size!2590 (buf!2972 thiss!1614)) (currentByte!5705 thiss!1614) (currentBit!5700 thiss!1614)))))

(declare-fun b!126604 () Bool)

(declare-fun e!83459 () Unit!7783)

(declare-fun lt!197763 () Unit!7783)

(assert (=> b!126604 (= e!83459 lt!197763)))

(declare-fun lt!197754 () (_ BitVec 64))

(assert (=> b!126604 (= lt!197754 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!197753 () (_ BitVec 64))

(assert (=> b!126604 (= lt!197753 (bitIndex!0 (size!2590 (buf!2972 thiss!1614)) (currentByte!5705 thiss!1614) (currentBit!5700 thiss!1614)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5723 array!5723 (_ BitVec 64) (_ BitVec 64)) Unit!7783)

(assert (=> b!126604 (= lt!197763 (arrayBitRangesEqSymmetric!0 (buf!2972 thiss!1614) (buf!2972 (_2!5585 lt!197628)) lt!197754 lt!197753))))

(declare-fun arrayBitRangesEq!0 (array!5723 array!5723 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126604 (arrayBitRangesEq!0 (buf!2972 (_2!5585 lt!197628)) (buf!2972 thiss!1614) lt!197754 lt!197753)))

(declare-fun b!126605 () Bool)

(declare-fun res!104918 () Bool)

(assert (=> b!126605 (=> (not res!104918) (not e!83460))))

(assert (=> b!126605 (= res!104918 (isPrefixOf!0 (_1!5587 lt!197765) thiss!1614))))

(declare-fun b!126606 () Bool)

(declare-fun res!104917 () Bool)

(assert (=> b!126606 (=> (not res!104917) (not e!83460))))

(assert (=> b!126606 (= res!104917 (isPrefixOf!0 (_2!5587 lt!197765) (_2!5585 lt!197628)))))

(declare-fun b!126607 () Bool)

(declare-fun Unit!7789 () Unit!7783)

(assert (=> b!126607 (= e!83459 Unit!7789)))

(declare-fun d!41036 () Bool)

(assert (=> d!41036 e!83460))

(declare-fun res!104919 () Bool)

(assert (=> d!41036 (=> (not res!104919) (not e!83460))))

(assert (=> d!41036 (= res!104919 (isPrefixOf!0 (_1!5587 lt!197765) (_2!5587 lt!197765)))))

(declare-fun lt!197757 () BitStream!4504)

(assert (=> d!41036 (= lt!197765 (tuple2!10611 lt!197757 (_2!5585 lt!197628)))))

(declare-fun lt!197759 () Unit!7783)

(declare-fun lt!197751 () Unit!7783)

(assert (=> d!41036 (= lt!197759 lt!197751)))

(assert (=> d!41036 (isPrefixOf!0 lt!197757 (_2!5585 lt!197628))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4504 BitStream!4504 BitStream!4504) Unit!7783)

(assert (=> d!41036 (= lt!197751 (lemmaIsPrefixTransitive!0 lt!197757 (_2!5585 lt!197628) (_2!5585 lt!197628)))))

(declare-fun lt!197761 () Unit!7783)

(declare-fun lt!197760 () Unit!7783)

(assert (=> d!41036 (= lt!197761 lt!197760)))

(assert (=> d!41036 (isPrefixOf!0 lt!197757 (_2!5585 lt!197628))))

(assert (=> d!41036 (= lt!197760 (lemmaIsPrefixTransitive!0 lt!197757 thiss!1614 (_2!5585 lt!197628)))))

(declare-fun lt!197755 () Unit!7783)

(assert (=> d!41036 (= lt!197755 e!83459)))

(declare-fun c!7488 () Bool)

(assert (=> d!41036 (= c!7488 (not (= (size!2590 (buf!2972 thiss!1614)) #b00000000000000000000000000000000)))))

(declare-fun lt!197746 () Unit!7783)

(declare-fun lt!197748 () Unit!7783)

(assert (=> d!41036 (= lt!197746 lt!197748)))

(assert (=> d!41036 (isPrefixOf!0 (_2!5585 lt!197628) (_2!5585 lt!197628))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4504) Unit!7783)

(assert (=> d!41036 (= lt!197748 (lemmaIsPrefixRefl!0 (_2!5585 lt!197628)))))

(declare-fun lt!197764 () Unit!7783)

(declare-fun lt!197747 () Unit!7783)

(assert (=> d!41036 (= lt!197764 lt!197747)))

(assert (=> d!41036 (= lt!197747 (lemmaIsPrefixRefl!0 (_2!5585 lt!197628)))))

(declare-fun lt!197750 () Unit!7783)

(declare-fun lt!197752 () Unit!7783)

(assert (=> d!41036 (= lt!197750 lt!197752)))

(assert (=> d!41036 (isPrefixOf!0 lt!197757 lt!197757)))

(assert (=> d!41036 (= lt!197752 (lemmaIsPrefixRefl!0 lt!197757))))

(declare-fun lt!197762 () Unit!7783)

(declare-fun lt!197756 () Unit!7783)

(assert (=> d!41036 (= lt!197762 lt!197756)))

(assert (=> d!41036 (isPrefixOf!0 thiss!1614 thiss!1614)))

(assert (=> d!41036 (= lt!197756 (lemmaIsPrefixRefl!0 thiss!1614))))

(assert (=> d!41036 (= lt!197757 (BitStream!4505 (buf!2972 (_2!5585 lt!197628)) (currentByte!5705 thiss!1614) (currentBit!5700 thiss!1614)))))

(assert (=> d!41036 (isPrefixOf!0 thiss!1614 (_2!5585 lt!197628))))

(assert (=> d!41036 (= (reader!0 thiss!1614 (_2!5585 lt!197628)) lt!197765)))

(assert (= (and d!41036 c!7488) b!126604))

(assert (= (and d!41036 (not c!7488)) b!126607))

(assert (= (and d!41036 res!104919) b!126605))

(assert (= (and b!126605 res!104918) b!126606))

(assert (= (and b!126606 res!104917) b!126603))

(declare-fun m!192127 () Bool)

(assert (=> d!41036 m!192127))

(declare-fun m!192129 () Bool)

(assert (=> d!41036 m!192129))

(declare-fun m!192131 () Bool)

(assert (=> d!41036 m!192131))

(declare-fun m!192133 () Bool)

(assert (=> d!41036 m!192133))

(declare-fun m!192135 () Bool)

(assert (=> d!41036 m!192135))

(declare-fun m!192137 () Bool)

(assert (=> d!41036 m!192137))

(assert (=> d!41036 m!192023))

(declare-fun m!192139 () Bool)

(assert (=> d!41036 m!192139))

(declare-fun m!192141 () Bool)

(assert (=> d!41036 m!192141))

(declare-fun m!192143 () Bool)

(assert (=> d!41036 m!192143))

(declare-fun m!192145 () Bool)

(assert (=> d!41036 m!192145))

(declare-fun m!192147 () Bool)

(assert (=> b!126603 m!192147))

(assert (=> b!126603 m!192017))

(assert (=> b!126603 m!192019))

(declare-fun m!192149 () Bool)

(assert (=> b!126606 m!192149))

(declare-fun m!192151 () Bool)

(assert (=> b!126605 m!192151))

(assert (=> b!126604 m!192019))

(declare-fun m!192153 () Bool)

(assert (=> b!126604 m!192153))

(declare-fun m!192155 () Bool)

(assert (=> b!126604 m!192155))

(assert (=> b!126509 d!41036))

(declare-fun d!41064 () Bool)

(declare-fun res!104928 () Bool)

(declare-fun e!83465 () Bool)

(assert (=> d!41064 (=> (not res!104928) (not e!83465))))

(assert (=> d!41064 (= res!104928 (= (size!2590 (buf!2972 thiss!1614)) (size!2590 (buf!2972 (_2!5585 lt!197628)))))))

(assert (=> d!41064 (= (isPrefixOf!0 thiss!1614 (_2!5585 lt!197628)) e!83465)))

(declare-fun b!126614 () Bool)

(declare-fun res!104927 () Bool)

(assert (=> b!126614 (=> (not res!104927) (not e!83465))))

(assert (=> b!126614 (= res!104927 (bvsle (bitIndex!0 (size!2590 (buf!2972 thiss!1614)) (currentByte!5705 thiss!1614) (currentBit!5700 thiss!1614)) (bitIndex!0 (size!2590 (buf!2972 (_2!5585 lt!197628))) (currentByte!5705 (_2!5585 lt!197628)) (currentBit!5700 (_2!5585 lt!197628)))))))

(declare-fun b!126615 () Bool)

(declare-fun e!83466 () Bool)

(assert (=> b!126615 (= e!83465 e!83466)))

(declare-fun res!104926 () Bool)

(assert (=> b!126615 (=> res!104926 e!83466)))

(assert (=> b!126615 (= res!104926 (= (size!2590 (buf!2972 thiss!1614)) #b00000000000000000000000000000000))))

(declare-fun b!126616 () Bool)

(assert (=> b!126616 (= e!83466 (arrayBitRangesEq!0 (buf!2972 thiss!1614) (buf!2972 (_2!5585 lt!197628)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2590 (buf!2972 thiss!1614)) (currentByte!5705 thiss!1614) (currentBit!5700 thiss!1614))))))

(assert (= (and d!41064 res!104928) b!126614))

(assert (= (and b!126614 res!104927) b!126615))

(assert (= (and b!126615 (not res!104926)) b!126616))

(assert (=> b!126614 m!192019))

(assert (=> b!126614 m!192017))

(assert (=> b!126616 m!192019))

(assert (=> b!126616 m!192019))

(declare-fun m!192159 () Bool)

(assert (=> b!126616 m!192159))

(assert (=> b!126504 d!41064))

(declare-fun d!41068 () Bool)

(assert (=> d!41068 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2590 (buf!2972 thiss!1614))) ((_ sign_extend 32) (currentByte!5705 thiss!1614)) ((_ sign_extend 32) (currentBit!5700 thiss!1614)) noOfBytes!1) (bvsle ((_ sign_extend 32) noOfBytes!1) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2590 (buf!2972 thiss!1614))) ((_ sign_extend 32) (currentByte!5705 thiss!1614)) ((_ sign_extend 32) (currentBit!5700 thiss!1614))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!9954 () Bool)

(assert (= bs!9954 d!41068))

(declare-fun m!192161 () Bool)

(assert (=> bs!9954 m!192161))

(assert (=> b!126510 d!41068))

(declare-fun d!41070 () Bool)

(declare-fun e!83469 () Bool)

(assert (=> d!41070 e!83469))

(declare-fun res!104933 () Bool)

(assert (=> d!41070 (=> (not res!104933) (not e!83469))))

(declare-fun lt!197782 () (_ BitVec 64))

(declare-fun lt!197781 () (_ BitVec 64))

(declare-fun lt!197783 () (_ BitVec 64))

(assert (=> d!41070 (= res!104933 (= lt!197781 (bvsub lt!197782 lt!197783)))))

(assert (=> d!41070 (or (= (bvand lt!197782 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197783 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!197782 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!197782 lt!197783) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41070 (= lt!197783 (remainingBits!0 ((_ sign_extend 32) (size!2590 (buf!2972 (_2!5585 lt!197628)))) ((_ sign_extend 32) (currentByte!5705 (_2!5585 lt!197628))) ((_ sign_extend 32) (currentBit!5700 (_2!5585 lt!197628)))))))

(declare-fun lt!197786 () (_ BitVec 64))

(declare-fun lt!197785 () (_ BitVec 64))

(assert (=> d!41070 (= lt!197782 (bvmul lt!197786 lt!197785))))

(assert (=> d!41070 (or (= lt!197786 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!197785 (bvsdiv (bvmul lt!197786 lt!197785) lt!197786)))))

(assert (=> d!41070 (= lt!197785 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41070 (= lt!197786 ((_ sign_extend 32) (size!2590 (buf!2972 (_2!5585 lt!197628)))))))

(assert (=> d!41070 (= lt!197781 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5705 (_2!5585 lt!197628))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5700 (_2!5585 lt!197628)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!41070 (invariant!0 (currentBit!5700 (_2!5585 lt!197628)) (currentByte!5705 (_2!5585 lt!197628)) (size!2590 (buf!2972 (_2!5585 lt!197628))))))

(assert (=> d!41070 (= (bitIndex!0 (size!2590 (buf!2972 (_2!5585 lt!197628))) (currentByte!5705 (_2!5585 lt!197628)) (currentBit!5700 (_2!5585 lt!197628))) lt!197781)))

(declare-fun b!126621 () Bool)

(declare-fun res!104934 () Bool)

(assert (=> b!126621 (=> (not res!104934) (not e!83469))))

(assert (=> b!126621 (= res!104934 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!197781))))

(declare-fun b!126622 () Bool)

(declare-fun lt!197784 () (_ BitVec 64))

(assert (=> b!126622 (= e!83469 (bvsle lt!197781 (bvmul lt!197784 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!126622 (or (= lt!197784 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!197784 #b0000000000000000000000000000000000000000000000000000000000001000) lt!197784)))))

(assert (=> b!126622 (= lt!197784 ((_ sign_extend 32) (size!2590 (buf!2972 (_2!5585 lt!197628)))))))

(assert (= (and d!41070 res!104933) b!126621))

(assert (= (and b!126621 res!104934) b!126622))

(declare-fun m!192163 () Bool)

(assert (=> d!41070 m!192163))

(declare-fun m!192165 () Bool)

(assert (=> d!41070 m!192165))

(assert (=> b!126508 d!41070))

(declare-fun d!41072 () Bool)

(declare-fun e!83470 () Bool)

(assert (=> d!41072 e!83470))

(declare-fun res!104935 () Bool)

(assert (=> d!41072 (=> (not res!104935) (not e!83470))))

(declare-fun lt!197789 () (_ BitVec 64))

(declare-fun lt!197788 () (_ BitVec 64))

(declare-fun lt!197787 () (_ BitVec 64))

(assert (=> d!41072 (= res!104935 (= lt!197787 (bvsub lt!197788 lt!197789)))))

(assert (=> d!41072 (or (= (bvand lt!197788 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197789 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!197788 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!197788 lt!197789) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41072 (= lt!197789 (remainingBits!0 ((_ sign_extend 32) (size!2590 (buf!2972 thiss!1614))) ((_ sign_extend 32) (currentByte!5705 thiss!1614)) ((_ sign_extend 32) (currentBit!5700 thiss!1614))))))

(declare-fun lt!197792 () (_ BitVec 64))

(declare-fun lt!197791 () (_ BitVec 64))

(assert (=> d!41072 (= lt!197788 (bvmul lt!197792 lt!197791))))

(assert (=> d!41072 (or (= lt!197792 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!197791 (bvsdiv (bvmul lt!197792 lt!197791) lt!197792)))))

(assert (=> d!41072 (= lt!197791 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41072 (= lt!197792 ((_ sign_extend 32) (size!2590 (buf!2972 thiss!1614))))))

(assert (=> d!41072 (= lt!197787 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5705 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5700 thiss!1614))))))

(assert (=> d!41072 (invariant!0 (currentBit!5700 thiss!1614) (currentByte!5705 thiss!1614) (size!2590 (buf!2972 thiss!1614)))))

(assert (=> d!41072 (= (bitIndex!0 (size!2590 (buf!2972 thiss!1614)) (currentByte!5705 thiss!1614) (currentBit!5700 thiss!1614)) lt!197787)))

(declare-fun b!126623 () Bool)

(declare-fun res!104936 () Bool)

(assert (=> b!126623 (=> (not res!104936) (not e!83470))))

(assert (=> b!126623 (= res!104936 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!197787))))

(declare-fun b!126624 () Bool)

(declare-fun lt!197790 () (_ BitVec 64))

(assert (=> b!126624 (= e!83470 (bvsle lt!197787 (bvmul lt!197790 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!126624 (or (= lt!197790 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!197790 #b0000000000000000000000000000000000000000000000000000000000001000) lt!197790)))))

(assert (=> b!126624 (= lt!197790 ((_ sign_extend 32) (size!2590 (buf!2972 thiss!1614))))))

(assert (= (and d!41072 res!104935) b!126623))

(assert (= (and b!126623 res!104936) b!126624))

(assert (=> d!41072 m!192161))

(declare-fun m!192167 () Bool)

(assert (=> d!41072 m!192167))

(assert (=> b!126508 d!41072))

(declare-fun d!41074 () Bool)

(assert (=> d!41074 (= (array_inv!2379 (buf!2972 thiss!1614)) (bvsge (size!2590 (buf!2972 thiss!1614)) #b00000000000000000000000000000000))))

(assert (=> b!126512 d!41074))

(declare-fun d!41076 () Bool)

(assert (=> d!41076 (= (array_inv!2379 arr!227) (bvsge (size!2590 arr!227) #b00000000000000000000000000000000))))

(assert (=> start!24972 d!41076))

(declare-fun d!41078 () Bool)

(assert (=> d!41078 (= (inv!12 thiss!1614) (invariant!0 (currentBit!5700 thiss!1614) (currentByte!5705 thiss!1614) (size!2590 (buf!2972 thiss!1614))))))

(declare-fun bs!9955 () Bool)

(assert (= bs!9955 d!41078))

(assert (=> bs!9955 m!192167))

(assert (=> start!24972 d!41078))

(assert (=> b!126507 d!41064))

(assert (=> b!126505 d!41070))

(assert (=> b!126505 d!41072))

(declare-fun b!126679 () Bool)

(declare-fun res!104979 () Bool)

(declare-fun e!83501 () Bool)

(assert (=> b!126679 (=> (not res!104979) (not e!83501))))

(declare-fun lt!197965 () (_ BitVec 64))

(declare-fun lt!197962 () tuple2!10606)

(declare-fun lt!197964 () (_ BitVec 64))

(assert (=> b!126679 (= res!104979 (= (bitIndex!0 (size!2590 (buf!2972 (_2!5585 lt!197962))) (currentByte!5705 (_2!5585 lt!197962)) (currentBit!5700 (_2!5585 lt!197962))) (bvadd lt!197964 lt!197965)))))

(assert (=> b!126679 (or (not (= (bvand lt!197964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197965 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!197964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!197964 lt!197965) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!197966 () (_ BitVec 64))

(assert (=> b!126679 (= lt!197965 (bvmul lt!197966 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!126679 (or (= lt!197966 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!197966 #b0000000000000000000000000000000000000000000000000000000000001000) lt!197966)))))

(assert (=> b!126679 (= lt!197966 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!126679 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!126679 (= lt!197964 (bitIndex!0 (size!2590 (buf!2972 thiss!1614)) (currentByte!5705 thiss!1614) (currentBit!5700 thiss!1614)))))

(declare-fun b!126680 () Bool)

(declare-fun e!83499 () Bool)

(assert (=> b!126680 (= e!83501 e!83499)))

(declare-fun res!104983 () Bool)

(assert (=> b!126680 (=> (not res!104983) (not e!83499))))

(declare-fun lt!197963 () tuple2!10608)

(declare-fun lt!197967 () tuple2!10610)

(assert (=> b!126680 (= res!104983 (and (= (size!2590 (_2!5586 lt!197963)) (size!2590 arr!227)) (= (_1!5586 lt!197963) (_2!5587 lt!197967))))))

(assert (=> b!126680 (= lt!197963 (readByteArrayLoopPure!0 (_1!5587 lt!197967) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!197959 () Unit!7783)

(declare-fun lt!197961 () Unit!7783)

(assert (=> b!126680 (= lt!197959 lt!197961)))

(declare-fun lt!197960 () (_ BitVec 64))

(assert (=> b!126680 (validate_offset_bits!1 ((_ sign_extend 32) (size!2590 (buf!2972 (_2!5585 lt!197962)))) ((_ sign_extend 32) (currentByte!5705 thiss!1614)) ((_ sign_extend 32) (currentBit!5700 thiss!1614)) lt!197960)))

(assert (=> b!126680 (= lt!197961 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2972 (_2!5585 lt!197962)) lt!197960))))

(declare-fun e!83500 () Bool)

(assert (=> b!126680 e!83500))

(declare-fun res!104982 () Bool)

(assert (=> b!126680 (=> (not res!104982) (not e!83500))))

(assert (=> b!126680 (= res!104982 (and (= (size!2590 (buf!2972 thiss!1614)) (size!2590 (buf!2972 (_2!5585 lt!197962)))) (bvsge lt!197960 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126680 (= lt!197960 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!126680 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!126680 (= lt!197967 (reader!0 thiss!1614 (_2!5585 lt!197962)))))

(declare-fun b!126681 () Bool)

(assert (=> b!126681 (= e!83499 (arrayRangesEq!77 arr!227 (_2!5586 lt!197963) #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126682 () Bool)

(assert (=> b!126682 (= e!83500 (validate_offset_bits!1 ((_ sign_extend 32) (size!2590 (buf!2972 thiss!1614))) ((_ sign_extend 32) (currentByte!5705 thiss!1614)) ((_ sign_extend 32) (currentBit!5700 thiss!1614)) lt!197960))))

(declare-fun d!41080 () Bool)

(assert (=> d!41080 e!83501))

(declare-fun res!104980 () Bool)

(assert (=> d!41080 (=> (not res!104980) (not e!83501))))

(assert (=> d!41080 (= res!104980 (= (size!2590 (buf!2972 thiss!1614)) (size!2590 (buf!2972 (_2!5585 lt!197962)))))))

(declare-fun choose!64 (BitStream!4504 array!5723 (_ BitVec 32) (_ BitVec 32)) tuple2!10606)

(assert (=> d!41080 (= lt!197962 (choose!64 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!41080 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2590 arr!227)))))

(assert (=> d!41080 (= (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1) lt!197962)))

(declare-fun b!126683 () Bool)

(declare-fun res!104981 () Bool)

(assert (=> b!126683 (=> (not res!104981) (not e!83501))))

(assert (=> b!126683 (= res!104981 (isPrefixOf!0 thiss!1614 (_2!5585 lt!197962)))))

(assert (= (and d!41080 res!104980) b!126679))

(assert (= (and b!126679 res!104979) b!126683))

(assert (= (and b!126683 res!104981) b!126680))

(assert (= (and b!126680 res!104982) b!126682))

(assert (= (and b!126680 res!104983) b!126681))

(declare-fun m!192247 () Bool)

(assert (=> b!126680 m!192247))

(declare-fun m!192249 () Bool)

(assert (=> b!126680 m!192249))

(declare-fun m!192251 () Bool)

(assert (=> b!126680 m!192251))

(declare-fun m!192253 () Bool)

(assert (=> b!126680 m!192253))

(declare-fun m!192255 () Bool)

(assert (=> d!41080 m!192255))

(declare-fun m!192257 () Bool)

(assert (=> b!126682 m!192257))

(declare-fun m!192259 () Bool)

(assert (=> b!126683 m!192259))

(declare-fun m!192261 () Bool)

(assert (=> b!126679 m!192261))

(assert (=> b!126679 m!192019))

(declare-fun m!192263 () Bool)

(assert (=> b!126681 m!192263))

(assert (=> b!126505 d!41080))

(declare-fun d!41102 () Bool)

(declare-fun res!104988 () Bool)

(declare-fun e!83506 () Bool)

(assert (=> d!41102 (=> res!104988 e!83506)))

(assert (=> d!41102 (= res!104988 (= #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!41102 (= (arrayRangesEq!77 arr!227 (_2!5586 lt!197629) #b00000000000000000000000000000000 noOfBytes!1) e!83506)))

(declare-fun b!126688 () Bool)

(declare-fun e!83507 () Bool)

(assert (=> b!126688 (= e!83506 e!83507)))

(declare-fun res!104989 () Bool)

(assert (=> b!126688 (=> (not res!104989) (not e!83507))))

(assert (=> b!126688 (= res!104989 (= (select (arr!3195 arr!227) #b00000000000000000000000000000000) (select (arr!3195 (_2!5586 lt!197629)) #b00000000000000000000000000000000)))))

(declare-fun b!126689 () Bool)

(assert (=> b!126689 (= e!83507 (arrayRangesEq!77 arr!227 (_2!5586 lt!197629) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) noOfBytes!1))))

(assert (= (and d!41102 (not res!104988)) b!126688))

(assert (= (and b!126688 res!104989) b!126689))

(declare-fun m!192265 () Bool)

(assert (=> b!126688 m!192265))

(declare-fun m!192267 () Bool)

(assert (=> b!126688 m!192267))

(declare-fun m!192269 () Bool)

(assert (=> b!126689 m!192269))

(assert (=> b!126511 d!41102))

(declare-datatypes ((tuple3!456 0))(
  ( (tuple3!457 (_1!5595 Unit!7783) (_2!5595 BitStream!4504) (_3!283 array!5723)) )
))
(declare-fun lt!197988 () tuple3!456)

(declare-fun d!41104 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!4504 array!5723 (_ BitVec 32) (_ BitVec 32)) tuple3!456)

(assert (=> d!41104 (= lt!197988 (readByteArrayLoop!0 (_1!5587 lt!197625) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!41104 (= (readByteArrayLoopPure!0 (_1!5587 lt!197625) arr!227 #b00000000000000000000000000000000 noOfBytes!1) (tuple2!10609 (_2!5595 lt!197988) (_3!283 lt!197988)))))

(declare-fun bs!9960 () Bool)

(assert (= bs!9960 d!41104))

(declare-fun m!192271 () Bool)

(assert (=> bs!9960 m!192271))

(assert (=> b!126506 d!41104))

(declare-fun d!41106 () Bool)

(assert (=> d!41106 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2590 (buf!2972 (_2!5585 lt!197628)))) ((_ sign_extend 32) (currentByte!5705 thiss!1614)) ((_ sign_extend 32) (currentBit!5700 thiss!1614)) lt!197624) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2590 (buf!2972 (_2!5585 lt!197628)))) ((_ sign_extend 32) (currentByte!5705 thiss!1614)) ((_ sign_extend 32) (currentBit!5700 thiss!1614))) lt!197624))))

(declare-fun bs!9961 () Bool)

(assert (= bs!9961 d!41106))

(assert (=> bs!9961 m!192101))

(assert (=> b!126506 d!41106))

(declare-fun d!41108 () Bool)

(assert (=> d!41108 (validate_offset_bits!1 ((_ sign_extend 32) (size!2590 (buf!2972 (_2!5585 lt!197628)))) ((_ sign_extend 32) (currentByte!5705 thiss!1614)) ((_ sign_extend 32) (currentBit!5700 thiss!1614)) lt!197624)))

(declare-fun lt!197989 () Unit!7783)

(assert (=> d!41108 (= lt!197989 (choose!9 thiss!1614 (buf!2972 (_2!5585 lt!197628)) lt!197624 (BitStream!4505 (buf!2972 (_2!5585 lt!197628)) (currentByte!5705 thiss!1614) (currentBit!5700 thiss!1614))))))

(assert (=> d!41108 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2972 (_2!5585 lt!197628)) lt!197624) lt!197989)))

(declare-fun bs!9962 () Bool)

(assert (= bs!9962 d!41108))

(assert (=> bs!9962 m!192011))

(declare-fun m!192273 () Bool)

(assert (=> bs!9962 m!192273))

(assert (=> b!126506 d!41108))

(assert (=> b!126506 d!41036))

(push 1)

(assert (not b!126689))

(assert (not d!41070))

(assert (not b!126604))

(assert (not b!126605))

(assert (not b!126683))

(assert (not d!41036))

(assert (not b!126614))

(assert (not d!41080))

(assert (not d!41072))

(assert (not b!126681))

(assert (not d!41106))

(assert (not d!41104))

(assert (not d!41032))

(assert (not d!41108))

(assert (not d!41078))

(assert (not b!126679))

(assert (not b!126682))

(assert (not d!41068))

(assert (not d!41030))

(assert (not b!126680))

(assert (not b!126616))

(assert (not b!126603))

(assert (not b!126606))

(assert (not d!41034))

(check-sat)

(pop 1)

(push 1)

(check-sat)

