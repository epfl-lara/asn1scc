; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52424 () Bool)

(assert start!52424)

(declare-fun b!241267 () Bool)

(declare-fun res!201397 () Bool)

(declare-fun e!167222 () Bool)

(assert (=> b!241267 (=> (not res!201397) (not e!167222))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!241267 (= res!201397 (bvslt from!289 nBits!297))))

(declare-fun b!241268 () Bool)

(assert (=> b!241268 (= e!167222 (not true))))

(declare-fun lt!376850 () (_ BitVec 64))

(declare-datatypes ((array!13235 0))(
  ( (array!13236 (arr!6784 (Array (_ BitVec 32) (_ BitVec 8))) (size!5797 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10516 0))(
  ( (BitStream!10517 (buf!6263 array!13235) (currentByte!11626 (_ BitVec 32)) (currentBit!11621 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17677 0))(
  ( (Unit!17678) )
))
(declare-datatypes ((tuple2!20568 0))(
  ( (tuple2!20569 (_1!11206 Unit!17677) (_2!11206 BitStream!10516)) )
))
(declare-fun lt!376849 () tuple2!20568)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241268 (= lt!376850 (bitIndex!0 (size!5797 (buf!6263 (_2!11206 lt!376849))) (currentByte!11626 (_2!11206 lt!376849)) (currentBit!11621 (_2!11206 lt!376849))))))

(declare-fun lt!376851 () (_ BitVec 64))

(declare-fun thiss!1005 () BitStream!10516)

(assert (=> b!241268 (= lt!376851 (bitIndex!0 (size!5797 (buf!6263 thiss!1005)) (currentByte!11626 thiss!1005) (currentBit!11621 thiss!1005)))))

(declare-fun e!167217 () Bool)

(assert (=> b!241268 e!167217))

(declare-fun res!201398 () Bool)

(assert (=> b!241268 (=> (not res!201398) (not e!167217))))

(assert (=> b!241268 (= res!201398 (= (size!5797 (buf!6263 thiss!1005)) (size!5797 (buf!6263 (_2!11206 lt!376849)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10516 Bool) tuple2!20568)

(assert (=> b!241268 (= lt!376849 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!241270 () Bool)

(declare-fun res!201399 () Bool)

(declare-fun e!167220 () Bool)

(assert (=> b!241270 (=> (not res!201399) (not e!167220))))

(declare-fun isPrefixOf!0 (BitStream!10516 BitStream!10516) Bool)

(assert (=> b!241270 (= res!201399 (isPrefixOf!0 thiss!1005 (_2!11206 lt!376849)))))

(declare-fun b!241271 () Bool)

(declare-fun e!167219 () Bool)

(declare-datatypes ((tuple2!20570 0))(
  ( (tuple2!20571 (_1!11207 BitStream!10516) (_2!11207 Bool)) )
))
(declare-fun lt!376854 () tuple2!20570)

(declare-fun lt!376852 () (_ BitVec 64))

(assert (=> b!241271 (= e!167219 (= (bitIndex!0 (size!5797 (buf!6263 (_1!11207 lt!376854))) (currentByte!11626 (_1!11207 lt!376854)) (currentBit!11621 (_1!11207 lt!376854))) lt!376852))))

(declare-fun b!241272 () Bool)

(declare-fun res!201396 () Bool)

(assert (=> b!241272 (=> (not res!201396) (not e!167222))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241272 (= res!201396 (validate_offset_bits!1 ((_ sign_extend 32) (size!5797 (buf!6263 thiss!1005))) ((_ sign_extend 32) (currentByte!11626 thiss!1005)) ((_ sign_extend 32) (currentBit!11621 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241273 () Bool)

(declare-fun e!167221 () Bool)

(declare-fun array_inv!5538 (array!13235) Bool)

(assert (=> b!241273 (= e!167221 (array_inv!5538 (buf!6263 thiss!1005)))))

(declare-fun b!241274 () Bool)

(assert (=> b!241274 (= e!167217 e!167220)))

(declare-fun res!201402 () Bool)

(assert (=> b!241274 (=> (not res!201402) (not e!167220))))

(declare-fun lt!376853 () (_ BitVec 64))

(assert (=> b!241274 (= res!201402 (= lt!376852 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!376853)))))

(assert (=> b!241274 (= lt!376852 (bitIndex!0 (size!5797 (buf!6263 (_2!11206 lt!376849))) (currentByte!11626 (_2!11206 lt!376849)) (currentBit!11621 (_2!11206 lt!376849))))))

(assert (=> b!241274 (= lt!376853 (bitIndex!0 (size!5797 (buf!6263 thiss!1005)) (currentByte!11626 thiss!1005) (currentBit!11621 thiss!1005)))))

(declare-fun res!201401 () Bool)

(assert (=> start!52424 (=> (not res!201401) (not e!167222))))

(assert (=> start!52424 (= res!201401 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52424 e!167222))

(assert (=> start!52424 true))

(declare-fun inv!12 (BitStream!10516) Bool)

(assert (=> start!52424 (and (inv!12 thiss!1005) e!167221)))

(declare-fun b!241269 () Bool)

(assert (=> b!241269 (= e!167220 e!167219)))

(declare-fun res!201400 () Bool)

(assert (=> b!241269 (=> (not res!201400) (not e!167219))))

(assert (=> b!241269 (= res!201400 (and (= (_2!11207 lt!376854) bit!26) (= (_1!11207 lt!376854) (_2!11206 lt!376849))))))

(declare-fun readBitPure!0 (BitStream!10516) tuple2!20570)

(declare-fun readerFrom!0 (BitStream!10516 (_ BitVec 32) (_ BitVec 32)) BitStream!10516)

(assert (=> b!241269 (= lt!376854 (readBitPure!0 (readerFrom!0 (_2!11206 lt!376849) (currentBit!11621 thiss!1005) (currentByte!11626 thiss!1005))))))

(assert (= (and start!52424 res!201401) b!241272))

(assert (= (and b!241272 res!201396) b!241267))

(assert (= (and b!241267 res!201397) b!241268))

(assert (= (and b!241268 res!201398) b!241274))

(assert (= (and b!241274 res!201402) b!241270))

(assert (= (and b!241270 res!201399) b!241269))

(assert (= (and b!241269 res!201400) b!241271))

(assert (= start!52424 b!241273))

(declare-fun m!363971 () Bool)

(assert (=> b!241272 m!363971))

(declare-fun m!363973 () Bool)

(assert (=> b!241271 m!363973))

(declare-fun m!363975 () Bool)

(assert (=> b!241274 m!363975))

(declare-fun m!363977 () Bool)

(assert (=> b!241274 m!363977))

(declare-fun m!363979 () Bool)

(assert (=> start!52424 m!363979))

(declare-fun m!363981 () Bool)

(assert (=> b!241270 m!363981))

(declare-fun m!363983 () Bool)

(assert (=> b!241273 m!363983))

(assert (=> b!241268 m!363975))

(assert (=> b!241268 m!363977))

(declare-fun m!363985 () Bool)

(assert (=> b!241268 m!363985))

(declare-fun m!363987 () Bool)

(assert (=> b!241269 m!363987))

(assert (=> b!241269 m!363987))

(declare-fun m!363989 () Bool)

(assert (=> b!241269 m!363989))

(push 1)

(assert (not b!241271))

(assert (not b!241273))

(assert (not b!241272))

(assert (not b!241270))

(assert (not b!241269))

(assert (not b!241274))

(assert (not start!52424))

(assert (not b!241268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

