; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43970 () Bool)

(assert start!43970)

(declare-fun b!209371 () Bool)

(declare-fun e!142937 () Bool)

(declare-fun e!142935 () Bool)

(assert (=> b!209371 (= e!142937 e!142935)))

(declare-fun res!175751 () Bool)

(assert (=> b!209371 (=> res!175751 e!142935)))

(declare-fun lt!327821 () (_ BitVec 64))

(declare-datatypes ((array!10468 0))(
  ( (array!10469 (arr!5531 (Array (_ BitVec 32) (_ BitVec 8))) (size!4601 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8310 0))(
  ( (BitStream!8311 (buf!5115 array!10468) (currentByte!9651 (_ BitVec 32)) (currentBit!9646 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17950 0))(
  ( (tuple2!17951 (_1!9630 BitStream!8310) (_2!9630 Bool)) )
))
(declare-fun lt!327829 () tuple2!17950)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((tuple2!17952 0))(
  ( (tuple2!17953 (_1!9631 BitStream!8310) (_2!9631 BitStream!8310)) )
))
(declare-fun lt!327826 () tuple2!17952)

(declare-fun lt!327819 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(declare-datatypes ((tuple2!17954 0))(
  ( (tuple2!17955 (_1!9632 BitStream!8310) (_2!9632 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8310 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17954)

(assert (=> b!209371 (= res!175751 (not (= (_1!9632 (readNBitsLSBFirstsLoopPure!0 (_1!9631 lt!327826) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!327821 (ite (_2!9630 lt!327829) lt!327819 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9631 lt!327826))))))

(declare-datatypes ((Unit!14913 0))(
  ( (Unit!14914) )
))
(declare-datatypes ((tuple2!17956 0))(
  ( (tuple2!17957 (_1!9633 Unit!14913) (_2!9633 BitStream!8310)) )
))
(declare-fun lt!327839 () tuple2!17956)

(declare-fun lt!327831 () tuple2!17956)

(declare-fun lt!327822 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!209371 (validate_offset_bits!1 ((_ sign_extend 32) (size!4601 (buf!5115 (_2!9633 lt!327839)))) ((_ sign_extend 32) (currentByte!9651 (_2!9633 lt!327831))) ((_ sign_extend 32) (currentBit!9646 (_2!9633 lt!327831))) lt!327822)))

(declare-fun lt!327835 () Unit!14913)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8310 array!10468 (_ BitVec 64)) Unit!14913)

(assert (=> b!209371 (= lt!327835 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9633 lt!327831) (buf!5115 (_2!9633 lt!327839)) lt!327822))))

(assert (=> b!209371 (= lt!327822 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!327838 () tuple2!17954)

(declare-fun lt!327833 () tuple2!17952)

(assert (=> b!209371 (= lt!327838 (readNBitsLSBFirstsLoopPure!0 (_1!9631 lt!327833) nBits!348 i!590 lt!327821))))

(declare-fun thiss!1204 () BitStream!8310)

(declare-fun lt!327828 () (_ BitVec 64))

(assert (=> b!209371 (validate_offset_bits!1 ((_ sign_extend 32) (size!4601 (buf!5115 (_2!9633 lt!327839)))) ((_ sign_extend 32) (currentByte!9651 thiss!1204)) ((_ sign_extend 32) (currentBit!9646 thiss!1204)) lt!327828)))

(declare-fun lt!327836 () Unit!14913)

(assert (=> b!209371 (= lt!327836 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5115 (_2!9633 lt!327839)) lt!327828))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!209371 (= lt!327821 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!327842 () Bool)

(assert (=> b!209371 (= (_2!9630 lt!327829) lt!327842)))

(declare-fun readBitPure!0 (BitStream!8310) tuple2!17950)

(assert (=> b!209371 (= lt!327829 (readBitPure!0 (_1!9631 lt!327833)))))

(declare-fun reader!0 (BitStream!8310 BitStream!8310) tuple2!17952)

(assert (=> b!209371 (= lt!327826 (reader!0 (_2!9633 lt!327831) (_2!9633 lt!327839)))))

(assert (=> b!209371 (= lt!327833 (reader!0 thiss!1204 (_2!9633 lt!327839)))))

(declare-fun e!142934 () Bool)

(assert (=> b!209371 e!142934))

(declare-fun res!175748 () Bool)

(assert (=> b!209371 (=> (not res!175748) (not e!142934))))

(declare-fun lt!327820 () tuple2!17950)

(declare-fun lt!327841 () tuple2!17950)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!209371 (= res!175748 (= (bitIndex!0 (size!4601 (buf!5115 (_1!9630 lt!327820))) (currentByte!9651 (_1!9630 lt!327820)) (currentBit!9646 (_1!9630 lt!327820))) (bitIndex!0 (size!4601 (buf!5115 (_1!9630 lt!327841))) (currentByte!9651 (_1!9630 lt!327841)) (currentBit!9646 (_1!9630 lt!327841)))))))

(declare-fun lt!327823 () Unit!14913)

(declare-fun lt!327832 () BitStream!8310)

(declare-fun readBitPrefixLemma!0 (BitStream!8310 BitStream!8310) Unit!14913)

(assert (=> b!209371 (= lt!327823 (readBitPrefixLemma!0 lt!327832 (_2!9633 lt!327839)))))

(assert (=> b!209371 (= lt!327841 (readBitPure!0 (BitStream!8311 (buf!5115 (_2!9633 lt!327839)) (currentByte!9651 thiss!1204) (currentBit!9646 thiss!1204))))))

(assert (=> b!209371 (= lt!327820 (readBitPure!0 lt!327832))))

(declare-fun e!142928 () Bool)

(assert (=> b!209371 e!142928))

(declare-fun res!175760 () Bool)

(assert (=> b!209371 (=> (not res!175760) (not e!142928))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!209371 (= res!175760 (invariant!0 (currentBit!9646 thiss!1204) (currentByte!9651 thiss!1204) (size!4601 (buf!5115 (_2!9633 lt!327831)))))))

(assert (=> b!209371 (= lt!327832 (BitStream!8311 (buf!5115 (_2!9633 lt!327831)) (currentByte!9651 thiss!1204) (currentBit!9646 thiss!1204)))))

(declare-fun b!209372 () Bool)

(declare-fun e!142932 () Bool)

(declare-fun lt!327825 () tuple2!17950)

(declare-fun lt!327840 () (_ BitVec 64))

(assert (=> b!209372 (= e!142932 (= (bitIndex!0 (size!4601 (buf!5115 (_1!9630 lt!327825))) (currentByte!9651 (_1!9630 lt!327825)) (currentBit!9646 (_1!9630 lt!327825))) lt!327840))))

(declare-fun b!209373 () Bool)

(declare-fun res!175749 () Bool)

(assert (=> b!209373 (=> res!175749 e!142935)))

(assert (=> b!209373 (= res!175749 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4601 (buf!5115 (_1!9631 lt!327833)))) ((_ sign_extend 32) (currentByte!9651 (_1!9631 lt!327833))) ((_ sign_extend 32) (currentBit!9646 (_1!9631 lt!327833))) lt!327828)))))

(declare-fun b!209374 () Bool)

(declare-fun e!142927 () Bool)

(assert (=> b!209374 (= e!142927 e!142932)))

(declare-fun res!175753 () Bool)

(assert (=> b!209374 (=> (not res!175753) (not e!142932))))

(assert (=> b!209374 (= res!175753 (and (= (_2!9630 lt!327825) lt!327842) (= (_1!9630 lt!327825) (_2!9633 lt!327831))))))

(declare-fun readerFrom!0 (BitStream!8310 (_ BitVec 32) (_ BitVec 32)) BitStream!8310)

(assert (=> b!209374 (= lt!327825 (readBitPure!0 (readerFrom!0 (_2!9633 lt!327831) (currentBit!9646 thiss!1204) (currentByte!9651 thiss!1204))))))

(declare-fun b!209375 () Bool)

(declare-fun res!175759 () Bool)

(assert (=> b!209375 (=> (not res!175759) (not e!142927))))

(declare-fun isPrefixOf!0 (BitStream!8310 BitStream!8310) Bool)

(assert (=> b!209375 (= res!175759 (isPrefixOf!0 thiss!1204 (_2!9633 lt!327831)))))

(declare-fun b!209376 () Bool)

(declare-fun res!175756 () Bool)

(assert (=> b!209376 (=> res!175756 e!142937)))

(declare-fun lt!327824 () (_ BitVec 64))

(declare-fun lt!327827 () (_ BitVec 64))

(assert (=> b!209376 (= res!175756 (or (not (= (size!4601 (buf!5115 (_2!9633 lt!327839))) (size!4601 (buf!5115 thiss!1204)))) (not (= lt!327824 (bvsub (bvadd lt!327827 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!209377 () Bool)

(declare-fun res!175752 () Bool)

(assert (=> b!209377 (=> res!175752 e!142937)))

(assert (=> b!209377 (= res!175752 (not (isPrefixOf!0 thiss!1204 (_2!9633 lt!327831))))))

(declare-fun b!209378 () Bool)

(declare-fun e!142931 () Bool)

(declare-fun e!142930 () Bool)

(assert (=> b!209378 (= e!142931 (not e!142930))))

(declare-fun res!175745 () Bool)

(assert (=> b!209378 (=> res!175745 e!142930)))

(declare-fun lt!327830 () (_ BitVec 64))

(assert (=> b!209378 (= res!175745 (not (= lt!327830 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!327827))))))

(assert (=> b!209378 (= lt!327830 (bitIndex!0 (size!4601 (buf!5115 (_2!9633 lt!327831))) (currentByte!9651 (_2!9633 lt!327831)) (currentBit!9646 (_2!9633 lt!327831))))))

(assert (=> b!209378 (= lt!327827 (bitIndex!0 (size!4601 (buf!5115 thiss!1204)) (currentByte!9651 thiss!1204) (currentBit!9646 thiss!1204)))))

(declare-fun e!142936 () Bool)

(assert (=> b!209378 e!142936))

(declare-fun res!175762 () Bool)

(assert (=> b!209378 (=> (not res!175762) (not e!142936))))

(assert (=> b!209378 (= res!175762 (= (size!4601 (buf!5115 thiss!1204)) (size!4601 (buf!5115 (_2!9633 lt!327831)))))))

(declare-fun appendBit!0 (BitStream!8310 Bool) tuple2!17956)

(assert (=> b!209378 (= lt!327831 (appendBit!0 thiss!1204 lt!327842))))

(assert (=> b!209378 (= lt!327842 (not (= (bvand v!189 lt!327819) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209378 (= lt!327819 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!209379 () Bool)

(declare-fun e!142929 () Bool)

(assert (=> b!209379 (= e!142929 e!142931)))

(declare-fun res!175757 () Bool)

(assert (=> b!209379 (=> (not res!175757) (not e!142931))))

(assert (=> b!209379 (= res!175757 (validate_offset_bits!1 ((_ sign_extend 32) (size!4601 (buf!5115 thiss!1204))) ((_ sign_extend 32) (currentByte!9651 thiss!1204)) ((_ sign_extend 32) (currentBit!9646 thiss!1204)) lt!327828))))

(assert (=> b!209379 (= lt!327828 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!209381 () Bool)

(assert (=> b!209381 (= e!142936 e!142927)))

(declare-fun res!175758 () Bool)

(assert (=> b!209381 (=> (not res!175758) (not e!142927))))

(declare-fun lt!327834 () (_ BitVec 64))

(assert (=> b!209381 (= res!175758 (= lt!327840 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!327834)))))

(assert (=> b!209381 (= lt!327840 (bitIndex!0 (size!4601 (buf!5115 (_2!9633 lt!327831))) (currentByte!9651 (_2!9633 lt!327831)) (currentBit!9646 (_2!9633 lt!327831))))))

(assert (=> b!209381 (= lt!327834 (bitIndex!0 (size!4601 (buf!5115 thiss!1204)) (currentByte!9651 thiss!1204) (currentBit!9646 thiss!1204)))))

(declare-fun b!209382 () Bool)

(declare-fun res!175750 () Bool)

(assert (=> b!209382 (=> (not res!175750) (not e!142931))))

(assert (=> b!209382 (= res!175750 (invariant!0 (currentBit!9646 thiss!1204) (currentByte!9651 thiss!1204) (size!4601 (buf!5115 thiss!1204))))))

(declare-fun b!209383 () Bool)

(assert (=> b!209383 (= e!142935 (= (bvand lt!327821 #b1111111111111111111111111111111111111111111111111111111111111111) lt!327821))))

(declare-fun b!209384 () Bool)

(declare-fun res!175746 () Bool)

(assert (=> b!209384 (=> res!175746 e!142935)))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!209384 (= res!175746 (not (= (bvand lt!327821 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!209385 () Bool)

(assert (=> b!209385 (= e!142930 e!142937)))

(declare-fun res!175755 () Bool)

(assert (=> b!209385 (=> res!175755 e!142937)))

(assert (=> b!209385 (= res!175755 (not (= lt!327824 (bvsub (bvsub (bvadd lt!327830 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!209385 (= lt!327824 (bitIndex!0 (size!4601 (buf!5115 (_2!9633 lt!327839))) (currentByte!9651 (_2!9633 lt!327839)) (currentBit!9646 (_2!9633 lt!327839))))))

(assert (=> b!209385 (isPrefixOf!0 thiss!1204 (_2!9633 lt!327839))))

(declare-fun lt!327837 () Unit!14913)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8310 BitStream!8310 BitStream!8310) Unit!14913)

(assert (=> b!209385 (= lt!327837 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9633 lt!327831) (_2!9633 lt!327839)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8310 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17956)

(assert (=> b!209385 (= lt!327839 (appendBitsLSBFirstLoopTR!0 (_2!9633 lt!327831) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!209386 () Bool)

(assert (=> b!209386 (= e!142928 (invariant!0 (currentBit!9646 thiss!1204) (currentByte!9651 thiss!1204) (size!4601 (buf!5115 (_2!9633 lt!327839)))))))

(declare-fun b!209387 () Bool)

(declare-fun res!175754 () Bool)

(assert (=> b!209387 (=> res!175754 e!142937)))

(assert (=> b!209387 (= res!175754 (not (invariant!0 (currentBit!9646 (_2!9633 lt!327839)) (currentByte!9651 (_2!9633 lt!327839)) (size!4601 (buf!5115 (_2!9633 lt!327839))))))))

(declare-fun b!209388 () Bool)

(declare-fun res!175744 () Bool)

(assert (=> b!209388 (=> res!175744 e!142935)))

(assert (=> b!209388 (= res!175744 (bvsge i!590 nBits!348))))

(declare-fun b!209389 () Bool)

(declare-fun e!142933 () Bool)

(declare-fun array_inv!4342 (array!10468) Bool)

(assert (=> b!209389 (= e!142933 (array_inv!4342 (buf!5115 thiss!1204)))))

(declare-fun b!209390 () Bool)

(declare-fun res!175761 () Bool)

(assert (=> b!209390 (=> (not res!175761) (not e!142931))))

(assert (=> b!209390 (= res!175761 (not (= i!590 nBits!348)))))

(declare-fun b!209391 () Bool)

(assert (=> b!209391 (= e!142934 (= (_2!9630 lt!327820) (_2!9630 lt!327841)))))

(declare-fun res!175747 () Bool)

(assert (=> start!43970 (=> (not res!175747) (not e!142929))))

(assert (=> start!43970 (= res!175747 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43970 e!142929))

(assert (=> start!43970 true))

(declare-fun inv!12 (BitStream!8310) Bool)

(assert (=> start!43970 (and (inv!12 thiss!1204) e!142933)))

(declare-fun b!209380 () Bool)

(declare-fun res!175763 () Bool)

(assert (=> b!209380 (=> res!175763 e!142937)))

(assert (=> b!209380 (= res!175763 (not (isPrefixOf!0 (_2!9633 lt!327831) (_2!9633 lt!327839))))))

(assert (= (and start!43970 res!175747) b!209379))

(assert (= (and b!209379 res!175757) b!209382))

(assert (= (and b!209382 res!175750) b!209390))

(assert (= (and b!209390 res!175761) b!209378))

(assert (= (and b!209378 res!175762) b!209381))

(assert (= (and b!209381 res!175758) b!209375))

(assert (= (and b!209375 res!175759) b!209374))

(assert (= (and b!209374 res!175753) b!209372))

(assert (= (and b!209378 (not res!175745)) b!209385))

(assert (= (and b!209385 (not res!175755)) b!209387))

(assert (= (and b!209387 (not res!175754)) b!209376))

(assert (= (and b!209376 (not res!175756)) b!209380))

(assert (= (and b!209380 (not res!175763)) b!209377))

(assert (= (and b!209377 (not res!175752)) b!209371))

(assert (= (and b!209371 res!175760) b!209386))

(assert (= (and b!209371 res!175748) b!209391))

(assert (= (and b!209371 (not res!175751)) b!209388))

(assert (= (and b!209388 (not res!175744)) b!209373))

(assert (= (and b!209373 (not res!175749)) b!209384))

(assert (= (and b!209384 (not res!175746)) b!209383))

(assert (= start!43970 b!209389))

(declare-fun m!322215 () Bool)

(assert (=> b!209381 m!322215))

(declare-fun m!322217 () Bool)

(assert (=> b!209381 m!322217))

(declare-fun m!322219 () Bool)

(assert (=> b!209377 m!322219))

(declare-fun m!322221 () Bool)

(assert (=> b!209374 m!322221))

(assert (=> b!209374 m!322221))

(declare-fun m!322223 () Bool)

(assert (=> b!209374 m!322223))

(declare-fun m!322225 () Bool)

(assert (=> b!209384 m!322225))

(assert (=> b!209378 m!322215))

(assert (=> b!209378 m!322217))

(declare-fun m!322227 () Bool)

(assert (=> b!209378 m!322227))

(declare-fun m!322229 () Bool)

(assert (=> b!209379 m!322229))

(declare-fun m!322231 () Bool)

(assert (=> b!209373 m!322231))

(assert (=> b!209375 m!322219))

(declare-fun m!322233 () Bool)

(assert (=> b!209380 m!322233))

(declare-fun m!322235 () Bool)

(assert (=> b!209371 m!322235))

(declare-fun m!322237 () Bool)

(assert (=> b!209371 m!322237))

(declare-fun m!322239 () Bool)

(assert (=> b!209371 m!322239))

(declare-fun m!322241 () Bool)

(assert (=> b!209371 m!322241))

(declare-fun m!322243 () Bool)

(assert (=> b!209371 m!322243))

(declare-fun m!322245 () Bool)

(assert (=> b!209371 m!322245))

(declare-fun m!322247 () Bool)

(assert (=> b!209371 m!322247))

(declare-fun m!322249 () Bool)

(assert (=> b!209371 m!322249))

(declare-fun m!322251 () Bool)

(assert (=> b!209371 m!322251))

(declare-fun m!322253 () Bool)

(assert (=> b!209371 m!322253))

(declare-fun m!322255 () Bool)

(assert (=> b!209371 m!322255))

(declare-fun m!322257 () Bool)

(assert (=> b!209371 m!322257))

(declare-fun m!322259 () Bool)

(assert (=> b!209371 m!322259))

(declare-fun m!322261 () Bool)

(assert (=> b!209371 m!322261))

(declare-fun m!322263 () Bool)

(assert (=> b!209371 m!322263))

(declare-fun m!322265 () Bool)

(assert (=> b!209371 m!322265))

(declare-fun m!322267 () Bool)

(assert (=> b!209372 m!322267))

(declare-fun m!322269 () Bool)

(assert (=> b!209387 m!322269))

(declare-fun m!322271 () Bool)

(assert (=> b!209382 m!322271))

(declare-fun m!322273 () Bool)

(assert (=> b!209385 m!322273))

(declare-fun m!322275 () Bool)

(assert (=> b!209385 m!322275))

(declare-fun m!322277 () Bool)

(assert (=> b!209385 m!322277))

(declare-fun m!322279 () Bool)

(assert (=> b!209385 m!322279))

(declare-fun m!322281 () Bool)

(assert (=> b!209386 m!322281))

(declare-fun m!322283 () Bool)

(assert (=> b!209389 m!322283))

(declare-fun m!322285 () Bool)

(assert (=> start!43970 m!322285))

(check-sat (not b!209385) (not b!209375) (not b!209377) (not b!209386) (not b!209374) (not b!209381) (not b!209389) (not start!43970) (not b!209372) (not b!209384) (not b!209373) (not b!209382) (not b!209387) (not b!209380) (not b!209378) (not b!209371) (not b!209379))
