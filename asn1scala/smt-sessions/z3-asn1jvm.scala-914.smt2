; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25668 () Bool)

(assert start!25668)

(declare-fun b!130795 () Bool)

(declare-fun res!108450 () Bool)

(declare-fun e!86693 () Bool)

(assert (=> b!130795 (=> (not res!108450) (not e!86693))))

(declare-datatypes ((array!6048 0))(
  ( (array!6049 (arr!3361 (Array (_ BitVec 32) (_ BitVec 8))) (size!2738 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4740 0))(
  ( (BitStream!4741 (buf!3099 array!6048) (currentByte!5872 (_ BitVec 32)) (currentBit!5867 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8090 0))(
  ( (Unit!8091) )
))
(declare-datatypes ((tuple2!11268 0))(
  ( (tuple2!11269 (_1!5934 Unit!8090) (_2!5934 BitStream!4740)) )
))
(declare-fun lt!201801 () tuple2!11268)

(declare-fun lt!201799 () tuple2!11268)

(declare-fun isPrefixOf!0 (BitStream!4740 BitStream!4740) Bool)

(assert (=> b!130795 (= res!108450 (isPrefixOf!0 (_2!5934 lt!201801) (_2!5934 lt!201799)))))

(declare-fun b!130796 () Bool)

(declare-fun e!86685 () Bool)

(assert (=> b!130796 (= e!86685 (not true))))

(declare-datatypes ((tuple2!11270 0))(
  ( (tuple2!11271 (_1!5935 BitStream!4740) (_2!5935 BitStream!4740)) )
))
(declare-fun lt!201797 () tuple2!11270)

(declare-fun arr!237 () array!6048)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!11272 0))(
  ( (tuple2!11273 (_1!5936 BitStream!4740) (_2!5936 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!4740) tuple2!11272)

(assert (=> b!130796 (= (_2!5936 (readBytePure!0 (_1!5935 lt!201797))) (select (arr!3361 arr!237) from!447))))

(declare-fun lt!201808 () tuple2!11270)

(declare-fun reader!0 (BitStream!4740 BitStream!4740) tuple2!11270)

(assert (=> b!130796 (= lt!201808 (reader!0 (_2!5934 lt!201801) (_2!5934 lt!201799)))))

(declare-fun thiss!1634 () BitStream!4740)

(assert (=> b!130796 (= lt!201797 (reader!0 thiss!1634 (_2!5934 lt!201799)))))

(declare-fun e!86690 () Bool)

(assert (=> b!130796 e!86690))

(declare-fun res!108451 () Bool)

(assert (=> b!130796 (=> (not res!108451) (not e!86690))))

(declare-fun lt!201810 () tuple2!11272)

(declare-fun lt!201807 () tuple2!11272)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!130796 (= res!108451 (= (bitIndex!0 (size!2738 (buf!3099 (_1!5936 lt!201810))) (currentByte!5872 (_1!5936 lt!201810)) (currentBit!5867 (_1!5936 lt!201810))) (bitIndex!0 (size!2738 (buf!3099 (_1!5936 lt!201807))) (currentByte!5872 (_1!5936 lt!201807)) (currentBit!5867 (_1!5936 lt!201807)))))))

(declare-fun lt!201798 () Unit!8090)

(declare-fun lt!201804 () BitStream!4740)

(declare-fun readBytePrefixLemma!0 (BitStream!4740 BitStream!4740) Unit!8090)

(assert (=> b!130796 (= lt!201798 (readBytePrefixLemma!0 lt!201804 (_2!5934 lt!201799)))))

(assert (=> b!130796 (= lt!201807 (readBytePure!0 (BitStream!4741 (buf!3099 (_2!5934 lt!201799)) (currentByte!5872 thiss!1634) (currentBit!5867 thiss!1634))))))

(assert (=> b!130796 (= lt!201810 (readBytePure!0 lt!201804))))

(assert (=> b!130796 (= lt!201804 (BitStream!4741 (buf!3099 (_2!5934 lt!201801)) (currentByte!5872 thiss!1634) (currentBit!5867 thiss!1634)))))

(declare-fun e!86688 () Bool)

(assert (=> b!130796 e!86688))

(declare-fun res!108460 () Bool)

(assert (=> b!130796 (=> (not res!108460) (not e!86688))))

(assert (=> b!130796 (= res!108460 (isPrefixOf!0 thiss!1634 (_2!5934 lt!201799)))))

(declare-fun lt!201811 () Unit!8090)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4740 BitStream!4740 BitStream!4740) Unit!8090)

