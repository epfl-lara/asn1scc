; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52418 () Bool)

(assert start!52418)

(declare-fun b!241195 () Bool)

(declare-fun e!167168 () Bool)

(assert (=> b!241195 (= e!167168 (not true))))

(declare-fun lt!376796 () (_ BitVec 64))

(declare-datatypes ((array!13229 0))(
  ( (array!13230 (arr!6781 (Array (_ BitVec 32) (_ BitVec 8))) (size!5794 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10510 0))(
  ( (BitStream!10511 (buf!6260 array!13229) (currentByte!11623 (_ BitVec 32)) (currentBit!11618 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17671 0))(
  ( (Unit!17672) )
))
(declare-datatypes ((tuple2!20556 0))(
  ( (tuple2!20557 (_1!11200 Unit!17671) (_2!11200 BitStream!10510)) )
))
(declare-fun lt!376798 () tuple2!20556)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241195 (= lt!376796 (bitIndex!0 (size!5794 (buf!6260 (_2!11200 lt!376798))) (currentByte!11623 (_2!11200 lt!376798)) (currentBit!11618 (_2!11200 lt!376798))))))

(declare-fun lt!376799 () (_ BitVec 64))

(declare-fun thiss!1005 () BitStream!10510)

(assert (=> b!241195 (= lt!376799 (bitIndex!0 (size!5794 (buf!6260 thiss!1005)) (currentByte!11623 thiss!1005) (currentBit!11618 thiss!1005)))))

(declare-fun e!167167 () Bool)

(assert (=> b!241195 e!167167))

(declare-fun res!201337 () Bool)

(assert (=> b!241195 (=> (not res!201337) (not e!167167))))

(assert (=> b!241195 (= res!201337 (= (size!5794 (buf!6260 thiss!1005)) (size!5794 (buf!6260 (_2!11200 lt!376798)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10510 Bool) tuple2!20556)

(assert (=> b!241195 (= lt!376798 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!241196 () Bool)

(declare-fun res!201334 () Bool)

(assert (=> b!241196 (=> (not res!201334) (not e!167168))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241196 (= res!201334 (validate_offset_bits!1 ((_ sign_extend 32) (size!5794 (buf!6260 thiss!1005))) ((_ sign_extend 32) (currentByte!11623 thiss!1005)) ((_ sign_extend 32) (currentBit!11618 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241197 () Bool)

(declare-fun res!201333 () Bool)

(assert (=> b!241197 (=> (not res!201333) (not e!167168))))

(assert (=> b!241197 (= res!201333 (bvslt from!289 nBits!297))))

(declare-fun b!241198 () Bool)

(declare-fun e!167165 () Bool)

(assert (=> b!241198 (= e!167167 e!167165)))

(declare-fun res!201335 () Bool)

(assert (=> b!241198 (=> (not res!201335) (not e!167165))))

(declare-fun lt!376800 () (_ BitVec 64))

(declare-fun lt!376797 () (_ BitVec 64))

(assert (=> b!241198 (= res!201335 (= lt!376800 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!376797)))))

(assert (=> b!241198 (= lt!376800 (bitIndex!0 (size!5794 (buf!6260 (_2!11200 lt!376798))) (currentByte!11623 (_2!11200 lt!376798)) (currentBit!11618 (_2!11200 lt!376798))))))

(assert (=> b!241198 (= lt!376797 (bitIndex!0 (size!5794 (buf!6260 thiss!1005)) (currentByte!11623 thiss!1005) (currentBit!11618 thiss!1005)))))

(declare-fun b!241199 () Bool)

(declare-fun e!167166 () Bool)

(declare-datatypes ((tuple2!20558 0))(
  ( (tuple2!20559 (_1!11201 BitStream!10510) (_2!11201 Bool)) )
))
(declare-fun lt!376795 () tuple2!20558)

(assert (=> b!241199 (= e!167166 (= (bitIndex!0 (size!5794 (buf!6260 (_1!11201 lt!376795))) (currentByte!11623 (_1!11201 lt!376795)) (currentBit!11618 (_1!11201 lt!376795))) lt!376800))))

(declare-fun res!201338 () Bool)

(assert (=> start!52418 (=> (not res!201338) (not e!167168))))

(assert (=> start!52418 (= res!201338 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52418 e!167168))

(assert (=> start!52418 true))

(declare-fun e!167164 () Bool)

(declare-fun inv!12 (BitStream!10510) Bool)

(assert (=> start!52418 (and (inv!12 thiss!1005) e!167164)))

(declare-fun b!241200 () Bool)

(assert (=> b!241200 (= e!167165 e!167166)))

(declare-fun res!201336 () Bool)

(assert (=> b!241200 (=> (not res!201336) (not e!167166))))

(assert (=> b!241200 (= res!201336 (and (= (_2!11201 lt!376795) bit!26) (= (_1!11201 lt!376795) (_2!11200 lt!376798))))))

(declare-fun readBitPure!0 (BitStream!10510) tuple2!20558)

(declare-fun readerFrom!0 (BitStream!10510 (_ BitVec 32) (_ BitVec 32)) BitStream!10510)

(assert (=> b!241200 (= lt!376795 (readBitPure!0 (readerFrom!0 (_2!11200 lt!376798) (currentBit!11618 thiss!1005) (currentByte!11623 thiss!1005))))))

(declare-fun b!241201 () Bool)

(declare-fun res!201339 () Bool)

(assert (=> b!241201 (=> (not res!201339) (not e!167165))))

(declare-fun isPrefixOf!0 (BitStream!10510 BitStream!10510) Bool)

(assert (=> b!241201 (= res!201339 (isPrefixOf!0 thiss!1005 (_2!11200 lt!376798)))))

(declare-fun b!241202 () Bool)

(declare-fun array_inv!5535 (array!13229) Bool)

(assert (=> b!241202 (= e!167164 (array_inv!5535 (buf!6260 thiss!1005)))))

(assert (= (and start!52418 res!201338) b!241196))

(assert (= (and b!241196 res!201334) b!241197))

(assert (= (and b!241197 res!201333) b!241195))

(assert (= (and b!241195 res!201337) b!241198))

(assert (= (and b!241198 res!201335) b!241201))

(assert (= (and b!241201 res!201339) b!241200))

(assert (= (and b!241200 res!201336) b!241199))

(assert (= start!52418 b!241202))

(declare-fun m!363911 () Bool)

(assert (=> b!241196 m!363911))

(declare-fun m!363913 () Bool)

(assert (=> b!241199 m!363913))

(declare-fun m!363915 () Bool)

(assert (=> b!241201 m!363915))

(declare-fun m!363917 () Bool)

(assert (=> b!241198 m!363917))

(declare-fun m!363919 () Bool)

(assert (=> b!241198 m!363919))

(declare-fun m!363921 () Bool)

(assert (=> b!241202 m!363921))

(declare-fun m!363923 () Bool)

(assert (=> b!241200 m!363923))

(assert (=> b!241200 m!363923))

(declare-fun m!363925 () Bool)

(assert (=> b!241200 m!363925))

(declare-fun m!363927 () Bool)

(assert (=> start!52418 m!363927))

(assert (=> b!241195 m!363917))

(assert (=> b!241195 m!363919))

(declare-fun m!363929 () Bool)

(assert (=> b!241195 m!363929))

(push 1)

(assert (not b!241196))

(assert (not b!241198))

(assert (not b!241200))

(assert (not b!241199))

(assert (not b!241202))

(assert (not start!52418))

(assert (not b!241201))

(assert (not b!241195))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

