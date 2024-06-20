; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19690 () Bool)

(assert start!19690)

(declare-fun b!98315 () Bool)

(declare-fun res!80653 () Bool)

(declare-fun e!64326 () Bool)

(assert (=> b!98315 (=> (not res!80653) (not e!64326))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98315 (= res!80653 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!98316 () Bool)

(declare-fun res!80650 () Bool)

(assert (=> b!98316 (=> (not res!80650) (not e!64326))))

(declare-datatypes ((array!4610 0))(
  ( (array!4611 (arr!2699 (Array (_ BitVec 32) (_ BitVec 8))) (size!2106 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3686 0))(
  ( (BitStream!3687 (buf!2457 array!4610) (currentByte!4887 (_ BitVec 32)) (currentBit!4882 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3686)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!98316 (= res!80650 (validate_offset_bits!1 ((_ sign_extend 32) (size!2106 (buf!2457 thiss!1288))) ((_ sign_extend 32) (currentByte!4887 thiss!1288)) ((_ sign_extend 32) (currentBit!4882 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!98317 () Bool)

(declare-fun e!64324 () Bool)

(assert (=> b!98317 (= e!64326 e!64324)))

(declare-fun res!80649 () Bool)

(assert (=> b!98317 (=> (not res!80649) (not e!64324))))

(declare-datatypes ((Unit!6021 0))(
  ( (Unit!6022) )
))
(declare-datatypes ((tuple2!7920 0))(
  ( (tuple2!7921 (_1!4212 Unit!6021) (_2!4212 BitStream!3686)) )
))
(declare-fun lt!142560 () tuple2!7920)

(assert (=> b!98317 (= res!80649 (= (size!2106 (buf!2457 thiss!1288)) (size!2106 (buf!2457 (_2!4212 lt!142560)))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3686 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7920)

(assert (=> b!98317 (= lt!142560 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!98318 () Bool)

(declare-fun e!64325 () Bool)

(declare-fun array_inv!1908 (array!4610) Bool)

(assert (=> b!98318 (= e!64325 (array_inv!1908 (buf!2457 thiss!1288)))))

(declare-fun res!80652 () Bool)

(assert (=> start!19690 (=> (not res!80652) (not e!64326))))

(assert (=> start!19690 (= res!80652 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19690 e!64326))

(assert (=> start!19690 true))

(declare-fun inv!12 (BitStream!3686) Bool)

(assert (=> start!19690 (and (inv!12 thiss!1288) e!64325)))

(declare-fun b!98319 () Bool)

(declare-fun res!80654 () Bool)

(assert (=> b!98319 (=> (not res!80654) (not e!64324))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98319 (= res!80654 (= (bitIndex!0 (size!2106 (buf!2457 (_2!4212 lt!142560))) (currentByte!4887 (_2!4212 lt!142560)) (currentBit!4882 (_2!4212 lt!142560))) (bvadd (bitIndex!0 (size!2106 (buf!2457 thiss!1288)) (currentByte!4887 thiss!1288) (currentBit!4882 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!98320 () Bool)

(assert (=> b!98320 (= e!64324 (bvslt ((_ sign_extend 32) nBits!388) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!7922 0))(
  ( (tuple2!7923 (_1!4213 BitStream!3686) (_2!4213 BitStream!3686)) )
))
(declare-fun lt!142561 () tuple2!7922)

(declare-fun reader!0 (BitStream!3686 BitStream!3686) tuple2!7922)

(assert (=> b!98320 (= lt!142561 (reader!0 thiss!1288 (_2!4212 lt!142560)))))

(declare-fun b!98321 () Bool)

(declare-fun res!80651 () Bool)

(assert (=> b!98321 (=> (not res!80651) (not e!64324))))

(declare-fun isPrefixOf!0 (BitStream!3686 BitStream!3686) Bool)

(assert (=> b!98321 (= res!80651 (isPrefixOf!0 thiss!1288 (_2!4212 lt!142560)))))

(assert (= (and start!19690 res!80652) b!98316))

(assert (= (and b!98316 res!80650) b!98315))

(assert (= (and b!98315 res!80653) b!98317))

(assert (= (and b!98317 res!80649) b!98319))

(assert (= (and b!98319 res!80654) b!98321))

(assert (= (and b!98321 res!80651) b!98320))

(assert (= start!19690 b!98318))

(declare-fun m!142849 () Bool)

(assert (=> b!98321 m!142849))

(declare-fun m!142851 () Bool)

(assert (=> b!98319 m!142851))

(declare-fun m!142853 () Bool)

(assert (=> b!98319 m!142853))

(declare-fun m!142855 () Bool)

(assert (=> b!98320 m!142855))

(declare-fun m!142857 () Bool)

(assert (=> b!98318 m!142857))

(declare-fun m!142859 () Bool)

(assert (=> b!98315 m!142859))

(declare-fun m!142861 () Bool)

(assert (=> start!19690 m!142861))

(declare-fun m!142863 () Bool)

(assert (=> b!98316 m!142863))

(declare-fun m!142865 () Bool)

(assert (=> b!98317 m!142865))

(push 1)

(assert (not b!98320))

(assert (not start!19690))

(assert (not b!98319))

(assert (not b!98318))

(assert (not b!98317))

(assert (not b!98315))

(assert (not b!98321))

(assert (not b!98316))

(check-sat)

(pop 1)

(push 1)

(check-sat)

