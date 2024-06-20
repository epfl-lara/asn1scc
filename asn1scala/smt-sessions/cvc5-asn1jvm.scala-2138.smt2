; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54108 () Bool)

(assert start!54108)

(declare-fun b!252544 () Bool)

(declare-fun e!175004 () Bool)

(declare-datatypes ((array!13732 0))(
  ( (array!13733 (arr!7012 (Array (_ BitVec 32) (_ BitVec 8))) (size!6025 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10972 0))(
  ( (BitStream!10973 (buf!6527 array!13732) (currentByte!11982 (_ BitVec 32)) (currentBit!11977 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10972)

(declare-fun array_inv!5766 (array!13732) Bool)

(assert (=> b!252544 (= e!175004 (array_inv!5766 (buf!6527 thiss!1005)))))

(declare-fun res!211598 () Bool)

(declare-fun e!175008 () Bool)

(assert (=> start!54108 (=> (not res!211598) (not e!175008))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!54108 (= res!211598 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54108 e!175008))

(assert (=> start!54108 true))

(declare-fun inv!12 (BitStream!10972) Bool)

(assert (=> start!54108 (and (inv!12 thiss!1005) e!175004)))

(declare-fun b!252545 () Bool)

(declare-fun res!211591 () Bool)

(assert (=> b!252545 (=> (not res!211591) (not e!175008))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!252545 (= res!211591 (validate_offset_bits!1 ((_ sign_extend 32) (size!6025 (buf!6527 thiss!1005))) ((_ sign_extend 32) (currentByte!11982 thiss!1005)) ((_ sign_extend 32) (currentBit!11977 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!252546 () Bool)

(declare-fun e!175005 () Bool)

(declare-datatypes ((tuple2!21720 0))(
  ( (tuple2!21721 (_1!11788 BitStream!10972) (_2!11788 Bool)) )
))
(declare-fun lt!392244 () tuple2!21720)

(declare-datatypes ((tuple2!21722 0))(
  ( (tuple2!21723 (_1!11789 BitStream!10972) (_2!11789 BitStream!10972)) )
))
(declare-fun lt!392239 () tuple2!21722)

(assert (=> b!252546 (= e!175005 (not (or (not (_2!11788 lt!392244)) (not (= (_1!11788 lt!392244) (_2!11789 lt!392239))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10972 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21720)

(assert (=> b!252546 (= lt!392244 (checkBitsLoopPure!0 (_1!11789 lt!392239) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!18198 0))(
  ( (Unit!18199) )
))
(declare-datatypes ((tuple2!21724 0))(
  ( (tuple2!21725 (_1!11790 Unit!18198) (_2!11790 BitStream!10972)) )
))
(declare-fun lt!392233 () tuple2!21724)

(declare-fun lt!392231 () tuple2!21724)

(declare-fun lt!392241 () (_ BitVec 64))

(assert (=> b!252546 (validate_offset_bits!1 ((_ sign_extend 32) (size!6025 (buf!6527 (_2!11790 lt!392233)))) ((_ sign_extend 32) (currentByte!11982 (_2!11790 lt!392231))) ((_ sign_extend 32) (currentBit!11977 (_2!11790 lt!392231))) lt!392241)))

(declare-fun lt!392225 () Unit!18198)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10972 array!13732 (_ BitVec 64)) Unit!18198)

(assert (=> b!252546 (= lt!392225 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11790 lt!392231) (buf!6527 (_2!11790 lt!392233)) lt!392241))))

(declare-fun reader!0 (BitStream!10972 BitStream!10972) tuple2!21722)

(assert (=> b!252546 (= lt!392239 (reader!0 (_2!11790 lt!392231) (_2!11790 lt!392233)))))

(declare-fun b!252547 () Bool)

(declare-fun res!211596 () Bool)

(declare-fun e!175007 () Bool)

(assert (=> b!252547 (=> (not res!211596) (not e!175007))))

(declare-fun isPrefixOf!0 (BitStream!10972 BitStream!10972) Bool)

(assert (=> b!252547 (= res!211596 (isPrefixOf!0 thiss!1005 (_2!11790 lt!392231)))))

(declare-fun b!252548 () Bool)

(declare-fun res!211592 () Bool)

(assert (=> b!252548 (=> (not res!211592) (not e!175005))))

(assert (=> b!252548 (= res!211592 (isPrefixOf!0 (_2!11790 lt!392231) (_2!11790 lt!392233)))))

(declare-fun b!252549 () Bool)

(declare-fun e!175003 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252549 (= e!175003 (invariant!0 (currentBit!11977 thiss!1005) (currentByte!11982 thiss!1005) (size!6025 (buf!6527 (_2!11790 lt!392233)))))))

(declare-fun b!252550 () Bool)

(declare-fun res!211593 () Bool)

(assert (=> b!252550 (=> (not res!211593) (not e!175008))))

(assert (=> b!252550 (= res!211593 (bvslt from!289 nBits!297))))

(declare-fun b!252551 () Bool)

(declare-fun e!175001 () Bool)

(declare-fun lt!392226 () tuple2!21720)

(declare-fun lt!392228 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!252551 (= e!175001 (= (bitIndex!0 (size!6025 (buf!6527 (_1!11788 lt!392226))) (currentByte!11982 (_1!11788 lt!392226)) (currentBit!11977 (_1!11788 lt!392226))) lt!392228))))

(declare-fun b!252552 () Bool)

(assert (=> b!252552 (= e!175008 (not (or (not (= (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!392237 () (_ BitVec 64))

(assert (=> b!252552 (validate_offset_bits!1 ((_ sign_extend 32) (size!6025 (buf!6527 (_2!11790 lt!392233)))) ((_ sign_extend 32) (currentByte!11982 (_2!11790 lt!392231))) ((_ sign_extend 32) (currentBit!11977 (_2!11790 lt!392231))) lt!392237)))

(declare-fun lt!392243 () Unit!18198)

(assert (=> b!252552 (= lt!392243 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11790 lt!392231) (buf!6527 (_2!11790 lt!392233)) lt!392237))))

(declare-fun lt!392240 () tuple2!21720)

(declare-fun lt!392227 () tuple2!21722)

(assert (=> b!252552 (= lt!392240 (checkBitsLoopPure!0 (_1!11789 lt!392227) nBits!297 bit!26 from!289))))

(assert (=> b!252552 (validate_offset_bits!1 ((_ sign_extend 32) (size!6025 (buf!6527 (_2!11790 lt!392233)))) ((_ sign_extend 32) (currentByte!11982 thiss!1005)) ((_ sign_extend 32) (currentBit!11977 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!392232 () Unit!18198)

(assert (=> b!252552 (= lt!392232 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6527 (_2!11790 lt!392233)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10972) tuple2!21720)

(assert (=> b!252552 (= (_2!11788 (readBitPure!0 (_1!11789 lt!392227))) bit!26)))

(declare-fun lt!392230 () tuple2!21722)

(assert (=> b!252552 (= lt!392230 (reader!0 (_2!11790 lt!392231) (_2!11790 lt!392233)))))

(assert (=> b!252552 (= lt!392227 (reader!0 thiss!1005 (_2!11790 lt!392233)))))

(declare-fun e!175010 () Bool)

(assert (=> b!252552 e!175010))

(declare-fun res!211590 () Bool)

(assert (=> b!252552 (=> (not res!211590) (not e!175010))))

(declare-fun lt!392236 () tuple2!21720)

(declare-fun lt!392234 () tuple2!21720)

(assert (=> b!252552 (= res!211590 (= (bitIndex!0 (size!6025 (buf!6527 (_1!11788 lt!392236))) (currentByte!11982 (_1!11788 lt!392236)) (currentBit!11977 (_1!11788 lt!392236))) (bitIndex!0 (size!6025 (buf!6527 (_1!11788 lt!392234))) (currentByte!11982 (_1!11788 lt!392234)) (currentBit!11977 (_1!11788 lt!392234)))))))

(declare-fun lt!392242 () Unit!18198)

(declare-fun lt!392235 () BitStream!10972)

(declare-fun readBitPrefixLemma!0 (BitStream!10972 BitStream!10972) Unit!18198)

(assert (=> b!252552 (= lt!392242 (readBitPrefixLemma!0 lt!392235 (_2!11790 lt!392233)))))

(assert (=> b!252552 (= lt!392234 (readBitPure!0 (BitStream!10973 (buf!6527 (_2!11790 lt!392233)) (currentByte!11982 thiss!1005) (currentBit!11977 thiss!1005))))))

(assert (=> b!252552 (= lt!392236 (readBitPure!0 lt!392235))))

(assert (=> b!252552 (= lt!392235 (BitStream!10973 (buf!6527 (_2!11790 lt!392231)) (currentByte!11982 thiss!1005) (currentBit!11977 thiss!1005)))))

(assert (=> b!252552 e!175003))

(declare-fun res!211602 () Bool)

(assert (=> b!252552 (=> (not res!211602) (not e!175003))))

(assert (=> b!252552 (= res!211602 (isPrefixOf!0 thiss!1005 (_2!11790 lt!392233)))))

(declare-fun lt!392224 () Unit!18198)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10972 BitStream!10972 BitStream!10972) Unit!18198)

(assert (=> b!252552 (= lt!392224 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11790 lt!392231) (_2!11790 lt!392233)))))

(declare-fun e!175002 () Bool)

(assert (=> b!252552 e!175002))

(declare-fun res!211601 () Bool)

(assert (=> b!252552 (=> (not res!211601) (not e!175002))))

(assert (=> b!252552 (= res!211601 (= (size!6025 (buf!6527 (_2!11790 lt!392231))) (size!6025 (buf!6527 (_2!11790 lt!392233)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10972 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21724)

(assert (=> b!252552 (= lt!392233 (appendNBitsLoop!0 (_2!11790 lt!392231) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252552 (validate_offset_bits!1 ((_ sign_extend 32) (size!6025 (buf!6527 (_2!11790 lt!392231)))) ((_ sign_extend 32) (currentByte!11982 (_2!11790 lt!392231))) ((_ sign_extend 32) (currentBit!11977 (_2!11790 lt!392231))) lt!392237)))

(assert (=> b!252552 (= lt!392237 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!392229 () Unit!18198)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10972 BitStream!10972 (_ BitVec 64) (_ BitVec 64)) Unit!18198)

(assert (=> b!252552 (= lt!392229 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11790 lt!392231) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!175009 () Bool)

(assert (=> b!252552 e!175009))

(declare-fun res!211594 () Bool)

(assert (=> b!252552 (=> (not res!211594) (not e!175009))))

(assert (=> b!252552 (= res!211594 (= (size!6025 (buf!6527 thiss!1005)) (size!6025 (buf!6527 (_2!11790 lt!392231)))))))

(declare-fun appendBit!0 (BitStream!10972 Bool) tuple2!21724)

(assert (=> b!252552 (= lt!392231 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!252553 () Bool)

(assert (=> b!252553 (= e!175007 e!175001)))

(declare-fun res!211600 () Bool)

(assert (=> b!252553 (=> (not res!211600) (not e!175001))))

(assert (=> b!252553 (= res!211600 (and (= (_2!11788 lt!392226) bit!26) (= (_1!11788 lt!392226) (_2!11790 lt!392231))))))

(declare-fun readerFrom!0 (BitStream!10972 (_ BitVec 32) (_ BitVec 32)) BitStream!10972)

(assert (=> b!252553 (= lt!392226 (readBitPure!0 (readerFrom!0 (_2!11790 lt!392231) (currentBit!11977 thiss!1005) (currentByte!11982 thiss!1005))))))

(declare-fun b!252554 () Bool)

(assert (=> b!252554 (= e!175010 (= (_2!11788 lt!392236) (_2!11788 lt!392234)))))

(declare-fun b!252555 () Bool)

(assert (=> b!252555 (= e!175009 e!175007)))

(declare-fun res!211599 () Bool)

(assert (=> b!252555 (=> (not res!211599) (not e!175007))))

(declare-fun lt!392238 () (_ BitVec 64))

(assert (=> b!252555 (= res!211599 (= lt!392228 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!392238)))))

(assert (=> b!252555 (= lt!392228 (bitIndex!0 (size!6025 (buf!6527 (_2!11790 lt!392231))) (currentByte!11982 (_2!11790 lt!392231)) (currentBit!11977 (_2!11790 lt!392231))))))

(assert (=> b!252555 (= lt!392238 (bitIndex!0 (size!6025 (buf!6527 thiss!1005)) (currentByte!11982 thiss!1005) (currentBit!11977 thiss!1005)))))

(declare-fun b!252556 () Bool)

(assert (=> b!252556 (= e!175002 e!175005)))

(declare-fun res!211595 () Bool)

(assert (=> b!252556 (=> (not res!211595) (not e!175005))))

(assert (=> b!252556 (= res!211595 (= (bitIndex!0 (size!6025 (buf!6527 (_2!11790 lt!392233))) (currentByte!11982 (_2!11790 lt!392233)) (currentBit!11977 (_2!11790 lt!392233))) (bvadd (bitIndex!0 (size!6025 (buf!6527 (_2!11790 lt!392231))) (currentByte!11982 (_2!11790 lt!392231)) (currentBit!11977 (_2!11790 lt!392231))) lt!392241)))))

(assert (=> b!252556 (= lt!392241 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!252557 () Bool)

(declare-fun res!211597 () Bool)

(assert (=> b!252557 (=> (not res!211597) (not e!175003))))

(assert (=> b!252557 (= res!211597 (invariant!0 (currentBit!11977 thiss!1005) (currentByte!11982 thiss!1005) (size!6025 (buf!6527 (_2!11790 lt!392231)))))))

(assert (= (and start!54108 res!211598) b!252545))

(assert (= (and b!252545 res!211591) b!252550))

(assert (= (and b!252550 res!211593) b!252552))

(assert (= (and b!252552 res!211594) b!252555))

(assert (= (and b!252555 res!211599) b!252547))

(assert (= (and b!252547 res!211596) b!252553))

(assert (= (and b!252553 res!211600) b!252551))

(assert (= (and b!252552 res!211601) b!252556))

(assert (= (and b!252556 res!211595) b!252548))

(assert (= (and b!252548 res!211592) b!252546))

(assert (= (and b!252552 res!211602) b!252557))

(assert (= (and b!252557 res!211597) b!252549))

(assert (= (and b!252552 res!211590) b!252554))

(assert (= start!54108 b!252544))

(declare-fun m!379977 () Bool)

(assert (=> b!252557 m!379977))

(declare-fun m!379979 () Bool)

(assert (=> b!252546 m!379979))

(declare-fun m!379981 () Bool)

(assert (=> b!252546 m!379981))

(declare-fun m!379983 () Bool)

(assert (=> b!252546 m!379983))

(declare-fun m!379985 () Bool)

(assert (=> b!252546 m!379985))

(declare-fun m!379987 () Bool)

(assert (=> start!54108 m!379987))

(declare-fun m!379989 () Bool)

(assert (=> b!252547 m!379989))

(declare-fun m!379991 () Bool)

(assert (=> b!252545 m!379991))

(declare-fun m!379993 () Bool)

(assert (=> b!252544 m!379993))

(declare-fun m!379995 () Bool)

(assert (=> b!252548 m!379995))

(declare-fun m!379997 () Bool)

(assert (=> b!252551 m!379997))

(declare-fun m!379999 () Bool)

(assert (=> b!252549 m!379999))

(declare-fun m!380001 () Bool)

(assert (=> b!252553 m!380001))

(assert (=> b!252553 m!380001))

(declare-fun m!380003 () Bool)

(assert (=> b!252553 m!380003))

(declare-fun m!380005 () Bool)

(assert (=> b!252556 m!380005))

(declare-fun m!380007 () Bool)

(assert (=> b!252556 m!380007))

(declare-fun m!380009 () Bool)

(assert (=> b!252552 m!380009))

(declare-fun m!380011 () Bool)

(assert (=> b!252552 m!380011))

(declare-fun m!380013 () Bool)

(assert (=> b!252552 m!380013))

(declare-fun m!380015 () Bool)

(assert (=> b!252552 m!380015))

(declare-fun m!380017 () Bool)

(assert (=> b!252552 m!380017))

(declare-fun m!380019 () Bool)

(assert (=> b!252552 m!380019))

(declare-fun m!380021 () Bool)

(assert (=> b!252552 m!380021))

(assert (=> b!252552 m!379985))

(declare-fun m!380023 () Bool)

(assert (=> b!252552 m!380023))

(declare-fun m!380025 () Bool)

(assert (=> b!252552 m!380025))

(declare-fun m!380027 () Bool)

(assert (=> b!252552 m!380027))

(declare-fun m!380029 () Bool)

(assert (=> b!252552 m!380029))

(declare-fun m!380031 () Bool)

(assert (=> b!252552 m!380031))

(declare-fun m!380033 () Bool)

(assert (=> b!252552 m!380033))

(declare-fun m!380035 () Bool)

(assert (=> b!252552 m!380035))

(declare-fun m!380037 () Bool)

(assert (=> b!252552 m!380037))

(declare-fun m!380039 () Bool)

(assert (=> b!252552 m!380039))

(declare-fun m!380041 () Bool)

(assert (=> b!252552 m!380041))

(declare-fun m!380043 () Bool)

(assert (=> b!252552 m!380043))

(assert (=> b!252555 m!380007))

(declare-fun m!380045 () Bool)

(assert (=> b!252555 m!380045))

(push 1)

(assert (not b!252545))

(assert (not b!252557))

(assert (not b!252552))

(assert (not b!252555))

(assert (not b!252548))

(assert (not b!252551))

(assert (not b!252553))

(assert (not b!252556))

(assert (not b!252549))

(assert (not b!252544))

(assert (not start!54108))

(assert (not b!252547))

(assert (not b!252546))

(check-sat)

(pop 1)

(push 1)

(check-sat)

