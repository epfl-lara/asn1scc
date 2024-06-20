; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19686 () Bool)

(assert start!19686)

(declare-fun b!98273 () Bool)

(declare-fun res!80616 () Bool)

(declare-fun e!64301 () Bool)

(assert (=> b!98273 (=> (not res!80616) (not e!64301))))

(declare-datatypes ((array!4606 0))(
  ( (array!4607 (arr!2697 (Array (_ BitVec 32) (_ BitVec 8))) (size!2104 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3682 0))(
  ( (BitStream!3683 (buf!2455 array!4606) (currentByte!4885 (_ BitVec 32)) (currentBit!4880 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6017 0))(
  ( (Unit!6018) )
))
(declare-datatypes ((tuple2!7912 0))(
  ( (tuple2!7913 (_1!4208 Unit!6017) (_2!4208 BitStream!3682)) )
))
(declare-fun lt!142548 () tuple2!7912)

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun thiss!1288 () BitStream!3682)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98273 (= res!80616 (= (bitIndex!0 (size!2104 (buf!2455 (_2!4208 lt!142548))) (currentByte!4885 (_2!4208 lt!142548)) (currentBit!4880 (_2!4208 lt!142548))) (bvadd (bitIndex!0 (size!2104 (buf!2455 thiss!1288)) (currentByte!4885 thiss!1288) (currentBit!4880 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun res!80617 () Bool)

(declare-fun e!64302 () Bool)

(assert (=> start!19686 (=> (not res!80617) (not e!64302))))

(assert (=> start!19686 (= res!80617 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19686 e!64302))

(assert (=> start!19686 true))

(declare-fun e!64300 () Bool)

(declare-fun inv!12 (BitStream!3682) Bool)

(assert (=> start!19686 (and (inv!12 thiss!1288) e!64300)))

(declare-fun b!98274 () Bool)

(assert (=> b!98274 (= e!64301 (bvslt ((_ sign_extend 32) nBits!388) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!7914 0))(
  ( (tuple2!7915 (_1!4209 BitStream!3682) (_2!4209 BitStream!3682)) )
))
(declare-fun lt!142549 () tuple2!7914)

(declare-fun reader!0 (BitStream!3682 BitStream!3682) tuple2!7914)

(assert (=> b!98274 (= lt!142549 (reader!0 thiss!1288 (_2!4208 lt!142548)))))

(declare-fun b!98275 () Bool)

(declare-fun res!80615 () Bool)

(assert (=> b!98275 (=> (not res!80615) (not e!64301))))

(declare-fun isPrefixOf!0 (BitStream!3682 BitStream!3682) Bool)

(assert (=> b!98275 (= res!80615 (isPrefixOf!0 thiss!1288 (_2!4208 lt!142548)))))

(declare-fun b!98276 () Bool)

(declare-fun res!80618 () Bool)

(assert (=> b!98276 (=> (not res!80618) (not e!64302))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98276 (= res!80618 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!98277 () Bool)

(declare-fun res!80614 () Bool)

(assert (=> b!98277 (=> (not res!80614) (not e!64302))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!98277 (= res!80614 (validate_offset_bits!1 ((_ sign_extend 32) (size!2104 (buf!2455 thiss!1288))) ((_ sign_extend 32) (currentByte!4885 thiss!1288)) ((_ sign_extend 32) (currentBit!4880 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!98278 () Bool)

(declare-fun array_inv!1906 (array!4606) Bool)

(assert (=> b!98278 (= e!64300 (array_inv!1906 (buf!2455 thiss!1288)))))

(declare-fun b!98279 () Bool)

(assert (=> b!98279 (= e!64302 e!64301)))

(declare-fun res!80613 () Bool)

(assert (=> b!98279 (=> (not res!80613) (not e!64301))))

(assert (=> b!98279 (= res!80613 (= (size!2104 (buf!2455 thiss!1288)) (size!2104 (buf!2455 (_2!4208 lt!142548)))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3682 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7912)

(assert (=> b!98279 (= lt!142548 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(assert (= (and start!19686 res!80617) b!98277))

(assert (= (and b!98277 res!80614) b!98276))

(assert (= (and b!98276 res!80618) b!98279))

(assert (= (and b!98279 res!80613) b!98273))

(assert (= (and b!98273 res!80616) b!98275))

(assert (= (and b!98275 res!80615) b!98274))

(assert (= start!19686 b!98278))

(declare-fun m!142813 () Bool)

(assert (=> start!19686 m!142813))

(declare-fun m!142815 () Bool)

(assert (=> b!98274 m!142815))

(declare-fun m!142817 () Bool)

(assert (=> b!98276 m!142817))

(declare-fun m!142819 () Bool)

(assert (=> b!98278 m!142819))

(declare-fun m!142821 () Bool)

(assert (=> b!98279 m!142821))

(declare-fun m!142823 () Bool)

(assert (=> b!98273 m!142823))

(declare-fun m!142825 () Bool)

(assert (=> b!98273 m!142825))

(declare-fun m!142827 () Bool)

(assert (=> b!98277 m!142827))

(declare-fun m!142829 () Bool)

(assert (=> b!98275 m!142829))

(push 1)

(assert (not start!19686))

(assert (not b!98274))

(assert (not b!98276))

(assert (not b!98273))

(assert (not b!98277))

(assert (not b!98279))

(assert (not b!98275))

(assert (not b!98278))

(check-sat)

(pop 1)

(push 1)

(check-sat)

