; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41020 () Bool)

(assert start!41020)

(declare-fun b!190285 () Bool)

(declare-fun e!131317 () Bool)

(declare-datatypes ((array!9910 0))(
  ( (array!9911 (arr!5300 (Array (_ BitVec 32) (_ BitVec 8))) (size!4370 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7848 0))(
  ( (BitStream!7849 (buf!4844 array!9910) (currentByte!9116 (_ BitVec 32)) (currentBit!9111 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!16468 0))(
  ( (tuple2!16469 (_1!8879 BitStream!7848) (_2!8879 Bool)) )
))
(declare-fun lt!295238 () tuple2!16468)

(declare-fun lt!295241 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!190285 (= e!131317 (= (bitIndex!0 (size!4370 (buf!4844 (_1!8879 lt!295238))) (currentByte!9116 (_1!8879 lt!295238)) (currentBit!9111 (_1!8879 lt!295238))) lt!295241))))

(declare-fun b!190286 () Bool)

(declare-fun e!131320 () Bool)

(declare-fun e!131308 () Bool)

(assert (=> b!190286 (= e!131320 (not e!131308))))

(declare-fun res!158754 () Bool)

(assert (=> b!190286 (=> res!158754 e!131308)))

(declare-fun lt!295249 () (_ BitVec 64))

(declare-fun lt!295244 () (_ BitVec 64))

(assert (=> b!190286 (= res!158754 (not (= lt!295249 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!295244))))))

(declare-datatypes ((Unit!13539 0))(
  ( (Unit!13540) )
))
(declare-datatypes ((tuple2!16470 0))(
  ( (tuple2!16471 (_1!8880 Unit!13539) (_2!8880 BitStream!7848)) )
))
(declare-fun lt!295247 () tuple2!16470)

(assert (=> b!190286 (= lt!295249 (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!295247))) (currentByte!9116 (_2!8880 lt!295247)) (currentBit!9111 (_2!8880 lt!295247))))))

(declare-fun thiss!1204 () BitStream!7848)

(assert (=> b!190286 (= lt!295244 (bitIndex!0 (size!4370 (buf!4844 thiss!1204)) (currentByte!9116 thiss!1204) (currentBit!9111 thiss!1204)))))

(declare-fun e!131319 () Bool)

(assert (=> b!190286 e!131319))

(declare-fun res!158742 () Bool)

(assert (=> b!190286 (=> (not res!158742) (not e!131319))))

(assert (=> b!190286 (= res!158742 (= (size!4370 (buf!4844 thiss!1204)) (size!4370 (buf!4844 (_2!8880 lt!295247)))))))

(declare-fun lt!295230 () Bool)

(declare-fun appendBit!0 (BitStream!7848 Bool) tuple2!16470)

(assert (=> b!190286 (= lt!295247 (appendBit!0 thiss!1204 lt!295230))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!295250 () (_ BitVec 64))

(assert (=> b!190286 (= lt!295230 (not (= (bvand v!189 lt!295250) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!190286 (= lt!295250 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!190287 () Bool)

(declare-fun e!131311 () Bool)

(assert (=> b!190287 (= e!131311 e!131317)))

(declare-fun res!158743 () Bool)

(assert (=> b!190287 (=> (not res!158743) (not e!131317))))

(assert (=> b!190287 (= res!158743 (and (= (_2!8879 lt!295238) lt!295230) (= (_1!8879 lt!295238) (_2!8880 lt!295247))))))

(declare-fun readBitPure!0 (BitStream!7848) tuple2!16468)

(declare-fun readerFrom!0 (BitStream!7848 (_ BitVec 32) (_ BitVec 32)) BitStream!7848)

(assert (=> b!190287 (= lt!295238 (readBitPure!0 (readerFrom!0 (_2!8880 lt!295247) (currentBit!9111 thiss!1204) (currentByte!9116 thiss!1204))))))

(declare-fun b!190289 () Bool)

(declare-fun e!131312 () Bool)

(declare-datatypes ((tuple2!16472 0))(
  ( (tuple2!16473 (_1!8881 BitStream!7848) (_2!8881 BitStream!7848)) )
))
(declare-fun lt!295246 () tuple2!16472)

(declare-fun lt!295227 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!190289 (= e!131312 (validate_offset_bits!1 ((_ sign_extend 32) (size!4370 (buf!4844 (_1!8881 lt!295246)))) ((_ sign_extend 32) (currentByte!9116 (_1!8881 lt!295246))) ((_ sign_extend 32) (currentBit!9111 (_1!8881 lt!295246))) lt!295227))))

(declare-fun lt!295245 () tuple2!16470)

(assert (=> b!190289 (= (size!4370 (buf!4844 thiss!1204)) (size!4370 (buf!4844 (_2!8880 lt!295245))))))

(declare-fun b!190290 () Bool)

(declare-fun res!158748 () Bool)

(declare-fun e!131310 () Bool)

(assert (=> b!190290 (=> (not res!158748) (not e!131310))))

(declare-fun lt!295251 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7848 (_ BitVec 64)) BitStream!7848)

(assert (=> b!190290 (= res!158748 (= (_1!8881 lt!295246) (withMovedBitIndex!0 (_2!8881 lt!295246) (bvsub lt!295244 lt!295251))))))

(declare-fun b!190291 () Bool)

(declare-fun res!158753 () Bool)

(assert (=> b!190291 (=> (not res!158753) (not e!131310))))

(declare-fun lt!295233 () tuple2!16472)

(assert (=> b!190291 (= res!158753 (= (_1!8881 lt!295233) (withMovedBitIndex!0 (_2!8881 lt!295233) (bvsub lt!295249 lt!295251))))))

(declare-fun b!190292 () Bool)

(declare-fun e!131318 () Bool)

(assert (=> b!190292 (= e!131318 e!131312)))

(declare-fun res!158745 () Bool)

(assert (=> b!190292 (=> res!158745 e!131312)))

(declare-fun lt!295235 () BitStream!7848)

(assert (=> b!190292 (= res!158745 (not (= (_1!8881 lt!295233) lt!295235)))))

(assert (=> b!190292 e!131310))

(declare-fun res!158755 () Bool)

(assert (=> b!190292 (=> (not res!158755) (not e!131310))))

(declare-datatypes ((tuple2!16474 0))(
  ( (tuple2!16475 (_1!8882 BitStream!7848) (_2!8882 (_ BitVec 64))) )
))
(declare-fun lt!295239 () tuple2!16474)

(declare-fun lt!295231 () tuple2!16474)

(assert (=> b!190292 (= res!158755 (and (= (_2!8882 lt!295239) (_2!8882 lt!295231)) (= (_1!8882 lt!295239) (_1!8882 lt!295231))))))

(declare-fun lt!295242 () (_ BitVec 64))

(declare-fun lt!295252 () Unit!13539)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13539)

(assert (=> b!190292 (= lt!295252 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8881 lt!295246) nBits!348 i!590 lt!295242))))

(declare-fun lt!295228 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16474)

(assert (=> b!190292 (= lt!295231 (readNBitsLSBFirstsLoopPure!0 lt!295235 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!295228))))

(assert (=> b!190292 (= lt!295235 (withMovedBitIndex!0 (_1!8881 lt!295246) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!190293 () Bool)

(declare-fun e!131309 () Bool)

(declare-fun array_inv!4111 (array!9910) Bool)

(assert (=> b!190293 (= e!131309 (array_inv!4111 (buf!4844 thiss!1204)))))

(declare-fun b!190294 () Bool)

(declare-fun res!158741 () Bool)

(assert (=> b!190294 (=> res!158741 e!131312)))

(assert (=> b!190294 (= res!158741 (not (= (bitIndex!0 (size!4370 (buf!4844 (_1!8882 lt!295239))) (currentByte!9116 (_1!8882 lt!295239)) (currentBit!9111 (_1!8882 lt!295239))) (bitIndex!0 (size!4370 (buf!4844 (_2!8881 lt!295246))) (currentByte!9116 (_2!8881 lt!295246)) (currentBit!9111 (_2!8881 lt!295246))))))))

(declare-fun b!190295 () Bool)

(declare-fun res!158750 () Bool)

(declare-fun e!131321 () Bool)

(assert (=> b!190295 (=> res!158750 e!131321)))

(declare-fun isPrefixOf!0 (BitStream!7848 BitStream!7848) Bool)

(assert (=> b!190295 (= res!158750 (not (isPrefixOf!0 thiss!1204 (_2!8880 lt!295247))))))

(declare-fun b!190296 () Bool)

(assert (=> b!190296 (= e!131321 e!131318)))

(declare-fun res!158738 () Bool)

(assert (=> b!190296 (=> res!158738 e!131318)))

(declare-fun lt!295225 () tuple2!16474)

(assert (=> b!190296 (= res!158738 (not (= (_1!8882 lt!295225) (_2!8881 lt!295233))))))

(assert (=> b!190296 (= lt!295225 (readNBitsLSBFirstsLoopPure!0 (_1!8881 lt!295233) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!295228))))

(declare-fun lt!295234 () (_ BitVec 64))

(assert (=> b!190296 (validate_offset_bits!1 ((_ sign_extend 32) (size!4370 (buf!4844 (_2!8880 lt!295245)))) ((_ sign_extend 32) (currentByte!9116 (_2!8880 lt!295247))) ((_ sign_extend 32) (currentBit!9111 (_2!8880 lt!295247))) lt!295234)))

(declare-fun lt!295229 () Unit!13539)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7848 array!9910 (_ BitVec 64)) Unit!13539)

(assert (=> b!190296 (= lt!295229 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8880 lt!295247) (buf!4844 (_2!8880 lt!295245)) lt!295234))))

(assert (=> b!190296 (= lt!295234 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!295237 () tuple2!16468)

(assert (=> b!190296 (= lt!295228 (bvor lt!295242 (ite (_2!8879 lt!295237) lt!295250 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190296 (= lt!295239 (readNBitsLSBFirstsLoopPure!0 (_1!8881 lt!295246) nBits!348 i!590 lt!295242))))

(assert (=> b!190296 (validate_offset_bits!1 ((_ sign_extend 32) (size!4370 (buf!4844 (_2!8880 lt!295245)))) ((_ sign_extend 32) (currentByte!9116 thiss!1204)) ((_ sign_extend 32) (currentBit!9111 thiss!1204)) lt!295227)))

(declare-fun lt!295236 () Unit!13539)

(assert (=> b!190296 (= lt!295236 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4844 (_2!8880 lt!295245)) lt!295227))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!190296 (= lt!295242 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!190296 (= (_2!8879 lt!295237) lt!295230)))

(assert (=> b!190296 (= lt!295237 (readBitPure!0 (_1!8881 lt!295246)))))

(declare-fun reader!0 (BitStream!7848 BitStream!7848) tuple2!16472)

(assert (=> b!190296 (= lt!295233 (reader!0 (_2!8880 lt!295247) (_2!8880 lt!295245)))))

(assert (=> b!190296 (= lt!295246 (reader!0 thiss!1204 (_2!8880 lt!295245)))))

(declare-fun e!131314 () Bool)

(assert (=> b!190296 e!131314))

(declare-fun res!158749 () Bool)

(assert (=> b!190296 (=> (not res!158749) (not e!131314))))

(declare-fun lt!295224 () tuple2!16468)

(declare-fun lt!295248 () tuple2!16468)

(assert (=> b!190296 (= res!158749 (= (bitIndex!0 (size!4370 (buf!4844 (_1!8879 lt!295224))) (currentByte!9116 (_1!8879 lt!295224)) (currentBit!9111 (_1!8879 lt!295224))) (bitIndex!0 (size!4370 (buf!4844 (_1!8879 lt!295248))) (currentByte!9116 (_1!8879 lt!295248)) (currentBit!9111 (_1!8879 lt!295248)))))))

(declare-fun lt!295243 () Unit!13539)

(declare-fun lt!295240 () BitStream!7848)

(declare-fun readBitPrefixLemma!0 (BitStream!7848 BitStream!7848) Unit!13539)

(assert (=> b!190296 (= lt!295243 (readBitPrefixLemma!0 lt!295240 (_2!8880 lt!295245)))))

(assert (=> b!190296 (= lt!295248 (readBitPure!0 (BitStream!7849 (buf!4844 (_2!8880 lt!295245)) (currentByte!9116 thiss!1204) (currentBit!9111 thiss!1204))))))

(assert (=> b!190296 (= lt!295224 (readBitPure!0 lt!295240))))

(declare-fun e!131316 () Bool)

(assert (=> b!190296 e!131316))

(declare-fun res!158740 () Bool)

(assert (=> b!190296 (=> (not res!158740) (not e!131316))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!190296 (= res!158740 (invariant!0 (currentBit!9111 thiss!1204) (currentByte!9116 thiss!1204) (size!4370 (buf!4844 (_2!8880 lt!295247)))))))

(assert (=> b!190296 (= lt!295240 (BitStream!7849 (buf!4844 (_2!8880 lt!295247)) (currentByte!9116 thiss!1204) (currentBit!9111 thiss!1204)))))

(declare-fun b!190297 () Bool)

(assert (=> b!190297 (= e!131310 (and (= lt!295244 (bvsub lt!295249 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8881 lt!295233) lt!295235)) (= (_2!8882 lt!295239) (_2!8882 lt!295225)))))))

(declare-fun b!190298 () Bool)

(declare-fun res!158739 () Bool)

(assert (=> b!190298 (=> (not res!158739) (not e!131320))))

(assert (=> b!190298 (= res!158739 (not (= i!590 nBits!348)))))

(declare-fun res!158757 () Bool)

(declare-fun e!131315 () Bool)

(assert (=> start!41020 (=> (not res!158757) (not e!131315))))

(assert (=> start!41020 (= res!158757 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41020 e!131315))

(assert (=> start!41020 true))

(declare-fun inv!12 (BitStream!7848) Bool)

(assert (=> start!41020 (and (inv!12 thiss!1204) e!131309)))

(declare-fun b!190288 () Bool)

(declare-fun res!158751 () Bool)

(assert (=> b!190288 (=> (not res!158751) (not e!131320))))

(assert (=> b!190288 (= res!158751 (invariant!0 (currentBit!9111 thiss!1204) (currentByte!9116 thiss!1204) (size!4370 (buf!4844 thiss!1204))))))

(declare-fun b!190299 () Bool)

(declare-fun res!158756 () Bool)

(assert (=> b!190299 (=> (not res!158756) (not e!131311))))

(assert (=> b!190299 (= res!158756 (isPrefixOf!0 thiss!1204 (_2!8880 lt!295247)))))

(declare-fun b!190300 () Bool)

(declare-fun res!158744 () Bool)

(assert (=> b!190300 (=> res!158744 e!131321)))

(assert (=> b!190300 (= res!158744 (not (isPrefixOf!0 (_2!8880 lt!295247) (_2!8880 lt!295245))))))

(declare-fun b!190301 () Bool)

(assert (=> b!190301 (= e!131319 e!131311)))

(declare-fun res!158737 () Bool)

(assert (=> b!190301 (=> (not res!158737) (not e!131311))))

(declare-fun lt!295232 () (_ BitVec 64))

(assert (=> b!190301 (= res!158737 (= lt!295241 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!295232)))))

(assert (=> b!190301 (= lt!295241 (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!295247))) (currentByte!9116 (_2!8880 lt!295247)) (currentBit!9111 (_2!8880 lt!295247))))))

(assert (=> b!190301 (= lt!295232 (bitIndex!0 (size!4370 (buf!4844 thiss!1204)) (currentByte!9116 thiss!1204) (currentBit!9111 thiss!1204)))))

(declare-fun b!190302 () Bool)

(assert (=> b!190302 (= e!131315 e!131320)))

(declare-fun res!158752 () Bool)

(assert (=> b!190302 (=> (not res!158752) (not e!131320))))

(assert (=> b!190302 (= res!158752 (validate_offset_bits!1 ((_ sign_extend 32) (size!4370 (buf!4844 thiss!1204))) ((_ sign_extend 32) (currentByte!9116 thiss!1204)) ((_ sign_extend 32) (currentBit!9111 thiss!1204)) lt!295227))))

