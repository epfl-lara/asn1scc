; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19696 () Bool)

(assert start!19696)

(declare-fun b!98378 () Bool)

(declare-fun e!64360 () Bool)

(declare-fun e!64361 () Bool)

(assert (=> b!98378 (= e!64360 e!64361)))

(declare-fun res!80707 () Bool)

(assert (=> b!98378 (=> (not res!80707) (not e!64361))))

(declare-datatypes ((array!4616 0))(
  ( (array!4617 (arr!2702 (Array (_ BitVec 32) (_ BitVec 8))) (size!2109 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3692 0))(
  ( (BitStream!3693 (buf!2460 array!4616) (currentByte!4890 (_ BitVec 32)) (currentBit!4885 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3692)

(declare-datatypes ((Unit!6027 0))(
  ( (Unit!6028) )
))
(declare-datatypes ((tuple2!7932 0))(
  ( (tuple2!7933 (_1!4218 Unit!6027) (_2!4218 BitStream!3692)) )
))
(declare-fun lt!142579 () tuple2!7932)

(assert (=> b!98378 (= res!80707 (= (size!2109 (buf!2460 thiss!1288)) (size!2109 (buf!2460 (_2!4218 lt!142579)))))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3692 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7932)

(assert (=> b!98378 (= lt!142579 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!98379 () Bool)

(declare-fun res!80708 () Bool)

(assert (=> b!98379 (=> (not res!80708) (not e!64360))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!98379 (= res!80708 (validate_offset_bits!1 ((_ sign_extend 32) (size!2109 (buf!2460 thiss!1288))) ((_ sign_extend 32) (currentByte!4890 thiss!1288)) ((_ sign_extend 32) (currentBit!4885 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!98380 () Bool)

(declare-fun e!64362 () Bool)

(declare-fun array_inv!1911 (array!4616) Bool)

(assert (=> b!98380 (= e!64362 (array_inv!1911 (buf!2460 thiss!1288)))))

(declare-fun b!98381 () Bool)

(assert (=> b!98381 (= e!64361 false)))

(declare-datatypes ((tuple2!7934 0))(
  ( (tuple2!7935 (_1!4219 BitStream!3692) (_2!4219 BitStream!3692)) )
))
(declare-fun lt!142578 () tuple2!7934)

(declare-fun reader!0 (BitStream!3692 BitStream!3692) tuple2!7934)

(assert (=> b!98381 (= lt!142578 (reader!0 thiss!1288 (_2!4218 lt!142579)))))

(declare-fun res!80704 () Bool)

(assert (=> start!19696 (=> (not res!80704) (not e!64360))))

(assert (=> start!19696 (= res!80704 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19696 e!64360))

(assert (=> start!19696 true))

(declare-fun inv!12 (BitStream!3692) Bool)

(assert (=> start!19696 (and (inv!12 thiss!1288) e!64362)))

(declare-fun b!98382 () Bool)

(declare-fun res!80705 () Bool)

(assert (=> b!98382 (=> (not res!80705) (not e!64361))))

(declare-fun isPrefixOf!0 (BitStream!3692 BitStream!3692) Bool)

(assert (=> b!98382 (= res!80705 (isPrefixOf!0 thiss!1288 (_2!4218 lt!142579)))))

(declare-fun b!98383 () Bool)

(declare-fun res!80706 () Bool)

(assert (=> b!98383 (=> (not res!80706) (not e!64361))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98383 (= res!80706 (= (bitIndex!0 (size!2109 (buf!2460 (_2!4218 lt!142579))) (currentByte!4890 (_2!4218 lt!142579)) (currentBit!4885 (_2!4218 lt!142579))) (bvadd (bitIndex!0 (size!2109 (buf!2460 thiss!1288)) (currentByte!4890 thiss!1288) (currentBit!4885 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!98384 () Bool)

(declare-fun res!80703 () Bool)

(assert (=> b!98384 (=> (not res!80703) (not e!64360))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98384 (= res!80703 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(assert (= (and start!19696 res!80704) b!98379))

(assert (= (and b!98379 res!80708) b!98384))

(assert (= (and b!98384 res!80703) b!98378))

(assert (= (and b!98378 res!80707) b!98383))

(assert (= (and b!98383 res!80706) b!98382))

(assert (= (and b!98382 res!80705) b!98381))

(assert (= start!19696 b!98380))

(declare-fun m!142903 () Bool)

(assert (=> b!98379 m!142903))

(declare-fun m!142905 () Bool)

(assert (=> start!19696 m!142905))

(declare-fun m!142907 () Bool)

(assert (=> b!98383 m!142907))

(declare-fun m!142909 () Bool)

(assert (=> b!98383 m!142909))

(declare-fun m!142911 () Bool)

(assert (=> b!98378 m!142911))

(declare-fun m!142913 () Bool)

(assert (=> b!98381 m!142913))

(declare-fun m!142915 () Bool)

(assert (=> b!98380 m!142915))

(declare-fun m!142917 () Bool)

(assert (=> b!98382 m!142917))

(declare-fun m!142919 () Bool)

(assert (=> b!98384 m!142919))

(push 1)

