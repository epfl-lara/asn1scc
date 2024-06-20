; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19680 () Bool)

(assert start!19680)

(declare-fun b!98210 () Bool)

(declare-fun res!80564 () Bool)

(declare-fun e!64264 () Bool)

(assert (=> b!98210 (=> (not res!80564) (not e!64264))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98210 (= res!80564 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!98211 () Bool)

(declare-fun res!80561 () Bool)

(declare-fun e!64263 () Bool)

(assert (=> b!98211 (=> (not res!80561) (not e!64263))))

(declare-datatypes ((array!4600 0))(
  ( (array!4601 (arr!2694 (Array (_ BitVec 32) (_ BitVec 8))) (size!2101 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3676 0))(
  ( (BitStream!3677 (buf!2452 array!4600) (currentByte!4882 (_ BitVec 32)) (currentBit!4877 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6011 0))(
  ( (Unit!6012) )
))
(declare-datatypes ((tuple2!7900 0))(
  ( (tuple2!7901 (_1!4202 Unit!6011) (_2!4202 BitStream!3676)) )
))
(declare-fun lt!142530 () tuple2!7900)

(declare-fun thiss!1288 () BitStream!3676)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98211 (= res!80561 (= (bitIndex!0 (size!2101 (buf!2452 (_2!4202 lt!142530))) (currentByte!4882 (_2!4202 lt!142530)) (currentBit!4877 (_2!4202 lt!142530))) (bvadd (bitIndex!0 (size!2101 (buf!2452 thiss!1288)) (currentByte!4882 thiss!1288) (currentBit!4877 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!98212 () Bool)

(assert (=> b!98212 (= e!64263 false)))

(declare-datatypes ((tuple2!7902 0))(
  ( (tuple2!7903 (_1!4203 BitStream!3676) (_2!4203 BitStream!3676)) )
))
(declare-fun lt!142531 () tuple2!7902)

(declare-fun reader!0 (BitStream!3676 BitStream!3676) tuple2!7902)

(assert (=> b!98212 (= lt!142531 (reader!0 thiss!1288 (_2!4202 lt!142530)))))

(declare-fun b!98213 () Bool)

(assert (=> b!98213 (= e!64264 e!64263)))

(declare-fun res!80563 () Bool)

(assert (=> b!98213 (=> (not res!80563) (not e!64263))))

(assert (=> b!98213 (= res!80563 (= (size!2101 (buf!2452 thiss!1288)) (size!2101 (buf!2452 (_2!4202 lt!142530)))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3676 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7900)

(assert (=> b!98213 (= lt!142530 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!98214 () Bool)

(declare-fun res!80562 () Bool)

(assert (=> b!98214 (=> (not res!80562) (not e!64264))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!98214 (= res!80562 (validate_offset_bits!1 ((_ sign_extend 32) (size!2101 (buf!2452 thiss!1288))) ((_ sign_extend 32) (currentByte!4882 thiss!1288)) ((_ sign_extend 32) (currentBit!4877 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!98215 () Bool)

(declare-fun res!80559 () Bool)

(assert (=> b!98215 (=> (not res!80559) (not e!64263))))

(declare-fun isPrefixOf!0 (BitStream!3676 BitStream!3676) Bool)

(assert (=> b!98215 (= res!80559 (isPrefixOf!0 thiss!1288 (_2!4202 lt!142530)))))

(declare-fun b!98216 () Bool)

(declare-fun e!64265 () Bool)

(declare-fun array_inv!1903 (array!4600) Bool)

(assert (=> b!98216 (= e!64265 (array_inv!1903 (buf!2452 thiss!1288)))))

(declare-fun res!80560 () Bool)

(assert (=> start!19680 (=> (not res!80560) (not e!64264))))

(assert (=> start!19680 (= res!80560 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19680 e!64264))

(assert (=> start!19680 true))

(declare-fun inv!12 (BitStream!3676) Bool)

(assert (=> start!19680 (and (inv!12 thiss!1288) e!64265)))

(assert (= (and start!19680 res!80560) b!98214))

(assert (= (and b!98214 res!80562) b!98210))

(assert (= (and b!98210 res!80564) b!98213))

(assert (= (and b!98213 res!80563) b!98211))

(assert (= (and b!98211 res!80561) b!98215))

(assert (= (and b!98215 res!80559) b!98212))

(assert (= start!19680 b!98216))

(declare-fun m!142759 () Bool)

(assert (=> b!98212 m!142759))

(declare-fun m!142761 () Bool)

(assert (=> b!98216 m!142761))

(declare-fun m!142763 () Bool)

(assert (=> b!98213 m!142763))

(declare-fun m!142765 () Bool)

(assert (=> b!98210 m!142765))

(declare-fun m!142767 () Bool)

(assert (=> b!98214 m!142767))

(declare-fun m!142769 () Bool)

(assert (=> b!98211 m!142769))

(declare-fun m!142771 () Bool)

(assert (=> b!98211 m!142771))

(declare-fun m!142773 () Bool)

(assert (=> b!98215 m!142773))

(declare-fun m!142775 () Bool)

(assert (=> start!19680 m!142775))

(push 1)

(assert (not b!98215))

(assert (not b!98211))

(assert (not b!98214))

(assert (not b!98216))

(assert (not start!19680))

(assert (not b!98210))

(assert (not b!98212))

(assert (not b!98213))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

