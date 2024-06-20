; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19572 () Bool)

(assert start!19572)

(declare-fun b!97691 () Bool)

(declare-fun res!80162 () Bool)

(declare-fun e!63981 () Bool)

(assert (=> b!97691 (=> (not res!80162) (not e!63981))))

(declare-datatypes ((array!4576 0))(
  ( (array!4577 (arr!2685 (Array (_ BitVec 32) (_ BitVec 8))) (size!2092 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3658 0))(
  ( (BitStream!3659 (buf!2440 array!4576) (currentByte!4861 (_ BitVec 32)) (currentBit!4856 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3658)

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97691 (= res!80162 (validate_offset_bits!1 ((_ sign_extend 32) (size!2092 (buf!2440 thiss!1288))) ((_ sign_extend 32) (currentByte!4861 thiss!1288)) ((_ sign_extend 32) (currentBit!4856 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!97692 () Bool)

(declare-fun e!63982 () Bool)

(assert (=> b!97692 (= e!63981 e!63982)))

(declare-fun res!80159 () Bool)

(assert (=> b!97692 (=> (not res!80159) (not e!63982))))

(declare-datatypes ((Unit!5954 0))(
  ( (Unit!5955) )
))
(declare-datatypes ((tuple2!7840 0))(
  ( (tuple2!7841 (_1!4172 Unit!5954) (_2!4172 BitStream!3658)) )
))
(declare-fun lt!141335 () tuple2!7840)

(assert (=> b!97692 (= res!80159 (= (size!2092 (buf!2440 thiss!1288)) (size!2092 (buf!2440 (_2!4172 lt!141335)))))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3658 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7840)

(assert (=> b!97692 (= lt!141335 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!97693 () Bool)

(assert (=> b!97693 (= e!63982 (not true))))

(assert (=> b!97693 (validate_offset_bits!1 ((_ sign_extend 32) (size!2092 (buf!2440 (_2!4172 lt!141335)))) ((_ sign_extend 32) (currentByte!4861 thiss!1288)) ((_ sign_extend 32) (currentBit!4856 thiss!1288)) ((_ sign_extend 32) nBits!388))))

(declare-fun lt!141336 () Unit!5954)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3658 array!4576 (_ BitVec 64)) Unit!5954)

(assert (=> b!97693 (= lt!141336 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2440 (_2!4172 lt!141335)) ((_ sign_extend 32) nBits!388)))))

(declare-datatypes ((tuple2!7842 0))(
  ( (tuple2!7843 (_1!4173 BitStream!3658) (_2!4173 BitStream!3658)) )
))
(declare-fun lt!141337 () tuple2!7842)

(declare-fun reader!0 (BitStream!3658 BitStream!3658) tuple2!7842)

(assert (=> b!97693 (= lt!141337 (reader!0 thiss!1288 (_2!4172 lt!141335)))))

(declare-fun b!97694 () Bool)

(declare-fun res!80158 () Bool)

(assert (=> b!97694 (=> (not res!80158) (not e!63982))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97694 (= res!80158 (= (bitIndex!0 (size!2092 (buf!2440 (_2!4172 lt!141335))) (currentByte!4861 (_2!4172 lt!141335)) (currentBit!4856 (_2!4172 lt!141335))) (bvadd (bitIndex!0 (size!2092 (buf!2440 thiss!1288)) (currentByte!4861 thiss!1288) (currentBit!4856 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!97695 () Bool)

(declare-fun e!63983 () Bool)

(declare-fun array_inv!1894 (array!4576) Bool)

(assert (=> b!97695 (= e!63983 (array_inv!1894 (buf!2440 thiss!1288)))))

(declare-fun b!97696 () Bool)

(declare-fun res!80160 () Bool)

(assert (=> b!97696 (=> (not res!80160) (not e!63981))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97696 (= res!80160 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!97697 () Bool)

(declare-fun res!80161 () Bool)

(assert (=> b!97697 (=> (not res!80161) (not e!63982))))

(declare-fun isPrefixOf!0 (BitStream!3658 BitStream!3658) Bool)

(assert (=> b!97697 (= res!80161 (isPrefixOf!0 thiss!1288 (_2!4172 lt!141335)))))

(declare-fun res!80157 () Bool)

(assert (=> start!19572 (=> (not res!80157) (not e!63981))))

(assert (=> start!19572 (= res!80157 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19572 e!63981))

(assert (=> start!19572 true))

(declare-fun inv!12 (BitStream!3658) Bool)

(assert (=> start!19572 (and (inv!12 thiss!1288) e!63983)))

(assert (= (and start!19572 res!80157) b!97691))

(assert (= (and b!97691 res!80162) b!97696))

(assert (= (and b!97696 res!80160) b!97692))

(assert (= (and b!97692 res!80159) b!97694))

(assert (= (and b!97694 res!80158) b!97697))

(assert (= (and b!97697 res!80161) b!97693))

(assert (= start!19572 b!97695))

(declare-fun m!141943 () Bool)

(assert (=> b!97691 m!141943))

(declare-fun m!141945 () Bool)

(assert (=> b!97693 m!141945))

(declare-fun m!141947 () Bool)

(assert (=> b!97693 m!141947))

(declare-fun m!141949 () Bool)

(assert (=> b!97693 m!141949))

(declare-fun m!141951 () Bool)

(assert (=> b!97694 m!141951))

(declare-fun m!141953 () Bool)

(assert (=> b!97694 m!141953))

(declare-fun m!141955 () Bool)

(assert (=> b!97696 m!141955))

(declare-fun m!141957 () Bool)

(assert (=> b!97692 m!141957))

(declare-fun m!141959 () Bool)

(assert (=> b!97697 m!141959))

(declare-fun m!141961 () Bool)

(assert (=> b!97695 m!141961))

(declare-fun m!141963 () Bool)

(assert (=> start!19572 m!141963))

(push 1)

(assert (not b!97693))

(assert (not b!97695))

(assert (not b!97692))

(assert (not b!97697))

(assert (not b!97694))

(assert (not b!97696))

(assert (not start!19572))

(assert (not b!97691))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

