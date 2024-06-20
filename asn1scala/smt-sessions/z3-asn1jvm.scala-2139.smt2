; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54116 () Bool)

(assert start!54116)

(declare-fun b!252722 () Bool)

(declare-fun res!211762 () Bool)

(declare-fun e!175126 () Bool)

(assert (=> b!252722 (=> res!211762 e!175126)))

(declare-datatypes ((array!13740 0))(
  ( (array!13741 (arr!7016 (Array (_ BitVec 32) (_ BitVec 8))) (size!6029 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10980 0))(
  ( (BitStream!10981 (buf!6531 array!13740) (currentByte!11986 (_ BitVec 32)) (currentBit!11981 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21744 0))(
  ( (tuple2!21745 (_1!11800 BitStream!10980) (_2!11800 BitStream!10980)) )
))
(declare-fun lt!392498 () tuple2!21744)

(declare-fun lt!392483 () tuple2!21744)

(declare-fun withMovedBitIndex!0 (BitStream!10980 (_ BitVec 64)) BitStream!10980)

(assert (=> b!252722 (= res!211762 (not (= (_1!11800 lt!392498) (withMovedBitIndex!0 (_1!11800 lt!392483) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!252724 () Bool)

(declare-fun res!211763 () Bool)

(declare-fun e!175128 () Bool)

(assert (=> b!252724 (=> (not res!211763) (not e!175128))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun thiss!1005 () BitStream!10980)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!252724 (= res!211763 (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 thiss!1005))) ((_ sign_extend 32) (currentByte!11986 thiss!1005)) ((_ sign_extend 32) (currentBit!11981 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!252725 () Bool)

(declare-fun e!175129 () Bool)

(declare-datatypes ((Unit!18206 0))(
  ( (Unit!18207) )
))
(declare-datatypes ((tuple2!21746 0))(
  ( (tuple2!21747 (_1!11801 Unit!18206) (_2!11801 BitStream!10980)) )
))
(declare-fun lt!392492 () tuple2!21746)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252725 (= e!175129 (invariant!0 (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005) (size!6029 (buf!6531 (_2!11801 lt!392492)))))))

(declare-fun b!252726 () Bool)

(declare-fun res!211764 () Bool)

(declare-fun e!175131 () Bool)

(assert (=> b!252726 (=> (not res!211764) (not e!175131))))

(declare-fun lt!392494 () tuple2!21746)

(declare-fun isPrefixOf!0 (BitStream!10980 BitStream!10980) Bool)

(assert (=> b!252726 (= res!211764 (isPrefixOf!0 (_2!11801 lt!392494) (_2!11801 lt!392492)))))

(declare-fun b!252727 () Bool)

(declare-fun res!211769 () Bool)

(assert (=> b!252727 (=> (not res!211769) (not e!175129))))

(assert (=> b!252727 (= res!211769 (invariant!0 (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005) (size!6029 (buf!6531 (_2!11801 lt!392494)))))))

(declare-fun b!252728 () Bool)

(declare-fun e!175127 () Bool)

(declare-fun e!175136 () Bool)

(assert (=> b!252728 (= e!175127 e!175136)))

(declare-fun res!211757 () Bool)

(assert (=> b!252728 (=> (not res!211757) (not e!175136))))

(declare-datatypes ((tuple2!21748 0))(
  ( (tuple2!21749 (_1!11802 BitStream!10980) (_2!11802 Bool)) )
))
(declare-fun lt!392493 () tuple2!21748)

(declare-fun bit!26 () Bool)

(assert (=> b!252728 (= res!211757 (and (= (_2!11802 lt!392493) bit!26) (= (_1!11802 lt!392493) (_2!11801 lt!392494))))))

(declare-fun readBitPure!0 (BitStream!10980) tuple2!21748)

(declare-fun readerFrom!0 (BitStream!10980 (_ BitVec 32) (_ BitVec 32)) BitStream!10980)

(assert (=> b!252728 (= lt!392493 (readBitPure!0 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005))))))

(declare-fun b!252729 () Bool)

(declare-fun lt!392487 () tuple2!21748)

(declare-fun lt!392500 () tuple2!21744)

(assert (=> b!252729 (= e!175131 (not (or (not (_2!11802 lt!392487)) (not (= (_1!11802 lt!392487) (_2!11800 lt!392500))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10980 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21748)

(assert (=> b!252729 (= lt!392487 (checkBitsLoopPure!0 (_1!11800 lt!392500) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!392496 () (_ BitVec 64))

(assert (=> b!252729 (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494))) lt!392496)))

(declare-fun lt!392485 () Unit!18206)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10980 array!13740 (_ BitVec 64)) Unit!18206)

(assert (=> b!252729 (= lt!392485 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11801 lt!392494) (buf!6531 (_2!11801 lt!392492)) lt!392496))))

(declare-fun reader!0 (BitStream!10980 BitStream!10980) tuple2!21744)

(assert (=> b!252729 (= lt!392500 (reader!0 (_2!11801 lt!392494) (_2!11801 lt!392492)))))

(declare-fun b!252730 () Bool)

(declare-fun e!175130 () Bool)

(declare-fun array_inv!5770 (array!13740) Bool)

(assert (=> b!252730 (= e!175130 (array_inv!5770 (buf!6531 thiss!1005)))))

(declare-fun b!252731 () Bool)

(declare-fun lt!392486 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!252731 (= e!175136 (= (bitIndex!0 (size!6029 (buf!6531 (_1!11802 lt!392493))) (currentByte!11986 (_1!11802 lt!392493)) (currentBit!11981 (_1!11802 lt!392493))) lt!392486))))

(declare-fun b!252732 () Bool)

(declare-fun lt!392481 () tuple2!21748)

(declare-fun lt!392502 () tuple2!21748)

(assert (=> b!252732 (= e!175126 (= (_2!11802 lt!392481) (_2!11802 lt!392502)))))

(declare-fun b!252733 () Bool)

(declare-fun res!211765 () Bool)

(assert (=> b!252733 (=> (not res!211765) (not e!175127))))

(assert (=> b!252733 (= res!211765 (isPrefixOf!0 thiss!1005 (_2!11801 lt!392494)))))

(declare-fun b!252723 () Bool)

(declare-fun e!175135 () Bool)

(assert (=> b!252723 (= e!175135 e!175131)))

(declare-fun res!211766 () Bool)

(assert (=> b!252723 (=> (not res!211766) (not e!175131))))

(assert (=> b!252723 (= res!211766 (= (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392492))) (currentByte!11986 (_2!11801 lt!392492)) (currentBit!11981 (_2!11801 lt!392492))) (bvadd (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392494))) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494))) lt!392496)))))

(assert (=> b!252723 (= lt!392496 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun res!211756 () Bool)

(assert (=> start!54116 (=> (not res!211756) (not e!175128))))

(assert (=> start!54116 (= res!211756 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54116 e!175128))

(assert (=> start!54116 true))

(declare-fun inv!12 (BitStream!10980) Bool)

(assert (=> start!54116 (and (inv!12 thiss!1005) e!175130)))

(declare-fun b!252734 () Bool)

(declare-fun res!211758 () Bool)

(assert (=> b!252734 (=> (not res!211758) (not e!175128))))

(assert (=> b!252734 (= res!211758 (bvslt from!289 nBits!297))))

(declare-fun b!252735 () Bool)

(assert (=> b!252735 (= e!175128 (not e!175126))))

(declare-fun res!211767 () Bool)

(assert (=> b!252735 (=> res!211767 e!175126)))

(assert (=> b!252735 (= res!211767 (not (= (_1!11802 lt!392502) (_2!11800 lt!392498))))))

(assert (=> b!252735 (= lt!392502 (checkBitsLoopPure!0 (_1!11800 lt!392498) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!392491 () (_ BitVec 64))

(assert (=> b!252735 (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494))) lt!392491)))

(declare-fun lt!392489 () Unit!18206)

(assert (=> b!252735 (= lt!392489 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11801 lt!392494) (buf!6531 (_2!11801 lt!392492)) lt!392491))))

(assert (=> b!252735 (= lt!392481 (checkBitsLoopPure!0 (_1!11800 lt!392483) nBits!297 bit!26 from!289))))

(assert (=> b!252735 (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))) ((_ sign_extend 32) (currentByte!11986 thiss!1005)) ((_ sign_extend 32) (currentBit!11981 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!392482 () Unit!18206)

(assert (=> b!252735 (= lt!392482 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6531 (_2!11801 lt!392492)) (bvsub nBits!297 from!289)))))

(assert (=> b!252735 (= (_2!11802 (readBitPure!0 (_1!11800 lt!392483))) bit!26)))

(assert (=> b!252735 (= lt!392498 (reader!0 (_2!11801 lt!392494) (_2!11801 lt!392492)))))

(assert (=> b!252735 (= lt!392483 (reader!0 thiss!1005 (_2!11801 lt!392492)))))

(declare-fun e!175132 () Bool)

(assert (=> b!252735 e!175132))

(declare-fun res!211770 () Bool)

(assert (=> b!252735 (=> (not res!211770) (not e!175132))))

(declare-fun lt!392499 () tuple2!21748)

(declare-fun lt!392488 () tuple2!21748)

(assert (=> b!252735 (= res!211770 (= (bitIndex!0 (size!6029 (buf!6531 (_1!11802 lt!392499))) (currentByte!11986 (_1!11802 lt!392499)) (currentBit!11981 (_1!11802 lt!392499))) (bitIndex!0 (size!6029 (buf!6531 (_1!11802 lt!392488))) (currentByte!11986 (_1!11802 lt!392488)) (currentBit!11981 (_1!11802 lt!392488)))))))

(declare-fun lt!392484 () Unit!18206)

(declare-fun lt!392497 () BitStream!10980)

(declare-fun readBitPrefixLemma!0 (BitStream!10980 BitStream!10980) Unit!18206)

(assert (=> b!252735 (= lt!392484 (readBitPrefixLemma!0 lt!392497 (_2!11801 lt!392492)))))

(assert (=> b!252735 (= lt!392488 (readBitPure!0 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))))))

(assert (=> b!252735 (= lt!392499 (readBitPure!0 lt!392497))))

(assert (=> b!252735 (= lt!392497 (BitStream!10981 (buf!6531 (_2!11801 lt!392494)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))))

(assert (=> b!252735 e!175129))

(declare-fun res!211761 () Bool)

(assert (=> b!252735 (=> (not res!211761) (not e!175129))))

(assert (=> b!252735 (= res!211761 (isPrefixOf!0 thiss!1005 (_2!11801 lt!392492)))))

(declare-fun lt!392501 () Unit!18206)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10980 BitStream!10980 BitStream!10980) Unit!18206)

(assert (=> b!252735 (= lt!392501 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11801 lt!392494) (_2!11801 lt!392492)))))

(assert (=> b!252735 e!175135))

(declare-fun res!211759 () Bool)

(assert (=> b!252735 (=> (not res!211759) (not e!175135))))

(assert (=> b!252735 (= res!211759 (= (size!6029 (buf!6531 (_2!11801 lt!392494))) (size!6029 (buf!6531 (_2!11801 lt!392492)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10980 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21746)

(assert (=> b!252735 (= lt!392492 (appendNBitsLoop!0 (_2!11801 lt!392494) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252735 (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392494)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494))) lt!392491)))

(assert (=> b!252735 (= lt!392491 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!392495 () Unit!18206)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10980 BitStream!10980 (_ BitVec 64) (_ BitVec 64)) Unit!18206)

(assert (=> b!252735 (= lt!392495 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11801 lt!392494) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!175133 () Bool)

(assert (=> b!252735 e!175133))

(declare-fun res!211760 () Bool)

(assert (=> b!252735 (=> (not res!211760) (not e!175133))))

(assert (=> b!252735 (= res!211760 (= (size!6029 (buf!6531 thiss!1005)) (size!6029 (buf!6531 (_2!11801 lt!392494)))))))

(declare-fun appendBit!0 (BitStream!10980 Bool) tuple2!21746)

(assert (=> b!252735 (= lt!392494 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!252736 () Bool)

(assert (=> b!252736 (= e!175132 (= (_2!11802 lt!392499) (_2!11802 lt!392488)))))

(declare-fun b!252737 () Bool)

(assert (=> b!252737 (= e!175133 e!175127)))

(declare-fun res!211768 () Bool)

(assert (=> b!252737 (=> (not res!211768) (not e!175127))))

(declare-fun lt!392490 () (_ BitVec 64))

(assert (=> b!252737 (= res!211768 (= lt!392486 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!392490)))))

(assert (=> b!252737 (= lt!392486 (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392494))) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494))))))

(assert (=> b!252737 (= lt!392490 (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))))

(assert (= (and start!54116 res!211756) b!252724))

(assert (= (and b!252724 res!211763) b!252734))

(assert (= (and b!252734 res!211758) b!252735))

(assert (= (and b!252735 res!211760) b!252737))

(assert (= (and b!252737 res!211768) b!252733))

(assert (= (and b!252733 res!211765) b!252728))

(assert (= (and b!252728 res!211757) b!252731))

(assert (= (and b!252735 res!211759) b!252723))

(assert (= (and b!252723 res!211766) b!252726))

(assert (= (and b!252726 res!211764) b!252729))

(assert (= (and b!252735 res!211761) b!252727))

(assert (= (and b!252727 res!211769) b!252725))

(assert (= (and b!252735 res!211770) b!252736))

(assert (= (and b!252735 (not res!211767)) b!252722))

(assert (= (and b!252722 (not res!211762)) b!252732))

(assert (= start!54116 b!252730))

(declare-fun m!380261 () Bool)

(assert (=> b!252722 m!380261))

(declare-fun m!380263 () Bool)

(assert (=> b!252731 m!380263))

(declare-fun m!380265 () Bool)

(assert (=> b!252725 m!380265))

(declare-fun m!380267 () Bool)

(assert (=> b!252730 m!380267))

(declare-fun m!380269 () Bool)

(assert (=> b!252737 m!380269))

(declare-fun m!380271 () Bool)

(assert (=> b!252737 m!380271))

(declare-fun m!380273 () Bool)

(assert (=> b!252727 m!380273))

(declare-fun m!380275 () Bool)

(assert (=> start!54116 m!380275))

(declare-fun m!380277 () Bool)

(assert (=> b!252729 m!380277))

(declare-fun m!380279 () Bool)

(assert (=> b!252729 m!380279))

(declare-fun m!380281 () Bool)

(assert (=> b!252729 m!380281))

(declare-fun m!380283 () Bool)

(assert (=> b!252729 m!380283))

(declare-fun m!380285 () Bool)

(assert (=> b!252723 m!380285))

(assert (=> b!252723 m!380269))

(declare-fun m!380287 () Bool)

(assert (=> b!252724 m!380287))

(declare-fun m!380289 () Bool)

(assert (=> b!252728 m!380289))

(assert (=> b!252728 m!380289))

(declare-fun m!380291 () Bool)

(assert (=> b!252728 m!380291))

(declare-fun m!380293 () Bool)

(assert (=> b!252733 m!380293))

(declare-fun m!380295 () Bool)

(assert (=> b!252726 m!380295))

(declare-fun m!380297 () Bool)

(assert (=> b!252735 m!380297))

(declare-fun m!380299 () Bool)

(assert (=> b!252735 m!380299))

(declare-fun m!380301 () Bool)

(assert (=> b!252735 m!380301))

(declare-fun m!380303 () Bool)

(assert (=> b!252735 m!380303))

(declare-fun m!380305 () Bool)

(assert (=> b!252735 m!380305))

(declare-fun m!380307 () Bool)

(assert (=> b!252735 m!380307))

(declare-fun m!380309 () Bool)

(assert (=> b!252735 m!380309))

(declare-fun m!380311 () Bool)

(assert (=> b!252735 m!380311))

(declare-fun m!380313 () Bool)

(assert (=> b!252735 m!380313))

(declare-fun m!380315 () Bool)

(assert (=> b!252735 m!380315))

(declare-fun m!380317 () Bool)

(assert (=> b!252735 m!380317))

(declare-fun m!380319 () Bool)

(assert (=> b!252735 m!380319))

(declare-fun m!380321 () Bool)

(assert (=> b!252735 m!380321))

(declare-fun m!380323 () Bool)

(assert (=> b!252735 m!380323))

(declare-fun m!380325 () Bool)

(assert (=> b!252735 m!380325))

(declare-fun m!380327 () Bool)

(assert (=> b!252735 m!380327))

(declare-fun m!380329 () Bool)

(assert (=> b!252735 m!380329))

(declare-fun m!380331 () Bool)

(assert (=> b!252735 m!380331))

(declare-fun m!380333 () Bool)

(assert (=> b!252735 m!380333))

(assert (=> b!252735 m!380283))

(check-sat (not b!252723) (not b!252725) (not b!252729) (not start!54116) (not b!252730) (not b!252724) (not b!252735) (not b!252728) (not b!252726) (not b!252733) (not b!252737) (not b!252727) (not b!252722) (not b!252731))
(check-sat)
(get-model)

(declare-fun d!84402 () Bool)

(declare-datatypes ((tuple2!21760 0))(
  ( (tuple2!21761 (_1!11808 Bool) (_2!11808 BitStream!10980)) )
))
(declare-fun lt!392979 () tuple2!21760)

(declare-fun readBit!0 (BitStream!10980) tuple2!21760)

(assert (=> d!84402 (= lt!392979 (readBit!0 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005))))))

(assert (=> d!84402 (= (readBitPure!0 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005))) (tuple2!21749 (_2!11808 lt!392979) (_1!11808 lt!392979)))))

(declare-fun bs!21393 () Bool)

(assert (= bs!21393 d!84402))

(assert (=> bs!21393 m!380289))

(declare-fun m!380737 () Bool)

(assert (=> bs!21393 m!380737))

(assert (=> b!252728 d!84402))

(declare-fun d!84404 () Bool)

(declare-fun e!175272 () Bool)

(assert (=> d!84404 e!175272))

(declare-fun res!211979 () Bool)

(assert (=> d!84404 (=> (not res!211979) (not e!175272))))

(assert (=> d!84404 (= res!211979 (invariant!0 (currentBit!11981 (_2!11801 lt!392494)) (currentByte!11986 (_2!11801 lt!392494)) (size!6029 (buf!6531 (_2!11801 lt!392494)))))))

(assert (=> d!84404 (= (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005)) (BitStream!10981 (buf!6531 (_2!11801 lt!392494)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))))

(declare-fun b!252964 () Bool)

(assert (=> b!252964 (= e!175272 (invariant!0 (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005) (size!6029 (buf!6531 (_2!11801 lt!392494)))))))

(assert (= (and d!84404 res!211979) b!252964))

(declare-fun m!380739 () Bool)

(assert (=> d!84404 m!380739))

(assert (=> b!252964 m!380273))

(assert (=> b!252728 d!84404))

(declare-fun d!84406 () Bool)

(assert (=> d!84406 (= (invariant!0 (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005) (size!6029 (buf!6531 (_2!11801 lt!392494)))) (and (bvsge (currentBit!11981 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11981 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11986 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11986 thiss!1005) (size!6029 (buf!6531 (_2!11801 lt!392494)))) (and (= (currentBit!11981 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11986 thiss!1005) (size!6029 (buf!6531 (_2!11801 lt!392494))))))))))

(assert (=> b!252727 d!84406))

(declare-fun d!84408 () Bool)

(declare-fun e!175275 () Bool)

(assert (=> d!84408 e!175275))

(declare-fun res!211984 () Bool)

(assert (=> d!84408 (=> (not res!211984) (not e!175275))))

(declare-fun lt!392996 () (_ BitVec 64))

(declare-fun lt!392994 () (_ BitVec 64))

(declare-fun lt!392997 () (_ BitVec 64))

(assert (=> d!84408 (= res!211984 (= lt!392996 (bvsub lt!392994 lt!392997)))))

(assert (=> d!84408 (or (= (bvand lt!392994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!392997 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!392994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!392994 lt!392997) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!84408 (= lt!392997 (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392494)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494)))))))

(declare-fun lt!392995 () (_ BitVec 64))

(declare-fun lt!392993 () (_ BitVec 64))

(assert (=> d!84408 (= lt!392994 (bvmul lt!392995 lt!392993))))

(assert (=> d!84408 (or (= lt!392995 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!392993 (bvsdiv (bvmul lt!392995 lt!392993) lt!392995)))))

(assert (=> d!84408 (= lt!392993 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84408 (= lt!392995 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392494)))))))

(assert (=> d!84408 (= lt!392996 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494)))))))

(assert (=> d!84408 (invariant!0 (currentBit!11981 (_2!11801 lt!392494)) (currentByte!11986 (_2!11801 lt!392494)) (size!6029 (buf!6531 (_2!11801 lt!392494))))))

(assert (=> d!84408 (= (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392494))) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494))) lt!392996)))

(declare-fun b!252969 () Bool)

(declare-fun res!211985 () Bool)

(assert (=> b!252969 (=> (not res!211985) (not e!175275))))

(assert (=> b!252969 (= res!211985 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!392996))))

(declare-fun b!252970 () Bool)

(declare-fun lt!392992 () (_ BitVec 64))

(assert (=> b!252970 (= e!175275 (bvsle lt!392996 (bvmul lt!392992 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!252970 (or (= lt!392992 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!392992 #b0000000000000000000000000000000000000000000000000000000000001000) lt!392992)))))

(assert (=> b!252970 (= lt!392992 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392494)))))))

(assert (= (and d!84408 res!211984) b!252969))

(assert (= (and b!252969 res!211985) b!252970))

(declare-fun m!380741 () Bool)

(assert (=> d!84408 m!380741))

(assert (=> d!84408 m!380739))

(assert (=> b!252737 d!84408))

(declare-fun d!84410 () Bool)

(declare-fun e!175276 () Bool)

(assert (=> d!84410 e!175276))

(declare-fun res!211986 () Bool)

(assert (=> d!84410 (=> (not res!211986) (not e!175276))))

(declare-fun lt!393000 () (_ BitVec 64))

(declare-fun lt!393002 () (_ BitVec 64))

(declare-fun lt!393003 () (_ BitVec 64))

(assert (=> d!84410 (= res!211986 (= lt!393002 (bvsub lt!393000 lt!393003)))))

(assert (=> d!84410 (or (= (bvand lt!393000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393003 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393000 lt!393003) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84410 (= lt!393003 (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 thiss!1005))) ((_ sign_extend 32) (currentByte!11986 thiss!1005)) ((_ sign_extend 32) (currentBit!11981 thiss!1005))))))

(declare-fun lt!393001 () (_ BitVec 64))

(declare-fun lt!392999 () (_ BitVec 64))

(assert (=> d!84410 (= lt!393000 (bvmul lt!393001 lt!392999))))

(assert (=> d!84410 (or (= lt!393001 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!392999 (bvsdiv (bvmul lt!393001 lt!392999) lt!393001)))))

(assert (=> d!84410 (= lt!392999 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84410 (= lt!393001 ((_ sign_extend 32) (size!6029 (buf!6531 thiss!1005))))))

(assert (=> d!84410 (= lt!393002 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11986 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11981 thiss!1005))))))

(assert (=> d!84410 (invariant!0 (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005) (size!6029 (buf!6531 thiss!1005)))))

(assert (=> d!84410 (= (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)) lt!393002)))

(declare-fun b!252971 () Bool)

(declare-fun res!211987 () Bool)

(assert (=> b!252971 (=> (not res!211987) (not e!175276))))

(assert (=> b!252971 (= res!211987 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393002))))

(declare-fun b!252972 () Bool)

(declare-fun lt!392998 () (_ BitVec 64))

(assert (=> b!252972 (= e!175276 (bvsle lt!393002 (bvmul lt!392998 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!252972 (or (= lt!392998 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!392998 #b0000000000000000000000000000000000000000000000000000000000001000) lt!392998)))))

(assert (=> b!252972 (= lt!392998 ((_ sign_extend 32) (size!6029 (buf!6531 thiss!1005))))))

(assert (= (and d!84410 res!211986) b!252971))

(assert (= (and b!252971 res!211987) b!252972))

(declare-fun m!380743 () Bool)

(assert (=> d!84410 m!380743))

(declare-fun m!380745 () Bool)

(assert (=> d!84410 m!380745))

(assert (=> b!252737 d!84410))

(declare-fun d!84412 () Bool)

(declare-fun e!175277 () Bool)

(assert (=> d!84412 e!175277))

(declare-fun res!211988 () Bool)

(assert (=> d!84412 (=> (not res!211988) (not e!175277))))

(declare-fun lt!393006 () (_ BitVec 64))

(declare-fun lt!393009 () (_ BitVec 64))

(declare-fun lt!393008 () (_ BitVec 64))

(assert (=> d!84412 (= res!211988 (= lt!393008 (bvsub lt!393006 lt!393009)))))

(assert (=> d!84412 (or (= (bvand lt!393006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393009 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393006 lt!393009) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84412 (= lt!393009 (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!392493)))) ((_ sign_extend 32) (currentByte!11986 (_1!11802 lt!392493))) ((_ sign_extend 32) (currentBit!11981 (_1!11802 lt!392493)))))))

(declare-fun lt!393007 () (_ BitVec 64))

(declare-fun lt!393005 () (_ BitVec 64))

(assert (=> d!84412 (= lt!393006 (bvmul lt!393007 lt!393005))))

(assert (=> d!84412 (or (= lt!393007 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393005 (bvsdiv (bvmul lt!393007 lt!393005) lt!393007)))))

(assert (=> d!84412 (= lt!393005 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84412 (= lt!393007 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!392493)))))))

(assert (=> d!84412 (= lt!393008 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11986 (_1!11802 lt!392493))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11981 (_1!11802 lt!392493)))))))

(assert (=> d!84412 (invariant!0 (currentBit!11981 (_1!11802 lt!392493)) (currentByte!11986 (_1!11802 lt!392493)) (size!6029 (buf!6531 (_1!11802 lt!392493))))))

(assert (=> d!84412 (= (bitIndex!0 (size!6029 (buf!6531 (_1!11802 lt!392493))) (currentByte!11986 (_1!11802 lt!392493)) (currentBit!11981 (_1!11802 lt!392493))) lt!393008)))

(declare-fun b!252973 () Bool)

(declare-fun res!211989 () Bool)

(assert (=> b!252973 (=> (not res!211989) (not e!175277))))

(assert (=> b!252973 (= res!211989 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393008))))

(declare-fun b!252974 () Bool)

(declare-fun lt!393004 () (_ BitVec 64))

(assert (=> b!252974 (= e!175277 (bvsle lt!393008 (bvmul lt!393004 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!252974 (or (= lt!393004 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393004 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393004)))))

(assert (=> b!252974 (= lt!393004 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!392493)))))))

(assert (= (and d!84412 res!211988) b!252973))

(assert (= (and b!252973 res!211989) b!252974))

(declare-fun m!380747 () Bool)

(assert (=> d!84412 m!380747))

(declare-fun m!380749 () Bool)

(assert (=> d!84412 m!380749))

(assert (=> b!252731 d!84412))

(declare-fun d!84414 () Bool)

(assert (=> d!84414 (= (array_inv!5770 (buf!6531 thiss!1005)) (bvsge (size!6029 (buf!6531 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!252730 d!84414))

(declare-fun d!84416 () Bool)

(declare-fun lt!393012 () tuple2!21760)

(declare-fun checkBitsLoop!0 (BitStream!10980 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21760)

(assert (=> d!84416 (= lt!393012 (checkBitsLoop!0 (_1!11800 lt!392500) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!84416 (= (checkBitsLoopPure!0 (_1!11800 lt!392500) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21749 (_2!11808 lt!393012) (_1!11808 lt!393012)))))

(declare-fun bs!21394 () Bool)

(assert (= bs!21394 d!84416))

(declare-fun m!380751 () Bool)

(assert (=> bs!21394 m!380751))

(assert (=> b!252729 d!84416))

(declare-fun d!84418 () Bool)

(assert (=> d!84418 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494))) lt!392496) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494)))) lt!392496))))

(declare-fun bs!21395 () Bool)

(assert (= bs!21395 d!84418))

(declare-fun m!380753 () Bool)

(assert (=> bs!21395 m!380753))

(assert (=> b!252729 d!84418))

(declare-fun d!84420 () Bool)

(assert (=> d!84420 (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494))) lt!392496)))

(declare-fun lt!393015 () Unit!18206)

(declare-fun choose!9 (BitStream!10980 array!13740 (_ BitVec 64) BitStream!10980) Unit!18206)

(assert (=> d!84420 (= lt!393015 (choose!9 (_2!11801 lt!392494) (buf!6531 (_2!11801 lt!392492)) lt!392496 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494)))))))

(assert (=> d!84420 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11801 lt!392494) (buf!6531 (_2!11801 lt!392492)) lt!392496) lt!393015)))

(declare-fun bs!21396 () Bool)

(assert (= bs!21396 d!84420))

(assert (=> bs!21396 m!380279))

(declare-fun m!380755 () Bool)

(assert (=> bs!21396 m!380755))

(assert (=> b!252729 d!84420))

(declare-fun b!252985 () Bool)

(declare-fun e!175282 () Unit!18206)

(declare-fun Unit!18214 () Unit!18206)

(assert (=> b!252985 (= e!175282 Unit!18214)))

(declare-fun lt!393072 () (_ BitVec 64))

(declare-fun b!252986 () Bool)

(declare-fun lt!393068 () (_ BitVec 64))

(declare-fun e!175283 () Bool)

(declare-fun lt!393074 () tuple2!21744)

(assert (=> b!252986 (= e!175283 (= (_1!11800 lt!393074) (withMovedBitIndex!0 (_2!11800 lt!393074) (bvsub lt!393068 lt!393072))))))

(assert (=> b!252986 (or (= (bvand lt!393068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393072 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393068 lt!393072) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!252986 (= lt!393072 (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392492))) (currentByte!11986 (_2!11801 lt!392492)) (currentBit!11981 (_2!11801 lt!392492))))))

(assert (=> b!252986 (= lt!393068 (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392494))) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494))))))

(declare-fun b!252987 () Bool)

(declare-fun res!211996 () Bool)

(assert (=> b!252987 (=> (not res!211996) (not e!175283))))

(assert (=> b!252987 (= res!211996 (isPrefixOf!0 (_1!11800 lt!393074) (_2!11801 lt!392494)))))

(declare-fun b!252988 () Bool)

(declare-fun res!211997 () Bool)

(assert (=> b!252988 (=> (not res!211997) (not e!175283))))

(assert (=> b!252988 (= res!211997 (isPrefixOf!0 (_2!11800 lt!393074) (_2!11801 lt!392492)))))

(declare-fun b!252989 () Bool)

(declare-fun lt!393059 () Unit!18206)

(assert (=> b!252989 (= e!175282 lt!393059)))

(declare-fun lt!393063 () (_ BitVec 64))

