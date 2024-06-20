; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52492 () Bool)

(assert start!52492)

(declare-fun b!242347 () Bool)

(declare-fun e!168019 () Bool)

(declare-fun e!168012 () Bool)

(assert (=> b!242347 (= e!168019 e!168012)))

(declare-fun res!202386 () Bool)

(assert (=> b!242347 (=> (not res!202386) (not e!168012))))

(declare-fun lt!377759 () (_ BitVec 64))

(declare-fun lt!377768 () (_ BitVec 64))

(assert (=> b!242347 (= res!202386 (= lt!377759 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377768)))))

(declare-datatypes ((array!13303 0))(
  ( (array!13304 (arr!6818 (Array (_ BitVec 32) (_ BitVec 8))) (size!5831 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10584 0))(
  ( (BitStream!10585 (buf!6297 array!13303) (currentByte!11660 (_ BitVec 32)) (currentBit!11655 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17745 0))(
  ( (Unit!17746) )
))
(declare-datatypes ((tuple2!20736 0))(
  ( (tuple2!20737 (_1!11290 Unit!17745) (_2!11290 BitStream!10584)) )
))
(declare-fun lt!377772 () tuple2!20736)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!242347 (= lt!377759 (bitIndex!0 (size!5831 (buf!6297 (_2!11290 lt!377772))) (currentByte!11660 (_2!11290 lt!377772)) (currentBit!11655 (_2!11290 lt!377772))))))

(declare-fun thiss!1005 () BitStream!10584)

(assert (=> b!242347 (= lt!377768 (bitIndex!0 (size!5831 (buf!6297 thiss!1005)) (currentByte!11660 thiss!1005) (currentBit!11655 thiss!1005)))))

(declare-fun res!202381 () Bool)

(declare-fun e!168011 () Bool)

(assert (=> start!52492 (=> (not res!202381) (not e!168011))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!52492 (= res!202381 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52492 e!168011))

(assert (=> start!52492 true))

(declare-fun e!168014 () Bool)

(declare-fun inv!12 (BitStream!10584) Bool)

(assert (=> start!52492 (and (inv!12 thiss!1005) e!168014)))

(declare-fun b!242348 () Bool)

(declare-fun e!168013 () Bool)

(declare-fun e!168018 () Bool)

(assert (=> b!242348 (= e!168013 e!168018)))

(declare-fun res!202375 () Bool)

(assert (=> b!242348 (=> (not res!202375) (not e!168018))))

(declare-fun lt!377770 () tuple2!20736)

(declare-fun lt!377765 () (_ BitVec 64))

(assert (=> b!242348 (= res!202375 (= (bitIndex!0 (size!5831 (buf!6297 (_2!11290 lt!377770))) (currentByte!11660 (_2!11290 lt!377770)) (currentBit!11655 (_2!11290 lt!377770))) (bvadd (bitIndex!0 (size!5831 (buf!6297 (_2!11290 lt!377772))) (currentByte!11660 (_2!11290 lt!377772)) (currentBit!11655 (_2!11290 lt!377772))) lt!377765)))))

(assert (=> b!242348 (= lt!377765 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!242349 () Bool)

(assert (=> b!242349 (= e!168011 (not true))))

(declare-fun e!168015 () Bool)

(assert (=> b!242349 e!168015))

(declare-fun res!202385 () Bool)

(assert (=> b!242349 (=> (not res!202385) (not e!168015))))

(declare-datatypes ((tuple2!20738 0))(
  ( (tuple2!20739 (_1!11291 BitStream!10584) (_2!11291 Bool)) )
))
(declare-fun lt!377758 () tuple2!20738)

(declare-fun lt!377761 () tuple2!20738)

(assert (=> b!242349 (= res!202385 (= (bitIndex!0 (size!5831 (buf!6297 (_1!11291 lt!377758))) (currentByte!11660 (_1!11291 lt!377758)) (currentBit!11655 (_1!11291 lt!377758))) (bitIndex!0 (size!5831 (buf!6297 (_1!11291 lt!377761))) (currentByte!11660 (_1!11291 lt!377761)) (currentBit!11655 (_1!11291 lt!377761)))))))

(declare-fun lt!377762 () Unit!17745)

(declare-fun lt!377764 () BitStream!10584)

(declare-fun readBitPrefixLemma!0 (BitStream!10584 BitStream!10584) Unit!17745)

(assert (=> b!242349 (= lt!377762 (readBitPrefixLemma!0 lt!377764 (_2!11290 lt!377770)))))

(declare-fun readBitPure!0 (BitStream!10584) tuple2!20738)

(assert (=> b!242349 (= lt!377761 (readBitPure!0 (BitStream!10585 (buf!6297 (_2!11290 lt!377770)) (currentByte!11660 thiss!1005) (currentBit!11655 thiss!1005))))))

(assert (=> b!242349 (= lt!377758 (readBitPure!0 lt!377764))))

(assert (=> b!242349 (= lt!377764 (BitStream!10585 (buf!6297 (_2!11290 lt!377772)) (currentByte!11660 thiss!1005) (currentBit!11655 thiss!1005)))))

(declare-fun e!168020 () Bool)

(assert (=> b!242349 e!168020))

(declare-fun res!202378 () Bool)

(assert (=> b!242349 (=> (not res!202378) (not e!168020))))

(declare-fun isPrefixOf!0 (BitStream!10584 BitStream!10584) Bool)

(assert (=> b!242349 (= res!202378 (isPrefixOf!0 thiss!1005 (_2!11290 lt!377770)))))

(declare-fun lt!377760 () Unit!17745)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10584 BitStream!10584 BitStream!10584) Unit!17745)

(assert (=> b!242349 (= lt!377760 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11290 lt!377772) (_2!11290 lt!377770)))))

(assert (=> b!242349 e!168013))

(declare-fun res!202382 () Bool)

(assert (=> b!242349 (=> (not res!202382) (not e!168013))))

(assert (=> b!242349 (= res!202382 (= (size!5831 (buf!6297 (_2!11290 lt!377772))) (size!5831 (buf!6297 (_2!11290 lt!377770)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10584 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20736)

(assert (=> b!242349 (= lt!377770 (appendNBitsLoop!0 (_2!11290 lt!377772) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242349 (validate_offset_bits!1 ((_ sign_extend 32) (size!5831 (buf!6297 (_2!11290 lt!377772)))) ((_ sign_extend 32) (currentByte!11660 (_2!11290 lt!377772))) ((_ sign_extend 32) (currentBit!11655 (_2!11290 lt!377772))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377766 () Unit!17745)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10584 BitStream!10584 (_ BitVec 64) (_ BitVec 64)) Unit!17745)

(assert (=> b!242349 (= lt!377766 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11290 lt!377772) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!242349 e!168019))

(declare-fun res!202384 () Bool)

(assert (=> b!242349 (=> (not res!202384) (not e!168019))))

(assert (=> b!242349 (= res!202384 (= (size!5831 (buf!6297 thiss!1005)) (size!5831 (buf!6297 (_2!11290 lt!377772)))))))

(declare-fun appendBit!0 (BitStream!10584 Bool) tuple2!20736)

(assert (=> b!242349 (= lt!377772 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!242350 () Bool)

(declare-fun res!202380 () Bool)

(assert (=> b!242350 (=> (not res!202380) (not e!168018))))

(assert (=> b!242350 (= res!202380 (isPrefixOf!0 (_2!11290 lt!377772) (_2!11290 lt!377770)))))

(declare-fun b!242351 () Bool)

(declare-fun lt!377769 () tuple2!20738)

(declare-datatypes ((tuple2!20740 0))(
  ( (tuple2!20741 (_1!11292 BitStream!10584) (_2!11292 BitStream!10584)) )
))
(declare-fun lt!377763 () tuple2!20740)

(assert (=> b!242351 (= e!168018 (not (or (not (_2!11291 lt!377769)) (not (= (_1!11291 lt!377769) (_2!11292 lt!377763))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10584 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20738)

(assert (=> b!242351 (= lt!377769 (checkBitsLoopPure!0 (_1!11292 lt!377763) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242351 (validate_offset_bits!1 ((_ sign_extend 32) (size!5831 (buf!6297 (_2!11290 lt!377770)))) ((_ sign_extend 32) (currentByte!11660 (_2!11290 lt!377772))) ((_ sign_extend 32) (currentBit!11655 (_2!11290 lt!377772))) lt!377765)))

(declare-fun lt!377767 () Unit!17745)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10584 array!13303 (_ BitVec 64)) Unit!17745)

(assert (=> b!242351 (= lt!377767 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11290 lt!377772) (buf!6297 (_2!11290 lt!377770)) lt!377765))))

(declare-fun reader!0 (BitStream!10584 BitStream!10584) tuple2!20740)

(assert (=> b!242351 (= lt!377763 (reader!0 (_2!11290 lt!377772) (_2!11290 lt!377770)))))

(declare-fun b!242352 () Bool)

(declare-fun res!202377 () Bool)

(assert (=> b!242352 (=> (not res!202377) (not e!168011))))

(assert (=> b!242352 (= res!202377 (bvslt from!289 nBits!297))))

(declare-fun b!242353 () Bool)

(declare-fun res!202374 () Bool)

(assert (=> b!242353 (=> (not res!202374) (not e!168012))))

(assert (=> b!242353 (= res!202374 (isPrefixOf!0 thiss!1005 (_2!11290 lt!377772)))))

(declare-fun b!242354 () Bool)

(declare-fun e!168017 () Bool)

(declare-fun lt!377771 () tuple2!20738)

(assert (=> b!242354 (= e!168017 (= (bitIndex!0 (size!5831 (buf!6297 (_1!11291 lt!377771))) (currentByte!11660 (_1!11291 lt!377771)) (currentBit!11655 (_1!11291 lt!377771))) lt!377759))))

(declare-fun b!242355 () Bool)

(declare-fun array_inv!5572 (array!13303) Bool)

(assert (=> b!242355 (= e!168014 (array_inv!5572 (buf!6297 thiss!1005)))))

(declare-fun b!242356 () Bool)

(declare-fun res!202383 () Bool)

(assert (=> b!242356 (=> (not res!202383) (not e!168020))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242356 (= res!202383 (invariant!0 (currentBit!11655 thiss!1005) (currentByte!11660 thiss!1005) (size!5831 (buf!6297 (_2!11290 lt!377772)))))))

(declare-fun b!242357 () Bool)

(assert (=> b!242357 (= e!168020 (invariant!0 (currentBit!11655 thiss!1005) (currentByte!11660 thiss!1005) (size!5831 (buf!6297 (_2!11290 lt!377770)))))))

(declare-fun b!242358 () Bool)

(declare-fun res!202379 () Bool)

(assert (=> b!242358 (=> (not res!202379) (not e!168011))))

(assert (=> b!242358 (= res!202379 (validate_offset_bits!1 ((_ sign_extend 32) (size!5831 (buf!6297 thiss!1005))) ((_ sign_extend 32) (currentByte!11660 thiss!1005)) ((_ sign_extend 32) (currentBit!11655 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!242359 () Bool)

(assert (=> b!242359 (= e!168012 e!168017)))

(declare-fun res!202376 () Bool)

(assert (=> b!242359 (=> (not res!202376) (not e!168017))))

(assert (=> b!242359 (= res!202376 (and (= (_2!11291 lt!377771) bit!26) (= (_1!11291 lt!377771) (_2!11290 lt!377772))))))

(declare-fun readerFrom!0 (BitStream!10584 (_ BitVec 32) (_ BitVec 32)) BitStream!10584)

(assert (=> b!242359 (= lt!377771 (readBitPure!0 (readerFrom!0 (_2!11290 lt!377772) (currentBit!11655 thiss!1005) (currentByte!11660 thiss!1005))))))

(declare-fun b!242360 () Bool)

(assert (=> b!242360 (= e!168015 (= (_2!11291 lt!377758) (_2!11291 lt!377761)))))

(assert (= (and start!52492 res!202381) b!242358))

(assert (= (and b!242358 res!202379) b!242352))

(assert (= (and b!242352 res!202377) b!242349))

(assert (= (and b!242349 res!202384) b!242347))

(assert (= (and b!242347 res!202386) b!242353))

(assert (= (and b!242353 res!202374) b!242359))

(assert (= (and b!242359 res!202376) b!242354))

(assert (= (and b!242349 res!202382) b!242348))

(assert (= (and b!242348 res!202375) b!242350))

(assert (= (and b!242350 res!202380) b!242351))

(assert (= (and b!242349 res!202378) b!242356))

(assert (= (and b!242356 res!202383) b!242357))

(assert (= (and b!242349 res!202385) b!242360))

(assert (= start!52492 b!242355))

(declare-fun m!365155 () Bool)

(assert (=> b!242358 m!365155))

(declare-fun m!365157 () Bool)

(assert (=> b!242355 m!365157))

(declare-fun m!365159 () Bool)

(assert (=> b!242356 m!365159))

(declare-fun m!365161 () Bool)

(assert (=> b!242354 m!365161))

(declare-fun m!365163 () Bool)

(assert (=> b!242359 m!365163))

(assert (=> b!242359 m!365163))

(declare-fun m!365165 () Bool)

(assert (=> b!242359 m!365165))

(declare-fun m!365167 () Bool)

(assert (=> b!242348 m!365167))

(declare-fun m!365169 () Bool)

(assert (=> b!242348 m!365169))

(assert (=> b!242347 m!365169))

(declare-fun m!365171 () Bool)

(assert (=> b!242347 m!365171))

(declare-fun m!365173 () Bool)

(assert (=> b!242353 m!365173))

(declare-fun m!365175 () Bool)

(assert (=> b!242350 m!365175))

(declare-fun m!365177 () Bool)

(assert (=> b!242351 m!365177))

(declare-fun m!365179 () Bool)

(assert (=> b!242351 m!365179))

(declare-fun m!365181 () Bool)

(assert (=> b!242351 m!365181))

(declare-fun m!365183 () Bool)

(assert (=> b!242351 m!365183))

(declare-fun m!365185 () Bool)

(assert (=> start!52492 m!365185))

(declare-fun m!365187 () Bool)

(assert (=> b!242357 m!365187))

(declare-fun m!365189 () Bool)

(assert (=> b!242349 m!365189))

(declare-fun m!365191 () Bool)

(assert (=> b!242349 m!365191))

(declare-fun m!365193 () Bool)

(assert (=> b!242349 m!365193))

(declare-fun m!365195 () Bool)

(assert (=> b!242349 m!365195))

(declare-fun m!365197 () Bool)

(assert (=> b!242349 m!365197))

(declare-fun m!365199 () Bool)

(assert (=> b!242349 m!365199))

(declare-fun m!365201 () Bool)

(assert (=> b!242349 m!365201))

(declare-fun m!365203 () Bool)

(assert (=> b!242349 m!365203))

(declare-fun m!365205 () Bool)

(assert (=> b!242349 m!365205))

(declare-fun m!365207 () Bool)

(assert (=> b!242349 m!365207))

(declare-fun m!365209 () Bool)

(assert (=> b!242349 m!365209))

(check-sat (not b!242351) (not b!242353) (not b!242347) (not b!242359) (not b!242348) (not b!242357) (not b!242356) (not start!52492) (not b!242350) (not b!242358) (not b!242354) (not b!242349) (not b!242355))
