; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54644 () Bool)

(assert start!54644)

(declare-fun b!255829 () Bool)

(declare-fun res!214478 () Bool)

(declare-fun e!177238 () Bool)

(assert (=> b!255829 (=> (not res!214478) (not e!177238))))

(declare-datatypes ((array!13791 0))(
  ( (array!13792 (arr!7037 (Array (_ BitVec 32) (_ BitVec 8))) (size!6050 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11022 0))(
  ( (BitStream!11023 (buf!6567 array!13791) (currentByte!12046 (_ BitVec 32)) (currentBit!12041 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11022)

(declare-datatypes ((Unit!18308 0))(
  ( (Unit!18309) )
))
(declare-datatypes ((tuple2!21888 0))(
  ( (tuple2!21889 (_1!11878 Unit!18308) (_2!11878 BitStream!11022)) )
))
(declare-fun lt!397304 () tuple2!21888)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!255829 (= res!214478 (invariant!0 (currentBit!12041 thiss!1005) (currentByte!12046 thiss!1005) (size!6050 (buf!6567 (_2!11878 lt!397304)))))))

(declare-fun b!255830 () Bool)

(declare-fun e!177236 () Bool)

(declare-datatypes ((tuple2!21890 0))(
  ( (tuple2!21891 (_1!11879 BitStream!11022) (_2!11879 Bool)) )
))
(declare-fun lt!397302 () tuple2!21890)

(declare-fun lt!397288 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!255830 (= e!177236 (= (bitIndex!0 (size!6050 (buf!6567 (_1!11879 lt!397302))) (currentByte!12046 (_1!11879 lt!397302)) (currentBit!12041 (_1!11879 lt!397302))) lt!397288))))

(declare-fun b!255831 () Bool)

(declare-fun res!214464 () Bool)

(declare-fun e!177235 () Bool)

(assert (=> b!255831 (=> (not res!214464) (not e!177235))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!255831 (= res!214464 (validate_offset_bits!1 ((_ sign_extend 32) (size!6050 (buf!6567 thiss!1005))) ((_ sign_extend 32) (currentByte!12046 thiss!1005)) ((_ sign_extend 32) (currentBit!12041 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!255832 () Bool)

(declare-fun e!177241 () Bool)

(declare-fun e!177237 () Bool)

(assert (=> b!255832 (= e!177241 e!177237)))

(declare-fun res!214470 () Bool)

(assert (=> b!255832 (=> res!214470 e!177237)))

(declare-fun lt!397301 () tuple2!21888)

(assert (=> b!255832 (= res!214470 (not (= (size!6050 (buf!6567 thiss!1005)) (size!6050 (buf!6567 (_2!11878 lt!397301))))))))

(declare-fun lt!397283 () tuple2!21890)

(declare-fun lt!397298 () tuple2!21890)

(declare-datatypes ((tuple2!21892 0))(
  ( (tuple2!21893 (_1!11880 BitStream!11022) (_2!11880 BitStream!11022)) )
))
(declare-fun lt!397290 () tuple2!21892)

(assert (=> b!255832 (and (= (_2!11879 lt!397283) (_2!11879 lt!397298)) (= (_1!11879 lt!397283) (_2!11880 lt!397290)))))

(declare-fun b!255833 () Bool)

(assert (=> b!255833 (= e!177238 (invariant!0 (currentBit!12041 thiss!1005) (currentByte!12046 thiss!1005) (size!6050 (buf!6567 (_2!11878 lt!397301)))))))

(declare-fun res!214477 () Bool)

(assert (=> start!54644 (=> (not res!214477) (not e!177235))))

(assert (=> start!54644 (= res!214477 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54644 e!177235))

(assert (=> start!54644 true))

(declare-fun e!177232 () Bool)

(declare-fun inv!12 (BitStream!11022) Bool)

(assert (=> start!54644 (and (inv!12 thiss!1005) e!177232)))

(declare-fun b!255834 () Bool)

(declare-fun res!214473 () Bool)

(assert (=> b!255834 (=> res!214473 e!177241)))

(declare-fun lt!397295 () tuple2!21892)

(declare-fun withMovedBitIndex!0 (BitStream!11022 (_ BitVec 64)) BitStream!11022)

(assert (=> b!255834 (= res!214473 (not (= (_1!11880 lt!397295) (withMovedBitIndex!0 (_1!11880 lt!397290) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!255835 () Bool)

(declare-fun e!177231 () Bool)

(declare-fun lt!397285 () tuple2!21890)

(declare-fun lt!397292 () tuple2!21890)

(assert (=> b!255835 (= e!177231 (= (_2!11879 lt!397285) (_2!11879 lt!397292)))))

(declare-fun b!255836 () Bool)

(declare-fun e!177239 () Bool)

(declare-fun e!177240 () Bool)

(assert (=> b!255836 (= e!177239 e!177240)))

(declare-fun res!214474 () Bool)

(assert (=> b!255836 (=> (not res!214474) (not e!177240))))

(declare-fun lt!397282 () (_ BitVec 64))

(assert (=> b!255836 (= res!214474 (= lt!397288 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!397282)))))

(assert (=> b!255836 (= lt!397288 (bitIndex!0 (size!6050 (buf!6567 (_2!11878 lt!397304))) (currentByte!12046 (_2!11878 lt!397304)) (currentBit!12041 (_2!11878 lt!397304))))))

(assert (=> b!255836 (= lt!397282 (bitIndex!0 (size!6050 (buf!6567 thiss!1005)) (currentByte!12046 thiss!1005) (currentBit!12041 thiss!1005)))))

(declare-fun b!255837 () Bool)

(declare-fun array_inv!5791 (array!13791) Bool)

(assert (=> b!255837 (= e!177232 (array_inv!5791 (buf!6567 thiss!1005)))))

(declare-fun b!255838 () Bool)

(declare-fun res!214476 () Bool)

(assert (=> b!255838 (=> (not res!214476) (not e!177235))))

(assert (=> b!255838 (= res!214476 (bvslt from!289 nBits!297))))

(declare-fun b!255839 () Bool)

(declare-fun e!177234 () Bool)

(declare-fun lt!397289 () tuple2!21890)

(declare-fun lt!397303 () tuple2!21892)

(assert (=> b!255839 (= e!177234 (not (or (not (_2!11879 lt!397289)) (not (= (_1!11879 lt!397289) (_2!11880 lt!397303))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!11022 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21890)

(assert (=> b!255839 (= lt!397289 (checkBitsLoopPure!0 (_1!11880 lt!397303) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!397293 () (_ BitVec 64))

(assert (=> b!255839 (validate_offset_bits!1 ((_ sign_extend 32) (size!6050 (buf!6567 (_2!11878 lt!397301)))) ((_ sign_extend 32) (currentByte!12046 (_2!11878 lt!397304))) ((_ sign_extend 32) (currentBit!12041 (_2!11878 lt!397304))) lt!397293)))

(declare-fun lt!397286 () Unit!18308)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!11022 array!13791 (_ BitVec 64)) Unit!18308)

(assert (=> b!255839 (= lt!397286 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11878 lt!397304) (buf!6567 (_2!11878 lt!397301)) lt!397293))))

(declare-fun reader!0 (BitStream!11022 BitStream!11022) tuple2!21892)

(assert (=> b!255839 (= lt!397303 (reader!0 (_2!11878 lt!397304) (_2!11878 lt!397301)))))

(declare-fun b!255840 () Bool)

(assert (=> b!255840 (= e!177240 e!177236)))

(declare-fun res!214475 () Bool)

(assert (=> b!255840 (=> (not res!214475) (not e!177236))))

(assert (=> b!255840 (= res!214475 (and (= (_2!11879 lt!397302) bit!26) (= (_1!11879 lt!397302) (_2!11878 lt!397304))))))

(declare-fun readBitPure!0 (BitStream!11022) tuple2!21890)

(declare-fun readerFrom!0 (BitStream!11022 (_ BitVec 32) (_ BitVec 32)) BitStream!11022)

(assert (=> b!255840 (= lt!397302 (readBitPure!0 (readerFrom!0 (_2!11878 lt!397304) (currentBit!12041 thiss!1005) (currentByte!12046 thiss!1005))))))

(declare-fun b!255841 () Bool)

(assert (=> b!255841 (= e!177235 (not e!177241))))

(declare-fun res!214469 () Bool)

(assert (=> b!255841 (=> res!214469 e!177241)))

(assert (=> b!255841 (= res!214469 (not (= (_1!11879 lt!397298) (_2!11880 lt!397295))))))

(assert (=> b!255841 (= lt!397298 (checkBitsLoopPure!0 (_1!11880 lt!397295) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!397299 () (_ BitVec 64))

(assert (=> b!255841 (validate_offset_bits!1 ((_ sign_extend 32) (size!6050 (buf!6567 (_2!11878 lt!397301)))) ((_ sign_extend 32) (currentByte!12046 (_2!11878 lt!397304))) ((_ sign_extend 32) (currentBit!12041 (_2!11878 lt!397304))) lt!397299)))

(declare-fun lt!397284 () Unit!18308)

(assert (=> b!255841 (= lt!397284 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11878 lt!397304) (buf!6567 (_2!11878 lt!397301)) lt!397299))))

(assert (=> b!255841 (= lt!397283 (checkBitsLoopPure!0 (_1!11880 lt!397290) nBits!297 bit!26 from!289))))

(assert (=> b!255841 (validate_offset_bits!1 ((_ sign_extend 32) (size!6050 (buf!6567 (_2!11878 lt!397301)))) ((_ sign_extend 32) (currentByte!12046 thiss!1005)) ((_ sign_extend 32) (currentBit!12041 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!397297 () Unit!18308)

(assert (=> b!255841 (= lt!397297 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6567 (_2!11878 lt!397301)) (bvsub nBits!297 from!289)))))

(assert (=> b!255841 (= (_2!11879 (readBitPure!0 (_1!11880 lt!397290))) bit!26)))

(assert (=> b!255841 (= lt!397295 (reader!0 (_2!11878 lt!397304) (_2!11878 lt!397301)))))

(assert (=> b!255841 (= lt!397290 (reader!0 thiss!1005 (_2!11878 lt!397301)))))

(assert (=> b!255841 e!177231))

(declare-fun res!214467 () Bool)

(assert (=> b!255841 (=> (not res!214467) (not e!177231))))

(assert (=> b!255841 (= res!214467 (= (bitIndex!0 (size!6050 (buf!6567 (_1!11879 lt!397285))) (currentByte!12046 (_1!11879 lt!397285)) (currentBit!12041 (_1!11879 lt!397285))) (bitIndex!0 (size!6050 (buf!6567 (_1!11879 lt!397292))) (currentByte!12046 (_1!11879 lt!397292)) (currentBit!12041 (_1!11879 lt!397292)))))))

(declare-fun lt!397291 () Unit!18308)

(declare-fun lt!397305 () BitStream!11022)

(declare-fun readBitPrefixLemma!0 (BitStream!11022 BitStream!11022) Unit!18308)

(assert (=> b!255841 (= lt!397291 (readBitPrefixLemma!0 lt!397305 (_2!11878 lt!397301)))))

(assert (=> b!255841 (= lt!397292 (readBitPure!0 (BitStream!11023 (buf!6567 (_2!11878 lt!397301)) (currentByte!12046 thiss!1005) (currentBit!12041 thiss!1005))))))

(assert (=> b!255841 (= lt!397285 (readBitPure!0 lt!397305))))

(assert (=> b!255841 (= lt!397305 (BitStream!11023 (buf!6567 (_2!11878 lt!397304)) (currentByte!12046 thiss!1005) (currentBit!12041 thiss!1005)))))

(assert (=> b!255841 e!177238))

(declare-fun res!214472 () Bool)

(assert (=> b!255841 (=> (not res!214472) (not e!177238))))

(declare-fun isPrefixOf!0 (BitStream!11022 BitStream!11022) Bool)

(assert (=> b!255841 (= res!214472 (isPrefixOf!0 thiss!1005 (_2!11878 lt!397301)))))

(declare-fun lt!397296 () Unit!18308)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11022 BitStream!11022 BitStream!11022) Unit!18308)

(assert (=> b!255841 (= lt!397296 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11878 lt!397304) (_2!11878 lt!397301)))))

(declare-fun e!177233 () Bool)

(assert (=> b!255841 e!177233))

(declare-fun res!214471 () Bool)

(assert (=> b!255841 (=> (not res!214471) (not e!177233))))

(assert (=> b!255841 (= res!214471 (= (size!6050 (buf!6567 (_2!11878 lt!397304))) (size!6050 (buf!6567 (_2!11878 lt!397301)))))))

(declare-fun appendNBitsLoop!0 (BitStream!11022 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21888)

(assert (=> b!255841 (= lt!397301 (appendNBitsLoop!0 (_2!11878 lt!397304) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255841 (validate_offset_bits!1 ((_ sign_extend 32) (size!6050 (buf!6567 (_2!11878 lt!397304)))) ((_ sign_extend 32) (currentByte!12046 (_2!11878 lt!397304))) ((_ sign_extend 32) (currentBit!12041 (_2!11878 lt!397304))) lt!397299)))

(assert (=> b!255841 (= lt!397299 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!397287 () Unit!18308)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11022 BitStream!11022 (_ BitVec 64) (_ BitVec 64)) Unit!18308)

(assert (=> b!255841 (= lt!397287 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11878 lt!397304) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!255841 e!177239))

(declare-fun res!214466 () Bool)

(assert (=> b!255841 (=> (not res!214466) (not e!177239))))

(assert (=> b!255841 (= res!214466 (= (size!6050 (buf!6567 thiss!1005)) (size!6050 (buf!6567 (_2!11878 lt!397304)))))))

(declare-fun appendBit!0 (BitStream!11022 Bool) tuple2!21888)

(assert (=> b!255841 (= lt!397304 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!255842 () Bool)

(assert (=> b!255842 (= e!177237 true)))

(declare-fun lt!397300 () (_ BitVec 64))

(assert (=> b!255842 (= lt!397300 (bitIndex!0 (size!6050 (buf!6567 (_2!11878 lt!397301))) (currentByte!12046 (_2!11878 lt!397301)) (currentBit!12041 (_2!11878 lt!397301))))))

(declare-fun lt!397294 () (_ BitVec 64))

(assert (=> b!255842 (= lt!397294 (bitIndex!0 (size!6050 (buf!6567 thiss!1005)) (currentByte!12046 thiss!1005) (currentBit!12041 thiss!1005)))))

(declare-fun b!255843 () Bool)

(declare-fun res!214465 () Bool)

(assert (=> b!255843 (=> (not res!214465) (not e!177234))))

(assert (=> b!255843 (= res!214465 (isPrefixOf!0 (_2!11878 lt!397304) (_2!11878 lt!397301)))))

(declare-fun b!255844 () Bool)

(assert (=> b!255844 (= e!177233 e!177234)))

(declare-fun res!214468 () Bool)

(assert (=> b!255844 (=> (not res!214468) (not e!177234))))

(assert (=> b!255844 (= res!214468 (= (bitIndex!0 (size!6050 (buf!6567 (_2!11878 lt!397301))) (currentByte!12046 (_2!11878 lt!397301)) (currentBit!12041 (_2!11878 lt!397301))) (bvadd (bitIndex!0 (size!6050 (buf!6567 (_2!11878 lt!397304))) (currentByte!12046 (_2!11878 lt!397304)) (currentBit!12041 (_2!11878 lt!397304))) lt!397293)))))

(assert (=> b!255844 (= lt!397293 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!255845 () Bool)

(declare-fun res!214479 () Bool)

(assert (=> b!255845 (=> (not res!214479) (not e!177240))))

(assert (=> b!255845 (= res!214479 (isPrefixOf!0 thiss!1005 (_2!11878 lt!397304)))))

(assert (= (and start!54644 res!214477) b!255831))

(assert (= (and b!255831 res!214464) b!255838))

(assert (= (and b!255838 res!214476) b!255841))

(assert (= (and b!255841 res!214466) b!255836))

(assert (= (and b!255836 res!214474) b!255845))

(assert (= (and b!255845 res!214479) b!255840))

(assert (= (and b!255840 res!214475) b!255830))

(assert (= (and b!255841 res!214471) b!255844))

(assert (= (and b!255844 res!214468) b!255843))

(assert (= (and b!255843 res!214465) b!255839))

(assert (= (and b!255841 res!214472) b!255829))

(assert (= (and b!255829 res!214478) b!255833))

(assert (= (and b!255841 res!214467) b!255835))

(assert (= (and b!255841 (not res!214469)) b!255834))

(assert (= (and b!255834 (not res!214473)) b!255832))

(assert (= (and b!255832 (not res!214470)) b!255842))

(assert (= start!54644 b!255837))

(declare-fun m!385355 () Bool)

(assert (=> b!255831 m!385355))

(declare-fun m!385357 () Bool)

(assert (=> b!255830 m!385357))

(declare-fun m!385359 () Bool)

(assert (=> b!255833 m!385359))

(declare-fun m!385361 () Bool)

(assert (=> b!255839 m!385361))

(declare-fun m!385363 () Bool)

(assert (=> b!255839 m!385363))

(declare-fun m!385365 () Bool)

(assert (=> b!255839 m!385365))

(declare-fun m!385367 () Bool)

(assert (=> b!255839 m!385367))

(declare-fun m!385369 () Bool)

(assert (=> b!255829 m!385369))

(declare-fun m!385371 () Bool)

(assert (=> b!255841 m!385371))

(declare-fun m!385373 () Bool)

(assert (=> b!255841 m!385373))

(declare-fun m!385375 () Bool)

(assert (=> b!255841 m!385375))

(declare-fun m!385377 () Bool)

(assert (=> b!255841 m!385377))

(declare-fun m!385379 () Bool)

(assert (=> b!255841 m!385379))

(declare-fun m!385381 () Bool)

(assert (=> b!255841 m!385381))

(declare-fun m!385383 () Bool)

(assert (=> b!255841 m!385383))

(declare-fun m!385385 () Bool)

(assert (=> b!255841 m!385385))

(assert (=> b!255841 m!385367))

(declare-fun m!385387 () Bool)

(assert (=> b!255841 m!385387))

(declare-fun m!385389 () Bool)

(assert (=> b!255841 m!385389))

(declare-fun m!385391 () Bool)

(assert (=> b!255841 m!385391))

(declare-fun m!385393 () Bool)

(assert (=> b!255841 m!385393))

(declare-fun m!385395 () Bool)

(assert (=> b!255841 m!385395))

(declare-fun m!385397 () Bool)

(assert (=> b!255841 m!385397))

(declare-fun m!385399 () Bool)

(assert (=> b!255841 m!385399))

(declare-fun m!385401 () Bool)

(assert (=> b!255841 m!385401))

(declare-fun m!385403 () Bool)

(assert (=> b!255841 m!385403))

(declare-fun m!385405 () Bool)

(assert (=> b!255841 m!385405))

(declare-fun m!385407 () Bool)

(assert (=> b!255841 m!385407))

(declare-fun m!385409 () Bool)

(assert (=> start!54644 m!385409))

(declare-fun m!385411 () Bool)

(assert (=> b!255843 m!385411))

(declare-fun m!385413 () Bool)

(assert (=> b!255840 m!385413))

(assert (=> b!255840 m!385413))

(declare-fun m!385415 () Bool)

(assert (=> b!255840 m!385415))

(declare-fun m!385417 () Bool)

(assert (=> b!255836 m!385417))

(declare-fun m!385419 () Bool)

(assert (=> b!255836 m!385419))

(declare-fun m!385421 () Bool)

(assert (=> b!255837 m!385421))

(declare-fun m!385423 () Bool)

(assert (=> b!255834 m!385423))

(declare-fun m!385425 () Bool)

(assert (=> b!255844 m!385425))

(assert (=> b!255844 m!385417))

(declare-fun m!385427 () Bool)

(assert (=> b!255845 m!385427))

(assert (=> b!255842 m!385425))

(assert (=> b!255842 m!385419))

(check-sat (not b!255836) (not b!255837) (not b!255842) (not b!255845) (not b!255829) (not b!255843) (not b!255839) (not b!255841) (not b!255834) (not b!255840) (not b!255833) (not start!54644) (not b!255844) (not b!255831) (not b!255830))