(assert (=> b!252989 (= lt!393063 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!393062 () (_ BitVec 64))

(assert (=> b!252989 (= lt!393062 (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392494))) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13740 array!13740 (_ BitVec 64) (_ BitVec 64)) Unit!18206)

(assert (=> b!252989 (= lt!393059 (arrayBitRangesEqSymmetric!0 (buf!6531 (_2!11801 lt!392494)) (buf!6531 (_2!11801 lt!392492)) lt!393063 lt!393062))))

(declare-fun arrayBitRangesEq!0 (array!13740 array!13740 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!252989 (arrayBitRangesEq!0 (buf!6531 (_2!11801 lt!392492)) (buf!6531 (_2!11801 lt!392494)) lt!393063 lt!393062)))

(declare-fun d!84422 () Bool)

(assert (=> d!84422 e!175283))

(declare-fun res!211998 () Bool)

(assert (=> d!84422 (=> (not res!211998) (not e!175283))))

(assert (=> d!84422 (= res!211998 (isPrefixOf!0 (_1!11800 lt!393074) (_2!11800 lt!393074)))))

(declare-fun lt!393060 () BitStream!10980)

(assert (=> d!84422 (= lt!393074 (tuple2!21745 lt!393060 (_2!11801 lt!392492)))))

(declare-fun lt!393056 () Unit!18206)

(declare-fun lt!393071 () Unit!18206)

(assert (=> d!84422 (= lt!393056 lt!393071)))

(assert (=> d!84422 (isPrefixOf!0 lt!393060 (_2!11801 lt!392492))))

(assert (=> d!84422 (= lt!393071 (lemmaIsPrefixTransitive!0 lt!393060 (_2!11801 lt!392492) (_2!11801 lt!392492)))))

(declare-fun lt!393066 () Unit!18206)

(declare-fun lt!393065 () Unit!18206)

(assert (=> d!84422 (= lt!393066 lt!393065)))

(assert (=> d!84422 (isPrefixOf!0 lt!393060 (_2!11801 lt!392492))))

(assert (=> d!84422 (= lt!393065 (lemmaIsPrefixTransitive!0 lt!393060 (_2!11801 lt!392494) (_2!11801 lt!392492)))))

(declare-fun lt!393067 () Unit!18206)

(assert (=> d!84422 (= lt!393067 e!175282)))

(declare-fun c!11637 () Bool)

(assert (=> d!84422 (= c!11637 (not (= (size!6029 (buf!6531 (_2!11801 lt!392494))) #b00000000000000000000000000000000)))))

(declare-fun lt!393057 () Unit!18206)

(declare-fun lt!393070 () Unit!18206)

(assert (=> d!84422 (= lt!393057 lt!393070)))

(assert (=> d!84422 (isPrefixOf!0 (_2!11801 lt!392492) (_2!11801 lt!392492))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10980) Unit!18206)

(assert (=> d!84422 (= lt!393070 (lemmaIsPrefixRefl!0 (_2!11801 lt!392492)))))

(declare-fun lt!393058 () Unit!18206)

(declare-fun lt!393064 () Unit!18206)

(assert (=> d!84422 (= lt!393058 lt!393064)))

(assert (=> d!84422 (= lt!393064 (lemmaIsPrefixRefl!0 (_2!11801 lt!392492)))))

(declare-fun lt!393073 () Unit!18206)

(declare-fun lt!393069 () Unit!18206)

(assert (=> d!84422 (= lt!393073 lt!393069)))

(assert (=> d!84422 (isPrefixOf!0 lt!393060 lt!393060)))

(assert (=> d!84422 (= lt!393069 (lemmaIsPrefixRefl!0 lt!393060))))

(declare-fun lt!393061 () Unit!18206)

(declare-fun lt!393075 () Unit!18206)

(assert (=> d!84422 (= lt!393061 lt!393075)))

(assert (=> d!84422 (isPrefixOf!0 (_2!11801 lt!392494) (_2!11801 lt!392494))))

(assert (=> d!84422 (= lt!393075 (lemmaIsPrefixRefl!0 (_2!11801 lt!392494)))))

(assert (=> d!84422 (= lt!393060 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494))))))

(assert (=> d!84422 (isPrefixOf!0 (_2!11801 lt!392494) (_2!11801 lt!392492))))

(assert (=> d!84422 (= (reader!0 (_2!11801 lt!392494) (_2!11801 lt!392492)) lt!393074)))

(assert (= (and d!84422 c!11637) b!252989))

(assert (= (and d!84422 (not c!11637)) b!252985))

(assert (= (and d!84422 res!211998) b!252987))

(assert (= (and b!252987 res!211996) b!252988))

(assert (= (and b!252988 res!211997) b!252986))

(declare-fun m!380757 () Bool)

(assert (=> d!84422 m!380757))

(declare-fun m!380759 () Bool)

(assert (=> d!84422 m!380759))

(declare-fun m!380761 () Bool)

(assert (=> d!84422 m!380761))

(declare-fun m!380763 () Bool)

(assert (=> d!84422 m!380763))

(declare-fun m!380765 () Bool)

(assert (=> d!84422 m!380765))

(declare-fun m!380767 () Bool)

(assert (=> d!84422 m!380767))

(declare-fun m!380769 () Bool)

(assert (=> d!84422 m!380769))

(assert (=> d!84422 m!380295))

(declare-fun m!380771 () Bool)

(assert (=> d!84422 m!380771))

(declare-fun m!380773 () Bool)

(assert (=> d!84422 m!380773))

(declare-fun m!380775 () Bool)

(assert (=> d!84422 m!380775))

(declare-fun m!380777 () Bool)

(assert (=> b!252986 m!380777))

(assert (=> b!252986 m!380285))

(assert (=> b!252986 m!380269))

(assert (=> b!252989 m!380269))

(declare-fun m!380779 () Bool)

(assert (=> b!252989 m!380779))

(declare-fun m!380781 () Bool)

(assert (=> b!252989 m!380781))

(declare-fun m!380783 () Bool)

(assert (=> b!252987 m!380783))

(declare-fun m!380785 () Bool)

(assert (=> b!252988 m!380785))

(assert (=> b!252729 d!84422))

(declare-fun d!84424 () Bool)

(declare-fun e!175284 () Bool)

(assert (=> d!84424 e!175284))

(declare-fun res!211999 () Bool)

(assert (=> d!84424 (=> (not res!211999) (not e!175284))))

(declare-fun lt!393078 () (_ BitVec 64))

(declare-fun lt!393080 () (_ BitVec 64))

(declare-fun lt!393081 () (_ BitVec 64))

(assert (=> d!84424 (= res!211999 (= lt!393080 (bvsub lt!393078 lt!393081)))))

(assert (=> d!84424 (or (= (bvand lt!393078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393081 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393078 lt!393081) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84424 (= lt!393081 (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392492))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392492)))))))

(declare-fun lt!393079 () (_ BitVec 64))

(declare-fun lt!393077 () (_ BitVec 64))

(assert (=> d!84424 (= lt!393078 (bvmul lt!393079 lt!393077))))

(assert (=> d!84424 (or (= lt!393079 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393077 (bvsdiv (bvmul lt!393079 lt!393077) lt!393079)))))

(assert (=> d!84424 (= lt!393077 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84424 (= lt!393079 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))))))

(assert (=> d!84424 (= lt!393080 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392492))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392492)))))))

(assert (=> d!84424 (invariant!0 (currentBit!11981 (_2!11801 lt!392492)) (currentByte!11986 (_2!11801 lt!392492)) (size!6029 (buf!6531 (_2!11801 lt!392492))))))

(assert (=> d!84424 (= (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392492))) (currentByte!11986 (_2!11801 lt!392492)) (currentBit!11981 (_2!11801 lt!392492))) lt!393080)))

(declare-fun b!252990 () Bool)

(declare-fun res!212000 () Bool)

(assert (=> b!252990 (=> (not res!212000) (not e!175284))))

(assert (=> b!252990 (= res!212000 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393080))))

(declare-fun b!252991 () Bool)

(declare-fun lt!393076 () (_ BitVec 64))

(assert (=> b!252991 (= e!175284 (bvsle lt!393080 (bvmul lt!393076 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!252991 (or (= lt!393076 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393076 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393076)))))

(assert (=> b!252991 (= lt!393076 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))))))

(assert (= (and d!84424 res!211999) b!252990))

(assert (= (and b!252990 res!212000) b!252991))

(declare-fun m!380787 () Bool)

(assert (=> d!84424 m!380787))

(declare-fun m!380789 () Bool)

(assert (=> d!84424 m!380789))

(assert (=> b!252723 d!84424))

(assert (=> b!252723 d!84408))

(declare-fun d!84426 () Bool)

(declare-fun res!212007 () Bool)

(declare-fun e!175290 () Bool)

(assert (=> d!84426 (=> (not res!212007) (not e!175290))))

(assert (=> d!84426 (= res!212007 (= (size!6029 (buf!6531 thiss!1005)) (size!6029 (buf!6531 (_2!11801 lt!392494)))))))

(assert (=> d!84426 (= (isPrefixOf!0 thiss!1005 (_2!11801 lt!392494)) e!175290)))

(declare-fun b!252998 () Bool)

(declare-fun res!212008 () Bool)

(assert (=> b!252998 (=> (not res!212008) (not e!175290))))

(assert (=> b!252998 (= res!212008 (bvsle (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)) (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392494))) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494)))))))

(declare-fun b!252999 () Bool)

(declare-fun e!175289 () Bool)

(assert (=> b!252999 (= e!175290 e!175289)))

(declare-fun res!212009 () Bool)

(assert (=> b!252999 (=> res!212009 e!175289)))

(assert (=> b!252999 (= res!212009 (= (size!6029 (buf!6531 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!253000 () Bool)

(assert (=> b!253000 (= e!175289 (arrayBitRangesEq!0 (buf!6531 thiss!1005) (buf!6531 (_2!11801 lt!392494)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))))))

(assert (= (and d!84426 res!212007) b!252998))

(assert (= (and b!252998 res!212008) b!252999))

(assert (= (and b!252999 (not res!212009)) b!253000))

(assert (=> b!252998 m!380271))

(assert (=> b!252998 m!380269))

(assert (=> b!253000 m!380271))

(assert (=> b!253000 m!380271))

(declare-fun m!380791 () Bool)

(assert (=> b!253000 m!380791))

(assert (=> b!252733 d!84426))

(declare-fun d!84428 () Bool)

(declare-fun e!175293 () Bool)

(assert (=> d!84428 e!175293))

(declare-fun res!212012 () Bool)

(assert (=> d!84428 (=> (not res!212012) (not e!175293))))

(declare-fun lt!393087 () (_ BitVec 64))

(declare-fun lt!393086 () BitStream!10980)

(assert (=> d!84428 (= res!212012 (= (bvadd lt!393087 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!6029 (buf!6531 lt!393086)) (currentByte!11986 lt!393086) (currentBit!11981 lt!393086))))))

(assert (=> d!84428 (or (not (= (bvand lt!393087 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393087 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393087 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84428 (= lt!393087 (bitIndex!0 (size!6029 (buf!6531 (_1!11800 lt!392483))) (currentByte!11986 (_1!11800 lt!392483)) (currentBit!11981 (_1!11800 lt!392483))))))

(declare-fun moveBitIndex!0 (BitStream!10980 (_ BitVec 64)) tuple2!21746)

(assert (=> d!84428 (= lt!393086 (_2!11801 (moveBitIndex!0 (_1!11800 lt!392483) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!10980 (_ BitVec 64)) Bool)

(assert (=> d!84428 (moveBitIndexPrecond!0 (_1!11800 lt!392483) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!84428 (= (withMovedBitIndex!0 (_1!11800 lt!392483) #b0000000000000000000000000000000000000000000000000000000000000001) lt!393086)))

(declare-fun b!253003 () Bool)

(assert (=> b!253003 (= e!175293 (= (size!6029 (buf!6531 (_1!11800 lt!392483))) (size!6029 (buf!6531 lt!393086))))))

(assert (= (and d!84428 res!212012) b!253003))

(declare-fun m!380793 () Bool)

(assert (=> d!84428 m!380793))

(declare-fun m!380795 () Bool)

(assert (=> d!84428 m!380795))

(declare-fun m!380797 () Bool)

(assert (=> d!84428 m!380797))

(declare-fun m!380799 () Bool)

(assert (=> d!84428 m!380799))

(assert (=> b!252722 d!84428))

(declare-fun d!84430 () Bool)

(declare-fun res!212013 () Bool)

(declare-fun e!175295 () Bool)

(assert (=> d!84430 (=> (not res!212013) (not e!175295))))

(assert (=> d!84430 (= res!212013 (= (size!6029 (buf!6531 (_2!11801 lt!392494))) (size!6029 (buf!6531 (_2!11801 lt!392492)))))))

(assert (=> d!84430 (= (isPrefixOf!0 (_2!11801 lt!392494) (_2!11801 lt!392492)) e!175295)))

(declare-fun b!253004 () Bool)

(declare-fun res!212014 () Bool)

(assert (=> b!253004 (=> (not res!212014) (not e!175295))))

(assert (=> b!253004 (= res!212014 (bvsle (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392494))) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494))) (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392492))) (currentByte!11986 (_2!11801 lt!392492)) (currentBit!11981 (_2!11801 lt!392492)))))))

(declare-fun b!253005 () Bool)

(declare-fun e!175294 () Bool)

(assert (=> b!253005 (= e!175295 e!175294)))

(declare-fun res!212015 () Bool)

(assert (=> b!253005 (=> res!212015 e!175294)))

(assert (=> b!253005 (= res!212015 (= (size!6029 (buf!6531 (_2!11801 lt!392494))) #b00000000000000000000000000000000))))

(declare-fun b!253006 () Bool)

(assert (=> b!253006 (= e!175294 (arrayBitRangesEq!0 (buf!6531 (_2!11801 lt!392494)) (buf!6531 (_2!11801 lt!392492)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392494))) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494)))))))

(assert (= (and d!84430 res!212013) b!253004))

(assert (= (and b!253004 res!212014) b!253005))

(assert (= (and b!253005 (not res!212015)) b!253006))

(assert (=> b!253004 m!380269))

(assert (=> b!253004 m!380285))

(assert (=> b!253006 m!380269))

(assert (=> b!253006 m!380269))

(declare-fun m!380801 () Bool)

(assert (=> b!253006 m!380801))

(assert (=> b!252726 d!84430))

(declare-fun d!84432 () Bool)

(assert (=> d!84432 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005) (size!6029 (buf!6531 thiss!1005))))))

(declare-fun bs!21397 () Bool)

(assert (= bs!21397 d!84432))

(assert (=> bs!21397 m!380745))

(assert (=> start!54116 d!84432))

(declare-fun d!84434 () Bool)

(assert (=> d!84434 (= (invariant!0 (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005) (size!6029 (buf!6531 (_2!11801 lt!392492)))) (and (bvsge (currentBit!11981 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11981 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11986 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11986 thiss!1005) (size!6029 (buf!6531 (_2!11801 lt!392492)))) (and (= (currentBit!11981 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11986 thiss!1005) (size!6029 (buf!6531 (_2!11801 lt!392492))))))))))

(assert (=> b!252725 d!84434))

(declare-fun d!84436 () Bool)

(assert (=> d!84436 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))) ((_ sign_extend 32) (currentByte!11986 thiss!1005)) ((_ sign_extend 32) (currentBit!11981 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))) ((_ sign_extend 32) (currentByte!11986 thiss!1005)) ((_ sign_extend 32) (currentBit!11981 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21398 () Bool)

(assert (= bs!21398 d!84436))

(declare-fun m!380803 () Bool)

(assert (=> bs!21398 m!380803))

(assert (=> b!252735 d!84436))

(declare-fun b!253007 () Bool)

(declare-fun e!175296 () Unit!18206)

(declare-fun Unit!18215 () Unit!18206)

(assert (=> b!253007 (= e!175296 Unit!18215)))

(declare-fun e!175297 () Bool)

(declare-fun lt!393104 () (_ BitVec 64))

(declare-fun lt!393100 () (_ BitVec 64))

(declare-fun lt!393106 () tuple2!21744)

(declare-fun b!253008 () Bool)

(assert (=> b!253008 (= e!175297 (= (_1!11800 lt!393106) (withMovedBitIndex!0 (_2!11800 lt!393106) (bvsub lt!393100 lt!393104))))))

(assert (=> b!253008 (or (= (bvand lt!393100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393104 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393100 lt!393104) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253008 (= lt!393104 (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392492))) (currentByte!11986 (_2!11801 lt!392492)) (currentBit!11981 (_2!11801 lt!392492))))))

(assert (=> b!253008 (= lt!393100 (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))))

(declare-fun b!253009 () Bool)

(declare-fun res!212016 () Bool)

(assert (=> b!253009 (=> (not res!212016) (not e!175297))))

(assert (=> b!253009 (= res!212016 (isPrefixOf!0 (_1!11800 lt!393106) thiss!1005))))

(declare-fun b!253010 () Bool)

(declare-fun res!212017 () Bool)

(assert (=> b!253010 (=> (not res!212017) (not e!175297))))

(assert (=> b!253010 (= res!212017 (isPrefixOf!0 (_2!11800 lt!393106) (_2!11801 lt!392492)))))

(declare-fun b!253011 () Bool)

(declare-fun lt!393091 () Unit!18206)

(assert (=> b!253011 (= e!175296 lt!393091)))

(declare-fun lt!393095 () (_ BitVec 64))

(assert (=> b!253011 (= lt!393095 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!393094 () (_ BitVec 64))

(assert (=> b!253011 (= lt!393094 (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))))

(assert (=> b!253011 (= lt!393091 (arrayBitRangesEqSymmetric!0 (buf!6531 thiss!1005) (buf!6531 (_2!11801 lt!392492)) lt!393095 lt!393094))))

(assert (=> b!253011 (arrayBitRangesEq!0 (buf!6531 (_2!11801 lt!392492)) (buf!6531 thiss!1005) lt!393095 lt!393094)))

(declare-fun d!84438 () Bool)

(assert (=> d!84438 e!175297))

(declare-fun res!212018 () Bool)

(assert (=> d!84438 (=> (not res!212018) (not e!175297))))

(assert (=> d!84438 (= res!212018 (isPrefixOf!0 (_1!11800 lt!393106) (_2!11800 lt!393106)))))

(declare-fun lt!393092 () BitStream!10980)

(assert (=> d!84438 (= lt!393106 (tuple2!21745 lt!393092 (_2!11801 lt!392492)))))

(declare-fun lt!393088 () Unit!18206)

(declare-fun lt!393103 () Unit!18206)

(assert (=> d!84438 (= lt!393088 lt!393103)))

(assert (=> d!84438 (isPrefixOf!0 lt!393092 (_2!11801 lt!392492))))

(assert (=> d!84438 (= lt!393103 (lemmaIsPrefixTransitive!0 lt!393092 (_2!11801 lt!392492) (_2!11801 lt!392492)))))

(declare-fun lt!393098 () Unit!18206)

(declare-fun lt!393097 () Unit!18206)

(assert (=> d!84438 (= lt!393098 lt!393097)))

(assert (=> d!84438 (isPrefixOf!0 lt!393092 (_2!11801 lt!392492))))

(assert (=> d!84438 (= lt!393097 (lemmaIsPrefixTransitive!0 lt!393092 thiss!1005 (_2!11801 lt!392492)))))

(declare-fun lt!393099 () Unit!18206)

(assert (=> d!84438 (= lt!393099 e!175296)))

(declare-fun c!11638 () Bool)

(assert (=> d!84438 (= c!11638 (not (= (size!6029 (buf!6531 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!393089 () Unit!18206)

(declare-fun lt!393102 () Unit!18206)

(assert (=> d!84438 (= lt!393089 lt!393102)))

(assert (=> d!84438 (isPrefixOf!0 (_2!11801 lt!392492) (_2!11801 lt!392492))))

(assert (=> d!84438 (= lt!393102 (lemmaIsPrefixRefl!0 (_2!11801 lt!392492)))))

(declare-fun lt!393090 () Unit!18206)

(declare-fun lt!393096 () Unit!18206)

(assert (=> d!84438 (= lt!393090 lt!393096)))

(assert (=> d!84438 (= lt!393096 (lemmaIsPrefixRefl!0 (_2!11801 lt!392492)))))

(declare-fun lt!393105 () Unit!18206)

(declare-fun lt!393101 () Unit!18206)

(assert (=> d!84438 (= lt!393105 lt!393101)))

(assert (=> d!84438 (isPrefixOf!0 lt!393092 lt!393092)))

(assert (=> d!84438 (= lt!393101 (lemmaIsPrefixRefl!0 lt!393092))))

(declare-fun lt!393093 () Unit!18206)

(declare-fun lt!393107 () Unit!18206)

(assert (=> d!84438 (= lt!393093 lt!393107)))

(assert (=> d!84438 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!84438 (= lt!393107 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!84438 (= lt!393092 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))))

(assert (=> d!84438 (isPrefixOf!0 thiss!1005 (_2!11801 lt!392492))))

(assert (=> d!84438 (= (reader!0 thiss!1005 (_2!11801 lt!392492)) lt!393106)))

(assert (= (and d!84438 c!11638) b!253011))

(assert (= (and d!84438 (not c!11638)) b!253007))

(assert (= (and d!84438 res!212018) b!253009))

(assert (= (and b!253009 res!212016) b!253010))

(assert (= (and b!253010 res!212017) b!253008))

(declare-fun m!380805 () Bool)

(assert (=> d!84438 m!380805))

(declare-fun m!380807 () Bool)

(assert (=> d!84438 m!380807))

(declare-fun m!380809 () Bool)

(assert (=> d!84438 m!380809))

(declare-fun m!380811 () Bool)

(assert (=> d!84438 m!380811))

(declare-fun m!380813 () Bool)

(assert (=> d!84438 m!380813))

(declare-fun m!380815 () Bool)

(assert (=> d!84438 m!380815))

(assert (=> d!84438 m!380769))

(assert (=> d!84438 m!380329))

(declare-fun m!380817 () Bool)

(assert (=> d!84438 m!380817))

(declare-fun m!380819 () Bool)

(assert (=> d!84438 m!380819))

(assert (=> d!84438 m!380775))

(declare-fun m!380821 () Bool)

(assert (=> b!253008 m!380821))

(assert (=> b!253008 m!380285))

(assert (=> b!253008 m!380271))

(assert (=> b!253011 m!380271))

(declare-fun m!380823 () Bool)

(assert (=> b!253011 m!380823))

(declare-fun m!380825 () Bool)

(assert (=> b!253011 m!380825))

(declare-fun m!380827 () Bool)

(assert (=> b!253009 m!380827))

(declare-fun m!380829 () Bool)

(assert (=> b!253010 m!380829))

(assert (=> b!252735 d!84438))

(assert (=> b!252735 d!84422))

(declare-fun d!84440 () Bool)

(assert (=> d!84440 (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494))) lt!392491)))

(declare-fun lt!393108 () Unit!18206)

(assert (=> d!84440 (= lt!393108 (choose!9 (_2!11801 lt!392494) (buf!6531 (_2!11801 lt!392492)) lt!392491 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494)))))))

(assert (=> d!84440 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11801 lt!392494) (buf!6531 (_2!11801 lt!392492)) lt!392491) lt!393108)))

(declare-fun bs!21399 () Bool)

(assert (= bs!21399 d!84440))

(assert (=> bs!21399 m!380327))

(declare-fun m!380831 () Bool)

(assert (=> bs!21399 m!380831))

(assert (=> b!252735 d!84440))

(declare-fun d!84442 () Bool)

(declare-fun e!175300 () Bool)

(assert (=> d!84442 e!175300))

(declare-fun res!212021 () Bool)

(assert (=> d!84442 (=> (not res!212021) (not e!175300))))

(assert (=> d!84442 (= res!212021 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!393111 () Unit!18206)

(declare-fun choose!27 (BitStream!10980 BitStream!10980 (_ BitVec 64) (_ BitVec 64)) Unit!18206)

(assert (=> d!84442 (= lt!393111 (choose!27 thiss!1005 (_2!11801 lt!392494) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!84442 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!84442 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11801 lt!392494) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!393111)))

(declare-fun b!253014 () Bool)

(assert (=> b!253014 (= e!175300 (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392494)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!84442 res!212021) b!253014))

(declare-fun m!380833 () Bool)

(assert (=> d!84442 m!380833))

(declare-fun m!380835 () Bool)

(assert (=> b!253014 m!380835))

(assert (=> b!252735 d!84442))

(declare-fun d!84444 () Bool)

(assert (=> d!84444 (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))) ((_ sign_extend 32) (currentByte!11986 thiss!1005)) ((_ sign_extend 32) (currentBit!11981 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!393112 () Unit!18206)

(assert (=> d!84444 (= lt!393112 (choose!9 thiss!1005 (buf!6531 (_2!11801 lt!392492)) (bvsub nBits!297 from!289) (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))))))

(assert (=> d!84444 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6531 (_2!11801 lt!392492)) (bvsub nBits!297 from!289)) lt!393112)))

(declare-fun bs!21400 () Bool)

(assert (= bs!21400 d!84444))

(assert (=> bs!21400 m!380311))

(declare-fun m!380837 () Bool)

(assert (=> bs!21400 m!380837))

(assert (=> b!252735 d!84444))

(declare-fun d!84446 () Bool)

(declare-fun e!175306 () Bool)

(assert (=> d!84446 e!175306))

(declare-fun res!212030 () Bool)

(assert (=> d!84446 (=> (not res!212030) (not e!175306))))

(declare-fun lt!393131 () tuple2!21746)

(assert (=> d!84446 (= res!212030 (= (size!6029 (buf!6531 (_2!11801 lt!392494))) (size!6029 (buf!6531 (_2!11801 lt!393131)))))))

(declare-fun choose!51 (BitStream!10980 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21746)

(assert (=> d!84446 (= lt!393131 (choose!51 (_2!11801 lt!392494) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!84446 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!84446 (= (appendNBitsLoop!0 (_2!11801 lt!392494) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!393131)))

(declare-fun b!253026 () Bool)

(declare-fun e!175305 () Bool)

(declare-fun lt!393135 () (_ BitVec 64))

(assert (=> b!253026 (= e!175305 (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392494)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494))) lt!393135))))

(declare-fun b!253025 () Bool)

(declare-fun lt!393132 () tuple2!21748)

(declare-fun lt!393136 () tuple2!21744)

(assert (=> b!253025 (= e!175306 (and (_2!11802 lt!393132) (= (_1!11802 lt!393132) (_2!11800 lt!393136))))))

(assert (=> b!253025 (= lt!393132 (checkBitsLoopPure!0 (_1!11800 lt!393136) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!393134 () Unit!18206)

(declare-fun lt!393133 () Unit!18206)

(assert (=> b!253025 (= lt!393134 lt!393133)))

(assert (=> b!253025 (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!393131)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494))) lt!393135)))

(assert (=> b!253025 (= lt!393133 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11801 lt!392494) (buf!6531 (_2!11801 lt!393131)) lt!393135))))

(assert (=> b!253025 e!175305))

(declare-fun res!212031 () Bool)

(assert (=> b!253025 (=> (not res!212031) (not e!175305))))

(assert (=> b!253025 (= res!212031 (and (= (size!6029 (buf!6531 (_2!11801 lt!392494))) (size!6029 (buf!6531 (_2!11801 lt!393131)))) (bvsge lt!393135 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253025 (= lt!393135 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!253025 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253025 (= lt!393136 (reader!0 (_2!11801 lt!392494) (_2!11801 lt!393131)))))

(declare-fun b!253024 () Bool)

(declare-fun res!212033 () Bool)

(assert (=> b!253024 (=> (not res!212033) (not e!175306))))

(assert (=> b!253024 (= res!212033 (isPrefixOf!0 (_2!11801 lt!392494) (_2!11801 lt!393131)))))

(declare-fun b!253023 () Bool)

(declare-fun res!212032 () Bool)

(assert (=> b!253023 (=> (not res!212032) (not e!175306))))

(declare-fun lt!393129 () (_ BitVec 64))

(declare-fun lt!393130 () (_ BitVec 64))

(assert (=> b!253023 (= res!212032 (= (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!393131))) (currentByte!11986 (_2!11801 lt!393131)) (currentBit!11981 (_2!11801 lt!393131))) (bvadd lt!393130 lt!393129)))))

(assert (=> b!253023 (or (not (= (bvand lt!393130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393129 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393130 lt!393129) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253023 (= lt!393129 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!253023 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253023 (= lt!393130 (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392494))) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494))))))

(assert (= (and d!84446 res!212030) b!253023))

(assert (= (and b!253023 res!212032) b!253024))

(assert (= (and b!253024 res!212033) b!253025))

(assert (= (and b!253025 res!212031) b!253026))

(declare-fun m!380839 () Bool)

(assert (=> b!253026 m!380839))

(declare-fun m!380841 () Bool)

(assert (=> b!253023 m!380841))

(assert (=> b!253023 m!380269))

(declare-fun m!380843 () Bool)

(assert (=> b!253024 m!380843))

(declare-fun m!380845 () Bool)

(assert (=> d!84446 m!380845))

(declare-fun m!380847 () Bool)

(assert (=> b!253025 m!380847))

(declare-fun m!380849 () Bool)

(assert (=> b!253025 m!380849))

(declare-fun m!380851 () Bool)

(assert (=> b!253025 m!380851))

(declare-fun m!380853 () Bool)

(assert (=> b!253025 m!380853))

(assert (=> b!252735 d!84446))

(declare-fun d!84448 () Bool)

(declare-fun res!212034 () Bool)

(declare-fun e!175308 () Bool)

(assert (=> d!84448 (=> (not res!212034) (not e!175308))))

(assert (=> d!84448 (= res!212034 (= (size!6029 (buf!6531 thiss!1005)) (size!6029 (buf!6531 (_2!11801 lt!392492)))))))

(assert (=> d!84448 (= (isPrefixOf!0 thiss!1005 (_2!11801 lt!392492)) e!175308)))

(declare-fun b!253027 () Bool)

(declare-fun res!212035 () Bool)

(assert (=> b!253027 (=> (not res!212035) (not e!175308))))

(assert (=> b!253027 (= res!212035 (bvsle (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)) (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392492))) (currentByte!11986 (_2!11801 lt!392492)) (currentBit!11981 (_2!11801 lt!392492)))))))

(declare-fun b!253028 () Bool)

(declare-fun e!175307 () Bool)

(assert (=> b!253028 (= e!175308 e!175307)))

(declare-fun res!212036 () Bool)

(assert (=> b!253028 (=> res!212036 e!175307)))

(assert (=> b!253028 (= res!212036 (= (size!6029 (buf!6531 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!253029 () Bool)

(assert (=> b!253029 (= e!175307 (arrayBitRangesEq!0 (buf!6531 thiss!1005) (buf!6531 (_2!11801 lt!392492)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))))))

(assert (= (and d!84448 res!212034) b!253027))

(assert (= (and b!253027 res!212035) b!253028))

(assert (= (and b!253028 (not res!212036)) b!253029))

(assert (=> b!253027 m!380271))

(assert (=> b!253027 m!380285))

(assert (=> b!253029 m!380271))

(assert (=> b!253029 m!380271))

(declare-fun m!380855 () Bool)

(assert (=> b!253029 m!380855))

(assert (=> b!252735 d!84448))

(declare-fun d!84450 () Bool)

(assert (=> d!84450 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494))) lt!392491) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494)))) lt!392491))))

(declare-fun bs!21401 () Bool)

(assert (= bs!21401 d!84450))

(assert (=> bs!21401 m!380753))

(assert (=> b!252735 d!84450))

