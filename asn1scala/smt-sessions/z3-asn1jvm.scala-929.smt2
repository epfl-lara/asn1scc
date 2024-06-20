; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26350 () Bool)

(assert start!26350)

(declare-fun e!89413 () Bool)

(declare-fun b!134755 () Bool)

(declare-datatypes ((array!6150 0))(
  ( (array!6151 (arr!3448 (Array (_ BitVec 32) (_ BitVec 8))) (size!2783 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6150)

(declare-datatypes ((BitStream!4830 0))(
  ( (BitStream!4831 (buf!3176 array!6150) (currentByte!5973 (_ BitVec 32)) (currentBit!5968 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11660 0))(
  ( (tuple2!11661 (_1!6146 BitStream!4830) (_2!6146 BitStream!4830)) )
))
(declare-fun lt!209039 () tuple2!11660)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!11662 0))(
  ( (tuple2!11663 (_1!6147 BitStream!4830) (_2!6147 (_ BitVec 8))) )
))
(declare-fun lt!209056 () tuple2!11662)

(assert (=> b!134755 (= e!89413 (and (= (_2!6147 lt!209056) (select (arr!3448 arr!237) from!447)) (= (_1!6147 lt!209056) (_2!6146 lt!209039))))))

(declare-fun readBytePure!0 (BitStream!4830) tuple2!11662)

(assert (=> b!134755 (= lt!209056 (readBytePure!0 (_1!6146 lt!209039)))))

(declare-fun thiss!1634 () BitStream!4830)

(declare-datatypes ((Unit!8404 0))(
  ( (Unit!8405) )
))
(declare-datatypes ((tuple2!11664 0))(
  ( (tuple2!11665 (_1!6148 Unit!8404) (_2!6148 BitStream!4830)) )
))
(declare-fun lt!209038 () tuple2!11664)

(declare-fun reader!0 (BitStream!4830 BitStream!4830) tuple2!11660)

(assert (=> b!134755 (= lt!209039 (reader!0 thiss!1634 (_2!6148 lt!209038)))))

(declare-fun b!134756 () Bool)

(declare-fun e!89420 () Bool)

(assert (=> b!134756 (= e!89420 (not true))))

(declare-datatypes ((tuple2!11666 0))(
  ( (tuple2!11667 (_1!6149 BitStream!4830) (_2!6149 array!6150)) )
))
(declare-fun lt!209045 () tuple2!11666)

(declare-fun lt!209051 () tuple2!11666)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arrayRangesEq!186 (array!6150 array!6150 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134756 (arrayRangesEq!186 (_2!6149 lt!209045) (_2!6149 lt!209051) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!209049 () Unit!8404)

(declare-fun lt!209048 () tuple2!11660)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4830 array!6150 (_ BitVec 32) (_ BitVec 32)) Unit!8404)

(assert (=> b!134756 (= lt!209049 (readByteArrayLoopArrayPrefixLemma!0 (_1!6146 lt!209048) arr!237 from!447 to!404))))

(declare-fun lt!209059 () array!6150)

(declare-fun readByteArrayLoopPure!0 (BitStream!4830 array!6150 (_ BitVec 32) (_ BitVec 32)) tuple2!11666)

(declare-fun withMovedByteIndex!0 (BitStream!4830 (_ BitVec 32)) BitStream!4830)

(assert (=> b!134756 (= lt!209051 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6146 lt!209048) #b00000000000000000000000000000001) lt!209059 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209050 () tuple2!11666)

(declare-fun lt!209042 () tuple2!11660)

(assert (=> b!134756 (= lt!209050 (readByteArrayLoopPure!0 (_1!6146 lt!209042) lt!209059 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209041 () tuple2!11662)

(assert (=> b!134756 (= lt!209059 (array!6151 (store (arr!3448 arr!237) from!447 (_2!6147 lt!209041)) (size!2783 arr!237)))))

(declare-fun lt!209062 () tuple2!11664)

(declare-fun lt!209052 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!134756 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2783 (buf!3176 (_2!6148 lt!209062)))) ((_ sign_extend 32) (currentByte!5973 (_2!6148 lt!209038))) ((_ sign_extend 32) (currentBit!5968 (_2!6148 lt!209038))) lt!209052)))

(declare-fun lt!209053 () Unit!8404)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4830 array!6150 (_ BitVec 32)) Unit!8404)

(assert (=> b!134756 (= lt!209053 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6148 lt!209038) (buf!3176 (_2!6148 lt!209062)) lt!209052))))

