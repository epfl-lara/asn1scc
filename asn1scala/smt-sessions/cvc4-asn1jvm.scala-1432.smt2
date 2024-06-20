; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39360 () Bool)

(assert start!39360)

(declare-fun b!176941 () Bool)

(declare-fun e!123313 () Bool)

(declare-fun e!123315 () Bool)

(assert (=> b!176941 (= e!123313 e!123315)))

(declare-fun res!146635 () Bool)

(assert (=> b!176941 (=> (not res!146635) (not e!123315))))

(declare-datatypes ((array!9552 0))(
  ( (array!9553 (arr!5142 (Array (_ BitVec 32) (_ BitVec 8))) (size!4212 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7532 0))(
  ( (BitStream!7533 (buf!4655 array!9552) (currentByte!8826 (_ BitVec 32)) (currentBit!8821 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15238 0))(
  ( (tuple2!15239 (_1!8264 BitStream!7532) (_2!8264 Bool)) )
))
(declare-fun lt!272123 () tuple2!15238)

(declare-fun lt!272128 () Bool)

(declare-datatypes ((Unit!12738 0))(
  ( (Unit!12739) )
))
(declare-datatypes ((tuple2!15240 0))(
  ( (tuple2!15241 (_1!8265 Unit!12738) (_2!8265 BitStream!7532)) )
))
(declare-fun lt!272125 () tuple2!15240)

(assert (=> b!176941 (= res!146635 (and (= (_2!8264 lt!272123) lt!272128) (= (_1!8264 lt!272123) (_2!8265 lt!272125))))))

(declare-fun thiss!1204 () BitStream!7532)

(declare-fun readBitPure!0 (BitStream!7532) tuple2!15238)

(declare-fun readerFrom!0 (BitStream!7532 (_ BitVec 32) (_ BitVec 32)) BitStream!7532)

(assert (=> b!176941 (= lt!272123 (readBitPure!0 (readerFrom!0 (_2!8265 lt!272125) (currentBit!8821 thiss!1204) (currentByte!8826 thiss!1204))))))

(declare-fun b!176942 () Bool)

(declare-fun lt!272129 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!176942 (= e!123315 (= (bitIndex!0 (size!4212 (buf!4655 (_1!8264 lt!272123))) (currentByte!8826 (_1!8264 lt!272123)) (currentBit!8821 (_1!8264 lt!272123))) lt!272129))))

(declare-fun b!176943 () Bool)

(declare-fun res!146640 () Bool)

(declare-fun e!123312 () Bool)

(assert (=> b!176943 (=> (not res!146640) (not e!123312))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!176943 (= res!146640 (not (= i!590 nBits!348)))))

(declare-fun b!176944 () Bool)

(declare-fun e!123311 () Bool)

(declare-fun array_inv!3953 (array!9552) Bool)

(assert (=> b!176944 (= e!123311 (array_inv!3953 (buf!4655 thiss!1204)))))

(declare-fun b!176945 () Bool)

(declare-fun res!146638 () Bool)

(assert (=> b!176945 (=> (not res!146638) (not e!123312))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!176945 (= res!146638 (invariant!0 (currentBit!8821 thiss!1204) (currentByte!8826 thiss!1204) (size!4212 (buf!4655 thiss!1204))))))

(declare-fun b!176946 () Bool)

(assert (=> b!176946 (= e!123312 (not true))))

(declare-fun lt!272126 () (_ BitVec 64))

(assert (=> b!176946 (= lt!272126 (bitIndex!0 (size!4212 (buf!4655 (_2!8265 lt!272125))) (currentByte!8826 (_2!8265 lt!272125)) (currentBit!8821 (_2!8265 lt!272125))))))

(declare-fun lt!272127 () (_ BitVec 64))

(assert (=> b!176946 (= lt!272127 (bitIndex!0 (size!4212 (buf!4655 thiss!1204)) (currentByte!8826 thiss!1204) (currentBit!8821 thiss!1204)))))

(declare-fun e!123314 () Bool)

(assert (=> b!176946 e!123314))

(declare-fun res!146637 () Bool)

(assert (=> b!176946 (=> (not res!146637) (not e!123314))))

(assert (=> b!176946 (= res!146637 (= (size!4212 (buf!4655 thiss!1204)) (size!4212 (buf!4655 (_2!8265 lt!272125)))))))

(declare-fun appendBit!0 (BitStream!7532 Bool) tuple2!15240)

(assert (=> b!176946 (= lt!272125 (appendBit!0 thiss!1204 lt!272128))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!176946 (= lt!272128 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176947 () Bool)

(assert (=> b!176947 (= e!123314 e!123313)))

(declare-fun res!146639 () Bool)

(assert (=> b!176947 (=> (not res!146639) (not e!123313))))

(declare-fun lt!272124 () (_ BitVec 64))

(assert (=> b!176947 (= res!146639 (= lt!272129 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!272124)))))

(assert (=> b!176947 (= lt!272129 (bitIndex!0 (size!4212 (buf!4655 (_2!8265 lt!272125))) (currentByte!8826 (_2!8265 lt!272125)) (currentBit!8821 (_2!8265 lt!272125))))))

(assert (=> b!176947 (= lt!272124 (bitIndex!0 (size!4212 (buf!4655 thiss!1204)) (currentByte!8826 thiss!1204) (currentBit!8821 thiss!1204)))))

(declare-fun b!176948 () Bool)

(declare-fun res!146634 () Bool)

(assert (=> b!176948 (=> (not res!146634) (not e!123313))))

(declare-fun isPrefixOf!0 (BitStream!7532 BitStream!7532) Bool)

(assert (=> b!176948 (= res!146634 (isPrefixOf!0 thiss!1204 (_2!8265 lt!272125)))))

(declare-fun b!176949 () Bool)

(declare-fun res!146633 () Bool)

(assert (=> b!176949 (=> (not res!146633) (not e!123312))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176949 (= res!146633 (validate_offset_bits!1 ((_ sign_extend 32) (size!4212 (buf!4655 thiss!1204))) ((_ sign_extend 32) (currentByte!8826 thiss!1204)) ((_ sign_extend 32) (currentBit!8821 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun res!146636 () Bool)

(assert (=> start!39360 (=> (not res!146636) (not e!123312))))

(assert (=> start!39360 (= res!146636 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39360 e!123312))

(assert (=> start!39360 true))

(declare-fun inv!12 (BitStream!7532) Bool)

(assert (=> start!39360 (and (inv!12 thiss!1204) e!123311)))

(assert (= (and start!39360 res!146636) b!176949))

(assert (= (and b!176949 res!146633) b!176945))

(assert (= (and b!176945 res!146638) b!176943))

(assert (= (and b!176943 res!146640) b!176946))

(assert (= (and b!176946 res!146637) b!176947))

(assert (= (and b!176947 res!146639) b!176948))

(assert (= (and b!176948 res!146634) b!176941))

(assert (= (and b!176941 res!146635) b!176942))

(assert (= start!39360 b!176944))

(declare-fun m!276951 () Bool)

(assert (=> b!176946 m!276951))

(declare-fun m!276953 () Bool)

(assert (=> b!176946 m!276953))

(declare-fun m!276955 () Bool)

(assert (=> b!176946 m!276955))

(declare-fun m!276957 () Bool)

(assert (=> b!176948 m!276957))

(declare-fun m!276959 () Bool)

(assert (=> b!176949 m!276959))

(assert (=> b!176947 m!276951))

(assert (=> b!176947 m!276953))

(declare-fun m!276961 () Bool)

(assert (=> b!176941 m!276961))

(assert (=> b!176941 m!276961))

(declare-fun m!276963 () Bool)

(assert (=> b!176941 m!276963))

(declare-fun m!276965 () Bool)

(assert (=> b!176945 m!276965))

(declare-fun m!276967 () Bool)

(assert (=> b!176942 m!276967))

(declare-fun m!276969 () Bool)

(assert (=> b!176944 m!276969))

(declare-fun m!276971 () Bool)

(assert (=> start!39360 m!276971))

(push 1)

(assert (not b!176942))

(assert (not b!176946))

(assert (not b!176948))

(assert (not b!176945))

(assert (not b!176944))

(assert (not b!176947))

(assert (not b!176941))

(assert (not start!39360))

(assert (not b!176949))

