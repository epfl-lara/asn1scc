; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52630 () Bool)

(assert start!52630)

(declare-fun b!243358 () Bool)

(declare-fun e!168695 () Bool)

(declare-datatypes ((array!13342 0))(
  ( (array!13343 (arr!6836 (Array (_ BitVec 32) (_ BitVec 8))) (size!5849 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10620 0))(
  ( (BitStream!10621 (buf!6318 array!13342) (currentByte!11690 (_ BitVec 32)) (currentBit!11685 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20850 0))(
  ( (tuple2!20851 (_1!11347 BitStream!10620) (_2!11347 Bool)) )
))
(declare-fun lt!379258 () tuple2!20850)

(declare-fun lt!379249 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!243358 (= e!168695 (= (bitIndex!0 (size!5849 (buf!6318 (_1!11347 lt!379258))) (currentByte!11690 (_1!11347 lt!379258)) (currentBit!11685 (_1!11347 lt!379258))) lt!379249))))

(declare-fun b!243359 () Bool)

(declare-fun res!203317 () Bool)

(declare-fun e!168696 () Bool)

(assert (=> b!243359 (=> (not res!203317) (not e!168696))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!243359 (= res!203317 (bvslt from!289 nBits!297))))

(declare-fun res!203315 () Bool)

(assert (=> start!52630 (=> (not res!203315) (not e!168696))))

(assert (=> start!52630 (= res!203315 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52630 e!168696))

(assert (=> start!52630 true))

(declare-fun thiss!1005 () BitStream!10620)

(declare-fun e!168693 () Bool)

(declare-fun inv!12 (BitStream!10620) Bool)

(assert (=> start!52630 (and (inv!12 thiss!1005) e!168693)))

(declare-fun b!243360 () Bool)

(assert (=> b!243360 (= e!168696 (not true))))

(declare-datatypes ((Unit!17787 0))(
  ( (Unit!17788) )
))
(declare-datatypes ((tuple2!20852 0))(
  ( (tuple2!20853 (_1!11348 Unit!17787) (_2!11348 BitStream!10620)) )
))
(declare-fun lt!379243 () tuple2!20852)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!243360 (validate_offset_bits!1 ((_ sign_extend 32) (size!5849 (buf!6318 (_2!11348 lt!379243)))) ((_ sign_extend 32) (currentByte!11690 thiss!1005)) ((_ sign_extend 32) (currentBit!11685 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!379256 () Unit!17787)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10620 array!13342 (_ BitVec 64)) Unit!17787)

(assert (=> b!243360 (= lt!379256 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6318 (_2!11348 lt!379243)) (bvsub nBits!297 from!289)))))

(declare-datatypes ((tuple2!20854 0))(
  ( (tuple2!20855 (_1!11349 BitStream!10620) (_2!11349 BitStream!10620)) )
))
(declare-fun lt!379253 () tuple2!20854)

(declare-fun bit!26 () Bool)

(declare-fun readBitPure!0 (BitStream!10620) tuple2!20850)

(assert (=> b!243360 (= (_2!11347 (readBitPure!0 (_1!11349 lt!379253))) bit!26)))

(declare-fun lt!379247 () tuple2!20854)

(declare-fun lt!379245 () tuple2!20852)

(declare-fun reader!0 (BitStream!10620 BitStream!10620) tuple2!20854)

(assert (=> b!243360 (= lt!379247 (reader!0 (_2!11348 lt!379245) (_2!11348 lt!379243)))))

(assert (=> b!243360 (= lt!379253 (reader!0 thiss!1005 (_2!11348 lt!379243)))))

(declare-fun e!168698 () Bool)

(assert (=> b!243360 e!168698))

(declare-fun res!203318 () Bool)

(assert (=> b!243360 (=> (not res!203318) (not e!168698))))

(declare-fun lt!379250 () tuple2!20850)

(declare-fun lt!379255 () tuple2!20850)

(assert (=> b!243360 (= res!203318 (= (bitIndex!0 (size!5849 (buf!6318 (_1!11347 lt!379250))) (currentByte!11690 (_1!11347 lt!379250)) (currentBit!11685 (_1!11347 lt!379250))) (bitIndex!0 (size!5849 (buf!6318 (_1!11347 lt!379255))) (currentByte!11690 (_1!11347 lt!379255)) (currentBit!11685 (_1!11347 lt!379255)))))))

(declare-fun lt!379246 () Unit!17787)

(declare-fun lt!379259 () BitStream!10620)

(declare-fun readBitPrefixLemma!0 (BitStream!10620 BitStream!10620) Unit!17787)

(assert (=> b!243360 (= lt!379246 (readBitPrefixLemma!0 lt!379259 (_2!11348 lt!379243)))))

(assert (=> b!243360 (= lt!379255 (readBitPure!0 (BitStream!10621 (buf!6318 (_2!11348 lt!379243)) (currentByte!11690 thiss!1005) (currentBit!11685 thiss!1005))))))

(assert (=> b!243360 (= lt!379250 (readBitPure!0 lt!379259))))

(assert (=> b!243360 (= lt!379259 (BitStream!10621 (buf!6318 (_2!11348 lt!379245)) (currentByte!11690 thiss!1005) (currentBit!11685 thiss!1005)))))

(declare-fun e!168699 () Bool)

(assert (=> b!243360 e!168699))

(declare-fun res!203316 () Bool)

(assert (=> b!243360 (=> (not res!203316) (not e!168699))))

(declare-fun isPrefixOf!0 (BitStream!10620 BitStream!10620) Bool)

(assert (=> b!243360 (= res!203316 (isPrefixOf!0 thiss!1005 (_2!11348 lt!379243)))))

(declare-fun lt!379257 () Unit!17787)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10620 BitStream!10620 BitStream!10620) Unit!17787)