(assert (=> b!134756 (= (_1!6149 lt!209045) (_2!6146 lt!209048))))

(assert (=> b!134756 (= lt!209045 (readByteArrayLoopPure!0 (_1!6146 lt!209048) arr!237 from!447 to!404))))

(assert (=> b!134756 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2783 (buf!3176 (_2!6148 lt!209062)))) ((_ sign_extend 32) (currentByte!5973 thiss!1634)) ((_ sign_extend 32) (currentBit!5968 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!209054 () Unit!8404)

(assert (=> b!134756 (= lt!209054 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3176 (_2!6148 lt!209062)) (bvsub to!404 from!447)))))

(assert (=> b!134756 (= (_2!6147 lt!209041) (select (arr!3448 arr!237) from!447))))

(assert (=> b!134756 (= lt!209041 (readBytePure!0 (_1!6146 lt!209048)))))

(assert (=> b!134756 (= lt!209042 (reader!0 (_2!6148 lt!209038) (_2!6148 lt!209062)))))

(assert (=> b!134756 (= lt!209048 (reader!0 thiss!1634 (_2!6148 lt!209062)))))

(declare-fun e!89412 () Bool)

(assert (=> b!134756 e!89412))

(declare-fun res!112012 () Bool)

(assert (=> b!134756 (=> (not res!112012) (not e!89412))))

(declare-fun lt!209043 () tuple2!11662)

(declare-fun lt!209046 () tuple2!11662)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!134756 (= res!112012 (= (bitIndex!0 (size!2783 (buf!3176 (_1!6147 lt!209043))) (currentByte!5973 (_1!6147 lt!209043)) (currentBit!5968 (_1!6147 lt!209043))) (bitIndex!0 (size!2783 (buf!3176 (_1!6147 lt!209046))) (currentByte!5973 (_1!6147 lt!209046)) (currentBit!5968 (_1!6147 lt!209046)))))))

(declare-fun lt!209058 () Unit!8404)

(declare-fun lt!209060 () BitStream!4830)

(declare-fun readBytePrefixLemma!0 (BitStream!4830 BitStream!4830) Unit!8404)

(assert (=> b!134756 (= lt!209058 (readBytePrefixLemma!0 lt!209060 (_2!6148 lt!209062)))))

(assert (=> b!134756 (= lt!209046 (readBytePure!0 (BitStream!4831 (buf!3176 (_2!6148 lt!209062)) (currentByte!5973 thiss!1634) (currentBit!5968 thiss!1634))))))

(assert (=> b!134756 (= lt!209043 (readBytePure!0 lt!209060))))

(assert (=> b!134756 (= lt!209060 (BitStream!4831 (buf!3176 (_2!6148 lt!209038)) (currentByte!5973 thiss!1634) (currentBit!5968 thiss!1634)))))

(declare-fun e!89421 () Bool)

(assert (=> b!134756 e!89421))

(declare-fun res!112014 () Bool)

(assert (=> b!134756 (=> (not res!112014) (not e!89421))))

(declare-fun isPrefixOf!0 (BitStream!4830 BitStream!4830) Bool)

(assert (=> b!134756 (= res!112014 (isPrefixOf!0 thiss!1634 (_2!6148 lt!209062)))))

(declare-fun lt!209040 () Unit!8404)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4830 BitStream!4830 BitStream!4830) Unit!8404)

(assert (=> b!134756 (= lt!209040 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6148 lt!209038) (_2!6148 lt!209062)))))

(declare-fun e!89414 () Bool)

(assert (=> b!134756 e!89414))

(declare-fun res!112006 () Bool)

