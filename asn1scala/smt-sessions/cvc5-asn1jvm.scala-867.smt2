; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25056 () Bool)

(assert start!25056)

(declare-fun b!126906 () Bool)

(declare-fun e!83694 () Bool)

(assert (=> b!126906 (= e!83694 true)))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5744 0))(
  ( (array!5745 (arr!3210 (Array (_ BitVec 32) (_ BitVec 8))) (size!2599 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4522 0))(
  ( (BitStream!4523 (buf!2984 array!5744) (currentByte!5723 (_ BitVec 32)) (currentBit!5718 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10660 0))(
  ( (tuple2!10661 (_1!5615 BitStream!4522) (_2!5615 BitStream!4522)) )
))
(declare-fun lt!198187 () tuple2!10660)

(declare-datatypes ((tuple2!10662 0))(
  ( (tuple2!10663 (_1!5616 BitStream!4522) (_2!5616 array!5744)) )
))
(declare-fun lt!198188 () tuple2!10662)

(declare-fun arr!227 () array!5744)

(declare-fun readByteArrayLoopPure!0 (BitStream!4522 array!5744 (_ BitVec 32) (_ BitVec 32)) tuple2!10662)

(assert (=> b!126906 (= lt!198188 (readByteArrayLoopPure!0 (_1!5615 lt!198187) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-datatypes ((Unit!7804 0))(
  ( (Unit!7805) )
))
(declare-datatypes ((tuple2!10664 0))(
  ( (tuple2!10665 (_1!5617 Unit!7804) (_2!5617 BitStream!4522)) )
))
(declare-fun lt!198193 () tuple2!10664)

(declare-fun thiss!1614 () BitStream!4522)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126906 (validate_offset_bits!1 ((_ sign_extend 32) (size!2599 (buf!2984 (_2!5617 lt!198193)))) ((_ sign_extend 32) (currentByte!5723 thiss!1614)) ((_ sign_extend 32) (currentBit!5718 thiss!1614)) ((_ sign_extend 32) noOfBytes!1))))

(declare-fun lt!198191 () Unit!7804)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4522 array!5744 (_ BitVec 64)) Unit!7804)

(assert (=> b!126906 (= lt!198191 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2984 (_2!5617 lt!198193)) ((_ sign_extend 32) noOfBytes!1)))))

(declare-fun reader!0 (BitStream!4522 BitStream!4522) tuple2!10660)

(assert (=> b!126906 (= lt!198187 (reader!0 thiss!1614 (_2!5617 lt!198193)))))

(declare-fun b!126907 () Bool)

(declare-fun e!83697 () Bool)

(declare-fun e!83698 () Bool)

(assert (=> b!126907 (= e!83697 (not e!83698))))

(declare-fun res!105189 () Bool)

(assert (=> b!126907 (=> res!105189 e!83698)))

(declare-fun lt!198192 () tuple2!10662)

(declare-fun lt!198189 () tuple2!10660)

(assert (=> b!126907 (= res!105189 (or (not (= (size!2599 (_2!5616 lt!198192)) (size!2599 arr!227))) (not (= (_1!5616 lt!198192) (_2!5615 lt!198189)))))))