(assert (=> b!243360 (= lt!379257 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11348 lt!379245) (_2!11348 lt!379243)))))

(declare-fun e!168694 () Bool)

(assert (=> b!243360 e!168694))

(declare-fun res!203308 () Bool)

(assert (=> b!243360 (=> (not res!203308) (not e!168694))))

(assert (=> b!243360 (= res!203308 (= (size!5849 (buf!6318 (_2!11348 lt!379245))) (size!5849 (buf!6318 (_2!11348 lt!379243)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10620 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20852)

(assert (=> b!243360 (= lt!379243 (appendNBitsLoop!0 (_2!11348 lt!379245) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243360 (validate_offset_bits!1 ((_ sign_extend 32) (size!5849 (buf!6318 (_2!11348 lt!379245)))) ((_ sign_extend 32) (currentByte!11690 (_2!11348 lt!379245))) ((_ sign_extend 32) (currentBit!11685 (_2!11348 lt!379245))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!379252 () Unit!17787)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10620 BitStream!10620 (_ BitVec 64) (_ BitVec 64)) Unit!17787)

(assert (=> b!243360 (= lt!379252 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11348 lt!379245) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!168697 () Bool)

(assert (=> b!243360 e!168697))

(declare-fun res!203307 () Bool)

(assert (=> b!243360 (=> (not res!203307) (not e!168697))))

(assert (=> b!243360 (= res!203307 (= (size!5849 (buf!6318 thiss!1005)) (size!5849 (buf!6318 (_2!11348 lt!379245)))))))

(declare-fun appendBit!0 (BitStream!10620 Bool) tuple2!20852)

(assert (=> b!243360 (= lt!379245 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!243361 () Bool)

(declare-fun e!168701 () Bool)

(assert (=> b!243361 (= e!168694 e!168701)))

(declare-fun res!203314 () Bool)

(assert (=> b!243361 (=> (not res!203314) (not e!168701))))

(declare-fun lt!379260 () (_ BitVec 64))

(assert (=> b!243361 (= res!203314 (= (bitIndex!0 (size!5849 (buf!6318 (_2!11348 lt!379243))) (currentByte!11690 (_2!11348 lt!379243)) (currentBit!11685 (_2!11348 lt!379243))) (bvadd (bitIndex!0 (size!5849 (buf!6318 (_2!11348 lt!379245))) (currentByte!11690 (_2!11348 lt!379245)) (currentBit!11685 (_2!11348 lt!379245))) lt!379260)))))

(assert (=> b!243361 (= lt!379260 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!243362 () Bool)

(declare-fun lt!379251 () tuple2!20850)

(declare-fun lt!379248 () tuple2!20854)

(assert (=> b!243362 (= e!168701 (not (or (not (_2!11347 lt!379251)) (not (= (_1!11347 lt!379251) (_2!11349 lt!379248))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10620 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20850)

(assert (=> b!243362 (= lt!379251 (checkBitsLoopPure!0 (_1!11349 lt!379248) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243362 (validate_offset_bits!1 ((_ sign_extend 32) (size!5849 (buf!6318 (_2!11348 lt!379243)))) ((_ sign_extend 32) (currentByte!11690 (_2!11348 lt!379245))) ((_ sign_extend 32) (currentBit!11685 (_2!11348 lt!379245))) lt!379260)))

(declare-fun lt!379244 () Unit!17787)

(assert (=> b!243362 (= lt!379244 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11348 lt!379245) (buf!6318 (_2!11348 lt!379243)) lt!379260))))

(assert (=> b!243362 (= lt!379248 (reader!0 (_2!11348 lt!379245) (_2!11348 lt!379243)))))

(declare-fun b!243363 () Bool)

(declare-fun res!203310 () Bool)

(declare-fun e!168692 () Bool)

(assert (=> b!243363 (=> (not res!203310) (not e!168692))))

(assert (=> b!243363 (= res!203310 (isPrefixOf!0 thiss!1005 (_2!11348 lt!379245)))))

(declare-fun b!243364 () Bool)

(assert (=> b!243364 (= e!168697 e!168692)))

(declare-fun res!203311 () Bool)

(assert (=> b!243364 (=> (not res!203311) (not e!168692))))

(declare-fun lt!379254 () (_ BitVec 64))

(assert (=> b!243364 (= res!203311 (= lt!379249 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!379254)))))

(assert (=> b!243364 (= lt!379249 (bitIndex!0 (size!5849 (buf!6318 (_2!11348 lt!379245))) (currentByte!11690 (_2!11348 lt!379245)) (currentBit!11685 (_2!11348 lt!379245))))))

(assert (=> b!243364 (= lt!379254 (bitIndex!0 (size!5849 (buf!6318 thiss!1005)) (currentByte!11690 thiss!1005) (currentBit!11685 thiss!1005)))))

(declare-fun b!243365 () Bool)

(assert (=> b!243365 (= e!168698 (= (_2!11347 lt!379250) (_2!11347 lt!379255)))))

(declare-fun b!243366 () Bool)

(declare-fun res!203309 () Bool)

(assert (=> b!243366 (=> (not res!203309) (not e!168701))))

(assert (=> b!243366 (= res!203309 (isPrefixOf!0 (_2!11348 lt!379245) (_2!11348 lt!379243)))))

(declare-fun b!243367 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243367 (= e!168699 (invariant!0 (currentBit!11685 thiss!1005) (currentByte!11690 thiss!1005) (size!5849 (buf!6318 (_2!11348 lt!379243)))))))

(declare-fun b!243368 () Bool)

(declare-fun array_inv!5590 (array!13342) Bool)

(assert (=> b!243368 (= e!168693 (array_inv!5590 (buf!6318 thiss!1005)))))

(declare-fun b!243369 () Bool)

(assert (=> b!243369 (= e!168692 e!168695)))

(declare-fun res!203313 () Bool)

(assert (=> b!243369 (=> (not res!203313) (not e!168695))))

(assert (=> b!243369 (= res!203313 (and (= (_2!11347 lt!379258) bit!26) (= (_1!11347 lt!379258) (_2!11348 lt!379245))))))

(declare-fun readerFrom!0 (BitStream!10620 (_ BitVec 32) (_ BitVec 32)) BitStream!10620)

(assert (=> b!243369 (= lt!379258 (readBitPure!0 (readerFrom!0 (_2!11348 lt!379245) (currentBit!11685 thiss!1005) (currentByte!11690 thiss!1005))))))

(declare-fun b!243370 () Bool)

(declare-fun res!203319 () Bool)

(assert (=> b!243370 (=> (not res!203319) (not e!168699))))

(assert (=> b!243370 (= res!203319 (invariant!0 (currentBit!11685 thiss!1005) (currentByte!11690 thiss!1005) (size!5849 (buf!6318 (_2!11348 lt!379245)))))))

(declare-fun b!243371 () Bool)

(declare-fun res!203312 () Bool)

(assert (=> b!243371 (=> (not res!203312) (not e!168696))))

(assert (=> b!243371 (= res!203312 (validate_offset_bits!1 ((_ sign_extend 32) (size!5849 (buf!6318 thiss!1005))) ((_ sign_extend 32) (currentByte!11690 thiss!1005)) ((_ sign_extend 32) (currentBit!11685 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!52630 res!203315) b!243371))

(assert (= (and b!243371 res!203312) b!243359))

(assert (= (and b!243359 res!203317) b!243360))

(assert (= (and b!243360 res!203307) b!243364))

(assert (= (and b!243364 res!203311) b!243363))

(assert (= (and b!243363 res!203310) b!243369))

(assert (= (and b!243369 res!203313) b!243358))

(assert (= (and b!243360 res!203308) b!243361))

(assert (= (and b!243361 res!203314) b!243366))

(assert (= (and b!243366 res!203309) b!243362))

(assert (= (and b!243360 res!203316) b!243370))

(assert (= (and b!243370 res!203319) b!243367))

(assert (= (and b!243360 res!203318) b!243365))

(assert (= start!52630 b!243368))

(declare-fun m!366657 () Bool)

(assert (=> b!243358 m!366657))

(declare-fun m!366659 () Bool)

(assert (=> b!243361 m!366659))

(declare-fun m!366661 () Bool)

(assert (=> b!243361 m!366661))

(declare-fun m!366663 () Bool)

(assert (=> b!243360 m!366663))

(declare-fun m!366665 () Bool)

(assert (=> b!243360 m!366665))

(declare-fun m!366667 () Bool)

(assert (=> b!243360 m!366667))

(declare-fun m!366669 () Bool)

(assert (=> b!243360 m!366669))

(declare-fun m!366671 () Bool)

(assert (=> b!243360 m!366671))

(declare-fun m!366673 () Bool)

(assert (=> b!243360 m!366673))

(declare-fun m!366675 () Bool)

(assert (=> b!243360 m!366675))

(declare-fun m!366677 () Bool)

(assert (=> b!243360 m!366677))

(declare-fun m!366679 () Bool)

(assert (=> b!243360 m!366679))

(declare-fun m!366681 () Bool)

(assert (=> b!243360 m!366681))

(declare-fun m!366683 () Bool)

(assert (=> b!243360 m!366683))

(declare-fun m!366685 () Bool)

(assert (=> b!243360 m!366685))

(declare-fun m!366687 () Bool)

(assert (=> b!243360 m!366687))

(declare-fun m!366689 () Bool)

(assert (=> b!243360 m!366689))

(declare-fun m!366691 () Bool)

(assert (=> b!243360 m!366691))

(declare-fun m!366693 () Bool)

(assert (=> b!243360 m!366693))

(declare-fun m!366695 () Bool)

(assert (=> b!243363 m!366695))

(declare-fun m!366697 () Bool)

(assert (=> b!243370 m!366697))

(assert (=> b!243364 m!366661))

(declare-fun m!366699 () Bool)

(assert (=> b!243364 m!366699))

(declare-fun m!366701 () Bool)

(assert (=> start!52630 m!366701))

(declare-fun m!366703 () Bool)

(assert (=> b!243369 m!366703))

(assert (=> b!243369 m!366703))

(declare-fun m!366705 () Bool)

(assert (=> b!243369 m!366705))

(declare-fun m!366707 () Bool)

(assert (=> b!243366 m!366707))

(declare-fun m!366709 () Bool)

(assert (=> b!243367 m!366709))

(declare-fun m!366711 () Bool)

(assert (=> b!243368 m!366711))

(declare-fun m!366713 () Bool)

(assert (=> b!243362 m!366713))

(declare-fun m!366715 () Bool)

(assert (=> b!243362 m!366715))

(declare-fun m!366717 () Bool)

(assert (=> b!243362 m!366717))

(assert (=> b!243362 m!366689))

(declare-fun m!366719 () Bool)

(assert (=> b!243371 m!366719))

(check-sat (not start!52630) (not b!243369) (not b!243366) (not b!243360) (not b!243368) (not b!243358) (not b!243371) (not b!243367) (not b!243364) (not b!243370) (not b!243363) (not b!243361) (not b!243362))
