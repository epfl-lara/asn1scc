; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25078 () Bool)

(assert start!25078)

(declare-fun b!127115 () Bool)

(declare-fun e!83906 () Bool)

(declare-datatypes ((array!5766 0))(
  ( (array!5767 (arr!3221 (Array (_ BitVec 32) (_ BitVec 8))) (size!2610 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4544 0))(
  ( (BitStream!4545 (buf!2995 array!5766) (currentByte!5734 (_ BitVec 32)) (currentBit!5729 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4544)

(declare-fun array_inv!2399 (array!5766) Bool)

(assert (=> b!127115 (= e!83906 (array_inv!2399 (buf!2995 thiss!1614)))))

(declare-fun lt!198368 () (_ BitVec 64))

(declare-fun e!83905 () Bool)

(declare-fun lt!198361 () (_ BitVec 64))

(declare-fun b!127116 () Bool)

(declare-fun lt!198364 () (_ BitVec 64))

(assert (=> b!127116 (= e!83905 (not (or (not (= lt!198361 (bvand lt!198368 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!198361 (bvand (bvadd lt!198364 lt!198368) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!127116 (= lt!198361 (bvand lt!198364 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(assert (=> b!127116 (= lt!198368 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!127116 (= lt!198364 (bitIndex!0 (size!2610 (buf!2995 thiss!1614)) (currentByte!5734 thiss!1614) (currentBit!5729 thiss!1614)))))

(declare-fun e!83907 () Bool)

(assert (=> b!127116 e!83907))

(declare-fun res!105364 () Bool)

(assert (=> b!127116 (=> (not res!105364) (not e!83907))))

(declare-datatypes ((Unit!7820 0))(
  ( (Unit!7821) )
))
(declare-datatypes ((tuple2!10708 0))(
  ( (tuple2!10709 (_1!5639 Unit!7820) (_2!5639 BitStream!4544)) )
))
(declare-fun lt!198366 () tuple2!10708)

(assert (=> b!127116 (= res!105364 (= (size!2610 (buf!2995 thiss!1614)) (size!2610 (buf!2995 (_2!5639 lt!198366)))))))

(declare-fun arr!227 () array!5766)

(declare-fun appendByteArrayLoop!0 (BitStream!4544 array!5766 (_ BitVec 32) (_ BitVec 32)) tuple2!10708)

(assert (=> b!127116 (= lt!198366 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!127117 () Bool)

(declare-fun res!105366 () Bool)

(assert (=> b!127117 (=> (not res!105366) (not e!83905))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127117 (= res!105366 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2610 (buf!2995 thiss!1614))) ((_ sign_extend 32) (currentByte!5734 thiss!1614)) ((_ sign_extend 32) (currentBit!5729 thiss!1614)) noOfBytes!1))))

(declare-fun res!105367 () Bool)

(assert (=> start!25078 (=> (not res!105367) (not e!83905))))

(assert (=> start!25078 (= res!105367 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2610 arr!227))))))

(assert (=> start!25078 e!83905))

(assert (=> start!25078 true))

(assert (=> start!25078 (array_inv!2399 arr!227)))

(declare-fun inv!12 (BitStream!4544) Bool)

(assert (=> start!25078 (and (inv!12 thiss!1614) e!83906)))

(declare-fun b!127118 () Bool)

(declare-fun e!83903 () Bool)

(assert (=> b!127118 (= e!83907 e!83903)))

(declare-fun res!105365 () Bool)

(assert (=> b!127118 (=> (not res!105365) (not e!83903))))

(declare-fun lt!198367 () (_ BitVec 64))

(assert (=> b!127118 (= res!105365 (= (bitIndex!0 (size!2610 (buf!2995 (_2!5639 lt!198366))) (currentByte!5734 (_2!5639 lt!198366)) (currentBit!5729 (_2!5639 lt!198366))) (bvadd (bitIndex!0 (size!2610 (buf!2995 thiss!1614)) (currentByte!5734 thiss!1614) (currentBit!5729 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198367))))))

(assert (=> b!127118 (= lt!198367 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!127119 () Bool)

(declare-fun e!83908 () Bool)

(assert (=> b!127119 (= e!83903 (not e!83908))))

(declare-fun res!105362 () Bool)

(assert (=> b!127119 (=> res!105362 e!83908)))

(declare-datatypes ((tuple2!10710 0))(
  ( (tuple2!10711 (_1!5640 BitStream!4544) (_2!5640 array!5766)) )
))
(declare-fun lt!198365 () tuple2!10710)

(declare-datatypes ((tuple2!10712 0))(
  ( (tuple2!10713 (_1!5641 BitStream!4544) (_2!5641 BitStream!4544)) )
))
(declare-fun lt!198362 () tuple2!10712)

(assert (=> b!127119 (= res!105362 (or (not (= (size!2610 (_2!5640 lt!198365)) (size!2610 arr!227))) (not (= (_1!5640 lt!198365) (_2!5641 lt!198362)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4544 array!5766 (_ BitVec 32) (_ BitVec 32)) tuple2!10710)

(assert (=> b!127119 (= lt!198365 (readByteArrayLoopPure!0 (_1!5641 lt!198362) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!127119 (validate_offset_bits!1 ((_ sign_extend 32) (size!2610 (buf!2995 (_2!5639 lt!198366)))) ((_ sign_extend 32) (currentByte!5734 thiss!1614)) ((_ sign_extend 32) (currentBit!5729 thiss!1614)) lt!198367)))

(declare-fun lt!198363 () Unit!7820)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4544 array!5766 (_ BitVec 64)) Unit!7820)

(assert (=> b!127119 (= lt!198363 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2995 (_2!5639 lt!198366)) lt!198367))))

(declare-fun reader!0 (BitStream!4544 BitStream!4544) tuple2!10712)

(assert (=> b!127119 (= lt!198362 (reader!0 thiss!1614 (_2!5639 lt!198366)))))

(declare-fun b!127120 () Bool)

(declare-fun res!105363 () Bool)

(assert (=> b!127120 (=> (not res!105363) (not e!83903))))

(declare-fun isPrefixOf!0 (BitStream!4544 BitStream!4544) Bool)

(assert (=> b!127120 (= res!105363 (isPrefixOf!0 thiss!1614 (_2!5639 lt!198366)))))

(declare-fun b!127121 () Bool)

(declare-fun arrayRangesEq!94 (array!5766 array!5766 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127121 (= e!83908 (not (arrayRangesEq!94 arr!227 (_2!5640 lt!198365) #b00000000000000000000000000000000 noOfBytes!1)))))

(assert (= (and start!25078 res!105367) b!127117))

(assert (= (and b!127117 res!105366) b!127116))

(assert (= (and b!127116 res!105364) b!127118))

(assert (= (and b!127118 res!105365) b!127120))

(assert (= (and b!127120 res!105363) b!127119))

(assert (= (and b!127119 (not res!105362)) b!127121))

(assert (= start!25078 b!127115))

(declare-fun m!192763 () Bool)

(assert (=> b!127121 m!192763))

(declare-fun m!192765 () Bool)

(assert (=> start!25078 m!192765))

(declare-fun m!192767 () Bool)

(assert (=> start!25078 m!192767))

(declare-fun m!192769 () Bool)

(assert (=> b!127116 m!192769))

(declare-fun m!192771 () Bool)

(assert (=> b!127116 m!192771))

(declare-fun m!192773 () Bool)

(assert (=> b!127118 m!192773))

(assert (=> b!127118 m!192769))

(declare-fun m!192775 () Bool)

(assert (=> b!127115 m!192775))

(declare-fun m!192777 () Bool)

(assert (=> b!127120 m!192777))

(declare-fun m!192779 () Bool)

(assert (=> b!127117 m!192779))

(declare-fun m!192781 () Bool)

(assert (=> b!127119 m!192781))

(declare-fun m!192783 () Bool)

(assert (=> b!127119 m!192783))

(declare-fun m!192785 () Bool)

(assert (=> b!127119 m!192785))

(declare-fun m!192787 () Bool)

(assert (=> b!127119 m!192787))

(push 1)

(assert (not b!127121))

(assert (not b!127116))

(assert (not b!127115))

(assert (not start!25078))

(assert (not b!127118))

(assert (not b!127117))

(assert (not b!127120))

(assert (not b!127119))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!41148 () Bool)

(declare-fun e!83915 () Bool)

(assert (=> d!41148 e!83915))

(declare-fun res!105379 () Bool)

(assert (=> d!41148 (=> (not res!105379) (not e!83915))))

(declare-fun lt!198405 () (_ BitVec 64))

(declare-fun lt!198407 () (_ BitVec 64))

(declare-fun lt!198410 () (_ BitVec 64))

(assert (=> d!41148 (= res!105379 (= lt!198405 (bvsub lt!198410 lt!198407)))))

(assert (=> d!41148 (or (= (bvand lt!198410 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!198407 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!198410 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!198410 lt!198407) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!41148 (= lt!198407 (remainingBits!0 ((_ sign_extend 32) (size!2610 (buf!2995 thiss!1614))) ((_ sign_extend 32) (currentByte!5734 thiss!1614)) ((_ sign_extend 32) (currentBit!5729 thiss!1614))))))

(declare-fun lt!198408 () (_ BitVec 64))

(declare-fun lt!198406 () (_ BitVec 64))

(assert (=> d!41148 (= lt!198410 (bvmul lt!198408 lt!198406))))

(assert (=> d!41148 (or (= lt!198408 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!198406 (bvsdiv (bvmul lt!198408 lt!198406) lt!198408)))))

(assert (=> d!41148 (= lt!198406 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41148 (= lt!198408 ((_ sign_extend 32) (size!2610 (buf!2995 thiss!1614))))))

(assert (=> d!41148 (= lt!198405 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5734 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5729 thiss!1614))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!41148 (invariant!0 (currentBit!5729 thiss!1614) (currentByte!5734 thiss!1614) (size!2610 (buf!2995 thiss!1614)))))

(assert (=> d!41148 (= (bitIndex!0 (size!2610 (buf!2995 thiss!1614)) (currentByte!5734 thiss!1614) (currentBit!5729 thiss!1614)) lt!198405)))

(declare-fun b!127132 () Bool)

(declare-fun res!105378 () Bool)

(assert (=> b!127132 (=> (not res!105378) (not e!83915))))

(assert (=> b!127132 (= res!105378 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!198405))))

(declare-fun b!127133 () Bool)

(declare-fun lt!198409 () (_ BitVec 64))

(assert (=> b!127133 (= e!83915 (bvsle lt!198405 (bvmul lt!198409 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!127133 (or (= lt!198409 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!198409 #b0000000000000000000000000000000000000000000000000000000000001000) lt!198409)))))

(assert (=> b!127133 (= lt!198409 ((_ sign_extend 32) (size!2610 (buf!2995 thiss!1614))))))

(assert (= (and d!41148 res!105379) b!127132))

(assert (= (and b!127132 res!105378) b!127133))

(declare-fun m!192799 () Bool)

(assert (=> d!41148 m!192799))

(declare-fun m!192801 () Bool)

(assert (=> d!41148 m!192801))

(assert (=> b!127116 d!41148))

(declare-fun d!41152 () Bool)

(declare-fun e!83949 () Bool)

(assert (=> d!41152 e!83949))

(declare-fun res!105436 () Bool)

(assert (=> d!41152 (=> (not res!105436) (not e!83949))))

(declare-fun lt!198546 () tuple2!10708)

(assert (=> d!41152 (= res!105436 (= (size!2610 (buf!2995 thiss!1614)) (size!2610 (buf!2995 (_2!5639 lt!198546)))))))

(declare-fun choose!64 (BitStream!4544 array!5766 (_ BitVec 32) (_ BitVec 32)) tuple2!10708)

(assert (=> d!41152 (= lt!198546 (choose!64 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!41152 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2610 arr!227)))))

(assert (=> d!41152 (= (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1) lt!198546)))

(declare-fun b!127193 () Bool)

(declare-fun lt!198553 () tuple2!10710)

(declare-fun e!83950 () Bool)

(assert (=> b!127193 (= e!83950 (arrayRangesEq!94 arr!227 (_2!5640 lt!198553) #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!127194 () Bool)

(declare-fun res!105434 () Bool)

(assert (=> b!127194 (=> (not res!105434) (not e!83949))))

(assert (=> b!127194 (= res!105434 (isPrefixOf!0 thiss!1614 (_2!5639 lt!198546)))))

(declare-fun b!127195 () Bool)

(declare-fun res!105437 () Bool)

(assert (=> b!127195 (=> (not res!105437) (not e!83949))))

(declare-fun lt!198547 () (_ BitVec 64))

(declare-fun lt!198548 () (_ BitVec 64))

(assert (=> b!127195 (= res!105437 (= (bitIndex!0 (size!2610 (buf!2995 (_2!5639 lt!198546))) (currentByte!5734 (_2!5639 lt!198546)) (currentBit!5729 (_2!5639 lt!198546))) (bvadd lt!198547 lt!198548)))))

(assert (=> b!127195 (or (not (= (bvand lt!198547 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!198548 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!198547 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!198547 lt!198548) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!198550 () (_ BitVec 64))

(assert (=> b!127195 (= lt!198548 (bvmul lt!198550 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!127195 (or (= lt!198550 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!198550 #b0000000000000000000000000000000000000000000000000000000000001000) lt!198550)))))

(assert (=> b!127195 (= lt!198550 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!127195 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!127195 (= lt!198547 (bitIndex!0 (size!2610 (buf!2995 thiss!1614)) (currentByte!5734 thiss!1614) (currentBit!5729 thiss!1614)))))

(declare-fun b!127196 () Bool)

(assert (=> b!127196 (= e!83949 e!83950)))

(declare-fun res!105433 () Bool)

(assert (=> b!127196 (=> (not res!105433) (not e!83950))))

(declare-fun lt!198549 () tuple2!10712)

(assert (=> b!127196 (= res!105433 (and (= (size!2610 (_2!5640 lt!198553)) (size!2610 arr!227)) (= (_1!5640 lt!198553) (_2!5641 lt!198549))))))

(assert (=> b!127196 (= lt!198553 (readByteArrayLoopPure!0 (_1!5641 lt!198549) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!198551 () Unit!7820)

(declare-fun lt!198552 () Unit!7820)

(assert (=> b!127196 (= lt!198551 lt!198552)))

(declare-fun lt!198554 () (_ BitVec 64))

(assert (=> b!127196 (validate_offset_bits!1 ((_ sign_extend 32) (size!2610 (buf!2995 (_2!5639 lt!198546)))) ((_ sign_extend 32) (currentByte!5734 thiss!1614)) ((_ sign_extend 32) (currentBit!5729 thiss!1614)) lt!198554)))

(assert (=> b!127196 (= lt!198552 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2995 (_2!5639 lt!198546)) lt!198554))))

(declare-fun e!83948 () Bool)

(assert (=> b!127196 e!83948))

(declare-fun res!105435 () Bool)

(assert (=> b!127196 (=> (not res!105435) (not e!83948))))

(assert (=> b!127196 (= res!105435 (and (= (size!2610 (buf!2995 thiss!1614)) (size!2610 (buf!2995 (_2!5639 lt!198546)))) (bvsge lt!198554 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!127196 (= lt!198554 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!127196 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!127196 (= lt!198549 (reader!0 thiss!1614 (_2!5639 lt!198546)))))

(declare-fun b!127197 () Bool)

(assert (=> b!127197 (= e!83948 (validate_offset_bits!1 ((_ sign_extend 32) (size!2610 (buf!2995 thiss!1614))) ((_ sign_extend 32) (currentByte!5734 thiss!1614)) ((_ sign_extend 32) (currentBit!5729 thiss!1614)) lt!198554))))

(assert (= (and d!41152 res!105436) b!127195))

(assert (= (and b!127195 res!105437) b!127194))

(assert (= (and b!127194 res!105434) b!127196))

(assert (= (and b!127196 res!105435) b!127197))

(assert (= (and b!127196 res!105433) b!127193))

(declare-fun m!192865 () Bool)

(assert (=> b!127197 m!192865))

(declare-fun m!192867 () Bool)

(assert (=> b!127193 m!192867))

(declare-fun m!192869 () Bool)

(assert (=> b!127195 m!192869))

(assert (=> b!127195 m!192769))

(declare-fun m!192871 () Bool)

(assert (=> b!127194 m!192871))

(declare-fun m!192873 () Bool)

(assert (=> b!127196 m!192873))

(declare-fun m!192875 () Bool)

(assert (=> b!127196 m!192875))

(declare-fun m!192877 () Bool)

(assert (=> b!127196 m!192877))

(declare-fun m!192879 () Bool)

(assert (=> b!127196 m!192879))

(declare-fun m!192881 () Bool)

(assert (=> d!41152 m!192881))

(assert (=> b!127116 d!41152))

(declare-fun d!41176 () Bool)

(declare-fun res!105442 () Bool)

(declare-fun e!83955 () Bool)

(assert (=> d!41176 (=> res!105442 e!83955)))

(assert (=> d!41176 (= res!105442 (= #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!41176 (= (arrayRangesEq!94 arr!227 (_2!5640 lt!198365) #b00000000000000000000000000000000 noOfBytes!1) e!83955)))

(declare-fun b!127202 () Bool)

(declare-fun e!83956 () Bool)

(assert (=> b!127202 (= e!83955 e!83956)))

(declare-fun res!105443 () Bool)

(assert (=> b!127202 (=> (not res!105443) (not e!83956))))

(assert (=> b!127202 (= res!105443 (= (select (arr!3221 arr!227) #b00000000000000000000000000000000) (select (arr!3221 (_2!5640 lt!198365)) #b00000000000000000000000000000000)))))

(declare-fun b!127203 () Bool)

(assert (=> b!127203 (= e!83956 (arrayRangesEq!94 arr!227 (_2!5640 lt!198365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) noOfBytes!1))))

(assert (= (and d!41176 (not res!105442)) b!127202))

(assert (= (and b!127202 res!105443) b!127203))

(declare-fun m!192885 () Bool)

(assert (=> b!127202 m!192885))

(declare-fun m!192889 () Bool)

(assert (=> b!127202 m!192889))

(declare-fun m!192891 () Bool)

(assert (=> b!127203 m!192891))

(assert (=> b!127121 d!41176))

(declare-fun d!41182 () Bool)

(assert (=> d!41182 (= (array_inv!2399 arr!227) (bvsge (size!2610 arr!227) #b00000000000000000000000000000000))))

(assert (=> start!25078 d!41182))

(declare-fun d!41184 () Bool)

(assert (=> d!41184 (= (inv!12 thiss!1614) (invariant!0 (currentBit!5729 thiss!1614) (currentByte!5734 thiss!1614) (size!2610 (buf!2995 thiss!1614))))))

(declare-fun bs!9993 () Bool)

(assert (= bs!9993 d!41184))

(assert (=> bs!9993 m!192801))

(assert (=> start!25078 d!41184))

(declare-fun d!41186 () Bool)

(assert (=> d!41186 (= (array_inv!2399 (buf!2995 thiss!1614)) (bvsge (size!2610 (buf!2995 thiss!1614)) #b00000000000000000000000000000000))))

(assert (=> b!127115 d!41186))

(declare-fun d!41188 () Bool)

(declare-fun res!105450 () Bool)

(declare-fun e!83962 () Bool)

(assert (=> d!41188 (=> (not res!105450) (not e!83962))))

(assert (=> d!41188 (= res!105450 (= (size!2610 (buf!2995 thiss!1614)) (size!2610 (buf!2995 (_2!5639 lt!198366)))))))

(assert (=> d!41188 (= (isPrefixOf!0 thiss!1614 (_2!5639 lt!198366)) e!83962)))

(declare-fun b!127210 () Bool)

(declare-fun res!105451 () Bool)

(assert (=> b!127210 (=> (not res!105451) (not e!83962))))

(assert (=> b!127210 (= res!105451 (bvsle (bitIndex!0 (size!2610 (buf!2995 thiss!1614)) (currentByte!5734 thiss!1614) (currentBit!5729 thiss!1614)) (bitIndex!0 (size!2610 (buf!2995 (_2!5639 lt!198366))) (currentByte!5734 (_2!5639 lt!198366)) (currentBit!5729 (_2!5639 lt!198366)))))))

(declare-fun b!127211 () Bool)

(declare-fun e!83961 () Bool)

(assert (=> b!127211 (= e!83962 e!83961)))

(declare-fun res!105452 () Bool)

(assert (=> b!127211 (=> res!105452 e!83961)))

(assert (=> b!127211 (= res!105452 (= (size!2610 (buf!2995 thiss!1614)) #b00000000000000000000000000000000))))

(declare-fun b!127212 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5766 array!5766 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!127212 (= e!83961 (arrayBitRangesEq!0 (buf!2995 thiss!1614) (buf!2995 (_2!5639 lt!198366)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2610 (buf!2995 thiss!1614)) (currentByte!5734 thiss!1614) (currentBit!5729 thiss!1614))))))

(assert (= (and d!41188 res!105450) b!127210))

(assert (= (and b!127210 res!105451) b!127211))

(assert (= (and b!127211 (not res!105452)) b!127212))

(assert (=> b!127210 m!192769))

(assert (=> b!127210 m!192773))

(assert (=> b!127212 m!192769))

(assert (=> b!127212 m!192769))

(declare-fun m!192895 () Bool)

(assert (=> b!127212 m!192895))

(assert (=> b!127120 d!41188))

(declare-fun d!41192 () Bool)

(declare-datatypes ((tuple3!464 0))(
  ( (tuple3!465 (_1!5644 Unit!7820) (_2!5644 BitStream!4544) (_3!287 array!5766)) )
))
(declare-fun lt!198563 () tuple3!464)

(declare-fun readByteArrayLoop!0 (BitStream!4544 array!5766 (_ BitVec 32) (_ BitVec 32)) tuple3!464)

(assert (=> d!41192 (= lt!198563 (readByteArrayLoop!0 (_1!5641 lt!198362) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!41192 (= (readByteArrayLoopPure!0 (_1!5641 lt!198362) arr!227 #b00000000000000000000000000000000 noOfBytes!1) (tuple2!10711 (_2!5644 lt!198563) (_3!287 lt!198563)))))

(declare-fun bs!9995 () Bool)

(assert (= bs!9995 d!41192))

(declare-fun m!192897 () Bool)

(assert (=> bs!9995 m!192897))

(assert (=> b!127119 d!41192))

(declare-fun d!41194 () Bool)

(assert (=> d!41194 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2610 (buf!2995 (_2!5639 lt!198366)))) ((_ sign_extend 32) (currentByte!5734 thiss!1614)) ((_ sign_extend 32) (currentBit!5729 thiss!1614)) lt!198367) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2610 (buf!2995 (_2!5639 lt!198366)))) ((_ sign_extend 32) (currentByte!5734 thiss!1614)) ((_ sign_extend 32) (currentBit!5729 thiss!1614))) lt!198367))))

(declare-fun bs!9996 () Bool)

(assert (= bs!9996 d!41194))

(declare-fun m!192899 () Bool)

(assert (=> bs!9996 m!192899))

(assert (=> b!127119 d!41194))

(declare-fun d!41196 () Bool)

(assert (=> d!41196 (validate_offset_bits!1 ((_ sign_extend 32) (size!2610 (buf!2995 (_2!5639 lt!198366)))) ((_ sign_extend 32) (currentByte!5734 thiss!1614)) ((_ sign_extend 32) (currentBit!5729 thiss!1614)) lt!198367)))

(declare-fun lt!198566 () Unit!7820)

(declare-fun choose!9 (BitStream!4544 array!5766 (_ BitVec 64) BitStream!4544) Unit!7820)

(assert (=> d!41196 (= lt!198566 (choose!9 thiss!1614 (buf!2995 (_2!5639 lt!198366)) lt!198367 (BitStream!4545 (buf!2995 (_2!5639 lt!198366)) (currentByte!5734 thiss!1614) (currentBit!5729 thiss!1614))))))

(assert (=> d!41196 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2995 (_2!5639 lt!198366)) lt!198367) lt!198566)))

(declare-fun bs!9997 () Bool)

(assert (= bs!9997 d!41196))

(assert (=> bs!9997 m!192783))

(declare-fun m!192901 () Bool)

(assert (=> bs!9997 m!192901))

(assert (=> b!127119 d!41196))

(declare-fun lt!198702 () tuple2!10712)

(declare-fun e!84000 () Bool)

(declare-fun lt!198707 () (_ BitVec 64))

(declare-fun lt!198711 () (_ BitVec 64))

(declare-fun b!127274 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4544 (_ BitVec 64)) BitStream!4544)

(assert (=> b!127274 (= e!84000 (= (_1!5641 lt!198702) (withMovedBitIndex!0 (_2!5641 lt!198702) (bvsub lt!198707 lt!198711))))))

(assert (=> b!127274 (or (= (bvand lt!198707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!198711 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!198707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!198707 lt!198711) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!127274 (= lt!198711 (bitIndex!0 (size!2610 (buf!2995 (_2!5639 lt!198366))) (currentByte!5734 (_2!5639 lt!198366)) (currentBit!5729 (_2!5639 lt!198366))))))

(assert (=> b!127274 (= lt!198707 (bitIndex!0 (size!2610 (buf!2995 thiss!1614)) (currentByte!5734 thiss!1614) (currentBit!5729 thiss!1614)))))

(declare-fun b!127275 () Bool)

(declare-fun e!84001 () Unit!7820)

(declare-fun lt!198700 () Unit!7820)

(assert (=> b!127275 (= e!84001 lt!198700)))

(declare-fun lt!198701 () (_ BitVec 64))

(assert (=> b!127275 (= lt!198701 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!198713 () (_ BitVec 64))

(assert (=> b!127275 (= lt!198713 (bitIndex!0 (size!2610 (buf!2995 thiss!1614)) (currentByte!5734 thiss!1614) (currentBit!5729 thiss!1614)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5766 array!5766 (_ BitVec 64) (_ BitVec 64)) Unit!7820)

(assert (=> b!127275 (= lt!198700 (arrayBitRangesEqSymmetric!0 (buf!2995 thiss!1614) (buf!2995 (_2!5639 lt!198366)) lt!198701 lt!198713))))

(assert (=> b!127275 (arrayBitRangesEq!0 (buf!2995 (_2!5639 lt!198366)) (buf!2995 thiss!1614) lt!198701 lt!198713)))

(declare-fun b!127276 () Bool)

(declare-fun res!105504 () Bool)

(assert (=> b!127276 (=> (not res!105504) (not e!84000))))

(assert (=> b!127276 (= res!105504 (isPrefixOf!0 (_1!5641 lt!198702) thiss!1614))))

(declare-fun b!127277 () Bool)

(declare-fun res!105505 () Bool)

(assert (=> b!127277 (=> (not res!105505) (not e!84000))))

(assert (=> b!127277 (= res!105505 (isPrefixOf!0 (_2!5641 lt!198702) (_2!5639 lt!198366)))))

(declare-fun d!41198 () Bool)

(assert (=> d!41198 e!84000))

(declare-fun res!105506 () Bool)

(assert (=> d!41198 (=> (not res!105506) (not e!84000))))

(assert (=> d!41198 (= res!105506 (isPrefixOf!0 (_1!5641 lt!198702) (_2!5641 lt!198702)))))

(declare-fun lt!198695 () BitStream!4544)

(assert (=> d!41198 (= lt!198702 (tuple2!10713 lt!198695 (_2!5639 lt!198366)))))

(declare-fun lt!198710 () Unit!7820)

(declare-fun lt!198699 () Unit!7820)

(assert (=> d!41198 (= lt!198710 lt!198699)))

(assert (=> d!41198 (isPrefixOf!0 lt!198695 (_2!5639 lt!198366))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4544 BitStream!4544 BitStream!4544) Unit!7820)

(assert (=> d!41198 (= lt!198699 (lemmaIsPrefixTransitive!0 lt!198695 (_2!5639 lt!198366) (_2!5639 lt!198366)))))

(declare-fun lt!198704 () Unit!7820)

(declare-fun lt!198706 () Unit!7820)

(assert (=> d!41198 (= lt!198704 lt!198706)))

(assert (=> d!41198 (isPrefixOf!0 lt!198695 (_2!5639 lt!198366))))

(assert (=> d!41198 (= lt!198706 (lemmaIsPrefixTransitive!0 lt!198695 thiss!1614 (_2!5639 lt!198366)))))

(declare-fun lt!198708 () Unit!7820)

(assert (=> d!41198 (= lt!198708 e!84001)))

(declare-fun c!7503 () Bool)

(assert (=> d!41198 (= c!7503 (not (= (size!2610 (buf!2995 thiss!1614)) #b00000000000000000000000000000000)))))

(declare-fun lt!198703 () Unit!7820)

(declare-fun lt!198694 () Unit!7820)

(assert (=> d!41198 (= lt!198703 lt!198694)))

(assert (=> d!41198 (isPrefixOf!0 (_2!5639 lt!198366) (_2!5639 lt!198366))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4544) Unit!7820)

(assert (=> d!41198 (= lt!198694 (lemmaIsPrefixRefl!0 (_2!5639 lt!198366)))))

(declare-fun lt!198705 () Unit!7820)

(declare-fun lt!198697 () Unit!7820)

(assert (=> d!41198 (= lt!198705 lt!198697)))

(assert (=> d!41198 (= lt!198697 (lemmaIsPrefixRefl!0 (_2!5639 lt!198366)))))

(declare-fun lt!198696 () Unit!7820)

(declare-fun lt!198698 () Unit!7820)

(assert (=> d!41198 (= lt!198696 lt!198698)))

(assert (=> d!41198 (isPrefixOf!0 lt!198695 lt!198695)))

(assert (=> d!41198 (= lt!198698 (lemmaIsPrefixRefl!0 lt!198695))))

(declare-fun lt!198709 () Unit!7820)

(declare-fun lt!198712 () Unit!7820)

(assert (=> d!41198 (= lt!198709 lt!198712)))

(assert (=> d!41198 (isPrefixOf!0 thiss!1614 thiss!1614)))

(assert (=> d!41198 (= lt!198712 (lemmaIsPrefixRefl!0 thiss!1614))))

(assert (=> d!41198 (= lt!198695 (BitStream!4545 (buf!2995 (_2!5639 lt!198366)) (currentByte!5734 thiss!1614) (currentBit!5729 thiss!1614)))))

(assert (=> d!41198 (isPrefixOf!0 thiss!1614 (_2!5639 lt!198366))))

(assert (=> d!41198 (= (reader!0 thiss!1614 (_2!5639 lt!198366)) lt!198702)))

(declare-fun b!127278 () Bool)

(declare-fun Unit!7824 () Unit!7820)

(assert (=> b!127278 (= e!84001 Unit!7824)))

(assert (= (and d!41198 c!7503) b!127275))

(assert (= (and d!41198 (not c!7503)) b!127278))

(assert (= (and d!41198 res!105506) b!127276))

(assert (= (and b!127276 res!105504) b!127277))

(assert (= (and b!127277 res!105505) b!127274))

(declare-fun m!192965 () Bool)

(assert (=> b!127274 m!192965))

(assert (=> b!127274 m!192773))

(assert (=> b!127274 m!192769))

(declare-fun m!192967 () Bool)

(assert (=> b!127276 m!192967))

(declare-fun m!192969 () Bool)

(assert (=> d!41198 m!192969))

(declare-fun m!192971 () Bool)

(assert (=> d!41198 m!192971))

(declare-fun m!192973 () Bool)

(assert (=> d!41198 m!192973))

(declare-fun m!192975 () Bool)

(assert (=> d!41198 m!192975))

(declare-fun m!192977 () Bool)

(assert (=> d!41198 m!192977))

(assert (=> d!41198 m!192777))

(declare-fun m!192979 () Bool)

(assert (=> d!41198 m!192979))

(declare-fun m!192981 () Bool)

(assert (=> d!41198 m!192981))

(declare-fun m!192983 () Bool)

(assert (=> d!41198 m!192983))

(declare-fun m!192985 () Bool)

(assert (=> d!41198 m!192985))

(declare-fun m!192987 () Bool)

(assert (=> d!41198 m!192987))

(assert (=> b!127275 m!192769))

(declare-fun m!192989 () Bool)

(assert (=> b!127275 m!192989))

(declare-fun m!192991 () Bool)

(assert (=> b!127275 m!192991))

(declare-fun m!192993 () Bool)

(assert (=> b!127277 m!192993))

(assert (=> b!127119 d!41198))

(declare-fun d!41212 () Bool)

(declare-fun e!84002 () Bool)

(assert (=> d!41212 e!84002))

(declare-fun res!105508 () Bool)

(assert (=> d!41212 (=> (not res!105508) (not e!84002))))

(declare-fun lt!198716 () (_ BitVec 64))

(declare-fun lt!198714 () (_ BitVec 64))

(declare-fun lt!198719 () (_ BitVec 64))

(assert (=> d!41212 (= res!105508 (= lt!198714 (bvsub lt!198719 lt!198716)))))

(assert (=> d!41212 (or (= (bvand lt!198719 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!198716 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!198719 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!198719 lt!198716) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41212 (= lt!198716 (remainingBits!0 ((_ sign_extend 32) (size!2610 (buf!2995 (_2!5639 lt!198366)))) ((_ sign_extend 32) (currentByte!5734 (_2!5639 lt!198366))) ((_ sign_extend 32) (currentBit!5729 (_2!5639 lt!198366)))))))

(declare-fun lt!198717 () (_ BitVec 64))

(declare-fun lt!198715 () (_ BitVec 64))

(assert (=> d!41212 (= lt!198719 (bvmul lt!198717 lt!198715))))

(assert (=> d!41212 (or (= lt!198717 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!198715 (bvsdiv (bvmul lt!198717 lt!198715) lt!198717)))))

(assert (=> d!41212 (= lt!198715 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41212 (= lt!198717 ((_ sign_extend 32) (size!2610 (buf!2995 (_2!5639 lt!198366)))))))

(assert (=> d!41212 (= lt!198714 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5734 (_2!5639 lt!198366))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5729 (_2!5639 lt!198366)))))))

(assert (=> d!41212 (invariant!0 (currentBit!5729 (_2!5639 lt!198366)) (currentByte!5734 (_2!5639 lt!198366)) (size!2610 (buf!2995 (_2!5639 lt!198366))))))

(assert (=> d!41212 (= (bitIndex!0 (size!2610 (buf!2995 (_2!5639 lt!198366))) (currentByte!5734 (_2!5639 lt!198366)) (currentBit!5729 (_2!5639 lt!198366))) lt!198714)))

(declare-fun b!127279 () Bool)

(declare-fun res!105507 () Bool)

(assert (=> b!127279 (=> (not res!105507) (not e!84002))))

(assert (=> b!127279 (= res!105507 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!198714))))

(declare-fun b!127280 () Bool)

(declare-fun lt!198718 () (_ BitVec 64))

(assert (=> b!127280 (= e!84002 (bvsle lt!198714 (bvmul lt!198718 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!127280 (or (= lt!198718 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!198718 #b0000000000000000000000000000000000000000000000000000000000001000) lt!198718)))))

(assert (=> b!127280 (= lt!198718 ((_ sign_extend 32) (size!2610 (buf!2995 (_2!5639 lt!198366)))))))

(assert (= (and d!41212 res!105508) b!127279))

(assert (= (and b!127279 res!105507) b!127280))

(declare-fun m!192995 () Bool)

(assert (=> d!41212 m!192995))

(declare-fun m!192997 () Bool)

(assert (=> d!41212 m!192997))

(assert (=> b!127118 d!41212))

(assert (=> b!127118 d!41148))

(declare-fun d!41214 () Bool)

(assert (=> d!41214 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2610 (buf!2995 thiss!1614))) ((_ sign_extend 32) (currentByte!5734 thiss!1614)) ((_ sign_extend 32) (currentBit!5729 thiss!1614)) noOfBytes!1) (bvsle ((_ sign_extend 32) noOfBytes!1) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2610 (buf!2995 thiss!1614))) ((_ sign_extend 32) (currentByte!5734 thiss!1614)) ((_ sign_extend 32) (currentBit!5729 thiss!1614))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10000 () Bool)

(assert (= bs!10000 d!41214))

(assert (=> bs!10000 m!192799))

(assert (=> b!127117 d!41214))

(push 1)

(assert (not b!127196))

(assert (not d!41184))

(assert (not b!127193))

(assert (not b!127277))

(assert (not b!127210))

(assert (not d!41198))

(assert (not b!127203))

(assert (not b!127212))

(assert (not d!41192))

(assert (not d!41148))

(assert (not b!127195))

(assert (not d!41194))

(assert (not d!41214))

(assert (not d!41212))

(assert (not d!41196))

(assert (not b!127197))

(assert (not b!127276))

(assert (not b!127194))

(assert (not b!127275))

(assert (not d!41152))

(assert (not b!127274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