(assert (=> b!134756 (=> (not res!112006) (not e!89414))))

(assert (=> b!134756 (= res!112006 (= (size!2783 (buf!3176 (_2!6148 lt!209038))) (size!2783 (buf!3176 (_2!6148 lt!209062)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4830 array!6150 (_ BitVec 32) (_ BitVec 32)) tuple2!11664)

(assert (=> b!134756 (= lt!209062 (appendByteArrayLoop!0 (_2!6148 lt!209038) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!134756 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2783 (buf!3176 (_2!6148 lt!209038)))) ((_ sign_extend 32) (currentByte!5973 (_2!6148 lt!209038))) ((_ sign_extend 32) (currentBit!5968 (_2!6148 lt!209038))) lt!209052)))

(assert (=> b!134756 (= lt!209052 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!209057 () Unit!8404)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4830 BitStream!4830 (_ BitVec 64) (_ BitVec 32)) Unit!8404)

(assert (=> b!134756 (= lt!209057 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6148 lt!209038) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!134756 e!89413))

(declare-fun res!112015 () Bool)

(assert (=> b!134756 (=> (not res!112015) (not e!89413))))

(assert (=> b!134756 (= res!112015 (= (size!2783 (buf!3176 thiss!1634)) (size!2783 (buf!3176 (_2!6148 lt!209038)))))))

(declare-fun appendByte!0 (BitStream!4830 (_ BitVec 8)) tuple2!11664)

(assert (=> b!134756 (= lt!209038 (appendByte!0 thiss!1634 (select (arr!3448 arr!237) from!447)))))

(declare-fun b!134757 () Bool)

(declare-fun e!89419 () Bool)

(declare-fun array_inv!2572 (array!6150) Bool)

(assert (=> b!134757 (= e!89419 (array_inv!2572 (buf!3176 thiss!1634)))))

(declare-fun res!112013 () Bool)

(assert (=> start!26350 (=> (not res!112013) (not e!89420))))

(assert (=> start!26350 (= res!112013 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2783 arr!237))))))

(assert (=> start!26350 e!89420))

(assert (=> start!26350 true))

(assert (=> start!26350 (array_inv!2572 arr!237)))

(declare-fun inv!12 (BitStream!4830) Bool)

(assert (=> start!26350 (and (inv!12 thiss!1634) e!89419)))

(declare-fun b!134758 () Bool)

(declare-fun res!112011 () Bool)

(declare-fun e!89417 () Bool)

(assert (=> b!134758 (=> (not res!112011) (not e!89417))))

(assert (=> b!134758 (= res!112011 (isPrefixOf!0 (_2!6148 lt!209038) (_2!6148 lt!209062)))))

(declare-fun b!134759 () Bool)

(declare-fun res!112007 () Bool)

(assert (=> b!134759 (=> (not res!112007) (not e!89420))))

(assert (=> b!134759 (= res!112007 (bvslt from!447 to!404))))

(declare-fun b!134760 () Bool)

(declare-fun res!112016 () Bool)

(assert (=> b!134760 (=> (not res!112016) (not e!89413))))

(assert (=> b!134760 (= res!112016 (isPrefixOf!0 thiss!1634 (_2!6148 lt!209038)))))

(declare-fun b!134761 () Bool)

(declare-fun res!112005 () Bool)

(assert (=> b!134761 (=> (not res!112005) (not e!89413))))

(assert (=> b!134761 (= res!112005 (= (bitIndex!0 (size!2783 (buf!3176 (_2!6148 lt!209038))) (currentByte!5973 (_2!6148 lt!209038)) (currentBit!5968 (_2!6148 lt!209038))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2783 (buf!3176 thiss!1634)) (currentByte!5973 thiss!1634) (currentBit!5968 thiss!1634)))))))

(declare-fun b!134762 () Bool)

(declare-fun e!89416 () Bool)

(declare-fun lt!209055 () tuple2!11666)

