; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53690 () Bool)

(assert start!53690)

(declare-fun b!249508 () Bool)

(declare-fun e!172903 () Bool)

(declare-fun e!172901 () Bool)

(assert (=> b!249508 (= e!172903 e!172901)))

(declare-fun res!208823 () Bool)

(assert (=> b!249508 (=> (not res!208823) (not e!172901))))

(declare-datatypes ((array!13599 0))(
  ( (array!13600 (arr!6950 (Array (_ BitVec 32) (_ BitVec 8))) (size!5963 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10848 0))(
  ( (BitStream!10849 (buf!6456 array!13599) (currentByte!11887 (_ BitVec 32)) (currentBit!11882 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18062 0))(
  ( (Unit!18063) )
))
(declare-datatypes ((tuple2!21358 0))(
  ( (tuple2!21359 (_1!11604 Unit!18062) (_2!11604 BitStream!10848)) )
))
(declare-fun lt!388253 () tuple2!21358)

(declare-datatypes ((tuple2!21360 0))(
  ( (tuple2!21361 (_1!11605 BitStream!10848) (_2!11605 Bool)) )
))
(declare-fun lt!388251 () tuple2!21360)

(declare-fun bit!26 () Bool)

(assert (=> b!249508 (= res!208823 (and (= (_2!11605 lt!388251) bit!26) (= (_1!11605 lt!388251) (_2!11604 lt!388253))))))

(declare-fun thiss!1005 () BitStream!10848)

(declare-fun readBitPure!0 (BitStream!10848) tuple2!21360)

(declare-fun readerFrom!0 (BitStream!10848 (_ BitVec 32) (_ BitVec 32)) BitStream!10848)

(assert (=> b!249508 (= lt!388251 (readBitPure!0 (readerFrom!0 (_2!11604 lt!388253) (currentBit!11882 thiss!1005) (currentByte!11887 thiss!1005))))))

(declare-fun b!249509 () Bool)

(declare-fun res!208822 () Bool)

(declare-fun e!172899 () Bool)

(assert (=> b!249509 (=> (not res!208822) (not e!172899))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!249509 (= res!208822 (bvslt from!289 nBits!297))))

(declare-fun b!249510 () Bool)

(declare-fun lt!388254 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249510 (= e!172901 (= (bitIndex!0 (size!5963 (buf!6456 (_1!11605 lt!388251))) (currentByte!11887 (_1!11605 lt!388251)) (currentBit!11882 (_1!11605 lt!388251))) lt!388254))))

(declare-fun b!249511 () Bool)

(declare-fun e!172904 () Bool)

(assert (=> b!249511 (= e!172904 e!172903)))

(declare-fun res!208820 () Bool)

(assert (=> b!249511 (=> (not res!208820) (not e!172903))))

(declare-fun lt!388250 () (_ BitVec 64))

(assert (=> b!249511 (= res!208820 (= lt!388254 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388250)))))

(assert (=> b!249511 (= lt!388254 (bitIndex!0 (size!5963 (buf!6456 (_2!11604 lt!388253))) (currentByte!11887 (_2!11604 lt!388253)) (currentBit!11882 (_2!11604 lt!388253))))))

(assert (=> b!249511 (= lt!388250 (bitIndex!0 (size!5963 (buf!6456 thiss!1005)) (currentByte!11887 thiss!1005) (currentBit!11882 thiss!1005)))))

(declare-fun b!249512 () Bool)

(declare-fun res!208821 () Bool)

(assert (=> b!249512 (=> (not res!208821) (not e!172899))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249512 (= res!208821 (validate_offset_bits!1 ((_ sign_extend 32) (size!5963 (buf!6456 thiss!1005))) ((_ sign_extend 32) (currentByte!11887 thiss!1005)) ((_ sign_extend 32) (currentBit!11882 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249513 () Bool)

(declare-fun e!172900 () Bool)

(declare-fun array_inv!5704 (array!13599) Bool)

(assert (=> b!249513 (= e!172900 (array_inv!5704 (buf!6456 thiss!1005)))))

(declare-fun b!249514 () Bool)

(assert (=> b!249514 (= e!172899 (not (or (not (= (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!249514 (validate_offset_bits!1 ((_ sign_extend 32) (size!5963 (buf!6456 (_2!11604 lt!388253)))) ((_ sign_extend 32) (currentByte!11887 (_2!11604 lt!388253))) ((_ sign_extend 32) (currentBit!11882 (_2!11604 lt!388253))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388252 () Unit!18062)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10848 BitStream!10848 (_ BitVec 64) (_ BitVec 64)) Unit!18062)

(assert (=> b!249514 (= lt!388252 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11604 lt!388253) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!249514 e!172904))

(declare-fun res!208818 () Bool)

(assert (=> b!249514 (=> (not res!208818) (not e!172904))))

(assert (=> b!249514 (= res!208818 (= (size!5963 (buf!6456 thiss!1005)) (size!5963 (buf!6456 (_2!11604 lt!388253)))))))

(declare-fun appendBit!0 (BitStream!10848 Bool) tuple2!21358)

(assert (=> b!249514 (= lt!388253 (appendBit!0 thiss!1005 bit!26))))

(declare-fun res!208824 () Bool)

(assert (=> start!53690 (=> (not res!208824) (not e!172899))))

(assert (=> start!53690 (= res!208824 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53690 e!172899))

(assert (=> start!53690 true))

(declare-fun inv!12 (BitStream!10848) Bool)

(assert (=> start!53690 (and (inv!12 thiss!1005) e!172900)))

(declare-fun b!249515 () Bool)

(declare-fun res!208819 () Bool)

(assert (=> b!249515 (=> (not res!208819) (not e!172903))))

(declare-fun isPrefixOf!0 (BitStream!10848 BitStream!10848) Bool)

(assert (=> b!249515 (= res!208819 (isPrefixOf!0 thiss!1005 (_2!11604 lt!388253)))))

(assert (= (and start!53690 res!208824) b!249512))

(assert (= (and b!249512 res!208821) b!249509))

(assert (= (and b!249509 res!208822) b!249514))

(assert (= (and b!249514 res!208818) b!249511))

(assert (= (and b!249511 res!208820) b!249515))

(assert (= (and b!249515 res!208819) b!249508))

(assert (= (and b!249508 res!208823) b!249510))

(assert (= start!53690 b!249513))

(declare-fun m!375909 () Bool)

(assert (=> start!53690 m!375909))

(declare-fun m!375911 () Bool)

(assert (=> b!249508 m!375911))

(assert (=> b!249508 m!375911))

(declare-fun m!375913 () Bool)

(assert (=> b!249508 m!375913))

(declare-fun m!375915 () Bool)

(assert (=> b!249513 m!375915))

(declare-fun m!375917 () Bool)

(assert (=> b!249510 m!375917))

(declare-fun m!375919 () Bool)

(assert (=> b!249515 m!375919))

(declare-fun m!375921 () Bool)

(assert (=> b!249511 m!375921))

(declare-fun m!375923 () Bool)

(assert (=> b!249511 m!375923))

(declare-fun m!375925 () Bool)

(assert (=> b!249512 m!375925))

(declare-fun m!375927 () Bool)

(assert (=> b!249514 m!375927))

(declare-fun m!375929 () Bool)

(assert (=> b!249514 m!375929))

(declare-fun m!375931 () Bool)

(assert (=> b!249514 m!375931))

(check-sat (not b!249515) (not b!249508) (not b!249510) (not b!249512) (not b!249514) (not start!53690) (not b!249511) (not b!249513))
(check-sat)
