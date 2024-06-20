; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24964 () Bool)

(assert start!24964)

(declare-fun b!126396 () Bool)

(declare-fun res!104737 () Bool)

(declare-fun e!83287 () Bool)

(assert (=> b!126396 (=> res!104737 e!83287)))

(declare-datatypes ((array!5715 0))(
  ( (array!5716 (arr!3191 (Array (_ BitVec 32) (_ BitVec 8))) (size!2586 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4496 0))(
  ( (BitStream!4497 (buf!2968 array!5715) (currentByte!5701 (_ BitVec 32)) (currentBit!5696 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4496)

(declare-datatypes ((Unit!7775 0))(
  ( (Unit!7776) )
))
(declare-datatypes ((tuple2!10582 0))(
  ( (tuple2!10583 (_1!5573 Unit!7775) (_2!5573 BitStream!4496)) )
))
(declare-fun lt!197544 () tuple2!10582)

(declare-fun isPrefixOf!0 (BitStream!4496 BitStream!4496) Bool)

(assert (=> b!126396 (= res!104737 (not (isPrefixOf!0 thiss!1614 (_2!5573 lt!197544))))))

(declare-fun b!126397 () Bool)

(declare-fun res!104738 () Bool)

(declare-fun e!83289 () Bool)

(assert (=> b!126397 (=> (not res!104738) (not e!83289))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126397 (= res!104738 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2586 (buf!2968 thiss!1614))) ((_ sign_extend 32) (currentByte!5701 thiss!1614)) ((_ sign_extend 32) (currentBit!5696 thiss!1614)) noOfBytes!1))))

(declare-fun b!126398 () Bool)

(assert (=> b!126398 (= e!83289 (not e!83287))))

(declare-fun res!104740 () Bool)

(assert (=> b!126398 (=> res!104740 e!83287)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126398 (= res!104740 (not (= (bitIndex!0 (size!2586 (buf!2968 (_2!5573 lt!197544))) (currentByte!5701 (_2!5573 lt!197544)) (currentBit!5696 (_2!5573 lt!197544))) (bvadd (bitIndex!0 (size!2586 (buf!2968 thiss!1614)) (currentByte!5701 thiss!1614) (currentBit!5696 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun e!83288 () Bool)

(assert (=> b!126398 e!83288))

(declare-fun res!104733 () Bool)

(assert (=> b!126398 (=> (not res!104733) (not e!83288))))

(assert (=> b!126398 (= res!104733 (= (size!2586 (buf!2968 thiss!1614)) (size!2586 (buf!2968 (_2!5573 lt!197544)))))))

(declare-fun arr!227 () array!5715)

(declare-fun appendByteArrayLoop!0 (BitStream!4496 array!5715 (_ BitVec 32) (_ BitVec 32)) tuple2!10582)

(assert (=> b!126398 (= lt!197544 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126399 () Bool)

(assert (=> b!126399 (= e!83287 true)))

(declare-datatypes ((tuple2!10584 0))(
  ( (tuple2!10585 (_1!5574 BitStream!4496) (_2!5574 BitStream!4496)) )
))
(declare-fun lt!197543 () tuple2!10584)

(declare-fun reader!0 (BitStream!4496 BitStream!4496) tuple2!10584)

(assert (=> b!126399 (= lt!197543 (reader!0 thiss!1614 (_2!5573 lt!197544)))))

(declare-fun res!104735 () Bool)

(assert (=> start!24964 (=> (not res!104735) (not e!83289))))

(assert (=> start!24964 (= res!104735 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2586 arr!227))))))

(assert (=> start!24964 e!83289))

(assert (=> start!24964 true))

(declare-fun array_inv!2375 (array!5715) Bool)

(assert (=> start!24964 (array_inv!2375 arr!227)))

(declare-fun e!83294 () Bool)

(declare-fun inv!12 (BitStream!4496) Bool)

(assert (=> start!24964 (and (inv!12 thiss!1614) e!83294)))

(declare-fun b!126400 () Bool)

(declare-fun e!83293 () Bool)

(declare-fun e!83290 () Bool)

(assert (=> b!126400 (= e!83293 (not e!83290))))

(declare-fun res!104736 () Bool)

(assert (=> b!126400 (=> res!104736 e!83290)))

(declare-fun lt!197546 () tuple2!10584)

(declare-datatypes ((tuple2!10586 0))(
  ( (tuple2!10587 (_1!5575 BitStream!4496) (_2!5575 array!5715)) )
))
(declare-fun lt!197541 () tuple2!10586)

(assert (=> b!126400 (= res!104736 (or (not (= (size!2586 (_2!5575 lt!197541)) (size!2586 arr!227))) (not (= (_1!5575 lt!197541) (_2!5574 lt!197546)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4496 array!5715 (_ BitVec 32) (_ BitVec 32)) tuple2!10586)

(assert (=> b!126400 (= lt!197541 (readByteArrayLoopPure!0 (_1!5574 lt!197546) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!197545 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126400 (validate_offset_bits!1 ((_ sign_extend 32) (size!2586 (buf!2968 (_2!5573 lt!197544)))) ((_ sign_extend 32) (currentByte!5701 thiss!1614)) ((_ sign_extend 32) (currentBit!5696 thiss!1614)) lt!197545)))

(declare-fun lt!197542 () Unit!7775)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4496 array!5715 (_ BitVec 64)) Unit!7775)

(assert (=> b!126400 (= lt!197542 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2968 (_2!5573 lt!197544)) lt!197545))))

(assert (=> b!126400 (= lt!197546 (reader!0 thiss!1614 (_2!5573 lt!197544)))))

(declare-fun b!126401 () Bool)

(declare-fun res!104739 () Bool)

(assert (=> b!126401 (=> (not res!104739) (not e!83293))))

(assert (=> b!126401 (= res!104739 (isPrefixOf!0 thiss!1614 (_2!5573 lt!197544)))))

(declare-fun b!126402 () Bool)

(declare-fun arrayRangesEq!73 (array!5715 array!5715 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126402 (= e!83290 (not (arrayRangesEq!73 arr!227 (_2!5575 lt!197541) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!126403 () Bool)

(assert (=> b!126403 (= e!83294 (array_inv!2375 (buf!2968 thiss!1614)))))

(declare-fun b!126404 () Bool)

(assert (=> b!126404 (= e!83288 e!83293)))

(declare-fun res!104734 () Bool)

(assert (=> b!126404 (=> (not res!104734) (not e!83293))))

(assert (=> b!126404 (= res!104734 (= (bitIndex!0 (size!2586 (buf!2968 (_2!5573 lt!197544))) (currentByte!5701 (_2!5573 lt!197544)) (currentBit!5696 (_2!5573 lt!197544))) (bvadd (bitIndex!0 (size!2586 (buf!2968 thiss!1614)) (currentByte!5701 thiss!1614) (currentBit!5696 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!197545))))))

(assert (=> b!126404 (= lt!197545 ((_ sign_extend 32) noOfBytes!1))))

(assert (= (and start!24964 res!104735) b!126397))

(assert (= (and b!126397 res!104738) b!126398))

(assert (= (and b!126398 res!104733) b!126404))

(assert (= (and b!126404 res!104734) b!126401))

(assert (= (and b!126401 res!104739) b!126400))

(assert (= (and b!126400 (not res!104736)) b!126402))

(assert (= (and b!126398 (not res!104740)) b!126396))

(assert (= (and b!126396 (not res!104737)) b!126399))

(assert (= start!24964 b!126403))

(declare-fun m!191887 () Bool)

(assert (=> b!126404 m!191887))

(declare-fun m!191889 () Bool)

(assert (=> b!126404 m!191889))

(declare-fun m!191891 () Bool)

(assert (=> start!24964 m!191891))

(declare-fun m!191893 () Bool)

(assert (=> start!24964 m!191893))

(declare-fun m!191895 () Bool)

(assert (=> b!126401 m!191895))

(declare-fun m!191897 () Bool)

(assert (=> b!126403 m!191897))

(assert (=> b!126398 m!191887))

(assert (=> b!126398 m!191889))

(declare-fun m!191899 () Bool)

(assert (=> b!126398 m!191899))

(declare-fun m!191901 () Bool)

(assert (=> b!126399 m!191901))

(declare-fun m!191903 () Bool)

(assert (=> b!126397 m!191903))

(assert (=> b!126396 m!191895))

(declare-fun m!191905 () Bool)

(assert (=> b!126402 m!191905))

(declare-fun m!191907 () Bool)

(assert (=> b!126400 m!191907))

(declare-fun m!191909 () Bool)

(assert (=> b!126400 m!191909))

(declare-fun m!191911 () Bool)

(assert (=> b!126400 m!191911))

(assert (=> b!126400 m!191901))

(push 1)

(assert (not b!126404))

(assert (not start!24964))

(assert (not b!126401))

(assert (not b!126400))

(assert (not b!126403))

(assert (not b!126396))

(assert (not b!126397))

(assert (not b!126402))

(assert (not b!126399))

(assert (not b!126398))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

