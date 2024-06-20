; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52498 () Bool)

(assert start!52498)

(declare-fun b!242473 () Bool)

(declare-fun res!202497 () Bool)

(declare-fun e!168104 () Bool)

(assert (=> b!242473 (=> (not res!202497) (not e!168104))))

(declare-datatypes ((array!13309 0))(
  ( (array!13310 (arr!6821 (Array (_ BitVec 32) (_ BitVec 8))) (size!5834 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10590 0))(
  ( (BitStream!10591 (buf!6300 array!13309) (currentByte!11663 (_ BitVec 32)) (currentBit!11658 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17751 0))(
  ( (Unit!17752) )
))
(declare-datatypes ((tuple2!20754 0))(
  ( (tuple2!20755 (_1!11299 Unit!17751) (_2!11299 BitStream!10590)) )
))
(declare-fun lt!377901 () tuple2!20754)

(declare-fun lt!377908 () tuple2!20754)

(declare-fun isPrefixOf!0 (BitStream!10590 BitStream!10590) Bool)

(assert (=> b!242473 (= res!202497 (isPrefixOf!0 (_2!11299 lt!377901) (_2!11299 lt!377908)))))

(declare-fun b!242474 () Bool)

(declare-fun e!168109 () Bool)

(declare-fun thiss!1005 () BitStream!10590)

(declare-fun array_inv!5575 (array!13309) Bool)

(assert (=> b!242474 (= e!168109 (array_inv!5575 (buf!6300 thiss!1005)))))

(declare-fun b!242475 () Bool)

(declare-fun res!202494 () Bool)

(declare-fun e!168106 () Bool)

(assert (=> b!242475 (=> (not res!202494) (not e!168106))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!242475 (= res!202494 (bvslt from!289 nBits!297))))

(declare-fun b!242477 () Bool)

(declare-fun res!202496 () Bool)

(assert (=> b!242477 (=> (not res!202496) (not e!168106))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242477 (= res!202496 (validate_offset_bits!1 ((_ sign_extend 32) (size!5834 (buf!6300 thiss!1005))) ((_ sign_extend 32) (currentByte!11663 thiss!1005)) ((_ sign_extend 32) (currentBit!11658 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!242478 () Bool)

(declare-fun res!202492 () Bool)

(declare-fun e!168107 () Bool)

(assert (=> b!242478 (=> (not res!202492) (not e!168107))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242478 (= res!202492 (invariant!0 (currentBit!11658 thiss!1005) (currentByte!11663 thiss!1005) (size!5834 (buf!6300 (_2!11299 lt!377901)))))))

(declare-fun b!242479 () Bool)

(declare-fun e!168103 () Bool)

(declare-datatypes ((tuple2!20756 0))(
  ( (tuple2!20757 (_1!11300 BitStream!10590) (_2!11300 Bool)) )
))
(declare-fun lt!377903 () tuple2!20756)

(declare-fun lt!377898 () tuple2!20756)

(assert (=> b!242479 (= e!168103 (= (_2!11300 lt!377903) (_2!11300 lt!377898)))))

(declare-fun b!242480 () Bool)

(declare-fun e!168101 () Bool)

(declare-fun e!168110 () Bool)

(assert (=> b!242480 (= e!168101 e!168110)))

(declare-fun res!202498 () Bool)

(assert (=> b!242480 (=> (not res!202498) (not e!168110))))

(declare-fun lt!377907 () (_ BitVec 64))

(declare-fun lt!377904 () (_ BitVec 64))

(assert (=> b!242480 (= res!202498 (= lt!377907 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377904)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!242480 (= lt!377907 (bitIndex!0 (size!5834 (buf!6300 (_2!11299 lt!377901))) (currentByte!11663 (_2!11299 lt!377901)) (currentBit!11658 (_2!11299 lt!377901))))))

(assert (=> b!242480 (= lt!377904 (bitIndex!0 (size!5834 (buf!6300 thiss!1005)) (currentByte!11663 thiss!1005) (currentBit!11658 thiss!1005)))))

(declare-fun b!242481 () Bool)

(declare-fun e!168108 () Bool)

(assert (=> b!242481 (= e!168110 e!168108)))

(declare-fun res!202502 () Bool)

(assert (=> b!242481 (=> (not res!202502) (not e!168108))))

(declare-fun bit!26 () Bool)

(declare-fun lt!377899 () tuple2!20756)

(assert (=> b!242481 (= res!202502 (and (= (_2!11300 lt!377899) bit!26) (= (_1!11300 lt!377899) (_2!11299 lt!377901))))))

(declare-fun readBitPure!0 (BitStream!10590) tuple2!20756)

(declare-fun readerFrom!0 (BitStream!10590 (_ BitVec 32) (_ BitVec 32)) BitStream!10590)

(assert (=> b!242481 (= lt!377899 (readBitPure!0 (readerFrom!0 (_2!11299 lt!377901) (currentBit!11658 thiss!1005) (currentByte!11663 thiss!1005))))))

(declare-fun b!242482 () Bool)

(declare-fun lt!377913 () tuple2!20756)

(declare-datatypes ((tuple2!20758 0))(
  ( (tuple2!20759 (_1!11301 BitStream!10590) (_2!11301 BitStream!10590)) )
))
(declare-fun lt!377902 () tuple2!20758)

(assert (=> b!242482 (= e!168104 (not (or (not (_2!11300 lt!377913)) (not (= (_1!11300 lt!377913) (_2!11301 lt!377902))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10590 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20756)

(assert (=> b!242482 (= lt!377913 (checkBitsLoopPure!0 (_1!11301 lt!377902) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!377906 () (_ BitVec 64))

(assert (=> b!242482 (validate_offset_bits!1 ((_ sign_extend 32) (size!5834 (buf!6300 (_2!11299 lt!377908)))) ((_ sign_extend 32) (currentByte!11663 (_2!11299 lt!377901))) ((_ sign_extend 32) (currentBit!11658 (_2!11299 lt!377901))) lt!377906)))

(declare-fun lt!377910 () Unit!17751)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10590 array!13309 (_ BitVec 64)) Unit!17751)

(assert (=> b!242482 (= lt!377910 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11299 lt!377901) (buf!6300 (_2!11299 lt!377908)) lt!377906))))

(declare-fun reader!0 (BitStream!10590 BitStream!10590) tuple2!20758)

(assert (=> b!242482 (= lt!377902 (reader!0 (_2!11299 lt!377901) (_2!11299 lt!377908)))))

(declare-fun b!242483 () Bool)

(assert (=> b!242483 (= e!168107 (invariant!0 (currentBit!11658 thiss!1005) (currentByte!11663 thiss!1005) (size!5834 (buf!6300 (_2!11299 lt!377908)))))))

(declare-fun b!242484 () Bool)

(declare-fun e!168105 () Bool)

(assert (=> b!242484 (= e!168105 e!168104)))

(declare-fun res!202501 () Bool)

(assert (=> b!242484 (=> (not res!202501) (not e!168104))))

(assert (=> b!242484 (= res!202501 (= (bitIndex!0 (size!5834 (buf!6300 (_2!11299 lt!377908))) (currentByte!11663 (_2!11299 lt!377908)) (currentBit!11658 (_2!11299 lt!377908))) (bvadd (bitIndex!0 (size!5834 (buf!6300 (_2!11299 lt!377901))) (currentByte!11663 (_2!11299 lt!377901)) (currentBit!11658 (_2!11299 lt!377901))) lt!377906)))))

(assert (=> b!242484 (= lt!377906 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun res!202493 () Bool)

(assert (=> start!52498 (=> (not res!202493) (not e!168106))))

(assert (=> start!52498 (= res!202493 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52498 e!168106))

(assert (=> start!52498 true))

(declare-fun inv!12 (BitStream!10590) Bool)

(assert (=> start!52498 (and (inv!12 thiss!1005) e!168109)))

(declare-fun b!242476 () Bool)

(assert (=> b!242476 (= e!168108 (= (bitIndex!0 (size!5834 (buf!6300 (_1!11300 lt!377899))) (currentByte!11663 (_1!11300 lt!377899)) (currentBit!11658 (_1!11300 lt!377899))) lt!377907))))

(declare-fun b!242485 () Bool)

(declare-fun res!202499 () Bool)

(assert (=> b!242485 (=> (not res!202499) (not e!168110))))

(assert (=> b!242485 (= res!202499 (isPrefixOf!0 thiss!1005 (_2!11299 lt!377901)))))

(declare-fun b!242486 () Bool)

(assert (=> b!242486 (= e!168106 (not (isPrefixOf!0 (_2!11299 lt!377901) (_2!11299 lt!377908))))))

(declare-fun lt!377905 () tuple2!20758)

(assert (=> b!242486 (= lt!377905 (reader!0 thiss!1005 (_2!11299 lt!377908)))))

(assert (=> b!242486 e!168103))

(declare-fun res!202495 () Bool)

(assert (=> b!242486 (=> (not res!202495) (not e!168103))))

(assert (=> b!242486 (= res!202495 (= (bitIndex!0 (size!5834 (buf!6300 (_1!11300 lt!377903))) (currentByte!11663 (_1!11300 lt!377903)) (currentBit!11658 (_1!11300 lt!377903))) (bitIndex!0 (size!5834 (buf!6300 (_1!11300 lt!377898))) (currentByte!11663 (_1!11300 lt!377898)) (currentBit!11658 (_1!11300 lt!377898)))))))

(declare-fun lt!377900 () Unit!17751)

(declare-fun lt!377909 () BitStream!10590)

(declare-fun readBitPrefixLemma!0 (BitStream!10590 BitStream!10590) Unit!17751)

(assert (=> b!242486 (= lt!377900 (readBitPrefixLemma!0 lt!377909 (_2!11299 lt!377908)))))

(assert (=> b!242486 (= lt!377898 (readBitPure!0 (BitStream!10591 (buf!6300 (_2!11299 lt!377908)) (currentByte!11663 thiss!1005) (currentBit!11658 thiss!1005))))))

(assert (=> b!242486 (= lt!377903 (readBitPure!0 lt!377909))))

(assert (=> b!242486 (= lt!377909 (BitStream!10591 (buf!6300 (_2!11299 lt!377901)) (currentByte!11663 thiss!1005) (currentBit!11658 thiss!1005)))))

(assert (=> b!242486 e!168107))

(declare-fun res!202491 () Bool)

(assert (=> b!242486 (=> (not res!202491) (not e!168107))))

(assert (=> b!242486 (= res!202491 (isPrefixOf!0 thiss!1005 (_2!11299 lt!377908)))))

(declare-fun lt!377911 () Unit!17751)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10590 BitStream!10590 BitStream!10590) Unit!17751)

(assert (=> b!242486 (= lt!377911 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11299 lt!377901) (_2!11299 lt!377908)))))

(assert (=> b!242486 e!168105))

(declare-fun res!202500 () Bool)

(assert (=> b!242486 (=> (not res!202500) (not e!168105))))

(assert (=> b!242486 (= res!202500 (= (size!5834 (buf!6300 (_2!11299 lt!377901))) (size!5834 (buf!6300 (_2!11299 lt!377908)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10590 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20754)

(assert (=> b!242486 (= lt!377908 (appendNBitsLoop!0 (_2!11299 lt!377901) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242486 (validate_offset_bits!1 ((_ sign_extend 32) (size!5834 (buf!6300 (_2!11299 lt!377901)))) ((_ sign_extend 32) (currentByte!11663 (_2!11299 lt!377901))) ((_ sign_extend 32) (currentBit!11658 (_2!11299 lt!377901))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377912 () Unit!17751)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10590 BitStream!10590 (_ BitVec 64) (_ BitVec 64)) Unit!17751)

(assert (=> b!242486 (= lt!377912 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11299 lt!377901) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!242486 e!168101))

(declare-fun res!202503 () Bool)

(assert (=> b!242486 (=> (not res!202503) (not e!168101))))

(assert (=> b!242486 (= res!202503 (= (size!5834 (buf!6300 thiss!1005)) (size!5834 (buf!6300 (_2!11299 lt!377901)))))))

(declare-fun appendBit!0 (BitStream!10590 Bool) tuple2!20754)

(assert (=> b!242486 (= lt!377901 (appendBit!0 thiss!1005 bit!26))))

(assert (= (and start!52498 res!202493) b!242477))

(assert (= (and b!242477 res!202496) b!242475))

(assert (= (and b!242475 res!202494) b!242486))

(assert (= (and b!242486 res!202503) b!242480))

(assert (= (and b!242480 res!202498) b!242485))

(assert (= (and b!242485 res!202499) b!242481))

(assert (= (and b!242481 res!202502) b!242476))

(assert (= (and b!242486 res!202500) b!242484))

(assert (= (and b!242484 res!202501) b!242473))

(assert (= (and b!242473 res!202497) b!242482))

(assert (= (and b!242486 res!202491) b!242478))

(assert (= (and b!242478 res!202492) b!242483))

(assert (= (and b!242486 res!202495) b!242479))

(assert (= start!52498 b!242474))

(declare-fun m!365325 () Bool)

(assert (=> b!242481 m!365325))

(assert (=> b!242481 m!365325))

(declare-fun m!365327 () Bool)

(assert (=> b!242481 m!365327))

(declare-fun m!365329 () Bool)

(assert (=> b!242484 m!365329))

(declare-fun m!365331 () Bool)

(assert (=> b!242484 m!365331))

(declare-fun m!365333 () Bool)

(assert (=> b!242483 m!365333))

(declare-fun m!365335 () Bool)

(assert (=> start!52498 m!365335))

(declare-fun m!365337 () Bool)

(assert (=> b!242485 m!365337))

(declare-fun m!365339 () Bool)

(assert (=> b!242477 m!365339))

(declare-fun m!365341 () Bool)

(assert (=> b!242486 m!365341))

(declare-fun m!365343 () Bool)

(assert (=> b!242486 m!365343))

(declare-fun m!365345 () Bool)

(assert (=> b!242486 m!365345))

(declare-fun m!365347 () Bool)

(assert (=> b!242486 m!365347))

(declare-fun m!365349 () Bool)

(assert (=> b!242486 m!365349))

(declare-fun m!365351 () Bool)

(assert (=> b!242486 m!365351))

(declare-fun m!365353 () Bool)

(assert (=> b!242486 m!365353))

(declare-fun m!365355 () Bool)

(assert (=> b!242486 m!365355))

(declare-fun m!365357 () Bool)

(assert (=> b!242486 m!365357))

(declare-fun m!365359 () Bool)

(assert (=> b!242486 m!365359))

(declare-fun m!365361 () Bool)

(assert (=> b!242486 m!365361))

(declare-fun m!365363 () Bool)

(assert (=> b!242486 m!365363))

(declare-fun m!365365 () Bool)

(assert (=> b!242486 m!365365))

(assert (=> b!242480 m!365331))

(declare-fun m!365367 () Bool)

(assert (=> b!242480 m!365367))

(declare-fun m!365369 () Bool)

(assert (=> b!242478 m!365369))

(declare-fun m!365371 () Bool)

(assert (=> b!242476 m!365371))

(declare-fun m!365373 () Bool)

(assert (=> b!242474 m!365373))

(assert (=> b!242473 m!365357))

(declare-fun m!365375 () Bool)

(assert (=> b!242482 m!365375))

(declare-fun m!365377 () Bool)

(assert (=> b!242482 m!365377))

(declare-fun m!365379 () Bool)

(assert (=> b!242482 m!365379))

(declare-fun m!365381 () Bool)

(assert (=> b!242482 m!365381))

(check-sat (not b!242481) (not b!242485) (not b!242484) (not b!242474) (not start!52498) (not b!242482) (not b!242473) (not b!242483) (not b!242476) (not b!242480) (not b!242478) (not b!242477) (not b!242486))
