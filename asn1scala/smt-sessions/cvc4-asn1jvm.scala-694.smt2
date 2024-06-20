; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19558 () Bool)

(assert start!19558)

(declare-fun b!97544 () Bool)

(declare-fun res!80035 () Bool)

(declare-fun e!63900 () Bool)

(assert (=> b!97544 (=> (not res!80035) (not e!63900))))

(declare-datatypes ((array!4562 0))(
  ( (array!4563 (arr!2678 (Array (_ BitVec 32) (_ BitVec 8))) (size!2085 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3644 0))(
  ( (BitStream!3645 (buf!2433 array!4562) (currentByte!4854 (_ BitVec 32)) (currentBit!4849 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3644)

(declare-datatypes ((Unit!5940 0))(
  ( (Unit!5941) )
))
(declare-datatypes ((tuple2!7812 0))(
  ( (tuple2!7813 (_1!4158 Unit!5940) (_2!4158 BitStream!3644)) )
))
(declare-fun lt!141292 () tuple2!7812)

(declare-fun isPrefixOf!0 (BitStream!3644 BitStream!3644) Bool)

(assert (=> b!97544 (= res!80035 (isPrefixOf!0 thiss!1288 (_2!4158 lt!141292)))))

(declare-fun b!97545 () Bool)

(assert (=> b!97545 (= e!63900 false)))

(declare-datatypes ((tuple2!7814 0))(
  ( (tuple2!7815 (_1!4159 BitStream!3644) (_2!4159 BitStream!3644)) )
))
(declare-fun lt!141291 () tuple2!7814)

(declare-fun reader!0 (BitStream!3644 BitStream!3644) tuple2!7814)

(assert (=> b!97545 (= lt!141291 (reader!0 thiss!1288 (_2!4158 lt!141292)))))

(declare-fun b!97546 () Bool)

(declare-fun e!63899 () Bool)

(declare-fun array_inv!1887 (array!4562) Bool)

(assert (=> b!97546 (= e!63899 (array_inv!1887 (buf!2433 thiss!1288)))))

(declare-fun b!97547 () Bool)

(declare-fun res!80033 () Bool)

(declare-fun e!63898 () Bool)

(assert (=> b!97547 (=> (not res!80033) (not e!63898))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97547 (= res!80033 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun res!80032 () Bool)

(assert (=> start!19558 (=> (not res!80032) (not e!63898))))

(assert (=> start!19558 (= res!80032 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19558 e!63898))

(assert (=> start!19558 true))

(declare-fun inv!12 (BitStream!3644) Bool)

(assert (=> start!19558 (and (inv!12 thiss!1288) e!63899)))

(declare-fun b!97548 () Bool)

(declare-fun res!80036 () Bool)

(assert (=> b!97548 (=> (not res!80036) (not e!63900))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97548 (= res!80036 (= (bitIndex!0 (size!2085 (buf!2433 (_2!4158 lt!141292))) (currentByte!4854 (_2!4158 lt!141292)) (currentBit!4849 (_2!4158 lt!141292))) (bvadd (bitIndex!0 (size!2085 (buf!2433 thiss!1288)) (currentByte!4854 thiss!1288) (currentBit!4849 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!97549 () Bool)

(declare-fun res!80031 () Bool)

(assert (=> b!97549 (=> (not res!80031) (not e!63898))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97549 (= res!80031 (validate_offset_bits!1 ((_ sign_extend 32) (size!2085 (buf!2433 thiss!1288))) ((_ sign_extend 32) (currentByte!4854 thiss!1288)) ((_ sign_extend 32) (currentBit!4849 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!97550 () Bool)

(assert (=> b!97550 (= e!63898 e!63900)))

(declare-fun res!80034 () Bool)

(assert (=> b!97550 (=> (not res!80034) (not e!63900))))

(assert (=> b!97550 (= res!80034 (= (size!2085 (buf!2433 thiss!1288)) (size!2085 (buf!2433 (_2!4158 lt!141292)))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3644 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7812)

(assert (=> b!97550 (= lt!141292 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(assert (= (and start!19558 res!80032) b!97549))

(assert (= (and b!97549 res!80031) b!97547))

(assert (= (and b!97547 res!80033) b!97550))

(assert (= (and b!97550 res!80034) b!97548))

(assert (= (and b!97548 res!80036) b!97544))

(assert (= (and b!97544 res!80035) b!97545))

(assert (= start!19558 b!97546))

(declare-fun m!141817 () Bool)

(assert (=> b!97549 m!141817))

(declare-fun m!141819 () Bool)

(assert (=> start!19558 m!141819))

(declare-fun m!141821 () Bool)

(assert (=> b!97546 m!141821))

(declare-fun m!141823 () Bool)

(assert (=> b!97547 m!141823))

(declare-fun m!141825 () Bool)

(assert (=> b!97544 m!141825))

(declare-fun m!141827 () Bool)

(assert (=> b!97550 m!141827))

(declare-fun m!141829 () Bool)

(assert (=> b!97545 m!141829))

(declare-fun m!141831 () Bool)

(assert (=> b!97548 m!141831))

(declare-fun m!141833 () Bool)

(assert (=> b!97548 m!141833))

(push 1)

(assert (not b!97549))

(assert (not b!97550))

(assert (not b!97547))

(assert (not start!19558))

(assert (not b!97545))

(assert (not b!97546))

(assert (not b!97544))

(assert (not b!97548))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

