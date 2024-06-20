; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19560 () Bool)

(assert start!19560)

(declare-fun b!97565 () Bool)

(declare-fun res!80049 () Bool)

(declare-fun e!63911 () Bool)

(assert (=> b!97565 (=> (not res!80049) (not e!63911))))

(declare-datatypes ((array!4564 0))(
  ( (array!4565 (arr!2679 (Array (_ BitVec 32) (_ BitVec 8))) (size!2086 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3646 0))(
  ( (BitStream!3647 (buf!2434 array!4564) (currentByte!4855 (_ BitVec 32)) (currentBit!4850 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3646)

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97565 (= res!80049 (validate_offset_bits!1 ((_ sign_extend 32) (size!2086 (buf!2434 thiss!1288))) ((_ sign_extend 32) (currentByte!4855 thiss!1288)) ((_ sign_extend 32) (currentBit!4850 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!97566 () Bool)

(declare-fun e!63912 () Bool)

(assert (=> b!97566 (= e!63912 false)))

(declare-datatypes ((tuple2!7816 0))(
  ( (tuple2!7817 (_1!4160 BitStream!3646) (_2!4160 BitStream!3646)) )
))
(declare-fun lt!141298 () tuple2!7816)

(declare-datatypes ((Unit!5942 0))(
  ( (Unit!5943) )
))
(declare-datatypes ((tuple2!7818 0))(
  ( (tuple2!7819 (_1!4161 Unit!5942) (_2!4161 BitStream!3646)) )
))
(declare-fun lt!141297 () tuple2!7818)

(declare-fun reader!0 (BitStream!3646 BitStream!3646) tuple2!7816)

(assert (=> b!97566 (= lt!141298 (reader!0 thiss!1288 (_2!4161 lt!141297)))))

(declare-fun b!97567 () Bool)

(declare-fun res!80054 () Bool)

(assert (=> b!97567 (=> (not res!80054) (not e!63911))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97567 (= res!80054 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!97568 () Bool)

(declare-fun e!63909 () Bool)

(declare-fun array_inv!1888 (array!4564) Bool)

(assert (=> b!97568 (= e!63909 (array_inv!1888 (buf!2434 thiss!1288)))))

(declare-fun b!97569 () Bool)

(assert (=> b!97569 (= e!63911 e!63912)))

(declare-fun res!80052 () Bool)

(assert (=> b!97569 (=> (not res!80052) (not e!63912))))

(assert (=> b!97569 (= res!80052 (= (size!2086 (buf!2434 thiss!1288)) (size!2086 (buf!2434 (_2!4161 lt!141297)))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3646 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7818)

(assert (=> b!97569 (= lt!141297 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!97570 () Bool)

(declare-fun res!80050 () Bool)

(assert (=> b!97570 (=> (not res!80050) (not e!63912))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97570 (= res!80050 (= (bitIndex!0 (size!2086 (buf!2434 (_2!4161 lt!141297))) (currentByte!4855 (_2!4161 lt!141297)) (currentBit!4850 (_2!4161 lt!141297))) (bvadd (bitIndex!0 (size!2086 (buf!2434 thiss!1288)) (currentByte!4855 thiss!1288) (currentBit!4850 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!97571 () Bool)

(declare-fun res!80053 () Bool)

(assert (=> b!97571 (=> (not res!80053) (not e!63912))))

(declare-fun isPrefixOf!0 (BitStream!3646 BitStream!3646) Bool)

(assert (=> b!97571 (= res!80053 (isPrefixOf!0 thiss!1288 (_2!4161 lt!141297)))))

(declare-fun res!80051 () Bool)

(assert (=> start!19560 (=> (not res!80051) (not e!63911))))

(assert (=> start!19560 (= res!80051 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19560 e!63911))

(assert (=> start!19560 true))

(declare-fun inv!12 (BitStream!3646) Bool)

(assert (=> start!19560 (and (inv!12 thiss!1288) e!63909)))

(assert (= (and start!19560 res!80051) b!97565))

(assert (= (and b!97565 res!80049) b!97567))

(assert (= (and b!97567 res!80054) b!97569))

(assert (= (and b!97569 res!80052) b!97570))

(assert (= (and b!97570 res!80050) b!97571))

(assert (= (and b!97571 res!80053) b!97566))

(assert (= start!19560 b!97568))

(declare-fun m!141835 () Bool)

(assert (=> b!97567 m!141835))

(declare-fun m!141837 () Bool)

(assert (=> start!19560 m!141837))

(declare-fun m!141839 () Bool)

(assert (=> b!97566 m!141839))

(declare-fun m!141841 () Bool)

(assert (=> b!97569 m!141841))

(declare-fun m!141843 () Bool)

(assert (=> b!97568 m!141843))

(declare-fun m!141845 () Bool)

(assert (=> b!97570 m!141845))

(declare-fun m!141847 () Bool)

(assert (=> b!97570 m!141847))

(declare-fun m!141849 () Bool)

(assert (=> b!97571 m!141849))

(declare-fun m!141851 () Bool)

(assert (=> b!97565 m!141851))

(push 1)

(assert (not b!97571))

(assert (not b!97567))

(assert (not start!19560))

(assert (not b!97569))

(assert (not b!97565))

(assert (not b!97566))

(assert (not b!97568))

(assert (not b!97570))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

