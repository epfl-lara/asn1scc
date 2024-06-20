; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24976 () Bool)

(assert start!24976)

(declare-fun b!126558 () Bool)

(declare-fun e!83432 () Bool)

(declare-fun e!83431 () Bool)

(assert (=> b!126558 (= e!83432 e!83431)))

(declare-fun res!104882 () Bool)

(assert (=> b!126558 (=> (not res!104882) (not e!83431))))

(declare-datatypes ((array!5727 0))(
  ( (array!5728 (arr!3197 (Array (_ BitVec 32) (_ BitVec 8))) (size!2592 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4508 0))(
  ( (BitStream!4509 (buf!2974 array!5727) (currentByte!5707 (_ BitVec 32)) (currentBit!5702 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4508)

(declare-datatypes ((Unit!7787 0))(
  ( (Unit!7788) )
))
(declare-datatypes ((tuple2!10618 0))(
  ( (tuple2!10619 (_1!5591 Unit!7787) (_2!5591 BitStream!4508)) )
))
(declare-fun lt!197669 () tuple2!10618)

(declare-fun lt!197666 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126558 (= res!104882 (= (bitIndex!0 (size!2592 (buf!2974 (_2!5591 lt!197669))) (currentByte!5707 (_2!5591 lt!197669)) (currentBit!5702 (_2!5591 lt!197669))) (bvadd (bitIndex!0 (size!2592 (buf!2974 thiss!1614)) (currentByte!5707 thiss!1614) (currentBit!5702 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!197666))))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(assert (=> b!126558 (= lt!197666 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!126559 () Bool)

(declare-fun res!104884 () Bool)

(declare-fun e!83436 () Bool)

(assert (=> b!126559 (=> res!104884 e!83436)))

(declare-fun isPrefixOf!0 (BitStream!4508 BitStream!4508) Bool)

(assert (=> b!126559 (= res!104884 (not (isPrefixOf!0 thiss!1614 (_2!5591 lt!197669))))))

(declare-fun b!126560 () Bool)

(declare-datatypes ((tuple2!10620 0))(
  ( (tuple2!10621 (_1!5592 BitStream!4508) (_2!5592 BitStream!4508)) )
))
(declare-fun lt!197667 () tuple2!10620)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126560 (= e!83436 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2592 (buf!2974 (_1!5592 lt!197667)))) ((_ sign_extend 32) (currentByte!5707 (_1!5592 lt!197667))) ((_ sign_extend 32) (currentBit!5702 (_1!5592 lt!197667))) noOfBytes!1))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126560 (validate_offset_bits!1 ((_ sign_extend 32) (size!2592 (buf!2974 (_2!5591 lt!197669)))) ((_ sign_extend 32) (currentByte!5707 thiss!1614)) ((_ sign_extend 32) (currentBit!5702 thiss!1614)) ((_ sign_extend 32) noOfBytes!1))))

(declare-fun lt!197671 () Unit!7787)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4508 array!5727 (_ BitVec 64)) Unit!7787)

(assert (=> b!126560 (= lt!197671 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2974 (_2!5591 lt!197669)) ((_ sign_extend 32) noOfBytes!1)))))

(declare-fun reader!0 (BitStream!4508 BitStream!4508) tuple2!10620)

(assert (=> b!126560 (= lt!197667 (reader!0 thiss!1614 (_2!5591 lt!197669)))))

(declare-fun b!126561 () Bool)

(declare-fun res!104880 () Bool)

(assert (=> b!126561 (=> (not res!104880) (not e!83431))))

(assert (=> b!126561 (= res!104880 (isPrefixOf!0 thiss!1614 (_2!5591 lt!197669)))))

(declare-fun b!126563 () Bool)

(declare-fun res!104883 () Bool)

(declare-fun e!83437 () Bool)

(assert (=> b!126563 (=> (not res!104883) (not e!83437))))

(assert (=> b!126563 (= res!104883 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2592 (buf!2974 thiss!1614))) ((_ sign_extend 32) (currentByte!5707 thiss!1614)) ((_ sign_extend 32) (currentBit!5702 thiss!1614)) noOfBytes!1))))

(declare-fun b!126564 () Bool)

(declare-datatypes ((tuple2!10622 0))(
  ( (tuple2!10623 (_1!5593 BitStream!4508) (_2!5593 array!5727)) )
))
(declare-fun lt!197668 () tuple2!10622)

(declare-fun e!83433 () Bool)

(declare-fun arr!227 () array!5727)

