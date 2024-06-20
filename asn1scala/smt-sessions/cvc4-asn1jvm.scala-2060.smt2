; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52422 () Bool)

(assert start!52422)

(declare-fun b!241243 () Bool)

(declare-fun e!167202 () Bool)

(declare-datatypes ((array!13233 0))(
  ( (array!13234 (arr!6783 (Array (_ BitVec 32) (_ BitVec 8))) (size!5796 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10514 0))(
  ( (BitStream!10515 (buf!6262 array!13233) (currentByte!11625 (_ BitVec 32)) (currentBit!11620 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20564 0))(
  ( (tuple2!20565 (_1!11204 BitStream!10514) (_2!11204 Bool)) )
))
(declare-fun lt!376835 () tuple2!20564)

(declare-fun lt!376836 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241243 (= e!167202 (= (bitIndex!0 (size!5796 (buf!6262 (_1!11204 lt!376835))) (currentByte!11625 (_1!11204 lt!376835)) (currentBit!11620 (_1!11204 lt!376835))) lt!376836))))

(declare-fun b!241244 () Bool)

(declare-fun res!201375 () Bool)

(declare-fun e!167204 () Bool)

(assert (=> b!241244 (=> (not res!201375) (not e!167204))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!241244 (= res!201375 (bvslt from!289 nBits!297))))

(declare-fun b!241245 () Bool)

(assert (=> b!241245 (= e!167204 (not true))))

(declare-fun lt!376834 () (_ BitVec 64))

(declare-datatypes ((Unit!17675 0))(
  ( (Unit!17676) )
))
(declare-datatypes ((tuple2!20566 0))(
  ( (tuple2!20567 (_1!11205 Unit!17675) (_2!11205 BitStream!10514)) )
))
(declare-fun lt!376832 () tuple2!20566)

(assert (=> b!241245 (= lt!376834 (bitIndex!0 (size!5796 (buf!6262 (_2!11205 lt!376832))) (currentByte!11625 (_2!11205 lt!376832)) (currentBit!11620 (_2!11205 lt!376832))))))

(declare-fun lt!376833 () (_ BitVec 64))

(declare-fun thiss!1005 () BitStream!10514)

(assert (=> b!241245 (= lt!376833 (bitIndex!0 (size!5796 (buf!6262 thiss!1005)) (currentByte!11625 thiss!1005) (currentBit!11620 thiss!1005)))))

(declare-fun e!167199 () Bool)

(assert (=> b!241245 e!167199))

(declare-fun res!201380 () Bool)

(assert (=> b!241245 (=> (not res!201380) (not e!167199))))

(assert (=> b!241245 (= res!201380 (= (size!5796 (buf!6262 thiss!1005)) (size!5796 (buf!6262 (_2!11205 lt!376832)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10514 Bool) tuple2!20566)

(assert (=> b!241245 (= lt!376832 (appendBit!0 thiss!1005 bit!26))))

(declare-fun res!201378 () Bool)

(assert (=> start!52422 (=> (not res!201378) (not e!167204))))

(assert (=> start!52422 (= res!201378 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52422 e!167204))

(assert (=> start!52422 true))

(declare-fun e!167200 () Bool)

(declare-fun inv!12 (BitStream!10514) Bool)

(assert (=> start!52422 (and (inv!12 thiss!1005) e!167200)))

(declare-fun b!241246 () Bool)

(declare-fun res!201379 () Bool)

(declare-fun e!167203 () Bool)

(assert (=> b!241246 (=> (not res!201379) (not e!167203))))

(declare-fun isPrefixOf!0 (BitStream!10514 BitStream!10514) Bool)

(assert (=> b!241246 (= res!201379 (isPrefixOf!0 thiss!1005 (_2!11205 lt!376832)))))

(declare-fun b!241247 () Bool)

(assert (=> b!241247 (= e!167199 e!167203)))

(declare-fun res!201376 () Bool)

(assert (=> b!241247 (=> (not res!201376) (not e!167203))))

(declare-fun lt!376831 () (_ BitVec 64))

(assert (=> b!241247 (= res!201376 (= lt!376836 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!376831)))))

(assert (=> b!241247 (= lt!376836 (bitIndex!0 (size!5796 (buf!6262 (_2!11205 lt!376832))) (currentByte!11625 (_2!11205 lt!376832)) (currentBit!11620 (_2!11205 lt!376832))))))

(assert (=> b!241247 (= lt!376831 (bitIndex!0 (size!5796 (buf!6262 thiss!1005)) (currentByte!11625 thiss!1005) (currentBit!11620 thiss!1005)))))

(declare-fun b!241248 () Bool)

(assert (=> b!241248 (= e!167203 e!167202)))

(declare-fun res!201381 () Bool)

(assert (=> b!241248 (=> (not res!201381) (not e!167202))))

(assert (=> b!241248 (= res!201381 (and (= (_2!11204 lt!376835) bit!26) (= (_1!11204 lt!376835) (_2!11205 lt!376832))))))

(declare-fun readBitPure!0 (BitStream!10514) tuple2!20564)

(declare-fun readerFrom!0 (BitStream!10514 (_ BitVec 32) (_ BitVec 32)) BitStream!10514)

(assert (=> b!241248 (= lt!376835 (readBitPure!0 (readerFrom!0 (_2!11205 lt!376832) (currentBit!11620 thiss!1005) (currentByte!11625 thiss!1005))))))

(declare-fun b!241249 () Bool)

(declare-fun array_inv!5537 (array!13233) Bool)

(assert (=> b!241249 (= e!167200 (array_inv!5537 (buf!6262 thiss!1005)))))

(declare-fun b!241250 () Bool)

(declare-fun res!201377 () Bool)

(assert (=> b!241250 (=> (not res!201377) (not e!167204))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241250 (= res!201377 (validate_offset_bits!1 ((_ sign_extend 32) (size!5796 (buf!6262 thiss!1005))) ((_ sign_extend 32) (currentByte!11625 thiss!1005)) ((_ sign_extend 32) (currentBit!11620 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!52422 res!201378) b!241250))

(assert (= (and b!241250 res!201377) b!241244))

(assert (= (and b!241244 res!201375) b!241245))

(assert (= (and b!241245 res!201380) b!241247))

(assert (= (and b!241247 res!201376) b!241246))

(assert (= (and b!241246 res!201379) b!241248))

(assert (= (and b!241248 res!201381) b!241243))

(assert (= start!52422 b!241249))

(declare-fun m!363951 () Bool)

(assert (=> start!52422 m!363951))

(declare-fun m!363953 () Bool)

(assert (=> b!241250 m!363953))

(declare-fun m!363955 () Bool)

(assert (=> b!241249 m!363955))

(declare-fun m!363957 () Bool)

(assert (=> b!241245 m!363957))

(declare-fun m!363959 () Bool)

(assert (=> b!241245 m!363959))

(declare-fun m!363961 () Bool)

(assert (=> b!241245 m!363961))

(assert (=> b!241247 m!363957))

(assert (=> b!241247 m!363959))

(declare-fun m!363963 () Bool)

(assert (=> b!241243 m!363963))

(declare-fun m!363965 () Bool)

(assert (=> b!241248 m!363965))

(assert (=> b!241248 m!363965))

(declare-fun m!363967 () Bool)

(assert (=> b!241248 m!363967))

(declare-fun m!363969 () Bool)

(assert (=> b!241246 m!363969))

(push 1)

(assert (not b!241247))

(assert (not start!52422))

(assert (not b!241245))

(assert (not b!241250))

(assert (not b!241249))

(assert (not b!241246))

(assert (not b!241248))

(assert (not b!241243))

