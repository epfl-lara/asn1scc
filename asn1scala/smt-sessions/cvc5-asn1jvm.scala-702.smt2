; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19692 () Bool)

(assert start!19692)

(declare-fun b!98336 () Bool)

(declare-fun e!64337 () Bool)

(declare-fun e!64336 () Bool)

(assert (=> b!98336 (= e!64337 e!64336)))

(declare-fun res!80668 () Bool)

(assert (=> b!98336 (=> (not res!80668) (not e!64336))))

(declare-datatypes ((array!4612 0))(
  ( (array!4613 (arr!2700 (Array (_ BitVec 32) (_ BitVec 8))) (size!2107 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3688 0))(
  ( (BitStream!3689 (buf!2458 array!4612) (currentByte!4888 (_ BitVec 32)) (currentBit!4883 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3688)

(declare-datatypes ((Unit!6023 0))(
  ( (Unit!6024) )
))
(declare-datatypes ((tuple2!7924 0))(
  ( (tuple2!7925 (_1!4214 Unit!6023) (_2!4214 BitStream!3688)) )
))
(declare-fun lt!142566 () tuple2!7924)

(assert (=> b!98336 (= res!80668 (= (size!2107 (buf!2458 thiss!1288)) (size!2107 (buf!2458 (_2!4214 lt!142566)))))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3688 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7924)

(assert (=> b!98336 (= lt!142566 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!98337 () Bool)

(declare-fun res!80671 () Bool)

(assert (=> b!98337 (=> (not res!80671) (not e!64336))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98337 (= res!80671 (= (bitIndex!0 (size!2107 (buf!2458 (_2!4214 lt!142566))) (currentByte!4888 (_2!4214 lt!142566)) (currentBit!4883 (_2!4214 lt!142566))) (bvadd (bitIndex!0 (size!2107 (buf!2458 thiss!1288)) (currentByte!4888 thiss!1288) (currentBit!4883 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!98338 () Bool)

(declare-fun e!64335 () Bool)

(declare-fun array_inv!1909 (array!4612) Bool)

(assert (=> b!98338 (= e!64335 (array_inv!1909 (buf!2458 thiss!1288)))))

(declare-fun b!98339 () Bool)

(assert (=> b!98339 (= e!64336 false)))

(declare-datatypes ((tuple2!7926 0))(
  ( (tuple2!7927 (_1!4215 BitStream!3688) (_2!4215 BitStream!3688)) )
))
(declare-fun lt!142567 () tuple2!7926)

(declare-fun reader!0 (BitStream!3688 BitStream!3688) tuple2!7926)

(assert (=> b!98339 (= lt!142567 (reader!0 thiss!1288 (_2!4214 lt!142566)))))

(declare-fun b!98340 () Bool)

(declare-fun res!80672 () Bool)

(assert (=> b!98340 (=> (not res!80672) (not e!64337))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!98340 (= res!80672 (validate_offset_bits!1 ((_ sign_extend 32) (size!2107 (buf!2458 thiss!1288))) ((_ sign_extend 32) (currentByte!4888 thiss!1288)) ((_ sign_extend 32) (currentBit!4883 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!98341 () Bool)

(declare-fun res!80669 () Bool)

(assert (=> b!98341 (=> (not res!80669) (not e!64336))))

(declare-fun isPrefixOf!0 (BitStream!3688 BitStream!3688) Bool)

(assert (=> b!98341 (= res!80669 (isPrefixOf!0 thiss!1288 (_2!4214 lt!142566)))))

(declare-fun res!80667 () Bool)

(assert (=> start!19692 (=> (not res!80667) (not e!64337))))

(assert (=> start!19692 (= res!80667 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19692 e!64337))

(assert (=> start!19692 true))

(declare-fun inv!12 (BitStream!3688) Bool)

(assert (=> start!19692 (and (inv!12 thiss!1288) e!64335)))

(declare-fun b!98342 () Bool)

(declare-fun res!80670 () Bool)

(assert (=> b!98342 (=> (not res!80670) (not e!64337))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98342 (= res!80670 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(assert (= (and start!19692 res!80667) b!98340))

(assert (= (and b!98340 res!80672) b!98342))

(assert (= (and b!98342 res!80670) b!98336))

(assert (= (and b!98336 res!80668) b!98337))

(assert (= (and b!98337 res!80671) b!98341))

(assert (= (and b!98341 res!80669) b!98339))

(assert (= start!19692 b!98338))

(declare-fun m!142867 () Bool)

(assert (=> b!98342 m!142867))

(declare-fun m!142869 () Bool)

(assert (=> start!19692 m!142869))

(declare-fun m!142871 () Bool)

(assert (=> b!98336 m!142871))

(declare-fun m!142873 () Bool)

(assert (=> b!98338 m!142873))

(declare-fun m!142875 () Bool)

(assert (=> b!98341 m!142875))

(declare-fun m!142877 () Bool)

(assert (=> b!98339 m!142877))

(declare-fun m!142879 () Bool)

(assert (=> b!98340 m!142879))

(declare-fun m!142881 () Bool)

(assert (=> b!98337 m!142881))

(declare-fun m!142883 () Bool)

(assert (=> b!98337 m!142883))

(push 1)

(assert (not b!98340))

(assert (not b!98339))

(assert (not b!98341))

(assert (not b!98338))

(assert (not start!19692))

(assert (not b!98342))

(assert (not b!98337))

(assert (not b!98336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

