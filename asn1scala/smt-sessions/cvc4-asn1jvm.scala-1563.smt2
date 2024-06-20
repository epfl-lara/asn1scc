; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43972 () Bool)

(assert start!43972)

(declare-fun b!209434 () Bool)

(declare-fun e!142964 () Bool)

(declare-fun e!142971 () Bool)

(assert (=> b!209434 (= e!142964 (not e!142971))))

(declare-fun res!175823 () Bool)

(assert (=> b!209434 (=> res!175823 e!142971)))

(declare-fun lt!327906 () (_ BitVec 64))

(declare-fun lt!327902 () (_ BitVec 64))

(assert (=> b!209434 (= res!175823 (not (= lt!327906 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!327902))))))

(declare-datatypes ((array!10470 0))(
  ( (array!10471 (arr!5532 (Array (_ BitVec 32) (_ BitVec 8))) (size!4602 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8312 0))(
  ( (BitStream!8313 (buf!5116 array!10470) (currentByte!9652 (_ BitVec 32)) (currentBit!9647 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14915 0))(
  ( (Unit!14916) )
))
(declare-datatypes ((tuple2!17958 0))(
  ( (tuple2!17959 (_1!9634 Unit!14915) (_2!9634 BitStream!8312)) )
))
(declare-fun lt!327895 () tuple2!17958)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!209434 (= lt!327906 (bitIndex!0 (size!4602 (buf!5116 (_2!9634 lt!327895))) (currentByte!9652 (_2!9634 lt!327895)) (currentBit!9647 (_2!9634 lt!327895))))))

(declare-fun thiss!1204 () BitStream!8312)

(assert (=> b!209434 (= lt!327902 (bitIndex!0 (size!4602 (buf!5116 thiss!1204)) (currentByte!9652 thiss!1204) (currentBit!9647 thiss!1204)))))

(declare-fun e!142968 () Bool)

(assert (=> b!209434 e!142968))

(declare-fun res!175819 () Bool)

(assert (=> b!209434 (=> (not res!175819) (not e!142968))))

(assert (=> b!209434 (= res!175819 (= (size!4602 (buf!5116 thiss!1204)) (size!4602 (buf!5116 (_2!9634 lt!327895)))))))

(declare-fun lt!327907 () Bool)

(declare-fun appendBit!0 (BitStream!8312 Bool) tuple2!17958)

(assert (=> b!209434 (= lt!327895 (appendBit!0 thiss!1204 lt!327907))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!327908 () (_ BitVec 64))

(assert (=> b!209434 (= lt!327907 (not (= (bvand v!189 lt!327908) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!209434 (= lt!327908 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!209435 () Bool)

(declare-fun e!142972 () Bool)

(declare-fun array_inv!4343 (array!10470) Bool)

(assert (=> b!209435 (= e!142972 (array_inv!4343 (buf!5116 thiss!1204)))))

(declare-fun b!209436 () Bool)

(declare-fun res!175811 () Bool)

(declare-fun e!142966 () Bool)

(assert (=> b!209436 (=> res!175811 e!142966)))

(declare-datatypes ((tuple2!17960 0))(
  ( (tuple2!17961 (_1!9635 BitStream!8312) (_2!9635 BitStream!8312)) )
))
(declare-fun lt!327896 () tuple2!17960)

(declare-fun lt!327904 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!209436 (= res!175811 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4602 (buf!5116 (_1!9635 lt!327896)))) ((_ sign_extend 32) (currentByte!9652 (_1!9635 lt!327896))) ((_ sign_extend 32) (currentBit!9647 (_1!9635 lt!327896))) lt!327904)))))

(declare-fun b!209437 () Bool)

(declare-fun res!175809 () Bool)

(assert (=> b!209437 (=> res!175809 e!142966)))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!209437 (= res!175809 (bvsge i!590 nBits!348))))

(declare-fun res!175813 () Bool)

(declare-fun e!142973 () Bool)

(assert (=> start!43972 (=> (not res!175813) (not e!142973))))

(assert (=> start!43972 (= res!175813 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43972 e!142973))

(assert (=> start!43972 true))

(declare-fun inv!12 (BitStream!8312) Bool)

(assert (=> start!43972 (and (inv!12 thiss!1204) e!142972)))

(declare-fun b!209438 () Bool)

(declare-fun e!142965 () Bool)

(declare-datatypes ((tuple2!17962 0))(
  ( (tuple2!17963 (_1!9636 BitStream!8312) (_2!9636 Bool)) )
))
(declare-fun lt!327911 () tuple2!17962)

(declare-fun lt!327891 () (_ BitVec 64))

(assert (=> b!209438 (= e!142965 (= (bitIndex!0 (size!4602 (buf!5116 (_1!9636 lt!327911))) (currentByte!9652 (_1!9636 lt!327911)) (currentBit!9647 (_1!9636 lt!327911))) lt!327891))))

(declare-fun b!209439 () Bool)

(declare-fun e!142970 () Bool)

(assert (=> b!209439 (= e!142970 e!142965)))

(declare-fun res!175820 () Bool)

(assert (=> b!209439 (=> (not res!175820) (not e!142965))))

(assert (=> b!209439 (= res!175820 (and (= (_2!9636 lt!327911) lt!327907) (= (_1!9636 lt!327911) (_2!9634 lt!327895))))))

(declare-fun readBitPure!0 (BitStream!8312) tuple2!17962)

(declare-fun readerFrom!0 (BitStream!8312 (_ BitVec 32) (_ BitVec 32)) BitStream!8312)

(assert (=> b!209439 (= lt!327911 (readBitPure!0 (readerFrom!0 (_2!9634 lt!327895) (currentBit!9647 thiss!1204) (currentByte!9652 thiss!1204))))))

(declare-fun b!209440 () Bool)

(declare-fun res!175804 () Bool)

(assert (=> b!209440 (=> res!175804 e!142966)))

(declare-fun lt!327913 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!209440 (= res!175804 (not (= (bvand lt!327913 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!209441 () Bool)

(declare-fun res!175821 () Bool)

(declare-fun e!142974 () Bool)

(assert (=> b!209441 (=> res!175821 e!142974)))

(declare-fun lt!327900 () (_ BitVec 64))

(declare-fun lt!327894 () tuple2!17958)

(assert (=> b!209441 (= res!175821 (or (not (= (size!4602 (buf!5116 (_2!9634 lt!327894))) (size!4602 (buf!5116 thiss!1204)))) (not (= lt!327900 (bvsub (bvadd lt!327902 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!209442 () Bool)

(declare-fun res!175812 () Bool)

(assert (=> b!209442 (=> (not res!175812) (not e!142964))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!209442 (= res!175812 (invariant!0 (currentBit!9647 thiss!1204) (currentByte!9652 thiss!1204) (size!4602 (buf!5116 thiss!1204))))))

(declare-fun b!209443 () Bool)

(assert (=> b!209443 (= e!142968 e!142970)))

(declare-fun res!175805 () Bool)

(assert (=> b!209443 (=> (not res!175805) (not e!142970))))

(declare-fun lt!327897 () (_ BitVec 64))

(assert (=> b!209443 (= res!175805 (= lt!327891 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!327897)))))

(assert (=> b!209443 (= lt!327891 (bitIndex!0 (size!4602 (buf!5116 (_2!9634 lt!327895))) (currentByte!9652 (_2!9634 lt!327895)) (currentBit!9647 (_2!9634 lt!327895))))))

(assert (=> b!209443 (= lt!327897 (bitIndex!0 (size!4602 (buf!5116 thiss!1204)) (currentByte!9652 thiss!1204) (currentBit!9647 thiss!1204)))))

(declare-fun b!209444 () Bool)

(assert (=> b!209444 (= e!142974 e!142966)))

(declare-fun res!175818 () Bool)

(assert (=> b!209444 (=> res!175818 e!142966)))

(declare-fun lt!327893 () tuple2!17962)

(declare-fun lt!327910 () tuple2!17960)

(declare-datatypes ((tuple2!17964 0))(
  ( (tuple2!17965 (_1!9637 BitStream!8312) (_2!9637 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8312 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17964)

(assert (=> b!209444 (= res!175818 (not (= (_1!9637 (readNBitsLSBFirstsLoopPure!0 (_1!9635 lt!327910) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!327913 (ite (_2!9636 lt!327893) lt!327908 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9635 lt!327910))))))

(declare-fun lt!327892 () (_ BitVec 64))

(assert (=> b!209444 (validate_offset_bits!1 ((_ sign_extend 32) (size!4602 (buf!5116 (_2!9634 lt!327894)))) ((_ sign_extend 32) (currentByte!9652 (_2!9634 lt!327895))) ((_ sign_extend 32) (currentBit!9647 (_2!9634 lt!327895))) lt!327892)))

(declare-fun lt!327901 () Unit!14915)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8312 array!10470 (_ BitVec 64)) Unit!14915)

(assert (=> b!209444 (= lt!327901 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9634 lt!327895) (buf!5116 (_2!9634 lt!327894)) lt!327892))))

(assert (=> b!209444 (= lt!327892 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!327903 () tuple2!17964)

(assert (=> b!209444 (= lt!327903 (readNBitsLSBFirstsLoopPure!0 (_1!9635 lt!327896) nBits!348 i!590 lt!327913))))

(assert (=> b!209444 (validate_offset_bits!1 ((_ sign_extend 32) (size!4602 (buf!5116 (_2!9634 lt!327894)))) ((_ sign_extend 32) (currentByte!9652 thiss!1204)) ((_ sign_extend 32) (currentBit!9647 thiss!1204)) lt!327904)))

(declare-fun lt!327909 () Unit!14915)

(assert (=> b!209444 (= lt!327909 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5116 (_2!9634 lt!327894)) lt!327904))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!209444 (= lt!327913 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!209444 (= (_2!9636 lt!327893) lt!327907)))

(assert (=> b!209444 (= lt!327893 (readBitPure!0 (_1!9635 lt!327896)))))

(declare-fun reader!0 (BitStream!8312 BitStream!8312) tuple2!17960)

(assert (=> b!209444 (= lt!327910 (reader!0 (_2!9634 lt!327895) (_2!9634 lt!327894)))))

(assert (=> b!209444 (= lt!327896 (reader!0 thiss!1204 (_2!9634 lt!327894)))))

(declare-fun e!142967 () Bool)

(assert (=> b!209444 e!142967))

(declare-fun res!175816 () Bool)

(assert (=> b!209444 (=> (not res!175816) (not e!142967))))

(declare-fun lt!327905 () tuple2!17962)

(declare-fun lt!327898 () tuple2!17962)

(assert (=> b!209444 (= res!175816 (= (bitIndex!0 (size!4602 (buf!5116 (_1!9636 lt!327905))) (currentByte!9652 (_1!9636 lt!327905)) (currentBit!9647 (_1!9636 lt!327905))) (bitIndex!0 (size!4602 (buf!5116 (_1!9636 lt!327898))) (currentByte!9652 (_1!9636 lt!327898)) (currentBit!9647 (_1!9636 lt!327898)))))))

(declare-fun lt!327914 () Unit!14915)

(declare-fun lt!327912 () BitStream!8312)

(declare-fun readBitPrefixLemma!0 (BitStream!8312 BitStream!8312) Unit!14915)

(assert (=> b!209444 (= lt!327914 (readBitPrefixLemma!0 lt!327912 (_2!9634 lt!327894)))))

(assert (=> b!209444 (= lt!327898 (readBitPure!0 (BitStream!8313 (buf!5116 (_2!9634 lt!327894)) (currentByte!9652 thiss!1204) (currentBit!9647 thiss!1204))))))

(assert (=> b!209444 (= lt!327905 (readBitPure!0 lt!327912))))

(declare-fun e!142963 () Bool)

(assert (=> b!209444 e!142963))

(declare-fun res!175817 () Bool)

(assert (=> b!209444 (=> (not res!175817) (not e!142963))))

(assert (=> b!209444 (= res!175817 (invariant!0 (currentBit!9647 thiss!1204) (currentByte!9652 thiss!1204) (size!4602 (buf!5116 (_2!9634 lt!327895)))))))

(assert (=> b!209444 (= lt!327912 (BitStream!8313 (buf!5116 (_2!9634 lt!327895)) (currentByte!9652 thiss!1204) (currentBit!9647 thiss!1204)))))

(declare-fun b!209445 () Bool)

(declare-fun res!175810 () Bool)

(assert (=> b!209445 (=> res!175810 e!142974)))

(declare-fun isPrefixOf!0 (BitStream!8312 BitStream!8312) Bool)

(assert (=> b!209445 (= res!175810 (not (isPrefixOf!0 thiss!1204 (_2!9634 lt!327895))))))

(declare-fun b!209446 () Bool)

(assert (=> b!209446 (= e!142966 (= (bvand lt!327913 #b1111111111111111111111111111111111111111111111111111111111111111) lt!327913))))

(declare-fun b!209447 () Bool)

(declare-fun res!175815 () Bool)

(assert (=> b!209447 (=> (not res!175815) (not e!142964))))

(assert (=> b!209447 (= res!175815 (not (= i!590 nBits!348)))))

(declare-fun b!209448 () Bool)

(assert (=> b!209448 (= e!142971 e!142974)))

(declare-fun res!175806 () Bool)

(assert (=> b!209448 (=> res!175806 e!142974)))

(assert (=> b!209448 (= res!175806 (not (= lt!327900 (bvsub (bvsub (bvadd lt!327906 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!209448 (= lt!327900 (bitIndex!0 (size!4602 (buf!5116 (_2!9634 lt!327894))) (currentByte!9652 (_2!9634 lt!327894)) (currentBit!9647 (_2!9634 lt!327894))))))

(assert (=> b!209448 (isPrefixOf!0 thiss!1204 (_2!9634 lt!327894))))

(declare-fun lt!327899 () Unit!14915)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8312 BitStream!8312 BitStream!8312) Unit!14915)

(assert (=> b!209448 (= lt!327899 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9634 lt!327895) (_2!9634 lt!327894)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8312 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17958)

(assert (=> b!209448 (= lt!327894 (appendBitsLSBFirstLoopTR!0 (_2!9634 lt!327895) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!209449 () Bool)

(assert (=> b!209449 (= e!142973 e!142964)))

(declare-fun res!175822 () Bool)

(assert (=> b!209449 (=> (not res!175822) (not e!142964))))

(assert (=> b!209449 (= res!175822 (validate_offset_bits!1 ((_ sign_extend 32) (size!4602 (buf!5116 thiss!1204))) ((_ sign_extend 32) (currentByte!9652 thiss!1204)) ((_ sign_extend 32) (currentBit!9647 thiss!1204)) lt!327904))))

(assert (=> b!209449 (= lt!327904 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!209450 () Bool)

(assert (=> b!209450 (= e!142967 (= (_2!9636 lt!327905) (_2!9636 lt!327898)))))

(declare-fun b!209451 () Bool)

(declare-fun res!175808 () Bool)

(assert (=> b!209451 (=> res!175808 e!142974)))

(assert (=> b!209451 (= res!175808 (not (isPrefixOf!0 (_2!9634 lt!327895) (_2!9634 lt!327894))))))

(declare-fun b!209452 () Bool)

(declare-fun res!175807 () Bool)

(assert (=> b!209452 (=> (not res!175807) (not e!142970))))

(assert (=> b!209452 (= res!175807 (isPrefixOf!0 thiss!1204 (_2!9634 lt!327895)))))

(declare-fun b!209453 () Bool)

(assert (=> b!209453 (= e!142963 (invariant!0 (currentBit!9647 thiss!1204) (currentByte!9652 thiss!1204) (size!4602 (buf!5116 (_2!9634 lt!327894)))))))

(declare-fun b!209454 () Bool)

(declare-fun res!175814 () Bool)

(assert (=> b!209454 (=> res!175814 e!142974)))

(assert (=> b!209454 (= res!175814 (not (invariant!0 (currentBit!9647 (_2!9634 lt!327894)) (currentByte!9652 (_2!9634 lt!327894)) (size!4602 (buf!5116 (_2!9634 lt!327894))))))))

(assert (= (and start!43972 res!175813) b!209449))

(assert (= (and b!209449 res!175822) b!209442))

(assert (= (and b!209442 res!175812) b!209447))

(assert (= (and b!209447 res!175815) b!209434))

(assert (= (and b!209434 res!175819) b!209443))

(assert (= (and b!209443 res!175805) b!209452))

(assert (= (and b!209452 res!175807) b!209439))

(assert (= (and b!209439 res!175820) b!209438))

(assert (= (and b!209434 (not res!175823)) b!209448))

(assert (= (and b!209448 (not res!175806)) b!209454))

(assert (= (and b!209454 (not res!175814)) b!209441))

(assert (= (and b!209441 (not res!175821)) b!209451))

(assert (= (and b!209451 (not res!175808)) b!209445))

(assert (= (and b!209445 (not res!175810)) b!209444))

(assert (= (and b!209444 res!175817) b!209453))

(assert (= (and b!209444 res!175816) b!209450))

(assert (= (and b!209444 (not res!175818)) b!209437))

(assert (= (and b!209437 (not res!175809)) b!209436))

(assert (= (and b!209436 (not res!175811)) b!209440))

(assert (= (and b!209440 (not res!175804)) b!209446))

(assert (= start!43972 b!209435))

(declare-fun m!322287 () Bool)

(assert (=> b!209454 m!322287))

(declare-fun m!322289 () Bool)

(assert (=> b!209436 m!322289))

(declare-fun m!322291 () Bool)

(assert (=> b!209448 m!322291))

(declare-fun m!322293 () Bool)

(assert (=> b!209448 m!322293))

(declare-fun m!322295 () Bool)

(assert (=> b!209448 m!322295))

(declare-fun m!322297 () Bool)

(assert (=> b!209448 m!322297))

(declare-fun m!322299 () Bool)

(assert (=> b!209435 m!322299))

(declare-fun m!322301 () Bool)

(assert (=> b!209439 m!322301))

(assert (=> b!209439 m!322301))

(declare-fun m!322303 () Bool)

(assert (=> b!209439 m!322303))

(declare-fun m!322305 () Bool)

(assert (=> b!209453 m!322305))

(declare-fun m!322307 () Bool)

(assert (=> b!209442 m!322307))

(declare-fun m!322309 () Bool)

(assert (=> b!209444 m!322309))

(declare-fun m!322311 () Bool)

(assert (=> b!209444 m!322311))

(declare-fun m!322313 () Bool)

(assert (=> b!209444 m!322313))

(declare-fun m!322315 () Bool)

(assert (=> b!209444 m!322315))

(declare-fun m!322317 () Bool)

(assert (=> b!209444 m!322317))

(declare-fun m!322319 () Bool)

(assert (=> b!209444 m!322319))

(declare-fun m!322321 () Bool)

(assert (=> b!209444 m!322321))

(declare-fun m!322323 () Bool)

(assert (=> b!209444 m!322323))

(declare-fun m!322325 () Bool)

(assert (=> b!209444 m!322325))

(declare-fun m!322327 () Bool)

(assert (=> b!209444 m!322327))

(declare-fun m!322329 () Bool)

(assert (=> b!209444 m!322329))

(declare-fun m!322331 () Bool)

(assert (=> b!209444 m!322331))

(declare-fun m!322333 () Bool)

(assert (=> b!209444 m!322333))

(declare-fun m!322335 () Bool)

(assert (=> b!209444 m!322335))

(declare-fun m!322337 () Bool)

(assert (=> b!209444 m!322337))

(declare-fun m!322339 () Bool)

(assert (=> b!209444 m!322339))

(declare-fun m!322341 () Bool)

(assert (=> b!209434 m!322341))

(declare-fun m!322343 () Bool)

(assert (=> b!209434 m!322343))

(declare-fun m!322345 () Bool)

(assert (=> b!209434 m!322345))

(declare-fun m!322347 () Bool)

(assert (=> b!209451 m!322347))

(declare-fun m!322349 () Bool)

(assert (=> b!209445 m!322349))

(declare-fun m!322351 () Bool)

(assert (=> b!209449 m!322351))

(declare-fun m!322353 () Bool)

(assert (=> b!209438 m!322353))

(declare-fun m!322355 () Bool)

(assert (=> start!43972 m!322355))

(declare-fun m!322357 () Bool)

(assert (=> b!209440 m!322357))

(assert (=> b!209443 m!322341))

(assert (=> b!209443 m!322343))

(assert (=> b!209452 m!322349))

(push 1)

(assert (not b!209444))

(assert (not b!209452))

(assert (not b!209453))

(assert (not b!209436))

(assert (not b!209438))

(assert (not b!209451))

(assert (not b!209445))

(assert (not b!209440))

(assert (not b!209439))

(assert (not b!209448))

(assert (not b!209454))

(assert (not b!209442))

(assert (not b!209434))

(assert (not start!43972))

(assert (not b!209443))

(assert (not b!209435))

(assert (not b!209449))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