(assert (=> b!130796 (= lt!201811 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5934 lt!201801) (_2!5934 lt!201799)))))

(declare-fun e!86686 () Bool)

(assert (=> b!130796 e!86686))

(declare-fun res!108452 () Bool)

(assert (=> b!130796 (=> (not res!108452) (not e!86686))))

(assert (=> b!130796 (= res!108452 (= (size!2738 (buf!3099 (_2!5934 lt!201801))) (size!2738 (buf!3099 (_2!5934 lt!201799)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun appendByteArrayLoop!0 (BitStream!4740 array!6048 (_ BitVec 32) (_ BitVec 32)) tuple2!11268)

(assert (=> b!130796 (= lt!201799 (appendByteArrayLoop!0 (_2!5934 lt!201801) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!130796 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2738 (buf!3099 (_2!5934 lt!201801)))) ((_ sign_extend 32) (currentByte!5872 (_2!5934 lt!201801))) ((_ sign_extend 32) (currentBit!5867 (_2!5934 lt!201801))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!201805 () Unit!8090)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4740 BitStream!4740 (_ BitVec 64) (_ BitVec 32)) Unit!8090)

(assert (=> b!130796 (= lt!201805 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5934 lt!201801) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!86687 () Bool)

(assert (=> b!130796 e!86687))

(declare-fun res!108454 () Bool)

(assert (=> b!130796 (=> (not res!108454) (not e!86687))))

(assert (=> b!130796 (= res!108454 (= (size!2738 (buf!3099 thiss!1634)) (size!2738 (buf!3099 (_2!5934 lt!201801)))))))

(declare-fun appendByte!0 (BitStream!4740 (_ BitVec 8)) tuple2!11268)

(assert (=> b!130796 (= lt!201801 (appendByte!0 thiss!1634 (select (arr!3361 arr!237) from!447)))))

(declare-fun b!130797 () Bool)

(declare-fun res!108457 () Bool)

(assert (=> b!130797 (=> (not res!108457) (not e!86685))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130797 (= res!108457 (invariant!0 (currentBit!5867 thiss!1634) (currentByte!5872 thiss!1634) (size!2738 (buf!3099 thiss!1634))))))

(declare-fun b!130798 () Bool)

(declare-fun res!108453 () Bool)

(assert (=> b!130798 (=> (not res!108453) (not e!86685))))

(assert (=> b!130798 (= res!108453 (bvslt from!447 to!404))))

(declare-fun b!130799 () Bool)

(declare-fun e!86689 () Bool)

(assert (=> b!130799 (= e!86693 (not e!86689))))

(declare-fun res!108449 () Bool)

(assert (=> b!130799 (=> res!108449 e!86689)))

(declare-datatypes ((tuple2!11274 0))(
  ( (tuple2!11275 (_1!5937 BitStream!4740) (_2!5937 array!6048)) )
))
(declare-fun lt!201809 () tuple2!11274)

(declare-fun lt!201800 () tuple2!11270)

(assert (=> b!130799 (= res!108449 (or (not (= (size!2738 (_2!5937 lt!201809)) (size!2738 arr!237))) (not (= (_1!5937 lt!201809) (_2!5935 lt!201800)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4740 array!6048 (_ BitVec 32) (_ BitVec 32)) tuple2!11274)

(assert (=> b!130799 (= lt!201809 (readByteArrayLoopPure!0 (_1!5935 lt!201800) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!201812 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130799 (validate_offset_bits!1 ((_ sign_extend 32) (size!2738 (buf!3099 (_2!5934 lt!201799)))) ((_ sign_extend 32) (currentByte!5872 (_2!5934 lt!201801))) ((_ sign_extend 32) (currentBit!5867 (_2!5934 lt!201801))) lt!201812)))

(declare-fun lt!201806 () Unit!8090)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4740 array!6048 (_ BitVec 64)) Unit!8090)

(assert (=> b!130799 (= lt!201806 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5934 lt!201801) (buf!3099 (_2!5934 lt!201799)) lt!201812))))

(assert (=> b!130799 (= lt!201800 (reader!0 (_2!5934 lt!201801) (_2!5934 lt!201799)))))

(declare-fun b!130800 () Bool)

(declare-fun lt!201802 () tuple2!11272)

(declare-fun lt!201803 () tuple2!11270)

(assert (=> b!130800 (= e!86687 (and (= (_2!5936 lt!201802) (select (arr!3361 arr!237) from!447)) (= (_1!5936 lt!201802) (_2!5935 lt!201803))))))

(assert (=> b!130800 (= lt!201802 (readBytePure!0 (_1!5935 lt!201803)))))

(assert (=> b!130800 (= lt!201803 (reader!0 thiss!1634 (_2!5934 lt!201801)))))

(declare-fun b!130801 () Bool)

(declare-fun res!108455 () Bool)

(assert (=> b!130801 (=> (not res!108455) (not e!86687))))

(assert (=> b!130801 (= res!108455 (= (bitIndex!0 (size!2738 (buf!3099 (_2!5934 lt!201801))) (currentByte!5872 (_2!5934 lt!201801)) (currentBit!5867 (_2!5934 lt!201801))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2738 (buf!3099 thiss!1634)) (currentByte!5872 thiss!1634) (currentBit!5867 thiss!1634)))))))

(declare-fun b!130802 () Bool)

(declare-fun arrayRangesEq!141 (array!6048 array!6048 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130802 (= e!86689 (not (arrayRangesEq!141 arr!237 (_2!5937 lt!201809) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!130803 () Bool)

(declare-fun res!108456 () Bool)

(assert (=> b!130803 (=> (not res!108456) (not e!86685))))

(assert (=> b!130803 (= res!108456 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2738 (buf!3099 thiss!1634))) ((_ sign_extend 32) (currentByte!5872 thiss!1634)) ((_ sign_extend 32) (currentBit!5867 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!130805 () Bool)

(assert (=> b!130805 (= e!86690 (= (_2!5936 lt!201810) (_2!5936 lt!201807)))))

(declare-fun b!130806 () Bool)

(declare-fun res!108448 () Bool)

(assert (=> b!130806 (=> (not res!108448) (not e!86687))))

(assert (=> b!130806 (= res!108448 (isPrefixOf!0 thiss!1634 (_2!5934 lt!201801)))))

(declare-fun b!130807 () Bool)

(assert (=> b!130807 (= e!86688 (invariant!0 (currentBit!5867 thiss!1634) (currentByte!5872 thiss!1634) (size!2738 (buf!3099 (_2!5934 lt!201801)))))))

(declare-fun b!130808 () Bool)

(assert (=> b!130808 (= e!86686 e!86693)))

(declare-fun res!108459 () Bool)

(assert (=> b!130808 (=> (not res!108459) (not e!86693))))

(assert (=> b!130808 (= res!108459 (= (bitIndex!0 (size!2738 (buf!3099 (_2!5934 lt!201799))) (currentByte!5872 (_2!5934 lt!201799)) (currentBit!5867 (_2!5934 lt!201799))) (bvadd (bitIndex!0 (size!2738 (buf!3099 (_2!5934 lt!201801))) (currentByte!5872 (_2!5934 lt!201801)) (currentBit!5867 (_2!5934 lt!201801))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!201812))))))

(assert (=> b!130808 (= lt!201812 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!130804 () Bool)

(declare-fun e!86691 () Bool)

(declare-fun array_inv!2527 (array!6048) Bool)

(assert (=> b!130804 (= e!86691 (array_inv!2527 (buf!3099 thiss!1634)))))

(declare-fun res!108458 () Bool)

(assert (=> start!25668 (=> (not res!108458) (not e!86685))))

(assert (=> start!25668 (= res!108458 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2738 arr!237))))))

(assert (=> start!25668 e!86685))

(assert (=> start!25668 true))

(assert (=> start!25668 (array_inv!2527 arr!237)))

(declare-fun inv!12 (BitStream!4740) Bool)

(assert (=> start!25668 (and (inv!12 thiss!1634) e!86691)))

(assert (= (and start!25668 res!108458) b!130803))

(assert (= (and b!130803 res!108456) b!130798))

(assert (= (and b!130798 res!108453) b!130797))

(assert (= (and b!130797 res!108457) b!130796))

(assert (= (and b!130796 res!108454) b!130801))

(assert (= (and b!130801 res!108455) b!130806))

(assert (= (and b!130806 res!108448) b!130800))

(assert (= (and b!130796 res!108452) b!130808))

(assert (= (and b!130808 res!108459) b!130795))

(assert (= (and b!130795 res!108450) b!130799))

(assert (= (and b!130799 (not res!108449)) b!130802))

(assert (= (and b!130796 res!108460) b!130807))

(assert (= (and b!130796 res!108451) b!130805))

(assert (= start!25668 b!130804))

(declare-fun m!197285 () Bool)

(assert (=> b!130795 m!197285))

(declare-fun m!197287 () Bool)

(assert (=> b!130801 m!197287))

(declare-fun m!197289 () Bool)

(assert (=> b!130801 m!197289))

(declare-fun m!197291 () Bool)

(assert (=> b!130808 m!197291))

(assert (=> b!130808 m!197287))

(declare-fun m!197293 () Bool)

(assert (=> b!130803 m!197293))

(declare-fun m!197295 () Bool)

(assert (=> b!130806 m!197295))

(declare-fun m!197297 () Bool)

(assert (=> b!130799 m!197297))

(declare-fun m!197299 () Bool)

(assert (=> b!130799 m!197299))

(declare-fun m!197301 () Bool)

(assert (=> b!130799 m!197301))

(declare-fun m!197303 () Bool)

(assert (=> b!130799 m!197303))

(declare-fun m!197305 () Bool)

(assert (=> start!25668 m!197305))

(declare-fun m!197307 () Bool)

(assert (=> start!25668 m!197307))

(declare-fun m!197309 () Bool)

(assert (=> b!130807 m!197309))

(declare-fun m!197311 () Bool)

(assert (=> b!130797 m!197311))

(declare-fun m!197313 () Bool)

(assert (=> b!130804 m!197313))

(declare-fun m!197315 () Bool)

(assert (=> b!130796 m!197315))

(assert (=> b!130796 m!197303))

(declare-fun m!197317 () Bool)

(assert (=> b!130796 m!197317))

(declare-fun m!197319 () Bool)

(assert (=> b!130796 m!197319))

(declare-fun m!197321 () Bool)

(assert (=> b!130796 m!197321))

(declare-fun m!197323 () Bool)

(assert (=> b!130796 m!197323))

(declare-fun m!197325 () Bool)

(assert (=> b!130796 m!197325))

(declare-fun m!197327 () Bool)

(assert (=> b!130796 m!197327))

(assert (=> b!130796 m!197325))

(declare-fun m!197329 () Bool)

(assert (=> b!130796 m!197329))

(declare-fun m!197331 () Bool)

(assert (=> b!130796 m!197331))

(declare-fun m!197333 () Bool)

(assert (=> b!130796 m!197333))

(declare-fun m!197335 () Bool)

(assert (=> b!130796 m!197335))

(declare-fun m!197337 () Bool)

(assert (=> b!130796 m!197337))

(declare-fun m!197339 () Bool)

(assert (=> b!130796 m!197339))

(declare-fun m!197341 () Bool)

(assert (=> b!130796 m!197341))

(assert (=> b!130800 m!197325))

(declare-fun m!197343 () Bool)

(assert (=> b!130800 m!197343))

(declare-fun m!197345 () Bool)

(assert (=> b!130800 m!197345))

(declare-fun m!197347 () Bool)

(assert (=> b!130802 m!197347))

(check-sat (not b!130806) (not b!130797) (not b!130800) (not b!130802) (not b!130796) (not b!130804) (not b!130808) (not b!130801) (not b!130795) (not start!25668) (not b!130799) (not b!130807) (not b!130803))
