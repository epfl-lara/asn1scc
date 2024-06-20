; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53694 () Bool)

(assert start!53694)

(declare-fun res!208866 () Bool)

(declare-fun e!172937 () Bool)

(assert (=> start!53694 (=> (not res!208866) (not e!172937))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53694 (= res!208866 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53694 e!172937))

(assert (=> start!53694 true))

(declare-datatypes ((array!13603 0))(
  ( (array!13604 (arr!6952 (Array (_ BitVec 32) (_ BitVec 8))) (size!5965 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10852 0))(
  ( (BitStream!10853 (buf!6458 array!13603) (currentByte!11889 (_ BitVec 32)) (currentBit!11884 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10852)

(declare-fun e!172936 () Bool)

(declare-fun inv!12 (BitStream!10852) Bool)

(assert (=> start!53694 (and (inv!12 thiss!1005) e!172936)))

(declare-fun b!249556 () Bool)

(declare-fun e!172939 () Bool)

(declare-datatypes ((tuple2!21366 0))(
  ( (tuple2!21367 (_1!11608 BitStream!10852) (_2!11608 Bool)) )
))
(declare-fun lt!388282 () tuple2!21366)

(declare-fun lt!388281 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249556 (= e!172939 (= (bitIndex!0 (size!5965 (buf!6458 (_1!11608 lt!388282))) (currentByte!11889 (_1!11608 lt!388282)) (currentBit!11884 (_1!11608 lt!388282))) lt!388281))))

(declare-fun b!249557 () Bool)

(declare-fun array_inv!5706 (array!13603) Bool)

(assert (=> b!249557 (= e!172936 (array_inv!5706 (buf!6458 thiss!1005)))))

(declare-fun b!249558 () Bool)

(declare-fun e!172935 () Bool)

(assert (=> b!249558 (= e!172935 e!172939)))

(declare-fun res!208863 () Bool)

(assert (=> b!249558 (=> (not res!208863) (not e!172939))))

(declare-datatypes ((Unit!18066 0))(
  ( (Unit!18067) )
))
(declare-datatypes ((tuple2!21368 0))(
  ( (tuple2!21369 (_1!11609 Unit!18066) (_2!11609 BitStream!10852)) )
))
(declare-fun lt!388284 () tuple2!21368)

(declare-fun bit!26 () Bool)

(assert (=> b!249558 (= res!208863 (and (= (_2!11608 lt!388282) bit!26) (= (_1!11608 lt!388282) (_2!11609 lt!388284))))))

(declare-fun readBitPure!0 (BitStream!10852) tuple2!21366)

(declare-fun readerFrom!0 (BitStream!10852 (_ BitVec 32) (_ BitVec 32)) BitStream!10852)

(assert (=> b!249558 (= lt!388282 (readBitPure!0 (readerFrom!0 (_2!11609 lt!388284) (currentBit!11884 thiss!1005) (currentByte!11889 thiss!1005))))))

(declare-fun b!249559 () Bool)

(declare-fun e!172940 () Bool)

(assert (=> b!249559 (= e!172940 e!172935)))

(declare-fun res!208861 () Bool)

(assert (=> b!249559 (=> (not res!208861) (not e!172935))))

(declare-fun lt!388280 () (_ BitVec 64))

(assert (=> b!249559 (= res!208861 (= lt!388281 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388280)))))

(assert (=> b!249559 (= lt!388281 (bitIndex!0 (size!5965 (buf!6458 (_2!11609 lt!388284))) (currentByte!11889 (_2!11609 lt!388284)) (currentBit!11884 (_2!11609 lt!388284))))))

(assert (=> b!249559 (= lt!388280 (bitIndex!0 (size!5965 (buf!6458 thiss!1005)) (currentByte!11889 thiss!1005) (currentBit!11884 thiss!1005)))))

(declare-fun b!249560 () Bool)

(declare-fun res!208865 () Bool)

(assert (=> b!249560 (=> (not res!208865) (not e!172937))))

(assert (=> b!249560 (= res!208865 (bvslt from!289 nBits!297))))

(declare-fun b!249561 () Bool)

(declare-fun res!208862 () Bool)

(assert (=> b!249561 (=> (not res!208862) (not e!172935))))

(declare-fun isPrefixOf!0 (BitStream!10852 BitStream!10852) Bool)

(assert (=> b!249561 (= res!208862 (isPrefixOf!0 thiss!1005 (_2!11609 lt!388284)))))

(declare-fun b!249562 () Bool)

(declare-fun res!208864 () Bool)

(assert (=> b!249562 (=> (not res!208864) (not e!172937))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249562 (= res!208864 (validate_offset_bits!1 ((_ sign_extend 32) (size!5965 (buf!6458 thiss!1005))) ((_ sign_extend 32) (currentByte!11889 thiss!1005)) ((_ sign_extend 32) (currentBit!11884 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249563 () Bool)

(assert (=> b!249563 (= e!172937 (not true))))

(assert (=> b!249563 (validate_offset_bits!1 ((_ sign_extend 32) (size!5965 (buf!6458 (_2!11609 lt!388284)))) ((_ sign_extend 32) (currentByte!11889 (_2!11609 lt!388284))) ((_ sign_extend 32) (currentBit!11884 (_2!11609 lt!388284))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388283 () Unit!18066)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10852 BitStream!10852 (_ BitVec 64) (_ BitVec 64)) Unit!18066)

(assert (=> b!249563 (= lt!388283 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11609 lt!388284) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!249563 e!172940))

(declare-fun res!208860 () Bool)

(assert (=> b!249563 (=> (not res!208860) (not e!172940))))

(assert (=> b!249563 (= res!208860 (= (size!5965 (buf!6458 thiss!1005)) (size!5965 (buf!6458 (_2!11609 lt!388284)))))))

(declare-fun appendBit!0 (BitStream!10852 Bool) tuple2!21368)

(assert (=> b!249563 (= lt!388284 (appendBit!0 thiss!1005 bit!26))))

(assert (= (and start!53694 res!208866) b!249562))

(assert (= (and b!249562 res!208864) b!249560))

(assert (= (and b!249560 res!208865) b!249563))

(assert (= (and b!249563 res!208860) b!249559))

(assert (= (and b!249559 res!208861) b!249561))

(assert (= (and b!249561 res!208862) b!249558))

(assert (= (and b!249558 res!208863) b!249556))

(assert (= start!53694 b!249557))

(declare-fun m!375957 () Bool)

(assert (=> b!249561 m!375957))

(declare-fun m!375959 () Bool)

(assert (=> b!249558 m!375959))

(assert (=> b!249558 m!375959))

(declare-fun m!375961 () Bool)

(assert (=> b!249558 m!375961))

(declare-fun m!375963 () Bool)

(assert (=> b!249556 m!375963))

(declare-fun m!375965 () Bool)

(assert (=> b!249559 m!375965))

(declare-fun m!375967 () Bool)

(assert (=> b!249559 m!375967))

(declare-fun m!375969 () Bool)

(assert (=> b!249557 m!375969))

(declare-fun m!375971 () Bool)

(assert (=> start!53694 m!375971))

(declare-fun m!375973 () Bool)

(assert (=> b!249563 m!375973))

(declare-fun m!375975 () Bool)

(assert (=> b!249563 m!375975))

(declare-fun m!375977 () Bool)

(assert (=> b!249563 m!375977))

(declare-fun m!375979 () Bool)

(assert (=> b!249562 m!375979))

(push 1)

(assert (not start!53694))

(assert (not b!249556))

(assert (not b!249557))

(assert (not b!249561))

(assert (not b!249558))

(assert (not b!249559))

(assert (not b!249562))

(assert (not b!249563))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

