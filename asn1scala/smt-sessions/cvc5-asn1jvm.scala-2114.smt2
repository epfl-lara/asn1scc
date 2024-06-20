; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53670 () Bool)

(assert start!53670)

(declare-fun b!249268 () Bool)

(declare-fun e!172724 () Bool)

(declare-datatypes ((array!13579 0))(
  ( (array!13580 (arr!6940 (Array (_ BitVec 32) (_ BitVec 8))) (size!5953 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10828 0))(
  ( (BitStream!10829 (buf!6446 array!13579) (currentByte!11877 (_ BitVec 32)) (currentBit!11872 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10828)

(declare-fun array_inv!5694 (array!13579) Bool)

(assert (=> b!249268 (= e!172724 (array_inv!5694 (buf!6446 thiss!1005)))))

(declare-fun res!208612 () Bool)

(declare-fun e!172719 () Bool)

(assert (=> start!53670 (=> (not res!208612) (not e!172719))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53670 (= res!208612 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53670 e!172719))

(assert (=> start!53670 true))

(declare-fun inv!12 (BitStream!10828) Bool)

(assert (=> start!53670 (and (inv!12 thiss!1005) e!172724)))

(declare-fun b!249269 () Bool)

(declare-fun res!208608 () Bool)

(assert (=> b!249269 (=> (not res!208608) (not e!172719))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249269 (= res!208608 (validate_offset_bits!1 ((_ sign_extend 32) (size!5953 (buf!6446 thiss!1005))) ((_ sign_extend 32) (currentByte!11877 thiss!1005)) ((_ sign_extend 32) (currentBit!11872 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249270 () Bool)

(declare-fun res!208611 () Bool)

(assert (=> b!249270 (=> (not res!208611) (not e!172719))))

(assert (=> b!249270 (= res!208611 (bvslt from!289 nBits!297))))

(declare-fun b!249271 () Bool)

(declare-fun e!172722 () Bool)

(declare-datatypes ((tuple2!21318 0))(
  ( (tuple2!21319 (_1!11584 BitStream!10828) (_2!11584 Bool)) )
))
(declare-fun lt!388126 () tuple2!21318)

(declare-fun lt!388128 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249271 (= e!172722 (= (bitIndex!0 (size!5953 (buf!6446 (_1!11584 lt!388126))) (currentByte!11877 (_1!11584 lt!388126)) (currentBit!11872 (_1!11584 lt!388126))) lt!388128))))

(declare-fun b!249272 () Bool)

(assert (=> b!249272 (= e!172719 (not true))))

(declare-fun e!172721 () Bool)

(assert (=> b!249272 e!172721))

(declare-fun res!208613 () Bool)

(assert (=> b!249272 (=> (not res!208613) (not e!172721))))

(declare-datatypes ((Unit!18042 0))(
  ( (Unit!18043) )
))
(declare-datatypes ((tuple2!21320 0))(
  ( (tuple2!21321 (_1!11585 Unit!18042) (_2!11585 BitStream!10828)) )
))
(declare-fun lt!388125 () tuple2!21320)

(assert (=> b!249272 (= res!208613 (= (size!5953 (buf!6446 thiss!1005)) (size!5953 (buf!6446 (_2!11585 lt!388125)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10828 Bool) tuple2!21320)

(assert (=> b!249272 (= lt!388125 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249273 () Bool)

(declare-fun e!172720 () Bool)

(assert (=> b!249273 (= e!172720 e!172722)))

(declare-fun res!208610 () Bool)

(assert (=> b!249273 (=> (not res!208610) (not e!172722))))

(assert (=> b!249273 (= res!208610 (and (= (_2!11584 lt!388126) bit!26) (= (_1!11584 lt!388126) (_2!11585 lt!388125))))))

(declare-fun readBitPure!0 (BitStream!10828) tuple2!21318)

(declare-fun readerFrom!0 (BitStream!10828 (_ BitVec 32) (_ BitVec 32)) BitStream!10828)

(assert (=> b!249273 (= lt!388126 (readBitPure!0 (readerFrom!0 (_2!11585 lt!388125) (currentBit!11872 thiss!1005) (currentByte!11877 thiss!1005))))))

(declare-fun b!249274 () Bool)

(declare-fun res!208614 () Bool)

(assert (=> b!249274 (=> (not res!208614) (not e!172720))))

(declare-fun isPrefixOf!0 (BitStream!10828 BitStream!10828) Bool)

(assert (=> b!249274 (= res!208614 (isPrefixOf!0 thiss!1005 (_2!11585 lt!388125)))))

(declare-fun b!249275 () Bool)

(assert (=> b!249275 (= e!172721 e!172720)))

(declare-fun res!208609 () Bool)

(assert (=> b!249275 (=> (not res!208609) (not e!172720))))

(declare-fun lt!388127 () (_ BitVec 64))

(assert (=> b!249275 (= res!208609 (= lt!388128 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388127)))))

(assert (=> b!249275 (= lt!388128 (bitIndex!0 (size!5953 (buf!6446 (_2!11585 lt!388125))) (currentByte!11877 (_2!11585 lt!388125)) (currentBit!11872 (_2!11585 lt!388125))))))

(assert (=> b!249275 (= lt!388127 (bitIndex!0 (size!5953 (buf!6446 thiss!1005)) (currentByte!11877 thiss!1005) (currentBit!11872 thiss!1005)))))

(assert (= (and start!53670 res!208612) b!249269))

(assert (= (and b!249269 res!208608) b!249270))

(assert (= (and b!249270 res!208611) b!249272))

(assert (= (and b!249272 res!208613) b!249275))

(assert (= (and b!249275 res!208609) b!249274))

(assert (= (and b!249274 res!208614) b!249273))

(assert (= (and b!249273 res!208610) b!249271))

(assert (= start!53670 b!249268))

(declare-fun m!375705 () Bool)

(assert (=> b!249274 m!375705))

(declare-fun m!375707 () Bool)

(assert (=> b!249273 m!375707))

(assert (=> b!249273 m!375707))

(declare-fun m!375709 () Bool)

(assert (=> b!249273 m!375709))

(declare-fun m!375711 () Bool)

(assert (=> b!249271 m!375711))

(declare-fun m!375713 () Bool)

(assert (=> b!249275 m!375713))

(declare-fun m!375715 () Bool)

(assert (=> b!249275 m!375715))

(declare-fun m!375717 () Bool)

(assert (=> start!53670 m!375717))

(declare-fun m!375719 () Bool)

(assert (=> b!249269 m!375719))

(declare-fun m!375721 () Bool)

(assert (=> b!249268 m!375721))

(declare-fun m!375723 () Bool)

(assert (=> b!249272 m!375723))

(push 1)

(assert (not b!249274))

(assert (not b!249272))

(assert (not b!249269))

(assert (not start!53670))

(assert (not b!249275))

(assert (not b!249268))

(assert (not b!249271))

(assert (not b!249273))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

