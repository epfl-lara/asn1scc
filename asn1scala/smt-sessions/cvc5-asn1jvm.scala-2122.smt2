; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53718 () Bool)

(assert start!53718)

(declare-fun b!249877 () Bool)

(declare-fun e!173185 () Bool)

(declare-datatypes ((array!13627 0))(
  ( (array!13628 (arr!6964 (Array (_ BitVec 32) (_ BitVec 8))) (size!5977 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10876 0))(
  ( (BitStream!10877 (buf!6470 array!13627) (currentByte!11901 (_ BitVec 32)) (currentBit!11896 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21414 0))(
  ( (tuple2!21415 (_1!11632 BitStream!10876) (_2!11632 Bool)) )
))
(declare-fun lt!388480 () tuple2!21414)

(declare-fun lt!388483 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249877 (= e!173185 (= (bitIndex!0 (size!5977 (buf!6470 (_1!11632 lt!388480))) (currentByte!11901 (_1!11632 lt!388480)) (currentBit!11896 (_1!11632 lt!388480))) lt!388483))))

(declare-fun b!249878 () Bool)

(declare-fun e!173182 () Bool)

(declare-fun lt!388486 () tuple2!21414)

(declare-datatypes ((tuple2!21416 0))(
  ( (tuple2!21417 (_1!11633 BitStream!10876) (_2!11633 BitStream!10876)) )
))
(declare-fun lt!388485 () tuple2!21416)

(assert (=> b!249878 (= e!173182 (not (or (not (_2!11632 lt!388486)) (not (= (_1!11632 lt!388486) (_2!11633 lt!388485))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10876 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21414)

(assert (=> b!249878 (= lt!388486 (checkBitsLoopPure!0 (_1!11633 lt!388485) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!18090 0))(
  ( (Unit!18091) )
))
(declare-datatypes ((tuple2!21418 0))(
  ( (tuple2!21419 (_1!11634 Unit!18090) (_2!11634 BitStream!10876)) )
))
(declare-fun lt!388482 () tuple2!21418)

(declare-fun lt!388481 () tuple2!21418)

(declare-fun lt!388487 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249878 (validate_offset_bits!1 ((_ sign_extend 32) (size!5977 (buf!6470 (_2!11634 lt!388482)))) ((_ sign_extend 32) (currentByte!11901 (_2!11634 lt!388481))) ((_ sign_extend 32) (currentBit!11896 (_2!11634 lt!388481))) lt!388487)))

(declare-fun lt!388488 () Unit!18090)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10876 array!13627 (_ BitVec 64)) Unit!18090)

(assert (=> b!249878 (= lt!388488 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11634 lt!388481) (buf!6470 (_2!11634 lt!388482)) lt!388487))))

(declare-fun reader!0 (BitStream!10876 BitStream!10876) tuple2!21416)

(assert (=> b!249878 (= lt!388485 (reader!0 (_2!11634 lt!388481) (_2!11634 lt!388482)))))

(declare-fun b!249879 () Bool)

(declare-fun res!209150 () Bool)

(assert (=> b!249879 (=> (not res!209150) (not e!173182))))

(declare-fun isPrefixOf!0 (BitStream!10876 BitStream!10876) Bool)

(assert (=> b!249879 (= res!209150 (isPrefixOf!0 (_2!11634 lt!388481) (_2!11634 lt!388482)))))

(declare-fun b!249880 () Bool)

(declare-fun e!173184 () Bool)

(declare-fun thiss!1005 () BitStream!10876)

(assert (=> b!249880 (= e!173184 (not (isPrefixOf!0 thiss!1005 (_2!11634 lt!388481))))))

(declare-fun e!173183 () Bool)

(assert (=> b!249880 e!173183))

(declare-fun res!209149 () Bool)

(assert (=> b!249880 (=> (not res!209149) (not e!173183))))

(assert (=> b!249880 (= res!209149 (= (size!5977 (buf!6470 (_2!11634 lt!388481))) (size!5977 (buf!6470 (_2!11634 lt!388482)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10876 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21418)

(assert (=> b!249880 (= lt!388482 (appendNBitsLoop!0 (_2!11634 lt!388481) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!249880 (validate_offset_bits!1 ((_ sign_extend 32) (size!5977 (buf!6470 (_2!11634 lt!388481)))) ((_ sign_extend 32) (currentByte!11901 (_2!11634 lt!388481))) ((_ sign_extend 32) (currentBit!11896 (_2!11634 lt!388481))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388479 () Unit!18090)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10876 BitStream!10876 (_ BitVec 64) (_ BitVec 64)) Unit!18090)

(assert (=> b!249880 (= lt!388479 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11634 lt!388481) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!173187 () Bool)

(assert (=> b!249880 e!173187))

(declare-fun res!209154 () Bool)

(assert (=> b!249880 (=> (not res!209154) (not e!173187))))

(assert (=> b!249880 (= res!209154 (= (size!5977 (buf!6470 thiss!1005)) (size!5977 (buf!6470 (_2!11634 lt!388481)))))))

(declare-fun appendBit!0 (BitStream!10876 Bool) tuple2!21418)

(assert (=> b!249880 (= lt!388481 (appendBit!0 thiss!1005 bit!26))))

(declare-fun res!209147 () Bool)

(assert (=> start!53718 (=> (not res!209147) (not e!173184))))

(assert (=> start!53718 (= res!209147 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53718 e!173184))

(assert (=> start!53718 true))

(declare-fun e!173188 () Bool)

(declare-fun inv!12 (BitStream!10876) Bool)

(assert (=> start!53718 (and (inv!12 thiss!1005) e!173188)))

(declare-fun b!249881 () Bool)

(declare-fun res!209145 () Bool)

(assert (=> b!249881 (=> (not res!209145) (not e!173184))))

(assert (=> b!249881 (= res!209145 (bvslt from!289 nBits!297))))

(declare-fun b!249882 () Bool)

(declare-fun array_inv!5718 (array!13627) Bool)

(assert (=> b!249882 (= e!173188 (array_inv!5718 (buf!6470 thiss!1005)))))

(declare-fun b!249883 () Bool)

(declare-fun res!209151 () Bool)

(declare-fun e!173186 () Bool)

(assert (=> b!249883 (=> (not res!209151) (not e!173186))))

(assert (=> b!249883 (= res!209151 (isPrefixOf!0 thiss!1005 (_2!11634 lt!388481)))))

(declare-fun b!249884 () Bool)

(declare-fun res!209146 () Bool)

(assert (=> b!249884 (=> (not res!209146) (not e!173184))))

(assert (=> b!249884 (= res!209146 (validate_offset_bits!1 ((_ sign_extend 32) (size!5977 (buf!6470 thiss!1005))) ((_ sign_extend 32) (currentByte!11901 thiss!1005)) ((_ sign_extend 32) (currentBit!11896 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249885 () Bool)

(assert (=> b!249885 (= e!173187 e!173186)))

(declare-fun res!209153 () Bool)

(assert (=> b!249885 (=> (not res!209153) (not e!173186))))

(declare-fun lt!388484 () (_ BitVec 64))

(assert (=> b!249885 (= res!209153 (= lt!388483 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388484)))))

(assert (=> b!249885 (= lt!388483 (bitIndex!0 (size!5977 (buf!6470 (_2!11634 lt!388481))) (currentByte!11901 (_2!11634 lt!388481)) (currentBit!11896 (_2!11634 lt!388481))))))

(assert (=> b!249885 (= lt!388484 (bitIndex!0 (size!5977 (buf!6470 thiss!1005)) (currentByte!11901 thiss!1005) (currentBit!11896 thiss!1005)))))

(declare-fun b!249886 () Bool)

(assert (=> b!249886 (= e!173183 e!173182)))

(declare-fun res!209148 () Bool)

(assert (=> b!249886 (=> (not res!209148) (not e!173182))))

(assert (=> b!249886 (= res!209148 (= (bitIndex!0 (size!5977 (buf!6470 (_2!11634 lt!388482))) (currentByte!11901 (_2!11634 lt!388482)) (currentBit!11896 (_2!11634 lt!388482))) (bvadd (bitIndex!0 (size!5977 (buf!6470 (_2!11634 lt!388481))) (currentByte!11901 (_2!11634 lt!388481)) (currentBit!11896 (_2!11634 lt!388481))) lt!388487)))))

(assert (=> b!249886 (= lt!388487 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!249887 () Bool)

(assert (=> b!249887 (= e!173186 e!173185)))

(declare-fun res!209152 () Bool)

(assert (=> b!249887 (=> (not res!209152) (not e!173185))))

(assert (=> b!249887 (= res!209152 (and (= (_2!11632 lt!388480) bit!26) (= (_1!11632 lt!388480) (_2!11634 lt!388481))))))

(declare-fun readBitPure!0 (BitStream!10876) tuple2!21414)

(declare-fun readerFrom!0 (BitStream!10876 (_ BitVec 32) (_ BitVec 32)) BitStream!10876)

(assert (=> b!249887 (= lt!388480 (readBitPure!0 (readerFrom!0 (_2!11634 lt!388481) (currentBit!11896 thiss!1005) (currentByte!11901 thiss!1005))))))

(assert (= (and start!53718 res!209147) b!249884))

(assert (= (and b!249884 res!209146) b!249881))

(assert (= (and b!249881 res!209145) b!249880))

(assert (= (and b!249880 res!209154) b!249885))

(assert (= (and b!249885 res!209153) b!249883))

(assert (= (and b!249883 res!209151) b!249887))

(assert (= (and b!249887 res!209152) b!249877))

(assert (= (and b!249880 res!209149) b!249886))

(assert (= (and b!249886 res!209148) b!249879))

(assert (= (and b!249879 res!209150) b!249878))

(assert (= start!53718 b!249882))

(declare-fun m!376257 () Bool)

(assert (=> b!249880 m!376257))

(declare-fun m!376259 () Bool)

(assert (=> b!249880 m!376259))

(declare-fun m!376261 () Bool)

(assert (=> b!249880 m!376261))

(declare-fun m!376263 () Bool)

(assert (=> b!249880 m!376263))

(declare-fun m!376265 () Bool)

(assert (=> b!249880 m!376265))

(declare-fun m!376267 () Bool)

(assert (=> b!249882 m!376267))

(declare-fun m!376269 () Bool)

(assert (=> b!249877 m!376269))

(declare-fun m!376271 () Bool)

(assert (=> b!249887 m!376271))

(assert (=> b!249887 m!376271))

(declare-fun m!376273 () Bool)

(assert (=> b!249887 m!376273))

(declare-fun m!376275 () Bool)

(assert (=> b!249886 m!376275))

(declare-fun m!376277 () Bool)

(assert (=> b!249886 m!376277))

(assert (=> b!249883 m!376261))

(declare-fun m!376279 () Bool)

(assert (=> b!249884 m!376279))

(declare-fun m!376281 () Bool)

(assert (=> b!249878 m!376281))

(declare-fun m!376283 () Bool)

(assert (=> b!249878 m!376283))

(declare-fun m!376285 () Bool)

(assert (=> b!249878 m!376285))

(declare-fun m!376287 () Bool)

(assert (=> b!249878 m!376287))

(assert (=> b!249885 m!376277))

(declare-fun m!376289 () Bool)

(assert (=> b!249885 m!376289))

(declare-fun m!376291 () Bool)

(assert (=> b!249879 m!376291))

(declare-fun m!376293 () Bool)

(assert (=> start!53718 m!376293))

(push 1)

(assert (not b!249887))

(assert (not b!249879))

(assert (not b!249883))

(assert (not b!249877))

(assert (not b!249878))

(assert (not b!249886))

(assert (not start!53718))

(assert (not b!249884))

(assert (not b!249882))