(declare-fun d!84452 () Bool)

(declare-fun lt!393137 () tuple2!21760)

(assert (=> d!84452 (= lt!393137 (readBit!0 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))))))

(assert (=> d!84452 (= (readBitPure!0 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))) (tuple2!21749 (_2!11808 lt!393137) (_1!11808 lt!393137)))))

(declare-fun bs!21402 () Bool)

(assert (= bs!21402 d!84452))

(declare-fun m!380857 () Bool)

(assert (=> bs!21402 m!380857))

(assert (=> b!252735 d!84452))

(declare-fun b!253039 () Bool)

(declare-fun res!212046 () Bool)

(declare-fun e!175314 () Bool)

(assert (=> b!253039 (=> (not res!212046) (not e!175314))))

(declare-fun lt!393147 () tuple2!21746)

(declare-fun lt!393146 () (_ BitVec 64))

(declare-fun lt!393149 () (_ BitVec 64))

(assert (=> b!253039 (= res!212046 (= (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!393147))) (currentByte!11986 (_2!11801 lt!393147)) (currentBit!11981 (_2!11801 lt!393147))) (bvadd lt!393149 lt!393146)))))

(assert (=> b!253039 (or (not (= (bvand lt!393149 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393146 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393149 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393149 lt!393146) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253039 (= lt!393146 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253039 (= lt!393149 (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))))

(declare-fun d!84454 () Bool)

(assert (=> d!84454 e!175314))

(declare-fun res!212045 () Bool)

(assert (=> d!84454 (=> (not res!212045) (not e!175314))))

(assert (=> d!84454 (= res!212045 (= (size!6029 (buf!6531 thiss!1005)) (size!6029 (buf!6531 (_2!11801 lt!393147)))))))

(declare-fun choose!16 (BitStream!10980 Bool) tuple2!21746)

(assert (=> d!84454 (= lt!393147 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!84454 (validate_offset_bit!0 ((_ sign_extend 32) (size!6029 (buf!6531 thiss!1005))) ((_ sign_extend 32) (currentByte!11986 thiss!1005)) ((_ sign_extend 32) (currentBit!11981 thiss!1005)))))

(assert (=> d!84454 (= (appendBit!0 thiss!1005 bit!26) lt!393147)))

(declare-fun b!253040 () Bool)

(declare-fun res!212047 () Bool)

(assert (=> b!253040 (=> (not res!212047) (not e!175314))))

(assert (=> b!253040 (= res!212047 (isPrefixOf!0 thiss!1005 (_2!11801 lt!393147)))))

(declare-fun b!253041 () Bool)

(declare-fun e!175313 () Bool)

(assert (=> b!253041 (= e!175314 e!175313)))

(declare-fun res!212048 () Bool)

(assert (=> b!253041 (=> (not res!212048) (not e!175313))))

(declare-fun lt!393148 () tuple2!21748)

(assert (=> b!253041 (= res!212048 (and (= (_2!11802 lt!393148) bit!26) (= (_1!11802 lt!393148) (_2!11801 lt!393147))))))

(assert (=> b!253041 (= lt!393148 (readBitPure!0 (readerFrom!0 (_2!11801 lt!393147) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005))))))

(declare-fun b!253042 () Bool)

(assert (=> b!253042 (= e!175313 (= (bitIndex!0 (size!6029 (buf!6531 (_1!11802 lt!393148))) (currentByte!11986 (_1!11802 lt!393148)) (currentBit!11981 (_1!11802 lt!393148))) (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!393147))) (currentByte!11986 (_2!11801 lt!393147)) (currentBit!11981 (_2!11801 lt!393147)))))))

(assert (= (and d!84454 res!212045) b!253039))

(assert (= (and b!253039 res!212046) b!253040))

(assert (= (and b!253040 res!212047) b!253041))

(assert (= (and b!253041 res!212048) b!253042))

(declare-fun m!380859 () Bool)

(assert (=> b!253040 m!380859))

(declare-fun m!380861 () Bool)

(assert (=> b!253041 m!380861))

(assert (=> b!253041 m!380861))

(declare-fun m!380863 () Bool)

(assert (=> b!253041 m!380863))

(declare-fun m!380865 () Bool)

(assert (=> b!253039 m!380865))

(assert (=> b!253039 m!380271))

(declare-fun m!380867 () Bool)

(assert (=> b!253042 m!380867))

(assert (=> b!253042 m!380865))

(declare-fun m!380869 () Bool)

(assert (=> d!84454 m!380869))

(declare-fun m!380871 () Bool)

(assert (=> d!84454 m!380871))

(assert (=> b!252735 d!84454))

(declare-fun d!84456 () Bool)

(declare-fun lt!393150 () tuple2!21760)

(assert (=> d!84456 (= lt!393150 (readBit!0 lt!392497))))

(assert (=> d!84456 (= (readBitPure!0 lt!392497) (tuple2!21749 (_2!11808 lt!393150) (_1!11808 lt!393150)))))

(declare-fun bs!21403 () Bool)

(assert (= bs!21403 d!84456))

(declare-fun m!380873 () Bool)

(assert (=> bs!21403 m!380873))

(assert (=> b!252735 d!84456))

(declare-fun d!84458 () Bool)

(declare-fun e!175315 () Bool)

(assert (=> d!84458 e!175315))

(declare-fun res!212049 () Bool)

(assert (=> d!84458 (=> (not res!212049) (not e!175315))))

(declare-fun lt!393155 () (_ BitVec 64))

(declare-fun lt!393156 () (_ BitVec 64))

(declare-fun lt!393153 () (_ BitVec 64))

(assert (=> d!84458 (= res!212049 (= lt!393155 (bvsub lt!393153 lt!393156)))))

(assert (=> d!84458 (or (= (bvand lt!393153 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393156 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393153 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393153 lt!393156) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84458 (= lt!393156 (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!392499)))) ((_ sign_extend 32) (currentByte!11986 (_1!11802 lt!392499))) ((_ sign_extend 32) (currentBit!11981 (_1!11802 lt!392499)))))))

(declare-fun lt!393154 () (_ BitVec 64))

(declare-fun lt!393152 () (_ BitVec 64))

(assert (=> d!84458 (= lt!393153 (bvmul lt!393154 lt!393152))))

(assert (=> d!84458 (or (= lt!393154 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393152 (bvsdiv (bvmul lt!393154 lt!393152) lt!393154)))))

(assert (=> d!84458 (= lt!393152 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84458 (= lt!393154 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!392499)))))))

(assert (=> d!84458 (= lt!393155 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11986 (_1!11802 lt!392499))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11981 (_1!11802 lt!392499)))))))

(assert (=> d!84458 (invariant!0 (currentBit!11981 (_1!11802 lt!392499)) (currentByte!11986 (_1!11802 lt!392499)) (size!6029 (buf!6531 (_1!11802 lt!392499))))))

(assert (=> d!84458 (= (bitIndex!0 (size!6029 (buf!6531 (_1!11802 lt!392499))) (currentByte!11986 (_1!11802 lt!392499)) (currentBit!11981 (_1!11802 lt!392499))) lt!393155)))

(declare-fun b!253043 () Bool)

(declare-fun res!212050 () Bool)

(assert (=> b!253043 (=> (not res!212050) (not e!175315))))

(assert (=> b!253043 (= res!212050 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393155))))

(declare-fun b!253044 () Bool)

(declare-fun lt!393151 () (_ BitVec 64))

(assert (=> b!253044 (= e!175315 (bvsle lt!393155 (bvmul lt!393151 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253044 (or (= lt!393151 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393151 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393151)))))

(assert (=> b!253044 (= lt!393151 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!392499)))))))

(assert (= (and d!84458 res!212049) b!253043))

(assert (= (and b!253043 res!212050) b!253044))

(declare-fun m!380875 () Bool)

(assert (=> d!84458 m!380875))

(declare-fun m!380877 () Bool)

(assert (=> d!84458 m!380877))

(assert (=> b!252735 d!84458))

(declare-fun d!84460 () Bool)

(declare-fun lt!393157 () tuple2!21760)

(assert (=> d!84460 (= lt!393157 (readBit!0 (_1!11800 lt!392483)))))

(assert (=> d!84460 (= (readBitPure!0 (_1!11800 lt!392483)) (tuple2!21749 (_2!11808 lt!393157) (_1!11808 lt!393157)))))

(declare-fun bs!21404 () Bool)

(assert (= bs!21404 d!84460))

(declare-fun m!380879 () Bool)

(assert (=> bs!21404 m!380879))

(assert (=> b!252735 d!84460))

(declare-fun d!84462 () Bool)

(assert (=> d!84462 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392494)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494))) lt!392491) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392494)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494)))) lt!392491))))

(declare-fun bs!21405 () Bool)

(assert (= bs!21405 d!84462))

(assert (=> bs!21405 m!380741))

(assert (=> b!252735 d!84462))

(declare-fun lt!393158 () tuple2!21760)

(declare-fun d!84464 () Bool)

(assert (=> d!84464 (= lt!393158 (checkBitsLoop!0 (_1!11800 lt!392483) nBits!297 bit!26 from!289))))

(assert (=> d!84464 (= (checkBitsLoopPure!0 (_1!11800 lt!392483) nBits!297 bit!26 from!289) (tuple2!21749 (_2!11808 lt!393158) (_1!11808 lt!393158)))))

(declare-fun bs!21406 () Bool)

(assert (= bs!21406 d!84464))

(declare-fun m!380881 () Bool)

(assert (=> bs!21406 m!380881))

(assert (=> b!252735 d!84464))

(declare-fun d!84466 () Bool)

(assert (=> d!84466 (isPrefixOf!0 thiss!1005 (_2!11801 lt!392492))))

(declare-fun lt!393161 () Unit!18206)

(declare-fun choose!30 (BitStream!10980 BitStream!10980 BitStream!10980) Unit!18206)

(assert (=> d!84466 (= lt!393161 (choose!30 thiss!1005 (_2!11801 lt!392494) (_2!11801 lt!392492)))))

(assert (=> d!84466 (isPrefixOf!0 thiss!1005 (_2!11801 lt!392494))))

(assert (=> d!84466 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11801 lt!392494) (_2!11801 lt!392492)) lt!393161)))

(declare-fun bs!21407 () Bool)

(assert (= bs!21407 d!84466))

(assert (=> bs!21407 m!380329))

(declare-fun m!380883 () Bool)

(assert (=> bs!21407 m!380883))

(assert (=> bs!21407 m!380293))

(assert (=> b!252735 d!84466))

(declare-fun d!84468 () Bool)

(declare-fun e!175318 () Bool)

(assert (=> d!84468 e!175318))

(declare-fun res!212053 () Bool)

(assert (=> d!84468 (=> (not res!212053) (not e!175318))))

(declare-fun lt!393170 () tuple2!21748)

(declare-fun lt!393173 () tuple2!21748)

(assert (=> d!84468 (= res!212053 (= (bitIndex!0 (size!6029 (buf!6531 (_1!11802 lt!393170))) (currentByte!11986 (_1!11802 lt!393170)) (currentBit!11981 (_1!11802 lt!393170))) (bitIndex!0 (size!6029 (buf!6531 (_1!11802 lt!393173))) (currentByte!11986 (_1!11802 lt!393173)) (currentBit!11981 (_1!11802 lt!393173)))))))

(declare-fun lt!393172 () BitStream!10980)

(declare-fun lt!393171 () Unit!18206)

(declare-fun choose!50 (BitStream!10980 BitStream!10980 BitStream!10980 tuple2!21748 tuple2!21748 BitStream!10980 Bool tuple2!21748 tuple2!21748 BitStream!10980 Bool) Unit!18206)

(assert (=> d!84468 (= lt!393171 (choose!50 lt!392497 (_2!11801 lt!392492) lt!393172 lt!393170 (tuple2!21749 (_1!11802 lt!393170) (_2!11802 lt!393170)) (_1!11802 lt!393170) (_2!11802 lt!393170) lt!393173 (tuple2!21749 (_1!11802 lt!393173) (_2!11802 lt!393173)) (_1!11802 lt!393173) (_2!11802 lt!393173)))))

(assert (=> d!84468 (= lt!393173 (readBitPure!0 lt!393172))))

(assert (=> d!84468 (= lt!393170 (readBitPure!0 lt!392497))))

(assert (=> d!84468 (= lt!393172 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 lt!392497) (currentBit!11981 lt!392497)))))

(assert (=> d!84468 (invariant!0 (currentBit!11981 lt!392497) (currentByte!11986 lt!392497) (size!6029 (buf!6531 (_2!11801 lt!392492))))))

(assert (=> d!84468 (= (readBitPrefixLemma!0 lt!392497 (_2!11801 lt!392492)) lt!393171)))

(declare-fun b!253047 () Bool)

(assert (=> b!253047 (= e!175318 (= (_2!11802 lt!393170) (_2!11802 lt!393173)))))

(assert (= (and d!84468 res!212053) b!253047))

(declare-fun m!380885 () Bool)

(assert (=> d!84468 m!380885))

(assert (=> d!84468 m!380305))

(declare-fun m!380887 () Bool)

(assert (=> d!84468 m!380887))

(declare-fun m!380889 () Bool)

(assert (=> d!84468 m!380889))

(declare-fun m!380891 () Bool)

(assert (=> d!84468 m!380891))

(declare-fun m!380893 () Bool)

(assert (=> d!84468 m!380893))

(assert (=> b!252735 d!84468))

(declare-fun d!84470 () Bool)

(declare-fun lt!393174 () tuple2!21760)

(assert (=> d!84470 (= lt!393174 (checkBitsLoop!0 (_1!11800 lt!392498) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!84470 (= (checkBitsLoopPure!0 (_1!11800 lt!392498) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21749 (_2!11808 lt!393174) (_1!11808 lt!393174)))))

(declare-fun bs!21408 () Bool)

(assert (= bs!21408 d!84470))

(declare-fun m!380895 () Bool)

(assert (=> bs!21408 m!380895))

(assert (=> b!252735 d!84470))

(declare-fun d!84472 () Bool)

(declare-fun e!175319 () Bool)

(assert (=> d!84472 e!175319))

(declare-fun res!212054 () Bool)

(assert (=> d!84472 (=> (not res!212054) (not e!175319))))

(declare-fun lt!393180 () (_ BitVec 64))

(declare-fun lt!393177 () (_ BitVec 64))

(declare-fun lt!393179 () (_ BitVec 64))

(assert (=> d!84472 (= res!212054 (= lt!393179 (bvsub lt!393177 lt!393180)))))

(assert (=> d!84472 (or (= (bvand lt!393177 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393180 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393177 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393177 lt!393180) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84472 (= lt!393180 (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!392488)))) ((_ sign_extend 32) (currentByte!11986 (_1!11802 lt!392488))) ((_ sign_extend 32) (currentBit!11981 (_1!11802 lt!392488)))))))

(declare-fun lt!393178 () (_ BitVec 64))

(declare-fun lt!393176 () (_ BitVec 64))

(assert (=> d!84472 (= lt!393177 (bvmul lt!393178 lt!393176))))

(assert (=> d!84472 (or (= lt!393178 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393176 (bvsdiv (bvmul lt!393178 lt!393176) lt!393178)))))

(assert (=> d!84472 (= lt!393176 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84472 (= lt!393178 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!392488)))))))

(assert (=> d!84472 (= lt!393179 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11986 (_1!11802 lt!392488))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11981 (_1!11802 lt!392488)))))))

(assert (=> d!84472 (invariant!0 (currentBit!11981 (_1!11802 lt!392488)) (currentByte!11986 (_1!11802 lt!392488)) (size!6029 (buf!6531 (_1!11802 lt!392488))))))

(assert (=> d!84472 (= (bitIndex!0 (size!6029 (buf!6531 (_1!11802 lt!392488))) (currentByte!11986 (_1!11802 lt!392488)) (currentBit!11981 (_1!11802 lt!392488))) lt!393179)))

(declare-fun b!253048 () Bool)

(declare-fun res!212055 () Bool)

(assert (=> b!253048 (=> (not res!212055) (not e!175319))))

(assert (=> b!253048 (= res!212055 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393179))))

(declare-fun b!253049 () Bool)

(declare-fun lt!393175 () (_ BitVec 64))

(assert (=> b!253049 (= e!175319 (bvsle lt!393179 (bvmul lt!393175 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253049 (or (= lt!393175 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393175 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393175)))))

(assert (=> b!253049 (= lt!393175 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!392488)))))))

(assert (= (and d!84472 res!212054) b!253048))

(assert (= (and b!253048 res!212055) b!253049))

(declare-fun m!380897 () Bool)

(assert (=> d!84472 m!380897))

(declare-fun m!380899 () Bool)

(assert (=> d!84472 m!380899))

(assert (=> b!252735 d!84472))

(declare-fun d!84474 () Bool)

(assert (=> d!84474 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 thiss!1005))) ((_ sign_extend 32) (currentByte!11986 thiss!1005)) ((_ sign_extend 32) (currentBit!11981 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 thiss!1005))) ((_ sign_extend 32) (currentByte!11986 thiss!1005)) ((_ sign_extend 32) (currentBit!11981 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21409 () Bool)

(assert (= bs!21409 d!84474))

(assert (=> bs!21409 m!380743))

(assert (=> b!252724 d!84474))

(check-sat (not d!84420) (not d!84436) (not b!252989) (not b!253025) (not d!84424) (not d!84438) (not b!253026) (not d!84428) (not d!84418) (not b!253024) (not d!84468) (not b!253006) (not d!84440) (not b!253000) (not b!252987) (not d!84460) (not b!252988) (not d!84442) (not d!84402) (not b!253009) (not b!253039) (not d!84474) (not d!84456) (not d!84446) (not d!84412) (not b!252964) (not b!253029) (not d!84404) (not b!252986) (not d!84466) (not b!253008) (not d!84450) (not d!84452) (not d!84444) (not b!252998) (not b!253041) (not d!84464) (not b!253023) (not d!84472) (not d!84470) (not b!253011) (not d!84416) (not b!253027) (not d!84458) (not b!253042) (not b!253004) (not d!84422) (not d!84432) (not b!253040) (not d!84462) (not d!84410) (not b!253010) (not b!253014) (not d!84408) (not d!84454))
(check-sat)
(get-model)

(declare-fun d!84476 () Bool)

(assert (=> d!84476 (= (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))) ((_ sign_extend 32) (currentByte!11986 thiss!1005)) ((_ sign_extend 32) (currentBit!11981 thiss!1005))) (bvsub (bvmul ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11986 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11981 thiss!1005)))))))

(assert (=> d!84436 d!84476))

(declare-fun d!84478 () Bool)

(declare-fun e!175326 () Bool)

(assert (=> d!84478 e!175326))

(declare-fun res!212058 () Bool)

(assert (=> d!84478 (=> (not res!212058) (not e!175326))))

(declare-fun increaseBitIndex!0 (BitStream!10980) tuple2!21746)

(assert (=> d!84478 (= res!212058 (= (buf!6531 (_2!11801 (increaseBitIndex!0 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005))))) (buf!6531 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005)))))))

(declare-fun lt!393195 () Bool)

(assert (=> d!84478 (= lt!393195 (not (= (bvand ((_ sign_extend 24) (select (arr!7016 (buf!6531 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005)))) (currentByte!11986 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11981 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393197 () tuple2!21760)

(assert (=> d!84478 (= lt!393197 (tuple2!21761 (not (= (bvand ((_ sign_extend 24) (select (arr!7016 (buf!6531 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005)))) (currentByte!11986 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11981 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005)))))) #b00000000000000000000000000000000)) (_2!11801 (increaseBitIndex!0 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005))))))))

(assert (=> d!84478 (validate_offset_bit!0 ((_ sign_extend 32) (size!6029 (buf!6531 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005))))) ((_ sign_extend 32) (currentByte!11986 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005)))) ((_ sign_extend 32) (currentBit!11981 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005)))))))

(assert (=> d!84478 (= (readBit!0 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005))) lt!393197)))

(declare-fun b!253052 () Bool)

(declare-fun lt!393196 () (_ BitVec 64))

(declare-fun lt!393198 () (_ BitVec 64))

(assert (=> b!253052 (= e!175326 (= (bitIndex!0 (size!6029 (buf!6531 (_2!11801 (increaseBitIndex!0 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005)))))) (currentByte!11986 (_2!11801 (increaseBitIndex!0 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005))))) (currentBit!11981 (_2!11801 (increaseBitIndex!0 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005)))))) (bvadd lt!393196 lt!393198)))))

(assert (=> b!253052 (or (not (= (bvand lt!393196 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393198 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393196 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393196 lt!393198) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253052 (= lt!393198 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253052 (= lt!393196 (bitIndex!0 (size!6029 (buf!6531 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005)))) (currentByte!11986 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005))) (currentBit!11981 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005)))))))

(declare-fun lt!393199 () Bool)

(assert (=> b!253052 (= lt!393199 (not (= (bvand ((_ sign_extend 24) (select (arr!7016 (buf!6531 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005)))) (currentByte!11986 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11981 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393200 () Bool)

(assert (=> b!253052 (= lt!393200 (not (= (bvand ((_ sign_extend 24) (select (arr!7016 (buf!6531 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005)))) (currentByte!11986 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11981 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393201 () Bool)

(assert (=> b!253052 (= lt!393201 (not (= (bvand ((_ sign_extend 24) (select (arr!7016 (buf!6531 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005)))) (currentByte!11986 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11981 (readerFrom!0 (_2!11801 lt!392494) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!84478 res!212058) b!253052))

(assert (=> d!84478 m!380289))

(declare-fun m!380901 () Bool)

(assert (=> d!84478 m!380901))

(declare-fun m!380903 () Bool)

(assert (=> d!84478 m!380903))

(declare-fun m!380905 () Bool)

(assert (=> d!84478 m!380905))

(declare-fun m!380907 () Bool)

(assert (=> d!84478 m!380907))

(assert (=> b!253052 m!380905))

(assert (=> b!253052 m!380289))

(assert (=> b!253052 m!380901))

(declare-fun m!380909 () Bool)

(assert (=> b!253052 m!380909))

(declare-fun m!380911 () Bool)

(assert (=> b!253052 m!380911))

(assert (=> b!253052 m!380903))

(assert (=> d!84402 d!84478))

(declare-fun d!84480 () Bool)

(declare-fun e!175327 () Bool)

(assert (=> d!84480 e!175327))

(declare-fun res!212059 () Bool)

(assert (=> d!84480 (=> (not res!212059) (not e!175327))))

(assert (=> d!84480 (= res!212059 (= (buf!6531 (_2!11801 (increaseBitIndex!0 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))))) (buf!6531 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))))))

(declare-fun lt!393202 () Bool)

(assert (=> d!84480 (= lt!393202 (not (= (bvand ((_ sign_extend 24) (select (arr!7016 (buf!6531 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))) (currentByte!11986 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11981 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393204 () tuple2!21760)

(assert (=> d!84480 (= lt!393204 (tuple2!21761 (not (= (bvand ((_ sign_extend 24) (select (arr!7016 (buf!6531 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))) (currentByte!11986 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11981 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))))) #b00000000000000000000000000000000)) (_2!11801 (increaseBitIndex!0 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))))))))

(assert (=> d!84480 (validate_offset_bit!0 ((_ sign_extend 32) (size!6029 (buf!6531 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))))) ((_ sign_extend 32) (currentByte!11986 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))) ((_ sign_extend 32) (currentBit!11981 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))))))

(assert (=> d!84480 (= (readBit!0 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))) lt!393204)))

(declare-fun lt!393203 () (_ BitVec 64))

(declare-fun lt!393205 () (_ BitVec 64))

(declare-fun b!253053 () Bool)

(assert (=> b!253053 (= e!175327 (= (bitIndex!0 (size!6029 (buf!6531 (_2!11801 (increaseBitIndex!0 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))))) (currentByte!11986 (_2!11801 (increaseBitIndex!0 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))))) (currentBit!11981 (_2!11801 (increaseBitIndex!0 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))))) (bvadd lt!393203 lt!393205)))))

(assert (=> b!253053 (or (not (= (bvand lt!393203 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393205 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393203 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393203 lt!393205) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253053 (= lt!393205 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253053 (= lt!393203 (bitIndex!0 (size!6029 (buf!6531 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))) (currentByte!11986 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))) (currentBit!11981 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))))))

(declare-fun lt!393206 () Bool)

(assert (=> b!253053 (= lt!393206 (not (= (bvand ((_ sign_extend 24) (select (arr!7016 (buf!6531 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))) (currentByte!11986 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11981 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393207 () Bool)

(assert (=> b!253053 (= lt!393207 (not (= (bvand ((_ sign_extend 24) (select (arr!7016 (buf!6531 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))) (currentByte!11986 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11981 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393208 () Bool)

(assert (=> b!253053 (= lt!393208 (not (= (bvand ((_ sign_extend 24) (select (arr!7016 (buf!6531 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))) (currentByte!11986 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11981 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!84480 res!212059) b!253053))

(declare-fun m!380913 () Bool)

(assert (=> d!84480 m!380913))

(declare-fun m!380915 () Bool)

(assert (=> d!84480 m!380915))

(declare-fun m!380917 () Bool)

(assert (=> d!84480 m!380917))

(declare-fun m!380919 () Bool)

(assert (=> d!84480 m!380919))

(assert (=> b!253053 m!380917))

(assert (=> b!253053 m!380913))

(declare-fun m!380921 () Bool)

(assert (=> b!253053 m!380921))

(declare-fun m!380923 () Bool)

(assert (=> b!253053 m!380923))

(assert (=> b!253053 m!380915))

(assert (=> d!84452 d!84480))

(declare-fun d!84482 () Bool)

(assert (=> d!84482 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392494)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392494)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21410 () Bool)

(assert (= bs!21410 d!84482))

(assert (=> bs!21410 m!380741))

(assert (=> b!253014 d!84482))

(declare-fun b!253065 () Bool)

(declare-fun e!175336 () Bool)

(declare-fun _$19!189 () tuple2!21746)

(assert (=> b!253065 (= e!175336 (array_inv!5770 (buf!6531 (_2!11801 _$19!189))))))

(declare-fun b!253066 () Bool)

(declare-fun res!212071 () Bool)

(declare-fun e!175337 () Bool)

(assert (=> b!253066 (=> (not res!212071) (not e!175337))))

(assert (=> b!253066 (= res!212071 (isPrefixOf!0 thiss!1005 (_2!11801 _$19!189)))))

(declare-fun b!253067 () Bool)

(declare-fun e!175339 () Bool)

(declare-fun lt!393211 () tuple2!21748)

(assert (=> b!253067 (= e!175339 (= (bitIndex!0 (size!6029 (buf!6531 (_1!11802 lt!393211))) (currentByte!11986 (_1!11802 lt!393211)) (currentBit!11981 (_1!11802 lt!393211))) (bitIndex!0 (size!6029 (buf!6531 (_2!11801 _$19!189))) (currentByte!11986 (_2!11801 _$19!189)) (currentBit!11981 (_2!11801 _$19!189)))))))

(declare-fun b!253068 () Bool)

(assert (=> b!253068 (= e!175337 e!175339)))

(declare-fun res!212068 () Bool)

(assert (=> b!253068 (=> (not res!212068) (not e!175339))))

(assert (=> b!253068 (= res!212068 (and (= (_2!11802 lt!393211) bit!26) (= (_1!11802 lt!393211) (_2!11801 _$19!189))))))

(assert (=> b!253068 (= lt!393211 (readBitPure!0 (readerFrom!0 (_2!11801 _$19!189) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005))))))

(declare-fun d!84484 () Bool)

(assert (=> d!84484 e!175337))

(declare-fun res!212069 () Bool)

(assert (=> d!84484 (=> (not res!212069) (not e!175337))))

(assert (=> d!84484 (= res!212069 (= (size!6029 (buf!6531 thiss!1005)) (size!6029 (buf!6531 (_2!11801 _$19!189)))))))

(assert (=> d!84484 (and (inv!12 (_2!11801 _$19!189)) e!175336)))

(assert (=> d!84484 (= (choose!16 thiss!1005 bit!26) _$19!189)))

(declare-fun b!253069 () Bool)

(declare-fun res!212070 () Bool)

(assert (=> b!253069 (=> (not res!212070) (not e!175337))))

(assert (=> b!253069 (= res!212070 (= (bitIndex!0 (size!6029 (buf!6531 (_2!11801 _$19!189))) (currentByte!11986 (_2!11801 _$19!189)) (currentBit!11981 (_2!11801 _$19!189))) (bvadd (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= d!84484 b!253065))

(assert (= (and d!84484 res!212069) b!253069))

(assert (= (and b!253069 res!212070) b!253066))

(assert (= (and b!253066 res!212071) b!253068))

(assert (= (and b!253068 res!212068) b!253067))

(declare-fun m!380925 () Bool)

(assert (=> d!84484 m!380925))

(declare-fun m!380927 () Bool)

(assert (=> b!253069 m!380927))

(assert (=> b!253069 m!380271))

(declare-fun m!380929 () Bool)

(assert (=> b!253066 m!380929))

(declare-fun m!380931 () Bool)

(assert (=> b!253068 m!380931))

(assert (=> b!253068 m!380931))

(declare-fun m!380933 () Bool)

(assert (=> b!253068 m!380933))

(declare-fun m!380935 () Bool)

(assert (=> b!253067 m!380935))

(assert (=> b!253067 m!380927))

(declare-fun m!380937 () Bool)

(assert (=> b!253065 m!380937))

(assert (=> d!84454 d!84484))

(declare-fun d!84486 () Bool)

(assert (=> d!84486 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6029 (buf!6531 thiss!1005))) ((_ sign_extend 32) (currentByte!11986 thiss!1005)) ((_ sign_extend 32) (currentBit!11981 thiss!1005))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 thiss!1005))) ((_ sign_extend 32) (currentByte!11986 thiss!1005)) ((_ sign_extend 32) (currentBit!11981 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21411 () Bool)

(assert (= bs!21411 d!84486))

(assert (=> bs!21411 m!380743))

(assert (=> d!84454 d!84486))

(declare-fun d!84488 () Bool)

(declare-fun e!175340 () Bool)

(assert (=> d!84488 e!175340))

(declare-fun res!212072 () Bool)

(assert (=> d!84488 (=> (not res!212072) (not e!175340))))

(declare-fun lt!393217 () (_ BitVec 64))

(declare-fun lt!393214 () (_ BitVec 64))

(declare-fun lt!393216 () (_ BitVec 64))

(assert (=> d!84488 (= res!212072 (= lt!393216 (bvsub lt!393214 lt!393217)))))

(assert (=> d!84488 (or (= (bvand lt!393214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393217 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393214 lt!393217) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84488 (= lt!393217 (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!393131)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!393131))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!393131)))))))

(declare-fun lt!393215 () (_ BitVec 64))

(declare-fun lt!393213 () (_ BitVec 64))

(assert (=> d!84488 (= lt!393214 (bvmul lt!393215 lt!393213))))

(assert (=> d!84488 (or (= lt!393215 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393213 (bvsdiv (bvmul lt!393215 lt!393213) lt!393215)))))

(assert (=> d!84488 (= lt!393213 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84488 (= lt!393215 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!393131)))))))

(assert (=> d!84488 (= lt!393216 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!393131))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!393131)))))))

(assert (=> d!84488 (invariant!0 (currentBit!11981 (_2!11801 lt!393131)) (currentByte!11986 (_2!11801 lt!393131)) (size!6029 (buf!6531 (_2!11801 lt!393131))))))

(assert (=> d!84488 (= (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!393131))) (currentByte!11986 (_2!11801 lt!393131)) (currentBit!11981 (_2!11801 lt!393131))) lt!393216)))

(declare-fun b!253070 () Bool)

(declare-fun res!212073 () Bool)

(assert (=> b!253070 (=> (not res!212073) (not e!175340))))

(assert (=> b!253070 (= res!212073 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393216))))

(declare-fun b!253071 () Bool)

(declare-fun lt!393212 () (_ BitVec 64))

(assert (=> b!253071 (= e!175340 (bvsle lt!393216 (bvmul lt!393212 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253071 (or (= lt!393212 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393212 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393212)))))

(assert (=> b!253071 (= lt!393212 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!393131)))))))

(assert (= (and d!84488 res!212072) b!253070))

(assert (= (and b!253070 res!212073) b!253071))

(declare-fun m!380939 () Bool)

(assert (=> d!84488 m!380939))

(declare-fun m!380941 () Bool)

(assert (=> d!84488 m!380941))

(assert (=> b!253023 d!84488))

(assert (=> b!253023 d!84408))

(assert (=> d!84422 d!84430))

(declare-fun d!84490 () Bool)

(assert (=> d!84490 (isPrefixOf!0 lt!393060 (_2!11801 lt!392492))))

(declare-fun lt!393218 () Unit!18206)

(assert (=> d!84490 (= lt!393218 (choose!30 lt!393060 (_2!11801 lt!392494) (_2!11801 lt!392492)))))

(assert (=> d!84490 (isPrefixOf!0 lt!393060 (_2!11801 lt!392494))))

(assert (=> d!84490 (= (lemmaIsPrefixTransitive!0 lt!393060 (_2!11801 lt!392494) (_2!11801 lt!392492)) lt!393218)))

(declare-fun bs!21412 () Bool)

(assert (= bs!21412 d!84490))

(assert (=> bs!21412 m!380765))

(declare-fun m!380943 () Bool)

(assert (=> bs!21412 m!380943))

(declare-fun m!380945 () Bool)

(assert (=> bs!21412 m!380945))

(assert (=> d!84422 d!84490))

(declare-fun d!84492 () Bool)

(assert (=> d!84492 (isPrefixOf!0 lt!393060 (_2!11801 lt!392492))))

(declare-fun lt!393219 () Unit!18206)

(assert (=> d!84492 (= lt!393219 (choose!30 lt!393060 (_2!11801 lt!392492) (_2!11801 lt!392492)))))

(assert (=> d!84492 (isPrefixOf!0 lt!393060 (_2!11801 lt!392492))))

(assert (=> d!84492 (= (lemmaIsPrefixTransitive!0 lt!393060 (_2!11801 lt!392492) (_2!11801 lt!392492)) lt!393219)))

(declare-fun bs!21413 () Bool)

(assert (= bs!21413 d!84492))

(assert (=> bs!21413 m!380765))

(declare-fun m!380947 () Bool)

(assert (=> bs!21413 m!380947))

(assert (=> bs!21413 m!380765))

(assert (=> d!84422 d!84492))

(declare-fun d!84494 () Bool)

(assert (=> d!84494 (isPrefixOf!0 (_2!11801 lt!392494) (_2!11801 lt!392494))))

(declare-fun lt!393222 () Unit!18206)

(declare-fun choose!11 (BitStream!10980) Unit!18206)

(assert (=> d!84494 (= lt!393222 (choose!11 (_2!11801 lt!392494)))))

(assert (=> d!84494 (= (lemmaIsPrefixRefl!0 (_2!11801 lt!392494)) lt!393222)))

(declare-fun bs!21415 () Bool)

(assert (= bs!21415 d!84494))

(assert (=> bs!21415 m!380771))

(declare-fun m!380949 () Bool)

(assert (=> bs!21415 m!380949))

(assert (=> d!84422 d!84494))

(declare-fun d!84496 () Bool)

(declare-fun res!212074 () Bool)

(declare-fun e!175342 () Bool)

(assert (=> d!84496 (=> (not res!212074) (not e!175342))))

(assert (=> d!84496 (= res!212074 (= (size!6029 (buf!6531 (_2!11801 lt!392492))) (size!6029 (buf!6531 (_2!11801 lt!392492)))))))

(assert (=> d!84496 (= (isPrefixOf!0 (_2!11801 lt!392492) (_2!11801 lt!392492)) e!175342)))

(declare-fun b!253072 () Bool)

(declare-fun res!212075 () Bool)

(assert (=> b!253072 (=> (not res!212075) (not e!175342))))

(assert (=> b!253072 (= res!212075 (bvsle (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392492))) (currentByte!11986 (_2!11801 lt!392492)) (currentBit!11981 (_2!11801 lt!392492))) (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392492))) (currentByte!11986 (_2!11801 lt!392492)) (currentBit!11981 (_2!11801 lt!392492)))))))

(declare-fun b!253073 () Bool)

(declare-fun e!175341 () Bool)

(assert (=> b!253073 (= e!175342 e!175341)))

(declare-fun res!212076 () Bool)

(assert (=> b!253073 (=> res!212076 e!175341)))

(assert (=> b!253073 (= res!212076 (= (size!6029 (buf!6531 (_2!11801 lt!392492))) #b00000000000000000000000000000000))))

(declare-fun b!253074 () Bool)

(assert (=> b!253074 (= e!175341 (arrayBitRangesEq!0 (buf!6531 (_2!11801 lt!392492)) (buf!6531 (_2!11801 lt!392492)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392492))) (currentByte!11986 (_2!11801 lt!392492)) (currentBit!11981 (_2!11801 lt!392492)))))))

(assert (= (and d!84496 res!212074) b!253072))

(assert (= (and b!253072 res!212075) b!253073))

(assert (= (and b!253073 (not res!212076)) b!253074))

(assert (=> b!253072 m!380285))

(assert (=> b!253072 m!380285))

(assert (=> b!253074 m!380285))

(assert (=> b!253074 m!380285))

(declare-fun m!380951 () Bool)

(assert (=> b!253074 m!380951))

(assert (=> d!84422 d!84496))

(declare-fun d!84498 () Bool)

(declare-fun res!212077 () Bool)

(declare-fun e!175344 () Bool)

(assert (=> d!84498 (=> (not res!212077) (not e!175344))))

(assert (=> d!84498 (= res!212077 (= (size!6029 (buf!6531 (_2!11801 lt!392494))) (size!6029 (buf!6531 (_2!11801 lt!392494)))))))

(assert (=> d!84498 (= (isPrefixOf!0 (_2!11801 lt!392494) (_2!11801 lt!392494)) e!175344)))

(declare-fun b!253075 () Bool)

(declare-fun res!212078 () Bool)

(assert (=> b!253075 (=> (not res!212078) (not e!175344))))

(assert (=> b!253075 (= res!212078 (bvsle (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392494))) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494))) (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392494))) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494)))))))

