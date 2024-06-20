; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19684 () Bool)

(assert start!19684)

(declare-fun b!98252 () Bool)

(declare-fun res!80595 () Bool)

(declare-fun e!64288 () Bool)

(assert (=> b!98252 (=> (not res!80595) (not e!64288))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98252 (= res!80595 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!98253 () Bool)

(declare-fun res!80598 () Bool)

(declare-fun e!64290 () Bool)

(assert (=> b!98253 (=> (not res!80598) (not e!64290))))

(declare-datatypes ((array!4604 0))(
  ( (array!4605 (arr!2696 (Array (_ BitVec 32) (_ BitVec 8))) (size!2103 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3680 0))(
  ( (BitStream!3681 (buf!2454 array!4604) (currentByte!4884 (_ BitVec 32)) (currentBit!4879 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3680)

(declare-datatypes ((Unit!6015 0))(
  ( (Unit!6016) )
))
(declare-datatypes ((tuple2!7908 0))(
  ( (tuple2!7909 (_1!4206 Unit!6015) (_2!4206 BitStream!3680)) )
))
(declare-fun lt!142543 () tuple2!7908)

(declare-fun isPrefixOf!0 (BitStream!3680 BitStream!3680) Bool)

(assert (=> b!98253 (= res!80598 (isPrefixOf!0 thiss!1288 (_2!4206 lt!142543)))))

(declare-fun b!98254 () Bool)

(assert (=> b!98254 (= e!64288 e!64290)))

(declare-fun res!80597 () Bool)

(assert (=> b!98254 (=> (not res!80597) (not e!64290))))

(assert (=> b!98254 (= res!80597 (= (size!2103 (buf!2454 thiss!1288)) (size!2103 (buf!2454 (_2!4206 lt!142543)))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3680 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7908)

(assert (=> b!98254 (= lt!142543 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun res!80600 () Bool)

(assert (=> start!19684 (=> (not res!80600) (not e!64288))))

(assert (=> start!19684 (= res!80600 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19684 e!64288))

(assert (=> start!19684 true))

(declare-fun e!64287 () Bool)

(declare-fun inv!12 (BitStream!3680) Bool)

(assert (=> start!19684 (and (inv!12 thiss!1288) e!64287)))

(declare-fun b!98255 () Bool)

(declare-fun array_inv!1905 (array!4604) Bool)

(assert (=> b!98255 (= e!64287 (array_inv!1905 (buf!2454 thiss!1288)))))

(declare-fun b!98256 () Bool)

(declare-fun res!80599 () Bool)

(assert (=> b!98256 (=> (not res!80599) (not e!64290))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98256 (= res!80599 (= (bitIndex!0 (size!2103 (buf!2454 (_2!4206 lt!142543))) (currentByte!4884 (_2!4206 lt!142543)) (currentBit!4879 (_2!4206 lt!142543))) (bvadd (bitIndex!0 (size!2103 (buf!2454 thiss!1288)) (currentByte!4884 thiss!1288) (currentBit!4879 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!98257 () Bool)

(declare-fun res!80596 () Bool)

(assert (=> b!98257 (=> (not res!80596) (not e!64288))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!98257 (= res!80596 (validate_offset_bits!1 ((_ sign_extend 32) (size!2103 (buf!2454 thiss!1288))) ((_ sign_extend 32) (currentByte!4884 thiss!1288)) ((_ sign_extend 32) (currentBit!4879 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!98258 () Bool)

(assert (=> b!98258 (= e!64290 false)))

(declare-datatypes ((tuple2!7910 0))(
  ( (tuple2!7911 (_1!4207 BitStream!3680) (_2!4207 BitStream!3680)) )
))
(declare-fun lt!142542 () tuple2!7910)

(declare-fun reader!0 (BitStream!3680 BitStream!3680) tuple2!7910)

(assert (=> b!98258 (= lt!142542 (reader!0 thiss!1288 (_2!4206 lt!142543)))))

(assert (= (and start!19684 res!80600) b!98257))

(assert (= (and b!98257 res!80596) b!98252))

(assert (= (and b!98252 res!80595) b!98254))

(assert (= (and b!98254 res!80597) b!98256))

(assert (= (and b!98256 res!80599) b!98253))

(assert (= (and b!98253 res!80598) b!98258))

(assert (= start!19684 b!98255))

(declare-fun m!142795 () Bool)

(assert (=> b!98253 m!142795))

(declare-fun m!142797 () Bool)

(assert (=> b!98257 m!142797))

(declare-fun m!142799 () Bool)

(assert (=> b!98254 m!142799))

(declare-fun m!142801 () Bool)

(assert (=> b!98256 m!142801))

(declare-fun m!142803 () Bool)

(assert (=> b!98256 m!142803))

(declare-fun m!142805 () Bool)

(assert (=> start!19684 m!142805))

(declare-fun m!142807 () Bool)

(assert (=> b!98252 m!142807))

(declare-fun m!142809 () Bool)

(assert (=> b!98255 m!142809))

(declare-fun m!142811 () Bool)

(assert (=> b!98258 m!142811))

(push 1)

(assert (not b!98257))

(assert (not b!98252))

(assert (not b!98253))

(assert (not b!98254))

(assert (not b!98256))

(assert (not b!98258))

(assert (not start!19684))

(assert (not b!98255))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

