; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24790 () Bool)

(assert start!24790)

(declare-fun res!104122 () Bool)

(declare-fun e!82752 () Bool)

(assert (=> start!24790 (=> (not res!104122) (not e!82752))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5679 0))(
  ( (array!5680 (arr!3164 (Array (_ BitVec 32) (_ BitVec 8))) (size!2571 (_ BitVec 32))) )
))
(declare-fun arr!227 () array!5679)

(assert (=> start!24790 (= res!104122 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2571 arr!227))))))

(assert (=> start!24790 e!82752))

(assert (=> start!24790 true))

(declare-fun array_inv!2360 (array!5679) Bool)

(assert (=> start!24790 (array_inv!2360 arr!227)))

(declare-datatypes ((BitStream!4466 0))(
  ( (BitStream!4467 (buf!2947 array!5679) (currentByte!5662 (_ BitVec 32)) (currentBit!5657 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4466)

(declare-fun e!82754 () Bool)

(declare-fun inv!12 (BitStream!4466) Bool)

(assert (=> start!24790 (and (inv!12 thiss!1614) e!82754)))

(declare-fun b!125702 () Bool)

(declare-fun res!104125 () Bool)

(declare-fun e!82755 () Bool)

(assert (=> b!125702 (=> (not res!104125) (not e!82755))))

(declare-datatypes ((Unit!7739 0))(
  ( (Unit!7740) )
))
(declare-datatypes ((tuple2!10492 0))(
  ( (tuple2!10493 (_1!5522 Unit!7739) (_2!5522 BitStream!4466)) )
))
(declare-fun lt!196582 () tuple2!10492)

(declare-fun isPrefixOf!0 (BitStream!4466 BitStream!4466) Bool)

(assert (=> b!125702 (= res!104125 (isPrefixOf!0 thiss!1614 (_2!5522 lt!196582)))))

(declare-fun b!125703 () Bool)

(assert (=> b!125703 (= e!82754 (array_inv!2360 (buf!2947 thiss!1614)))))

(declare-fun e!82757 () Bool)

(declare-datatypes ((tuple2!10494 0))(
  ( (tuple2!10495 (_1!5523 BitStream!4466) (_2!5523 array!5679)) )
))
(declare-fun lt!196583 () tuple2!10494)

(declare-fun b!125704 () Bool)

(declare-fun arrayRangesEq!58 (array!5679 array!5679 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!125704 (= e!82757 (not (arrayRangesEq!58 arr!227 (_2!5523 lt!196583) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!125705 () Bool)

(assert (=> b!125705 (= e!82755 (not e!82757))))

(declare-fun res!104120 () Bool)

(assert (=> b!125705 (=> res!104120 e!82757)))

(declare-datatypes ((tuple2!10496 0))(
  ( (tuple2!10497 (_1!5524 BitStream!4466) (_2!5524 BitStream!4466)) )
))
(declare-fun lt!196581 () tuple2!10496)

(assert (=> b!125705 (= res!104120 (or (not (= (size!2571 (_2!5523 lt!196583)) (size!2571 arr!227))) (not (= (_1!5523 lt!196583) (_2!5524 lt!196581)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4466 array!5679 (_ BitVec 32) (_ BitVec 32)) tuple2!10494)

(assert (=> b!125705 (= lt!196583 (readByteArrayLoopPure!0 (_1!5524 lt!196581) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!196580 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125705 (validate_offset_bits!1 ((_ sign_extend 32) (size!2571 (buf!2947 (_2!5522 lt!196582)))) ((_ sign_extend 32) (currentByte!5662 thiss!1614)) ((_ sign_extend 32) (currentBit!5657 thiss!1614)) lt!196580)))

(declare-fun lt!196579 () Unit!7739)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4466 array!5679 (_ BitVec 64)) Unit!7739)

(assert (=> b!125705 (= lt!196579 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2947 (_2!5522 lt!196582)) lt!196580))))

(declare-fun reader!0 (BitStream!4466 BitStream!4466) tuple2!10496)

(assert (=> b!125705 (= lt!196581 (reader!0 thiss!1614 (_2!5522 lt!196582)))))

(declare-fun b!125706 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!125706 (= e!82752 (not (invariant!0 (currentBit!5657 (_2!5522 lt!196582)) (currentByte!5662 (_2!5522 lt!196582)) (size!2571 (buf!2947 (_2!5522 lt!196582))))))))

(declare-fun e!82753 () Bool)

(assert (=> b!125706 e!82753))

(declare-fun res!104124 () Bool)

(assert (=> b!125706 (=> (not res!104124) (not e!82753))))

(assert (=> b!125706 (= res!104124 (= (size!2571 (buf!2947 thiss!1614)) (size!2571 (buf!2947 (_2!5522 lt!196582)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4466 array!5679 (_ BitVec 32) (_ BitVec 32)) tuple2!10492)

(assert (=> b!125706 (= lt!196582 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!125707 () Bool)

(declare-fun res!104123 () Bool)

(assert (=> b!125707 (=> (not res!104123) (not e!82752))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!125707 (= res!104123 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2571 (buf!2947 thiss!1614))) ((_ sign_extend 32) (currentByte!5662 thiss!1614)) ((_ sign_extend 32) (currentBit!5657 thiss!1614)) noOfBytes!1))))

(declare-fun b!125708 () Bool)

(assert (=> b!125708 (= e!82753 e!82755)))

(declare-fun res!104121 () Bool)

(assert (=> b!125708 (=> (not res!104121) (not e!82755))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!125708 (= res!104121 (= (bitIndex!0 (size!2571 (buf!2947 (_2!5522 lt!196582))) (currentByte!5662 (_2!5522 lt!196582)) (currentBit!5657 (_2!5522 lt!196582))) (bvadd (bitIndex!0 (size!2571 (buf!2947 thiss!1614)) (currentByte!5662 thiss!1614) (currentBit!5657 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!196580))))))

(assert (=> b!125708 (= lt!196580 ((_ sign_extend 32) noOfBytes!1))))

(assert (= (and start!24790 res!104122) b!125707))

(assert (= (and b!125707 res!104123) b!125706))

(assert (= (and b!125706 res!104124) b!125708))

(assert (= (and b!125708 res!104121) b!125702))

(assert (= (and b!125702 res!104125) b!125705))

(assert (= (and b!125705 (not res!104120)) b!125704))

(assert (= start!24790 b!125703))

(declare-fun m!191081 () Bool)

(assert (=> b!125707 m!191081))

(declare-fun m!191083 () Bool)

(assert (=> b!125706 m!191083))

(declare-fun m!191085 () Bool)

(assert (=> b!125706 m!191085))

(declare-fun m!191087 () Bool)

(assert (=> b!125703 m!191087))

(declare-fun m!191089 () Bool)

(assert (=> b!125702 m!191089))

(declare-fun m!191091 () Bool)

(assert (=> b!125705 m!191091))

(declare-fun m!191093 () Bool)

(assert (=> b!125705 m!191093))

(declare-fun m!191095 () Bool)

(assert (=> b!125705 m!191095))

(declare-fun m!191097 () Bool)

(assert (=> b!125705 m!191097))

(declare-fun m!191099 () Bool)

(assert (=> b!125708 m!191099))

(declare-fun m!191101 () Bool)

(assert (=> b!125708 m!191101))

(declare-fun m!191103 () Bool)

(assert (=> start!24790 m!191103))

(declare-fun m!191105 () Bool)

(assert (=> start!24790 m!191105))

(declare-fun m!191107 () Bool)

(assert (=> b!125704 m!191107))

(push 1)

(assert (not b!125708))

(assert (not b!125703))

(assert (not b!125704))

(assert (not b!125702))

(assert (not b!125705))

(assert (not b!125706))

(assert (not b!125707))

(assert (not start!24790))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!40848 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!40848 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2571 (buf!2947 thiss!1614))) ((_ sign_extend 32) (currentByte!5662 thiss!1614)) ((_ sign_extend 32) (currentBit!5657 thiss!1614)) noOfBytes!1) (bvsle ((_ sign_extend 32) noOfBytes!1) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2571 (buf!2947 thiss!1614))) ((_ sign_extend 32) (currentByte!5662 thiss!1614)) ((_ sign_extend 32) (currentBit!5657 thiss!1614))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!9893 () Bool)

(assert (= bs!9893 d!40848))

(declare-fun m!191109 () Bool)

(assert (=> bs!9893 m!191109))

(assert (=> b!125707 d!40848))

(declare-fun d!40850 () Bool)

(assert (=> d!40850 (= (invariant!0 (currentBit!5657 (_2!5522 lt!196582)) (currentByte!5662 (_2!5522 lt!196582)) (size!2571 (buf!2947 (_2!5522 lt!196582)))) (and (bvsge (currentBit!5657 (_2!5522 lt!196582)) #b00000000000000000000000000000000) (bvslt (currentBit!5657 (_2!5522 lt!196582)) #b00000000000000000000000000001000) (bvsge (currentByte!5662 (_2!5522 lt!196582)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5662 (_2!5522 lt!196582)) (size!2571 (buf!2947 (_2!5522 lt!196582)))) (and (= (currentBit!5657 (_2!5522 lt!196582)) #b00000000000000000000000000000000) (= (currentByte!5662 (_2!5522 lt!196582)) (size!2571 (buf!2947 (_2!5522 lt!196582))))))))))

(assert (=> b!125706 d!40850))

(declare-fun b!125719 () Bool)

(declare-fun e!82766 () Bool)

(declare-fun lt!196607 () (_ BitVec 64))

(assert (=> b!125719 (= e!82766 (validate_offset_bits!1 ((_ sign_extend 32) (size!2571 (buf!2947 thiss!1614))) ((_ sign_extend 32) (currentByte!5662 thiss!1614)) ((_ sign_extend 32) (currentBit!5657 thiss!1614)) lt!196607))))

(declare-fun e!82764 () Bool)

(declare-fun b!125720 () Bool)

(declare-fun lt!196611 () tuple2!10494)

(assert (=> b!125720 (= e!82764 (arrayRangesEq!58 arr!227 (_2!5523 lt!196611) #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!125721 () Bool)

(declare-fun e!82765 () Bool)

(assert (=> b!125721 (= e!82765 e!82764)))

(declare-fun res!104140 () Bool)

(assert (=> b!125721 (=> (not res!104140) (not e!82764))))

(declare-fun lt!196606 () tuple2!10496)

(assert (=> b!125721 (= res!104140 (and (= (size!2571 (_2!5523 lt!196611)) (size!2571 arr!227)) (= (_1!5523 lt!196611) (_2!5524 lt!196606))))))

(assert (=> b!125721 (= lt!196611 (readByteArrayLoopPure!0 (_1!5524 lt!196606) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!196612 () Unit!7739)

(declare-fun lt!196604 () Unit!7739)

(assert (=> b!125721 (= lt!196612 lt!196604)))

(declare-fun lt!196605 () tuple2!10492)

(assert (=> b!125721 (validate_offset_bits!1 ((_ sign_extend 32) (size!2571 (buf!2947 (_2!5522 lt!196605)))) ((_ sign_extend 32) (currentByte!5662 thiss!1614)) ((_ sign_extend 32) (currentBit!5657 thiss!1614)) lt!196607)))

(assert (=> b!125721 (= lt!196604 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2947 (_2!5522 lt!196605)) lt!196607))))

(assert (=> b!125721 e!82766))

(declare-fun res!104136 () Bool)

(assert (=> b!125721 (=> (not res!104136) (not e!82766))))

(assert (=> b!125721 (= res!104136 (and (= (size!2571 (buf!2947 thiss!1614)) (size!2571 (buf!2947 (_2!5522 lt!196605)))) (bvsge lt!196607 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!125721 (= lt!196607 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!125721 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!125721 (= lt!196606 (reader!0 thiss!1614 (_2!5522 lt!196605)))))

(declare-fun b!125722 () Bool)

(declare-fun res!104138 () Bool)

(assert (=> b!125722 (=> (not res!104138) (not e!82765))))

(assert (=> b!125722 (= res!104138 (isPrefixOf!0 thiss!1614 (_2!5522 lt!196605)))))

(declare-fun d!40852 () Bool)

(assert (=> d!40852 e!82765))

(declare-fun res!104139 () Bool)

(assert (=> d!40852 (=> (not res!104139) (not e!82765))))

(assert (=> d!40852 (= res!104139 (= (size!2571 (buf!2947 thiss!1614)) (size!2571 (buf!2947 (_2!5522 lt!196605)))))))

(declare-fun choose!64 (BitStream!4466 array!5679 (_ BitVec 32) (_ BitVec 32)) tuple2!10492)

(assert (=> d!40852 (= lt!196605 (choose!64 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!40852 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2571 arr!227)))))

(assert (=> d!40852 (= (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1) lt!196605)))

(declare-fun b!125723 () Bool)

(declare-fun res!104137 () Bool)

(assert (=> b!125723 (=> (not res!104137) (not e!82765))))

(declare-fun lt!196608 () (_ BitVec 64))

(declare-fun lt!196609 () (_ BitVec 64))

(assert (=> b!125723 (= res!104137 (= (bitIndex!0 (size!2571 (buf!2947 (_2!5522 lt!196605))) (currentByte!5662 (_2!5522 lt!196605)) (currentBit!5657 (_2!5522 lt!196605))) (bvadd lt!196608 lt!196609)))))

(assert (=> b!125723 (or (not (= (bvand lt!196608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!196609 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!196608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!196608 lt!196609) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!196610 () (_ BitVec 64))

(assert (=> b!125723 (= lt!196609 (bvmul lt!196610 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!125723 (or (= lt!196610 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!196610 #b0000000000000000000000000000000000000000000000000000000000001000) lt!196610)))))

(assert (=> b!125723 (= lt!196610 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!125723 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!125723 (= lt!196608 (bitIndex!0 (size!2571 (buf!2947 thiss!1614)) (currentByte!5662 thiss!1614) (currentBit!5657 thiss!1614)))))

(assert (= (and d!40852 res!104139) b!125723))

(assert (= (and b!125723 res!104137) b!125722))

(assert (= (and b!125722 res!104138) b!125721))

(assert (= (and b!125721 res!104136) b!125719))

(assert (= (and b!125721 res!104140) b!125720))

(declare-fun m!191111 () Bool)

(assert (=> b!125719 m!191111))

(declare-fun m!191113 () Bool)

(assert (=> b!125722 m!191113))

(declare-fun m!191115 () Bool)

(assert (=> b!125720 m!191115))

(declare-fun m!191117 () Bool)

(assert (=> b!125721 m!191117))

(declare-fun m!191119 () Bool)

(assert (=> b!125721 m!191119))

(declare-fun m!191121 () Bool)

(assert (=> b!125721 m!191121))

(declare-fun m!191123 () Bool)

(assert (=> b!125721 m!191123))

(declare-fun m!191125 () Bool)

(assert (=> b!125723 m!191125))

(assert (=> b!125723 m!191101))

(declare-fun m!191127 () Bool)

(assert (=> d!40852 m!191127))

(assert (=> b!125706 d!40852))

(declare-fun d!40862 () Bool)

(declare-fun e!82791 () Bool)

(assert (=> d!40862 e!82791))

(declare-fun res!104180 () Bool)

(assert (=> d!40862 (=> (not res!104180) (not e!82791))))

(declare-fun lt!196680 () (_ BitVec 64))

(declare-fun lt!196682 () (_ BitVec 64))

(declare-fun lt!196684 () (_ BitVec 64))

(assert (=> d!40862 (= res!104180 (= lt!196682 (bvsub lt!196684 lt!196680)))))

(assert (=> d!40862 (or (= (bvand lt!196684 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!196680 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!196684 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!196684 lt!196680) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40862 (= lt!196680 (remainingBits!0 ((_ sign_extend 32) (size!2571 (buf!2947 (_2!5522 lt!196582)))) ((_ sign_extend 32) (currentByte!5662 (_2!5522 lt!196582))) ((_ sign_extend 32) (currentBit!5657 (_2!5522 lt!196582)))))))

(declare-fun lt!196681 () (_ BitVec 64))

(declare-fun lt!196685 () (_ BitVec 64))

(assert (=> d!40862 (= lt!196684 (bvmul lt!196681 lt!196685))))

(assert (=> d!40862 (or (= lt!196681 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!196685 (bvsdiv (bvmul lt!196681 lt!196685) lt!196681)))))

(assert (=> d!40862 (= lt!196685 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40862 (= lt!196681 ((_ sign_extend 32) (size!2571 (buf!2947 (_2!5522 lt!196582)))))))

(assert (=> d!40862 (= lt!196682 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5662 (_2!5522 lt!196582))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5657 (_2!5522 lt!196582)))))))

(assert (=> d!40862 (invariant!0 (currentBit!5657 (_2!5522 lt!196582)) (currentByte!5662 (_2!5522 lt!196582)) (size!2571 (buf!2947 (_2!5522 lt!196582))))))

(assert (=> d!40862 (= (bitIndex!0 (size!2571 (buf!2947 (_2!5522 lt!196582))) (currentByte!5662 (_2!5522 lt!196582)) (currentBit!5657 (_2!5522 lt!196582))) lt!196682)))

(declare-fun b!125762 () Bool)

(declare-fun res!104179 () Bool)

(assert (=> b!125762 (=> (not res!104179) (not e!82791))))

(assert (=> b!125762 (= res!104179 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!196682))))

(declare-fun b!125763 () Bool)

(declare-fun lt!196683 () (_ BitVec 64))

(assert (=> b!125763 (= e!82791 (bvsle lt!196682 (bvmul lt!196683 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!125763 (or (= lt!196683 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!196683 #b0000000000000000000000000000000000000000000000000000000000001000) lt!196683)))))

(assert (=> b!125763 (= lt!196683 ((_ sign_extend 32) (size!2571 (buf!2947 (_2!5522 lt!196582)))))))

(assert (= (and d!40862 res!104180) b!125762))

(assert (= (and b!125762 res!104179) b!125763))

(declare-fun m!191169 () Bool)

(assert (=> d!40862 m!191169))

(assert (=> d!40862 m!191083))

(assert (=> b!125708 d!40862))

(declare-fun d!40872 () Bool)

(declare-fun e!82792 () Bool)

(assert (=> d!40872 e!82792))

(declare-fun res!104182 () Bool)

(assert (=> d!40872 (=> (not res!104182) (not e!82792))))

(declare-fun lt!196688 () (_ BitVec 64))

(declare-fun lt!196690 () (_ BitVec 64))

(declare-fun lt!196686 () (_ BitVec 64))

(assert (=> d!40872 (= res!104182 (= lt!196688 (bvsub lt!196690 lt!196686)))))

(assert (=> d!40872 (or (= (bvand lt!196690 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!196686 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!196690 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!196690 lt!196686) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40872 (= lt!196686 (remainingBits!0 ((_ sign_extend 32) (size!2571 (buf!2947 thiss!1614))) ((_ sign_extend 32) (currentByte!5662 thiss!1614)) ((_ sign_extend 32) (currentBit!5657 thiss!1614))))))

(declare-fun lt!196687 () (_ BitVec 64))

(declare-fun lt!196691 () (_ BitVec 64))

(assert (=> d!40872 (= lt!196690 (bvmul lt!196687 lt!196691))))

(assert (=> d!40872 (or (= lt!196687 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!196691 (bvsdiv (bvmul lt!196687 lt!196691) lt!196687)))))

(assert (=> d!40872 (= lt!196691 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40872 (= lt!196687 ((_ sign_extend 32) (size!2571 (buf!2947 thiss!1614))))))

(assert (=> d!40872 (= lt!196688 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5662 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5657 thiss!1614))))))

(assert (=> d!40872 (invariant!0 (currentBit!5657 thiss!1614) (currentByte!5662 thiss!1614) (size!2571 (buf!2947 thiss!1614)))))

(assert (=> d!40872 (= (bitIndex!0 (size!2571 (buf!2947 thiss!1614)) (currentByte!5662 thiss!1614) (currentBit!5657 thiss!1614)) lt!196688)))

(declare-fun b!125764 () Bool)

(declare-fun res!104181 () Bool)

(assert (=> b!125764 (=> (not res!104181) (not e!82792))))

(assert (=> b!125764 (= res!104181 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!196688))))

(declare-fun b!125765 () Bool)

(declare-fun lt!196689 () (_ BitVec 64))

(assert (=> b!125765 (= e!82792 (bvsle lt!196688 (bvmul lt!196689 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!125765 (or (= lt!196689 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!196689 #b0000000000000000000000000000000000000000000000000000000000001000) lt!196689)))))

(assert (=> b!125765 (= lt!196689 ((_ sign_extend 32) (size!2571 (buf!2947 thiss!1614))))))

(assert (= (and d!40872 res!104182) b!125764))

(assert (= (and b!125764 res!104181) b!125765))

(assert (=> d!40872 m!191109))

(declare-fun m!191175 () Bool)

(assert (=> d!40872 m!191175))

(assert (=> b!125708 d!40872))

(declare-fun d!40874 () Bool)

(assert (=> d!40874 (= (array_inv!2360 (buf!2947 thiss!1614)) (bvsge (size!2571 (buf!2947 thiss!1614)) #b00000000000000000000000000000000))))

(assert (=> b!125703 d!40874))

(declare-fun d!40880 () Bool)

(declare-fun res!104202 () Bool)

(declare-fun e!82805 () Bool)

(assert (=> d!40880 (=> (not res!104202) (not e!82805))))

(assert (=> d!40880 (= res!104202 (= (size!2571 (buf!2947 thiss!1614)) (size!2571 (buf!2947 (_2!5522 lt!196582)))))))

(assert (=> d!40880 (= (isPrefixOf!0 thiss!1614 (_2!5522 lt!196582)) e!82805)))

(declare-fun b!125783 () Bool)

(declare-fun res!104201 () Bool)

(assert (=> b!125783 (=> (not res!104201) (not e!82805))))

(assert (=> b!125783 (= res!104201 (bvsle (bitIndex!0 (size!2571 (buf!2947 thiss!1614)) (currentByte!5662 thiss!1614) (currentBit!5657 thiss!1614)) (bitIndex!0 (size!2571 (buf!2947 (_2!5522 lt!196582))) (currentByte!5662 (_2!5522 lt!196582)) (currentBit!5657 (_2!5522 lt!196582)))))))

(declare-fun b!125784 () Bool)

(declare-fun e!82806 () Bool)

(assert (=> b!125784 (= e!82805 e!82806)))

(declare-fun res!104200 () Bool)

(assert (=> b!125784 (=> res!104200 e!82806)))

(assert (=> b!125784 (= res!104200 (= (size!2571 (buf!2947 thiss!1614)) #b00000000000000000000000000000000))))

(declare-fun b!125785 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5679 array!5679 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125785 (= e!82806 (arrayBitRangesEq!0 (buf!2947 thiss!1614) (buf!2947 (_2!5522 lt!196582)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2571 (buf!2947 thiss!1614)) (currentByte!5662 thiss!1614) (currentBit!5657 thiss!1614))))))

(assert (= (and d!40880 res!104202) b!125783))

(assert (= (and b!125783 res!104201) b!125784))

(assert (= (and b!125784 (not res!104200)) b!125785))

(assert (=> b!125783 m!191101))

(assert (=> b!125783 m!191099))

(assert (=> b!125785 m!191101))

(assert (=> b!125785 m!191101))

(declare-fun m!191183 () Bool)

(assert (=> b!125785 m!191183))

(assert (=> b!125702 d!40880))

(declare-fun d!40886 () Bool)

(assert (=> d!40886 (= (array_inv!2360 arr!227) (bvsge (size!2571 arr!227) #b00000000000000000000000000000000))))

(assert (=> start!24790 d!40886))

(declare-fun d!40888 () Bool)

(assert (=> d!40888 (= (inv!12 thiss!1614) (invariant!0 (currentBit!5657 thiss!1614) (currentByte!5662 thiss!1614) (size!2571 (buf!2947 thiss!1614))))))

(declare-fun bs!9898 () Bool)

(assert (= bs!9898 d!40888))

(assert (=> bs!9898 m!191175))

(assert (=> start!24790 d!40888))

(declare-fun d!40892 () Bool)

(declare-fun res!104207 () Bool)

(declare-fun e!82811 () Bool)

(assert (=> d!40892 (=> res!104207 e!82811)))

(assert (=> d!40892 (= res!104207 (= #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!40892 (= (arrayRangesEq!58 arr!227 (_2!5523 lt!196583) #b00000000000000000000000000000000 noOfBytes!1) e!82811)))

(declare-fun b!125790 () Bool)

(declare-fun e!82812 () Bool)

(assert (=> b!125790 (= e!82811 e!82812)))

(declare-fun res!104208 () Bool)

(assert (=> b!125790 (=> (not res!104208) (not e!82812))))

(assert (=> b!125790 (= res!104208 (= (select (arr!3164 arr!227) #b00000000000000000000000000000000) (select (arr!3164 (_2!5523 lt!196583)) #b00000000000000000000000000000000)))))

(declare-fun b!125791 () Bool)

(assert (=> b!125791 (= e!82812 (arrayRangesEq!58 arr!227 (_2!5523 lt!196583) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) noOfBytes!1))))

(assert (= (and d!40892 (not res!104207)) b!125790))

(assert (= (and b!125790 res!104208) b!125791))

(declare-fun m!191187 () Bool)

(assert (=> b!125790 m!191187))

(declare-fun m!191189 () Bool)

(assert (=> b!125790 m!191189))

(declare-fun m!191191 () Bool)

(assert (=> b!125791 m!191191))

(assert (=> b!125704 d!40892))

(declare-fun d!40894 () Bool)

(declare-datatypes ((tuple3!446 0))(
  ( (tuple3!447 (_1!5527 Unit!7739) (_2!5527 BitStream!4466) (_3!278 array!5679)) )
))
(declare-fun lt!196703 () tuple3!446)

(declare-fun readByteArrayLoop!0 (BitStream!4466 array!5679 (_ BitVec 32) (_ BitVec 32)) tuple3!446)

(assert (=> d!40894 (= lt!196703 (readByteArrayLoop!0 (_1!5524 lt!196581) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!40894 (= (readByteArrayLoopPure!0 (_1!5524 lt!196581) arr!227 #b00000000000000000000000000000000 noOfBytes!1) (tuple2!10495 (_2!5527 lt!196703) (_3!278 lt!196703)))))

(declare-fun bs!9902 () Bool)

(assert (= bs!9902 d!40894))

(declare-fun m!191199 () Bool)

(assert (=> bs!9902 m!191199))

(assert (=> b!125705 d!40894))

(declare-fun d!40902 () Bool)

(assert (=> d!40902 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2571 (buf!2947 (_2!5522 lt!196582)))) ((_ sign_extend 32) (currentByte!5662 thiss!1614)) ((_ sign_extend 32) (currentBit!5657 thiss!1614)) lt!196580) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2571 (buf!2947 (_2!5522 lt!196582)))) ((_ sign_extend 32) (currentByte!5662 thiss!1614)) ((_ sign_extend 32) (currentBit!5657 thiss!1614))) lt!196580))))

(declare-fun bs!9903 () Bool)

(assert (= bs!9903 d!40902))

(declare-fun m!191201 () Bool)

(assert (=> bs!9903 m!191201))

(assert (=> b!125705 d!40902))

(declare-fun d!40904 () Bool)

(assert (=> d!40904 (validate_offset_bits!1 ((_ sign_extend 32) (size!2571 (buf!2947 (_2!5522 lt!196582)))) ((_ sign_extend 32) (currentByte!5662 thiss!1614)) ((_ sign_extend 32) (currentBit!5657 thiss!1614)) lt!196580)))

(declare-fun lt!196706 () Unit!7739)

(declare-fun choose!9 (BitStream!4466 array!5679 (_ BitVec 64) BitStream!4466) Unit!7739)

(assert (=> d!40904 (= lt!196706 (choose!9 thiss!1614 (buf!2947 (_2!5522 lt!196582)) lt!196580 (BitStream!4467 (buf!2947 (_2!5522 lt!196582)) (currentByte!5662 thiss!1614) (currentBit!5657 thiss!1614))))))

(assert (=> d!40904 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2947 (_2!5522 lt!196582)) lt!196580) lt!196706)))

(declare-fun bs!9904 () Bool)

(assert (= bs!9904 d!40904))

(assert (=> bs!9904 m!191093))

(declare-fun m!191203 () Bool)

(assert (=> bs!9904 m!191203))

(assert (=> b!125705 d!40904))

(declare-fun b!125851 () Bool)

(declare-fun res!104253 () Bool)

(declare-fun e!82844 () Bool)

(assert (=> b!125851 (=> (not res!104253) (not e!82844))))

(declare-fun lt!196882 () tuple2!10496)

(assert (=> b!125851 (= res!104253 (isPrefixOf!0 (_2!5524 lt!196882) (_2!5522 lt!196582)))))

(declare-fun b!125853 () Bool)

(declare-fun e!82843 () Unit!7739)

(declare-fun lt!196886 () Unit!7739)

(assert (=> b!125853 (= e!82843 lt!196886)))

(declare-fun lt!196883 () (_ BitVec 64))

(assert (=> b!125853 (= lt!196883 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!196888 () (_ BitVec 64))

(assert (=> b!125853 (= lt!196888 (bitIndex!0 (size!2571 (buf!2947 thiss!1614)) (currentByte!5662 thiss!1614) (currentBit!5657 thiss!1614)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5679 array!5679 (_ BitVec 64) (_ BitVec 64)) Unit!7739)

(assert (=> b!125853 (= lt!196886 (arrayBitRangesEqSymmetric!0 (buf!2947 thiss!1614) (buf!2947 (_2!5522 lt!196582)) lt!196883 lt!196888))))

(assert (=> b!125853 (arrayBitRangesEq!0 (buf!2947 (_2!5522 lt!196582)) (buf!2947 thiss!1614) lt!196883 lt!196888)))

(declare-fun lt!196880 () (_ BitVec 64))

(declare-fun b!125854 () Bool)

(declare-fun lt!196884 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4466 (_ BitVec 64)) BitStream!4466)

(assert (=> b!125854 (= e!82844 (= (_1!5524 lt!196882) (withMovedBitIndex!0 (_2!5524 lt!196882) (bvsub lt!196880 lt!196884))))))

(assert (=> b!125854 (or (= (bvand lt!196880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!196884 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!196880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!196880 lt!196884) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!125854 (= lt!196884 (bitIndex!0 (size!2571 (buf!2947 (_2!5522 lt!196582))) (currentByte!5662 (_2!5522 lt!196582)) (currentBit!5657 (_2!5522 lt!196582))))))

(assert (=> b!125854 (= lt!196880 (bitIndex!0 (size!2571 (buf!2947 thiss!1614)) (currentByte!5662 thiss!1614) (currentBit!5657 thiss!1614)))))

(declare-fun b!125855 () Bool)

(declare-fun Unit!7743 () Unit!7739)

(assert (=> b!125855 (= e!82843 Unit!7743)))

(declare-fun b!125852 () Bool)

(declare-fun res!104252 () Bool)

(assert (=> b!125852 (=> (not res!104252) (not e!82844))))

(assert (=> b!125852 (= res!104252 (isPrefixOf!0 (_1!5524 lt!196882) thiss!1614))))

(declare-fun d!40906 () Bool)

(assert (=> d!40906 e!82844))

(declare-fun res!104254 () Bool)

(assert (=> d!40906 (=> (not res!104254) (not e!82844))))

(assert (=> d!40906 (= res!104254 (isPrefixOf!0 (_1!5524 lt!196882) (_2!5524 lt!196882)))))

(declare-fun lt!196897 () BitStream!4466)

(assert (=> d!40906 (= lt!196882 (tuple2!10497 lt!196897 (_2!5522 lt!196582)))))

(declare-fun lt!196881 () Unit!7739)

(declare-fun lt!196893 () Unit!7739)

(assert (=> d!40906 (= lt!196881 lt!196893)))

(assert (=> d!40906 (isPrefixOf!0 lt!196897 (_2!5522 lt!196582))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4466 BitStream!4466 BitStream!4466) Unit!7739)

(assert (=> d!40906 (= lt!196893 (lemmaIsPrefixTransitive!0 lt!196897 (_2!5522 lt!196582) (_2!5522 lt!196582)))))

(declare-fun lt!196896 () Unit!7739)

(declare-fun lt!196892 () Unit!7739)

(assert (=> d!40906 (= lt!196896 lt!196892)))

(assert (=> d!40906 (isPrefixOf!0 lt!196897 (_2!5522 lt!196582))))

(assert (=> d!40906 (= lt!196892 (lemmaIsPrefixTransitive!0 lt!196897 thiss!1614 (_2!5522 lt!196582)))))

(declare-fun lt!196889 () Unit!7739)

(assert (=> d!40906 (= lt!196889 e!82843)))

(declare-fun c!7476 () Bool)

(assert (=> d!40906 (= c!7476 (not (= (size!2571 (buf!2947 thiss!1614)) #b00000000000000000000000000000000)))))

(declare-fun lt!196891 () Unit!7739)

(declare-fun lt!196879 () Unit!7739)

(assert (=> d!40906 (= lt!196891 lt!196879)))

(assert (=> d!40906 (isPrefixOf!0 (_2!5522 lt!196582) (_2!5522 lt!196582))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4466) Unit!7739)

(assert (=> d!40906 (= lt!196879 (lemmaIsPrefixRefl!0 (_2!5522 lt!196582)))))

(declare-fun lt!196885 () Unit!7739)

(declare-fun lt!196898 () Unit!7739)

(assert (=> d!40906 (= lt!196885 lt!196898)))

(assert (=> d!40906 (= lt!196898 (lemmaIsPrefixRefl!0 (_2!5522 lt!196582)))))

(declare-fun lt!196894 () Unit!7739)

(declare-fun lt!196890 () Unit!7739)

(assert (=> d!40906 (= lt!196894 lt!196890)))

(assert (=> d!40906 (isPrefixOf!0 lt!196897 lt!196897)))

(assert (=> d!40906 (= lt!196890 (lemmaIsPrefixRefl!0 lt!196897))))

(declare-fun lt!196887 () Unit!7739)

(declare-fun lt!196895 () Unit!7739)

(assert (=> d!40906 (= lt!196887 lt!196895)))

(assert (=> d!40906 (isPrefixOf!0 thiss!1614 thiss!1614)))

(assert (=> d!40906 (= lt!196895 (lemmaIsPrefixRefl!0 thiss!1614))))

(assert (=> d!40906 (= lt!196897 (BitStream!4467 (buf!2947 (_2!5522 lt!196582)) (currentByte!5662 thiss!1614) (currentBit!5657 thiss!1614)))))

(assert (=> d!40906 (isPrefixOf!0 thiss!1614 (_2!5522 lt!196582))))

(assert (=> d!40906 (= (reader!0 thiss!1614 (_2!5522 lt!196582)) lt!196882)))

(assert (= (and d!40906 c!7476) b!125853))

(assert (= (and d!40906 (not c!7476)) b!125855))

(assert (= (and d!40906 res!104254) b!125852))

(assert (= (and b!125852 res!104252) b!125851))

(assert (= (and b!125851 res!104253) b!125854))

(assert (=> b!125853 m!191101))

(declare-fun m!191277 () Bool)

(assert (=> b!125853 m!191277))

(declare-fun m!191279 () Bool)

(assert (=> b!125853 m!191279))

(declare-fun m!191281 () Bool)

(assert (=> d!40906 m!191281))

(assert (=> d!40906 m!191089))

(declare-fun m!191283 () Bool)

(assert (=> d!40906 m!191283))

(declare-fun m!191285 () Bool)

(assert (=> d!40906 m!191285))

(declare-fun m!191287 () Bool)

(assert (=> d!40906 m!191287))

(declare-fun m!191289 () Bool)

(assert (=> d!40906 m!191289))

(declare-fun m!191291 () Bool)

(assert (=> d!40906 m!191291))

(declare-fun m!191293 () Bool)

(assert (=> d!40906 m!191293))

(declare-fun m!191295 () Bool)

(assert (=> d!40906 m!191295))

(declare-fun m!191297 () Bool)

(assert (=> d!40906 m!191297))

(declare-fun m!191299 () Bool)

(assert (=> d!40906 m!191299))

(declare-fun m!191301 () Bool)

(assert (=> b!125854 m!191301))

(assert (=> b!125854 m!191099))

(assert (=> b!125854 m!191101))

(declare-fun m!191307 () Bool)

(assert (=> b!125851 m!191307))

(declare-fun m!191309 () Bool)

(assert (=> b!125852 m!191309))

(assert (=> b!125705 d!40906))

(push 1)