(declare-fun b!253076 () Bool)

(declare-fun e!175343 () Bool)

(assert (=> b!253076 (= e!175344 e!175343)))

(declare-fun res!212079 () Bool)

(assert (=> b!253076 (=> res!212079 e!175343)))

(assert (=> b!253076 (= res!212079 (= (size!6029 (buf!6531 (_2!11801 lt!392494))) #b00000000000000000000000000000000))))

(declare-fun b!253077 () Bool)

(assert (=> b!253077 (= e!175343 (arrayBitRangesEq!0 (buf!6531 (_2!11801 lt!392494)) (buf!6531 (_2!11801 lt!392494)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392494))) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494)))))))

(assert (= (and d!84498 res!212077) b!253075))

(assert (= (and b!253075 res!212078) b!253076))

(assert (= (and b!253076 (not res!212079)) b!253077))

(assert (=> b!253075 m!380269))

(assert (=> b!253075 m!380269))

(assert (=> b!253077 m!380269))

(assert (=> b!253077 m!380269))

(declare-fun m!380953 () Bool)

(assert (=> b!253077 m!380953))

(assert (=> d!84422 d!84498))

(declare-fun d!84500 () Bool)

(assert (=> d!84500 (isPrefixOf!0 (_2!11801 lt!392492) (_2!11801 lt!392492))))

(declare-fun lt!393223 () Unit!18206)

(assert (=> d!84500 (= lt!393223 (choose!11 (_2!11801 lt!392492)))))

(assert (=> d!84500 (= (lemmaIsPrefixRefl!0 (_2!11801 lt!392492)) lt!393223)))

(declare-fun bs!21416 () Bool)

(assert (= bs!21416 d!84500))

(assert (=> bs!21416 m!380775))

(declare-fun m!380955 () Bool)

(assert (=> bs!21416 m!380955))

(assert (=> d!84422 d!84500))

(declare-fun d!84502 () Bool)

(declare-fun res!212080 () Bool)

(declare-fun e!175346 () Bool)

(assert (=> d!84502 (=> (not res!212080) (not e!175346))))

(assert (=> d!84502 (= res!212080 (= (size!6029 (buf!6531 lt!393060)) (size!6029 (buf!6531 (_2!11801 lt!392492)))))))

(assert (=> d!84502 (= (isPrefixOf!0 lt!393060 (_2!11801 lt!392492)) e!175346)))

(declare-fun b!253078 () Bool)

(declare-fun res!212081 () Bool)

(assert (=> b!253078 (=> (not res!212081) (not e!175346))))

(assert (=> b!253078 (= res!212081 (bvsle (bitIndex!0 (size!6029 (buf!6531 lt!393060)) (currentByte!11986 lt!393060) (currentBit!11981 lt!393060)) (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392492))) (currentByte!11986 (_2!11801 lt!392492)) (currentBit!11981 (_2!11801 lt!392492)))))))

(declare-fun b!253079 () Bool)

(declare-fun e!175345 () Bool)

(assert (=> b!253079 (= e!175346 e!175345)))

(declare-fun res!212082 () Bool)

(assert (=> b!253079 (=> res!212082 e!175345)))

(assert (=> b!253079 (= res!212082 (= (size!6029 (buf!6531 lt!393060)) #b00000000000000000000000000000000))))

(declare-fun b!253080 () Bool)

(assert (=> b!253080 (= e!175345 (arrayBitRangesEq!0 (buf!6531 lt!393060) (buf!6531 (_2!11801 lt!392492)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 lt!393060)) (currentByte!11986 lt!393060) (currentBit!11981 lt!393060))))))

(assert (= (and d!84502 res!212080) b!253078))

(assert (= (and b!253078 res!212081) b!253079))

(assert (= (and b!253079 (not res!212082)) b!253080))

(declare-fun m!380957 () Bool)

(assert (=> b!253078 m!380957))

(assert (=> b!253078 m!380285))

(assert (=> b!253080 m!380957))

(assert (=> b!253080 m!380957))

(declare-fun m!380959 () Bool)

(assert (=> b!253080 m!380959))

(assert (=> d!84422 d!84502))

(declare-fun d!84504 () Bool)

(assert (=> d!84504 (isPrefixOf!0 lt!393060 lt!393060)))

(declare-fun lt!393224 () Unit!18206)

(assert (=> d!84504 (= lt!393224 (choose!11 lt!393060))))

(assert (=> d!84504 (= (lemmaIsPrefixRefl!0 lt!393060) lt!393224)))

(declare-fun bs!21417 () Bool)

(assert (= bs!21417 d!84504))

(assert (=> bs!21417 m!380759))

(declare-fun m!380961 () Bool)

(assert (=> bs!21417 m!380961))

(assert (=> d!84422 d!84504))

(declare-fun d!84506 () Bool)

(declare-fun res!212083 () Bool)

(declare-fun e!175348 () Bool)

(assert (=> d!84506 (=> (not res!212083) (not e!175348))))

(assert (=> d!84506 (= res!212083 (= (size!6029 (buf!6531 (_1!11800 lt!393074))) (size!6029 (buf!6531 (_2!11800 lt!393074)))))))

(assert (=> d!84506 (= (isPrefixOf!0 (_1!11800 lt!393074) (_2!11800 lt!393074)) e!175348)))

(declare-fun b!253081 () Bool)

(declare-fun res!212084 () Bool)

(assert (=> b!253081 (=> (not res!212084) (not e!175348))))

(assert (=> b!253081 (= res!212084 (bvsle (bitIndex!0 (size!6029 (buf!6531 (_1!11800 lt!393074))) (currentByte!11986 (_1!11800 lt!393074)) (currentBit!11981 (_1!11800 lt!393074))) (bitIndex!0 (size!6029 (buf!6531 (_2!11800 lt!393074))) (currentByte!11986 (_2!11800 lt!393074)) (currentBit!11981 (_2!11800 lt!393074)))))))

(declare-fun b!253082 () Bool)

(declare-fun e!175347 () Bool)

(assert (=> b!253082 (= e!175348 e!175347)))

(declare-fun res!212085 () Bool)

(assert (=> b!253082 (=> res!212085 e!175347)))

(assert (=> b!253082 (= res!212085 (= (size!6029 (buf!6531 (_1!11800 lt!393074))) #b00000000000000000000000000000000))))

(declare-fun b!253083 () Bool)

(assert (=> b!253083 (= e!175347 (arrayBitRangesEq!0 (buf!6531 (_1!11800 lt!393074)) (buf!6531 (_2!11800 lt!393074)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 (_1!11800 lt!393074))) (currentByte!11986 (_1!11800 lt!393074)) (currentBit!11981 (_1!11800 lt!393074)))))))

(assert (= (and d!84506 res!212083) b!253081))

(assert (= (and b!253081 res!212084) b!253082))

(assert (= (and b!253082 (not res!212085)) b!253083))

(declare-fun m!380963 () Bool)

(assert (=> b!253081 m!380963))

(declare-fun m!380965 () Bool)

(assert (=> b!253081 m!380965))

(assert (=> b!253083 m!380963))

(assert (=> b!253083 m!380963))

(declare-fun m!380967 () Bool)

(assert (=> b!253083 m!380967))

(assert (=> d!84422 d!84506))

(declare-fun d!84508 () Bool)

(declare-fun res!212086 () Bool)

(declare-fun e!175350 () Bool)

(assert (=> d!84508 (=> (not res!212086) (not e!175350))))

(assert (=> d!84508 (= res!212086 (= (size!6029 (buf!6531 lt!393060)) (size!6029 (buf!6531 lt!393060))))))

(assert (=> d!84508 (= (isPrefixOf!0 lt!393060 lt!393060) e!175350)))

(declare-fun b!253084 () Bool)

(declare-fun res!212087 () Bool)

(assert (=> b!253084 (=> (not res!212087) (not e!175350))))

(assert (=> b!253084 (= res!212087 (bvsle (bitIndex!0 (size!6029 (buf!6531 lt!393060)) (currentByte!11986 lt!393060) (currentBit!11981 lt!393060)) (bitIndex!0 (size!6029 (buf!6531 lt!393060)) (currentByte!11986 lt!393060) (currentBit!11981 lt!393060))))))

(declare-fun b!253085 () Bool)

(declare-fun e!175349 () Bool)

(assert (=> b!253085 (= e!175350 e!175349)))

(declare-fun res!212088 () Bool)

(assert (=> b!253085 (=> res!212088 e!175349)))

(assert (=> b!253085 (= res!212088 (= (size!6029 (buf!6531 lt!393060)) #b00000000000000000000000000000000))))

(declare-fun b!253086 () Bool)

(assert (=> b!253086 (= e!175349 (arrayBitRangesEq!0 (buf!6531 lt!393060) (buf!6531 lt!393060) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 lt!393060)) (currentByte!11986 lt!393060) (currentBit!11981 lt!393060))))))

(assert (= (and d!84508 res!212086) b!253084))

(assert (= (and b!253084 res!212087) b!253085))

(assert (= (and b!253085 (not res!212088)) b!253086))

(assert (=> b!253084 m!380957))

(assert (=> b!253084 m!380957))

(assert (=> b!253086 m!380957))

(assert (=> b!253086 m!380957))

(declare-fun m!380969 () Bool)

(assert (=> b!253086 m!380969))

(assert (=> d!84422 d!84508))

(declare-fun lt!393225 () tuple2!21760)

(declare-fun d!84510 () Bool)

(assert (=> d!84510 (= lt!393225 (checkBitsLoop!0 (_1!11800 lt!393136) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!84510 (= (checkBitsLoopPure!0 (_1!11800 lt!393136) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21749 (_2!11808 lt!393225) (_1!11808 lt!393225)))))

(declare-fun bs!21418 () Bool)

(assert (= bs!21418 d!84510))

(declare-fun m!380971 () Bool)

(assert (=> bs!21418 m!380971))

(assert (=> b!253025 d!84510))

(declare-fun d!84512 () Bool)

(assert (=> d!84512 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!393131)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494))) lt!393135) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!393131)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494)))) lt!393135))))

(declare-fun bs!21419 () Bool)

(assert (= bs!21419 d!84512))

(declare-fun m!380973 () Bool)

(assert (=> bs!21419 m!380973))

(assert (=> b!253025 d!84512))

(declare-fun d!84514 () Bool)

(assert (=> d!84514 (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!393131)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494))) lt!393135)))

(declare-fun lt!393226 () Unit!18206)

(assert (=> d!84514 (= lt!393226 (choose!9 (_2!11801 lt!392494) (buf!6531 (_2!11801 lt!393131)) lt!393135 (BitStream!10981 (buf!6531 (_2!11801 lt!393131)) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494)))))))

(assert (=> d!84514 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11801 lt!392494) (buf!6531 (_2!11801 lt!393131)) lt!393135) lt!393226)))

(declare-fun bs!21420 () Bool)

(assert (= bs!21420 d!84514))

(assert (=> bs!21420 m!380849))

(declare-fun m!380975 () Bool)

(assert (=> bs!21420 m!380975))

(assert (=> b!253025 d!84514))

(declare-fun b!253087 () Bool)

(declare-fun e!175351 () Unit!18206)

(declare-fun Unit!18216 () Unit!18206)

(assert (=> b!253087 (= e!175351 Unit!18216)))

(declare-fun lt!393245 () tuple2!21744)

(declare-fun lt!393243 () (_ BitVec 64))

(declare-fun lt!393239 () (_ BitVec 64))

(declare-fun e!175352 () Bool)

(declare-fun b!253088 () Bool)

(assert (=> b!253088 (= e!175352 (= (_1!11800 lt!393245) (withMovedBitIndex!0 (_2!11800 lt!393245) (bvsub lt!393239 lt!393243))))))

(assert (=> b!253088 (or (= (bvand lt!393239 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393243 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393239 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393239 lt!393243) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253088 (= lt!393243 (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!393131))) (currentByte!11986 (_2!11801 lt!393131)) (currentBit!11981 (_2!11801 lt!393131))))))

(assert (=> b!253088 (= lt!393239 (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392494))) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494))))))

(declare-fun b!253089 () Bool)

(declare-fun res!212089 () Bool)

(assert (=> b!253089 (=> (not res!212089) (not e!175352))))

(assert (=> b!253089 (= res!212089 (isPrefixOf!0 (_1!11800 lt!393245) (_2!11801 lt!392494)))))

(declare-fun b!253090 () Bool)

(declare-fun res!212090 () Bool)

(assert (=> b!253090 (=> (not res!212090) (not e!175352))))

(assert (=> b!253090 (= res!212090 (isPrefixOf!0 (_2!11800 lt!393245) (_2!11801 lt!393131)))))

(declare-fun b!253091 () Bool)

(declare-fun lt!393230 () Unit!18206)

(assert (=> b!253091 (= e!175351 lt!393230)))

(declare-fun lt!393234 () (_ BitVec 64))

(assert (=> b!253091 (= lt!393234 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!393233 () (_ BitVec 64))

(assert (=> b!253091 (= lt!393233 (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392494))) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494))))))

(assert (=> b!253091 (= lt!393230 (arrayBitRangesEqSymmetric!0 (buf!6531 (_2!11801 lt!392494)) (buf!6531 (_2!11801 lt!393131)) lt!393234 lt!393233))))

(assert (=> b!253091 (arrayBitRangesEq!0 (buf!6531 (_2!11801 lt!393131)) (buf!6531 (_2!11801 lt!392494)) lt!393234 lt!393233)))

(declare-fun d!84516 () Bool)

(assert (=> d!84516 e!175352))

(declare-fun res!212091 () Bool)

(assert (=> d!84516 (=> (not res!212091) (not e!175352))))

(assert (=> d!84516 (= res!212091 (isPrefixOf!0 (_1!11800 lt!393245) (_2!11800 lt!393245)))))

(declare-fun lt!393231 () BitStream!10980)

(assert (=> d!84516 (= lt!393245 (tuple2!21745 lt!393231 (_2!11801 lt!393131)))))

(declare-fun lt!393227 () Unit!18206)

(declare-fun lt!393242 () Unit!18206)

(assert (=> d!84516 (= lt!393227 lt!393242)))

(assert (=> d!84516 (isPrefixOf!0 lt!393231 (_2!11801 lt!393131))))

(assert (=> d!84516 (= lt!393242 (lemmaIsPrefixTransitive!0 lt!393231 (_2!11801 lt!393131) (_2!11801 lt!393131)))))

(declare-fun lt!393237 () Unit!18206)

(declare-fun lt!393236 () Unit!18206)

(assert (=> d!84516 (= lt!393237 lt!393236)))

(assert (=> d!84516 (isPrefixOf!0 lt!393231 (_2!11801 lt!393131))))

(assert (=> d!84516 (= lt!393236 (lemmaIsPrefixTransitive!0 lt!393231 (_2!11801 lt!392494) (_2!11801 lt!393131)))))

(declare-fun lt!393238 () Unit!18206)

(assert (=> d!84516 (= lt!393238 e!175351)))

(declare-fun c!11639 () Bool)

(assert (=> d!84516 (= c!11639 (not (= (size!6029 (buf!6531 (_2!11801 lt!392494))) #b00000000000000000000000000000000)))))

(declare-fun lt!393228 () Unit!18206)

(declare-fun lt!393241 () Unit!18206)

(assert (=> d!84516 (= lt!393228 lt!393241)))

(assert (=> d!84516 (isPrefixOf!0 (_2!11801 lt!393131) (_2!11801 lt!393131))))

(assert (=> d!84516 (= lt!393241 (lemmaIsPrefixRefl!0 (_2!11801 lt!393131)))))

(declare-fun lt!393229 () Unit!18206)

(declare-fun lt!393235 () Unit!18206)

(assert (=> d!84516 (= lt!393229 lt!393235)))

(assert (=> d!84516 (= lt!393235 (lemmaIsPrefixRefl!0 (_2!11801 lt!393131)))))

(declare-fun lt!393244 () Unit!18206)

(declare-fun lt!393240 () Unit!18206)

(assert (=> d!84516 (= lt!393244 lt!393240)))

(assert (=> d!84516 (isPrefixOf!0 lt!393231 lt!393231)))

(assert (=> d!84516 (= lt!393240 (lemmaIsPrefixRefl!0 lt!393231))))

(declare-fun lt!393232 () Unit!18206)

(declare-fun lt!393246 () Unit!18206)

(assert (=> d!84516 (= lt!393232 lt!393246)))

(assert (=> d!84516 (isPrefixOf!0 (_2!11801 lt!392494) (_2!11801 lt!392494))))

(assert (=> d!84516 (= lt!393246 (lemmaIsPrefixRefl!0 (_2!11801 lt!392494)))))

(assert (=> d!84516 (= lt!393231 (BitStream!10981 (buf!6531 (_2!11801 lt!393131)) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494))))))

(assert (=> d!84516 (isPrefixOf!0 (_2!11801 lt!392494) (_2!11801 lt!393131))))

(assert (=> d!84516 (= (reader!0 (_2!11801 lt!392494) (_2!11801 lt!393131)) lt!393245)))

(assert (= (and d!84516 c!11639) b!253091))

(assert (= (and d!84516 (not c!11639)) b!253087))

(assert (= (and d!84516 res!212091) b!253089))

(assert (= (and b!253089 res!212089) b!253090))

(assert (= (and b!253090 res!212090) b!253088))

(declare-fun m!380977 () Bool)

(assert (=> d!84516 m!380977))

(declare-fun m!380979 () Bool)

(assert (=> d!84516 m!380979))

(declare-fun m!380981 () Bool)

(assert (=> d!84516 m!380981))

(assert (=> d!84516 m!380763))

(declare-fun m!380983 () Bool)

(assert (=> d!84516 m!380983))

(declare-fun m!380985 () Bool)

(assert (=> d!84516 m!380985))

(declare-fun m!380987 () Bool)

(assert (=> d!84516 m!380987))

(assert (=> d!84516 m!380843))

(assert (=> d!84516 m!380771))

(declare-fun m!380989 () Bool)

(assert (=> d!84516 m!380989))

(declare-fun m!380991 () Bool)

(assert (=> d!84516 m!380991))

(declare-fun m!380993 () Bool)

(assert (=> b!253088 m!380993))

(assert (=> b!253088 m!380841))

(assert (=> b!253088 m!380269))

(assert (=> b!253091 m!380269))

(declare-fun m!380995 () Bool)

(assert (=> b!253091 m!380995))

(declare-fun m!380997 () Bool)

(assert (=> b!253091 m!380997))

(declare-fun m!380999 () Bool)

(assert (=> b!253089 m!380999))

(declare-fun m!381001 () Bool)

(assert (=> b!253090 m!381001))

(assert (=> b!253025 d!84516))

(declare-fun d!84518 () Bool)

(declare-fun e!175353 () Bool)

(assert (=> d!84518 e!175353))

(declare-fun res!212092 () Bool)

(assert (=> d!84518 (=> (not res!212092) (not e!175353))))

(declare-fun lt!393251 () (_ BitVec 64))

(declare-fun lt!393252 () (_ BitVec 64))

(declare-fun lt!393249 () (_ BitVec 64))

(assert (=> d!84518 (= res!212092 (= lt!393251 (bvsub lt!393249 lt!393252)))))

(assert (=> d!84518 (or (= (bvand lt!393249 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393252 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393249 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393249 lt!393252) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84518 (= lt!393252 (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!393148)))) ((_ sign_extend 32) (currentByte!11986 (_1!11802 lt!393148))) ((_ sign_extend 32) (currentBit!11981 (_1!11802 lt!393148)))))))

(declare-fun lt!393250 () (_ BitVec 64))

(declare-fun lt!393248 () (_ BitVec 64))

(assert (=> d!84518 (= lt!393249 (bvmul lt!393250 lt!393248))))

(assert (=> d!84518 (or (= lt!393250 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393248 (bvsdiv (bvmul lt!393250 lt!393248) lt!393250)))))

(assert (=> d!84518 (= lt!393248 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84518 (= lt!393250 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!393148)))))))

(assert (=> d!84518 (= lt!393251 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11986 (_1!11802 lt!393148))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11981 (_1!11802 lt!393148)))))))

(assert (=> d!84518 (invariant!0 (currentBit!11981 (_1!11802 lt!393148)) (currentByte!11986 (_1!11802 lt!393148)) (size!6029 (buf!6531 (_1!11802 lt!393148))))))

(assert (=> d!84518 (= (bitIndex!0 (size!6029 (buf!6531 (_1!11802 lt!393148))) (currentByte!11986 (_1!11802 lt!393148)) (currentBit!11981 (_1!11802 lt!393148))) lt!393251)))

(declare-fun b!253092 () Bool)

(declare-fun res!212093 () Bool)

(assert (=> b!253092 (=> (not res!212093) (not e!175353))))

(assert (=> b!253092 (= res!212093 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393251))))

(declare-fun b!253093 () Bool)

(declare-fun lt!393247 () (_ BitVec 64))

(assert (=> b!253093 (= e!175353 (bvsle lt!393251 (bvmul lt!393247 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253093 (or (= lt!393247 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393247 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393247)))))

(assert (=> b!253093 (= lt!393247 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!393148)))))))

(assert (= (and d!84518 res!212092) b!253092))

(assert (= (and b!253092 res!212093) b!253093))

(declare-fun m!381003 () Bool)

(assert (=> d!84518 m!381003))

(declare-fun m!381005 () Bool)

(assert (=> d!84518 m!381005))

(assert (=> b!253042 d!84518))

(declare-fun d!84520 () Bool)

(declare-fun e!175354 () Bool)

(assert (=> d!84520 e!175354))

(declare-fun res!212094 () Bool)

(assert (=> d!84520 (=> (not res!212094) (not e!175354))))

(declare-fun lt!393255 () (_ BitVec 64))

(declare-fun lt!393257 () (_ BitVec 64))

(declare-fun lt!393258 () (_ BitVec 64))

(assert (=> d!84520 (= res!212094 (= lt!393257 (bvsub lt!393255 lt!393258)))))

(assert (=> d!84520 (or (= (bvand lt!393255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393258 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393255 lt!393258) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84520 (= lt!393258 (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!393147)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!393147))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!393147)))))))

(declare-fun lt!393256 () (_ BitVec 64))

(declare-fun lt!393254 () (_ BitVec 64))

(assert (=> d!84520 (= lt!393255 (bvmul lt!393256 lt!393254))))

(assert (=> d!84520 (or (= lt!393256 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393254 (bvsdiv (bvmul lt!393256 lt!393254) lt!393256)))))

(assert (=> d!84520 (= lt!393254 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84520 (= lt!393256 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!393147)))))))

(assert (=> d!84520 (= lt!393257 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!393147))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!393147)))))))

(assert (=> d!84520 (invariant!0 (currentBit!11981 (_2!11801 lt!393147)) (currentByte!11986 (_2!11801 lt!393147)) (size!6029 (buf!6531 (_2!11801 lt!393147))))))

(assert (=> d!84520 (= (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!393147))) (currentByte!11986 (_2!11801 lt!393147)) (currentBit!11981 (_2!11801 lt!393147))) lt!393257)))

(declare-fun b!253094 () Bool)

(declare-fun res!212095 () Bool)

(assert (=> b!253094 (=> (not res!212095) (not e!175354))))

(assert (=> b!253094 (= res!212095 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393257))))

(declare-fun b!253095 () Bool)

(declare-fun lt!393253 () (_ BitVec 64))

(assert (=> b!253095 (= e!175354 (bvsle lt!393257 (bvmul lt!393253 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253095 (or (= lt!393253 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393253 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393253)))))

(assert (=> b!253095 (= lt!393253 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!393147)))))))

(assert (= (and d!84520 res!212094) b!253094))

(assert (= (and b!253094 res!212095) b!253095))

(declare-fun m!381007 () Bool)

(assert (=> d!84520 m!381007))

(declare-fun m!381009 () Bool)

(assert (=> d!84520 m!381009))

(assert (=> b!253042 d!84520))

(declare-fun d!84522 () Bool)

(declare-fun res!212096 () Bool)

(declare-fun e!175356 () Bool)

(assert (=> d!84522 (=> (not res!212096) (not e!175356))))

(assert (=> d!84522 (= res!212096 (= (size!6029 (buf!6531 thiss!1005)) (size!6029 (buf!6531 (_2!11801 lt!393147)))))))