(declare-fun arrayRangesEq!79 (array!5727 array!5727 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126564 (= e!83433 (not (arrayRangesEq!79 arr!227 (_2!5593 lt!197668) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun res!104878 () Bool)

(assert (=> start!24976 (=> (not res!104878) (not e!83437))))

(assert (=> start!24976 (= res!104878 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2592 arr!227))))))

(assert (=> start!24976 e!83437))

(assert (=> start!24976 true))

(declare-fun array_inv!2381 (array!5727) Bool)

(assert (=> start!24976 (array_inv!2381 arr!227)))

(declare-fun e!83435 () Bool)

(declare-fun inv!12 (BitStream!4508) Bool)

(assert (=> start!24976 (and (inv!12 thiss!1614) e!83435)))

(declare-fun b!126562 () Bool)

(assert (=> b!126562 (= e!83431 (not e!83433))))

(declare-fun res!104881 () Bool)

(assert (=> b!126562 (=> res!104881 e!83433)))

(declare-fun lt!197672 () tuple2!10620)

(assert (=> b!126562 (= res!104881 (or (not (= (size!2592 (_2!5593 lt!197668)) (size!2592 arr!227))) (not (= (_1!5593 lt!197668) (_2!5592 lt!197672)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4508 array!5727 (_ BitVec 32) (_ BitVec 32)) tuple2!10622)

(assert (=> b!126562 (= lt!197668 (readByteArrayLoopPure!0 (_1!5592 lt!197672) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> b!126562 (validate_offset_bits!1 ((_ sign_extend 32) (size!2592 (buf!2974 (_2!5591 lt!197669)))) ((_ sign_extend 32) (currentByte!5707 thiss!1614)) ((_ sign_extend 32) (currentBit!5702 thiss!1614)) lt!197666)))

(declare-fun lt!197670 () Unit!7787)

(assert (=> b!126562 (= lt!197670 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2974 (_2!5591 lt!197669)) lt!197666))))

(assert (=> b!126562 (= lt!197672 (reader!0 thiss!1614 (_2!5591 lt!197669)))))

(declare-fun b!126565 () Bool)

(assert (=> b!126565 (= e!83437 (not e!83436))))

(declare-fun res!104879 () Bool)

(assert (=> b!126565 (=> res!104879 e!83436)))

(assert (=> b!126565 (= res!104879 (not (= (bitIndex!0 (size!2592 (buf!2974 (_2!5591 lt!197669))) (currentByte!5707 (_2!5591 lt!197669)) (currentBit!5702 (_2!5591 lt!197669))) (bvadd (bitIndex!0 (size!2592 (buf!2974 thiss!1614)) (currentByte!5707 thiss!1614) (currentBit!5702 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(assert (=> b!126565 e!83432))

(declare-fun res!104877 () Bool)

(assert (=> b!126565 (=> (not res!104877) (not e!83432))))

(assert (=> b!126565 (= res!104877 (= (size!2592 (buf!2974 thiss!1614)) (size!2592 (buf!2974 (_2!5591 lt!197669)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4508 array!5727 (_ BitVec 32) (_ BitVec 32)) tuple2!10618)

(assert (=> b!126565 (= lt!197669 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126566 () Bool)

(assert (=> b!126566 (= e!83435 (array_inv!2381 (buf!2974 thiss!1614)))))

(assert (= (and start!24976 res!104878) b!126563))

(assert (= (and b!126563 res!104883) b!126565))

(assert (= (and b!126565 res!104877) b!126558))

(assert (= (and b!126558 res!104882) b!126561))

(assert (= (and b!126561 res!104880) b!126562))

(assert (= (and b!126562 (not res!104881)) b!126564))

(assert (= (and b!126565 (not res!104879)) b!126559))

(assert (= (and b!126559 (not res!104884)) b!126560))

(assert (= start!24976 b!126566))

(declare-fun m!192067 () Bool)

(assert (=> start!24976 m!192067))

(declare-fun m!192069 () Bool)

(assert (=> start!24976 m!192069))

(declare-fun m!192071 () Bool)

(assert (=> b!126562 m!192071))

(declare-fun m!192073 () Bool)

(assert (=> b!126562 m!192073))

(declare-fun m!192075 () Bool)

(assert (=> b!126562 m!192075))

(declare-fun m!192077 () Bool)

(assert (=> b!126562 m!192077))

(declare-fun m!192079 () Bool)

(assert (=> b!126566 m!192079))

(declare-fun m!192081 () Bool)

(assert (=> b!126564 m!192081))

(declare-fun m!192083 () Bool)

(assert (=> b!126565 m!192083))

(declare-fun m!192085 () Bool)

(assert (=> b!126565 m!192085))

(declare-fun m!192087 () Bool)

(assert (=> b!126565 m!192087))

(declare-fun m!192089 () Bool)

(assert (=> b!126559 m!192089))

(declare-fun m!192091 () Bool)

(assert (=> b!126560 m!192091))

(declare-fun m!192093 () Bool)

(assert (=> b!126560 m!192093))

(declare-fun m!192095 () Bool)

(assert (=> b!126560 m!192095))

(assert (=> b!126560 m!192077))

(assert (=> b!126558 m!192083))

(assert (=> b!126558 m!192085))

(declare-fun m!192097 () Bool)

(assert (=> b!126563 m!192097))

(assert (=> b!126561 m!192089))

(push 1)

(assert (not b!126558))

(assert (not b!126562))

(assert (not b!126565))

(assert (not b!126560))

(assert (not b!126559))

(assert (not b!126563))

(assert (not b!126564))

(assert (not b!126561))

(assert (not start!24976))

(assert (not b!126566))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!41038 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!41038 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2592 (buf!2974 thiss!1614))) ((_ sign_extend 32) (currentByte!5707 thiss!1614)) ((_ sign_extend 32) (currentBit!5702 thiss!1614)) noOfBytes!1) (bvsle ((_ sign_extend 32) noOfBytes!1) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2592 (buf!2974 thiss!1614))) ((_ sign_extend 32) (currentByte!5707 thiss!1614)) ((_ sign_extend 32) (currentBit!5702 thiss!1614))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!9947 () Bool)

(assert (= bs!9947 d!41038))

(declare-fun m!192105 () Bool)

(assert (=> bs!9947 m!192105))

(assert (=> b!126563 d!41038))

(declare-fun d!41040 () Bool)

(declare-fun e!83441 () Bool)

(assert (=> d!41040 e!83441))

(declare-fun res!104889 () Bool)

(assert (=> d!41040 (=> (not res!104889) (not e!83441))))

(declare-fun lt!197693 () (_ BitVec 64))

(declare-fun lt!197691 () (_ BitVec 64))

(declare-fun lt!197689 () (_ BitVec 64))

(assert (=> d!41040 (= res!104889 (= lt!197693 (bvsub lt!197691 lt!197689)))))

(assert (=> d!41040 (or (= (bvand lt!197691 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197689 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!197691 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!197691 lt!197689) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41040 (= lt!197689 (remainingBits!0 ((_ sign_extend 32) (size!2592 (buf!2974 (_2!5591 lt!197669)))) ((_ sign_extend 32) (currentByte!5707 (_2!5591 lt!197669))) ((_ sign_extend 32) (currentBit!5702 (_2!5591 lt!197669)))))))

(declare-fun lt!197688 () (_ BitVec 64))

(declare-fun lt!197692 () (_ BitVec 64))

(assert (=> d!41040 (= lt!197691 (bvmul lt!197688 lt!197692))))

(assert (=> d!41040 (or (= lt!197688 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!197692 (bvsdiv (bvmul lt!197688 lt!197692) lt!197688)))))

(assert (=> d!41040 (= lt!197692 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41040 (= lt!197688 ((_ sign_extend 32) (size!2592 (buf!2974 (_2!5591 lt!197669)))))))

(assert (=> d!41040 (= lt!197693 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5707 (_2!5591 lt!197669))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5702 (_2!5591 lt!197669)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!41040 (invariant!0 (currentBit!5702 (_2!5591 lt!197669)) (currentByte!5707 (_2!5591 lt!197669)) (size!2592 (buf!2974 (_2!5591 lt!197669))))))

(assert (=> d!41040 (= (bitIndex!0 (size!2592 (buf!2974 (_2!5591 lt!197669))) (currentByte!5707 (_2!5591 lt!197669)) (currentBit!5702 (_2!5591 lt!197669))) lt!197693)))

(declare-fun b!126571 () Bool)

(declare-fun res!104890 () Bool)

(assert (=> b!126571 (=> (not res!104890) (not e!83441))))

(assert (=> b!126571 (= res!104890 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!197693))))

(declare-fun b!126572 () Bool)

(declare-fun lt!197690 () (_ BitVec 64))

(assert (=> b!126572 (= e!83441 (bvsle lt!197693 (bvmul lt!197690 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!126572 (or (= lt!197690 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!197690 #b0000000000000000000000000000000000000000000000000000000000001000) lt!197690)))))

(assert (=> b!126572 (= lt!197690 ((_ sign_extend 32) (size!2592 (buf!2974 (_2!5591 lt!197669)))))))

(assert (= (and d!41040 res!104889) b!126571))

(assert (= (and b!126571 res!104890) b!126572))

(declare-fun m!192107 () Bool)

(assert (=> d!41040 m!192107))

(declare-fun m!192109 () Bool)

(assert (=> d!41040 m!192109))

(assert (=> b!126558 d!41040))

(declare-fun d!41042 () Bool)

(declare-fun e!83442 () Bool)

(assert (=> d!41042 e!83442))

(declare-fun res!104891 () Bool)

(assert (=> d!41042 (=> (not res!104891) (not e!83442))))

(declare-fun lt!197699 () (_ BitVec 64))

(declare-fun lt!197695 () (_ BitVec 64))

(declare-fun lt!197697 () (_ BitVec 64))

(assert (=> d!41042 (= res!104891 (= lt!197699 (bvsub lt!197697 lt!197695)))))

(assert (=> d!41042 (or (= (bvand lt!197697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197695 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!197697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!197697 lt!197695) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41042 (= lt!197695 (remainingBits!0 ((_ sign_extend 32) (size!2592 (buf!2974 thiss!1614))) ((_ sign_extend 32) (currentByte!5707 thiss!1614)) ((_ sign_extend 32) (currentBit!5702 thiss!1614))))))

(declare-fun lt!197694 () (_ BitVec 64))

(declare-fun lt!197698 () (_ BitVec 64))

(assert (=> d!41042 (= lt!197697 (bvmul lt!197694 lt!197698))))

(assert (=> d!41042 (or (= lt!197694 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!197698 (bvsdiv (bvmul lt!197694 lt!197698) lt!197694)))))

(assert (=> d!41042 (= lt!197698 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41042 (= lt!197694 ((_ sign_extend 32) (size!2592 (buf!2974 thiss!1614))))))

(assert (=> d!41042 (= lt!197699 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5707 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5702 thiss!1614))))))

(assert (=> d!41042 (invariant!0 (currentBit!5702 thiss!1614) (currentByte!5707 thiss!1614) (size!2592 (buf!2974 thiss!1614)))))

(assert (=> d!41042 (= (bitIndex!0 (size!2592 (buf!2974 thiss!1614)) (currentByte!5707 thiss!1614) (currentBit!5702 thiss!1614)) lt!197699)))

(declare-fun b!126573 () Bool)

(declare-fun res!104892 () Bool)

(assert (=> b!126573 (=> (not res!104892) (not e!83442))))

(assert (=> b!126573 (= res!104892 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!197699))))

(declare-fun b!126574 () Bool)

(declare-fun lt!197696 () (_ BitVec 64))

(assert (=> b!126574 (= e!83442 (bvsle lt!197699 (bvmul lt!197696 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!126574 (or (= lt!197696 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!197696 #b0000000000000000000000000000000000000000000000000000000000001000) lt!197696)))))

(assert (=> b!126574 (= lt!197696 ((_ sign_extend 32) (size!2592 (buf!2974 thiss!1614))))))

(assert (= (and d!41042 res!104891) b!126573))

(assert (= (and b!126573 res!104892) b!126574))

(assert (=> d!41042 m!192105))

(declare-fun m!192111 () Bool)

(assert (=> d!41042 m!192111))

(assert (=> b!126558 d!41042))

(declare-fun d!41046 () Bool)

(declare-fun res!104899 () Bool)

(declare-fun e!83447 () Bool)

(assert (=> d!41046 (=> (not res!104899) (not e!83447))))

(assert (=> d!41046 (= res!104899 (= (size!2592 (buf!2974 thiss!1614)) (size!2592 (buf!2974 (_2!5591 lt!197669)))))))

(assert (=> d!41046 (= (isPrefixOf!0 thiss!1614 (_2!5591 lt!197669)) e!83447)))

(declare-fun b!126581 () Bool)

(declare-fun res!104900 () Bool)

(assert (=> b!126581 (=> (not res!104900) (not e!83447))))

(assert (=> b!126581 (= res!104900 (bvsle (bitIndex!0 (size!2592 (buf!2974 thiss!1614)) (currentByte!5707 thiss!1614) (currentBit!5702 thiss!1614)) (bitIndex!0 (size!2592 (buf!2974 (_2!5591 lt!197669))) (currentByte!5707 (_2!5591 lt!197669)) (currentBit!5702 (_2!5591 lt!197669)))))))

(declare-fun b!126582 () Bool)

(declare-fun e!83448 () Bool)

(assert (=> b!126582 (= e!83447 e!83448)))

(declare-fun res!104901 () Bool)

(assert (=> b!126582 (=> res!104901 e!83448)))

(assert (=> b!126582 (= res!104901 (= (size!2592 (buf!2974 thiss!1614)) #b00000000000000000000000000000000))))

(declare-fun b!126583 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5727 array!5727 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126583 (= e!83448 (arrayBitRangesEq!0 (buf!2974 thiss!1614) (buf!2974 (_2!5591 lt!197669)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2592 (buf!2974 thiss!1614)) (currentByte!5707 thiss!1614) (currentBit!5702 thiss!1614))))))

(assert (= (and d!41046 res!104899) b!126581))

(assert (= (and b!126581 res!104900) b!126582))

(assert (= (and b!126582 (not res!104901)) b!126583))

(assert (=> b!126581 m!192085))

(assert (=> b!126581 m!192083))

(assert (=> b!126583 m!192085))

(assert (=> b!126583 m!192085))

(declare-fun m!192113 () Bool)

(assert (=> b!126583 m!192113))

(assert (=> b!126561 d!41046))

(declare-fun d!41048 () Bool)

(declare-datatypes ((tuple3!454 0))(
  ( (tuple3!455 (_1!5594 Unit!7787) (_2!5594 BitStream!4508) (_3!282 array!5727)) )
))
(declare-fun lt!197702 () tuple3!454)

(declare-fun readByteArrayLoop!0 (BitStream!4508 array!5727 (_ BitVec 32) (_ BitVec 32)) tuple3!454)

(assert (=> d!41048 (= lt!197702 (readByteArrayLoop!0 (_1!5592 lt!197672) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!41048 (= (readByteArrayLoopPure!0 (_1!5592 lt!197672) arr!227 #b00000000000000000000000000000000 noOfBytes!1) (tuple2!10623 (_2!5594 lt!197702) (_3!282 lt!197702)))))

(declare-fun bs!9948 () Bool)

(assert (= bs!9948 d!41048))

(declare-fun m!192117 () Bool)

(assert (=> bs!9948 m!192117))

(assert (=> b!126562 d!41048))

(declare-fun d!41052 () Bool)

(assert (=> d!41052 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2592 (buf!2974 (_2!5591 lt!197669)))) ((_ sign_extend 32) (currentByte!5707 thiss!1614)) ((_ sign_extend 32) (currentBit!5702 thiss!1614)) lt!197666) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2592 (buf!2974 (_2!5591 lt!197669)))) ((_ sign_extend 32) (currentByte!5707 thiss!1614)) ((_ sign_extend 32) (currentBit!5702 thiss!1614))) lt!197666))))

(declare-fun bs!9949 () Bool)

(assert (= bs!9949 d!41052))

(declare-fun m!192119 () Bool)

(assert (=> bs!9949 m!192119))

(assert (=> b!126562 d!41052))

(declare-fun d!41056 () Bool)

(assert (=> d!41056 (validate_offset_bits!1 ((_ sign_extend 32) (size!2592 (buf!2974 (_2!5591 lt!197669)))) ((_ sign_extend 32) (currentByte!5707 thiss!1614)) ((_ sign_extend 32) (currentBit!5702 thiss!1614)) lt!197666)))

(declare-fun lt!197745 () Unit!7787)

(declare-fun choose!9 (BitStream!4508 array!5727 (_ BitVec 64) BitStream!4508) Unit!7787)

(assert (=> d!41056 (= lt!197745 (choose!9 thiss!1614 (buf!2974 (_2!5591 lt!197669)) lt!197666 (BitStream!4509 (buf!2974 (_2!5591 lt!197669)) (currentByte!5707 thiss!1614) (currentBit!5702 thiss!1614))))))

(assert (=> d!41056 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2974 (_2!5591 lt!197669)) lt!197666) lt!197745)))

(declare-fun bs!9951 () Bool)

(assert (= bs!9951 d!41056))

(assert (=> bs!9951 m!192073))

(declare-fun m!192123 () Bool)

(assert (=> bs!9951 m!192123))

(assert (=> b!126562 d!41056))

(declare-fun b!126635 () Bool)

(declare-fun e!83476 () Unit!7787)

(declare-fun lt!197848 () Unit!7787)

(assert (=> b!126635 (= e!83476 lt!197848)))

(declare-fun lt!197844 () (_ BitVec 64))

(assert (=> b!126635 (= lt!197844 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!197841 () (_ BitVec 64))

(assert (=> b!126635 (= lt!197841 (bitIndex!0 (size!2592 (buf!2974 thiss!1614)) (currentByte!5707 thiss!1614) (currentBit!5702 thiss!1614)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5727 array!5727 (_ BitVec 64) (_ BitVec 64)) Unit!7787)

(assert (=> b!126635 (= lt!197848 (arrayBitRangesEqSymmetric!0 (buf!2974 thiss!1614) (buf!2974 (_2!5591 lt!197669)) lt!197844 lt!197841))))

(assert (=> b!126635 (arrayBitRangesEq!0 (buf!2974 (_2!5591 lt!197669)) (buf!2974 thiss!1614) lt!197844 lt!197841)))

(declare-fun b!126636 () Bool)

(declare-fun res!104944 () Bool)

(declare-fun e!83475 () Bool)

(assert (=> b!126636 (=> (not res!104944) (not e!83475))))

(declare-fun lt!197838 () tuple2!10620)

(assert (=> b!126636 (= res!104944 (isPrefixOf!0 (_2!5592 lt!197838) (_2!5591 lt!197669)))))

(declare-fun b!126637 () Bool)

(declare-fun res!104943 () Bool)

(assert (=> b!126637 (=> (not res!104943) (not e!83475))))

(assert (=> b!126637 (= res!104943 (isPrefixOf!0 (_1!5592 lt!197838) thiss!1614))))

(declare-fun d!41060 () Bool)

(assert (=> d!41060 e!83475))

(declare-fun res!104945 () Bool)

(assert (=> d!41060 (=> (not res!104945) (not e!83475))))

(assert (=> d!41060 (= res!104945 (isPrefixOf!0 (_1!5592 lt!197838) (_2!5592 lt!197838)))))

(declare-fun lt!197843 () BitStream!4508)

(assert (=> d!41060 (= lt!197838 (tuple2!10621 lt!197843 (_2!5591 lt!197669)))))

(declare-fun lt!197852 () Unit!7787)

(declare-fun lt!197839 () Unit!7787)

(assert (=> d!41060 (= lt!197852 lt!197839)))

(assert (=> d!41060 (isPrefixOf!0 lt!197843 (_2!5591 lt!197669))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4508 BitStream!4508 BitStream!4508) Unit!7787)

(assert (=> d!41060 (= lt!197839 (lemmaIsPrefixTransitive!0 lt!197843 (_2!5591 lt!197669) (_2!5591 lt!197669)))))

(declare-fun lt!197847 () Unit!7787)

(declare-fun lt!197836 () Unit!7787)

(assert (=> d!41060 (= lt!197847 lt!197836)))

(assert (=> d!41060 (isPrefixOf!0 lt!197843 (_2!5591 lt!197669))))

(assert (=> d!41060 (= lt!197836 (lemmaIsPrefixTransitive!0 lt!197843 thiss!1614 (_2!5591 lt!197669)))))

(declare-fun lt!197837 () Unit!7787)

(assert (=> d!41060 (= lt!197837 e!83476)))

(declare-fun c!7491 () Bool)

(assert (=> d!41060 (= c!7491 (not (= (size!2592 (buf!2974 thiss!1614)) #b00000000000000000000000000000000)))))

(declare-fun lt!197851 () Unit!7787)

(declare-fun lt!197835 () Unit!7787)

(assert (=> d!41060 (= lt!197851 lt!197835)))

(assert (=> d!41060 (isPrefixOf!0 (_2!5591 lt!197669) (_2!5591 lt!197669))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4508) Unit!7787)

(assert (=> d!41060 (= lt!197835 (lemmaIsPrefixRefl!0 (_2!5591 lt!197669)))))

(declare-fun lt!197845 () Unit!7787)

(declare-fun lt!197850 () Unit!7787)

(assert (=> d!41060 (= lt!197845 lt!197850)))

(assert (=> d!41060 (= lt!197850 (lemmaIsPrefixRefl!0 (_2!5591 lt!197669)))))

(declare-fun lt!197842 () Unit!7787)

(declare-fun lt!197840 () Unit!7787)

(assert (=> d!41060 (= lt!197842 lt!197840)))

(assert (=> d!41060 (isPrefixOf!0 lt!197843 lt!197843)))

(assert (=> d!41060 (= lt!197840 (lemmaIsPrefixRefl!0 lt!197843))))

(declare-fun lt!197846 () Unit!7787)

(declare-fun lt!197849 () Unit!7787)

(assert (=> d!41060 (= lt!197846 lt!197849)))

(assert (=> d!41060 (isPrefixOf!0 thiss!1614 thiss!1614)))

(assert (=> d!41060 (= lt!197849 (lemmaIsPrefixRefl!0 thiss!1614))))

(assert (=> d!41060 (= lt!197843 (BitStream!4509 (buf!2974 (_2!5591 lt!197669)) (currentByte!5707 thiss!1614) (currentBit!5702 thiss!1614)))))

(assert (=> d!41060 (isPrefixOf!0 thiss!1614 (_2!5591 lt!197669))))

(assert (=> d!41060 (= (reader!0 thiss!1614 (_2!5591 lt!197669)) lt!197838)))

(declare-fun b!126638 () Bool)

(declare-fun Unit!7790 () Unit!7787)

(assert (=> b!126638 (= e!83476 Unit!7790)))

(declare-fun lt!197833 () (_ BitVec 64))

(declare-fun b!126639 () Bool)

(declare-fun lt!197834 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4508 (_ BitVec 64)) BitStream!4508)

(assert (=> b!126639 (= e!83475 (= (_1!5592 lt!197838) (withMovedBitIndex!0 (_2!5592 lt!197838) (bvsub lt!197833 lt!197834))))))

(assert (=> b!126639 (or (= (bvand lt!197833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197834 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!197833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!197833 lt!197834) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126639 (= lt!197834 (bitIndex!0 (size!2592 (buf!2974 (_2!5591 lt!197669))) (currentByte!5707 (_2!5591 lt!197669)) (currentBit!5702 (_2!5591 lt!197669))))))

(assert (=> b!126639 (= lt!197833 (bitIndex!0 (size!2592 (buf!2974 thiss!1614)) (currentByte!5707 thiss!1614) (currentBit!5702 thiss!1614)))))

(assert (= (and d!41060 c!7491) b!126635))

(assert (= (and d!41060 (not c!7491)) b!126638))

(assert (= (and d!41060 res!104945) b!126637))

(assert (= (and b!126637 res!104943) b!126636))

(assert (= (and b!126636 res!104944) b!126639))

(assert (=> b!126635 m!192085))

(declare-fun m!192169 () Bool)

(assert (=> b!126635 m!192169))

(declare-fun m!192171 () Bool)

(assert (=> b!126635 m!192171))

(declare-fun m!192173 () Bool)

(assert (=> b!126637 m!192173))

(declare-fun m!192175 () Bool)

(assert (=> b!126639 m!192175))

(assert (=> b!126639 m!192083))

(assert (=> b!126639 m!192085))

(assert (=> d!41060 m!192089))

(declare-fun m!192177 () Bool)

(assert (=> d!41060 m!192177))

(declare-fun m!192179 () Bool)

(assert (=> d!41060 m!192179))

(declare-fun m!192181 () Bool)

(assert (=> d!41060 m!192181))

(declare-fun m!192183 () Bool)

(assert (=> d!41060 m!192183))

(declare-fun m!192185 () Bool)

(assert (=> d!41060 m!192185))

(declare-fun m!192187 () Bool)

(assert (=> d!41060 m!192187))

(declare-fun m!192189 () Bool)

(assert (=> d!41060 m!192189))

(declare-fun m!192191 () Bool)

(assert (=> d!41060 m!192191))

(declare-fun m!192193 () Bool)

(assert (=> d!41060 m!192193))

(declare-fun m!192195 () Bool)

(assert (=> d!41060 m!192195))

(declare-fun m!192197 () Bool)

(assert (=> b!126636 m!192197))

(assert (=> b!126562 d!41060))

(assert (=> b!126565 d!41040))

(assert (=> b!126565 d!41042))

(declare-fun b!126700 () Bool)

(declare-fun res!105003 () Bool)

(declare-fun e!83516 () Bool)

(assert (=> b!126700 (=> (not res!105003) (not e!83516))))

(declare-fun lt!197993 () (_ BitVec 64))

(declare-fun lt!197998 () tuple2!10618)

(declare-fun lt!197995 () (_ BitVec 64))

(assert (=> b!126700 (= res!105003 (= (bitIndex!0 (size!2592 (buf!2974 (_2!5591 lt!197998))) (currentByte!5707 (_2!5591 lt!197998)) (currentBit!5702 (_2!5591 lt!197998))) (bvadd lt!197995 lt!197993)))))

(assert (=> b!126700 (or (not (= (bvand lt!197995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197993 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!197995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!197995 lt!197993) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!197994 () (_ BitVec 64))

(assert (=> b!126700 (= lt!197993 (bvmul lt!197994 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!126700 (or (= lt!197994 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!197994 #b0000000000000000000000000000000000000000000000000000000000001000) lt!197994)))))

(assert (=> b!126700 (= lt!197994 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!126700 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!126700 (= lt!197995 (bitIndex!0 (size!2592 (buf!2974 thiss!1614)) (currentByte!5707 thiss!1614) (currentBit!5702 thiss!1614)))))

(declare-fun b!126701 () Bool)

(declare-fun e!83514 () Bool)

(declare-fun lt!197991 () (_ BitVec 64))

(assert (=> b!126701 (= e!83514 (validate_offset_bits!1 ((_ sign_extend 32) (size!2592 (buf!2974 thiss!1614))) ((_ sign_extend 32) (currentByte!5707 thiss!1614)) ((_ sign_extend 32) (currentBit!5702 thiss!1614)) lt!197991))))

(declare-fun d!41082 () Bool)

(assert (=> d!41082 e!83516))

(declare-fun res!105000 () Bool)

(assert (=> d!41082 (=> (not res!105000) (not e!83516))))

(assert (=> d!41082 (= res!105000 (= (size!2592 (buf!2974 thiss!1614)) (size!2592 (buf!2974 (_2!5591 lt!197998)))))))

(declare-fun choose!64 (BitStream!4508 array!5727 (_ BitVec 32) (_ BitVec 32)) tuple2!10618)

(assert (=> d!41082 (= lt!197998 (choose!64 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!41082 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2592 arr!227)))))

(assert (=> d!41082 (= (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1) lt!197998)))

(declare-fun b!126702 () Bool)

(declare-fun e!83515 () Bool)

(declare-fun lt!197992 () tuple2!10622)

(assert (=> b!126702 (= e!83515 (arrayRangesEq!79 arr!227 (_2!5593 lt!197992) #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126703 () Bool)

(declare-fun res!105001 () Bool)

(assert (=> b!126703 (=> (not res!105001) (not e!83516))))

(assert (=> b!126703 (= res!105001 (isPrefixOf!0 thiss!1614 (_2!5591 lt!197998)))))

(declare-fun b!126704 () Bool)

(assert (=> b!126704 (= e!83516 e!83515)))

(declare-fun res!105004 () Bool)

(assert (=> b!126704 (=> (not res!105004) (not e!83515))))

(declare-fun lt!197990 () tuple2!10620)

(assert (=> b!126704 (= res!105004 (and (= (size!2592 (_2!5593 lt!197992)) (size!2592 arr!227)) (= (_1!5593 lt!197992) (_2!5592 lt!197990))))))

(assert (=> b!126704 (= lt!197992 (readByteArrayLoopPure!0 (_1!5592 lt!197990) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!197997 () Unit!7787)

(declare-fun lt!197996 () Unit!7787)

(assert (=> b!126704 (= lt!197997 lt!197996)))

(assert (=> b!126704 (validate_offset_bits!1 ((_ sign_extend 32) (size!2592 (buf!2974 (_2!5591 lt!197998)))) ((_ sign_extend 32) (currentByte!5707 thiss!1614)) ((_ sign_extend 32) (currentBit!5702 thiss!1614)) lt!197991)))

(assert (=> b!126704 (= lt!197996 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2974 (_2!5591 lt!197998)) lt!197991))))

(assert (=> b!126704 e!83514))

(declare-fun res!105002 () Bool)

(assert (=> b!126704 (=> (not res!105002) (not e!83514))))

(assert (=> b!126704 (= res!105002 (and (= (size!2592 (buf!2974 thiss!1614)) (size!2592 (buf!2974 (_2!5591 lt!197998)))) (bvsge lt!197991 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126704 (= lt!197991 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!126704 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!126704 (= lt!197990 (reader!0 thiss!1614 (_2!5591 lt!197998)))))

(assert (= (and d!41082 res!105000) b!126700))

(assert (= (and b!126700 res!105003) b!126703))

(assert (= (and b!126703 res!105001) b!126704))

(assert (= (and b!126704 res!105002) b!126701))

(assert (= (and b!126704 res!105004) b!126702))

(declare-fun m!192275 () Bool)

(assert (=> b!126703 m!192275))

(declare-fun m!192277 () Bool)

(assert (=> b!126700 m!192277))

(assert (=> b!126700 m!192085))

(declare-fun m!192279 () Bool)

(assert (=> d!41082 m!192279))

(declare-fun m!192281 () Bool)

(assert (=> b!126704 m!192281))

(declare-fun m!192283 () Bool)

(assert (=> b!126704 m!192283))

(declare-fun m!192285 () Bool)

(assert (=> b!126704 m!192285))

(declare-fun m!192287 () Bool)

(assert (=> b!126704 m!192287))

(declare-fun m!192289 () Bool)

(assert (=> b!126702 m!192289))

(declare-fun m!192291 () Bool)

(assert (=> b!126701 m!192291))

(assert (=> b!126565 d!41082))

(declare-fun d!41110 () Bool)

(assert (=> d!41110 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2592 (buf!2974 (_1!5592 lt!197667)))) ((_ sign_extend 32) (currentByte!5707 (_1!5592 lt!197667))) ((_ sign_extend 32) (currentBit!5702 (_1!5592 lt!197667))) noOfBytes!1) (bvsle ((_ sign_extend 32) noOfBytes!1) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2592 (buf!2974 (_1!5592 lt!197667)))) ((_ sign_extend 32) (currentByte!5707 (_1!5592 lt!197667))) ((_ sign_extend 32) (currentBit!5702 (_1!5592 lt!197667)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!9963 () Bool)

(assert (= bs!9963 d!41110))

(declare-fun m!192293 () Bool)

(assert (=> bs!9963 m!192293))

(assert (=> b!126560 d!41110))

(declare-fun d!41112 () Bool)

(assert (=> d!41112 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2592 (buf!2974 (_2!5591 lt!197669)))) ((_ sign_extend 32) (currentByte!5707 thiss!1614)) ((_ sign_extend 32) (currentBit!5702 thiss!1614)) ((_ sign_extend 32) noOfBytes!1)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2592 (buf!2974 (_2!5591 lt!197669)))) ((_ sign_extend 32) (currentByte!5707 thiss!1614)) ((_ sign_extend 32) (currentBit!5702 thiss!1614))) ((_ sign_extend 32) noOfBytes!1)))))

(declare-fun bs!9964 () Bool)

(assert (= bs!9964 d!41112))

(assert (=> bs!9964 m!192119))

(assert (=> b!126560 d!41112))

(declare-fun d!41114 () Bool)

(assert (=> d!41114 (validate_offset_bits!1 ((_ sign_extend 32) (size!2592 (buf!2974 (_2!5591 lt!197669)))) ((_ sign_extend 32) (currentByte!5707 thiss!1614)) ((_ sign_extend 32) (currentBit!5702 thiss!1614)) ((_ sign_extend 32) noOfBytes!1))))

(declare-fun lt!197999 () Unit!7787)

(assert (=> d!41114 (= lt!197999 (choose!9 thiss!1614 (buf!2974 (_2!5591 lt!197669)) ((_ sign_extend 32) noOfBytes!1) (BitStream!4509 (buf!2974 (_2!5591 lt!197669)) (currentByte!5707 thiss!1614) (currentBit!5702 thiss!1614))))))

(assert (=> d!41114 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2974 (_2!5591 lt!197669)) ((_ sign_extend 32) noOfBytes!1)) lt!197999)))

(declare-fun bs!9965 () Bool)

(assert (= bs!9965 d!41114))

(assert (=> bs!9965 m!192093))

(declare-fun m!192295 () Bool)

(assert (=> bs!9965 m!192295))

(assert (=> b!126560 d!41114))

(assert (=> b!126560 d!41060))

(declare-fun d!41116 () Bool)

(assert (=> d!41116 (= (array_inv!2381 arr!227) (bvsge (size!2592 arr!227) #b00000000000000000000000000000000))))

(assert (=> start!24976 d!41116))

(declare-fun d!41118 () Bool)

(assert (=> d!41118 (= (inv!12 thiss!1614) (invariant!0 (currentBit!5702 thiss!1614) (currentByte!5707 thiss!1614) (size!2592 (buf!2974 thiss!1614))))))

(declare-fun bs!9966 () Bool)

(assert (= bs!9966 d!41118))

(assert (=> bs!9966 m!192111))

(assert (=> start!24976 d!41118))

(declare-fun d!41120 () Bool)

(assert (=> d!41120 (= (array_inv!2381 (buf!2974 thiss!1614)) (bvsge (size!2592 (buf!2974 thiss!1614)) #b00000000000000000000000000000000))))

(assert (=> b!126566 d!41120))

(declare-fun d!41122 () Bool)

(declare-fun res!105009 () Bool)

(declare-fun e!83521 () Bool)

(assert (=> d!41122 (=> res!105009 e!83521)))

(assert (=> d!41122 (= res!105009 (= #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!41122 (= (arrayRangesEq!79 arr!227 (_2!5593 lt!197668) #b00000000000000000000000000000000 noOfBytes!1) e!83521)))

(declare-fun b!126709 () Bool)

(declare-fun e!83522 () Bool)

(assert (=> b!126709 (= e!83521 e!83522)))

(declare-fun res!105010 () Bool)

(assert (=> b!126709 (=> (not res!105010) (not e!83522))))

(assert (=> b!126709 (= res!105010 (= (select (arr!3197 arr!227) #b00000000000000000000000000000000) (select (arr!3197 (_2!5593 lt!197668)) #b00000000000000000000000000000000)))))

(declare-fun b!126710 () Bool)

(assert (=> b!126710 (= e!83522 (arrayRangesEq!79 arr!227 (_2!5593 lt!197668) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) noOfBytes!1))))

(assert (= (and d!41122 (not res!105009)) b!126709))

(assert (= (and b!126709 res!105010) b!126710))

(declare-fun m!192297 () Bool)

(assert (=> b!126709 m!192297))

(declare-fun m!192299 () Bool)

(assert (=> b!126709 m!192299))

(declare-fun m!192301 () Bool)

(assert (=> b!126710 m!192301))

(assert (=> b!126564 d!41122))

(assert (=> b!126559 d!41046))

(push 1)

(assert (not d!41114))

(assert (not b!126637))

(assert (not b!126701))

(assert (not d!41052))

(assert (not b!126704))

(assert (not d!41040))

(assert (not d!41118))

(assert (not b!126703))

(assert (not d!41048))

(assert (not d!41060))

(assert (not b!126639))

(assert (not b!126702))

(assert (not d!41082))

(assert (not d!41110))

(assert (not b!126581))

(assert (not b!126583))

(assert (not d!41112))

(assert (not b!126636))

(assert (not d!41056))

(assert (not b!126710))

(assert (not d!41038))

(assert (not d!41042))

(assert (not b!126700))

(assert (not b!126635))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

