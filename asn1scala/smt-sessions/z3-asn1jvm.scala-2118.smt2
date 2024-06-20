; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53696 () Bool)

(assert start!53696)

(declare-fun b!249580 () Bool)

(declare-fun res!208883 () Bool)

(declare-fun e!172954 () Bool)

(assert (=> b!249580 (=> (not res!208883) (not e!172954))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!249580 (= res!208883 (bvslt from!289 nBits!297))))

(declare-fun b!249581 () Bool)

(declare-fun e!172957 () Bool)

(declare-fun e!172955 () Bool)

(assert (=> b!249581 (= e!172957 e!172955)))

(declare-fun res!208887 () Bool)

(assert (=> b!249581 (=> (not res!208887) (not e!172955))))

(declare-fun lt!388296 () (_ BitVec 64))

(declare-fun lt!388299 () (_ BitVec 64))

(assert (=> b!249581 (= res!208887 (= lt!388296 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388299)))))

(declare-datatypes ((array!13605 0))(
  ( (array!13606 (arr!6953 (Array (_ BitVec 32) (_ BitVec 8))) (size!5966 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10854 0))(
  ( (BitStream!10855 (buf!6459 array!13605) (currentByte!11890 (_ BitVec 32)) (currentBit!11885 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18068 0))(
  ( (Unit!18069) )
))
(declare-datatypes ((tuple2!21370 0))(
  ( (tuple2!21371 (_1!11610 Unit!18068) (_2!11610 BitStream!10854)) )
))
(declare-fun lt!388298 () tuple2!21370)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249581 (= lt!388296 (bitIndex!0 (size!5966 (buf!6459 (_2!11610 lt!388298))) (currentByte!11890 (_2!11610 lt!388298)) (currentBit!11885 (_2!11610 lt!388298))))))

(declare-fun thiss!1005 () BitStream!10854)

(assert (=> b!249581 (= lt!388299 (bitIndex!0 (size!5966 (buf!6459 thiss!1005)) (currentByte!11890 thiss!1005) (currentBit!11885 thiss!1005)))))

(declare-fun b!249582 () Bool)

(declare-fun e!172956 () Bool)

(declare-fun array_inv!5707 (array!13605) Bool)

(assert (=> b!249582 (= e!172956 (array_inv!5707 (buf!6459 thiss!1005)))))

(declare-fun b!249583 () Bool)

(declare-fun res!208881 () Bool)

(assert (=> b!249583 (=> (not res!208881) (not e!172954))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249583 (= res!208881 (validate_offset_bits!1 ((_ sign_extend 32) (size!5966 (buf!6459 thiss!1005))) ((_ sign_extend 32) (currentByte!11890 thiss!1005)) ((_ sign_extend 32) (currentBit!11885 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!208886 () Bool)

(assert (=> start!53696 (=> (not res!208886) (not e!172954))))

(assert (=> start!53696 (= res!208886 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53696 e!172954))

(assert (=> start!53696 true))

(declare-fun inv!12 (BitStream!10854) Bool)

(assert (=> start!53696 (and (inv!12 thiss!1005) e!172956)))

(declare-fun b!249584 () Bool)

(declare-fun e!172953 () Bool)

(declare-datatypes ((tuple2!21372 0))(
  ( (tuple2!21373 (_1!11611 BitStream!10854) (_2!11611 Bool)) )
))
(declare-fun lt!388297 () tuple2!21372)

(assert (=> b!249584 (= e!172953 (= (bitIndex!0 (size!5966 (buf!6459 (_1!11611 lt!388297))) (currentByte!11890 (_1!11611 lt!388297)) (currentBit!11885 (_1!11611 lt!388297))) lt!388296))))

(declare-fun b!249585 () Bool)

(declare-fun res!208884 () Bool)

(assert (=> b!249585 (=> (not res!208884) (not e!172955))))

(declare-fun isPrefixOf!0 (BitStream!10854 BitStream!10854) Bool)

(assert (=> b!249585 (= res!208884 (isPrefixOf!0 thiss!1005 (_2!11610 lt!388298)))))

(declare-fun b!249586 () Bool)

(assert (=> b!249586 (= e!172954 (not true))))

(assert (=> b!249586 (validate_offset_bits!1 ((_ sign_extend 32) (size!5966 (buf!6459 (_2!11610 lt!388298)))) ((_ sign_extend 32) (currentByte!11890 (_2!11610 lt!388298))) ((_ sign_extend 32) (currentBit!11885 (_2!11610 lt!388298))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388295 () Unit!18068)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10854 BitStream!10854 (_ BitVec 64) (_ BitVec 64)) Unit!18068)

(assert (=> b!249586 (= lt!388295 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11610 lt!388298) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!249586 e!172957))

(declare-fun res!208885 () Bool)

(assert (=> b!249586 (=> (not res!208885) (not e!172957))))

(assert (=> b!249586 (= res!208885 (= (size!5966 (buf!6459 thiss!1005)) (size!5966 (buf!6459 (_2!11610 lt!388298)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10854 Bool) tuple2!21370)

(assert (=> b!249586 (= lt!388298 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249587 () Bool)

(assert (=> b!249587 (= e!172955 e!172953)))

(declare-fun res!208882 () Bool)

(assert (=> b!249587 (=> (not res!208882) (not e!172953))))

(assert (=> b!249587 (= res!208882 (and (= (_2!11611 lt!388297) bit!26) (= (_1!11611 lt!388297) (_2!11610 lt!388298))))))

(declare-fun readBitPure!0 (BitStream!10854) tuple2!21372)

(declare-fun readerFrom!0 (BitStream!10854 (_ BitVec 32) (_ BitVec 32)) BitStream!10854)

(assert (=> b!249587 (= lt!388297 (readBitPure!0 (readerFrom!0 (_2!11610 lt!388298) (currentBit!11885 thiss!1005) (currentByte!11890 thiss!1005))))))

(assert (= (and start!53696 res!208886) b!249583))

(assert (= (and b!249583 res!208881) b!249580))

(assert (= (and b!249580 res!208883) b!249586))

(assert (= (and b!249586 res!208885) b!249581))

(assert (= (and b!249581 res!208887) b!249585))

(assert (= (and b!249585 res!208884) b!249587))

(assert (= (and b!249587 res!208882) b!249584))

(assert (= start!53696 b!249582))

(declare-fun m!375981 () Bool)

(assert (=> start!53696 m!375981))

(declare-fun m!375983 () Bool)

(assert (=> b!249582 m!375983))

(declare-fun m!375985 () Bool)

(assert (=> b!249586 m!375985))

(declare-fun m!375987 () Bool)

(assert (=> b!249586 m!375987))

(declare-fun m!375989 () Bool)

(assert (=> b!249586 m!375989))

(declare-fun m!375991 () Bool)

(assert (=> b!249587 m!375991))

(assert (=> b!249587 m!375991))

(declare-fun m!375993 () Bool)

(assert (=> b!249587 m!375993))

(declare-fun m!375995 () Bool)

(assert (=> b!249581 m!375995))

(declare-fun m!375997 () Bool)

(assert (=> b!249581 m!375997))

(declare-fun m!375999 () Bool)

(assert (=> b!249583 m!375999))

(declare-fun m!376001 () Bool)

(assert (=> b!249584 m!376001))

(declare-fun m!376003 () Bool)

(assert (=> b!249585 m!376003))

(check-sat (not b!249586) (not b!249585) (not b!249581) (not b!249584) (not b!249582) (not b!249583) (not b!249587) (not start!53696))