(assert (=> d!84522 (= (isPrefixOf!0 thiss!1005 (_2!11801 lt!393147)) e!175356)))

(declare-fun b!253096 () Bool)

(declare-fun res!212097 () Bool)

(assert (=> b!253096 (=> (not res!212097) (not e!175356))))

(assert (=> b!253096 (= res!212097 (bvsle (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)) (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!393147))) (currentByte!11986 (_2!11801 lt!393147)) (currentBit!11981 (_2!11801 lt!393147)))))))

(declare-fun b!253097 () Bool)

(declare-fun e!175355 () Bool)

(assert (=> b!253097 (= e!175356 e!175355)))

(declare-fun res!212098 () Bool)

(assert (=> b!253097 (=> res!212098 e!175355)))

(assert (=> b!253097 (= res!212098 (= (size!6029 (buf!6531 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!253098 () Bool)

(assert (=> b!253098 (= e!175355 (arrayBitRangesEq!0 (buf!6531 thiss!1005) (buf!6531 (_2!11801 lt!393147)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))))))

(assert (= (and d!84522 res!212096) b!253096))

(assert (= (and b!253096 res!212097) b!253097))

(assert (= (and b!253097 (not res!212098)) b!253098))

(assert (=> b!253096 m!380271))

(assert (=> b!253096 m!380865))

(assert (=> b!253098 m!380271))

(assert (=> b!253098 m!380271))

(declare-fun m!381011 () Bool)

(assert (=> b!253098 m!381011))

(assert (=> b!253040 d!84522))

(assert (=> d!84444 d!84436))

(declare-fun d!84524 () Bool)

(assert (=> d!84524 (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))) ((_ sign_extend 32) (currentByte!11986 thiss!1005)) ((_ sign_extend 32) (currentBit!11981 thiss!1005)) (bvsub nBits!297 from!289))))

(assert (=> d!84524 true))

(declare-fun _$6!417 () Unit!18206)

(assert (=> d!84524 (= (choose!9 thiss!1005 (buf!6531 (_2!11801 lt!392492)) (bvsub nBits!297 from!289) (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))) _$6!417)))

(declare-fun bs!21421 () Bool)

(assert (= bs!21421 d!84524))

(assert (=> bs!21421 m!380311))

(assert (=> d!84444 d!84524))

(assert (=> b!252998 d!84410))

(assert (=> b!252998 d!84408))

(declare-fun b!253117 () Bool)

(declare-fun e!175370 () Bool)

(assert (=> b!253117 (= e!175370 (= bit!26 (_2!11802 (readBitPure!0 (_1!11800 lt!392500)))))))

(declare-fun b!253118 () Bool)

(declare-fun e!175367 () Bool)

(assert (=> b!253118 (= e!175367 e!175370)))

(declare-fun res!212113 () Bool)

(assert (=> b!253118 (=> res!212113 e!175370)))

(declare-fun lt!393290 () tuple2!21760)

(assert (=> b!253118 (= res!212113 (or (not (_1!11808 lt!393290)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297)))))

(declare-fun b!253119 () Bool)

(declare-fun e!175369 () tuple2!21760)

(declare-fun e!175371 () tuple2!21760)

(assert (=> b!253119 (= e!175369 e!175371)))

(declare-fun lt!393283 () tuple2!21760)

(assert (=> b!253119 (= lt!393283 (readBit!0 (_1!11800 lt!392500)))))

(declare-fun c!11644 () Bool)

(assert (=> b!253119 (= c!11644 (not (= (_1!11808 lt!393283) bit!26)))))

(declare-fun b!253121 () Bool)

(declare-fun res!212111 () Bool)

(assert (=> b!253121 (=> (not res!212111) (not e!175367))))

(declare-fun e!175368 () Bool)

(assert (=> b!253121 (= res!212111 e!175368)))

(declare-fun res!212109 () Bool)

(assert (=> b!253121 (=> res!212109 e!175368)))

(assert (=> b!253121 (= res!212109 (not (_1!11808 lt!393290)))))

(declare-fun b!253122 () Bool)

(assert (=> b!253122 (= e!175369 (tuple2!21761 true (_1!11800 lt!392500)))))

(declare-fun b!253123 () Bool)

(assert (=> b!253123 (= e!175371 (tuple2!21761 false (_2!11808 lt!393283)))))

(declare-fun b!253124 () Bool)

(declare-fun lt!393281 () tuple2!21760)

(assert (=> b!253124 (= lt!393281 (checkBitsLoop!0 (_2!11808 lt!393283) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!393286 () Unit!18206)

(declare-fun lt!393284 () Unit!18206)

(assert (=> b!253124 (= lt!393286 lt!393284)))

(declare-fun lt!393291 () (_ BitVec 64))

(declare-fun lt!393285 () (_ BitVec 64))

(assert (=> b!253124 (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11808 lt!393283)))) ((_ sign_extend 32) (currentByte!11986 (_2!11808 lt!393283))) ((_ sign_extend 32) (currentBit!11981 (_2!11808 lt!393283))) (bvsub lt!393291 lt!393285))))

(assert (=> b!253124 (= lt!393284 (validateOffsetBitsIneqLemma!0 (_1!11800 lt!392500) (_2!11808 lt!393283) lt!393291 lt!393285))))