(assert (=> b!126907 (= lt!198192 (readByteArrayLoopPure!0 (_1!5615 lt!198189) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!198194 () (_ BitVec 64))

(assert (=> b!126907 (validate_offset_bits!1 ((_ sign_extend 32) (size!2599 (buf!2984 (_2!5617 lt!198193)))) ((_ sign_extend 32) (currentByte!5723 thiss!1614)) ((_ sign_extend 32) (currentBit!5718 thiss!1614)) lt!198194)))

(declare-fun lt!198190 () Unit!7804)

(assert (=> b!126907 (= lt!198190 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2984 (_2!5617 lt!198193)) lt!198194))))

(assert (=> b!126907 (= lt!198189 (reader!0 thiss!1614 (_2!5617 lt!198193)))))

(declare-fun b!126908 () Bool)

(declare-fun e!83695 () Bool)

(declare-fun array_inv!2388 (array!5744) Bool)

(assert (=> b!126908 (= e!83695 (array_inv!2388 (buf!2984 thiss!1614)))))

(declare-fun b!126909 () Bool)

(declare-fun res!105193 () Bool)

(assert (=> b!126909 (=> (not res!105193) (not e!83697))))

(declare-fun isPrefixOf!0 (BitStream!4522 BitStream!4522) Bool)

(assert (=> b!126909 (= res!105193 (isPrefixOf!0 thiss!1614 (_2!5617 lt!198193)))))

(declare-fun b!126911 () Bool)

(declare-fun e!83696 () Bool)

(assert (=> b!126911 (= e!83696 (not e!83694))))

(declare-fun res!105190 () Bool)

(assert (=> b!126911 (=> res!105190 e!83694)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126911 (= res!105190 (not (= (bitIndex!0 (size!2599 (buf!2984 (_2!5617 lt!198193))) (currentByte!5723 (_2!5617 lt!198193)) (currentBit!5718 (_2!5617 lt!198193))) (bvadd (bitIndex!0 (size!2599 (buf!2984 thiss!1614)) (currentByte!5723 thiss!1614) (currentBit!5718 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun e!83692 () Bool)

(assert (=> b!126911 e!83692))

(declare-fun res!105191 () Bool)

(assert (=> b!126911 (=> (not res!105191) (not e!83692))))

(assert (=> b!126911 (= res!105191 (= (size!2599 (buf!2984 thiss!1614)) (size!2599 (buf!2984 (_2!5617 lt!198193)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4522 array!5744 (_ BitVec 32) (_ BitVec 32)) tuple2!10664)

(assert (=> b!126911 (= lt!198193 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126912 () Bool)

(declare-fun res!105186 () Bool)

(assert (=> b!126912 (=> res!105186 e!83694)))

(assert (=> b!126912 (= res!105186 (not (isPrefixOf!0 thiss!1614 (_2!5617 lt!198193))))))

(declare-fun res!105187 () Bool)

(assert (=> start!25056 (=> (not res!105187) (not e!83696))))

(assert (=> start!25056 (= res!105187 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2599 arr!227))))))

(assert (=> start!25056 e!83696))

(assert (=> start!25056 true))

(assert (=> start!25056 (array_inv!2388 arr!227)))

(declare-fun inv!12 (BitStream!4522) Bool)

(assert (=> start!25056 (and (inv!12 thiss!1614) e!83695)))

(declare-fun b!126910 () Bool)

(declare-fun res!105188 () Bool)

(assert (=> b!126910 (=> (not res!105188) (not e!83696))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126910 (= res!105188 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2599 (buf!2984 thiss!1614))) ((_ sign_extend 32) (currentByte!5723 thiss!1614)) ((_ sign_extend 32) (currentBit!5718 thiss!1614)) noOfBytes!1))))

(declare-fun b!126913 () Bool)

(assert (=> b!126913 (= e!83692 e!83697)))

(declare-fun res!105192 () Bool)

(assert (=> b!126913 (=> (not res!105192) (not e!83697))))

(assert (=> b!126913 (= res!105192 (= (bitIndex!0 (size!2599 (buf!2984 (_2!5617 lt!198193))) (currentByte!5723 (_2!5617 lt!198193)) (currentBit!5718 (_2!5617 lt!198193))) (bvadd (bitIndex!0 (size!2599 (buf!2984 thiss!1614)) (currentByte!5723 thiss!1614) (currentBit!5718 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198194))))))

(assert (=> b!126913 (= lt!198194 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!126914 () Bool)

(declare-fun arrayRangesEq!86 (array!5744 array!5744 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126914 (= e!83698 (not (arrayRangesEq!86 arr!227 (_2!5616 lt!198192) #b00000000000000000000000000000000 noOfBytes!1)))))

(assert (= (and start!25056 res!105187) b!126910))

(assert (= (and b!126910 res!105188) b!126911))

(assert (= (and b!126911 res!105191) b!126913))

(assert (= (and b!126913 res!105192) b!126909))

(assert (= (and b!126909 res!105193) b!126907))

(assert (= (and b!126907 (not res!105189)) b!126914))

(assert (= (and b!126911 (not res!105190)) b!126912))

(assert (= (and b!126912 (not res!105186)) b!126906))

(assert (= start!25056 b!126908))

(declare-fun m!192513 () Bool)

(assert (=> b!126911 m!192513))

(declare-fun m!192515 () Bool)

(assert (=> b!126911 m!192515))

(declare-fun m!192517 () Bool)

(assert (=> b!126911 m!192517))

(declare-fun m!192519 () Bool)

(assert (=> b!126908 m!192519))

(declare-fun m!192521 () Bool)

(assert (=> start!25056 m!192521))

(declare-fun m!192523 () Bool)

(assert (=> start!25056 m!192523))

(assert (=> b!126913 m!192513))

(assert (=> b!126913 m!192515))

(declare-fun m!192525 () Bool)

(assert (=> b!126912 m!192525))

(declare-fun m!192527 () Bool)

(assert (=> b!126914 m!192527))

(declare-fun m!192529 () Bool)

(assert (=> b!126907 m!192529))

(declare-fun m!192531 () Bool)

(assert (=> b!126907 m!192531))

(declare-fun m!192533 () Bool)

(assert (=> b!126907 m!192533))

(declare-fun m!192535 () Bool)

(assert (=> b!126907 m!192535))

(assert (=> b!126909 m!192525))

(declare-fun m!192537 () Bool)

(assert (=> b!126906 m!192537))

(declare-fun m!192539 () Bool)

(assert (=> b!126906 m!192539))

(declare-fun m!192541 () Bool)

(assert (=> b!126906 m!192541))

(assert (=> b!126906 m!192535))

(declare-fun m!192543 () Bool)

(assert (=> b!126910 m!192543))

(push 1)

(assert (not b!126910))

(assert (not b!126908))

(assert (not b!126906))

(assert (not b!126914))

(assert (not b!126909))

(assert (not b!126907))

(assert (not b!126912))

(assert (not b!126913))

(assert (not b!126911))

(assert (not start!25056))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

