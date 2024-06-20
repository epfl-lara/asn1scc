; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19570 () Bool)

(assert start!19570)

(declare-fun b!97670 () Bool)

(declare-fun e!63971 () Bool)

(declare-fun e!63970 () Bool)

(assert (=> b!97670 (= e!63971 e!63970)))

(declare-fun res!80142 () Bool)

(assert (=> b!97670 (=> (not res!80142) (not e!63970))))

(declare-datatypes ((array!4574 0))(
  ( (array!4575 (arr!2684 (Array (_ BitVec 32) (_ BitVec 8))) (size!2091 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3656 0))(
  ( (BitStream!3657 (buf!2439 array!4574) (currentByte!4860 (_ BitVec 32)) (currentBit!4855 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3656)

(declare-datatypes ((Unit!5952 0))(
  ( (Unit!5953) )
))
(declare-datatypes ((tuple2!7836 0))(
  ( (tuple2!7837 (_1!4170 Unit!5952) (_2!4170 BitStream!3656)) )
))
(declare-fun lt!141327 () tuple2!7836)

(assert (=> b!97670 (= res!80142 (= (size!2091 (buf!2439 thiss!1288)) (size!2091 (buf!2439 (_2!4170 lt!141327)))))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3656 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7836)

(assert (=> b!97670 (= lt!141327 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!97672 () Bool)

(assert (=> b!97672 (= e!63970 false)))

(declare-datatypes ((tuple2!7838 0))(
  ( (tuple2!7839 (_1!4171 BitStream!3656) (_2!4171 BitStream!3656)) )
))
(declare-fun lt!141328 () tuple2!7838)

(declare-fun reader!0 (BitStream!3656 BitStream!3656) tuple2!7838)

(assert (=> b!97672 (= lt!141328 (reader!0 thiss!1288 (_2!4170 lt!141327)))))

(declare-fun b!97673 () Bool)

(declare-fun e!63972 () Bool)

(declare-fun array_inv!1893 (array!4574) Bool)

(assert (=> b!97673 (= e!63972 (array_inv!1893 (buf!2439 thiss!1288)))))

(declare-fun b!97674 () Bool)

(declare-fun res!80140 () Bool)

(assert (=> b!97674 (=> (not res!80140) (not e!63971))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97674 (= res!80140 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!97675 () Bool)

(declare-fun res!80143 () Bool)

(assert (=> b!97675 (=> (not res!80143) (not e!63971))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97675 (= res!80143 (validate_offset_bits!1 ((_ sign_extend 32) (size!2091 (buf!2439 thiss!1288))) ((_ sign_extend 32) (currentByte!4860 thiss!1288)) ((_ sign_extend 32) (currentBit!4855 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!97676 () Bool)

(declare-fun res!80139 () Bool)

(assert (=> b!97676 (=> (not res!80139) (not e!63970))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97676 (= res!80139 (= (bitIndex!0 (size!2091 (buf!2439 (_2!4170 lt!141327))) (currentByte!4860 (_2!4170 lt!141327)) (currentBit!4855 (_2!4170 lt!141327))) (bvadd (bitIndex!0 (size!2091 (buf!2439 thiss!1288)) (currentByte!4860 thiss!1288) (currentBit!4855 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun res!80141 () Bool)

(assert (=> start!19570 (=> (not res!80141) (not e!63971))))

(assert (=> start!19570 (= res!80141 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19570 e!63971))

(assert (=> start!19570 true))

(declare-fun inv!12 (BitStream!3656) Bool)

(assert (=> start!19570 (and (inv!12 thiss!1288) e!63972)))

(declare-fun b!97671 () Bool)

(declare-fun res!80144 () Bool)

(assert (=> b!97671 (=> (not res!80144) (not e!63970))))

(declare-fun isPrefixOf!0 (BitStream!3656 BitStream!3656) Bool)

(assert (=> b!97671 (= res!80144 (isPrefixOf!0 thiss!1288 (_2!4170 lt!141327)))))

(assert (= (and start!19570 res!80141) b!97675))

(assert (= (and b!97675 res!80143) b!97674))

(assert (= (and b!97674 res!80140) b!97670))

(assert (= (and b!97670 res!80142) b!97676))

(assert (= (and b!97676 res!80139) b!97671))

(assert (= (and b!97671 res!80144) b!97672))

(assert (= start!19570 b!97673))

(declare-fun m!141925 () Bool)

(assert (=> start!19570 m!141925))

(declare-fun m!141927 () Bool)

(assert (=> b!97674 m!141927))

(declare-fun m!141929 () Bool)

(assert (=> b!97676 m!141929))

(declare-fun m!141931 () Bool)

(assert (=> b!97676 m!141931))

(declare-fun m!141933 () Bool)

(assert (=> b!97675 m!141933))

(declare-fun m!141935 () Bool)

(assert (=> b!97673 m!141935))

(declare-fun m!141937 () Bool)

(assert (=> b!97671 m!141937))

(declare-fun m!141939 () Bool)

(assert (=> b!97670 m!141939))

(declare-fun m!141941 () Bool)

(assert (=> b!97672 m!141941))

(push 1)

(assert (not b!97676))

(assert (not start!19570))

(assert (not b!97672))

(assert (not b!97671))

(assert (not b!97675))

(assert (not b!97673))

(assert (not b!97670))

(assert (not b!97674))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

