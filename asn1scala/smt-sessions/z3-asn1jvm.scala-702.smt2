; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19694 () Bool)

(assert start!19694)

(declare-fun b!98357 () Bool)

(declare-fun e!64348 () Bool)

(declare-fun e!64349 () Bool)

(assert (=> b!98357 (= e!64348 e!64349)))

(declare-fun res!80685 () Bool)

(assert (=> b!98357 (=> (not res!80685) (not e!64349))))

(declare-datatypes ((array!4614 0))(
  ( (array!4615 (arr!2701 (Array (_ BitVec 32) (_ BitVec 8))) (size!2108 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3690 0))(
  ( (BitStream!3691 (buf!2459 array!4614) (currentByte!4889 (_ BitVec 32)) (currentBit!4884 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3690)

(declare-datatypes ((Unit!6025 0))(
  ( (Unit!6026) )
))
(declare-datatypes ((tuple2!7928 0))(
  ( (tuple2!7929 (_1!4216 Unit!6025) (_2!4216 BitStream!3690)) )
))
(declare-fun lt!142572 () tuple2!7928)

(assert (=> b!98357 (= res!80685 (= (size!2108 (buf!2459 thiss!1288)) (size!2108 (buf!2459 (_2!4216 lt!142572)))))))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3690 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7928)

(assert (=> b!98357 (= lt!142572 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!98358 () Bool)

(declare-fun res!80687 () Bool)

(assert (=> b!98358 (=> (not res!80687) (not e!64349))))

(declare-fun isPrefixOf!0 (BitStream!3690 BitStream!3690) Bool)

(assert (=> b!98358 (= res!80687 (isPrefixOf!0 thiss!1288 (_2!4216 lt!142572)))))

(declare-fun b!98359 () Bool)

(declare-fun e!64350 () Bool)

(declare-fun array_inv!1910 (array!4614) Bool)

(assert (=> b!98359 (= e!64350 (array_inv!1910 (buf!2459 thiss!1288)))))

(declare-fun res!80690 () Bool)

(assert (=> start!19694 (=> (not res!80690) (not e!64348))))

(assert (=> start!19694 (= res!80690 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19694 e!64348))

(assert (=> start!19694 true))

(declare-fun inv!12 (BitStream!3690) Bool)

(assert (=> start!19694 (and (inv!12 thiss!1288) e!64350)))

(declare-fun b!98360 () Bool)

(assert (=> b!98360 (= e!64349 false)))

(declare-datatypes ((tuple2!7930 0))(
  ( (tuple2!7931 (_1!4217 BitStream!3690) (_2!4217 BitStream!3690)) )
))
(declare-fun lt!142573 () tuple2!7930)

(declare-fun reader!0 (BitStream!3690 BitStream!3690) tuple2!7930)

(assert (=> b!98360 (= lt!142573 (reader!0 thiss!1288 (_2!4216 lt!142572)))))

(declare-fun b!98361 () Bool)

(declare-fun res!80689 () Bool)

(assert (=> b!98361 (=> (not res!80689) (not e!64349))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98361 (= res!80689 (= (bitIndex!0 (size!2108 (buf!2459 (_2!4216 lt!142572))) (currentByte!4889 (_2!4216 lt!142572)) (currentBit!4884 (_2!4216 lt!142572))) (bvadd (bitIndex!0 (size!2108 (buf!2459 thiss!1288)) (currentByte!4889 thiss!1288) (currentBit!4884 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!98362 () Bool)

(declare-fun res!80688 () Bool)

(assert (=> b!98362 (=> (not res!80688) (not e!64348))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98362 (= res!80688 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!98363 () Bool)

(declare-fun res!80686 () Bool)

(assert (=> b!98363 (=> (not res!80686) (not e!64348))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!98363 (= res!80686 (validate_offset_bits!1 ((_ sign_extend 32) (size!2108 (buf!2459 thiss!1288))) ((_ sign_extend 32) (currentByte!4889 thiss!1288)) ((_ sign_extend 32) (currentBit!4884 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(assert (= (and start!19694 res!80690) b!98363))

(assert (= (and b!98363 res!80686) b!98362))

(assert (= (and b!98362 res!80688) b!98357))

(assert (= (and b!98357 res!80685) b!98361))

(assert (= (and b!98361 res!80689) b!98358))

(assert (= (and b!98358 res!80687) b!98360))

(assert (= start!19694 b!98359))

(declare-fun m!142885 () Bool)

(assert (=> b!98358 m!142885))

(declare-fun m!142887 () Bool)

(assert (=> b!98361 m!142887))

(declare-fun m!142889 () Bool)

(assert (=> b!98361 m!142889))

(declare-fun m!142891 () Bool)

(assert (=> b!98359 m!142891))

(declare-fun m!142893 () Bool)

(assert (=> b!98360 m!142893))

(declare-fun m!142895 () Bool)

(assert (=> b!98363 m!142895))

(declare-fun m!142897 () Bool)

(assert (=> start!19694 m!142897))

(declare-fun m!142899 () Bool)

(assert (=> b!98362 m!142899))

(declare-fun m!142901 () Bool)

(assert (=> b!98357 m!142901))

(check-sat (not b!98362) (not start!19694) (not b!98357) (not b!98361) (not b!98359) (not b!98363) (not b!98360) (not b!98358))