(assert (=> b!253124 (= lt!393285 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253124 (= lt!393291 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!253124 (= e!175371 (tuple2!21761 (_1!11808 lt!393281) (_2!11808 lt!393281)))))

(declare-fun lt!393288 () (_ BitVec 64))

(declare-fun b!253125 () Bool)

(assert (=> b!253125 (= e!175368 (= (bvsub lt!393288 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6029 (buf!6531 (_2!11808 lt!393290))) (currentByte!11986 (_2!11808 lt!393290)) (currentBit!11981 (_2!11808 lt!393290)))))))

(assert (=> b!253125 (or (= (bvand lt!393288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393288 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!393282 () (_ BitVec 64))

(assert (=> b!253125 (= lt!393288 (bvadd lt!393282 nBits!297))))

(assert (=> b!253125 (or (not (= (bvand lt!393282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393282 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253125 (= lt!393282 (bitIndex!0 (size!6029 (buf!6531 (_1!11800 lt!392500))) (currentByte!11986 (_1!11800 lt!392500)) (currentBit!11981 (_1!11800 lt!392500))))))

(declare-fun b!253120 () Bool)

(declare-fun res!212112 () Bool)

(assert (=> b!253120 (=> (not res!212112) (not e!175367))))

(assert (=> b!253120 (= res!212112 (and (= (buf!6531 (_1!11800 lt!392500)) (buf!6531 (_2!11808 lt!393290))) (or (not (= nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_1!11808 lt!393290))))))

(declare-fun d!84526 () Bool)

(assert (=> d!84526 e!175367))

(declare-fun res!212110 () Bool)

(assert (=> d!84526 (=> (not res!212110) (not e!175367))))

(declare-fun lt!393289 () (_ BitVec 64))

(assert (=> d!84526 (= res!212110 (bvsge (bvsub lt!393289 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6029 (buf!6531 (_2!11808 lt!393290))) (currentByte!11986 (_2!11808 lt!393290)) (currentBit!11981 (_2!11808 lt!393290)))))))

(assert (=> d!84526 (or (= (bvand lt!393289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393289 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!393287 () (_ BitVec 64))

(assert (=> d!84526 (= lt!393289 (bvadd lt!393287 nBits!297))))

(assert (=> d!84526 (or (not (= (bvand lt!393287 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393287 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393287 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84526 (= lt!393287 (bitIndex!0 (size!6029 (buf!6531 (_1!11800 lt!392500))) (currentByte!11986 (_1!11800 lt!392500)) (currentBit!11981 (_1!11800 lt!392500))))))

(assert (=> d!84526 (= lt!393290 e!175369)))

(declare-fun c!11645 () Bool)

(assert (=> d!84526 (= c!11645 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297))))

(assert (=> d!84526 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!84526 (= (checkBitsLoop!0 (_1!11800 lt!392500) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!393290)))

(assert (= (and d!84526 c!11645) b!253122))

(assert (= (and d!84526 (not c!11645)) b!253119))

(assert (= (and b!253119 c!11644) b!253123))

(assert (= (and b!253119 (not c!11644)) b!253124))

(assert (= (and d!84526 res!212110) b!253120))

(assert (= (and b!253120 res!212112) b!253121))

(assert (= (and b!253121 (not res!212109)) b!253125))

(assert (= (and b!253121 res!212111) b!253118))

(assert (= (and b!253118 (not res!212113)) b!253117))

(declare-fun m!381013 () Bool)

(assert (=> b!253125 m!381013))

(declare-fun m!381015 () Bool)

(assert (=> b!253125 m!381015))

(declare-fun m!381017 () Bool)

(assert (=> b!253124 m!381017))

(declare-fun m!381019 () Bool)

(assert (=> b!253124 m!381019))

(declare-fun m!381021 () Bool)

(assert (=> b!253124 m!381021))

(declare-fun m!381023 () Bool)

(assert (=> b!253119 m!381023))

(assert (=> d!84526 m!381013))

(assert (=> d!84526 m!381015))

(declare-fun m!381025 () Bool)

(assert (=> b!253117 m!381025))

(assert (=> d!84416 d!84526))

(declare-fun b!253140 () Bool)

(declare-fun e!175389 () Bool)

(declare-fun call!3969 () Bool)

(assert (=> b!253140 (= e!175389 call!3969)))

(declare-fun b!253141 () Bool)

(declare-fun lt!393299 () (_ BitVec 32))

(declare-datatypes ((tuple4!296 0))(
  ( (tuple4!297 (_1!11809 (_ BitVec 32)) (_2!11809 (_ BitVec 32)) (_3!928 (_ BitVec 32)) (_4!148 (_ BitVec 32))) )
))
(declare-fun lt!393298 () tuple4!296)

(declare-fun e!175387 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!253141 (= e!175387 (byteRangesEq!0 (select (arr!7016 (buf!6531 thiss!1005)) (_4!148 lt!393298)) (select (arr!7016 (buf!6531 (_2!11801 lt!392494))) (_4!148 lt!393298)) #b00000000000000000000000000000000 lt!393299))))

(declare-fun lt!393300 () (_ BitVec 32))

(declare-fun bm!3966 () Bool)

(declare-fun c!11648 () Bool)

(assert (=> bm!3966 (= call!3969 (byteRangesEq!0 (select (arr!7016 (buf!6531 thiss!1005)) (_3!928 lt!393298)) (select (arr!7016 (buf!6531 (_2!11801 lt!392494))) (_3!928 lt!393298)) lt!393300 (ite c!11648 lt!393299 #b00000000000000000000000000001000)))))

(declare-fun b!253142 () Bool)

(declare-fun e!175388 () Bool)

(declare-fun e!175386 () Bool)

(assert (=> b!253142 (= e!175388 e!175386)))

(declare-fun res!212127 () Bool)

(assert (=> b!253142 (=> (not res!212127) (not e!175386))))

(declare-fun e!175385 () Bool)

(assert (=> b!253142 (= res!212127 e!175385)))

(declare-fun res!212128 () Bool)

(assert (=> b!253142 (=> res!212128 e!175385)))

(assert (=> b!253142 (= res!212128 (bvsge (_1!11809 lt!393298) (_2!11809 lt!393298)))))

(assert (=> b!253142 (= lt!393299 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253142 (= lt!393300 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!296)

(assert (=> b!253142 (= lt!393298 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))))))

(declare-fun b!253143 () Bool)

(declare-fun res!212124 () Bool)

(assert (=> b!253143 (= res!212124 (= lt!393299 #b00000000000000000000000000000000))))

(assert (=> b!253143 (=> res!212124 e!175387)))

(declare-fun e!175384 () Bool)

(assert (=> b!253143 (= e!175384 e!175387)))

(declare-fun b!253144 () Bool)

(assert (=> b!253144 (= e!175386 e!175389)))

(assert (=> b!253144 (= c!11648 (= (_3!928 lt!393298) (_4!148 lt!393298)))))

(declare-fun b!253145 () Bool)

(declare-fun arrayRangesEq!925 (array!13740 array!13740 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!253145 (= e!175385 (arrayRangesEq!925 (buf!6531 thiss!1005) (buf!6531 (_2!11801 lt!392494)) (_1!11809 lt!393298) (_2!11809 lt!393298)))))

(declare-fun b!253146 () Bool)

(assert (=> b!253146 (= e!175389 e!175384)))

(declare-fun res!212126 () Bool)

(assert (=> b!253146 (= res!212126 call!3969)))

(assert (=> b!253146 (=> (not res!212126) (not e!175384))))

(declare-fun d!84528 () Bool)

(declare-fun res!212125 () Bool)

(assert (=> d!84528 (=> res!212125 e!175388)))

(assert (=> d!84528 (= res!212125 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))))))

(assert (=> d!84528 (= (arrayBitRangesEq!0 (buf!6531 thiss!1005) (buf!6531 (_2!11801 lt!392494)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))) e!175388)))

(assert (= (and d!84528 (not res!212125)) b!253142))

(assert (= (and b!253142 (not res!212128)) b!253145))

(assert (= (and b!253142 res!212127) b!253144))

(assert (= (and b!253144 c!11648) b!253140))

(assert (= (and b!253144 (not c!11648)) b!253146))

(assert (= (and b!253146 res!212126) b!253143))

(assert (= (and b!253143 (not res!212124)) b!253141))

(assert (= (or b!253140 b!253146) bm!3966))

(declare-fun m!381027 () Bool)

(assert (=> b!253141 m!381027))

(declare-fun m!381029 () Bool)

(assert (=> b!253141 m!381029))

(assert (=> b!253141 m!381027))

(assert (=> b!253141 m!381029))

(declare-fun m!381031 () Bool)

(assert (=> b!253141 m!381031))

(declare-fun m!381033 () Bool)

(assert (=> bm!3966 m!381033))

(declare-fun m!381035 () Bool)

(assert (=> bm!3966 m!381035))

(assert (=> bm!3966 m!381033))

(assert (=> bm!3966 m!381035))

(declare-fun m!381037 () Bool)

(assert (=> bm!3966 m!381037))

(assert (=> b!253142 m!380271))

(declare-fun m!381039 () Bool)

(assert (=> b!253142 m!381039))

(declare-fun m!381041 () Bool)

(assert (=> b!253145 m!381041))

(assert (=> b!253000 d!84528))

(assert (=> b!253000 d!84410))

(declare-fun d!84530 () Bool)

(declare-fun e!175390 () Bool)

(assert (=> d!84530 e!175390))

(declare-fun res!212129 () Bool)

(assert (=> d!84530 (=> (not res!212129) (not e!175390))))

(declare-fun lt!393302 () (_ BitVec 64))

(declare-fun lt!393301 () BitStream!10980)

(assert (=> d!84530 (= res!212129 (= (bvadd lt!393302 (bvsub lt!393100 lt!393104)) (bitIndex!0 (size!6029 (buf!6531 lt!393301)) (currentByte!11986 lt!393301) (currentBit!11981 lt!393301))))))

(assert (=> d!84530 (or (not (= (bvand lt!393302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393100 lt!393104) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393302 (bvsub lt!393100 lt!393104)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84530 (= lt!393302 (bitIndex!0 (size!6029 (buf!6531 (_2!11800 lt!393106))) (currentByte!11986 (_2!11800 lt!393106)) (currentBit!11981 (_2!11800 lt!393106))))))

(assert (=> d!84530 (= lt!393301 (_2!11801 (moveBitIndex!0 (_2!11800 lt!393106) (bvsub lt!393100 lt!393104))))))

(assert (=> d!84530 (moveBitIndexPrecond!0 (_2!11800 lt!393106) (bvsub lt!393100 lt!393104))))

(assert (=> d!84530 (= (withMovedBitIndex!0 (_2!11800 lt!393106) (bvsub lt!393100 lt!393104)) lt!393301)))

(declare-fun b!253147 () Bool)

(assert (=> b!253147 (= e!175390 (= (size!6029 (buf!6531 (_2!11800 lt!393106))) (size!6029 (buf!6531 lt!393301))))))

(assert (= (and d!84530 res!212129) b!253147))

(declare-fun m!381043 () Bool)

(assert (=> d!84530 m!381043))

(declare-fun m!381045 () Bool)

(assert (=> d!84530 m!381045))

(declare-fun m!381047 () Bool)

(assert (=> d!84530 m!381047))

(declare-fun m!381049 () Bool)

(assert (=> d!84530 m!381049))

(assert (=> b!253008 d!84530))

(assert (=> b!253008 d!84424))

(assert (=> b!253008 d!84410))

(declare-fun d!84532 () Bool)

(declare-fun e!175398 () Bool)

(assert (=> d!84532 e!175398))

(declare-fun res!212138 () Bool)

(assert (=> d!84532 (=> (not res!212138) (not e!175398))))

(declare-fun _$23!33 () tuple2!21746)

(assert (=> d!84532 (= res!212138 (= (size!6029 (buf!6531 (_2!11801 lt!392494))) (size!6029 (buf!6531 (_2!11801 _$23!33)))))))

(declare-fun e!175397 () Bool)

(assert (=> d!84532 (and (inv!12 (_2!11801 _$23!33)) e!175397)))

(assert (=> d!84532 (= (choose!51 (_2!11801 lt!392494) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) _$23!33)))

(declare-fun b!253158 () Bool)

(declare-fun res!212137 () Bool)

(assert (=> b!253158 (=> (not res!212137) (not e!175398))))

(assert (=> b!253158 (= res!212137 (isPrefixOf!0 (_2!11801 lt!392494) (_2!11801 _$23!33)))))

(declare-fun b!253159 () Bool)

(declare-fun lt!393317 () tuple2!21748)

(declare-fun lt!393313 () tuple2!21744)

(assert (=> b!253159 (= e!175398 (and (_2!11802 lt!393317) (= (_1!11802 lt!393317) (_2!11800 lt!393313))))))

(assert (=> b!253159 (= lt!393317 (checkBitsLoopPure!0 (_1!11800 lt!393313) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!393314 () Unit!18206)

(declare-fun lt!393315 () Unit!18206)

(assert (=> b!253159 (= lt!393314 lt!393315)))

(declare-fun lt!393316 () (_ BitVec 64))

(assert (=> b!253159 (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 _$23!33)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494))) lt!393316)))

(assert (=> b!253159 (= lt!393315 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11801 lt!392494) (buf!6531 (_2!11801 _$23!33)) lt!393316))))

(assert (=> b!253159 (= lt!393316 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!253159 (= lt!393313 (reader!0 (_2!11801 lt!392494) (_2!11801 _$23!33)))))

(declare-fun b!253157 () Bool)

(declare-fun res!212136 () Bool)

(assert (=> b!253157 (=> (not res!212136) (not e!175398))))

(assert (=> b!253157 (= res!212136 (= (bitIndex!0 (size!6029 (buf!6531 (_2!11801 _$23!33))) (currentByte!11986 (_2!11801 _$23!33)) (currentBit!11981 (_2!11801 _$23!33))) (bvadd (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392494))) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494))) (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))))

(declare-fun b!253156 () Bool)

(assert (=> b!253156 (= e!175397 (array_inv!5770 (buf!6531 (_2!11801 _$23!33))))))

(assert (= d!84532 b!253156))

(assert (= (and d!84532 res!212138) b!253157))

(assert (= (and b!253157 res!212136) b!253158))

(assert (= (and b!253158 res!212137) b!253159))

(declare-fun m!381051 () Bool)

(assert (=> b!253157 m!381051))

(assert (=> b!253157 m!380269))

(declare-fun m!381053 () Bool)

(assert (=> b!253158 m!381053))

(declare-fun m!381055 () Bool)

(assert (=> b!253156 m!381055))

(declare-fun m!381057 () Bool)

(assert (=> b!253159 m!381057))

(declare-fun m!381059 () Bool)

(assert (=> b!253159 m!381059))

(declare-fun m!381061 () Bool)

(assert (=> b!253159 m!381061))

(declare-fun m!381063 () Bool)

(assert (=> b!253159 m!381063))

(declare-fun m!381065 () Bool)

(assert (=> d!84532 m!381065))

(assert (=> d!84446 d!84532))

(declare-fun d!84534 () Bool)

(declare-fun e!175400 () Bool)

(assert (=> d!84534 e!175400))

(declare-fun res!212139 () Bool)

(assert (=> d!84534 (=> (not res!212139) (not e!175400))))

(declare-fun lt!393323 () (_ BitVec 64))

(declare-fun lt!393322 () (_ BitVec 64))

(declare-fun lt!393320 () (_ BitVec 64))

(assert (=> d!84534 (= res!212139 (= lt!393322 (bvsub lt!393320 lt!393323)))))

(assert (=> d!84534 (or (= (bvand lt!393320 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393323 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393320 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393320 lt!393323) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84534 (= lt!393323 (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 lt!393086))) ((_ sign_extend 32) (currentByte!11986 lt!393086)) ((_ sign_extend 32) (currentBit!11981 lt!393086))))))

(declare-fun lt!393321 () (_ BitVec 64))

(declare-fun lt!393319 () (_ BitVec 64))

(assert (=> d!84534 (= lt!393320 (bvmul lt!393321 lt!393319))))

(assert (=> d!84534 (or (= lt!393321 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393319 (bvsdiv (bvmul lt!393321 lt!393319) lt!393321)))))

(assert (=> d!84534 (= lt!393319 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84534 (= lt!393321 ((_ sign_extend 32) (size!6029 (buf!6531 lt!393086))))))

(assert (=> d!84534 (= lt!393322 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11986 lt!393086)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11981 lt!393086))))))

(assert (=> d!84534 (invariant!0 (currentBit!11981 lt!393086) (currentByte!11986 lt!393086) (size!6029 (buf!6531 lt!393086)))))

(assert (=> d!84534 (= (bitIndex!0 (size!6029 (buf!6531 lt!393086)) (currentByte!11986 lt!393086) (currentBit!11981 lt!393086)) lt!393322)))

(declare-fun b!253160 () Bool)

(declare-fun res!212140 () Bool)

(assert (=> b!253160 (=> (not res!212140) (not e!175400))))

(assert (=> b!253160 (= res!212140 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393322))))

(declare-fun b!253161 () Bool)

(declare-fun lt!393318 () (_ BitVec 64))

(assert (=> b!253161 (= e!175400 (bvsle lt!393322 (bvmul lt!393318 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253161 (or (= lt!393318 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393318 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393318)))))

(assert (=> b!253161 (= lt!393318 ((_ sign_extend 32) (size!6029 (buf!6531 lt!393086))))))

(assert (= (and d!84534 res!212139) b!253160))

(assert (= (and b!253160 res!212140) b!253161))

(declare-fun m!381067 () Bool)

(assert (=> d!84534 m!381067))

(declare-fun m!381069 () Bool)

(assert (=> d!84534 m!381069))

(assert (=> d!84428 d!84534))

(declare-fun d!84536 () Bool)

(declare-fun e!175401 () Bool)

(assert (=> d!84536 e!175401))

(declare-fun res!212141 () Bool)

(assert (=> d!84536 (=> (not res!212141) (not e!175401))))

(declare-fun lt!393326 () (_ BitVec 64))

(declare-fun lt!393329 () (_ BitVec 64))

(declare-fun lt!393328 () (_ BitVec 64))

(assert (=> d!84536 (= res!212141 (= lt!393328 (bvsub lt!393326 lt!393329)))))

(assert (=> d!84536 (or (= (bvand lt!393326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393329 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393326 lt!393329) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84536 (= lt!393329 (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11800 lt!392483)))) ((_ sign_extend 32) (currentByte!11986 (_1!11800 lt!392483))) ((_ sign_extend 32) (currentBit!11981 (_1!11800 lt!392483)))))))

(declare-fun lt!393327 () (_ BitVec 64))

(declare-fun lt!393325 () (_ BitVec 64))

(assert (=> d!84536 (= lt!393326 (bvmul lt!393327 lt!393325))))

(assert (=> d!84536 (or (= lt!393327 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393325 (bvsdiv (bvmul lt!393327 lt!393325) lt!393327)))))

(assert (=> d!84536 (= lt!393325 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84536 (= lt!393327 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11800 lt!392483)))))))

(assert (=> d!84536 (= lt!393328 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11986 (_1!11800 lt!392483))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11981 (_1!11800 lt!392483)))))))

(assert (=> d!84536 (invariant!0 (currentBit!11981 (_1!11800 lt!392483)) (currentByte!11986 (_1!11800 lt!392483)) (size!6029 (buf!6531 (_1!11800 lt!392483))))))

(assert (=> d!84536 (= (bitIndex!0 (size!6029 (buf!6531 (_1!11800 lt!392483))) (currentByte!11986 (_1!11800 lt!392483)) (currentBit!11981 (_1!11800 lt!392483))) lt!393328)))

(declare-fun b!253162 () Bool)

(declare-fun res!212142 () Bool)

(assert (=> b!253162 (=> (not res!212142) (not e!175401))))

(assert (=> b!253162 (= res!212142 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393328))))

(declare-fun b!253163 () Bool)

(declare-fun lt!393324 () (_ BitVec 64))

(assert (=> b!253163 (= e!175401 (bvsle lt!393328 (bvmul lt!393324 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253163 (or (= lt!393324 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393324 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393324)))))

(assert (=> b!253163 (= lt!393324 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11800 lt!392483)))))))

(assert (= (and d!84536 res!212141) b!253162))

(assert (= (and b!253162 res!212142) b!253163))

(declare-fun m!381071 () Bool)

(assert (=> d!84536 m!381071))

(declare-fun m!381073 () Bool)

(assert (=> d!84536 m!381073))

(assert (=> d!84428 d!84536))

(declare-fun d!84538 () Bool)

(declare-fun lt!393345 () (_ BitVec 32))

(assert (=> d!84538 (= lt!393345 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!393342 () (_ BitVec 32))

(assert (=> d!84538 (= lt!393342 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!175406 () Bool)

(assert (=> d!84538 e!175406))

(declare-fun res!212147 () Bool)

(assert (=> d!84538 (=> (not res!212147) (not e!175406))))

(assert (=> d!84538 (= res!212147 (moveBitIndexPrecond!0 (_1!11800 lt!392483) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!18217 () Unit!18206)

(declare-fun Unit!18218 () Unit!18206)

(declare-fun Unit!18219 () Unit!18206)

(assert (=> d!84538 (= (moveBitIndex!0 (_1!11800 lt!392483) #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!11981 (_1!11800 lt!392483)) lt!393345) #b00000000000000000000000000000000) (tuple2!21747 Unit!18217 (BitStream!10981 (buf!6531 (_1!11800 lt!392483)) (bvsub (bvadd (currentByte!11986 (_1!11800 lt!392483)) lt!393342) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!393345 (currentBit!11981 (_1!11800 lt!392483))))) (ite (bvsge (bvadd (currentBit!11981 (_1!11800 lt!392483)) lt!393345) #b00000000000000000000000000001000) (tuple2!21747 Unit!18218 (BitStream!10981 (buf!6531 (_1!11800 lt!392483)) (bvadd (currentByte!11986 (_1!11800 lt!392483)) lt!393342 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!11981 (_1!11800 lt!392483)) lt!393345) #b00000000000000000000000000001000))) (tuple2!21747 Unit!18219 (BitStream!10981 (buf!6531 (_1!11800 lt!392483)) (bvadd (currentByte!11986 (_1!11800 lt!392483)) lt!393342) (bvadd (currentBit!11981 (_1!11800 lt!392483)) lt!393345))))))))

(declare-fun b!253168 () Bool)

(declare-fun e!175407 () Bool)

(assert (=> b!253168 (= e!175406 e!175407)))

(declare-fun res!212148 () Bool)

(assert (=> b!253168 (=> (not res!212148) (not e!175407))))

(declare-fun lt!393347 () (_ BitVec 64))

(declare-fun lt!393344 () tuple2!21746)

(assert (=> b!253168 (= res!212148 (= (bvadd lt!393347 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!393344))) (currentByte!11986 (_2!11801 lt!393344)) (currentBit!11981 (_2!11801 lt!393344)))))))

(assert (=> b!253168 (or (not (= (bvand lt!393347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393347 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253168 (= lt!393347 (bitIndex!0 (size!6029 (buf!6531 (_1!11800 lt!392483))) (currentByte!11986 (_1!11800 lt!392483)) (currentBit!11981 (_1!11800 lt!392483))))))

(declare-fun lt!393343 () (_ BitVec 32))

(declare-fun lt!393346 () (_ BitVec 32))

(declare-fun Unit!18220 () Unit!18206)

(declare-fun Unit!18221 () Unit!18206)

(declare-fun Unit!18222 () Unit!18206)

(assert (=> b!253168 (= lt!393344 (ite (bvslt (bvadd (currentBit!11981 (_1!11800 lt!392483)) lt!393343) #b00000000000000000000000000000000) (tuple2!21747 Unit!18220 (BitStream!10981 (buf!6531 (_1!11800 lt!392483)) (bvsub (bvadd (currentByte!11986 (_1!11800 lt!392483)) lt!393346) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!393343 (currentBit!11981 (_1!11800 lt!392483))))) (ite (bvsge (bvadd (currentBit!11981 (_1!11800 lt!392483)) lt!393343) #b00000000000000000000000000001000) (tuple2!21747 Unit!18221 (BitStream!10981 (buf!6531 (_1!11800 lt!392483)) (bvadd (currentByte!11986 (_1!11800 lt!392483)) lt!393346 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!11981 (_1!11800 lt!392483)) lt!393343) #b00000000000000000000000000001000))) (tuple2!21747 Unit!18222 (BitStream!10981 (buf!6531 (_1!11800 lt!392483)) (bvadd (currentByte!11986 (_1!11800 lt!392483)) lt!393346) (bvadd (currentBit!11981 (_1!11800 lt!392483)) lt!393343))))))))

(assert (=> b!253168 (= lt!393343 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253168 (= lt!393346 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!253169 () Bool)

(assert (=> b!253169 (= e!175407 (and (= (size!6029 (buf!6531 (_1!11800 lt!392483))) (size!6029 (buf!6531 (_2!11801 lt!393344)))) (= (buf!6531 (_1!11800 lt!392483)) (buf!6531 (_2!11801 lt!393344)))))))

(assert (= (and d!84538 res!212147) b!253168))

(assert (= (and b!253168 res!212148) b!253169))

(assert (=> d!84538 m!380799))

(declare-fun m!381075 () Bool)

(assert (=> b!253168 m!381075))

(assert (=> b!253168 m!380795))

(assert (=> d!84428 d!84538))

(declare-fun d!84542 () Bool)

(declare-fun res!212151 () Bool)

(declare-fun e!175410 () Bool)

(assert (=> d!84542 (=> (not res!212151) (not e!175410))))

(assert (=> d!84542 (= res!212151 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11800 lt!392483))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11800 lt!392483))))))))))

(assert (=> d!84542 (= (moveBitIndexPrecond!0 (_1!11800 lt!392483) #b0000000000000000000000000000000000000000000000000000000000000001) e!175410)))

(declare-fun b!253173 () Bool)

(declare-fun lt!393350 () (_ BitVec 64))

(assert (=> b!253173 (= e!175410 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393350) (bvsle lt!393350 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11800 lt!392483))))))))))

(assert (=> b!253173 (= lt!393350 (bvadd (bitIndex!0 (size!6029 (buf!6531 (_1!11800 lt!392483))) (currentByte!11986 (_1!11800 lt!392483)) (currentBit!11981 (_1!11800 lt!392483))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!84542 res!212151) b!253173))

(assert (=> b!253173 m!380795))

(assert (=> d!84428 d!84542))

(declare-fun d!84544 () Bool)

(assert (=> d!84544 (= (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392494)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494)))) (bvsub (bvmul ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392494)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494))))))))

(assert (=> d!84408 d!84544))

(declare-fun d!84546 () Bool)

(assert (=> d!84546 (= (invariant!0 (currentBit!11981 (_2!11801 lt!392494)) (currentByte!11986 (_2!11801 lt!392494)) (size!6029 (buf!6531 (_2!11801 lt!392494)))) (and (bvsge (currentBit!11981 (_2!11801 lt!392494)) #b00000000000000000000000000000000) (bvslt (currentBit!11981 (_2!11801 lt!392494)) #b00000000000000000000000000001000) (bvsge (currentByte!11986 (_2!11801 lt!392494)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11986 (_2!11801 lt!392494)) (size!6029 (buf!6531 (_2!11801 lt!392494)))) (and (= (currentBit!11981 (_2!11801 lt!392494)) #b00000000000000000000000000000000) (= (currentByte!11986 (_2!11801 lt!392494)) (size!6029 (buf!6531 (_2!11801 lt!392494))))))))))

(assert (=> d!84408 d!84546))

(declare-fun b!253174 () Bool)

(declare-fun e!175416 () Bool)

(declare-fun call!3970 () Bool)

(assert (=> b!253174 (= e!175416 call!3970)))

(declare-fun lt!393352 () (_ BitVec 32))

(declare-fun e!175414 () Bool)

(declare-fun b!253175 () Bool)

(declare-fun lt!393351 () tuple4!296)

(assert (=> b!253175 (= e!175414 (byteRangesEq!0 (select (arr!7016 (buf!6531 thiss!1005)) (_4!148 lt!393351)) (select (arr!7016 (buf!6531 (_2!11801 lt!392492))) (_4!148 lt!393351)) #b00000000000000000000000000000000 lt!393352))))

(declare-fun c!11649 () Bool)

(declare-fun lt!393353 () (_ BitVec 32))

(declare-fun bm!3967 () Bool)

(assert (=> bm!3967 (= call!3970 (byteRangesEq!0 (select (arr!7016 (buf!6531 thiss!1005)) (_3!928 lt!393351)) (select (arr!7016 (buf!6531 (_2!11801 lt!392492))) (_3!928 lt!393351)) lt!393353 (ite c!11649 lt!393352 #b00000000000000000000000000001000)))))

(declare-fun b!253176 () Bool)

(declare-fun e!175415 () Bool)

(declare-fun e!175413 () Bool)

(assert (=> b!253176 (= e!175415 e!175413)))

(declare-fun res!212155 () Bool)

(assert (=> b!253176 (=> (not res!212155) (not e!175413))))

(declare-fun e!175412 () Bool)

(assert (=> b!253176 (= res!212155 e!175412)))

(declare-fun res!212156 () Bool)

(assert (=> b!253176 (=> res!212156 e!175412)))

(assert (=> b!253176 (= res!212156 (bvsge (_1!11809 lt!393351) (_2!11809 lt!393351)))))

(assert (=> b!253176 (= lt!393352 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253176 (= lt!393353 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253176 (= lt!393351 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))))))

(declare-fun b!253177 () Bool)

(declare-fun res!212152 () Bool)

(assert (=> b!253177 (= res!212152 (= lt!393352 #b00000000000000000000000000000000))))

(assert (=> b!253177 (=> res!212152 e!175414)))

(declare-fun e!175411 () Bool)

(assert (=> b!253177 (= e!175411 e!175414)))

(declare-fun b!253178 () Bool)

(assert (=> b!253178 (= e!175413 e!175416)))

(assert (=> b!253178 (= c!11649 (= (_3!928 lt!393351) (_4!148 lt!393351)))))

(declare-fun b!253179 () Bool)

(assert (=> b!253179 (= e!175412 (arrayRangesEq!925 (buf!6531 thiss!1005) (buf!6531 (_2!11801 lt!392492)) (_1!11809 lt!393351) (_2!11809 lt!393351)))))

(declare-fun b!253180 () Bool)

(assert (=> b!253180 (= e!175416 e!175411)))

(declare-fun res!212154 () Bool)

(assert (=> b!253180 (= res!212154 call!3970)))

(assert (=> b!253180 (=> (not res!212154) (not e!175411))))

(declare-fun d!84548 () Bool)

(declare-fun res!212153 () Bool)

(assert (=> d!84548 (=> res!212153 e!175415)))

(assert (=> d!84548 (= res!212153 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))))))

(assert (=> d!84548 (= (arrayBitRangesEq!0 (buf!6531 thiss!1005) (buf!6531 (_2!11801 lt!392492)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))) e!175415)))

(assert (= (and d!84548 (not res!212153)) b!253176))

(assert (= (and b!253176 (not res!212156)) b!253179))

(assert (= (and b!253176 res!212155) b!253178))

(assert (= (and b!253178 c!11649) b!253174))

(assert (= (and b!253178 (not c!11649)) b!253180))

(assert (= (and b!253180 res!212154) b!253177))

(assert (= (and b!253177 (not res!212152)) b!253175))

(assert (= (or b!253174 b!253180) bm!3967))

(declare-fun m!381077 () Bool)

(assert (=> b!253175 m!381077))

(declare-fun m!381079 () Bool)

(assert (=> b!253175 m!381079))

(assert (=> b!253175 m!381077))

(assert (=> b!253175 m!381079))

(declare-fun m!381081 () Bool)

(assert (=> b!253175 m!381081))

(declare-fun m!381083 () Bool)

(assert (=> bm!3967 m!381083))

(declare-fun m!381085 () Bool)

(assert (=> bm!3967 m!381085))

(assert (=> bm!3967 m!381083))

(assert (=> bm!3967 m!381085))

(declare-fun m!381087 () Bool)

(assert (=> bm!3967 m!381087))

(assert (=> b!253176 m!380271))

(assert (=> b!253176 m!381039))

(declare-fun m!381089 () Bool)

(assert (=> b!253179 m!381089))

(assert (=> b!253029 d!84548))

(assert (=> b!253029 d!84410))

(declare-fun b!253181 () Bool)

(declare-fun e!175420 () Bool)

(assert (=> b!253181 (= e!175420 (= bit!26 (_2!11802 (readBitPure!0 (_1!11800 lt!392483)))))))

(declare-fun b!253182 () Bool)

(declare-fun e!175417 () Bool)

(assert (=> b!253182 (= e!175417 e!175420)))

(declare-fun res!212161 () Bool)

(assert (=> b!253182 (=> res!212161 e!175420)))

(declare-fun lt!393363 () tuple2!21760)

(assert (=> b!253182 (= res!212161 (or (not (_1!11808 lt!393363)) (bvsge from!289 nBits!297)))))

(declare-fun b!253183 () Bool)

(declare-fun e!175419 () tuple2!21760)

(declare-fun e!175421 () tuple2!21760)

(assert (=> b!253183 (= e!175419 e!175421)))

(declare-fun lt!393356 () tuple2!21760)

(assert (=> b!253183 (= lt!393356 (readBit!0 (_1!11800 lt!392483)))))

(declare-fun c!11650 () Bool)

(assert (=> b!253183 (= c!11650 (not (= (_1!11808 lt!393356) bit!26)))))

(declare-fun b!253185 () Bool)

(declare-fun res!212159 () Bool)

(assert (=> b!253185 (=> (not res!212159) (not e!175417))))

(declare-fun e!175418 () Bool)

(assert (=> b!253185 (= res!212159 e!175418)))

(declare-fun res!212157 () Bool)

(assert (=> b!253185 (=> res!212157 e!175418)))

(assert (=> b!253185 (= res!212157 (not (_1!11808 lt!393363)))))

(declare-fun b!253186 () Bool)

(assert (=> b!253186 (= e!175419 (tuple2!21761 true (_1!11800 lt!392483)))))

(declare-fun b!253187 () Bool)

(assert (=> b!253187 (= e!175421 (tuple2!21761 false (_2!11808 lt!393356)))))

(declare-fun b!253188 () Bool)

(declare-fun lt!393354 () tuple2!21760)

(assert (=> b!253188 (= lt!393354 (checkBitsLoop!0 (_2!11808 lt!393356) nBits!297 bit!26 (bvadd from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!393359 () Unit!18206)

(declare-fun lt!393357 () Unit!18206)

(assert (=> b!253188 (= lt!393359 lt!393357)))

(declare-fun lt!393364 () (_ BitVec 64))

(declare-fun lt!393358 () (_ BitVec 64))

(assert (=> b!253188 (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11808 lt!393356)))) ((_ sign_extend 32) (currentByte!11986 (_2!11808 lt!393356))) ((_ sign_extend 32) (currentBit!11981 (_2!11808 lt!393356))) (bvsub lt!393364 lt!393358))))

(assert (=> b!253188 (= lt!393357 (validateOffsetBitsIneqLemma!0 (_1!11800 lt!392483) (_2!11808 lt!393356) lt!393364 lt!393358))))

(assert (=> b!253188 (= lt!393358 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253188 (= lt!393364 (bvsub nBits!297 from!289))))

(assert (=> b!253188 (= e!175421 (tuple2!21761 (_1!11808 lt!393354) (_2!11808 lt!393354)))))

(declare-fun b!253189 () Bool)

(declare-fun lt!393361 () (_ BitVec 64))

(assert (=> b!253189 (= e!175418 (= (bvsub lt!393361 from!289) (bitIndex!0 (size!6029 (buf!6531 (_2!11808 lt!393363))) (currentByte!11986 (_2!11808 lt!393363)) (currentBit!11981 (_2!11808 lt!393363)))))))

(assert (=> b!253189 (or (= (bvand lt!393361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393361 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!393355 () (_ BitVec 64))

(assert (=> b!253189 (= lt!393361 (bvadd lt!393355 nBits!297))))

(assert (=> b!253189 (or (not (= (bvand lt!393355 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393355 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393355 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253189 (= lt!393355 (bitIndex!0 (size!6029 (buf!6531 (_1!11800 lt!392483))) (currentByte!11986 (_1!11800 lt!392483)) (currentBit!11981 (_1!11800 lt!392483))))))

(declare-fun b!253184 () Bool)

(declare-fun res!212160 () Bool)

(assert (=> b!253184 (=> (not res!212160) (not e!175417))))

(assert (=> b!253184 (= res!212160 (and (= (buf!6531 (_1!11800 lt!392483)) (buf!6531 (_2!11808 lt!393363))) (or (not (= nBits!297 from!289)) (_1!11808 lt!393363))))))

(declare-fun d!84550 () Bool)

(assert (=> d!84550 e!175417))

(declare-fun res!212158 () Bool)

(assert (=> d!84550 (=> (not res!212158) (not e!175417))))

(declare-fun lt!393362 () (_ BitVec 64))

(assert (=> d!84550 (= res!212158 (bvsge (bvsub lt!393362 from!289) (bitIndex!0 (size!6029 (buf!6531 (_2!11808 lt!393363))) (currentByte!11986 (_2!11808 lt!393363)) (currentBit!11981 (_2!11808 lt!393363)))))))

(assert (=> d!84550 (or (= (bvand lt!393362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393362 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!393360 () (_ BitVec 64))

(assert (=> d!84550 (= lt!393362 (bvadd lt!393360 nBits!297))))

(assert (=> d!84550 (or (not (= (bvand lt!393360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393360 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84550 (= lt!393360 (bitIndex!0 (size!6029 (buf!6531 (_1!11800 lt!392483))) (currentByte!11986 (_1!11800 lt!392483)) (currentBit!11981 (_1!11800 lt!392483))))))

(assert (=> d!84550 (= lt!393363 e!175419)))

(declare-fun c!11651 () Bool)

(assert (=> d!84550 (= c!11651 (= from!289 nBits!297))))

(assert (=> d!84550 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!84550 (= (checkBitsLoop!0 (_1!11800 lt!392483) nBits!297 bit!26 from!289) lt!393363)))

(assert (= (and d!84550 c!11651) b!253186))

(assert (= (and d!84550 (not c!11651)) b!253183))

(assert (= (and b!253183 c!11650) b!253187))

(assert (= (and b!253183 (not c!11650)) b!253188))

(assert (= (and d!84550 res!212158) b!253184))

(assert (= (and b!253184 res!212160) b!253185))

(assert (= (and b!253185 (not res!212157)) b!253189))

(assert (= (and b!253185 res!212159) b!253182))

(assert (= (and b!253182 (not res!212161)) b!253181))

(declare-fun m!381091 () Bool)

(assert (=> b!253189 m!381091))

(assert (=> b!253189 m!380795))

(declare-fun m!381093 () Bool)

(assert (=> b!253188 m!381093))

(declare-fun m!381095 () Bool)

(assert (=> b!253188 m!381095))

(declare-fun m!381097 () Bool)

(assert (=> b!253188 m!381097))

(assert (=> b!253183 m!380879))

(assert (=> d!84550 m!381091))

(assert (=> d!84550 m!380795))

(assert (=> b!253181 m!380303))

(assert (=> d!84464 d!84550))

(declare-fun d!84552 () Bool)

(declare-fun e!175424 () Bool)

(assert (=> d!84552 e!175424))

(declare-fun res!212164 () Bool)

(assert (=> d!84552 (=> (not res!212164) (not e!175424))))

(declare-fun lt!393372 () tuple2!21748)

(declare-fun lt!393371 () tuple2!21748)

(assert (=> d!84552 (= res!212164 (= (bitIndex!0 (size!6029 (buf!6531 (_1!11802 lt!393372))) (currentByte!11986 (_1!11802 lt!393372)) (currentBit!11981 (_1!11802 lt!393372))) (bitIndex!0 (size!6029 (buf!6531 (_1!11802 lt!393371))) (currentByte!11986 (_1!11802 lt!393371)) (currentBit!11981 (_1!11802 lt!393371)))))))

(declare-fun lt!393373 () BitStream!10980)

(assert (=> d!84552 (= lt!393371 (readBitPure!0 lt!393373))))

(assert (=> d!84552 (= lt!393372 (readBitPure!0 lt!392497))))

(assert (=> d!84552 (= lt!393373 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 lt!392497) (currentBit!11981 lt!392497)))))

(assert (=> d!84552 (invariant!0 (currentBit!11981 lt!392497) (currentByte!11986 lt!392497) (size!6029 (buf!6531 (_2!11801 lt!392492))))))

(assert (=> d!84552 true))

(declare-fun _$9!105 () Unit!18206)

(assert (=> d!84552 (= (choose!50 lt!392497 (_2!11801 lt!392492) lt!393172 lt!393170 (tuple2!21749 (_1!11802 lt!393170) (_2!11802 lt!393170)) (_1!11802 lt!393170) (_2!11802 lt!393170) lt!393173 (tuple2!21749 (_1!11802 lt!393173) (_2!11802 lt!393173)) (_1!11802 lt!393173) (_2!11802 lt!393173)) _$9!105)))

(declare-fun b!253192 () Bool)

(assert (=> b!253192 (= e!175424 (= (_2!11802 lt!393372) (_2!11802 lt!393371)))))

(assert (= (and d!84552 res!212164) b!253192))

(declare-fun m!381099 () Bool)

(assert (=> d!84552 m!381099))

(declare-fun m!381101 () Bool)

(assert (=> d!84552 m!381101))

(assert (=> d!84552 m!380887))

(assert (=> d!84552 m!380305))

(declare-fun m!381103 () Bool)

(assert (=> d!84552 m!381103))

(assert (=> d!84468 d!84552))

(assert (=> d!84468 d!84456))

(declare-fun d!84554 () Bool)

(declare-fun e!175425 () Bool)

(assert (=> d!84554 e!175425))

(declare-fun res!212165 () Bool)

(assert (=> d!84554 (=> (not res!212165) (not e!175425))))

(declare-fun lt!393379 () (_ BitVec 64))

(declare-fun lt!393376 () (_ BitVec 64))

(declare-fun lt!393378 () (_ BitVec 64))

(assert (=> d!84554 (= res!212165 (= lt!393378 (bvsub lt!393376 lt!393379)))))

(assert (=> d!84554 (or (= (bvand lt!393376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393379 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393376 lt!393379) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84554 (= lt!393379 (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!393170)))) ((_ sign_extend 32) (currentByte!11986 (_1!11802 lt!393170))) ((_ sign_extend 32) (currentBit!11981 (_1!11802 lt!393170)))))))

(declare-fun lt!393377 () (_ BitVec 64))

(declare-fun lt!393375 () (_ BitVec 64))

(assert (=> d!84554 (= lt!393376 (bvmul lt!393377 lt!393375))))

(assert (=> d!84554 (or (= lt!393377 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393375 (bvsdiv (bvmul lt!393377 lt!393375) lt!393377)))))

(assert (=> d!84554 (= lt!393375 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84554 (= lt!393377 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!393170)))))))

(assert (=> d!84554 (= lt!393378 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11986 (_1!11802 lt!393170))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11981 (_1!11802 lt!393170)))))))

(assert (=> d!84554 (invariant!0 (currentBit!11981 (_1!11802 lt!393170)) (currentByte!11986 (_1!11802 lt!393170)) (size!6029 (buf!6531 (_1!11802 lt!393170))))))

(assert (=> d!84554 (= (bitIndex!0 (size!6029 (buf!6531 (_1!11802 lt!393170))) (currentByte!11986 (_1!11802 lt!393170)) (currentBit!11981 (_1!11802 lt!393170))) lt!393378)))

(declare-fun b!253193 () Bool)

(declare-fun res!212166 () Bool)

(assert (=> b!253193 (=> (not res!212166) (not e!175425))))

(assert (=> b!253193 (= res!212166 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393378))))

(declare-fun b!253194 () Bool)

(declare-fun lt!393374 () (_ BitVec 64))

(assert (=> b!253194 (= e!175425 (bvsle lt!393378 (bvmul lt!393374 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253194 (or (= lt!393374 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393374 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393374)))))

(assert (=> b!253194 (= lt!393374 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!393170)))))))

(assert (= (and d!84554 res!212165) b!253193))

(assert (= (and b!253193 res!212166) b!253194))

(declare-fun m!381105 () Bool)

(assert (=> d!84554 m!381105))

(declare-fun m!381107 () Bool)

(assert (=> d!84554 m!381107))

(assert (=> d!84468 d!84554))

(declare-fun d!84556 () Bool)

(declare-fun e!175426 () Bool)

(assert (=> d!84556 e!175426))

(declare-fun res!212167 () Bool)

(assert (=> d!84556 (=> (not res!212167) (not e!175426))))

(declare-fun lt!393382 () (_ BitVec 64))

(declare-fun lt!393384 () (_ BitVec 64))

(declare-fun lt!393385 () (_ BitVec 64))

(assert (=> d!84556 (= res!212167 (= lt!393384 (bvsub lt!393382 lt!393385)))))

(assert (=> d!84556 (or (= (bvand lt!393382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393385 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393382 lt!393385) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84556 (= lt!393385 (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!393173)))) ((_ sign_extend 32) (currentByte!11986 (_1!11802 lt!393173))) ((_ sign_extend 32) (currentBit!11981 (_1!11802 lt!393173)))))))

(declare-fun lt!393383 () (_ BitVec 64))

(declare-fun lt!393381 () (_ BitVec 64))

(assert (=> d!84556 (= lt!393382 (bvmul lt!393383 lt!393381))))

(assert (=> d!84556 (or (= lt!393383 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393381 (bvsdiv (bvmul lt!393383 lt!393381) lt!393383)))))

(assert (=> d!84556 (= lt!393381 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84556 (= lt!393383 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!393173)))))))

(assert (=> d!84556 (= lt!393384 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11986 (_1!11802 lt!393173))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11981 (_1!11802 lt!393173)))))))

(assert (=> d!84556 (invariant!0 (currentBit!11981 (_1!11802 lt!393173)) (currentByte!11986 (_1!11802 lt!393173)) (size!6029 (buf!6531 (_1!11802 lt!393173))))))

(assert (=> d!84556 (= (bitIndex!0 (size!6029 (buf!6531 (_1!11802 lt!393173))) (currentByte!11986 (_1!11802 lt!393173)) (currentBit!11981 (_1!11802 lt!393173))) lt!393384)))

(declare-fun b!253195 () Bool)

(declare-fun res!212168 () Bool)

(assert (=> b!253195 (=> (not res!212168) (not e!175426))))

(assert (=> b!253195 (= res!212168 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393384))))

(declare-fun b!253196 () Bool)

(declare-fun lt!393380 () (_ BitVec 64))

(assert (=> b!253196 (= e!175426 (bvsle lt!393384 (bvmul lt!393380 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253196 (or (= lt!393380 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393380 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393380)))))

(assert (=> b!253196 (= lt!393380 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!393173)))))))

(assert (= (and d!84556 res!212167) b!253195))

(assert (= (and b!253195 res!212168) b!253196))

(declare-fun m!381109 () Bool)

(assert (=> d!84556 m!381109))

(declare-fun m!381111 () Bool)

(assert (=> d!84556 m!381111))

(assert (=> d!84468 d!84556))

(declare-fun d!84558 () Bool)

(assert (=> d!84558 (= (invariant!0 (currentBit!11981 lt!392497) (currentByte!11986 lt!392497) (size!6029 (buf!6531 (_2!11801 lt!392492)))) (and (bvsge (currentBit!11981 lt!392497) #b00000000000000000000000000000000) (bvslt (currentBit!11981 lt!392497) #b00000000000000000000000000001000) (bvsge (currentByte!11986 lt!392497) #b00000000000000000000000000000000) (or (bvslt (currentByte!11986 lt!392497) (size!6029 (buf!6531 (_2!11801 lt!392492)))) (and (= (currentBit!11981 lt!392497) #b00000000000000000000000000000000) (= (currentByte!11986 lt!392497) (size!6029 (buf!6531 (_2!11801 lt!392492))))))))))

(assert (=> d!84468 d!84558))

(declare-fun d!84560 () Bool)

(declare-fun lt!393386 () tuple2!21760)

(assert (=> d!84560 (= lt!393386 (readBit!0 lt!393172))))

(assert (=> d!84560 (= (readBitPure!0 lt!393172) (tuple2!21749 (_2!11808 lt!393386) (_1!11808 lt!393386)))))

(declare-fun bs!21422 () Bool)

(assert (= bs!21422 d!84560))

(declare-fun m!381113 () Bool)

(assert (=> bs!21422 m!381113))

(assert (=> d!84468 d!84560))

(assert (=> b!253027 d!84410))

(assert (=> b!253027 d!84424))

(declare-fun d!84562 () Bool)

(declare-fun res!212169 () Bool)

(declare-fun e!175428 () Bool)

(assert (=> d!84562 (=> (not res!212169) (not e!175428))))

(assert (=> d!84562 (= res!212169 (= (size!6029 (buf!6531 (_2!11800 lt!393106))) (size!6029 (buf!6531 (_2!11801 lt!392492)))))))

(assert (=> d!84562 (= (isPrefixOf!0 (_2!11800 lt!393106) (_2!11801 lt!392492)) e!175428)))

(declare-fun b!253197 () Bool)

(declare-fun res!212170 () Bool)

(assert (=> b!253197 (=> (not res!212170) (not e!175428))))

(assert (=> b!253197 (= res!212170 (bvsle (bitIndex!0 (size!6029 (buf!6531 (_2!11800 lt!393106))) (currentByte!11986 (_2!11800 lt!393106)) (currentBit!11981 (_2!11800 lt!393106))) (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392492))) (currentByte!11986 (_2!11801 lt!392492)) (currentBit!11981 (_2!11801 lt!392492)))))))

(declare-fun b!253198 () Bool)

(declare-fun e!175427 () Bool)

(assert (=> b!253198 (= e!175428 e!175427)))

(declare-fun res!212171 () Bool)

(assert (=> b!253198 (=> res!212171 e!175427)))

(assert (=> b!253198 (= res!212171 (= (size!6029 (buf!6531 (_2!11800 lt!393106))) #b00000000000000000000000000000000))))

(declare-fun b!253199 () Bool)

(assert (=> b!253199 (= e!175427 (arrayBitRangesEq!0 (buf!6531 (_2!11800 lt!393106)) (buf!6531 (_2!11801 lt!392492)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 (_2!11800 lt!393106))) (currentByte!11986 (_2!11800 lt!393106)) (currentBit!11981 (_2!11800 lt!393106)))))))

(assert (= (and d!84562 res!212169) b!253197))

(assert (= (and b!253197 res!212170) b!253198))

(assert (= (and b!253198 (not res!212171)) b!253199))

(assert (=> b!253197 m!381045))

(assert (=> b!253197 m!380285))

(assert (=> b!253199 m!381045))

(assert (=> b!253199 m!381045))

(declare-fun m!381115 () Bool)

(assert (=> b!253199 m!381115))

(assert (=> b!253010 d!84562))

(declare-fun d!84564 () Bool)

(declare-fun res!212172 () Bool)

(declare-fun e!175430 () Bool)

(assert (=> d!84564 (=> (not res!212172) (not e!175430))))

(assert (=> d!84564 (= res!212172 (= (size!6029 (buf!6531 (_2!11800 lt!393074))) (size!6029 (buf!6531 (_2!11801 lt!392492)))))))

(assert (=> d!84564 (= (isPrefixOf!0 (_2!11800 lt!393074) (_2!11801 lt!392492)) e!175430)))

(declare-fun b!253200 () Bool)

(declare-fun res!212173 () Bool)

(assert (=> b!253200 (=> (not res!212173) (not e!175430))))

(assert (=> b!253200 (= res!212173 (bvsle (bitIndex!0 (size!6029 (buf!6531 (_2!11800 lt!393074))) (currentByte!11986 (_2!11800 lt!393074)) (currentBit!11981 (_2!11800 lt!393074))) (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392492))) (currentByte!11986 (_2!11801 lt!392492)) (currentBit!11981 (_2!11801 lt!392492)))))))

(declare-fun b!253201 () Bool)

(declare-fun e!175429 () Bool)

(assert (=> b!253201 (= e!175430 e!175429)))

(declare-fun res!212174 () Bool)

(assert (=> b!253201 (=> res!212174 e!175429)))

(assert (=> b!253201 (= res!212174 (= (size!6029 (buf!6531 (_2!11800 lt!393074))) #b00000000000000000000000000000000))))

(declare-fun b!253202 () Bool)

(assert (=> b!253202 (= e!175429 (arrayBitRangesEq!0 (buf!6531 (_2!11800 lt!393074)) (buf!6531 (_2!11801 lt!392492)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 (_2!11800 lt!393074))) (currentByte!11986 (_2!11800 lt!393074)) (currentBit!11981 (_2!11800 lt!393074)))))))

(assert (= (and d!84564 res!212172) b!253200))

(assert (= (and b!253200 res!212173) b!253201))

(assert (= (and b!253201 (not res!212174)) b!253202))

(assert (=> b!253200 m!380965))

(assert (=> b!253200 m!380285))

(assert (=> b!253202 m!380965))

(assert (=> b!253202 m!380965))

(declare-fun m!381117 () Bool)

(assert (=> b!253202 m!381117))

(assert (=> b!252988 d!84564))

(assert (=> d!84420 d!84418))

(declare-fun d!84566 () Bool)

(assert (=> d!84566 (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494))) lt!392496)))

(assert (=> d!84566 true))

(declare-fun _$6!418 () Unit!18206)

(assert (=> d!84566 (= (choose!9 (_2!11801 lt!392494) (buf!6531 (_2!11801 lt!392492)) lt!392496 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494)))) _$6!418)))

(declare-fun bs!21423 () Bool)

(assert (= bs!21423 d!84566))

(assert (=> bs!21423 m!380279))

(assert (=> d!84420 d!84566))

(declare-fun d!84568 () Bool)

(declare-fun e!175431 () Bool)

(assert (=> d!84568 e!175431))

(declare-fun res!212175 () Bool)

(assert (=> d!84568 (=> (not res!212175) (not e!175431))))

(declare-fun lt!393388 () (_ BitVec 64))

(declare-fun lt!393387 () BitStream!10980)

(assert (=> d!84568 (= res!212175 (= (bvadd lt!393388 (bvsub lt!393068 lt!393072)) (bitIndex!0 (size!6029 (buf!6531 lt!393387)) (currentByte!11986 lt!393387) (currentBit!11981 lt!393387))))))

(assert (=> d!84568 (or (not (= (bvand lt!393388 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393068 lt!393072) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393388 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393388 (bvsub lt!393068 lt!393072)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84568 (= lt!393388 (bitIndex!0 (size!6029 (buf!6531 (_2!11800 lt!393074))) (currentByte!11986 (_2!11800 lt!393074)) (currentBit!11981 (_2!11800 lt!393074))))))

(assert (=> d!84568 (= lt!393387 (_2!11801 (moveBitIndex!0 (_2!11800 lt!393074) (bvsub lt!393068 lt!393072))))))

(assert (=> d!84568 (moveBitIndexPrecond!0 (_2!11800 lt!393074) (bvsub lt!393068 lt!393072))))

(assert (=> d!84568 (= (withMovedBitIndex!0 (_2!11800 lt!393074) (bvsub lt!393068 lt!393072)) lt!393387)))

(declare-fun b!253203 () Bool)

(assert (=> b!253203 (= e!175431 (= (size!6029 (buf!6531 (_2!11800 lt!393074))) (size!6029 (buf!6531 lt!393387))))))

(assert (= (and d!84568 res!212175) b!253203))

(declare-fun m!381119 () Bool)

(assert (=> d!84568 m!381119))

(assert (=> d!84568 m!380965))

(declare-fun m!381121 () Bool)

(assert (=> d!84568 m!381121))

(declare-fun m!381123 () Bool)

(assert (=> d!84568 m!381123))

(assert (=> b!252986 d!84568))

(assert (=> b!252986 d!84424))

(assert (=> b!252986 d!84408))

(declare-fun d!84570 () Bool)

(assert (=> d!84570 (= (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494)))) (bvsub (bvmul ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494))))))))

(assert (=> d!84450 d!84570))

(assert (=> d!84440 d!84450))

(declare-fun d!84572 () Bool)

(assert (=> d!84572 (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494))) lt!392491)))

(assert (=> d!84572 true))

(declare-fun _$6!419 () Unit!18206)

(assert (=> d!84572 (= (choose!9 (_2!11801 lt!392494) (buf!6531 (_2!11801 lt!392492)) lt!392491 (BitStream!10981 (buf!6531 (_2!11801 lt!392492)) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494)))) _$6!419)))

(declare-fun bs!21424 () Bool)

(assert (= bs!21424 d!84572))

(assert (=> bs!21424 m!380327))

(assert (=> d!84440 d!84572))

(assert (=> d!84466 d!84448))

(declare-fun d!84574 () Bool)

(assert (=> d!84574 (isPrefixOf!0 thiss!1005 (_2!11801 lt!392492))))

(assert (=> d!84574 true))

(declare-fun _$15!324 () Unit!18206)

(assert (=> d!84574 (= (choose!30 thiss!1005 (_2!11801 lt!392494) (_2!11801 lt!392492)) _$15!324)))

(declare-fun bs!21425 () Bool)

(assert (= bs!21425 d!84574))

(assert (=> bs!21425 m!380329))

(assert (=> d!84466 d!84574))

(assert (=> d!84466 d!84426))

(assert (=> b!252964 d!84406))

(declare-fun d!84576 () Bool)

(declare-fun e!175432 () Bool)

(assert (=> d!84576 e!175432))

(declare-fun res!212176 () Bool)

(assert (=> d!84576 (=> (not res!212176) (not e!175432))))

(assert (=> d!84576 (= res!212176 (= (buf!6531 (_2!11801 (increaseBitIndex!0 lt!392497))) (buf!6531 lt!392497)))))

(declare-fun lt!393389 () Bool)

(assert (=> d!84576 (= lt!393389 (not (= (bvand ((_ sign_extend 24) (select (arr!7016 (buf!6531 lt!392497)) (currentByte!11986 lt!392497))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11981 lt!392497)))) #b00000000000000000000000000000000)))))

(declare-fun lt!393391 () tuple2!21760)

(assert (=> d!84576 (= lt!393391 (tuple2!21761 (not (= (bvand ((_ sign_extend 24) (select (arr!7016 (buf!6531 lt!392497)) (currentByte!11986 lt!392497))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11981 lt!392497)))) #b00000000000000000000000000000000)) (_2!11801 (increaseBitIndex!0 lt!392497))))))

(assert (=> d!84576 (validate_offset_bit!0 ((_ sign_extend 32) (size!6029 (buf!6531 lt!392497))) ((_ sign_extend 32) (currentByte!11986 lt!392497)) ((_ sign_extend 32) (currentBit!11981 lt!392497)))))

(assert (=> d!84576 (= (readBit!0 lt!392497) lt!393391)))

(declare-fun b!253204 () Bool)

(declare-fun lt!393392 () (_ BitVec 64))

(declare-fun lt!393390 () (_ BitVec 64))

(assert (=> b!253204 (= e!175432 (= (bitIndex!0 (size!6029 (buf!6531 (_2!11801 (increaseBitIndex!0 lt!392497)))) (currentByte!11986 (_2!11801 (increaseBitIndex!0 lt!392497))) (currentBit!11981 (_2!11801 (increaseBitIndex!0 lt!392497)))) (bvadd lt!393390 lt!393392)))))

(assert (=> b!253204 (or (not (= (bvand lt!393390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393392 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393390 lt!393392) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253204 (= lt!393392 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253204 (= lt!393390 (bitIndex!0 (size!6029 (buf!6531 lt!392497)) (currentByte!11986 lt!392497) (currentBit!11981 lt!392497)))))

(declare-fun lt!393393 () Bool)

(assert (=> b!253204 (= lt!393393 (not (= (bvand ((_ sign_extend 24) (select (arr!7016 (buf!6531 lt!392497)) (currentByte!11986 lt!392497))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11981 lt!392497)))) #b00000000000000000000000000000000)))))

(declare-fun lt!393394 () Bool)

(assert (=> b!253204 (= lt!393394 (not (= (bvand ((_ sign_extend 24) (select (arr!7016 (buf!6531 lt!392497)) (currentByte!11986 lt!392497))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11981 lt!392497)))) #b00000000000000000000000000000000)))))

(declare-fun lt!393395 () Bool)

(assert (=> b!253204 (= lt!393395 (not (= (bvand ((_ sign_extend 24) (select (arr!7016 (buf!6531 lt!392497)) (currentByte!11986 lt!392497))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11981 lt!392497)))) #b00000000000000000000000000000000)))))

(assert (= (and d!84576 res!212176) b!253204))

(declare-fun m!381125 () Bool)

(assert (=> d!84576 m!381125))

(declare-fun m!381127 () Bool)

(assert (=> d!84576 m!381127))

(declare-fun m!381129 () Bool)

(assert (=> d!84576 m!381129))

(declare-fun m!381131 () Bool)

(assert (=> d!84576 m!381131))

(assert (=> b!253204 m!381129))

(assert (=> b!253204 m!381125))

(declare-fun m!381133 () Bool)

(assert (=> b!253204 m!381133))

(declare-fun m!381135 () Bool)

(assert (=> b!253204 m!381135))

(assert (=> b!253204 m!381127))

(assert (=> d!84456 d!84576))

(declare-fun d!84578 () Bool)

(assert (=> d!84578 (isPrefixOf!0 lt!393092 lt!393092)))

(declare-fun lt!393396 () Unit!18206)

(assert (=> d!84578 (= lt!393396 (choose!11 lt!393092))))

(assert (=> d!84578 (= (lemmaIsPrefixRefl!0 lt!393092) lt!393396)))

(declare-fun bs!21426 () Bool)

(assert (= bs!21426 d!84578))

(assert (=> bs!21426 m!380807))

(declare-fun m!381137 () Bool)

(assert (=> bs!21426 m!381137))

(assert (=> d!84438 d!84578))

(declare-fun d!84580 () Bool)

(declare-fun res!212177 () Bool)

(declare-fun e!175434 () Bool)

(assert (=> d!84580 (=> (not res!212177) (not e!175434))))

(assert (=> d!84580 (= res!212177 (= (size!6029 (buf!6531 thiss!1005)) (size!6029 (buf!6531 thiss!1005))))))

(assert (=> d!84580 (= (isPrefixOf!0 thiss!1005 thiss!1005) e!175434)))

(declare-fun b!253205 () Bool)

(declare-fun res!212178 () Bool)

(assert (=> b!253205 (=> (not res!212178) (not e!175434))))

(assert (=> b!253205 (= res!212178 (bvsle (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)) (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))))))

(declare-fun b!253206 () Bool)

(declare-fun e!175433 () Bool)

(assert (=> b!253206 (= e!175434 e!175433)))

(declare-fun res!212179 () Bool)

(assert (=> b!253206 (=> res!212179 e!175433)))

(assert (=> b!253206 (= res!212179 (= (size!6029 (buf!6531 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!253207 () Bool)

(assert (=> b!253207 (= e!175433 (arrayBitRangesEq!0 (buf!6531 thiss!1005) (buf!6531 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))))))

(assert (= (and d!84580 res!212177) b!253205))

(assert (= (and b!253205 res!212178) b!253206))

(assert (= (and b!253206 (not res!212179)) b!253207))

(assert (=> b!253205 m!380271))

(assert (=> b!253205 m!380271))

(assert (=> b!253207 m!380271))

(assert (=> b!253207 m!380271))

(declare-fun m!381139 () Bool)

(assert (=> b!253207 m!381139))

(assert (=> d!84438 d!84580))

(declare-fun d!84582 () Bool)

(declare-fun res!212180 () Bool)

(declare-fun e!175436 () Bool)

(assert (=> d!84582 (=> (not res!212180) (not e!175436))))

(assert (=> d!84582 (= res!212180 (= (size!6029 (buf!6531 lt!393092)) (size!6029 (buf!6531 (_2!11801 lt!392492)))))))

(assert (=> d!84582 (= (isPrefixOf!0 lt!393092 (_2!11801 lt!392492)) e!175436)))

(declare-fun b!253208 () Bool)

(declare-fun res!212181 () Bool)

(assert (=> b!253208 (=> (not res!212181) (not e!175436))))

(assert (=> b!253208 (= res!212181 (bvsle (bitIndex!0 (size!6029 (buf!6531 lt!393092)) (currentByte!11986 lt!393092) (currentBit!11981 lt!393092)) (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392492))) (currentByte!11986 (_2!11801 lt!392492)) (currentBit!11981 (_2!11801 lt!392492)))))))

(declare-fun b!253209 () Bool)

(declare-fun e!175435 () Bool)

(assert (=> b!253209 (= e!175436 e!175435)))

(declare-fun res!212182 () Bool)

(assert (=> b!253209 (=> res!212182 e!175435)))

(assert (=> b!253209 (= res!212182 (= (size!6029 (buf!6531 lt!393092)) #b00000000000000000000000000000000))))

(declare-fun b!253210 () Bool)

(assert (=> b!253210 (= e!175435 (arrayBitRangesEq!0 (buf!6531 lt!393092) (buf!6531 (_2!11801 lt!392492)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 lt!393092)) (currentByte!11986 lt!393092) (currentBit!11981 lt!393092))))))

(assert (= (and d!84582 res!212180) b!253208))

(assert (= (and b!253208 res!212181) b!253209))

(assert (= (and b!253209 (not res!212182)) b!253210))

(declare-fun m!381141 () Bool)

(assert (=> b!253208 m!381141))

(assert (=> b!253208 m!380285))

(assert (=> b!253210 m!381141))

(assert (=> b!253210 m!381141))

(declare-fun m!381143 () Bool)

(assert (=> b!253210 m!381143))

(assert (=> d!84438 d!84582))

(declare-fun d!84584 () Bool)

(declare-fun res!212183 () Bool)

(declare-fun e!175438 () Bool)

(assert (=> d!84584 (=> (not res!212183) (not e!175438))))

(assert (=> d!84584 (= res!212183 (= (size!6029 (buf!6531 lt!393092)) (size!6029 (buf!6531 lt!393092))))))

(assert (=> d!84584 (= (isPrefixOf!0 lt!393092 lt!393092) e!175438)))

(declare-fun b!253211 () Bool)

(declare-fun res!212184 () Bool)

(assert (=> b!253211 (=> (not res!212184) (not e!175438))))

(assert (=> b!253211 (= res!212184 (bvsle (bitIndex!0 (size!6029 (buf!6531 lt!393092)) (currentByte!11986 lt!393092) (currentBit!11981 lt!393092)) (bitIndex!0 (size!6029 (buf!6531 lt!393092)) (currentByte!11986 lt!393092) (currentBit!11981 lt!393092))))))

(declare-fun b!253212 () Bool)

(declare-fun e!175437 () Bool)

(assert (=> b!253212 (= e!175438 e!175437)))

(declare-fun res!212185 () Bool)

(assert (=> b!253212 (=> res!212185 e!175437)))

(assert (=> b!253212 (= res!212185 (= (size!6029 (buf!6531 lt!393092)) #b00000000000000000000000000000000))))

(declare-fun b!253213 () Bool)

(assert (=> b!253213 (= e!175437 (arrayBitRangesEq!0 (buf!6531 lt!393092) (buf!6531 lt!393092) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 lt!393092)) (currentByte!11986 lt!393092) (currentBit!11981 lt!393092))))))

(assert (= (and d!84584 res!212183) b!253211))

(assert (= (and b!253211 res!212184) b!253212))

(assert (= (and b!253212 (not res!212185)) b!253213))

(assert (=> b!253211 m!381141))

(assert (=> b!253211 m!381141))

(assert (=> b!253213 m!381141))

(assert (=> b!253213 m!381141))

(declare-fun m!381145 () Bool)

(assert (=> b!253213 m!381145))

(assert (=> d!84438 d!84584))

(assert (=> d!84438 d!84448))

(assert (=> d!84438 d!84496))

(declare-fun d!84586 () Bool)

(declare-fun res!212186 () Bool)

(declare-fun e!175440 () Bool)

(assert (=> d!84586 (=> (not res!212186) (not e!175440))))

(assert (=> d!84586 (= res!212186 (= (size!6029 (buf!6531 (_1!11800 lt!393106))) (size!6029 (buf!6531 (_2!11800 lt!393106)))))))

(assert (=> d!84586 (= (isPrefixOf!0 (_1!11800 lt!393106) (_2!11800 lt!393106)) e!175440)))

(declare-fun b!253214 () Bool)

(declare-fun res!212187 () Bool)

(assert (=> b!253214 (=> (not res!212187) (not e!175440))))

(assert (=> b!253214 (= res!212187 (bvsle (bitIndex!0 (size!6029 (buf!6531 (_1!11800 lt!393106))) (currentByte!11986 (_1!11800 lt!393106)) (currentBit!11981 (_1!11800 lt!393106))) (bitIndex!0 (size!6029 (buf!6531 (_2!11800 lt!393106))) (currentByte!11986 (_2!11800 lt!393106)) (currentBit!11981 (_2!11800 lt!393106)))))))

(declare-fun b!253215 () Bool)

(declare-fun e!175439 () Bool)

(assert (=> b!253215 (= e!175440 e!175439)))

(declare-fun res!212188 () Bool)

(assert (=> b!253215 (=> res!212188 e!175439)))

(assert (=> b!253215 (= res!212188 (= (size!6029 (buf!6531 (_1!11800 lt!393106))) #b00000000000000000000000000000000))))

(declare-fun b!253216 () Bool)

(assert (=> b!253216 (= e!175439 (arrayBitRangesEq!0 (buf!6531 (_1!11800 lt!393106)) (buf!6531 (_2!11800 lt!393106)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 (_1!11800 lt!393106))) (currentByte!11986 (_1!11800 lt!393106)) (currentBit!11981 (_1!11800 lt!393106)))))))

(assert (= (and d!84586 res!212186) b!253214))

(assert (= (and b!253214 res!212187) b!253215))

(assert (= (and b!253215 (not res!212188)) b!253216))

(declare-fun m!381147 () Bool)

(assert (=> b!253214 m!381147))

(assert (=> b!253214 m!381045))

(assert (=> b!253216 m!381147))

(assert (=> b!253216 m!381147))

(declare-fun m!381149 () Bool)

(assert (=> b!253216 m!381149))

(assert (=> d!84438 d!84586))

(assert (=> d!84438 d!84500))

(declare-fun d!84588 () Bool)

(assert (=> d!84588 (isPrefixOf!0 lt!393092 (_2!11801 lt!392492))))

(declare-fun lt!393397 () Unit!18206)

(assert (=> d!84588 (= lt!393397 (choose!30 lt!393092 thiss!1005 (_2!11801 lt!392492)))))

(assert (=> d!84588 (isPrefixOf!0 lt!393092 thiss!1005)))

(assert (=> d!84588 (= (lemmaIsPrefixTransitive!0 lt!393092 thiss!1005 (_2!11801 lt!392492)) lt!393397)))

(declare-fun bs!21427 () Bool)

(assert (= bs!21427 d!84588))

(assert (=> bs!21427 m!380813))

(declare-fun m!381151 () Bool)

(assert (=> bs!21427 m!381151))

(declare-fun m!381153 () Bool)

(assert (=> bs!21427 m!381153))

(assert (=> d!84438 d!84588))

(declare-fun d!84590 () Bool)

(assert (=> d!84590 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-fun lt!393398 () Unit!18206)

(assert (=> d!84590 (= lt!393398 (choose!11 thiss!1005))))

(assert (=> d!84590 (= (lemmaIsPrefixRefl!0 thiss!1005) lt!393398)))

(declare-fun bs!21428 () Bool)

(assert (= bs!21428 d!84590))

(assert (=> bs!21428 m!380817))

(declare-fun m!381155 () Bool)

(assert (=> bs!21428 m!381155))

(assert (=> d!84438 d!84590))

(declare-fun d!84592 () Bool)

(assert (=> d!84592 (isPrefixOf!0 lt!393092 (_2!11801 lt!392492))))

(declare-fun lt!393399 () Unit!18206)

(assert (=> d!84592 (= lt!393399 (choose!30 lt!393092 (_2!11801 lt!392492) (_2!11801 lt!392492)))))

(assert (=> d!84592 (isPrefixOf!0 lt!393092 (_2!11801 lt!392492))))

(assert (=> d!84592 (= (lemmaIsPrefixTransitive!0 lt!393092 (_2!11801 lt!392492) (_2!11801 lt!392492)) lt!393399)))

(declare-fun bs!21429 () Bool)

(assert (= bs!21429 d!84592))

(assert (=> bs!21429 m!380813))

(declare-fun m!381157 () Bool)

(assert (=> bs!21429 m!381157))

(assert (=> bs!21429 m!380813))

(assert (=> d!84438 d!84592))

(assert (=> d!84418 d!84570))

(declare-fun d!84594 () Bool)

(declare-fun e!175441 () Bool)

(assert (=> d!84594 e!175441))

(declare-fun res!212189 () Bool)

(assert (=> d!84594 (=> (not res!212189) (not e!175441))))

(assert (=> d!84594 (= res!212189 (= (buf!6531 (_2!11801 (increaseBitIndex!0 (_1!11800 lt!392483)))) (buf!6531 (_1!11800 lt!392483))))))

(declare-fun lt!393400 () Bool)

(assert (=> d!84594 (= lt!393400 (not (= (bvand ((_ sign_extend 24) (select (arr!7016 (buf!6531 (_1!11800 lt!392483))) (currentByte!11986 (_1!11800 lt!392483)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11981 (_1!11800 lt!392483))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393402 () tuple2!21760)

(assert (=> d!84594 (= lt!393402 (tuple2!21761 (not (= (bvand ((_ sign_extend 24) (select (arr!7016 (buf!6531 (_1!11800 lt!392483))) (currentByte!11986 (_1!11800 lt!392483)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11981 (_1!11800 lt!392483))))) #b00000000000000000000000000000000)) (_2!11801 (increaseBitIndex!0 (_1!11800 lt!392483)))))))

(assert (=> d!84594 (validate_offset_bit!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11800 lt!392483)))) ((_ sign_extend 32) (currentByte!11986 (_1!11800 lt!392483))) ((_ sign_extend 32) (currentBit!11981 (_1!11800 lt!392483))))))

(assert (=> d!84594 (= (readBit!0 (_1!11800 lt!392483)) lt!393402)))

(declare-fun b!253217 () Bool)

(declare-fun lt!393403 () (_ BitVec 64))

(declare-fun lt!393401 () (_ BitVec 64))

(assert (=> b!253217 (= e!175441 (= (bitIndex!0 (size!6029 (buf!6531 (_2!11801 (increaseBitIndex!0 (_1!11800 lt!392483))))) (currentByte!11986 (_2!11801 (increaseBitIndex!0 (_1!11800 lt!392483)))) (currentBit!11981 (_2!11801 (increaseBitIndex!0 (_1!11800 lt!392483))))) (bvadd lt!393401 lt!393403)))))

(assert (=> b!253217 (or (not (= (bvand lt!393401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393403 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393401 lt!393403) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253217 (= lt!393403 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253217 (= lt!393401 (bitIndex!0 (size!6029 (buf!6531 (_1!11800 lt!392483))) (currentByte!11986 (_1!11800 lt!392483)) (currentBit!11981 (_1!11800 lt!392483))))))

(declare-fun lt!393404 () Bool)

(assert (=> b!253217 (= lt!393404 (not (= (bvand ((_ sign_extend 24) (select (arr!7016 (buf!6531 (_1!11800 lt!392483))) (currentByte!11986 (_1!11800 lt!392483)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11981 (_1!11800 lt!392483))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393405 () Bool)

(assert (=> b!253217 (= lt!393405 (not (= (bvand ((_ sign_extend 24) (select (arr!7016 (buf!6531 (_1!11800 lt!392483))) (currentByte!11986 (_1!11800 lt!392483)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11981 (_1!11800 lt!392483))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393406 () Bool)

(assert (=> b!253217 (= lt!393406 (not (= (bvand ((_ sign_extend 24) (select (arr!7016 (buf!6531 (_1!11800 lt!392483))) (currentByte!11986 (_1!11800 lt!392483)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11981 (_1!11800 lt!392483))))) #b00000000000000000000000000000000)))))

(assert (= (and d!84594 res!212189) b!253217))

(declare-fun m!381159 () Bool)

(assert (=> d!84594 m!381159))

(declare-fun m!381161 () Bool)

(assert (=> d!84594 m!381161))

(declare-fun m!381163 () Bool)

(assert (=> d!84594 m!381163))

(declare-fun m!381165 () Bool)

(assert (=> d!84594 m!381165))

(assert (=> b!253217 m!381163))

(assert (=> b!253217 m!381159))

(declare-fun m!381167 () Bool)

(assert (=> b!253217 m!381167))

(assert (=> b!253217 m!380795))

(assert (=> b!253217 m!381161))

(assert (=> d!84460 d!84594))

(assert (=> b!253039 d!84520))

(assert (=> b!253039 d!84410))

(assert (=> b!253004 d!84408))

(assert (=> b!253004 d!84424))

(declare-fun b!253218 () Bool)

(declare-fun e!175445 () Bool)

(assert (=> b!253218 (= e!175445 (= bit!26 (_2!11802 (readBitPure!0 (_1!11800 lt!392498)))))))

(declare-fun b!253219 () Bool)

(declare-fun e!175442 () Bool)

(assert (=> b!253219 (= e!175442 e!175445)))

(declare-fun res!212194 () Bool)

(assert (=> b!253219 (=> res!212194 e!175445)))

(declare-fun lt!393416 () tuple2!21760)

(assert (=> b!253219 (= res!212194 (or (not (_1!11808 lt!393416)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297)))))

(declare-fun b!253220 () Bool)

(declare-fun e!175444 () tuple2!21760)

(declare-fun e!175446 () tuple2!21760)

(assert (=> b!253220 (= e!175444 e!175446)))

(declare-fun lt!393409 () tuple2!21760)

(assert (=> b!253220 (= lt!393409 (readBit!0 (_1!11800 lt!392498)))))

(declare-fun c!11652 () Bool)

(assert (=> b!253220 (= c!11652 (not (= (_1!11808 lt!393409) bit!26)))))

(declare-fun b!253222 () Bool)

(declare-fun res!212192 () Bool)

(assert (=> b!253222 (=> (not res!212192) (not e!175442))))

(declare-fun e!175443 () Bool)

(assert (=> b!253222 (= res!212192 e!175443)))

(declare-fun res!212190 () Bool)

(assert (=> b!253222 (=> res!212190 e!175443)))

(assert (=> b!253222 (= res!212190 (not (_1!11808 lt!393416)))))

(declare-fun b!253223 () Bool)

(assert (=> b!253223 (= e!175444 (tuple2!21761 true (_1!11800 lt!392498)))))

(declare-fun b!253224 () Bool)

(assert (=> b!253224 (= e!175446 (tuple2!21761 false (_2!11808 lt!393409)))))

(declare-fun b!253225 () Bool)

(declare-fun lt!393407 () tuple2!21760)

(assert (=> b!253225 (= lt!393407 (checkBitsLoop!0 (_2!11808 lt!393409) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!393412 () Unit!18206)

(declare-fun lt!393410 () Unit!18206)

(assert (=> b!253225 (= lt!393412 lt!393410)))

(declare-fun lt!393417 () (_ BitVec 64))

(declare-fun lt!393411 () (_ BitVec 64))

(assert (=> b!253225 (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11808 lt!393409)))) ((_ sign_extend 32) (currentByte!11986 (_2!11808 lt!393409))) ((_ sign_extend 32) (currentBit!11981 (_2!11808 lt!393409))) (bvsub lt!393417 lt!393411))))

(assert (=> b!253225 (= lt!393410 (validateOffsetBitsIneqLemma!0 (_1!11800 lt!392498) (_2!11808 lt!393409) lt!393417 lt!393411))))

(assert (=> b!253225 (= lt!393411 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253225 (= lt!393417 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!253225 (= e!175446 (tuple2!21761 (_1!11808 lt!393407) (_2!11808 lt!393407)))))

(declare-fun b!253226 () Bool)

(declare-fun lt!393414 () (_ BitVec 64))

(assert (=> b!253226 (= e!175443 (= (bvsub lt!393414 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6029 (buf!6531 (_2!11808 lt!393416))) (currentByte!11986 (_2!11808 lt!393416)) (currentBit!11981 (_2!11808 lt!393416)))))))

(assert (=> b!253226 (or (= (bvand lt!393414 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393414 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393414 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!393408 () (_ BitVec 64))

(assert (=> b!253226 (= lt!393414 (bvadd lt!393408 nBits!297))))

(assert (=> b!253226 (or (not (= (bvand lt!393408 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393408 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393408 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253226 (= lt!393408 (bitIndex!0 (size!6029 (buf!6531 (_1!11800 lt!392498))) (currentByte!11986 (_1!11800 lt!392498)) (currentBit!11981 (_1!11800 lt!392498))))))

(declare-fun b!253221 () Bool)

(declare-fun res!212193 () Bool)

(assert (=> b!253221 (=> (not res!212193) (not e!175442))))

(assert (=> b!253221 (= res!212193 (and (= (buf!6531 (_1!11800 lt!392498)) (buf!6531 (_2!11808 lt!393416))) (or (not (= nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_1!11808 lt!393416))))))

(declare-fun d!84596 () Bool)

(assert (=> d!84596 e!175442))

(declare-fun res!212191 () Bool)

(assert (=> d!84596 (=> (not res!212191) (not e!175442))))

(declare-fun lt!393415 () (_ BitVec 64))

(assert (=> d!84596 (= res!212191 (bvsge (bvsub lt!393415 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6029 (buf!6531 (_2!11808 lt!393416))) (currentByte!11986 (_2!11808 lt!393416)) (currentBit!11981 (_2!11808 lt!393416)))))))

(assert (=> d!84596 (or (= (bvand lt!393415 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393415 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393415 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!393413 () (_ BitVec 64))

(assert (=> d!84596 (= lt!393415 (bvadd lt!393413 nBits!297))))

(assert (=> d!84596 (or (not (= (bvand lt!393413 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393413 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393413 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84596 (= lt!393413 (bitIndex!0 (size!6029 (buf!6531 (_1!11800 lt!392498))) (currentByte!11986 (_1!11800 lt!392498)) (currentBit!11981 (_1!11800 lt!392498))))))

(assert (=> d!84596 (= lt!393416 e!175444)))

(declare-fun c!11653 () Bool)

(assert (=> d!84596 (= c!11653 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297))))

(assert (=> d!84596 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!84596 (= (checkBitsLoop!0 (_1!11800 lt!392498) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!393416)))

(assert (= (and d!84596 c!11653) b!253223))

(assert (= (and d!84596 (not c!11653)) b!253220))

(assert (= (and b!253220 c!11652) b!253224))

(assert (= (and b!253220 (not c!11652)) b!253225))

(assert (= (and d!84596 res!212191) b!253221))

(assert (= (and b!253221 res!212193) b!253222))

(assert (= (and b!253222 (not res!212190)) b!253226))

(assert (= (and b!253222 res!212192) b!253219))

(assert (= (and b!253219 (not res!212194)) b!253218))

(declare-fun m!381169 () Bool)

(assert (=> b!253226 m!381169))

(declare-fun m!381171 () Bool)

(assert (=> b!253226 m!381171))

(declare-fun m!381173 () Bool)

(assert (=> b!253225 m!381173))

(declare-fun m!381175 () Bool)

(assert (=> b!253225 m!381175))

(declare-fun m!381177 () Bool)

(assert (=> b!253225 m!381177))

(declare-fun m!381179 () Bool)

(assert (=> b!253220 m!381179))

(assert (=> d!84596 m!381169))

(assert (=> d!84596 m!381171))

(declare-fun m!381181 () Bool)

(assert (=> b!253218 m!381181))

(assert (=> d!84470 d!84596))

(declare-fun d!84598 () Bool)

(assert (=> d!84598 (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392494)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!84598 true))

(declare-fun _$1!327 () Unit!18206)

(assert (=> d!84598 (= (choose!27 thiss!1005 (_2!11801 lt!392494) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) _$1!327)))

(declare-fun bs!21430 () Bool)

(assert (= bs!21430 d!84598))

(assert (=> bs!21430 m!380835))

(assert (=> d!84442 d!84598))

(declare-fun d!84600 () Bool)

(assert (=> d!84600 (= (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 thiss!1005))) ((_ sign_extend 32) (currentByte!11986 thiss!1005)) ((_ sign_extend 32) (currentBit!11981 thiss!1005))) (bvsub (bvmul ((_ sign_extend 32) (size!6029 (buf!6531 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11986 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11981 thiss!1005)))))))

(assert (=> d!84474 d!84600))

(declare-fun d!84602 () Bool)

(declare-fun lt!393418 () tuple2!21760)

(assert (=> d!84602 (= lt!393418 (readBit!0 (readerFrom!0 (_2!11801 lt!393147) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005))))))

(assert (=> d!84602 (= (readBitPure!0 (readerFrom!0 (_2!11801 lt!393147) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005))) (tuple2!21749 (_2!11808 lt!393418) (_1!11808 lt!393418)))))

(declare-fun bs!21431 () Bool)

(assert (= bs!21431 d!84602))

(assert (=> bs!21431 m!380861))

(declare-fun m!381183 () Bool)

(assert (=> bs!21431 m!381183))

(assert (=> b!253041 d!84602))

(declare-fun d!84604 () Bool)

(declare-fun e!175447 () Bool)

(assert (=> d!84604 e!175447))

(declare-fun res!212195 () Bool)

(assert (=> d!84604 (=> (not res!212195) (not e!175447))))

(assert (=> d!84604 (= res!212195 (invariant!0 (currentBit!11981 (_2!11801 lt!393147)) (currentByte!11986 (_2!11801 lt!393147)) (size!6029 (buf!6531 (_2!11801 lt!393147)))))))

(assert (=> d!84604 (= (readerFrom!0 (_2!11801 lt!393147) (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005)) (BitStream!10981 (buf!6531 (_2!11801 lt!393147)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005)))))

(declare-fun b!253227 () Bool)

(assert (=> b!253227 (= e!175447 (invariant!0 (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005) (size!6029 (buf!6531 (_2!11801 lt!393147)))))))

(assert (= (and d!84604 res!212195) b!253227))

(assert (=> d!84604 m!381009))

(declare-fun m!381185 () Bool)

(assert (=> b!253227 m!381185))

(assert (=> b!253041 d!84604))

(declare-fun b!253228 () Bool)

(declare-fun e!175453 () Bool)

(declare-fun call!3971 () Bool)

(assert (=> b!253228 (= e!175453 call!3971)))

(declare-fun lt!393420 () (_ BitVec 32))

(declare-fun e!175451 () Bool)

(declare-fun b!253229 () Bool)

(declare-fun lt!393419 () tuple4!296)

(assert (=> b!253229 (= e!175451 (byteRangesEq!0 (select (arr!7016 (buf!6531 (_2!11801 lt!392494))) (_4!148 lt!393419)) (select (arr!7016 (buf!6531 (_2!11801 lt!392492))) (_4!148 lt!393419)) #b00000000000000000000000000000000 lt!393420))))

(declare-fun bm!3968 () Bool)

(declare-fun c!11654 () Bool)

(declare-fun lt!393421 () (_ BitVec 32))

(assert (=> bm!3968 (= call!3971 (byteRangesEq!0 (select (arr!7016 (buf!6531 (_2!11801 lt!392494))) (_3!928 lt!393419)) (select (arr!7016 (buf!6531 (_2!11801 lt!392492))) (_3!928 lt!393419)) lt!393421 (ite c!11654 lt!393420 #b00000000000000000000000000001000)))))

(declare-fun b!253230 () Bool)

(declare-fun e!175452 () Bool)

(declare-fun e!175450 () Bool)

(assert (=> b!253230 (= e!175452 e!175450)))

(declare-fun res!212199 () Bool)

(assert (=> b!253230 (=> (not res!212199) (not e!175450))))

(declare-fun e!175449 () Bool)

(assert (=> b!253230 (= res!212199 e!175449)))

(declare-fun res!212200 () Bool)

(assert (=> b!253230 (=> res!212200 e!175449)))

(assert (=> b!253230 (= res!212200 (bvsge (_1!11809 lt!393419) (_2!11809 lt!393419)))))

(assert (=> b!253230 (= lt!393420 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392494))) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253230 (= lt!393421 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253230 (= lt!393419 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392494))) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494)))))))

(declare-fun b!253231 () Bool)

(declare-fun res!212196 () Bool)

(assert (=> b!253231 (= res!212196 (= lt!393420 #b00000000000000000000000000000000))))

(assert (=> b!253231 (=> res!212196 e!175451)))

(declare-fun e!175448 () Bool)

(assert (=> b!253231 (= e!175448 e!175451)))

(declare-fun b!253232 () Bool)

(assert (=> b!253232 (= e!175450 e!175453)))

(assert (=> b!253232 (= c!11654 (= (_3!928 lt!393419) (_4!148 lt!393419)))))

(declare-fun b!253233 () Bool)

(assert (=> b!253233 (= e!175449 (arrayRangesEq!925 (buf!6531 (_2!11801 lt!392494)) (buf!6531 (_2!11801 lt!392492)) (_1!11809 lt!393419) (_2!11809 lt!393419)))))

(declare-fun b!253234 () Bool)

(assert (=> b!253234 (= e!175453 e!175448)))

(declare-fun res!212198 () Bool)

(assert (=> b!253234 (= res!212198 call!3971)))

(assert (=> b!253234 (=> (not res!212198) (not e!175448))))

(declare-fun d!84606 () Bool)

(declare-fun res!212197 () Bool)

(assert (=> d!84606 (=> res!212197 e!175452)))

(assert (=> d!84606 (= res!212197 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392494))) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494)))))))

(assert (=> d!84606 (= (arrayBitRangesEq!0 (buf!6531 (_2!11801 lt!392494)) (buf!6531 (_2!11801 lt!392492)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392494))) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494)))) e!175452)))

(assert (= (and d!84606 (not res!212197)) b!253230))

(assert (= (and b!253230 (not res!212200)) b!253233))

(assert (= (and b!253230 res!212199) b!253232))

(assert (= (and b!253232 c!11654) b!253228))

(assert (= (and b!253232 (not c!11654)) b!253234))

(assert (= (and b!253234 res!212198) b!253231))

(assert (= (and b!253231 (not res!212196)) b!253229))

(assert (= (or b!253228 b!253234) bm!3968))

(declare-fun m!381187 () Bool)

(assert (=> b!253229 m!381187))

(declare-fun m!381189 () Bool)

(assert (=> b!253229 m!381189))

(assert (=> b!253229 m!381187))

(assert (=> b!253229 m!381189))

(declare-fun m!381191 () Bool)

(assert (=> b!253229 m!381191))

(declare-fun m!381193 () Bool)

(assert (=> bm!3968 m!381193))

(declare-fun m!381195 () Bool)

(assert (=> bm!3968 m!381195))

(assert (=> bm!3968 m!381193))

(assert (=> bm!3968 m!381195))

(declare-fun m!381197 () Bool)

(assert (=> bm!3968 m!381197))

(assert (=> b!253230 m!380269))

(declare-fun m!381199 () Bool)

(assert (=> b!253230 m!381199))

(declare-fun m!381201 () Bool)

(assert (=> b!253233 m!381201))

(assert (=> b!253006 d!84606))

(assert (=> b!253006 d!84408))

(declare-fun d!84608 () Bool)

(declare-fun res!212201 () Bool)

(declare-fun e!175455 () Bool)

(assert (=> d!84608 (=> (not res!212201) (not e!175455))))

(assert (=> d!84608 (= res!212201 (= (size!6029 (buf!6531 (_2!11801 lt!392494))) (size!6029 (buf!6531 (_2!11801 lt!393131)))))))

(assert (=> d!84608 (= (isPrefixOf!0 (_2!11801 lt!392494) (_2!11801 lt!393131)) e!175455)))

(declare-fun b!253235 () Bool)

(declare-fun res!212202 () Bool)

(assert (=> b!253235 (=> (not res!212202) (not e!175455))))

(assert (=> b!253235 (= res!212202 (bvsle (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392494))) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494))) (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!393131))) (currentByte!11986 (_2!11801 lt!393131)) (currentBit!11981 (_2!11801 lt!393131)))))))

(declare-fun b!253236 () Bool)

(declare-fun e!175454 () Bool)

(assert (=> b!253236 (= e!175455 e!175454)))

(declare-fun res!212203 () Bool)

(assert (=> b!253236 (=> res!212203 e!175454)))

(assert (=> b!253236 (= res!212203 (= (size!6029 (buf!6531 (_2!11801 lt!392494))) #b00000000000000000000000000000000))))

(declare-fun b!253237 () Bool)

(assert (=> b!253237 (= e!175454 (arrayBitRangesEq!0 (buf!6531 (_2!11801 lt!392494)) (buf!6531 (_2!11801 lt!393131)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392494))) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494)))))))

(assert (= (and d!84608 res!212201) b!253235))

(assert (= (and b!253235 res!212202) b!253236))

(assert (= (and b!253236 (not res!212203)) b!253237))

(assert (=> b!253235 m!380269))

(assert (=> b!253235 m!380841))

(assert (=> b!253237 m!380269))

(assert (=> b!253237 m!380269))

(declare-fun m!381203 () Bool)

(assert (=> b!253237 m!381203))

(assert (=> b!253024 d!84608))

(declare-fun d!84610 () Bool)

(assert (=> d!84610 (= (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392492))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392492)))) (bvsub (bvmul ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392492)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392492))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392492))))))))

(assert (=> d!84424 d!84610))

(declare-fun d!84612 () Bool)

(assert (=> d!84612 (= (invariant!0 (currentBit!11981 (_2!11801 lt!392492)) (currentByte!11986 (_2!11801 lt!392492)) (size!6029 (buf!6531 (_2!11801 lt!392492)))) (and (bvsge (currentBit!11981 (_2!11801 lt!392492)) #b00000000000000000000000000000000) (bvslt (currentBit!11981 (_2!11801 lt!392492)) #b00000000000000000000000000001000) (bvsge (currentByte!11986 (_2!11801 lt!392492)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11986 (_2!11801 lt!392492)) (size!6029 (buf!6531 (_2!11801 lt!392492)))) (and (= (currentBit!11981 (_2!11801 lt!392492)) #b00000000000000000000000000000000) (= (currentByte!11986 (_2!11801 lt!392492)) (size!6029 (buf!6531 (_2!11801 lt!392492))))))))))

(assert (=> d!84424 d!84612))

(assert (=> d!84462 d!84544))

(declare-fun d!84614 () Bool)

(declare-fun res!212204 () Bool)

(declare-fun e!175457 () Bool)

(assert (=> d!84614 (=> (not res!212204) (not e!175457))))

(assert (=> d!84614 (= res!212204 (= (size!6029 (buf!6531 (_1!11800 lt!393106))) (size!6029 (buf!6531 thiss!1005))))))

(assert (=> d!84614 (= (isPrefixOf!0 (_1!11800 lt!393106) thiss!1005) e!175457)))

(declare-fun b!253238 () Bool)

(declare-fun res!212205 () Bool)

(assert (=> b!253238 (=> (not res!212205) (not e!175457))))

(assert (=> b!253238 (= res!212205 (bvsle (bitIndex!0 (size!6029 (buf!6531 (_1!11800 lt!393106))) (currentByte!11986 (_1!11800 lt!393106)) (currentBit!11981 (_1!11800 lt!393106))) (bitIndex!0 (size!6029 (buf!6531 thiss!1005)) (currentByte!11986 thiss!1005) (currentBit!11981 thiss!1005))))))

(declare-fun b!253239 () Bool)

(declare-fun e!175456 () Bool)

(assert (=> b!253239 (= e!175457 e!175456)))

(declare-fun res!212206 () Bool)

(assert (=> b!253239 (=> res!212206 e!175456)))

(assert (=> b!253239 (= res!212206 (= (size!6029 (buf!6531 (_1!11800 lt!393106))) #b00000000000000000000000000000000))))

(declare-fun b!253240 () Bool)

(assert (=> b!253240 (= e!175456 (arrayBitRangesEq!0 (buf!6531 (_1!11800 lt!393106)) (buf!6531 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 (_1!11800 lt!393106))) (currentByte!11986 (_1!11800 lt!393106)) (currentBit!11981 (_1!11800 lt!393106)))))))

(assert (= (and d!84614 res!212204) b!253238))

(assert (= (and b!253238 res!212205) b!253239))

(assert (= (and b!253239 (not res!212206)) b!253240))

(assert (=> b!253238 m!381147))

(assert (=> b!253238 m!380271))

(assert (=> b!253240 m!381147))

(assert (=> b!253240 m!381147))

(declare-fun m!381205 () Bool)

(assert (=> b!253240 m!381205))

(assert (=> b!253009 d!84614))

(assert (=> d!84404 d!84546))

(declare-fun d!84616 () Bool)

(assert (=> d!84616 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392494)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494))) lt!393135) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_2!11801 lt!392494)))) ((_ sign_extend 32) (currentByte!11986 (_2!11801 lt!392494))) ((_ sign_extend 32) (currentBit!11981 (_2!11801 lt!392494)))) lt!393135))))

(declare-fun bs!21432 () Bool)

(assert (= bs!21432 d!84616))

(assert (=> bs!21432 m!380741))

(assert (=> b!253026 d!84616))

(declare-fun d!84618 () Bool)

(assert (=> d!84618 (= (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!392499)))) ((_ sign_extend 32) (currentByte!11986 (_1!11802 lt!392499))) ((_ sign_extend 32) (currentBit!11981 (_1!11802 lt!392499)))) (bvsub (bvmul ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!392499)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11986 (_1!11802 lt!392499))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11981 (_1!11802 lt!392499))))))))

(assert (=> d!84458 d!84618))

(declare-fun d!84620 () Bool)

(assert (=> d!84620 (= (invariant!0 (currentBit!11981 (_1!11802 lt!392499)) (currentByte!11986 (_1!11802 lt!392499)) (size!6029 (buf!6531 (_1!11802 lt!392499)))) (and (bvsge (currentBit!11981 (_1!11802 lt!392499)) #b00000000000000000000000000000000) (bvslt (currentBit!11981 (_1!11802 lt!392499)) #b00000000000000000000000000001000) (bvsge (currentByte!11986 (_1!11802 lt!392499)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11986 (_1!11802 lt!392499)) (size!6029 (buf!6531 (_1!11802 lt!392499)))) (and (= (currentBit!11981 (_1!11802 lt!392499)) #b00000000000000000000000000000000) (= (currentByte!11986 (_1!11802 lt!392499)) (size!6029 (buf!6531 (_1!11802 lt!392499))))))))))

(assert (=> d!84458 d!84620))

(declare-fun d!84622 () Bool)

(assert (=> d!84622 (= (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!392493)))) ((_ sign_extend 32) (currentByte!11986 (_1!11802 lt!392493))) ((_ sign_extend 32) (currentBit!11981 (_1!11802 lt!392493)))) (bvsub (bvmul ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!392493)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11986 (_1!11802 lt!392493))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11981 (_1!11802 lt!392493))))))))

(assert (=> d!84412 d!84622))

(declare-fun d!84624 () Bool)

(assert (=> d!84624 (= (invariant!0 (currentBit!11981 (_1!11802 lt!392493)) (currentByte!11986 (_1!11802 lt!392493)) (size!6029 (buf!6531 (_1!11802 lt!392493)))) (and (bvsge (currentBit!11981 (_1!11802 lt!392493)) #b00000000000000000000000000000000) (bvslt (currentBit!11981 (_1!11802 lt!392493)) #b00000000000000000000000000001000) (bvsge (currentByte!11986 (_1!11802 lt!392493)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11986 (_1!11802 lt!392493)) (size!6029 (buf!6531 (_1!11802 lt!392493)))) (and (= (currentBit!11981 (_1!11802 lt!392493)) #b00000000000000000000000000000000) (= (currentByte!11986 (_1!11802 lt!392493)) (size!6029 (buf!6531 (_1!11802 lt!392493))))))))))

(assert (=> d!84412 d!84624))

(assert (=> b!253011 d!84410))

(declare-fun d!84626 () Bool)

(assert (=> d!84626 (arrayBitRangesEq!0 (buf!6531 (_2!11801 lt!392492)) (buf!6531 thiss!1005) lt!393095 lt!393094)))

(declare-fun lt!393424 () Unit!18206)

(declare-fun choose!8 (array!13740 array!13740 (_ BitVec 64) (_ BitVec 64)) Unit!18206)

(assert (=> d!84626 (= lt!393424 (choose!8 (buf!6531 thiss!1005) (buf!6531 (_2!11801 lt!392492)) lt!393095 lt!393094))))

(assert (=> d!84626 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393095) (bvsle lt!393095 lt!393094))))

(assert (=> d!84626 (= (arrayBitRangesEqSymmetric!0 (buf!6531 thiss!1005) (buf!6531 (_2!11801 lt!392492)) lt!393095 lt!393094) lt!393424)))

(declare-fun bs!21433 () Bool)

(assert (= bs!21433 d!84626))

(assert (=> bs!21433 m!380825))

(declare-fun m!381207 () Bool)

(assert (=> bs!21433 m!381207))

(assert (=> b!253011 d!84626))

(declare-fun b!253241 () Bool)

(declare-fun e!175463 () Bool)

(declare-fun call!3972 () Bool)

(assert (=> b!253241 (= e!175463 call!3972)))

(declare-fun e!175461 () Bool)

(declare-fun b!253242 () Bool)

(declare-fun lt!393425 () tuple4!296)

(declare-fun lt!393426 () (_ BitVec 32))

(assert (=> b!253242 (= e!175461 (byteRangesEq!0 (select (arr!7016 (buf!6531 (_2!11801 lt!392492))) (_4!148 lt!393425)) (select (arr!7016 (buf!6531 thiss!1005)) (_4!148 lt!393425)) #b00000000000000000000000000000000 lt!393426))))

(declare-fun lt!393427 () (_ BitVec 32))

(declare-fun bm!3969 () Bool)

(declare-fun c!11655 () Bool)

(assert (=> bm!3969 (= call!3972 (byteRangesEq!0 (select (arr!7016 (buf!6531 (_2!11801 lt!392492))) (_3!928 lt!393425)) (select (arr!7016 (buf!6531 thiss!1005)) (_3!928 lt!393425)) lt!393427 (ite c!11655 lt!393426 #b00000000000000000000000000001000)))))

(declare-fun b!253243 () Bool)

(declare-fun e!175462 () Bool)

(declare-fun e!175460 () Bool)

(assert (=> b!253243 (= e!175462 e!175460)))

(declare-fun res!212210 () Bool)

(assert (=> b!253243 (=> (not res!212210) (not e!175460))))

(declare-fun e!175459 () Bool)

(assert (=> b!253243 (= res!212210 e!175459)))

(declare-fun res!212211 () Bool)

(assert (=> b!253243 (=> res!212211 e!175459)))

(assert (=> b!253243 (= res!212211 (bvsge (_1!11809 lt!393425) (_2!11809 lt!393425)))))

(assert (=> b!253243 (= lt!393426 ((_ extract 31 0) (bvsrem lt!393094 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253243 (= lt!393427 ((_ extract 31 0) (bvsrem lt!393095 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253243 (= lt!393425 (arrayBitIndices!0 lt!393095 lt!393094))))

(declare-fun b!253244 () Bool)

(declare-fun res!212207 () Bool)

(assert (=> b!253244 (= res!212207 (= lt!393426 #b00000000000000000000000000000000))))

(assert (=> b!253244 (=> res!212207 e!175461)))

(declare-fun e!175458 () Bool)

(assert (=> b!253244 (= e!175458 e!175461)))

(declare-fun b!253245 () Bool)

(assert (=> b!253245 (= e!175460 e!175463)))

(assert (=> b!253245 (= c!11655 (= (_3!928 lt!393425) (_4!148 lt!393425)))))

(declare-fun b!253246 () Bool)

(assert (=> b!253246 (= e!175459 (arrayRangesEq!925 (buf!6531 (_2!11801 lt!392492)) (buf!6531 thiss!1005) (_1!11809 lt!393425) (_2!11809 lt!393425)))))

(declare-fun b!253247 () Bool)

(assert (=> b!253247 (= e!175463 e!175458)))

(declare-fun res!212209 () Bool)

(assert (=> b!253247 (= res!212209 call!3972)))

(assert (=> b!253247 (=> (not res!212209) (not e!175458))))

(declare-fun d!84628 () Bool)

(declare-fun res!212208 () Bool)

(assert (=> d!84628 (=> res!212208 e!175462)))

(assert (=> d!84628 (= res!212208 (bvsge lt!393095 lt!393094))))

(assert (=> d!84628 (= (arrayBitRangesEq!0 (buf!6531 (_2!11801 lt!392492)) (buf!6531 thiss!1005) lt!393095 lt!393094) e!175462)))

(assert (= (and d!84628 (not res!212208)) b!253243))

(assert (= (and b!253243 (not res!212211)) b!253246))

(assert (= (and b!253243 res!212210) b!253245))

(assert (= (and b!253245 c!11655) b!253241))

(assert (= (and b!253245 (not c!11655)) b!253247))

(assert (= (and b!253247 res!212209) b!253244))

(assert (= (and b!253244 (not res!212207)) b!253242))

(assert (= (or b!253241 b!253247) bm!3969))

(declare-fun m!381209 () Bool)

(assert (=> b!253242 m!381209))

(declare-fun m!381211 () Bool)

(assert (=> b!253242 m!381211))

(assert (=> b!253242 m!381209))

(assert (=> b!253242 m!381211))

(declare-fun m!381213 () Bool)

(assert (=> b!253242 m!381213))

(declare-fun m!381215 () Bool)

(assert (=> bm!3969 m!381215))

(declare-fun m!381217 () Bool)

(assert (=> bm!3969 m!381217))

(assert (=> bm!3969 m!381215))

(assert (=> bm!3969 m!381217))

(declare-fun m!381219 () Bool)

(assert (=> bm!3969 m!381219))

(declare-fun m!381221 () Bool)

(assert (=> b!253243 m!381221))

(declare-fun m!381223 () Bool)

(assert (=> b!253246 m!381223))

(assert (=> b!253011 d!84628))

(declare-fun d!84630 () Bool)

(assert (=> d!84630 (= (invariant!0 (currentBit!11981 thiss!1005) (currentByte!11986 thiss!1005) (size!6029 (buf!6531 thiss!1005))) (and (bvsge (currentBit!11981 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11981 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11986 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11986 thiss!1005) (size!6029 (buf!6531 thiss!1005))) (and (= (currentBit!11981 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11986 thiss!1005) (size!6029 (buf!6531 thiss!1005)))))))))

(assert (=> d!84432 d!84630))

(declare-fun d!84632 () Bool)

(assert (=> d!84632 (= (remainingBits!0 ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!392488)))) ((_ sign_extend 32) (currentByte!11986 (_1!11802 lt!392488))) ((_ sign_extend 32) (currentBit!11981 (_1!11802 lt!392488)))) (bvsub (bvmul ((_ sign_extend 32) (size!6029 (buf!6531 (_1!11802 lt!392488)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11986 (_1!11802 lt!392488))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11981 (_1!11802 lt!392488))))))))

(assert (=> d!84472 d!84632))

(declare-fun d!84634 () Bool)

(assert (=> d!84634 (= (invariant!0 (currentBit!11981 (_1!11802 lt!392488)) (currentByte!11986 (_1!11802 lt!392488)) (size!6029 (buf!6531 (_1!11802 lt!392488)))) (and (bvsge (currentBit!11981 (_1!11802 lt!392488)) #b00000000000000000000000000000000) (bvslt (currentBit!11981 (_1!11802 lt!392488)) #b00000000000000000000000000001000) (bvsge (currentByte!11986 (_1!11802 lt!392488)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11986 (_1!11802 lt!392488)) (size!6029 (buf!6531 (_1!11802 lt!392488)))) (and (= (currentBit!11981 (_1!11802 lt!392488)) #b00000000000000000000000000000000) (= (currentByte!11986 (_1!11802 lt!392488)) (size!6029 (buf!6531 (_1!11802 lt!392488))))))))))

(assert (=> d!84472 d!84634))

(declare-fun d!84636 () Bool)

(declare-fun res!212212 () Bool)

(declare-fun e!175465 () Bool)

(assert (=> d!84636 (=> (not res!212212) (not e!175465))))

(assert (=> d!84636 (= res!212212 (= (size!6029 (buf!6531 (_1!11800 lt!393074))) (size!6029 (buf!6531 (_2!11801 lt!392494)))))))

(assert (=> d!84636 (= (isPrefixOf!0 (_1!11800 lt!393074) (_2!11801 lt!392494)) e!175465)))

(declare-fun b!253248 () Bool)

(declare-fun res!212213 () Bool)

(assert (=> b!253248 (=> (not res!212213) (not e!175465))))

(assert (=> b!253248 (= res!212213 (bvsle (bitIndex!0 (size!6029 (buf!6531 (_1!11800 lt!393074))) (currentByte!11986 (_1!11800 lt!393074)) (currentBit!11981 (_1!11800 lt!393074))) (bitIndex!0 (size!6029 (buf!6531 (_2!11801 lt!392494))) (currentByte!11986 (_2!11801 lt!392494)) (currentBit!11981 (_2!11801 lt!392494)))))))

(declare-fun b!253249 () Bool)

(declare-fun e!175464 () Bool)

(assert (=> b!253249 (= e!175465 e!175464)))

(declare-fun res!212214 () Bool)

(assert (=> b!253249 (=> res!212214 e!175464)))

(assert (=> b!253249 (= res!212214 (= (size!6029 (buf!6531 (_1!11800 lt!393074))) #b00000000000000000000000000000000))))

(declare-fun b!253250 () Bool)

(assert (=> b!253250 (= e!175464 (arrayBitRangesEq!0 (buf!6531 (_1!11800 lt!393074)) (buf!6531 (_2!11801 lt!392494)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6029 (buf!6531 (_1!11800 lt!393074))) (currentByte!11986 (_1!11800 lt!393074)) (currentBit!11981 (_1!11800 lt!393074)))))))

(assert (= (and d!84636 res!212212) b!253248))

(assert (= (and b!253248 res!212213) b!253249))

(assert (= (and b!253249 (not res!212214)) b!253250))

(assert (=> b!253248 m!380963))

(assert (=> b!253248 m!380269))

(assert (=> b!253250 m!380963))

(assert (=> b!253250 m!380963))

(declare-fun m!381225 () Bool)

(assert (=> b!253250 m!381225))

(assert (=> b!252987 d!84636))

(assert (=> d!84410 d!84600))

(assert (=> d!84410 d!84630))

(assert (=> b!252989 d!84408))

(declare-fun d!84638 () Bool)

(assert (=> d!84638 (arrayBitRangesEq!0 (buf!6531 (_2!11801 lt!392492)) (buf!6531 (_2!11801 lt!392494)) lt!393063 lt!393062)))

(declare-fun lt!393428 () Unit!18206)

(assert (=> d!84638 (= lt!393428 (choose!8 (buf!6531 (_2!11801 lt!392494)) (buf!6531 (_2!11801 lt!392492)) lt!393063 lt!393062))))

(assert (=> d!84638 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393063) (bvsle lt!393063 lt!393062))))

(assert (=> d!84638 (= (arrayBitRangesEqSymmetric!0 (buf!6531 (_2!11801 lt!392494)) (buf!6531 (_2!11801 lt!392492)) lt!393063 lt!393062) lt!393428)))

(declare-fun bs!21434 () Bool)

(assert (= bs!21434 d!84638))

(assert (=> bs!21434 m!380781))

(declare-fun m!381227 () Bool)

(assert (=> bs!21434 m!381227))

(assert (=> b!252989 d!84638))

(declare-fun b!253251 () Bool)

(declare-fun e!175471 () Bool)

(declare-fun call!3973 () Bool)

(assert (=> b!253251 (= e!175471 call!3973)))

(declare-fun b!253252 () Bool)

(declare-fun e!175469 () Bool)

(declare-fun lt!393430 () (_ BitVec 32))

(declare-fun lt!393429 () tuple4!296)

(assert (=> b!253252 (= e!175469 (byteRangesEq!0 (select (arr!7016 (buf!6531 (_2!11801 lt!392492))) (_4!148 lt!393429)) (select (arr!7016 (buf!6531 (_2!11801 lt!392494))) (_4!148 lt!393429)) #b00000000000000000000000000000000 lt!393430))))

(declare-fun c!11656 () Bool)

(declare-fun lt!393431 () (_ BitVec 32))

(declare-fun bm!3970 () Bool)

(assert (=> bm!3970 (= call!3973 (byteRangesEq!0 (select (arr!7016 (buf!6531 (_2!11801 lt!392492))) (_3!928 lt!393429)) (select (arr!7016 (buf!6531 (_2!11801 lt!392494))) (_3!928 lt!393429)) lt!393431 (ite c!11656 lt!393430 #b00000000000000000000000000001000)))))

(declare-fun b!253253 () Bool)

(declare-fun e!175470 () Bool)

(declare-fun e!175468 () Bool)

(assert (=> b!253253 (= e!175470 e!175468)))

(declare-fun res!212218 () Bool)

(assert (=> b!253253 (=> (not res!212218) (not e!175468))))

(declare-fun e!175467 () Bool)

(assert (=> b!253253 (= res!212218 e!175467)))

(declare-fun res!212219 () Bool)

(assert (=> b!253253 (=> res!212219 e!175467)))

(assert (=> b!253253 (= res!212219 (bvsge (_1!11809 lt!393429) (_2!11809 lt!393429)))))

(assert (=> b!253253 (= lt!393430 ((_ extract 31 0) (bvsrem lt!393062 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253253 (= lt!393431 ((_ extract 31 0) (bvsrem lt!393063 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253253 (= lt!393429 (arrayBitIndices!0 lt!393063 lt!393062))))

(declare-fun b!253254 () Bool)

(declare-fun res!212215 () Bool)

(assert (=> b!253254 (= res!212215 (= lt!393430 #b00000000000000000000000000000000))))

(assert (=> b!253254 (=> res!212215 e!175469)))

(declare-fun e!175466 () Bool)

(assert (=> b!253254 (= e!175466 e!175469)))

(declare-fun b!253255 () Bool)

(assert (=> b!253255 (= e!175468 e!175471)))

(assert (=> b!253255 (= c!11656 (= (_3!928 lt!393429) (_4!148 lt!393429)))))

(declare-fun b!253256 () Bool)

(assert (=> b!253256 (= e!175467 (arrayRangesEq!925 (buf!6531 (_2!11801 lt!392492)) (buf!6531 (_2!11801 lt!392494)) (_1!11809 lt!393429) (_2!11809 lt!393429)))))

(declare-fun b!253257 () Bool)

(assert (=> b!253257 (= e!175471 e!175466)))

(declare-fun res!212217 () Bool)

(assert (=> b!253257 (= res!212217 call!3973)))

(assert (=> b!253257 (=> (not res!212217) (not e!175466))))

(declare-fun d!84640 () Bool)

(declare-fun res!212216 () Bool)

(assert (=> d!84640 (=> res!212216 e!175470)))

(assert (=> d!84640 (= res!212216 (bvsge lt!393063 lt!393062))))

(assert (=> d!84640 (= (arrayBitRangesEq!0 (buf!6531 (_2!11801 lt!392492)) (buf!6531 (_2!11801 lt!392494)) lt!393063 lt!393062) e!175470)))

(assert (= (and d!84640 (not res!212216)) b!253253))

(assert (= (and b!253253 (not res!212219)) b!253256))

(assert (= (and b!253253 res!212218) b!253255))

(assert (= (and b!253255 c!11656) b!253251))

(assert (= (and b!253255 (not c!11656)) b!253257))

(assert (= (and b!253257 res!212217) b!253254))

(assert (= (and b!253254 (not res!212215)) b!253252))

(assert (= (or b!253251 b!253257) bm!3970))

(declare-fun m!381229 () Bool)

(assert (=> b!253252 m!381229))

(declare-fun m!381231 () Bool)

(assert (=> b!253252 m!381231))

(assert (=> b!253252 m!381229))

(assert (=> b!253252 m!381231))

(declare-fun m!381233 () Bool)

(assert (=> b!253252 m!381233))

(declare-fun m!381235 () Bool)

(assert (=> bm!3970 m!381235))

(declare-fun m!381237 () Bool)

(assert (=> bm!3970 m!381237))

(assert (=> bm!3970 m!381235))

(assert (=> bm!3970 m!381237))

(declare-fun m!381239 () Bool)

(assert (=> bm!3970 m!381239))

(declare-fun m!381241 () Bool)

(assert (=> b!253253 m!381241))

(declare-fun m!381243 () Bool)

(assert (=> b!253256 m!381243))

(assert (=> b!252989 d!84640))

(check-sat (not b!253189) (not b!253204) (not d!84596) (not d!84560) (not b!253214) (not b!253096) (not d!84616) (not d!84536) (not b!253053) (not d!84512) (not d!84566) (not d!84568) (not d!84510) (not bm!3969) (not b!253088) (not d!84524) (not d!84572) (not b!253235) (not b!253243) (not d!84532) (not b!253237) (not b!253227) (not b!253173) (not b!253220) (not d!84478) (not d!84538) (not d!84486) (not bm!3970) (not d!84492) (not b!253233) (not b!253067) (not d!84592) (not b!253217) (not bm!3966) (not b!253242) (not b!253238) (not b!253125) (not bm!3968) (not b!253159) (not b!253181) (not d!84480) (not d!84554) (not b!253199) (not b!253176) (not d!84494) (not b!253090) (not b!253175) (not d!84516) (not b!253080) (not b!253157) (not b!253183) (not d!84552) (not b!253229) (not b!253216) (not d!84530) (not b!253052) (not b!253253) (not d!84482) (not b!253230) (not d!84550) (not b!253068) (not b!253225) (not d!84594) (not d!84638) (not bm!3967) (not b!253218) (not b!253083) (not b!253091) (not d!84588) (not b!253210) (not b!253065) (not d!84504) (not b!253250) (not b!253158) (not b!253075) (not b!253089) (not b!253141) (not d!84514) (not d!84518) (not b!253197) (not d!84520) (not b!253188) (not b!253066) (not d!84602) (not d!84590) (not b!253211) (not d!84488) (not b!253117) (not b!253207) (not d!84490) (not b!253142) (not b!253119) (not b!253069) (not b!253084) (not b!253252) (not b!253072) (not b!253086) (not d!84526) (not b!253077) (not b!253202) (not b!253124) (not d!84626) (not b!253098) (not b!253240) (not b!253156) (not b!253248) (not b!253246) (not b!253208) (not d!84534) (not b!253256) (not d!84500) (not b!253213) (not d!84484) (not b!253081) (not d!84556) (not b!253226) (not b!253074) (not b!253145) (not b!253078) (not b!253179) (not b!253168) (not d!84574) (not d!84604) (not b!253200) (not d!84598) (not d!84576) (not d!84578) (not b!253205))
(check-sat)