(assert (=> b!134762 (= e!89416 (not (arrayRangesEq!186 arr!237 (_2!6149 lt!209055) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!134763 () Bool)

(assert (=> b!134763 (= e!89417 (not e!89416))))

(declare-fun res!112010 () Bool)

(assert (=> b!134763 (=> res!112010 e!89416)))

(declare-fun lt!209061 () tuple2!11660)

(assert (=> b!134763 (= res!112010 (or (not (= (size!2783 (_2!6149 lt!209055)) (size!2783 arr!237))) (not (= (_1!6149 lt!209055) (_2!6146 lt!209061)))))))

(assert (=> b!134763 (= lt!209055 (readByteArrayLoopPure!0 (_1!6146 lt!209061) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209044 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!134763 (validate_offset_bits!1 ((_ sign_extend 32) (size!2783 (buf!3176 (_2!6148 lt!209062)))) ((_ sign_extend 32) (currentByte!5973 (_2!6148 lt!209038))) ((_ sign_extend 32) (currentBit!5968 (_2!6148 lt!209038))) lt!209044)))

(declare-fun lt!209047 () Unit!8404)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4830 array!6150 (_ BitVec 64)) Unit!8404)

(assert (=> b!134763 (= lt!209047 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6148 lt!209038) (buf!3176 (_2!6148 lt!209062)) lt!209044))))

(assert (=> b!134763 (= lt!209061 (reader!0 (_2!6148 lt!209038) (_2!6148 lt!209062)))))

(declare-fun b!134764 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134764 (= e!89421 (invariant!0 (currentBit!5968 thiss!1634) (currentByte!5973 thiss!1634) (size!2783 (buf!3176 (_2!6148 lt!209038)))))))

(declare-fun b!134765 () Bool)

(declare-fun res!112009 () Bool)

(assert (=> b!134765 (=> (not res!112009) (not e!89420))))

(assert (=> b!134765 (= res!112009 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2783 (buf!3176 thiss!1634))) ((_ sign_extend 32) (currentByte!5973 thiss!1634)) ((_ sign_extend 32) (currentBit!5968 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!134766 () Bool)

(assert (=> b!134766 (= e!89412 (= (_2!6147 lt!209043) (_2!6147 lt!209046)))))

(declare-fun b!134767 () Bool)

(assert (=> b!134767 (= e!89414 e!89417)))

(declare-fun res!112017 () Bool)

(assert (=> b!134767 (=> (not res!112017) (not e!89417))))

(assert (=> b!134767 (= res!112017 (= (bitIndex!0 (size!2783 (buf!3176 (_2!6148 lt!209062))) (currentByte!5973 (_2!6148 lt!209062)) (currentBit!5968 (_2!6148 lt!209062))) (bvadd (bitIndex!0 (size!2783 (buf!3176 (_2!6148 lt!209038))) (currentByte!5973 (_2!6148 lt!209038)) (currentBit!5968 (_2!6148 lt!209038))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!209044))))))

(assert (=> b!134767 (= lt!209044 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!134768 () Bool)

(declare-fun res!112008 () Bool)

(assert (=> b!134768 (=> (not res!112008) (not e!89420))))

(assert (=> b!134768 (= res!112008 (invariant!0 (currentBit!5968 thiss!1634) (currentByte!5973 thiss!1634) (size!2783 (buf!3176 thiss!1634))))))

(assert (= (and start!26350 res!112013) b!134765))

(assert (= (and b!134765 res!112009) b!134759))

(assert (= (and b!134759 res!112007) b!134768))

(assert (= (and b!134768 res!112008) b!134756))

(assert (= (and b!134756 res!112015) b!134761))

(assert (= (and b!134761 res!112005) b!134760))

(assert (= (and b!134760 res!112016) b!134755))

(assert (= (and b!134756 res!112006) b!134767))

(assert (= (and b!134767 res!112017) b!134758))

(assert (= (and b!134758 res!112011) b!134763))

(assert (= (and b!134763 (not res!112010)) b!134762))

(assert (= (and b!134756 res!112014) b!134764))

(assert (= (and b!134756 res!112012) b!134766))

(assert (= start!26350 b!134757))

(declare-fun m!205227 () Bool)

(assert (=> b!134764 m!205227))

(declare-fun m!205229 () Bool)

(assert (=> start!26350 m!205229))

(declare-fun m!205231 () Bool)

(assert (=> start!26350 m!205231))

(declare-fun m!205233 () Bool)

(assert (=> b!134761 m!205233))

(declare-fun m!205235 () Bool)

(assert (=> b!134761 m!205235))

(declare-fun m!205237 () Bool)

(assert (=> b!134757 m!205237))

(declare-fun m!205239 () Bool)

(assert (=> b!134760 m!205239))

(declare-fun m!205241 () Bool)

(assert (=> b!134763 m!205241))

(declare-fun m!205243 () Bool)

(assert (=> b!134763 m!205243))

(declare-fun m!205245 () Bool)

(assert (=> b!134763 m!205245))

(declare-fun m!205247 () Bool)

(assert (=> b!134763 m!205247))

(declare-fun m!205249 () Bool)

(assert (=> b!134762 m!205249))

(declare-fun m!205251 () Bool)

(assert (=> b!134758 m!205251))

(declare-fun m!205253 () Bool)

(assert (=> b!134767 m!205253))

(assert (=> b!134767 m!205233))

(declare-fun m!205255 () Bool)

(assert (=> b!134756 m!205255))

(declare-fun m!205257 () Bool)

(assert (=> b!134756 m!205257))

(declare-fun m!205259 () Bool)

(assert (=> b!134756 m!205259))

(declare-fun m!205261 () Bool)

(assert (=> b!134756 m!205261))

(declare-fun m!205263 () Bool)

(assert (=> b!134756 m!205263))

(declare-fun m!205265 () Bool)

(assert (=> b!134756 m!205265))

(declare-fun m!205267 () Bool)

(assert (=> b!134756 m!205267))

(declare-fun m!205269 () Bool)

(assert (=> b!134756 m!205269))

(assert (=> b!134756 m!205247))

(declare-fun m!205271 () Bool)

(assert (=> b!134756 m!205271))

(declare-fun m!205273 () Bool)

(assert (=> b!134756 m!205273))

(declare-fun m!205275 () Bool)

(assert (=> b!134756 m!205275))

(declare-fun m!205277 () Bool)

(assert (=> b!134756 m!205277))

(declare-fun m!205279 () Bool)

(assert (=> b!134756 m!205279))

(declare-fun m!205281 () Bool)

(assert (=> b!134756 m!205281))

(declare-fun m!205283 () Bool)

(assert (=> b!134756 m!205283))

(assert (=> b!134756 m!205267))

(declare-fun m!205285 () Bool)

(assert (=> b!134756 m!205285))

(declare-fun m!205287 () Bool)

(assert (=> b!134756 m!205287))

(declare-fun m!205289 () Bool)

(assert (=> b!134756 m!205289))

(declare-fun m!205291 () Bool)

(assert (=> b!134756 m!205291))

(declare-fun m!205293 () Bool)

(assert (=> b!134756 m!205293))

(declare-fun m!205295 () Bool)

(assert (=> b!134756 m!205295))

(declare-fun m!205297 () Bool)

(assert (=> b!134756 m!205297))

(declare-fun m!205299 () Bool)

(assert (=> b!134756 m!205299))

(declare-fun m!205301 () Bool)

(assert (=> b!134756 m!205301))

(declare-fun m!205303 () Bool)

(assert (=> b!134756 m!205303))

(assert (=> b!134756 m!205297))

(declare-fun m!205305 () Bool)

(assert (=> b!134765 m!205305))

(assert (=> b!134755 m!205297))

(declare-fun m!205307 () Bool)

(assert (=> b!134755 m!205307))

(declare-fun m!205309 () Bool)

(assert (=> b!134755 m!205309))

(declare-fun m!205311 () Bool)

(assert (=> b!134768 m!205311))

(check-sat (not b!134764) (not b!134756) (not b!134762) (not b!134765) (not b!134757) (not b!134761) (not b!134760) (not b!134767) (not start!26350) (not b!134758) (not b!134763) (not b!134755) (not b!134768))