(assert (=> b!190302 (= lt!295227 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!190303 () Bool)

(declare-fun res!158746 () Bool)

(assert (=> b!190303 (=> res!158746 e!131321)))

(assert (=> b!190303 (= res!158746 (or (not (= (size!4370 (buf!4844 (_2!8880 lt!295245))) (size!4370 (buf!4844 thiss!1204)))) (not (= lt!295251 (bvsub (bvadd lt!295244 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!190304 () Bool)

(assert (=> b!190304 (= e!131316 (invariant!0 (currentBit!9111 thiss!1204) (currentByte!9116 thiss!1204) (size!4370 (buf!4844 (_2!8880 lt!295245)))))))

(declare-fun b!190305 () Bool)

(assert (=> b!190305 (= e!131308 e!131321)))

(declare-fun res!158747 () Bool)

(assert (=> b!190305 (=> res!158747 e!131321)))

(assert (=> b!190305 (= res!158747 (not (= lt!295251 (bvsub (bvsub (bvadd lt!295249 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!190305 (= lt!295251 (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!295245))) (currentByte!9116 (_2!8880 lt!295245)) (currentBit!9111 (_2!8880 lt!295245))))))

(assert (=> b!190305 (isPrefixOf!0 thiss!1204 (_2!8880 lt!295245))))

(declare-fun lt!295226 () Unit!13539)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7848 BitStream!7848 BitStream!7848) Unit!13539)

(assert (=> b!190305 (= lt!295226 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8880 lt!295247) (_2!8880 lt!295245)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7848 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16470)

(assert (=> b!190305 (= lt!295245 (appendBitsLSBFirstLoopTR!0 (_2!8880 lt!295247) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!190306 () Bool)

(declare-fun res!158736 () Bool)

(assert (=> b!190306 (=> res!158736 e!131321)))

(assert (=> b!190306 (= res!158736 (not (invariant!0 (currentBit!9111 (_2!8880 lt!295245)) (currentByte!9116 (_2!8880 lt!295245)) (size!4370 (buf!4844 (_2!8880 lt!295245))))))))

(declare-fun b!190307 () Bool)

(assert (=> b!190307 (= e!131314 (= (_2!8879 lt!295224) (_2!8879 lt!295248)))))

(assert (= (and start!41020 res!158757) b!190302))

(assert (= (and b!190302 res!158752) b!190288))

(assert (= (and b!190288 res!158751) b!190298))

(assert (= (and b!190298 res!158739) b!190286))

(assert (= (and b!190286 res!158742) b!190301))

(assert (= (and b!190301 res!158737) b!190299))

(assert (= (and b!190299 res!158756) b!190287))

(assert (= (and b!190287 res!158743) b!190285))

(assert (= (and b!190286 (not res!158754)) b!190305))

(assert (= (and b!190305 (not res!158747)) b!190306))

(assert (= (and b!190306 (not res!158736)) b!190303))

(assert (= (and b!190303 (not res!158746)) b!190300))

(assert (= (and b!190300 (not res!158744)) b!190295))

(assert (= (and b!190295 (not res!158750)) b!190296))

(assert (= (and b!190296 res!158740) b!190304))

(assert (= (and b!190296 res!158749) b!190307))

(assert (= (and b!190296 (not res!158738)) b!190292))

(assert (= (and b!190292 res!158755) b!190290))

(assert (= (and b!190290 res!158748) b!190291))

(assert (= (and b!190291 res!158753) b!190297))

(assert (= (and b!190292 (not res!158745)) b!190294))

(assert (= (and b!190294 (not res!158741)) b!190289))

(assert (= start!41020 b!190293))

(declare-fun m!295457 () Bool)

(assert (=> b!190305 m!295457))

(declare-fun m!295459 () Bool)

(assert (=> b!190305 m!295459))

(declare-fun m!295461 () Bool)

(assert (=> b!190305 m!295461))

(declare-fun m!295463 () Bool)

(assert (=> b!190305 m!295463))

(declare-fun m!295465 () Bool)

(assert (=> b!190295 m!295465))

(declare-fun m!295467 () Bool)

(assert (=> start!41020 m!295467))

(declare-fun m!295469 () Bool)

(assert (=> b!190289 m!295469))

(declare-fun m!295471 () Bool)

(assert (=> b!190291 m!295471))

(declare-fun m!295473 () Bool)

(assert (=> b!190292 m!295473))

(declare-fun m!295475 () Bool)

(assert (=> b!190292 m!295475))

(declare-fun m!295477 () Bool)

(assert (=> b!190292 m!295477))

(declare-fun m!295479 () Bool)

(assert (=> b!190293 m!295479))

(declare-fun m!295481 () Bool)

(assert (=> b!190285 m!295481))

(assert (=> b!190299 m!295465))

(declare-fun m!295483 () Bool)

(assert (=> b!190290 m!295483))

(declare-fun m!295485 () Bool)

(assert (=> b!190304 m!295485))

(declare-fun m!295487 () Bool)

(assert (=> b!190300 m!295487))

(declare-fun m!295489 () Bool)

(assert (=> b!190301 m!295489))

(declare-fun m!295491 () Bool)

(assert (=> b!190301 m!295491))

(declare-fun m!295493 () Bool)

(assert (=> b!190294 m!295493))

(declare-fun m!295495 () Bool)

(assert (=> b!190294 m!295495))

(assert (=> b!190286 m!295489))

(assert (=> b!190286 m!295491))

(declare-fun m!295497 () Bool)

(assert (=> b!190286 m!295497))

(declare-fun m!295499 () Bool)

(assert (=> b!190296 m!295499))

(declare-fun m!295501 () Bool)

(assert (=> b!190296 m!295501))

(declare-fun m!295503 () Bool)

(assert (=> b!190296 m!295503))

(declare-fun m!295505 () Bool)

(assert (=> b!190296 m!295505))

(declare-fun m!295507 () Bool)

(assert (=> b!190296 m!295507))

(declare-fun m!295509 () Bool)

(assert (=> b!190296 m!295509))

(declare-fun m!295511 () Bool)

(assert (=> b!190296 m!295511))

(declare-fun m!295513 () Bool)

(assert (=> b!190296 m!295513))

(declare-fun m!295515 () Bool)

(assert (=> b!190296 m!295515))

(declare-fun m!295517 () Bool)

(assert (=> b!190296 m!295517))

(declare-fun m!295519 () Bool)

(assert (=> b!190296 m!295519))

(declare-fun m!295521 () Bool)

(assert (=> b!190296 m!295521))

(declare-fun m!295523 () Bool)

(assert (=> b!190296 m!295523))

(declare-fun m!295525 () Bool)

(assert (=> b!190296 m!295525))

(declare-fun m!295527 () Bool)

(assert (=> b!190296 m!295527))

(declare-fun m!295529 () Bool)

(assert (=> b!190296 m!295529))

(declare-fun m!295531 () Bool)

(assert (=> b!190302 m!295531))

(declare-fun m!295533 () Bool)

(assert (=> b!190287 m!295533))

(assert (=> b!190287 m!295533))

(declare-fun m!295535 () Bool)

(assert (=> b!190287 m!295535))

(declare-fun m!295537 () Bool)

(assert (=> b!190288 m!295537))

(declare-fun m!295539 () Bool)

(assert (=> b!190306 m!295539))

(check-sat (not b!190286) (not b!190293) (not b!190306) (not b!190289) (not b!190291) (not b!190290) (not b!190287) (not b!190288) (not b!190294) (not b!190296) (not b!190292) (not b!190302) (not b!190305) (not b!190301) (not b!190299) (not start!41020) (not b!190285) (not b!190300) (not b!190295) (not b!190304))
(check-sat)
(get-model)

(declare-fun d!65155 () Bool)

(assert (=> d!65155 (= (array_inv!4111 (buf!4844 thiss!1204)) (bvsge (size!4370 (buf!4844 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!190293 d!65155))

(declare-fun d!65157 () Bool)

(assert (=> d!65157 (= (invariant!0 (currentBit!9111 thiss!1204) (currentByte!9116 thiss!1204) (size!4370 (buf!4844 (_2!8880 lt!295245)))) (and (bvsge (currentBit!9111 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9111 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9116 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9116 thiss!1204) (size!4370 (buf!4844 (_2!8880 lt!295245)))) (and (= (currentBit!9111 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9116 thiss!1204) (size!4370 (buf!4844 (_2!8880 lt!295245))))))))))

(assert (=> b!190304 d!65157))

(declare-fun d!65159 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!65159 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4370 (buf!4844 thiss!1204))) ((_ sign_extend 32) (currentByte!9116 thiss!1204)) ((_ sign_extend 32) (currentBit!9111 thiss!1204)) lt!295227) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4370 (buf!4844 thiss!1204))) ((_ sign_extend 32) (currentByte!9116 thiss!1204)) ((_ sign_extend 32) (currentBit!9111 thiss!1204))) lt!295227))))

(declare-fun bs!16206 () Bool)

(assert (= bs!16206 d!65159))

(declare-fun m!295625 () Bool)

(assert (=> bs!16206 m!295625))

(assert (=> b!190302 d!65159))

(declare-fun d!65161 () Bool)

(declare-fun lt!295356 () tuple2!16474)

(declare-fun lt!295355 () tuple2!16474)

(assert (=> d!65161 (and (= (_2!8882 lt!295356) (_2!8882 lt!295355)) (= (_1!8882 lt!295356) (_1!8882 lt!295355)))))

(declare-fun lt!295353 () (_ BitVec 64))

(declare-fun lt!295357 () Unit!13539)

(declare-fun lt!295352 () Bool)

(declare-fun lt!295354 () BitStream!7848)

(declare-fun choose!56 (BitStream!7848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16474 tuple2!16474 BitStream!7848 (_ BitVec 64) Bool BitStream!7848 (_ BitVec 64) tuple2!16474 tuple2!16474 BitStream!7848 (_ BitVec 64)) Unit!13539)

(assert (=> d!65161 (= lt!295357 (choose!56 (_1!8881 lt!295246) nBits!348 i!590 lt!295242 lt!295356 (tuple2!16475 (_1!8882 lt!295356) (_2!8882 lt!295356)) (_1!8882 lt!295356) (_2!8882 lt!295356) lt!295352 lt!295354 lt!295353 lt!295355 (tuple2!16475 (_1!8882 lt!295355) (_2!8882 lt!295355)) (_1!8882 lt!295355) (_2!8882 lt!295355)))))

(assert (=> d!65161 (= lt!295355 (readNBitsLSBFirstsLoopPure!0 lt!295354 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!295353))))

(assert (=> d!65161 (= lt!295353 (bvor lt!295242 (ite lt!295352 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65161 (= lt!295354 (withMovedBitIndex!0 (_1!8881 lt!295246) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!65161 (= lt!295352 (_2!8879 (readBitPure!0 (_1!8881 lt!295246))))))

(assert (=> d!65161 (= lt!295356 (readNBitsLSBFirstsLoopPure!0 (_1!8881 lt!295246) nBits!348 i!590 lt!295242))))

(assert (=> d!65161 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8881 lt!295246) nBits!348 i!590 lt!295242) lt!295357)))

(declare-fun bs!16208 () Bool)

(assert (= bs!16208 d!65161))

(assert (=> bs!16208 m!295477))

(assert (=> bs!16208 m!295507))

(declare-fun m!295627 () Bool)

(assert (=> bs!16208 m!295627))

(assert (=> bs!16208 m!295519))

(declare-fun m!295629 () Bool)

(assert (=> bs!16208 m!295629))

(assert (=> b!190292 d!65161))

(declare-datatypes ((tuple2!16484 0))(
  ( (tuple2!16485 (_1!8887 (_ BitVec 64)) (_2!8887 BitStream!7848)) )
))
(declare-fun lt!295360 () tuple2!16484)

(declare-fun d!65163 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16484)

(assert (=> d!65163 (= lt!295360 (readNBitsLSBFirstsLoop!0 lt!295235 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!295228))))

(assert (=> d!65163 (= (readNBitsLSBFirstsLoopPure!0 lt!295235 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!295228) (tuple2!16475 (_2!8887 lt!295360) (_1!8887 lt!295360)))))

(declare-fun bs!16209 () Bool)

(assert (= bs!16209 d!65163))

(declare-fun m!295631 () Bool)

(assert (=> bs!16209 m!295631))

(assert (=> b!190292 d!65163))

(declare-fun d!65165 () Bool)

(declare-fun e!131366 () Bool)

(assert (=> d!65165 e!131366))

(declare-fun res!158826 () Bool)

(assert (=> d!65165 (=> (not res!158826) (not e!131366))))

(declare-fun lt!295366 () (_ BitVec 64))

(declare-fun lt!295365 () BitStream!7848)

(assert (=> d!65165 (= res!158826 (= (bvadd lt!295366 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4370 (buf!4844 lt!295365)) (currentByte!9116 lt!295365) (currentBit!9111 lt!295365))))))

(assert (=> d!65165 (or (not (= (bvand lt!295366 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!295366 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!295366 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65165 (= lt!295366 (bitIndex!0 (size!4370 (buf!4844 (_1!8881 lt!295246))) (currentByte!9116 (_1!8881 lt!295246)) (currentBit!9111 (_1!8881 lt!295246))))))

(declare-fun moveBitIndex!0 (BitStream!7848 (_ BitVec 64)) tuple2!16470)

(assert (=> d!65165 (= lt!295365 (_2!8880 (moveBitIndex!0 (_1!8881 lt!295246) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7848 (_ BitVec 64)) Bool)

(assert (=> d!65165 (moveBitIndexPrecond!0 (_1!8881 lt!295246) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!65165 (= (withMovedBitIndex!0 (_1!8881 lt!295246) #b0000000000000000000000000000000000000000000000000000000000000001) lt!295365)))

(declare-fun b!190379 () Bool)

(assert (=> b!190379 (= e!131366 (= (size!4370 (buf!4844 (_1!8881 lt!295246))) (size!4370 (buf!4844 lt!295365))))))

(assert (= (and d!65165 res!158826) b!190379))

(declare-fun m!295633 () Bool)

(assert (=> d!65165 m!295633))

(declare-fun m!295635 () Bool)

(assert (=> d!65165 m!295635))

(declare-fun m!295637 () Bool)

(assert (=> d!65165 m!295637))

(declare-fun m!295639 () Bool)

(assert (=> d!65165 m!295639))

(assert (=> b!190292 d!65165))

(declare-fun d!65167 () Bool)

(declare-fun e!131369 () Bool)

(assert (=> d!65167 e!131369))

(declare-fun res!158832 () Bool)

(assert (=> d!65167 (=> (not res!158832) (not e!131369))))

(declare-fun lt!295379 () (_ BitVec 64))

(declare-fun lt!295380 () (_ BitVec 64))

(declare-fun lt!295382 () (_ BitVec 64))

(assert (=> d!65167 (= res!158832 (= lt!295382 (bvsub lt!295379 lt!295380)))))

(assert (=> d!65167 (or (= (bvand lt!295379 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295380 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295379 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295379 lt!295380) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65167 (= lt!295380 (remainingBits!0 ((_ sign_extend 32) (size!4370 (buf!4844 (_2!8880 lt!295247)))) ((_ sign_extend 32) (currentByte!9116 (_2!8880 lt!295247))) ((_ sign_extend 32) (currentBit!9111 (_2!8880 lt!295247)))))))

(declare-fun lt!295384 () (_ BitVec 64))

(declare-fun lt!295383 () (_ BitVec 64))

(assert (=> d!65167 (= lt!295379 (bvmul lt!295384 lt!295383))))

(assert (=> d!65167 (or (= lt!295384 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!295383 (bvsdiv (bvmul lt!295384 lt!295383) lt!295384)))))

(assert (=> d!65167 (= lt!295383 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65167 (= lt!295384 ((_ sign_extend 32) (size!4370 (buf!4844 (_2!8880 lt!295247)))))))

(assert (=> d!65167 (= lt!295382 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9116 (_2!8880 lt!295247))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9111 (_2!8880 lt!295247)))))))

(assert (=> d!65167 (invariant!0 (currentBit!9111 (_2!8880 lt!295247)) (currentByte!9116 (_2!8880 lt!295247)) (size!4370 (buf!4844 (_2!8880 lt!295247))))))

(assert (=> d!65167 (= (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!295247))) (currentByte!9116 (_2!8880 lt!295247)) (currentBit!9111 (_2!8880 lt!295247))) lt!295382)))

(declare-fun b!190384 () Bool)

(declare-fun res!158831 () Bool)

(assert (=> b!190384 (=> (not res!158831) (not e!131369))))

(assert (=> b!190384 (= res!158831 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!295382))))

(declare-fun b!190385 () Bool)

(declare-fun lt!295381 () (_ BitVec 64))

(assert (=> b!190385 (= e!131369 (bvsle lt!295382 (bvmul lt!295381 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190385 (or (= lt!295381 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!295381 #b0000000000000000000000000000000000000000000000000000000000001000) lt!295381)))))

(assert (=> b!190385 (= lt!295381 ((_ sign_extend 32) (size!4370 (buf!4844 (_2!8880 lt!295247)))))))

(assert (= (and d!65167 res!158832) b!190384))

(assert (= (and b!190384 res!158831) b!190385))

(declare-fun m!295641 () Bool)

(assert (=> d!65167 m!295641))

(declare-fun m!295643 () Bool)

(assert (=> d!65167 m!295643))

(assert (=> b!190301 d!65167))

(declare-fun d!65169 () Bool)

(declare-fun e!131370 () Bool)

(assert (=> d!65169 e!131370))

(declare-fun res!158834 () Bool)

(assert (=> d!65169 (=> (not res!158834) (not e!131370))))

(declare-fun lt!295385 () (_ BitVec 64))

(declare-fun lt!295388 () (_ BitVec 64))

(declare-fun lt!295386 () (_ BitVec 64))

(assert (=> d!65169 (= res!158834 (= lt!295388 (bvsub lt!295385 lt!295386)))))

(assert (=> d!65169 (or (= (bvand lt!295385 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295386 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295385 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295385 lt!295386) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65169 (= lt!295386 (remainingBits!0 ((_ sign_extend 32) (size!4370 (buf!4844 thiss!1204))) ((_ sign_extend 32) (currentByte!9116 thiss!1204)) ((_ sign_extend 32) (currentBit!9111 thiss!1204))))))

(declare-fun lt!295390 () (_ BitVec 64))

(declare-fun lt!295389 () (_ BitVec 64))

(assert (=> d!65169 (= lt!295385 (bvmul lt!295390 lt!295389))))

(assert (=> d!65169 (or (= lt!295390 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!295389 (bvsdiv (bvmul lt!295390 lt!295389) lt!295390)))))

(assert (=> d!65169 (= lt!295389 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65169 (= lt!295390 ((_ sign_extend 32) (size!4370 (buf!4844 thiss!1204))))))

(assert (=> d!65169 (= lt!295388 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9116 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9111 thiss!1204))))))

(assert (=> d!65169 (invariant!0 (currentBit!9111 thiss!1204) (currentByte!9116 thiss!1204) (size!4370 (buf!4844 thiss!1204)))))

(assert (=> d!65169 (= (bitIndex!0 (size!4370 (buf!4844 thiss!1204)) (currentByte!9116 thiss!1204) (currentBit!9111 thiss!1204)) lt!295388)))

(declare-fun b!190386 () Bool)

(declare-fun res!158833 () Bool)

(assert (=> b!190386 (=> (not res!158833) (not e!131370))))

(assert (=> b!190386 (= res!158833 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!295388))))

(declare-fun b!190387 () Bool)

(declare-fun lt!295387 () (_ BitVec 64))

(assert (=> b!190387 (= e!131370 (bvsle lt!295388 (bvmul lt!295387 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190387 (or (= lt!295387 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!295387 #b0000000000000000000000000000000000000000000000000000000000001000) lt!295387)))))

(assert (=> b!190387 (= lt!295387 ((_ sign_extend 32) (size!4370 (buf!4844 thiss!1204))))))

(assert (= (and d!65169 res!158834) b!190386))

(assert (= (and b!190386 res!158833) b!190387))

(assert (=> d!65169 m!295625))

(assert (=> d!65169 m!295537))

(assert (=> b!190301 d!65169))

(declare-fun d!65171 () Bool)

(declare-fun e!131371 () Bool)

(assert (=> d!65171 e!131371))

(declare-fun res!158835 () Bool)

(assert (=> d!65171 (=> (not res!158835) (not e!131371))))

(declare-fun lt!295392 () (_ BitVec 64))

(declare-fun lt!295391 () BitStream!7848)

(assert (=> d!65171 (= res!158835 (= (bvadd lt!295392 (bvsub lt!295244 lt!295251)) (bitIndex!0 (size!4370 (buf!4844 lt!295391)) (currentByte!9116 lt!295391) (currentBit!9111 lt!295391))))))

(assert (=> d!65171 (or (not (= (bvand lt!295392 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295244 lt!295251) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!295392 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!295392 (bvsub lt!295244 lt!295251)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65171 (= lt!295392 (bitIndex!0 (size!4370 (buf!4844 (_2!8881 lt!295246))) (currentByte!9116 (_2!8881 lt!295246)) (currentBit!9111 (_2!8881 lt!295246))))))

(assert (=> d!65171 (= lt!295391 (_2!8880 (moveBitIndex!0 (_2!8881 lt!295246) (bvsub lt!295244 lt!295251))))))

(assert (=> d!65171 (moveBitIndexPrecond!0 (_2!8881 lt!295246) (bvsub lt!295244 lt!295251))))

(assert (=> d!65171 (= (withMovedBitIndex!0 (_2!8881 lt!295246) (bvsub lt!295244 lt!295251)) lt!295391)))

(declare-fun b!190388 () Bool)

(assert (=> b!190388 (= e!131371 (= (size!4370 (buf!4844 (_2!8881 lt!295246))) (size!4370 (buf!4844 lt!295391))))))

(assert (= (and d!65171 res!158835) b!190388))

(declare-fun m!295645 () Bool)

(assert (=> d!65171 m!295645))

(assert (=> d!65171 m!295495))

(declare-fun m!295647 () Bool)

(assert (=> d!65171 m!295647))

(declare-fun m!295649 () Bool)

(assert (=> d!65171 m!295649))

(assert (=> b!190290 d!65171))

(declare-fun d!65173 () Bool)

(declare-fun e!131372 () Bool)

(assert (=> d!65173 e!131372))

(declare-fun res!158836 () Bool)

(assert (=> d!65173 (=> (not res!158836) (not e!131372))))

(declare-fun lt!295394 () (_ BitVec 64))

(declare-fun lt!295393 () BitStream!7848)

(assert (=> d!65173 (= res!158836 (= (bvadd lt!295394 (bvsub lt!295249 lt!295251)) (bitIndex!0 (size!4370 (buf!4844 lt!295393)) (currentByte!9116 lt!295393) (currentBit!9111 lt!295393))))))

(assert (=> d!65173 (or (not (= (bvand lt!295394 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295249 lt!295251) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!295394 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!295394 (bvsub lt!295249 lt!295251)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65173 (= lt!295394 (bitIndex!0 (size!4370 (buf!4844 (_2!8881 lt!295233))) (currentByte!9116 (_2!8881 lt!295233)) (currentBit!9111 (_2!8881 lt!295233))))))

(assert (=> d!65173 (= lt!295393 (_2!8880 (moveBitIndex!0 (_2!8881 lt!295233) (bvsub lt!295249 lt!295251))))))

(assert (=> d!65173 (moveBitIndexPrecond!0 (_2!8881 lt!295233) (bvsub lt!295249 lt!295251))))

(assert (=> d!65173 (= (withMovedBitIndex!0 (_2!8881 lt!295233) (bvsub lt!295249 lt!295251)) lt!295393)))

(declare-fun b!190389 () Bool)

(assert (=> b!190389 (= e!131372 (= (size!4370 (buf!4844 (_2!8881 lt!295233))) (size!4370 (buf!4844 lt!295393))))))

(assert (= (and d!65173 res!158836) b!190389))

(declare-fun m!295651 () Bool)

(assert (=> d!65173 m!295651))

(declare-fun m!295653 () Bool)

(assert (=> d!65173 m!295653))

(declare-fun m!295655 () Bool)

(assert (=> d!65173 m!295655))

(declare-fun m!295657 () Bool)

(assert (=> d!65173 m!295657))

(assert (=> b!190291 d!65173))

(declare-fun d!65175 () Bool)

(assert (=> d!65175 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4370 (buf!4844 (_1!8881 lt!295246)))) ((_ sign_extend 32) (currentByte!9116 (_1!8881 lt!295246))) ((_ sign_extend 32) (currentBit!9111 (_1!8881 lt!295246))) lt!295227) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4370 (buf!4844 (_1!8881 lt!295246)))) ((_ sign_extend 32) (currentByte!9116 (_1!8881 lt!295246))) ((_ sign_extend 32) (currentBit!9111 (_1!8881 lt!295246)))) lt!295227))))

(declare-fun bs!16210 () Bool)

(assert (= bs!16210 d!65175))

(declare-fun m!295659 () Bool)

(assert (=> bs!16210 m!295659))

(assert (=> b!190289 d!65175))

(declare-fun d!65177 () Bool)

(declare-fun res!158845 () Bool)

(declare-fun e!131378 () Bool)

(assert (=> d!65177 (=> (not res!158845) (not e!131378))))

(assert (=> d!65177 (= res!158845 (= (size!4370 (buf!4844 (_2!8880 lt!295247))) (size!4370 (buf!4844 (_2!8880 lt!295245)))))))

(assert (=> d!65177 (= (isPrefixOf!0 (_2!8880 lt!295247) (_2!8880 lt!295245)) e!131378)))

(declare-fun b!190396 () Bool)

(declare-fun res!158844 () Bool)

(assert (=> b!190396 (=> (not res!158844) (not e!131378))))

(assert (=> b!190396 (= res!158844 (bvsle (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!295247))) (currentByte!9116 (_2!8880 lt!295247)) (currentBit!9111 (_2!8880 lt!295247))) (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!295245))) (currentByte!9116 (_2!8880 lt!295245)) (currentBit!9111 (_2!8880 lt!295245)))))))

(declare-fun b!190397 () Bool)

(declare-fun e!131377 () Bool)

(assert (=> b!190397 (= e!131378 e!131377)))

(declare-fun res!158843 () Bool)

(assert (=> b!190397 (=> res!158843 e!131377)))

(assert (=> b!190397 (= res!158843 (= (size!4370 (buf!4844 (_2!8880 lt!295247))) #b00000000000000000000000000000000))))

(declare-fun b!190398 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9910 array!9910 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!190398 (= e!131377 (arrayBitRangesEq!0 (buf!4844 (_2!8880 lt!295247)) (buf!4844 (_2!8880 lt!295245)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!295247))) (currentByte!9116 (_2!8880 lt!295247)) (currentBit!9111 (_2!8880 lt!295247)))))))

(assert (= (and d!65177 res!158845) b!190396))

(assert (= (and b!190396 res!158844) b!190397))

(assert (= (and b!190397 (not res!158843)) b!190398))

(assert (=> b!190396 m!295489))

(assert (=> b!190396 m!295457))

(assert (=> b!190398 m!295489))

(assert (=> b!190398 m!295489))

(declare-fun m!295661 () Bool)

(assert (=> b!190398 m!295661))

(assert (=> b!190300 d!65177))

(declare-fun d!65179 () Bool)

(declare-fun res!158848 () Bool)

(declare-fun e!131380 () Bool)

(assert (=> d!65179 (=> (not res!158848) (not e!131380))))

(assert (=> d!65179 (= res!158848 (= (size!4370 (buf!4844 thiss!1204)) (size!4370 (buf!4844 (_2!8880 lt!295247)))))))

(assert (=> d!65179 (= (isPrefixOf!0 thiss!1204 (_2!8880 lt!295247)) e!131380)))

(declare-fun b!190399 () Bool)

(declare-fun res!158847 () Bool)

(assert (=> b!190399 (=> (not res!158847) (not e!131380))))

(assert (=> b!190399 (= res!158847 (bvsle (bitIndex!0 (size!4370 (buf!4844 thiss!1204)) (currentByte!9116 thiss!1204) (currentBit!9111 thiss!1204)) (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!295247))) (currentByte!9116 (_2!8880 lt!295247)) (currentBit!9111 (_2!8880 lt!295247)))))))

(declare-fun b!190400 () Bool)

(declare-fun e!131379 () Bool)

(assert (=> b!190400 (= e!131380 e!131379)))

(declare-fun res!158846 () Bool)

(assert (=> b!190400 (=> res!158846 e!131379)))

(assert (=> b!190400 (= res!158846 (= (size!4370 (buf!4844 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!190401 () Bool)

(assert (=> b!190401 (= e!131379 (arrayBitRangesEq!0 (buf!4844 thiss!1204) (buf!4844 (_2!8880 lt!295247)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4370 (buf!4844 thiss!1204)) (currentByte!9116 thiss!1204) (currentBit!9111 thiss!1204))))))

(assert (= (and d!65179 res!158848) b!190399))

(assert (= (and b!190399 res!158847) b!190400))

(assert (= (and b!190400 (not res!158846)) b!190401))

(assert (=> b!190399 m!295491))

(assert (=> b!190399 m!295489))

(assert (=> b!190401 m!295491))

(assert (=> b!190401 m!295491))

(declare-fun m!295663 () Bool)

(assert (=> b!190401 m!295663))

(assert (=> b!190299 d!65179))

(declare-fun d!65181 () Bool)

(assert (=> d!65181 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9111 thiss!1204) (currentByte!9116 thiss!1204) (size!4370 (buf!4844 thiss!1204))))))

(declare-fun bs!16211 () Bool)

(assert (= bs!16211 d!65181))

(assert (=> bs!16211 m!295537))

(assert (=> start!41020 d!65181))

(declare-fun d!65183 () Bool)

(assert (=> d!65183 (= (invariant!0 (currentBit!9111 thiss!1204) (currentByte!9116 thiss!1204) (size!4370 (buf!4844 thiss!1204))) (and (bvsge (currentBit!9111 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9111 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9116 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9116 thiss!1204) (size!4370 (buf!4844 thiss!1204))) (and (= (currentBit!9111 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9116 thiss!1204) (size!4370 (buf!4844 thiss!1204)))))))))

(assert (=> b!190288 d!65183))

(assert (=> b!190286 d!65167))

(assert (=> b!190286 d!65169))

(declare-fun d!65185 () Bool)

(declare-fun e!131385 () Bool)

(assert (=> d!65185 e!131385))

(declare-fun res!158857 () Bool)

(assert (=> d!65185 (=> (not res!158857) (not e!131385))))

(declare-fun lt!295404 () tuple2!16470)

(assert (=> d!65185 (= res!158857 (= (size!4370 (buf!4844 thiss!1204)) (size!4370 (buf!4844 (_2!8880 lt!295404)))))))

(declare-fun choose!16 (BitStream!7848 Bool) tuple2!16470)

(assert (=> d!65185 (= lt!295404 (choose!16 thiss!1204 lt!295230))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!65185 (validate_offset_bit!0 ((_ sign_extend 32) (size!4370 (buf!4844 thiss!1204))) ((_ sign_extend 32) (currentByte!9116 thiss!1204)) ((_ sign_extend 32) (currentBit!9111 thiss!1204)))))

(assert (=> d!65185 (= (appendBit!0 thiss!1204 lt!295230) lt!295404)))

(declare-fun b!190413 () Bool)

(declare-fun e!131386 () Bool)

(assert (=> b!190413 (= e!131385 e!131386)))

(declare-fun res!158859 () Bool)

(assert (=> b!190413 (=> (not res!158859) (not e!131386))))

(declare-fun lt!295403 () tuple2!16468)

(assert (=> b!190413 (= res!158859 (and (= (_2!8879 lt!295403) lt!295230) (= (_1!8879 lt!295403) (_2!8880 lt!295404))))))

(assert (=> b!190413 (= lt!295403 (readBitPure!0 (readerFrom!0 (_2!8880 lt!295404) (currentBit!9111 thiss!1204) (currentByte!9116 thiss!1204))))))

(declare-fun b!190411 () Bool)

(declare-fun res!158858 () Bool)

(assert (=> b!190411 (=> (not res!158858) (not e!131385))))

(declare-fun lt!295405 () (_ BitVec 64))

(declare-fun lt!295406 () (_ BitVec 64))

(assert (=> b!190411 (= res!158858 (= (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!295404))) (currentByte!9116 (_2!8880 lt!295404)) (currentBit!9111 (_2!8880 lt!295404))) (bvadd lt!295406 lt!295405)))))

(assert (=> b!190411 (or (not (= (bvand lt!295406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295405 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!295406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!295406 lt!295405) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190411 (= lt!295405 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!190411 (= lt!295406 (bitIndex!0 (size!4370 (buf!4844 thiss!1204)) (currentByte!9116 thiss!1204) (currentBit!9111 thiss!1204)))))

(declare-fun b!190412 () Bool)

(declare-fun res!158860 () Bool)

(assert (=> b!190412 (=> (not res!158860) (not e!131385))))

(assert (=> b!190412 (= res!158860 (isPrefixOf!0 thiss!1204 (_2!8880 lt!295404)))))

(declare-fun b!190414 () Bool)

(assert (=> b!190414 (= e!131386 (= (bitIndex!0 (size!4370 (buf!4844 (_1!8879 lt!295403))) (currentByte!9116 (_1!8879 lt!295403)) (currentBit!9111 (_1!8879 lt!295403))) (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!295404))) (currentByte!9116 (_2!8880 lt!295404)) (currentBit!9111 (_2!8880 lt!295404)))))))

(assert (= (and d!65185 res!158857) b!190411))

(assert (= (and b!190411 res!158858) b!190412))

(assert (= (and b!190412 res!158860) b!190413))

(assert (= (and b!190413 res!158859) b!190414))

(declare-fun m!295665 () Bool)

(assert (=> b!190411 m!295665))

(assert (=> b!190411 m!295491))

(declare-fun m!295667 () Bool)

(assert (=> b!190414 m!295667))

(assert (=> b!190414 m!295665))

(declare-fun m!295669 () Bool)

(assert (=> b!190413 m!295669))

(assert (=> b!190413 m!295669))

(declare-fun m!295671 () Bool)

(assert (=> b!190413 m!295671))

(declare-fun m!295673 () Bool)

(assert (=> b!190412 m!295673))

(declare-fun m!295675 () Bool)

(assert (=> d!65185 m!295675))

(declare-fun m!295677 () Bool)

(assert (=> d!65185 m!295677))

(assert (=> b!190286 d!65185))

(declare-fun d!65187 () Bool)

(declare-datatypes ((tuple2!16486 0))(
  ( (tuple2!16487 (_1!8888 Bool) (_2!8888 BitStream!7848)) )
))
(declare-fun lt!295409 () tuple2!16486)

(declare-fun readBit!0 (BitStream!7848) tuple2!16486)

(assert (=> d!65187 (= lt!295409 (readBit!0 (readerFrom!0 (_2!8880 lt!295247) (currentBit!9111 thiss!1204) (currentByte!9116 thiss!1204))))))

(assert (=> d!65187 (= (readBitPure!0 (readerFrom!0 (_2!8880 lt!295247) (currentBit!9111 thiss!1204) (currentByte!9116 thiss!1204))) (tuple2!16469 (_2!8888 lt!295409) (_1!8888 lt!295409)))))

(declare-fun bs!16212 () Bool)

(assert (= bs!16212 d!65187))

(assert (=> bs!16212 m!295533))

(declare-fun m!295679 () Bool)

(assert (=> bs!16212 m!295679))

(assert (=> b!190287 d!65187))

(declare-fun d!65189 () Bool)

(declare-fun e!131389 () Bool)

(assert (=> d!65189 e!131389))

(declare-fun res!158864 () Bool)

(assert (=> d!65189 (=> (not res!158864) (not e!131389))))

(assert (=> d!65189 (= res!158864 (invariant!0 (currentBit!9111 (_2!8880 lt!295247)) (currentByte!9116 (_2!8880 lt!295247)) (size!4370 (buf!4844 (_2!8880 lt!295247)))))))

(assert (=> d!65189 (= (readerFrom!0 (_2!8880 lt!295247) (currentBit!9111 thiss!1204) (currentByte!9116 thiss!1204)) (BitStream!7849 (buf!4844 (_2!8880 lt!295247)) (currentByte!9116 thiss!1204) (currentBit!9111 thiss!1204)))))

(declare-fun b!190417 () Bool)

(assert (=> b!190417 (= e!131389 (invariant!0 (currentBit!9111 thiss!1204) (currentByte!9116 thiss!1204) (size!4370 (buf!4844 (_2!8880 lt!295247)))))))

(assert (= (and d!65189 res!158864) b!190417))

(assert (=> d!65189 m!295643))

(assert (=> b!190417 m!295509))

(assert (=> b!190287 d!65189))

(declare-fun d!65191 () Bool)

(declare-fun e!131390 () Bool)

(assert (=> d!65191 e!131390))

(declare-fun res!158866 () Bool)

(assert (=> d!65191 (=> (not res!158866) (not e!131390))))

(declare-fun lt!295410 () (_ BitVec 64))

(declare-fun lt!295413 () (_ BitVec 64))

(declare-fun lt!295411 () (_ BitVec 64))

(assert (=> d!65191 (= res!158866 (= lt!295413 (bvsub lt!295410 lt!295411)))))

(assert (=> d!65191 (or (= (bvand lt!295410 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295411 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295410 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295410 lt!295411) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65191 (= lt!295411 (remainingBits!0 ((_ sign_extend 32) (size!4370 (buf!4844 (_1!8879 lt!295238)))) ((_ sign_extend 32) (currentByte!9116 (_1!8879 lt!295238))) ((_ sign_extend 32) (currentBit!9111 (_1!8879 lt!295238)))))))

(declare-fun lt!295415 () (_ BitVec 64))

(declare-fun lt!295414 () (_ BitVec 64))

(assert (=> d!65191 (= lt!295410 (bvmul lt!295415 lt!295414))))

(assert (=> d!65191 (or (= lt!295415 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!295414 (bvsdiv (bvmul lt!295415 lt!295414) lt!295415)))))

(assert (=> d!65191 (= lt!295414 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65191 (= lt!295415 ((_ sign_extend 32) (size!4370 (buf!4844 (_1!8879 lt!295238)))))))

(assert (=> d!65191 (= lt!295413 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9116 (_1!8879 lt!295238))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9111 (_1!8879 lt!295238)))))))

(assert (=> d!65191 (invariant!0 (currentBit!9111 (_1!8879 lt!295238)) (currentByte!9116 (_1!8879 lt!295238)) (size!4370 (buf!4844 (_1!8879 lt!295238))))))

(assert (=> d!65191 (= (bitIndex!0 (size!4370 (buf!4844 (_1!8879 lt!295238))) (currentByte!9116 (_1!8879 lt!295238)) (currentBit!9111 (_1!8879 lt!295238))) lt!295413)))

(declare-fun b!190418 () Bool)

(declare-fun res!158865 () Bool)

(assert (=> b!190418 (=> (not res!158865) (not e!131390))))

(assert (=> b!190418 (= res!158865 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!295413))))

(declare-fun b!190419 () Bool)

(declare-fun lt!295412 () (_ BitVec 64))

(assert (=> b!190419 (= e!131390 (bvsle lt!295413 (bvmul lt!295412 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190419 (or (= lt!295412 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!295412 #b0000000000000000000000000000000000000000000000000000000000001000) lt!295412)))))

(assert (=> b!190419 (= lt!295412 ((_ sign_extend 32) (size!4370 (buf!4844 (_1!8879 lt!295238)))))))

(assert (= (and d!65191 res!158866) b!190418))

(assert (= (and b!190418 res!158865) b!190419))

(declare-fun m!295681 () Bool)

(assert (=> d!65191 m!295681))

(declare-fun m!295683 () Bool)

(assert (=> d!65191 m!295683))

(assert (=> b!190285 d!65191))

(declare-fun d!65193 () Bool)

(assert (=> d!65193 (= (invariant!0 (currentBit!9111 (_2!8880 lt!295245)) (currentByte!9116 (_2!8880 lt!295245)) (size!4370 (buf!4844 (_2!8880 lt!295245)))) (and (bvsge (currentBit!9111 (_2!8880 lt!295245)) #b00000000000000000000000000000000) (bvslt (currentBit!9111 (_2!8880 lt!295245)) #b00000000000000000000000000001000) (bvsge (currentByte!9116 (_2!8880 lt!295245)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9116 (_2!8880 lt!295245)) (size!4370 (buf!4844 (_2!8880 lt!295245)))) (and (= (currentBit!9111 (_2!8880 lt!295245)) #b00000000000000000000000000000000) (= (currentByte!9116 (_2!8880 lt!295245)) (size!4370 (buf!4844 (_2!8880 lt!295245))))))))))

(assert (=> b!190306 d!65193))

(declare-fun d!65195 () Bool)

(assert (=> d!65195 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!190296 d!65195))

(declare-fun d!65197 () Bool)

(declare-fun lt!295416 () tuple2!16486)

(assert (=> d!65197 (= lt!295416 (readBit!0 lt!295240))))

(assert (=> d!65197 (= (readBitPure!0 lt!295240) (tuple2!16469 (_2!8888 lt!295416) (_1!8888 lt!295416)))))

(declare-fun bs!16213 () Bool)

(assert (= bs!16213 d!65197))

(declare-fun m!295685 () Bool)

(assert (=> bs!16213 m!295685))

(assert (=> b!190296 d!65197))

(declare-fun d!65199 () Bool)

(declare-fun lt!295417 () tuple2!16486)

(assert (=> d!65199 (= lt!295417 (readBit!0 (BitStream!7849 (buf!4844 (_2!8880 lt!295245)) (currentByte!9116 thiss!1204) (currentBit!9111 thiss!1204))))))

(assert (=> d!65199 (= (readBitPure!0 (BitStream!7849 (buf!4844 (_2!8880 lt!295245)) (currentByte!9116 thiss!1204) (currentBit!9111 thiss!1204))) (tuple2!16469 (_2!8888 lt!295417) (_1!8888 lt!295417)))))

(declare-fun bs!16214 () Bool)

(assert (= bs!16214 d!65199))

(declare-fun m!295687 () Bool)

(assert (=> bs!16214 m!295687))

(assert (=> b!190296 d!65199))

(declare-fun d!65201 () Bool)

(assert (=> d!65201 (validate_offset_bits!1 ((_ sign_extend 32) (size!4370 (buf!4844 (_2!8880 lt!295245)))) ((_ sign_extend 32) (currentByte!9116 thiss!1204)) ((_ sign_extend 32) (currentBit!9111 thiss!1204)) lt!295227)))

(declare-fun lt!295420 () Unit!13539)

(declare-fun choose!9 (BitStream!7848 array!9910 (_ BitVec 64) BitStream!7848) Unit!13539)

(assert (=> d!65201 (= lt!295420 (choose!9 thiss!1204 (buf!4844 (_2!8880 lt!295245)) lt!295227 (BitStream!7849 (buf!4844 (_2!8880 lt!295245)) (currentByte!9116 thiss!1204) (currentBit!9111 thiss!1204))))))

(assert (=> d!65201 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4844 (_2!8880 lt!295245)) lt!295227) lt!295420)))

(declare-fun bs!16215 () Bool)

(assert (= bs!16215 d!65201))

(assert (=> bs!16215 m!295511))

(declare-fun m!295689 () Bool)

(assert (=> bs!16215 m!295689))

(assert (=> b!190296 d!65201))

(declare-fun d!65203 () Bool)

(declare-fun e!131391 () Bool)

(assert (=> d!65203 e!131391))

(declare-fun res!158868 () Bool)

(assert (=> d!65203 (=> (not res!158868) (not e!131391))))

(declare-fun lt!295421 () (_ BitVec 64))

(declare-fun lt!295422 () (_ BitVec 64))

(declare-fun lt!295424 () (_ BitVec 64))

(assert (=> d!65203 (= res!158868 (= lt!295424 (bvsub lt!295421 lt!295422)))))

(assert (=> d!65203 (or (= (bvand lt!295421 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295422 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295421 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295421 lt!295422) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65203 (= lt!295422 (remainingBits!0 ((_ sign_extend 32) (size!4370 (buf!4844 (_1!8879 lt!295224)))) ((_ sign_extend 32) (currentByte!9116 (_1!8879 lt!295224))) ((_ sign_extend 32) (currentBit!9111 (_1!8879 lt!295224)))))))

(declare-fun lt!295426 () (_ BitVec 64))

(declare-fun lt!295425 () (_ BitVec 64))

(assert (=> d!65203 (= lt!295421 (bvmul lt!295426 lt!295425))))

(assert (=> d!65203 (or (= lt!295426 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!295425 (bvsdiv (bvmul lt!295426 lt!295425) lt!295426)))))

(assert (=> d!65203 (= lt!295425 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65203 (= lt!295426 ((_ sign_extend 32) (size!4370 (buf!4844 (_1!8879 lt!295224)))))))

(assert (=> d!65203 (= lt!295424 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9116 (_1!8879 lt!295224))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9111 (_1!8879 lt!295224)))))))

(assert (=> d!65203 (invariant!0 (currentBit!9111 (_1!8879 lt!295224)) (currentByte!9116 (_1!8879 lt!295224)) (size!4370 (buf!4844 (_1!8879 lt!295224))))))

(assert (=> d!65203 (= (bitIndex!0 (size!4370 (buf!4844 (_1!8879 lt!295224))) (currentByte!9116 (_1!8879 lt!295224)) (currentBit!9111 (_1!8879 lt!295224))) lt!295424)))

(declare-fun b!190420 () Bool)

(declare-fun res!158867 () Bool)

(assert (=> b!190420 (=> (not res!158867) (not e!131391))))

(assert (=> b!190420 (= res!158867 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!295424))))

(declare-fun b!190421 () Bool)

(declare-fun lt!295423 () (_ BitVec 64))

(assert (=> b!190421 (= e!131391 (bvsle lt!295424 (bvmul lt!295423 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190421 (or (= lt!295423 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!295423 #b0000000000000000000000000000000000000000000000000000000000001000) lt!295423)))))

(assert (=> b!190421 (= lt!295423 ((_ sign_extend 32) (size!4370 (buf!4844 (_1!8879 lt!295224)))))))

(assert (= (and d!65203 res!158868) b!190420))

(assert (= (and b!190420 res!158867) b!190421))

(declare-fun m!295691 () Bool)

(assert (=> d!65203 m!295691))

(declare-fun m!295693 () Bool)

(assert (=> d!65203 m!295693))

(assert (=> b!190296 d!65203))

(declare-fun d!65205 () Bool)

(declare-fun lt!295427 () tuple2!16486)

(assert (=> d!65205 (= lt!295427 (readBit!0 (_1!8881 lt!295246)))))

(assert (=> d!65205 (= (readBitPure!0 (_1!8881 lt!295246)) (tuple2!16469 (_2!8888 lt!295427) (_1!8888 lt!295427)))))

(declare-fun bs!16216 () Bool)

(assert (= bs!16216 d!65205))

(declare-fun m!295695 () Bool)

(assert (=> bs!16216 m!295695))

(assert (=> b!190296 d!65205))

(declare-fun d!65207 () Bool)

(assert (=> d!65207 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4370 (buf!4844 (_2!8880 lt!295245)))) ((_ sign_extend 32) (currentByte!9116 thiss!1204)) ((_ sign_extend 32) (currentBit!9111 thiss!1204)) lt!295227) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4370 (buf!4844 (_2!8880 lt!295245)))) ((_ sign_extend 32) (currentByte!9116 thiss!1204)) ((_ sign_extend 32) (currentBit!9111 thiss!1204))) lt!295227))))

(declare-fun bs!16217 () Bool)

(assert (= bs!16217 d!65207))

(declare-fun m!295697 () Bool)

(assert (=> bs!16217 m!295697))

(assert (=> b!190296 d!65207))

(declare-fun lt!295481 () (_ BitVec 64))

(declare-fun lt!295487 () (_ BitVec 64))

(declare-fun lt!295483 () tuple2!16472)

(declare-fun b!190432 () Bool)

(declare-fun e!131397 () Bool)

(assert (=> b!190432 (= e!131397 (= (_1!8881 lt!295483) (withMovedBitIndex!0 (_2!8881 lt!295483) (bvsub lt!295481 lt!295487))))))

(assert (=> b!190432 (or (= (bvand lt!295481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295487 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295481 lt!295487) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190432 (= lt!295487 (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!295245))) (currentByte!9116 (_2!8880 lt!295245)) (currentBit!9111 (_2!8880 lt!295245))))))

(assert (=> b!190432 (= lt!295481 (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!295247))) (currentByte!9116 (_2!8880 lt!295247)) (currentBit!9111 (_2!8880 lt!295247))))))

(declare-fun b!190433 () Bool)

(declare-fun e!131396 () Unit!13539)

(declare-fun Unit!13543 () Unit!13539)

(assert (=> b!190433 (= e!131396 Unit!13543)))

(declare-fun b!190434 () Bool)

(declare-fun lt!295478 () Unit!13539)

(assert (=> b!190434 (= e!131396 lt!295478)))

(declare-fun lt!295482 () (_ BitVec 64))

(assert (=> b!190434 (= lt!295482 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!295484 () (_ BitVec 64))

(assert (=> b!190434 (= lt!295484 (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!295247))) (currentByte!9116 (_2!8880 lt!295247)) (currentBit!9111 (_2!8880 lt!295247))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9910 array!9910 (_ BitVec 64) (_ BitVec 64)) Unit!13539)

(assert (=> b!190434 (= lt!295478 (arrayBitRangesEqSymmetric!0 (buf!4844 (_2!8880 lt!295247)) (buf!4844 (_2!8880 lt!295245)) lt!295482 lt!295484))))

(assert (=> b!190434 (arrayBitRangesEq!0 (buf!4844 (_2!8880 lt!295245)) (buf!4844 (_2!8880 lt!295247)) lt!295482 lt!295484)))

(declare-fun b!190435 () Bool)

(declare-fun res!158877 () Bool)

(assert (=> b!190435 (=> (not res!158877) (not e!131397))))

(assert (=> b!190435 (= res!158877 (isPrefixOf!0 (_2!8881 lt!295483) (_2!8880 lt!295245)))))

(declare-fun d!65209 () Bool)

(assert (=> d!65209 e!131397))

(declare-fun res!158876 () Bool)

(assert (=> d!65209 (=> (not res!158876) (not e!131397))))

(assert (=> d!65209 (= res!158876 (isPrefixOf!0 (_1!8881 lt!295483) (_2!8881 lt!295483)))))

(declare-fun lt!295473 () BitStream!7848)

(assert (=> d!65209 (= lt!295483 (tuple2!16473 lt!295473 (_2!8880 lt!295245)))))

(declare-fun lt!295472 () Unit!13539)

(declare-fun lt!295476 () Unit!13539)

(assert (=> d!65209 (= lt!295472 lt!295476)))

(assert (=> d!65209 (isPrefixOf!0 lt!295473 (_2!8880 lt!295245))))

(assert (=> d!65209 (= lt!295476 (lemmaIsPrefixTransitive!0 lt!295473 (_2!8880 lt!295245) (_2!8880 lt!295245)))))

(declare-fun lt!295477 () Unit!13539)

(declare-fun lt!295480 () Unit!13539)

(assert (=> d!65209 (= lt!295477 lt!295480)))

(assert (=> d!65209 (isPrefixOf!0 lt!295473 (_2!8880 lt!295245))))

(assert (=> d!65209 (= lt!295480 (lemmaIsPrefixTransitive!0 lt!295473 (_2!8880 lt!295247) (_2!8880 lt!295245)))))

(declare-fun lt!295470 () Unit!13539)

(assert (=> d!65209 (= lt!295470 e!131396)))

(declare-fun c!9622 () Bool)

(assert (=> d!65209 (= c!9622 (not (= (size!4370 (buf!4844 (_2!8880 lt!295247))) #b00000000000000000000000000000000)))))

(declare-fun lt!295468 () Unit!13539)

(declare-fun lt!295469 () Unit!13539)

(assert (=> d!65209 (= lt!295468 lt!295469)))

(assert (=> d!65209 (isPrefixOf!0 (_2!8880 lt!295245) (_2!8880 lt!295245))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7848) Unit!13539)

(assert (=> d!65209 (= lt!295469 (lemmaIsPrefixRefl!0 (_2!8880 lt!295245)))))

(declare-fun lt!295486 () Unit!13539)

(declare-fun lt!295485 () Unit!13539)

(assert (=> d!65209 (= lt!295486 lt!295485)))

(assert (=> d!65209 (= lt!295485 (lemmaIsPrefixRefl!0 (_2!8880 lt!295245)))))

(declare-fun lt!295479 () Unit!13539)

(declare-fun lt!295471 () Unit!13539)

(assert (=> d!65209 (= lt!295479 lt!295471)))

(assert (=> d!65209 (isPrefixOf!0 lt!295473 lt!295473)))

(assert (=> d!65209 (= lt!295471 (lemmaIsPrefixRefl!0 lt!295473))))

(declare-fun lt!295474 () Unit!13539)

(declare-fun lt!295475 () Unit!13539)

(assert (=> d!65209 (= lt!295474 lt!295475)))

(assert (=> d!65209 (isPrefixOf!0 (_2!8880 lt!295247) (_2!8880 lt!295247))))

(assert (=> d!65209 (= lt!295475 (lemmaIsPrefixRefl!0 (_2!8880 lt!295247)))))

(assert (=> d!65209 (= lt!295473 (BitStream!7849 (buf!4844 (_2!8880 lt!295245)) (currentByte!9116 (_2!8880 lt!295247)) (currentBit!9111 (_2!8880 lt!295247))))))

(assert (=> d!65209 (isPrefixOf!0 (_2!8880 lt!295247) (_2!8880 lt!295245))))

(assert (=> d!65209 (= (reader!0 (_2!8880 lt!295247) (_2!8880 lt!295245)) lt!295483)))

(declare-fun b!190436 () Bool)

(declare-fun res!158875 () Bool)

(assert (=> b!190436 (=> (not res!158875) (not e!131397))))

(assert (=> b!190436 (= res!158875 (isPrefixOf!0 (_1!8881 lt!295483) (_2!8880 lt!295247)))))

(assert (= (and d!65209 c!9622) b!190434))

(assert (= (and d!65209 (not c!9622)) b!190433))

(assert (= (and d!65209 res!158876) b!190436))

(assert (= (and b!190436 res!158875) b!190435))

(assert (= (and b!190435 res!158877) b!190432))

(declare-fun m!295699 () Bool)

(assert (=> b!190436 m!295699))

(declare-fun m!295701 () Bool)

(assert (=> d!65209 m!295701))

(declare-fun m!295703 () Bool)

(assert (=> d!65209 m!295703))

(declare-fun m!295705 () Bool)

(assert (=> d!65209 m!295705))

(declare-fun m!295707 () Bool)

(assert (=> d!65209 m!295707))

(declare-fun m!295709 () Bool)

(assert (=> d!65209 m!295709))

(declare-fun m!295711 () Bool)

(assert (=> d!65209 m!295711))

(declare-fun m!295713 () Bool)

(assert (=> d!65209 m!295713))

(declare-fun m!295715 () Bool)

(assert (=> d!65209 m!295715))

(declare-fun m!295717 () Bool)

(assert (=> d!65209 m!295717))

(declare-fun m!295719 () Bool)

(assert (=> d!65209 m!295719))

(assert (=> d!65209 m!295487))

(assert (=> b!190434 m!295489))

(declare-fun m!295721 () Bool)

(assert (=> b!190434 m!295721))

(declare-fun m!295723 () Bool)

(assert (=> b!190434 m!295723))

(declare-fun m!295725 () Bool)

(assert (=> b!190435 m!295725))

(declare-fun m!295727 () Bool)

(assert (=> b!190432 m!295727))

(assert (=> b!190432 m!295457))

(assert (=> b!190432 m!295489))

(assert (=> b!190296 d!65209))

(declare-fun d!65211 () Bool)

(assert (=> d!65211 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4370 (buf!4844 (_2!8880 lt!295245)))) ((_ sign_extend 32) (currentByte!9116 (_2!8880 lt!295247))) ((_ sign_extend 32) (currentBit!9111 (_2!8880 lt!295247))) lt!295234) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4370 (buf!4844 (_2!8880 lt!295245)))) ((_ sign_extend 32) (currentByte!9116 (_2!8880 lt!295247))) ((_ sign_extend 32) (currentBit!9111 (_2!8880 lt!295247)))) lt!295234))))

(declare-fun bs!16218 () Bool)

(assert (= bs!16218 d!65211))

(declare-fun m!295729 () Bool)

(assert (=> bs!16218 m!295729))

(assert (=> b!190296 d!65211))

(declare-fun lt!295488 () tuple2!16484)

(declare-fun d!65213 () Bool)

(assert (=> d!65213 (= lt!295488 (readNBitsLSBFirstsLoop!0 (_1!8881 lt!295233) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!295228))))

(assert (=> d!65213 (= (readNBitsLSBFirstsLoopPure!0 (_1!8881 lt!295233) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!295228) (tuple2!16475 (_2!8887 lt!295488) (_1!8887 lt!295488)))))

(declare-fun bs!16219 () Bool)

(assert (= bs!16219 d!65213))

(declare-fun m!295731 () Bool)

(assert (=> bs!16219 m!295731))

(assert (=> b!190296 d!65213))

(declare-fun d!65215 () Bool)

(assert (=> d!65215 (= (invariant!0 (currentBit!9111 thiss!1204) (currentByte!9116 thiss!1204) (size!4370 (buf!4844 (_2!8880 lt!295247)))) (and (bvsge (currentBit!9111 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9111 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9116 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9116 thiss!1204) (size!4370 (buf!4844 (_2!8880 lt!295247)))) (and (= (currentBit!9111 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9116 thiss!1204) (size!4370 (buf!4844 (_2!8880 lt!295247))))))))))

(assert (=> b!190296 d!65215))

(declare-fun d!65217 () Bool)

(declare-fun e!131398 () Bool)

(assert (=> d!65217 e!131398))

(declare-fun res!158879 () Bool)

(assert (=> d!65217 (=> (not res!158879) (not e!131398))))

(declare-fun lt!295492 () (_ BitVec 64))

(declare-fun lt!295490 () (_ BitVec 64))

(declare-fun lt!295489 () (_ BitVec 64))

(assert (=> d!65217 (= res!158879 (= lt!295492 (bvsub lt!295489 lt!295490)))))

(assert (=> d!65217 (or (= (bvand lt!295489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295490 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295489 lt!295490) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65217 (= lt!295490 (remainingBits!0 ((_ sign_extend 32) (size!4370 (buf!4844 (_1!8879 lt!295248)))) ((_ sign_extend 32) (currentByte!9116 (_1!8879 lt!295248))) ((_ sign_extend 32) (currentBit!9111 (_1!8879 lt!295248)))))))

(declare-fun lt!295494 () (_ BitVec 64))

(declare-fun lt!295493 () (_ BitVec 64))

(assert (=> d!65217 (= lt!295489 (bvmul lt!295494 lt!295493))))

(assert (=> d!65217 (or (= lt!295494 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!295493 (bvsdiv (bvmul lt!295494 lt!295493) lt!295494)))))

(assert (=> d!65217 (= lt!295493 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65217 (= lt!295494 ((_ sign_extend 32) (size!4370 (buf!4844 (_1!8879 lt!295248)))))))

(assert (=> d!65217 (= lt!295492 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9116 (_1!8879 lt!295248))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9111 (_1!8879 lt!295248)))))))

(assert (=> d!65217 (invariant!0 (currentBit!9111 (_1!8879 lt!295248)) (currentByte!9116 (_1!8879 lt!295248)) (size!4370 (buf!4844 (_1!8879 lt!295248))))))

(assert (=> d!65217 (= (bitIndex!0 (size!4370 (buf!4844 (_1!8879 lt!295248))) (currentByte!9116 (_1!8879 lt!295248)) (currentBit!9111 (_1!8879 lt!295248))) lt!295492)))

(declare-fun b!190437 () Bool)

(declare-fun res!158878 () Bool)

(assert (=> b!190437 (=> (not res!158878) (not e!131398))))

(assert (=> b!190437 (= res!158878 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!295492))))

(declare-fun b!190438 () Bool)

(declare-fun lt!295491 () (_ BitVec 64))

(assert (=> b!190438 (= e!131398 (bvsle lt!295492 (bvmul lt!295491 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190438 (or (= lt!295491 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!295491 #b0000000000000000000000000000000000000000000000000000000000001000) lt!295491)))))

(assert (=> b!190438 (= lt!295491 ((_ sign_extend 32) (size!4370 (buf!4844 (_1!8879 lt!295248)))))))

(assert (= (and d!65217 res!158879) b!190437))

(assert (= (and b!190437 res!158878) b!190438))

(declare-fun m!295733 () Bool)

(assert (=> d!65217 m!295733))

(declare-fun m!295735 () Bool)

(assert (=> d!65217 m!295735))

(assert (=> b!190296 d!65217))

(declare-fun d!65219 () Bool)

(assert (=> d!65219 (validate_offset_bits!1 ((_ sign_extend 32) (size!4370 (buf!4844 (_2!8880 lt!295245)))) ((_ sign_extend 32) (currentByte!9116 (_2!8880 lt!295247))) ((_ sign_extend 32) (currentBit!9111 (_2!8880 lt!295247))) lt!295234)))

(declare-fun lt!295495 () Unit!13539)

(assert (=> d!65219 (= lt!295495 (choose!9 (_2!8880 lt!295247) (buf!4844 (_2!8880 lt!295245)) lt!295234 (BitStream!7849 (buf!4844 (_2!8880 lt!295245)) (currentByte!9116 (_2!8880 lt!295247)) (currentBit!9111 (_2!8880 lt!295247)))))))

(assert (=> d!65219 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8880 lt!295247) (buf!4844 (_2!8880 lt!295245)) lt!295234) lt!295495)))

(declare-fun bs!16220 () Bool)

(assert (= bs!16220 d!65219))

(assert (=> bs!16220 m!295525))

(declare-fun m!295737 () Bool)

(assert (=> bs!16220 m!295737))

(assert (=> b!190296 d!65219))

(declare-fun d!65221 () Bool)

(declare-fun e!131401 () Bool)

(assert (=> d!65221 e!131401))

(declare-fun res!158882 () Bool)

(assert (=> d!65221 (=> (not res!158882) (not e!131401))))

(declare-fun lt!295505 () tuple2!16468)

(declare-fun lt!295504 () tuple2!16468)

(assert (=> d!65221 (= res!158882 (= (bitIndex!0 (size!4370 (buf!4844 (_1!8879 lt!295505))) (currentByte!9116 (_1!8879 lt!295505)) (currentBit!9111 (_1!8879 lt!295505))) (bitIndex!0 (size!4370 (buf!4844 (_1!8879 lt!295504))) (currentByte!9116 (_1!8879 lt!295504)) (currentBit!9111 (_1!8879 lt!295504)))))))

(declare-fun lt!295506 () BitStream!7848)

(declare-fun lt!295507 () Unit!13539)

(declare-fun choose!50 (BitStream!7848 BitStream!7848 BitStream!7848 tuple2!16468 tuple2!16468 BitStream!7848 Bool tuple2!16468 tuple2!16468 BitStream!7848 Bool) Unit!13539)

(assert (=> d!65221 (= lt!295507 (choose!50 lt!295240 (_2!8880 lt!295245) lt!295506 lt!295505 (tuple2!16469 (_1!8879 lt!295505) (_2!8879 lt!295505)) (_1!8879 lt!295505) (_2!8879 lt!295505) lt!295504 (tuple2!16469 (_1!8879 lt!295504) (_2!8879 lt!295504)) (_1!8879 lt!295504) (_2!8879 lt!295504)))))

(assert (=> d!65221 (= lt!295504 (readBitPure!0 lt!295506))))

(assert (=> d!65221 (= lt!295505 (readBitPure!0 lt!295240))))

(assert (=> d!65221 (= lt!295506 (BitStream!7849 (buf!4844 (_2!8880 lt!295245)) (currentByte!9116 lt!295240) (currentBit!9111 lt!295240)))))

(assert (=> d!65221 (invariant!0 (currentBit!9111 lt!295240) (currentByte!9116 lt!295240) (size!4370 (buf!4844 (_2!8880 lt!295245))))))

(assert (=> d!65221 (= (readBitPrefixLemma!0 lt!295240 (_2!8880 lt!295245)) lt!295507)))

(declare-fun b!190441 () Bool)

(assert (=> b!190441 (= e!131401 (= (_2!8879 lt!295505) (_2!8879 lt!295504)))))

(assert (= (and d!65221 res!158882) b!190441))

(declare-fun m!295739 () Bool)

(assert (=> d!65221 m!295739))

(assert (=> d!65221 m!295501))

(declare-fun m!295741 () Bool)

(assert (=> d!65221 m!295741))

(declare-fun m!295743 () Bool)

(assert (=> d!65221 m!295743))

(declare-fun m!295745 () Bool)

(assert (=> d!65221 m!295745))

(declare-fun m!295747 () Bool)

(assert (=> d!65221 m!295747))

(assert (=> b!190296 d!65221))

(declare-fun d!65223 () Bool)

(declare-fun lt!295508 () tuple2!16484)

(assert (=> d!65223 (= lt!295508 (readNBitsLSBFirstsLoop!0 (_1!8881 lt!295246) nBits!348 i!590 lt!295242))))

(assert (=> d!65223 (= (readNBitsLSBFirstsLoopPure!0 (_1!8881 lt!295246) nBits!348 i!590 lt!295242) (tuple2!16475 (_2!8887 lt!295508) (_1!8887 lt!295508)))))

(declare-fun bs!16221 () Bool)

(assert (= bs!16221 d!65223))

(declare-fun m!295749 () Bool)

(assert (=> bs!16221 m!295749))

(assert (=> b!190296 d!65223))

(declare-fun lt!295522 () (_ BitVec 64))

(declare-fun b!190442 () Bool)

(declare-fun e!131403 () Bool)

(declare-fun lt!295524 () tuple2!16472)

(declare-fun lt!295528 () (_ BitVec 64))

(assert (=> b!190442 (= e!131403 (= (_1!8881 lt!295524) (withMovedBitIndex!0 (_2!8881 lt!295524) (bvsub lt!295522 lt!295528))))))

(assert (=> b!190442 (or (= (bvand lt!295522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295528 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295522 lt!295528) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190442 (= lt!295528 (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!295245))) (currentByte!9116 (_2!8880 lt!295245)) (currentBit!9111 (_2!8880 lt!295245))))))

(assert (=> b!190442 (= lt!295522 (bitIndex!0 (size!4370 (buf!4844 thiss!1204)) (currentByte!9116 thiss!1204) (currentBit!9111 thiss!1204)))))

(declare-fun b!190443 () Bool)

(declare-fun e!131402 () Unit!13539)

(declare-fun Unit!13544 () Unit!13539)

(assert (=> b!190443 (= e!131402 Unit!13544)))

(declare-fun b!190444 () Bool)

(declare-fun lt!295519 () Unit!13539)

(assert (=> b!190444 (= e!131402 lt!295519)))

(declare-fun lt!295523 () (_ BitVec 64))

(assert (=> b!190444 (= lt!295523 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!295525 () (_ BitVec 64))

(assert (=> b!190444 (= lt!295525 (bitIndex!0 (size!4370 (buf!4844 thiss!1204)) (currentByte!9116 thiss!1204) (currentBit!9111 thiss!1204)))))

(assert (=> b!190444 (= lt!295519 (arrayBitRangesEqSymmetric!0 (buf!4844 thiss!1204) (buf!4844 (_2!8880 lt!295245)) lt!295523 lt!295525))))

(assert (=> b!190444 (arrayBitRangesEq!0 (buf!4844 (_2!8880 lt!295245)) (buf!4844 thiss!1204) lt!295523 lt!295525)))

(declare-fun b!190445 () Bool)

(declare-fun res!158885 () Bool)

(assert (=> b!190445 (=> (not res!158885) (not e!131403))))

(assert (=> b!190445 (= res!158885 (isPrefixOf!0 (_2!8881 lt!295524) (_2!8880 lt!295245)))))

(declare-fun d!65225 () Bool)

(assert (=> d!65225 e!131403))

(declare-fun res!158884 () Bool)

(assert (=> d!65225 (=> (not res!158884) (not e!131403))))

(assert (=> d!65225 (= res!158884 (isPrefixOf!0 (_1!8881 lt!295524) (_2!8881 lt!295524)))))

(declare-fun lt!295514 () BitStream!7848)

(assert (=> d!65225 (= lt!295524 (tuple2!16473 lt!295514 (_2!8880 lt!295245)))))

(declare-fun lt!295513 () Unit!13539)

(declare-fun lt!295517 () Unit!13539)

(assert (=> d!65225 (= lt!295513 lt!295517)))

(assert (=> d!65225 (isPrefixOf!0 lt!295514 (_2!8880 lt!295245))))

(assert (=> d!65225 (= lt!295517 (lemmaIsPrefixTransitive!0 lt!295514 (_2!8880 lt!295245) (_2!8880 lt!295245)))))

(declare-fun lt!295518 () Unit!13539)

(declare-fun lt!295521 () Unit!13539)

(assert (=> d!65225 (= lt!295518 lt!295521)))

(assert (=> d!65225 (isPrefixOf!0 lt!295514 (_2!8880 lt!295245))))

(assert (=> d!65225 (= lt!295521 (lemmaIsPrefixTransitive!0 lt!295514 thiss!1204 (_2!8880 lt!295245)))))

(declare-fun lt!295511 () Unit!13539)

(assert (=> d!65225 (= lt!295511 e!131402)))

(declare-fun c!9623 () Bool)

(assert (=> d!65225 (= c!9623 (not (= (size!4370 (buf!4844 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!295509 () Unit!13539)

(declare-fun lt!295510 () Unit!13539)

(assert (=> d!65225 (= lt!295509 lt!295510)))

(assert (=> d!65225 (isPrefixOf!0 (_2!8880 lt!295245) (_2!8880 lt!295245))))

(assert (=> d!65225 (= lt!295510 (lemmaIsPrefixRefl!0 (_2!8880 lt!295245)))))

(declare-fun lt!295527 () Unit!13539)

(declare-fun lt!295526 () Unit!13539)

(assert (=> d!65225 (= lt!295527 lt!295526)))

(assert (=> d!65225 (= lt!295526 (lemmaIsPrefixRefl!0 (_2!8880 lt!295245)))))

(declare-fun lt!295520 () Unit!13539)

(declare-fun lt!295512 () Unit!13539)

(assert (=> d!65225 (= lt!295520 lt!295512)))

(assert (=> d!65225 (isPrefixOf!0 lt!295514 lt!295514)))

(assert (=> d!65225 (= lt!295512 (lemmaIsPrefixRefl!0 lt!295514))))

(declare-fun lt!295515 () Unit!13539)

(declare-fun lt!295516 () Unit!13539)

(assert (=> d!65225 (= lt!295515 lt!295516)))

(assert (=> d!65225 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!65225 (= lt!295516 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!65225 (= lt!295514 (BitStream!7849 (buf!4844 (_2!8880 lt!295245)) (currentByte!9116 thiss!1204) (currentBit!9111 thiss!1204)))))

(assert (=> d!65225 (isPrefixOf!0 thiss!1204 (_2!8880 lt!295245))))

(assert (=> d!65225 (= (reader!0 thiss!1204 (_2!8880 lt!295245)) lt!295524)))

(declare-fun b!190446 () Bool)

(declare-fun res!158883 () Bool)

(assert (=> b!190446 (=> (not res!158883) (not e!131403))))

(assert (=> b!190446 (= res!158883 (isPrefixOf!0 (_1!8881 lt!295524) thiss!1204))))

(assert (= (and d!65225 c!9623) b!190444))

(assert (= (and d!65225 (not c!9623)) b!190443))

(assert (= (and d!65225 res!158884) b!190446))

(assert (= (and b!190446 res!158883) b!190445))

(assert (= (and b!190445 res!158885) b!190442))

(declare-fun m!295751 () Bool)

(assert (=> b!190446 m!295751))

(declare-fun m!295753 () Bool)

(assert (=> d!65225 m!295753))

(declare-fun m!295755 () Bool)

(assert (=> d!65225 m!295755))

(declare-fun m!295757 () Bool)

(assert (=> d!65225 m!295757))

(assert (=> d!65225 m!295707))

(declare-fun m!295759 () Bool)

(assert (=> d!65225 m!295759))

(declare-fun m!295761 () Bool)

(assert (=> d!65225 m!295761))

(declare-fun m!295763 () Bool)

(assert (=> d!65225 m!295763))

(declare-fun m!295765 () Bool)

(assert (=> d!65225 m!295765))

(assert (=> d!65225 m!295717))

(declare-fun m!295767 () Bool)

(assert (=> d!65225 m!295767))

(assert (=> d!65225 m!295459))

(assert (=> b!190444 m!295491))

(declare-fun m!295769 () Bool)

(assert (=> b!190444 m!295769))

(declare-fun m!295771 () Bool)

(assert (=> b!190444 m!295771))

(declare-fun m!295773 () Bool)

(assert (=> b!190445 m!295773))

(declare-fun m!295775 () Bool)

(assert (=> b!190442 m!295775))

(assert (=> b!190442 m!295457))

(assert (=> b!190442 m!295491))

(assert (=> b!190296 d!65225))

(declare-fun d!65227 () Bool)

(declare-fun e!131404 () Bool)

(assert (=> d!65227 e!131404))

(declare-fun res!158887 () Bool)

(assert (=> d!65227 (=> (not res!158887) (not e!131404))))

(declare-fun lt!295532 () (_ BitVec 64))

(declare-fun lt!295530 () (_ BitVec 64))

(declare-fun lt!295529 () (_ BitVec 64))

(assert (=> d!65227 (= res!158887 (= lt!295532 (bvsub lt!295529 lt!295530)))))

(assert (=> d!65227 (or (= (bvand lt!295529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295530 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295529 lt!295530) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65227 (= lt!295530 (remainingBits!0 ((_ sign_extend 32) (size!4370 (buf!4844 (_2!8880 lt!295245)))) ((_ sign_extend 32) (currentByte!9116 (_2!8880 lt!295245))) ((_ sign_extend 32) (currentBit!9111 (_2!8880 lt!295245)))))))

(declare-fun lt!295534 () (_ BitVec 64))

(declare-fun lt!295533 () (_ BitVec 64))

(assert (=> d!65227 (= lt!295529 (bvmul lt!295534 lt!295533))))

(assert (=> d!65227 (or (= lt!295534 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!295533 (bvsdiv (bvmul lt!295534 lt!295533) lt!295534)))))

(assert (=> d!65227 (= lt!295533 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65227 (= lt!295534 ((_ sign_extend 32) (size!4370 (buf!4844 (_2!8880 lt!295245)))))))

(assert (=> d!65227 (= lt!295532 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9116 (_2!8880 lt!295245))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9111 (_2!8880 lt!295245)))))))

(assert (=> d!65227 (invariant!0 (currentBit!9111 (_2!8880 lt!295245)) (currentByte!9116 (_2!8880 lt!295245)) (size!4370 (buf!4844 (_2!8880 lt!295245))))))

(assert (=> d!65227 (= (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!295245))) (currentByte!9116 (_2!8880 lt!295245)) (currentBit!9111 (_2!8880 lt!295245))) lt!295532)))

(declare-fun b!190447 () Bool)

(declare-fun res!158886 () Bool)

(assert (=> b!190447 (=> (not res!158886) (not e!131404))))

(assert (=> b!190447 (= res!158886 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!295532))))

(declare-fun b!190448 () Bool)

(declare-fun lt!295531 () (_ BitVec 64))

(assert (=> b!190448 (= e!131404 (bvsle lt!295532 (bvmul lt!295531 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190448 (or (= lt!295531 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!295531 #b0000000000000000000000000000000000000000000000000000000000001000) lt!295531)))))

(assert (=> b!190448 (= lt!295531 ((_ sign_extend 32) (size!4370 (buf!4844 (_2!8880 lt!295245)))))))

(assert (= (and d!65227 res!158887) b!190447))

(assert (= (and b!190447 res!158886) b!190448))

(declare-fun m!295777 () Bool)

(assert (=> d!65227 m!295777))

(assert (=> d!65227 m!295539))

(assert (=> b!190305 d!65227))

(declare-fun d!65229 () Bool)

(declare-fun res!158890 () Bool)

(declare-fun e!131406 () Bool)

(assert (=> d!65229 (=> (not res!158890) (not e!131406))))

(assert (=> d!65229 (= res!158890 (= (size!4370 (buf!4844 thiss!1204)) (size!4370 (buf!4844 (_2!8880 lt!295245)))))))

(assert (=> d!65229 (= (isPrefixOf!0 thiss!1204 (_2!8880 lt!295245)) e!131406)))

(declare-fun b!190449 () Bool)

(declare-fun res!158889 () Bool)

(assert (=> b!190449 (=> (not res!158889) (not e!131406))))

(assert (=> b!190449 (= res!158889 (bvsle (bitIndex!0 (size!4370 (buf!4844 thiss!1204)) (currentByte!9116 thiss!1204) (currentBit!9111 thiss!1204)) (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!295245))) (currentByte!9116 (_2!8880 lt!295245)) (currentBit!9111 (_2!8880 lt!295245)))))))

(declare-fun b!190450 () Bool)

(declare-fun e!131405 () Bool)

(assert (=> b!190450 (= e!131406 e!131405)))

(declare-fun res!158888 () Bool)

(assert (=> b!190450 (=> res!158888 e!131405)))

(assert (=> b!190450 (= res!158888 (= (size!4370 (buf!4844 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!190451 () Bool)

(assert (=> b!190451 (= e!131405 (arrayBitRangesEq!0 (buf!4844 thiss!1204) (buf!4844 (_2!8880 lt!295245)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4370 (buf!4844 thiss!1204)) (currentByte!9116 thiss!1204) (currentBit!9111 thiss!1204))))))

(assert (= (and d!65229 res!158890) b!190449))

(assert (= (and b!190449 res!158889) b!190450))

(assert (= (and b!190450 (not res!158888)) b!190451))

(assert (=> b!190449 m!295491))

(assert (=> b!190449 m!295457))

(assert (=> b!190451 m!295491))

(assert (=> b!190451 m!295491))

(declare-fun m!295779 () Bool)

(assert (=> b!190451 m!295779))

(assert (=> b!190305 d!65229))

(declare-fun d!65231 () Bool)

(assert (=> d!65231 (isPrefixOf!0 thiss!1204 (_2!8880 lt!295245))))

(declare-fun lt!295537 () Unit!13539)

(declare-fun choose!30 (BitStream!7848 BitStream!7848 BitStream!7848) Unit!13539)

(assert (=> d!65231 (= lt!295537 (choose!30 thiss!1204 (_2!8880 lt!295247) (_2!8880 lt!295245)))))

(assert (=> d!65231 (isPrefixOf!0 thiss!1204 (_2!8880 lt!295247))))

(assert (=> d!65231 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8880 lt!295247) (_2!8880 lt!295245)) lt!295537)))

(declare-fun bs!16222 () Bool)

(assert (= bs!16222 d!65231))

(assert (=> bs!16222 m!295459))

(declare-fun m!295781 () Bool)

(assert (=> bs!16222 m!295781))

(assert (=> bs!16222 m!295465))

(assert (=> b!190305 d!65231))

(declare-fun b!190640 () Bool)

(declare-fun e!131514 () Bool)

(declare-fun e!131513 () Bool)

(assert (=> b!190640 (= e!131514 e!131513)))

(declare-fun res!159059 () Bool)

(assert (=> b!190640 (=> (not res!159059) (not e!131513))))

(declare-fun lt!296098 () tuple2!16474)

(assert (=> b!190640 (= res!159059 (= (_2!8882 lt!296098) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!296069 () tuple2!16472)

(assert (=> b!190640 (= lt!296098 (readNBitsLSBFirstsLoopPure!0 (_1!8881 lt!296069) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!296113 () Unit!13539)

(declare-fun lt!296095 () Unit!13539)

(assert (=> b!190640 (= lt!296113 lt!296095)))

(declare-fun lt!296103 () tuple2!16470)

(declare-fun lt!296092 () (_ BitVec 64))

(assert (=> b!190640 (validate_offset_bits!1 ((_ sign_extend 32) (size!4370 (buf!4844 (_2!8880 lt!296103)))) ((_ sign_extend 32) (currentByte!9116 (_2!8880 lt!295247))) ((_ sign_extend 32) (currentBit!9111 (_2!8880 lt!295247))) lt!296092)))

(assert (=> b!190640 (= lt!296095 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8880 lt!295247) (buf!4844 (_2!8880 lt!296103)) lt!296092))))

(declare-fun e!131521 () Bool)

(assert (=> b!190640 e!131521))

(declare-fun res!159055 () Bool)

(assert (=> b!190640 (=> (not res!159055) (not e!131521))))

(assert (=> b!190640 (= res!159055 (and (= (size!4370 (buf!4844 (_2!8880 lt!295247))) (size!4370 (buf!4844 (_2!8880 lt!296103)))) (bvsge lt!296092 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190640 (= lt!296092 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!190640 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!190640 (= lt!296069 (reader!0 (_2!8880 lt!295247) (_2!8880 lt!296103)))))

(declare-fun d!65233 () Bool)

(assert (=> d!65233 e!131514))

(declare-fun res!159063 () Bool)

(assert (=> d!65233 (=> (not res!159063) (not e!131514))))

(assert (=> d!65233 (= res!159063 (invariant!0 (currentBit!9111 (_2!8880 lt!296103)) (currentByte!9116 (_2!8880 lt!296103)) (size!4370 (buf!4844 (_2!8880 lt!296103)))))))

(declare-fun e!131518 () tuple2!16470)

(assert (=> d!65233 (= lt!296103 e!131518)))

(declare-fun c!9637 () Bool)

(assert (=> d!65233 (= c!9637 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!65233 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!65233 (= (appendBitsLSBFirstLoopTR!0 (_2!8880 lt!295247) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!296103)))

(declare-fun b!190641 () Bool)

(declare-fun e!131520 () Bool)

(declare-fun lt!296112 () tuple2!16474)

(declare-fun lt!296118 () tuple2!16472)

(assert (=> b!190641 (= e!131520 (= (_1!8882 lt!296112) (_2!8881 lt!296118)))))

(declare-fun b!190642 () Bool)

(declare-fun e!131516 () Bool)

(declare-fun lt!296120 () tuple2!16468)

(declare-fun lt!296109 () tuple2!16470)

(assert (=> b!190642 (= e!131516 (= (bitIndex!0 (size!4370 (buf!4844 (_1!8879 lt!296120))) (currentByte!9116 (_1!8879 lt!296120)) (currentBit!9111 (_1!8879 lt!296120))) (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!296109))) (currentByte!9116 (_2!8880 lt!296109)) (currentBit!9111 (_2!8880 lt!296109)))))))

(declare-fun b!190643 () Bool)

(declare-fun e!131519 () (_ BitVec 64))

(assert (=> b!190643 (= e!131519 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!190644 () Bool)

(declare-fun res!159058 () Bool)

(assert (=> b!190644 (=> (not res!159058) (not e!131514))))

(assert (=> b!190644 (= res!159058 (= (size!4370 (buf!4844 (_2!8880 lt!295247))) (size!4370 (buf!4844 (_2!8880 lt!296103)))))))

(declare-fun b!190645 () Bool)

(assert (=> b!190645 (= e!131521 (validate_offset_bits!1 ((_ sign_extend 32) (size!4370 (buf!4844 (_2!8880 lt!295247)))) ((_ sign_extend 32) (currentByte!9116 (_2!8880 lt!295247))) ((_ sign_extend 32) (currentBit!9111 (_2!8880 lt!295247))) lt!296092))))

(declare-fun b!190646 () Bool)

(declare-fun res!159061 () Bool)

(assert (=> b!190646 (= res!159061 (= (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!296109))) (currentByte!9116 (_2!8880 lt!296109)) (currentBit!9111 (_2!8880 lt!296109))) (bvadd (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!295247))) (currentByte!9116 (_2!8880 lt!295247)) (currentBit!9111 (_2!8880 lt!295247))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!131515 () Bool)

(assert (=> b!190646 (=> (not res!159061) (not e!131515))))

(declare-fun b!190647 () Bool)

(assert (=> b!190647 (= e!131519 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!190648 () Bool)

(declare-fun Unit!13545 () Unit!13539)

(assert (=> b!190648 (= e!131518 (tuple2!16471 Unit!13545 (_2!8880 lt!295247)))))

(declare-fun lt!296070 () Unit!13539)

(assert (=> b!190648 (= lt!296070 (lemmaIsPrefixRefl!0 (_2!8880 lt!295247)))))

(declare-fun call!3032 () Bool)

(assert (=> b!190648 call!3032))

(declare-fun lt!296097 () Unit!13539)

(assert (=> b!190648 (= lt!296097 lt!296070)))

(declare-fun b!190649 () Bool)

(declare-fun lt!296119 () tuple2!16470)

(assert (=> b!190649 (= e!131518 (tuple2!16471 (_1!8880 lt!296119) (_2!8880 lt!296119)))))

(declare-fun lt!296072 () Bool)

(assert (=> b!190649 (= lt!296072 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190649 (= lt!296109 (appendBit!0 (_2!8880 lt!295247) lt!296072))))

(declare-fun res!159056 () Bool)

(assert (=> b!190649 (= res!159056 (= (size!4370 (buf!4844 (_2!8880 lt!295247))) (size!4370 (buf!4844 (_2!8880 lt!296109)))))))

(assert (=> b!190649 (=> (not res!159056) (not e!131515))))

(assert (=> b!190649 e!131515))

(declare-fun lt!296090 () tuple2!16470)

(assert (=> b!190649 (= lt!296090 lt!296109)))

(assert (=> b!190649 (= lt!296119 (appendBitsLSBFirstLoopTR!0 (_2!8880 lt!296090) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!296094 () Unit!13539)

(assert (=> b!190649 (= lt!296094 (lemmaIsPrefixTransitive!0 (_2!8880 lt!295247) (_2!8880 lt!296090) (_2!8880 lt!296119)))))

(assert (=> b!190649 call!3032))

(declare-fun lt!296079 () Unit!13539)

(assert (=> b!190649 (= lt!296079 lt!296094)))

(assert (=> b!190649 (invariant!0 (currentBit!9111 (_2!8880 lt!295247)) (currentByte!9116 (_2!8880 lt!295247)) (size!4370 (buf!4844 (_2!8880 lt!296090))))))

(declare-fun lt!296068 () BitStream!7848)

(assert (=> b!190649 (= lt!296068 (BitStream!7849 (buf!4844 (_2!8880 lt!296090)) (currentByte!9116 (_2!8880 lt!295247)) (currentBit!9111 (_2!8880 lt!295247))))))

(assert (=> b!190649 (invariant!0 (currentBit!9111 lt!296068) (currentByte!9116 lt!296068) (size!4370 (buf!4844 (_2!8880 lt!296119))))))

(declare-fun lt!296075 () BitStream!7848)

(assert (=> b!190649 (= lt!296075 (BitStream!7849 (buf!4844 (_2!8880 lt!296119)) (currentByte!9116 lt!296068) (currentBit!9111 lt!296068)))))

(declare-fun lt!296089 () tuple2!16468)

(assert (=> b!190649 (= lt!296089 (readBitPure!0 lt!296068))))

(declare-fun lt!296116 () tuple2!16468)

(assert (=> b!190649 (= lt!296116 (readBitPure!0 lt!296075))))

(declare-fun lt!296102 () Unit!13539)

(assert (=> b!190649 (= lt!296102 (readBitPrefixLemma!0 lt!296068 (_2!8880 lt!296119)))))

(declare-fun res!159065 () Bool)

(assert (=> b!190649 (= res!159065 (= (bitIndex!0 (size!4370 (buf!4844 (_1!8879 lt!296089))) (currentByte!9116 (_1!8879 lt!296089)) (currentBit!9111 (_1!8879 lt!296089))) (bitIndex!0 (size!4370 (buf!4844 (_1!8879 lt!296116))) (currentByte!9116 (_1!8879 lt!296116)) (currentBit!9111 (_1!8879 lt!296116)))))))

(declare-fun e!131517 () Bool)

(assert (=> b!190649 (=> (not res!159065) (not e!131517))))

(assert (=> b!190649 e!131517))

(declare-fun lt!296107 () Unit!13539)

(assert (=> b!190649 (= lt!296107 lt!296102)))

(declare-fun lt!296083 () tuple2!16472)

(assert (=> b!190649 (= lt!296083 (reader!0 (_2!8880 lt!295247) (_2!8880 lt!296119)))))

(declare-fun lt!296076 () tuple2!16472)

(assert (=> b!190649 (= lt!296076 (reader!0 (_2!8880 lt!296090) (_2!8880 lt!296119)))))

(declare-fun lt!296117 () tuple2!16468)

(assert (=> b!190649 (= lt!296117 (readBitPure!0 (_1!8881 lt!296083)))))

(assert (=> b!190649 (= (_2!8879 lt!296117) lt!296072)))

(declare-fun lt!296088 () Unit!13539)

(declare-fun Unit!13546 () Unit!13539)

(assert (=> b!190649 (= lt!296088 Unit!13546)))

(declare-fun lt!296108 () (_ BitVec 64))

(assert (=> b!190649 (= lt!296108 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!296096 () (_ BitVec 64))

(assert (=> b!190649 (= lt!296096 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!296106 () Unit!13539)

(assert (=> b!190649 (= lt!296106 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8880 lt!295247) (buf!4844 (_2!8880 lt!296119)) lt!296096))))

(assert (=> b!190649 (validate_offset_bits!1 ((_ sign_extend 32) (size!4370 (buf!4844 (_2!8880 lt!296119)))) ((_ sign_extend 32) (currentByte!9116 (_2!8880 lt!295247))) ((_ sign_extend 32) (currentBit!9111 (_2!8880 lt!295247))) lt!296096)))

(declare-fun lt!296066 () Unit!13539)

(assert (=> b!190649 (= lt!296066 lt!296106)))

(declare-fun lt!296081 () tuple2!16474)

(assert (=> b!190649 (= lt!296081 (readNBitsLSBFirstsLoopPure!0 (_1!8881 lt!296083) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296108))))

(declare-fun lt!296115 () (_ BitVec 64))

(assert (=> b!190649 (= lt!296115 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!296121 () Unit!13539)

(assert (=> b!190649 (= lt!296121 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8880 lt!296090) (buf!4844 (_2!8880 lt!296119)) lt!296115))))

(assert (=> b!190649 (validate_offset_bits!1 ((_ sign_extend 32) (size!4370 (buf!4844 (_2!8880 lt!296119)))) ((_ sign_extend 32) (currentByte!9116 (_2!8880 lt!296090))) ((_ sign_extend 32) (currentBit!9111 (_2!8880 lt!296090))) lt!296115)))

(declare-fun lt!296086 () Unit!13539)

(assert (=> b!190649 (= lt!296086 lt!296121)))

(declare-fun lt!296074 () tuple2!16474)

(assert (=> b!190649 (= lt!296074 (readNBitsLSBFirstsLoopPure!0 (_1!8881 lt!296076) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!296108 (ite (_2!8879 lt!296117) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!296111 () tuple2!16474)

(assert (=> b!190649 (= lt!296111 (readNBitsLSBFirstsLoopPure!0 (_1!8881 lt!296083) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296108))))

(declare-fun c!9636 () Bool)

(assert (=> b!190649 (= c!9636 (_2!8879 (readBitPure!0 (_1!8881 lt!296083))))))

(declare-fun lt!296110 () tuple2!16474)

(assert (=> b!190649 (= lt!296110 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8881 lt!296083) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!296108 e!131519)))))

(declare-fun lt!296073 () Unit!13539)

(assert (=> b!190649 (= lt!296073 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8881 lt!296083) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296108))))

(assert (=> b!190649 (and (= (_2!8882 lt!296111) (_2!8882 lt!296110)) (= (_1!8882 lt!296111) (_1!8882 lt!296110)))))

(declare-fun lt!296085 () Unit!13539)

(assert (=> b!190649 (= lt!296085 lt!296073)))

(assert (=> b!190649 (= (_1!8881 lt!296083) (withMovedBitIndex!0 (_2!8881 lt!296083) (bvsub (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!295247))) (currentByte!9116 (_2!8880 lt!295247)) (currentBit!9111 (_2!8880 lt!295247))) (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!296119))) (currentByte!9116 (_2!8880 lt!296119)) (currentBit!9111 (_2!8880 lt!296119))))))))

(declare-fun lt!296078 () Unit!13539)

(declare-fun Unit!13547 () Unit!13539)

(assert (=> b!190649 (= lt!296078 Unit!13547)))

(assert (=> b!190649 (= (_1!8881 lt!296076) (withMovedBitIndex!0 (_2!8881 lt!296076) (bvsub (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!296090))) (currentByte!9116 (_2!8880 lt!296090)) (currentBit!9111 (_2!8880 lt!296090))) (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!296119))) (currentByte!9116 (_2!8880 lt!296119)) (currentBit!9111 (_2!8880 lt!296119))))))))

(declare-fun lt!296101 () Unit!13539)

(declare-fun Unit!13548 () Unit!13539)

(assert (=> b!190649 (= lt!296101 Unit!13548)))

(assert (=> b!190649 (= (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!295247))) (currentByte!9116 (_2!8880 lt!295247)) (currentBit!9111 (_2!8880 lt!295247))) (bvsub (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!296090))) (currentByte!9116 (_2!8880 lt!296090)) (currentBit!9111 (_2!8880 lt!296090))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!296084 () Unit!13539)

(declare-fun Unit!13549 () Unit!13539)

(assert (=> b!190649 (= lt!296084 Unit!13549)))

(assert (=> b!190649 (= (_2!8882 lt!296081) (_2!8882 lt!296074))))

(declare-fun lt!296071 () Unit!13539)

(declare-fun Unit!13550 () Unit!13539)

(assert (=> b!190649 (= lt!296071 Unit!13550)))

(assert (=> b!190649 (invariant!0 (currentBit!9111 (_2!8880 lt!296119)) (currentByte!9116 (_2!8880 lt!296119)) (size!4370 (buf!4844 (_2!8880 lt!296119))))))

(declare-fun lt!296105 () Unit!13539)

(declare-fun Unit!13551 () Unit!13539)

(assert (=> b!190649 (= lt!296105 Unit!13551)))

(assert (=> b!190649 (= (size!4370 (buf!4844 (_2!8880 lt!295247))) (size!4370 (buf!4844 (_2!8880 lt!296119))))))

(declare-fun lt!296100 () Unit!13539)

(declare-fun Unit!13552 () Unit!13539)

(assert (=> b!190649 (= lt!296100 Unit!13552)))

(assert (=> b!190649 (= (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!296119))) (currentByte!9116 (_2!8880 lt!296119)) (currentBit!9111 (_2!8880 lt!296119))) (bvsub (bvadd (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!295247))) (currentByte!9116 (_2!8880 lt!295247)) (currentBit!9111 (_2!8880 lt!295247))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!296080 () Unit!13539)

(declare-fun Unit!13553 () Unit!13539)

(assert (=> b!190649 (= lt!296080 Unit!13553)))

(declare-fun lt!296099 () Unit!13539)

(declare-fun Unit!13554 () Unit!13539)

(assert (=> b!190649 (= lt!296099 Unit!13554)))

(assert (=> b!190649 (= lt!296118 (reader!0 (_2!8880 lt!295247) (_2!8880 lt!296119)))))

(declare-fun lt!296087 () (_ BitVec 64))

(assert (=> b!190649 (= lt!296087 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!296067 () Unit!13539)

(assert (=> b!190649 (= lt!296067 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8880 lt!295247) (buf!4844 (_2!8880 lt!296119)) lt!296087))))

(assert (=> b!190649 (validate_offset_bits!1 ((_ sign_extend 32) (size!4370 (buf!4844 (_2!8880 lt!296119)))) ((_ sign_extend 32) (currentByte!9116 (_2!8880 lt!295247))) ((_ sign_extend 32) (currentBit!9111 (_2!8880 lt!295247))) lt!296087)))

(declare-fun lt!296114 () Unit!13539)

(assert (=> b!190649 (= lt!296114 lt!296067)))

(assert (=> b!190649 (= lt!296112 (readNBitsLSBFirstsLoopPure!0 (_1!8881 lt!296118) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!159064 () Bool)

(assert (=> b!190649 (= res!159064 (= (_2!8882 lt!296112) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!190649 (=> (not res!159064) (not e!131520))))

(assert (=> b!190649 e!131520))

(declare-fun lt!296093 () Unit!13539)

(declare-fun Unit!13555 () Unit!13539)

(assert (=> b!190649 (= lt!296093 Unit!13555)))

(declare-fun bm!3029 () Bool)

(assert (=> bm!3029 (= call!3032 (isPrefixOf!0 (_2!8880 lt!295247) (ite c!9637 (_2!8880 lt!295247) (_2!8880 lt!296119))))))

(declare-fun b!190650 () Bool)

(declare-fun res!159066 () Bool)

(assert (=> b!190650 (= res!159066 (isPrefixOf!0 (_2!8880 lt!295247) (_2!8880 lt!296109)))))

(assert (=> b!190650 (=> (not res!159066) (not e!131515))))

(declare-fun b!190651 () Bool)

(declare-fun res!159057 () Bool)

(assert (=> b!190651 (=> (not res!159057) (not e!131514))))

(declare-fun lt!296091 () (_ BitVec 64))

(declare-fun lt!296077 () (_ BitVec 64))

(assert (=> b!190651 (= res!159057 (= (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!296103))) (currentByte!9116 (_2!8880 lt!296103)) (currentBit!9111 (_2!8880 lt!296103))) (bvsub lt!296077 lt!296091)))))

(assert (=> b!190651 (or (= (bvand lt!296077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!296091 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!296077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296077 lt!296091) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190651 (= lt!296091 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!296082 () (_ BitVec 64))

(declare-fun lt!296104 () (_ BitVec 64))

(assert (=> b!190651 (= lt!296077 (bvadd lt!296082 lt!296104))))

(assert (=> b!190651 (or (not (= (bvand lt!296082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!296104 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!296082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!296082 lt!296104) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190651 (= lt!296104 ((_ sign_extend 32) nBits!348))))

(assert (=> b!190651 (= lt!296082 (bitIndex!0 (size!4370 (buf!4844 (_2!8880 lt!295247))) (currentByte!9116 (_2!8880 lt!295247)) (currentBit!9111 (_2!8880 lt!295247))))))

(declare-fun b!190652 () Bool)

(assert (=> b!190652 (= e!131513 (= (_1!8882 lt!296098) (_2!8881 lt!296069)))))

(declare-fun b!190653 () Bool)

(assert (=> b!190653 (= lt!296120 (readBitPure!0 (readerFrom!0 (_2!8880 lt!296109) (currentBit!9111 (_2!8880 lt!295247)) (currentByte!9116 (_2!8880 lt!295247)))))))

(declare-fun res!159060 () Bool)

(assert (=> b!190653 (= res!159060 (and (= (_2!8879 lt!296120) lt!296072) (= (_1!8879 lt!296120) (_2!8880 lt!296109))))))

(assert (=> b!190653 (=> (not res!159060) (not e!131516))))

(assert (=> b!190653 (= e!131515 e!131516)))

(declare-fun b!190654 () Bool)

(assert (=> b!190654 (= e!131517 (= (_2!8879 lt!296089) (_2!8879 lt!296116)))))

(declare-fun b!190655 () Bool)

(declare-fun res!159062 () Bool)

(assert (=> b!190655 (=> (not res!159062) (not e!131514))))

(assert (=> b!190655 (= res!159062 (isPrefixOf!0 (_2!8880 lt!295247) (_2!8880 lt!296103)))))

(assert (= (and d!65233 c!9637) b!190648))

(assert (= (and d!65233 (not c!9637)) b!190649))

(assert (= (and b!190649 res!159056) b!190646))

(assert (= (and b!190646 res!159061) b!190650))

(assert (= (and b!190650 res!159066) b!190653))

(assert (= (and b!190653 res!159060) b!190642))

(assert (= (and b!190649 res!159065) b!190654))

(assert (= (and b!190649 c!9636) b!190647))

(assert (= (and b!190649 (not c!9636)) b!190643))

(assert (= (and b!190649 res!159064) b!190641))

(assert (= (or b!190648 b!190649) bm!3029))

(assert (= (and d!65233 res!159063) b!190644))

(assert (= (and b!190644 res!159058) b!190651))

(assert (= (and b!190651 res!159057) b!190655))

(assert (= (and b!190655 res!159062) b!190640))

(assert (= (and b!190640 res!159055) b!190645))

(assert (= (and b!190640 res!159059) b!190652))

(declare-fun m!296101 () Bool)

(assert (=> b!190649 m!296101))

(declare-fun m!296103 () Bool)

(assert (=> b!190649 m!296103))

(declare-fun m!296105 () Bool)

(assert (=> b!190649 m!296105))

(declare-fun m!296107 () Bool)

(assert (=> b!190649 m!296107))

(declare-fun m!296109 () Bool)

(assert (=> b!190649 m!296109))

(declare-fun m!296111 () Bool)

(assert (=> b!190649 m!296111))

(declare-fun m!296113 () Bool)

(assert (=> b!190649 m!296113))

(declare-fun m!296115 () Bool)

(assert (=> b!190649 m!296115))

(declare-fun m!296117 () Bool)

(assert (=> b!190649 m!296117))

(declare-fun m!296119 () Bool)

(assert (=> b!190649 m!296119))

(declare-fun m!296121 () Bool)

(assert (=> b!190649 m!296121))

(declare-fun m!296123 () Bool)

(assert (=> b!190649 m!296123))

(declare-fun m!296125 () Bool)

(assert (=> b!190649 m!296125))

(assert (=> b!190649 m!295489))

(declare-fun m!296127 () Bool)

(assert (=> b!190649 m!296127))

(declare-fun m!296129 () Bool)

(assert (=> b!190649 m!296129))

(declare-fun m!296131 () Bool)

(assert (=> b!190649 m!296131))

(declare-fun m!296133 () Bool)

(assert (=> b!190649 m!296133))

(declare-fun m!296135 () Bool)

(assert (=> b!190649 m!296135))

(declare-fun m!296137 () Bool)

(assert (=> b!190649 m!296137))

(declare-fun m!296139 () Bool)

(assert (=> b!190649 m!296139))

(declare-fun m!296141 () Bool)

(assert (=> b!190649 m!296141))

(declare-fun m!296143 () Bool)

(assert (=> b!190649 m!296143))

(declare-fun m!296145 () Bool)

(assert (=> b!190649 m!296145))

(declare-fun m!296147 () Bool)

(assert (=> b!190649 m!296147))

(declare-fun m!296149 () Bool)

(assert (=> b!190649 m!296149))

(declare-fun m!296151 () Bool)

(assert (=> b!190649 m!296151))

(declare-fun m!296153 () Bool)

(assert (=> b!190649 m!296153))

(declare-fun m!296155 () Bool)

(assert (=> b!190649 m!296155))

(declare-fun m!296157 () Bool)

(assert (=> b!190649 m!296157))

(declare-fun m!296159 () Bool)

(assert (=> b!190649 m!296159))

(assert (=> b!190649 m!296153))

(declare-fun m!296161 () Bool)

(assert (=> b!190649 m!296161))

(declare-fun m!296163 () Bool)

(assert (=> b!190649 m!296163))

(declare-fun m!296165 () Bool)

(assert (=> b!190640 m!296165))

(assert (=> b!190640 m!296145))

(assert (=> b!190640 m!296151))

(declare-fun m!296167 () Bool)

(assert (=> b!190640 m!296167))

(declare-fun m!296169 () Bool)

(assert (=> b!190640 m!296169))

(declare-fun m!296171 () Bool)

(assert (=> b!190640 m!296171))

(declare-fun m!296173 () Bool)

(assert (=> b!190651 m!296173))

(assert (=> b!190651 m!295489))

(assert (=> b!190648 m!295713))

(declare-fun m!296175 () Bool)

(assert (=> b!190650 m!296175))

(declare-fun m!296177 () Bool)

(assert (=> b!190642 m!296177))

(declare-fun m!296179 () Bool)

(assert (=> b!190642 m!296179))

(declare-fun m!296181 () Bool)

(assert (=> b!190655 m!296181))

(declare-fun m!296183 () Bool)

(assert (=> b!190653 m!296183))

(assert (=> b!190653 m!296183))

(declare-fun m!296185 () Bool)

(assert (=> b!190653 m!296185))

(declare-fun m!296187 () Bool)

(assert (=> d!65233 m!296187))

(assert (=> b!190646 m!296179))

(assert (=> b!190646 m!295489))

(declare-fun m!296189 () Bool)

(assert (=> b!190645 m!296189))

(declare-fun m!296191 () Bool)

(assert (=> bm!3029 m!296191))

(assert (=> b!190305 d!65233))

(declare-fun d!65387 () Bool)

(declare-fun e!131522 () Bool)

(assert (=> d!65387 e!131522))

(declare-fun res!159068 () Bool)

(assert (=> d!65387 (=> (not res!159068) (not e!131522))))

(declare-fun lt!296125 () (_ BitVec 64))

(declare-fun lt!296122 () (_ BitVec 64))

(declare-fun lt!296123 () (_ BitVec 64))

(assert (=> d!65387 (= res!159068 (= lt!296125 (bvsub lt!296122 lt!296123)))))

(assert (=> d!65387 (or (= (bvand lt!296122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!296123 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!296122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296122 lt!296123) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65387 (= lt!296123 (remainingBits!0 ((_ sign_extend 32) (size!4370 (buf!4844 (_1!8882 lt!295239)))) ((_ sign_extend 32) (currentByte!9116 (_1!8882 lt!295239))) ((_ sign_extend 32) (currentBit!9111 (_1!8882 lt!295239)))))))

(declare-fun lt!296127 () (_ BitVec 64))

(declare-fun lt!296126 () (_ BitVec 64))

(assert (=> d!65387 (= lt!296122 (bvmul lt!296127 lt!296126))))

(assert (=> d!65387 (or (= lt!296127 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!296126 (bvsdiv (bvmul lt!296127 lt!296126) lt!296127)))))

(assert (=> d!65387 (= lt!296126 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65387 (= lt!296127 ((_ sign_extend 32) (size!4370 (buf!4844 (_1!8882 lt!295239)))))))

(assert (=> d!65387 (= lt!296125 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9116 (_1!8882 lt!295239))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9111 (_1!8882 lt!295239)))))))

(assert (=> d!65387 (invariant!0 (currentBit!9111 (_1!8882 lt!295239)) (currentByte!9116 (_1!8882 lt!295239)) (size!4370 (buf!4844 (_1!8882 lt!295239))))))

(assert (=> d!65387 (= (bitIndex!0 (size!4370 (buf!4844 (_1!8882 lt!295239))) (currentByte!9116 (_1!8882 lt!295239)) (currentBit!9111 (_1!8882 lt!295239))) lt!296125)))

(declare-fun b!190656 () Bool)

(declare-fun res!159067 () Bool)

(assert (=> b!190656 (=> (not res!159067) (not e!131522))))

(assert (=> b!190656 (= res!159067 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!296125))))

(declare-fun b!190657 () Bool)

(declare-fun lt!296124 () (_ BitVec 64))

(assert (=> b!190657 (= e!131522 (bvsle lt!296125 (bvmul lt!296124 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190657 (or (= lt!296124 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!296124 #b0000000000000000000000000000000000000000000000000000000000001000) lt!296124)))))

(assert (=> b!190657 (= lt!296124 ((_ sign_extend 32) (size!4370 (buf!4844 (_1!8882 lt!295239)))))))

(assert (= (and d!65387 res!159068) b!190656))

(assert (= (and b!190656 res!159067) b!190657))

(declare-fun m!296193 () Bool)

(assert (=> d!65387 m!296193))

(declare-fun m!296195 () Bool)

(assert (=> d!65387 m!296195))

(assert (=> b!190294 d!65387))

(declare-fun d!65389 () Bool)

(declare-fun e!131523 () Bool)

(assert (=> d!65389 e!131523))

(declare-fun res!159070 () Bool)

(assert (=> d!65389 (=> (not res!159070) (not e!131523))))

(declare-fun lt!296131 () (_ BitVec 64))

(declare-fun lt!296128 () (_ BitVec 64))

(declare-fun lt!296129 () (_ BitVec 64))

(assert (=> d!65389 (= res!159070 (= lt!296131 (bvsub lt!296128 lt!296129)))))

(assert (=> d!65389 (or (= (bvand lt!296128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!296129 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!296128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296128 lt!296129) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65389 (= lt!296129 (remainingBits!0 ((_ sign_extend 32) (size!4370 (buf!4844 (_2!8881 lt!295246)))) ((_ sign_extend 32) (currentByte!9116 (_2!8881 lt!295246))) ((_ sign_extend 32) (currentBit!9111 (_2!8881 lt!295246)))))))

(declare-fun lt!296133 () (_ BitVec 64))

(declare-fun lt!296132 () (_ BitVec 64))

(assert (=> d!65389 (= lt!296128 (bvmul lt!296133 lt!296132))))

(assert (=> d!65389 (or (= lt!296133 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!296132 (bvsdiv (bvmul lt!296133 lt!296132) lt!296133)))))

(assert (=> d!65389 (= lt!296132 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65389 (= lt!296133 ((_ sign_extend 32) (size!4370 (buf!4844 (_2!8881 lt!295246)))))))

(assert (=> d!65389 (= lt!296131 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9116 (_2!8881 lt!295246))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9111 (_2!8881 lt!295246)))))))

(assert (=> d!65389 (invariant!0 (currentBit!9111 (_2!8881 lt!295246)) (currentByte!9116 (_2!8881 lt!295246)) (size!4370 (buf!4844 (_2!8881 lt!295246))))))

(assert (=> d!65389 (= (bitIndex!0 (size!4370 (buf!4844 (_2!8881 lt!295246))) (currentByte!9116 (_2!8881 lt!295246)) (currentBit!9111 (_2!8881 lt!295246))) lt!296131)))

(declare-fun b!190658 () Bool)

(declare-fun res!159069 () Bool)

(assert (=> b!190658 (=> (not res!159069) (not e!131523))))

(assert (=> b!190658 (= res!159069 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!296131))))

(declare-fun b!190659 () Bool)

(declare-fun lt!296130 () (_ BitVec 64))

(assert (=> b!190659 (= e!131523 (bvsle lt!296131 (bvmul lt!296130 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190659 (or (= lt!296130 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!296130 #b0000000000000000000000000000000000000000000000000000000000001000) lt!296130)))))

(assert (=> b!190659 (= lt!296130 ((_ sign_extend 32) (size!4370 (buf!4844 (_2!8881 lt!295246)))))))

(assert (= (and d!65389 res!159070) b!190658))

(assert (= (and b!190658 res!159069) b!190659))

(declare-fun m!296197 () Bool)

(assert (=> d!65389 m!296197))

(declare-fun m!296199 () Bool)

(assert (=> d!65389 m!296199))

(assert (=> b!190294 d!65389))

(assert (=> b!190295 d!65179))

(check-sat (not d!65167) (not d!65219) (not b!190412) (not d!65197) (not b!190642) (not b!190649) (not d!65209) (not b!190436) (not b!190396) (not b!190648) (not d!65159) (not b!190413) (not b!190651) (not b!190449) (not b!190646) (not b!190399) (not d!65211) (not d!65171) (not d!65231) (not b!190432) (not b!190442) (not b!190414) (not d!65165) (not d!65175) (not b!190650) (not d!65387) (not d!65201) (not bm!3029) (not d!65213) (not b!190398) (not d!65233) (not d!65189) (not b!190401) (not b!190446) (not d!65389) (not d!65191) (not d!65187) (not b!190653) (not d!65217) (not b!190434) (not d!65205) (not d!65161) (not d!65227) (not d!65169) (not d!65225) (not d!65163) (not d!65223) (not d!65221) (not d!65199) (not b!190451) (not b!190417) (not d!65207) (not b!190444) (not b!190655) (not d!65185) (not b!190640) (not b!190411) (not d!65173) (not b!190645) (not b!190445) (not d!65203) (not d!65181) (not b!190435))
(check-sat)
