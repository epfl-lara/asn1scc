; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25164 () Bool)

(assert start!25164)

(declare-fun b!127553 () Bool)

(declare-fun e!84248 () Bool)

(declare-fun e!84250 () Bool)

(assert (=> b!127553 (= e!84248 (not e!84250))))

(declare-fun res!105758 () Bool)

(assert (=> b!127553 (=> res!105758 e!84250)))

(declare-datatypes ((array!5789 0))(
  ( (array!5790 (arr!3237 (Array (_ BitVec 32) (_ BitVec 8))) (size!2620 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4564 0))(
  ( (BitStream!4565 (buf!3008 array!5789) (currentByte!5753 (_ BitVec 32)) (currentBit!5748 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10768 0))(
  ( (tuple2!10769 (_1!5672 BitStream!4564) (_2!5672 BitStream!4564)) )
))
(declare-fun lt!198905 () tuple2!10768)

(declare-fun arr!227 () array!5789)

(declare-datatypes ((tuple2!10770 0))(
  ( (tuple2!10771 (_1!5673 BitStream!4564) (_2!5673 array!5789)) )
))
(declare-fun lt!198901 () tuple2!10770)

(assert (=> b!127553 (= res!105758 (or (not (= (size!2620 (_2!5673 lt!198901)) (size!2620 arr!227))) (not (= (_1!5673 lt!198901) (_2!5672 lt!198905)))))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4564 array!5789 (_ BitVec 32) (_ BitVec 32)) tuple2!10770)

(assert (=> b!127553 (= lt!198901 (readByteArrayLoopPure!0 (_1!5672 lt!198905) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-datatypes ((Unit!7843 0))(
  ( (Unit!7844) )
))
(declare-datatypes ((tuple2!10772 0))(
  ( (tuple2!10773 (_1!5674 Unit!7843) (_2!5674 BitStream!4564)) )
))
(declare-fun lt!198902 () tuple2!10772)

(declare-fun thiss!1614 () BitStream!4564)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!127553 (validate_offset_bits!1 ((_ sign_extend 32) (size!2620 (buf!3008 (_2!5674 lt!198902)))) ((_ sign_extend 32) (currentByte!5753 thiss!1614)) ((_ sign_extend 32) (currentBit!5748 thiss!1614)) ((_ sign_extend 32) noOfBytes!1))))

(declare-fun lt!198903 () Unit!7843)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4564 array!5789 (_ BitVec 64)) Unit!7843)

(assert (=> b!127553 (= lt!198903 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!3008 (_2!5674 lt!198902)) ((_ sign_extend 32) noOfBytes!1)))))

(declare-fun reader!0 (BitStream!4564 BitStream!4564) tuple2!10768)

(assert (=> b!127553 (= lt!198905 (reader!0 thiss!1614 (_2!5674 lt!198902)))))

(declare-fun lt!198898 () tuple2!10770)

(declare-fun b!127554 () Bool)

(declare-fun e!84252 () Bool)

(declare-fun arrayRangesEq!104 (array!5789 array!5789 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127554 (= e!84252 (not (arrayRangesEq!104 arr!227 (_2!5673 lt!198898) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!127555 () Bool)

(declare-fun res!105753 () Bool)

(declare-fun e!84254 () Bool)

(assert (=> b!127555 (=> (not res!105753) (not e!84254))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127555 (= res!105753 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2620 (buf!3008 thiss!1614))) ((_ sign_extend 32) (currentByte!5753 thiss!1614)) ((_ sign_extend 32) (currentBit!5748 thiss!1614)) noOfBytes!1))))

(declare-fun b!127556 () Bool)

(declare-fun res!105760 () Bool)

(assert (=> b!127556 (=> (not res!105760) (not e!84248))))

(declare-fun isPrefixOf!0 (BitStream!4564 BitStream!4564) Bool)

(assert (=> b!127556 (= res!105760 (isPrefixOf!0 thiss!1614 (_2!5674 lt!198902)))))

(declare-fun b!127557 () Bool)

(assert (=> b!127557 (= e!84250 (not (arrayRangesEq!104 arr!227 (_2!5673 lt!198901) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!127558 () Bool)

(declare-fun e!84246 () Bool)

(declare-fun array_inv!2409 (array!5789) Bool)

(assert (=> b!127558 (= e!84246 (array_inv!2409 (buf!3008 thiss!1614)))))

(declare-fun b!127559 () Bool)

(declare-fun e!84253 () Bool)

(declare-fun e!84247 () Bool)

(assert (=> b!127559 (= e!84253 e!84247)))

(declare-fun res!105759 () Bool)

(assert (=> b!127559 (=> (not res!105759) (not e!84247))))

(declare-fun lt!198904 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!127559 (= res!105759 (= (bitIndex!0 (size!2620 (buf!3008 (_2!5674 lt!198902))) (currentByte!5753 (_2!5674 lt!198902)) (currentBit!5748 (_2!5674 lt!198902))) (bvadd (bitIndex!0 (size!2620 (buf!3008 thiss!1614)) (currentByte!5753 thiss!1614) (currentBit!5748 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198904))))))

(assert (=> b!127559 (= lt!198904 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun res!105757 () Bool)

(assert (=> start!25164 (=> (not res!105757) (not e!84254))))

(assert (=> start!25164 (= res!105757 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2620 arr!227))))))

(assert (=> start!25164 e!84254))

(assert (=> start!25164 true))

(assert (=> start!25164 (array_inv!2409 arr!227)))

(declare-fun inv!12 (BitStream!4564) Bool)

(assert (=> start!25164 (and (inv!12 thiss!1614) e!84246)))

(declare-fun b!127560 () Bool)

(declare-fun res!105755 () Bool)

(assert (=> b!127560 (=> (not res!105755) (not e!84247))))

(assert (=> b!127560 (= res!105755 (isPrefixOf!0 thiss!1614 (_2!5674 lt!198902)))))

(declare-fun b!127561 () Bool)

(assert (=> b!127561 (= e!84247 (not e!84252))))

(declare-fun res!105752 () Bool)

(assert (=> b!127561 (=> res!105752 e!84252)))

(declare-fun lt!198899 () tuple2!10768)

(assert (=> b!127561 (= res!105752 (or (not (= (size!2620 (_2!5673 lt!198898)) (size!2620 arr!227))) (not (= (_1!5673 lt!198898) (_2!5672 lt!198899)))))))

(assert (=> b!127561 (= lt!198898 (readByteArrayLoopPure!0 (_1!5672 lt!198899) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> b!127561 (validate_offset_bits!1 ((_ sign_extend 32) (size!2620 (buf!3008 (_2!5674 lt!198902)))) ((_ sign_extend 32) (currentByte!5753 thiss!1614)) ((_ sign_extend 32) (currentBit!5748 thiss!1614)) lt!198904)))

(declare-fun lt!198900 () Unit!7843)

(assert (=> b!127561 (= lt!198900 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!3008 (_2!5674 lt!198902)) lt!198904))))

(assert (=> b!127561 (= lt!198899 (reader!0 thiss!1614 (_2!5674 lt!198902)))))

(declare-fun b!127562 () Bool)

(assert (=> b!127562 (= e!84254 (not e!84248))))

(declare-fun res!105754 () Bool)

(assert (=> b!127562 (=> (not res!105754) (not e!84248))))

(assert (=> b!127562 (= res!105754 (= (bitIndex!0 (size!2620 (buf!3008 (_2!5674 lt!198902))) (currentByte!5753 (_2!5674 lt!198902)) (currentBit!5748 (_2!5674 lt!198902))) (bvadd (bitIndex!0 (size!2620 (buf!3008 thiss!1614)) (currentByte!5753 thiss!1614) (currentBit!5748 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1)))))))

(assert (=> b!127562 e!84253))

(declare-fun res!105756 () Bool)

(assert (=> b!127562 (=> (not res!105756) (not e!84253))))

(assert (=> b!127562 (= res!105756 (= (size!2620 (buf!3008 thiss!1614)) (size!2620 (buf!3008 (_2!5674 lt!198902)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4564 array!5789 (_ BitVec 32) (_ BitVec 32)) tuple2!10772)

(assert (=> b!127562 (= lt!198902 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (= (and start!25164 res!105757) b!127555))

(assert (= (and b!127555 res!105753) b!127562))

(assert (= (and b!127562 res!105756) b!127559))

(assert (= (and b!127559 res!105759) b!127560))

(assert (= (and b!127560 res!105755) b!127561))

(assert (= (and b!127561 (not res!105752)) b!127554))

(assert (= (and b!127562 res!105754) b!127556))

(assert (= (and b!127556 res!105760) b!127553))

(assert (= (and b!127553 (not res!105758)) b!127557))

(assert (= start!25164 b!127558))

(declare-fun m!193239 () Bool)

(assert (=> b!127555 m!193239))

(declare-fun m!193241 () Bool)

(assert (=> b!127553 m!193241))

(declare-fun m!193243 () Bool)

(assert (=> b!127553 m!193243))

(declare-fun m!193245 () Bool)

(assert (=> b!127553 m!193245))

(declare-fun m!193247 () Bool)

(assert (=> b!127553 m!193247))

(declare-fun m!193249 () Bool)

(assert (=> b!127560 m!193249))

(declare-fun m!193251 () Bool)

(assert (=> b!127557 m!193251))

(declare-fun m!193253 () Bool)

(assert (=> b!127561 m!193253))

(declare-fun m!193255 () Bool)

(assert (=> b!127561 m!193255))

(declare-fun m!193257 () Bool)

(assert (=> b!127561 m!193257))

(assert (=> b!127561 m!193247))

(declare-fun m!193259 () Bool)

(assert (=> start!25164 m!193259))

(declare-fun m!193261 () Bool)

(assert (=> start!25164 m!193261))

(assert (=> b!127556 m!193249))

(declare-fun m!193263 () Bool)

(assert (=> b!127562 m!193263))

(declare-fun m!193265 () Bool)

(assert (=> b!127562 m!193265))

(declare-fun m!193267 () Bool)

(assert (=> b!127562 m!193267))

(declare-fun m!193269 () Bool)

(assert (=> b!127554 m!193269))

(assert (=> b!127559 m!193263))

(assert (=> b!127559 m!193265))

(declare-fun m!193271 () Bool)

(assert (=> b!127558 m!193271))

(push 1)

(assert (not b!127553))

(assert (not b!127556))

(assert (not b!127554))

(assert (not b!127559))

(assert (not b!127557))

(assert (not b!127561))

(assert (not b!127562))

(assert (not b!127555))

(assert (not b!127560))

(assert (not b!127558))

(assert (not start!25164))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

