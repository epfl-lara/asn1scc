; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53710 () Bool)

(assert start!53710)

(declare-fun b!249756 () Bool)

(declare-fun e!173090 () Bool)

(declare-fun e!173088 () Bool)

(assert (=> b!249756 (= e!173090 (not e!173088))))

(declare-fun res!209041 () Bool)

(assert (=> b!249756 (=> res!209041 e!173088)))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!249756 (= res!209041 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((array!13619 0))(
  ( (array!13620 (arr!6960 (Array (_ BitVec 32) (_ BitVec 8))) (size!5973 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10868 0))(
  ( (BitStream!10869 (buf!6466 array!13619) (currentByte!11897 (_ BitVec 32)) (currentBit!11892 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18082 0))(
  ( (Unit!18083) )
))
(declare-datatypes ((tuple2!21398 0))(
  ( (tuple2!21399 (_1!11624 Unit!18082) (_2!11624 BitStream!10868)) )
))
(declare-fun lt!388402 () tuple2!21398)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249756 (validate_offset_bits!1 ((_ sign_extend 32) (size!5973 (buf!6466 (_2!11624 lt!388402)))) ((_ sign_extend 32) (currentByte!11897 (_2!11624 lt!388402))) ((_ sign_extend 32) (currentBit!11892 (_2!11624 lt!388402))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388401 () Unit!18082)

(declare-fun thiss!1005 () BitStream!10868)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10868 BitStream!10868 (_ BitVec 64) (_ BitVec 64)) Unit!18082)

(assert (=> b!249756 (= lt!388401 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11624 lt!388402) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!173089 () Bool)

(assert (=> b!249756 e!173089))

(declare-fun res!209042 () Bool)

(assert (=> b!249756 (=> (not res!209042) (not e!173089))))

(assert (=> b!249756 (= res!209042 (= (size!5973 (buf!6466 thiss!1005)) (size!5973 (buf!6466 (_2!11624 lt!388402)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10868 Bool) tuple2!21398)

(assert (=> b!249756 (= lt!388402 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249757 () Bool)

(declare-fun e!173093 () Bool)

(declare-datatypes ((tuple2!21400 0))(
  ( (tuple2!21401 (_1!11625 BitStream!10868) (_2!11625 Bool)) )
))
(declare-fun lt!388404 () tuple2!21400)

(declare-fun lt!388400 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249757 (= e!173093 (= (bitIndex!0 (size!5973 (buf!6466 (_1!11625 lt!388404))) (currentByte!11897 (_1!11625 lt!388404)) (currentBit!11892 (_1!11625 lt!388404))) lt!388400))))

(declare-fun b!249758 () Bool)

(declare-fun e!173087 () Bool)

(assert (=> b!249758 (= e!173089 e!173087)))

(declare-fun res!209043 () Bool)

(assert (=> b!249758 (=> (not res!209043) (not e!173087))))

(declare-fun lt!388403 () (_ BitVec 64))

(assert (=> b!249758 (= res!209043 (= lt!388400 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388403)))))

(assert (=> b!249758 (= lt!388400 (bitIndex!0 (size!5973 (buf!6466 (_2!11624 lt!388402))) (currentByte!11897 (_2!11624 lt!388402)) (currentBit!11892 (_2!11624 lt!388402))))))

(assert (=> b!249758 (= lt!388403 (bitIndex!0 (size!5973 (buf!6466 thiss!1005)) (currentByte!11897 thiss!1005) (currentBit!11892 thiss!1005)))))

(declare-fun b!249759 () Bool)

(assert (=> b!249759 (= e!173088 (validate_offset_bits!1 ((_ sign_extend 32) (size!5973 (buf!6466 (_2!11624 lt!388402)))) ((_ sign_extend 32) (currentByte!11897 (_2!11624 lt!388402))) ((_ sign_extend 32) (currentBit!11892 (_2!11624 lt!388402))) (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))))))

(declare-fun b!249760 () Bool)

(declare-fun res!209040 () Bool)

(assert (=> b!249760 (=> (not res!209040) (not e!173087))))

(declare-fun isPrefixOf!0 (BitStream!10868 BitStream!10868) Bool)

(assert (=> b!249760 (= res!209040 (isPrefixOf!0 thiss!1005 (_2!11624 lt!388402)))))

(declare-fun b!249761 () Bool)

(declare-fun res!209039 () Bool)

(assert (=> b!249761 (=> (not res!209039) (not e!173090))))

(assert (=> b!249761 (= res!209039 (validate_offset_bits!1 ((_ sign_extend 32) (size!5973 (buf!6466 thiss!1005))) ((_ sign_extend 32) (currentByte!11897 thiss!1005)) ((_ sign_extend 32) (currentBit!11892 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249762 () Bool)

(assert (=> b!249762 (= e!173087 e!173093)))

(declare-fun res!209036 () Bool)

(assert (=> b!249762 (=> (not res!209036) (not e!173093))))

(assert (=> b!249762 (= res!209036 (and (= (_2!11625 lt!388404) bit!26) (= (_1!11625 lt!388404) (_2!11624 lt!388402))))))

(declare-fun readBitPure!0 (BitStream!10868) tuple2!21400)

(declare-fun readerFrom!0 (BitStream!10868 (_ BitVec 32) (_ BitVec 32)) BitStream!10868)

(assert (=> b!249762 (= lt!388404 (readBitPure!0 (readerFrom!0 (_2!11624 lt!388402) (currentBit!11892 thiss!1005) (currentByte!11897 thiss!1005))))))

(declare-fun res!209037 () Bool)

(assert (=> start!53710 (=> (not res!209037) (not e!173090))))

(assert (=> start!53710 (= res!209037 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53710 e!173090))

(assert (=> start!53710 true))

(declare-fun e!173091 () Bool)

(declare-fun inv!12 (BitStream!10868) Bool)

(assert (=> start!53710 (and (inv!12 thiss!1005) e!173091)))

(declare-fun b!249763 () Bool)

(declare-fun array_inv!5714 (array!13619) Bool)

(assert (=> b!249763 (= e!173091 (array_inv!5714 (buf!6466 thiss!1005)))))

(declare-fun b!249764 () Bool)

(declare-fun res!209038 () Bool)

(assert (=> b!249764 (=> (not res!209038) (not e!173090))))

(assert (=> b!249764 (= res!209038 (bvslt from!289 nBits!297))))

(assert (= (and start!53710 res!209037) b!249761))

(assert (= (and b!249761 res!209039) b!249764))

(assert (= (and b!249764 res!209038) b!249756))

(assert (= (and b!249756 res!209042) b!249758))

(assert (= (and b!249758 res!209043) b!249760))

(assert (= (and b!249760 res!209040) b!249762))

(assert (= (and b!249762 res!209036) b!249757))

(assert (= (and b!249756 (not res!209041)) b!249759))

(assert (= start!53710 b!249763))

(declare-fun m!376153 () Bool)

(assert (=> b!249763 m!376153))

(declare-fun m!376155 () Bool)

(assert (=> b!249760 m!376155))

(declare-fun m!376157 () Bool)

(assert (=> b!249761 m!376157))

(declare-fun m!376159 () Bool)

(assert (=> b!249756 m!376159))

(declare-fun m!376161 () Bool)

(assert (=> b!249756 m!376161))

(declare-fun m!376163 () Bool)

(assert (=> b!249756 m!376163))

(declare-fun m!376165 () Bool)

(assert (=> b!249757 m!376165))

(declare-fun m!376167 () Bool)

(assert (=> b!249762 m!376167))

(assert (=> b!249762 m!376167))

(declare-fun m!376169 () Bool)

(assert (=> b!249762 m!376169))

(declare-fun m!376171 () Bool)

(assert (=> b!249759 m!376171))

(declare-fun m!376173 () Bool)

(assert (=> start!53710 m!376173))

(declare-fun m!376175 () Bool)

(assert (=> b!249758 m!376175))

(declare-fun m!376177 () Bool)

(assert (=> b!249758 m!376177))

(push 1)

(assert (not b!249758))

(assert (not b!249760))

(assert (not start!53710))

(assert (not b!249761))

(assert (not b!249759))

(assert (not b!249763))

(assert (not b!249762))

(assert (not b!249756))

(assert (not b!249757))

(check-sat)

(pop 1)

(push 1)

(check-sat)

