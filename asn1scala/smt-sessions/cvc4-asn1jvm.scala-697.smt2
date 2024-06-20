; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19576 () Bool)

(assert start!19576)

(declare-fun b!97733 () Bool)

(declare-fun res!80196 () Bool)

(declare-fun e!64005 () Bool)

(assert (=> b!97733 (=> (not res!80196) (not e!64005))))

(declare-datatypes ((array!4580 0))(
  ( (array!4581 (arr!2687 (Array (_ BitVec 32) (_ BitVec 8))) (size!2094 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3662 0))(
  ( (BitStream!3663 (buf!2442 array!4580) (currentByte!4863 (_ BitVec 32)) (currentBit!4858 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3662)

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97733 (= res!80196 (validate_offset_bits!1 ((_ sign_extend 32) (size!2094 (buf!2442 thiss!1288))) ((_ sign_extend 32) (currentByte!4863 thiss!1288)) ((_ sign_extend 32) (currentBit!4858 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!97734 () Bool)

(declare-fun e!64007 () Bool)

(declare-fun array_inv!1896 (array!4580) Bool)

(assert (=> b!97734 (= e!64007 (array_inv!1896 (buf!2442 thiss!1288)))))

(declare-fun b!97735 () Bool)

(declare-fun res!80198 () Bool)

(declare-fun e!64006 () Bool)

(assert (=> b!97735 (=> (not res!80198) (not e!64006))))

(declare-datatypes ((Unit!5958 0))(
  ( (Unit!5959) )
))
(declare-datatypes ((tuple2!7848 0))(
  ( (tuple2!7849 (_1!4176 Unit!5958) (_2!4176 BitStream!3662)) )
))
(declare-fun lt!141353 () tuple2!7848)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97735 (= res!80198 (= (bitIndex!0 (size!2094 (buf!2442 (_2!4176 lt!141353))) (currentByte!4863 (_2!4176 lt!141353)) (currentBit!4858 (_2!4176 lt!141353))) (bvadd (bitIndex!0 (size!2094 (buf!2442 thiss!1288)) (currentByte!4863 thiss!1288) (currentBit!4858 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!97736 () Bool)

(declare-fun res!80194 () Bool)

(assert (=> b!97736 (=> (not res!80194) (not e!64006))))

(declare-fun isPrefixOf!0 (BitStream!3662 BitStream!3662) Bool)

(assert (=> b!97736 (= res!80194 (isPrefixOf!0 thiss!1288 (_2!4176 lt!141353)))))

(declare-fun b!97737 () Bool)

(declare-fun res!80197 () Bool)

(assert (=> b!97737 (=> (not res!80197) (not e!64005))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97737 (= res!80197 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!97738 () Bool)

(assert (=> b!97738 (= e!64005 e!64006)))

(declare-fun res!80195 () Bool)

(assert (=> b!97738 (=> (not res!80195) (not e!64006))))

(assert (=> b!97738 (= res!80195 (= (size!2094 (buf!2442 thiss!1288)) (size!2094 (buf!2442 (_2!4176 lt!141353)))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3662 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7848)

(assert (=> b!97738 (= lt!141353 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!97739 () Bool)

(assert (=> b!97739 (= e!64006 (not true))))

(assert (=> b!97739 (validate_offset_bits!1 ((_ sign_extend 32) (size!2094 (buf!2442 (_2!4176 lt!141353)))) ((_ sign_extend 32) (currentByte!4863 thiss!1288)) ((_ sign_extend 32) (currentBit!4858 thiss!1288)) ((_ sign_extend 32) nBits!388))))

(declare-fun lt!141355 () Unit!5958)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3662 array!4580 (_ BitVec 64)) Unit!5958)

(assert (=> b!97739 (= lt!141355 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2442 (_2!4176 lt!141353)) ((_ sign_extend 32) nBits!388)))))

(declare-datatypes ((tuple2!7850 0))(
  ( (tuple2!7851 (_1!4177 BitStream!3662) (_2!4177 BitStream!3662)) )
))
(declare-fun lt!141354 () tuple2!7850)

(declare-fun reader!0 (BitStream!3662 BitStream!3662) tuple2!7850)

(assert (=> b!97739 (= lt!141354 (reader!0 thiss!1288 (_2!4176 lt!141353)))))

(declare-fun res!80193 () Bool)

(assert (=> start!19576 (=> (not res!80193) (not e!64005))))

(assert (=> start!19576 (= res!80193 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19576 e!64005))

(assert (=> start!19576 true))

(declare-fun inv!12 (BitStream!3662) Bool)

(assert (=> start!19576 (and (inv!12 thiss!1288) e!64007)))

(assert (= (and start!19576 res!80193) b!97733))

(assert (= (and b!97733 res!80196) b!97737))

(assert (= (and b!97737 res!80197) b!97738))

(assert (= (and b!97738 res!80195) b!97735))

(assert (= (and b!97735 res!80198) b!97736))

(assert (= (and b!97736 res!80194) b!97739))

(assert (= start!19576 b!97734))

(declare-fun m!141987 () Bool)

(assert (=> b!97734 m!141987))

(declare-fun m!141989 () Bool)

(assert (=> b!97733 m!141989))

(declare-fun m!141991 () Bool)

(assert (=> b!97736 m!141991))

(declare-fun m!141993 () Bool)

(assert (=> start!19576 m!141993))

(declare-fun m!141995 () Bool)

(assert (=> b!97735 m!141995))

(declare-fun m!141997 () Bool)

(assert (=> b!97735 m!141997))

(declare-fun m!141999 () Bool)

(assert (=> b!97739 m!141999))

(declare-fun m!142001 () Bool)

(assert (=> b!97739 m!142001))

(declare-fun m!142003 () Bool)

(assert (=> b!97739 m!142003))

(declare-fun m!142005 () Bool)

(assert (=> b!97738 m!142005))

(declare-fun m!142007 () Bool)

(assert (=> b!97737 m!142007))

(push 1)

