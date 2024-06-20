; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41690 () Bool)

(assert start!41690)

(declare-fun b!196022 () Bool)

(declare-fun e!134746 () Bool)

(declare-fun e!134743 () Bool)

(assert (=> b!196022 (= e!134746 (not e!134743))))

(declare-fun res!163994 () Bool)

(assert (=> b!196022 (=> res!163994 e!134743)))

(declare-fun lt!304762 () (_ BitVec 64))

(declare-fun lt!304761 () (_ BitVec 64))

(assert (=> b!196022 (= res!163994 (not (= lt!304762 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!304761))))))

(declare-datatypes ((array!10064 0))(
  ( (array!10065 (arr!5368 (Array (_ BitVec 32) (_ BitVec 8))) (size!4438 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7984 0))(
  ( (BitStream!7985 (buf!4924 array!10064) (currentByte!9235 (_ BitVec 32)) (currentBit!9230 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13852 0))(
  ( (Unit!13853) )
))
(declare-datatypes ((tuple2!16958 0))(
  ( (tuple2!16959 (_1!9124 Unit!13852) (_2!9124 BitStream!7984)) )
))
(declare-fun lt!304760 () tuple2!16958)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!196022 (= lt!304762 (bitIndex!0 (size!4438 (buf!4924 (_2!9124 lt!304760))) (currentByte!9235 (_2!9124 lt!304760)) (currentBit!9230 (_2!9124 lt!304760))))))

(declare-fun thiss!1204 () BitStream!7984)

(assert (=> b!196022 (= lt!304761 (bitIndex!0 (size!4438 (buf!4924 thiss!1204)) (currentByte!9235 thiss!1204) (currentBit!9230 thiss!1204)))))

(declare-fun e!134747 () Bool)

(assert (=> b!196022 e!134747))

(declare-fun res!163995 () Bool)

(assert (=> b!196022 (=> (not res!163995) (not e!134747))))

(assert (=> b!196022 (= res!163995 (= (size!4438 (buf!4924 thiss!1204)) (size!4438 (buf!4924 (_2!9124 lt!304760)))))))

(declare-fun lt!304757 () Bool)

(declare-fun appendBit!0 (BitStream!7984 Bool) tuple2!16958)

(assert (=> b!196022 (= lt!304760 (appendBit!0 thiss!1204 lt!304757))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!196022 (= lt!304757 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!196023 () Bool)

(declare-fun res!164000 () Bool)

(assert (=> b!196023 (=> (not res!164000) (not e!134746))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!196023 (= res!164000 (validate_offset_bits!1 ((_ sign_extend 32) (size!4438 (buf!4924 thiss!1204))) ((_ sign_extend 32) (currentByte!9235 thiss!1204)) ((_ sign_extend 32) (currentBit!9230 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!196024 () Bool)

(declare-fun e!134744 () Bool)

(assert (=> b!196024 (= e!134747 e!134744)))

(declare-fun res!163993 () Bool)

(assert (=> b!196024 (=> (not res!163993) (not e!134744))))

(declare-fun lt!304756 () (_ BitVec 64))

(declare-fun lt!304754 () (_ BitVec 64))

(assert (=> b!196024 (= res!163993 (= lt!304756 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!304754)))))

(assert (=> b!196024 (= lt!304756 (bitIndex!0 (size!4438 (buf!4924 (_2!9124 lt!304760))) (currentByte!9235 (_2!9124 lt!304760)) (currentBit!9230 (_2!9124 lt!304760))))))

(assert (=> b!196024 (= lt!304754 (bitIndex!0 (size!4438 (buf!4924 thiss!1204)) (currentByte!9235 thiss!1204) (currentBit!9230 thiss!1204)))))

(declare-fun b!196025 () Bool)

(declare-fun e!134749 () Bool)

(declare-fun lt!304758 () tuple2!16958)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!196025 (= e!134749 (invariant!0 (currentBit!9230 (_2!9124 lt!304758)) (currentByte!9235 (_2!9124 lt!304758)) (size!4438 (buf!4924 (_2!9124 lt!304758)))))))

(declare-fun b!196026 () Bool)

(declare-fun res!163992 () Bool)

(assert (=> b!196026 (=> (not res!163992) (not e!134746))))

(assert (=> b!196026 (= res!163992 (invariant!0 (currentBit!9230 thiss!1204) (currentByte!9235 thiss!1204) (size!4438 (buf!4924 thiss!1204))))))

(declare-fun res!163997 () Bool)

(assert (=> start!41690 (=> (not res!163997) (not e!134746))))

(assert (=> start!41690 (= res!163997 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41690 e!134746))

(assert (=> start!41690 true))

(declare-fun e!134748 () Bool)

(declare-fun inv!12 (BitStream!7984) Bool)

(assert (=> start!41690 (and (inv!12 thiss!1204) e!134748)))

(declare-fun b!196021 () Bool)

(declare-fun e!134745 () Bool)

(assert (=> b!196021 (= e!134744 e!134745)))

(declare-fun res!163998 () Bool)

(assert (=> b!196021 (=> (not res!163998) (not e!134745))))

(declare-datatypes ((tuple2!16960 0))(
  ( (tuple2!16961 (_1!9125 BitStream!7984) (_2!9125 Bool)) )
))
(declare-fun lt!304755 () tuple2!16960)

(assert (=> b!196021 (= res!163998 (and (= (_2!9125 lt!304755) lt!304757) (= (_1!9125 lt!304755) (_2!9124 lt!304760))))))

(declare-fun readBitPure!0 (BitStream!7984) tuple2!16960)

(declare-fun readerFrom!0 (BitStream!7984 (_ BitVec 32) (_ BitVec 32)) BitStream!7984)

(assert (=> b!196021 (= lt!304755 (readBitPure!0 (readerFrom!0 (_2!9124 lt!304760) (currentBit!9230 thiss!1204) (currentByte!9235 thiss!1204))))))

(declare-fun b!196027 () Bool)

(assert (=> b!196027 (= e!134745 (= (bitIndex!0 (size!4438 (buf!4924 (_1!9125 lt!304755))) (currentByte!9235 (_1!9125 lt!304755)) (currentBit!9230 (_1!9125 lt!304755))) lt!304756))))

(declare-fun b!196028 () Bool)

(declare-fun res!163996 () Bool)

(assert (=> b!196028 (=> (not res!163996) (not e!134744))))

(declare-fun isPrefixOf!0 (BitStream!7984 BitStream!7984) Bool)

(assert (=> b!196028 (= res!163996 (isPrefixOf!0 thiss!1204 (_2!9124 lt!304760)))))

(declare-fun b!196029 () Bool)

(assert (=> b!196029 (= e!134743 e!134749)))

(declare-fun res!163999 () Bool)

(assert (=> b!196029 (=> res!163999 e!134749)))

(assert (=> b!196029 (= res!163999 (not (= (bitIndex!0 (size!4438 (buf!4924 (_2!9124 lt!304758))) (currentByte!9235 (_2!9124 lt!304758)) (currentBit!9230 (_2!9124 lt!304758))) (bvsub (bvsub (bvadd lt!304762 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!196029 (isPrefixOf!0 thiss!1204 (_2!9124 lt!304758))))

(declare-fun lt!304759 () Unit!13852)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7984 BitStream!7984 BitStream!7984) Unit!13852)

(assert (=> b!196029 (= lt!304759 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9124 lt!304760) (_2!9124 lt!304758)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7984 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16958)

(assert (=> b!196029 (= lt!304758 (appendBitsLSBFirstLoopTR!0 (_2!9124 lt!304760) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!196030 () Bool)

(declare-fun array_inv!4179 (array!10064) Bool)

(assert (=> b!196030 (= e!134748 (array_inv!4179 (buf!4924 thiss!1204)))))

(declare-fun b!196031 () Bool)

(declare-fun res!164001 () Bool)

(assert (=> b!196031 (=> (not res!164001) (not e!134746))))

(assert (=> b!196031 (= res!164001 (not (= i!590 nBits!348)))))

(assert (= (and start!41690 res!163997) b!196023))

(assert (= (and b!196023 res!164000) b!196026))

(assert (= (and b!196026 res!163992) b!196031))

(assert (= (and b!196031 res!164001) b!196022))

(assert (= (and b!196022 res!163995) b!196024))

(assert (= (and b!196024 res!163993) b!196028))

(assert (= (and b!196028 res!163996) b!196021))

(assert (= (and b!196021 res!163998) b!196027))

(assert (= (and b!196022 (not res!163994)) b!196029))

(assert (= (and b!196029 (not res!163999)) b!196025))

(assert (= start!41690 b!196030))

(declare-fun m!303311 () Bool)

(assert (=> b!196026 m!303311))

(declare-fun m!303313 () Bool)

(assert (=> b!196029 m!303313))

(declare-fun m!303315 () Bool)

(assert (=> b!196029 m!303315))

(declare-fun m!303317 () Bool)

(assert (=> b!196029 m!303317))

(declare-fun m!303319 () Bool)

(assert (=> b!196029 m!303319))

(declare-fun m!303321 () Bool)

(assert (=> b!196022 m!303321))

(declare-fun m!303323 () Bool)

(assert (=> b!196022 m!303323))

(declare-fun m!303325 () Bool)

(assert (=> b!196022 m!303325))

(declare-fun m!303327 () Bool)

(assert (=> b!196027 m!303327))

(declare-fun m!303329 () Bool)

(assert (=> b!196025 m!303329))

(declare-fun m!303331 () Bool)

(assert (=> b!196023 m!303331))

(declare-fun m!303333 () Bool)

(assert (=> b!196030 m!303333))

(declare-fun m!303335 () Bool)

(assert (=> b!196028 m!303335))

(declare-fun m!303337 () Bool)

(assert (=> start!41690 m!303337))

(declare-fun m!303339 () Bool)

(assert (=> b!196021 m!303339))

(assert (=> b!196021 m!303339))

(declare-fun m!303341 () Bool)

(assert (=> b!196021 m!303341))

(assert (=> b!196024 m!303321))

(assert (=> b!196024 m!303323))

(push 1)

(assert (not b!196021))

(assert (not b!196028))

(assert (not b!196025))

(assert (not b!196027))

(assert (not b!196024))

(assert (not b!196026))

(assert (not b!196029))

(assert (not b!196023))

(assert (not b!196022))

(assert (not b!196030))

(assert (not start!41690))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66351 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!66351 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4438 (buf!4924 thiss!1204))) ((_ sign_extend 32) (currentByte!9235 thiss!1204)) ((_ sign_extend 32) (currentBit!9230 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4438 (buf!4924 thiss!1204))) ((_ sign_extend 32) (currentByte!9235 thiss!1204)) ((_ sign_extend 32) (currentBit!9230 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16498 () Bool)

(assert (= bs!16498 d!66351))

(declare-fun m!303409 () Bool)

(assert (=> bs!16498 m!303409))

(assert (=> b!196023 d!66351))

(declare-fun d!66353 () Bool)

(declare-fun res!164072 () Bool)

(declare-fun e!134806 () Bool)

(assert (=> d!66353 (=> (not res!164072) (not e!134806))))

(assert (=> d!66353 (= res!164072 (= (size!4438 (buf!4924 thiss!1204)) (size!4438 (buf!4924 (_2!9124 lt!304760)))))))

(assert (=> d!66353 (= (isPrefixOf!0 thiss!1204 (_2!9124 lt!304760)) e!134806)))

(declare-fun b!196108 () Bool)

(declare-fun res!164074 () Bool)

(assert (=> b!196108 (=> (not res!164074) (not e!134806))))

(assert (=> b!196108 (= res!164074 (bvsle (bitIndex!0 (size!4438 (buf!4924 thiss!1204)) (currentByte!9235 thiss!1204) (currentBit!9230 thiss!1204)) (bitIndex!0 (size!4438 (buf!4924 (_2!9124 lt!304760))) (currentByte!9235 (_2!9124 lt!304760)) (currentBit!9230 (_2!9124 lt!304760)))))))

(declare-fun b!196109 () Bool)

(declare-fun e!134805 () Bool)

(assert (=> b!196109 (= e!134806 e!134805)))

(declare-fun res!164073 () Bool)

(assert (=> b!196109 (=> res!164073 e!134805)))

(assert (=> b!196109 (= res!164073 (= (size!4438 (buf!4924 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!196110 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10064 array!10064 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!196110 (= e!134805 (arrayBitRangesEq!0 (buf!4924 thiss!1204) (buf!4924 (_2!9124 lt!304760)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4438 (buf!4924 thiss!1204)) (currentByte!9235 thiss!1204) (currentBit!9230 thiss!1204))))))

(assert (= (and d!66353 res!164072) b!196108))

(assert (= (and b!196108 res!164074) b!196109))

(assert (= (and b!196109 (not res!164073)) b!196110))

(assert (=> b!196108 m!303323))

(assert (=> b!196108 m!303321))

(assert (=> b!196110 m!303323))

(assert (=> b!196110 m!303323))

(declare-fun m!303411 () Bool)

(assert (=> b!196110 m!303411))

(assert (=> b!196028 d!66353))

(declare-fun d!66355 () Bool)

(declare-fun e!134813 () Bool)

(assert (=> d!66355 e!134813))

(declare-fun res!164087 () Bool)

(assert (=> d!66355 (=> (not res!164087) (not e!134813))))

(declare-fun lt!304868 () (_ BitVec 64))

(declare-fun lt!304865 () (_ BitVec 64))

(declare-fun lt!304869 () (_ BitVec 64))

(assert (=> d!66355 (= res!164087 (= lt!304865 (bvsub lt!304868 lt!304869)))))

(assert (=> d!66355 (or (= (bvand lt!304868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304869 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304868 lt!304869) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66355 (= lt!304869 (remainingBits!0 ((_ sign_extend 32) (size!4438 (buf!4924 (_2!9124 lt!304760)))) ((_ sign_extend 32) (currentByte!9235 (_2!9124 lt!304760))) ((_ sign_extend 32) (currentBit!9230 (_2!9124 lt!304760)))))))

(declare-fun lt!304870 () (_ BitVec 64))

(declare-fun lt!304867 () (_ BitVec 64))

(assert (=> d!66355 (= lt!304868 (bvmul lt!304870 lt!304867))))

(assert (=> d!66355 (or (= lt!304870 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304867 (bvsdiv (bvmul lt!304870 lt!304867) lt!304870)))))

(assert (=> d!66355 (= lt!304867 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66355 (= lt!304870 ((_ sign_extend 32) (size!4438 (buf!4924 (_2!9124 lt!304760)))))))

(assert (=> d!66355 (= lt!304865 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9235 (_2!9124 lt!304760))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9230 (_2!9124 lt!304760)))))))

(assert (=> d!66355 (invariant!0 (currentBit!9230 (_2!9124 lt!304760)) (currentByte!9235 (_2!9124 lt!304760)) (size!4438 (buf!4924 (_2!9124 lt!304760))))))

(assert (=> d!66355 (= (bitIndex!0 (size!4438 (buf!4924 (_2!9124 lt!304760))) (currentByte!9235 (_2!9124 lt!304760)) (currentBit!9230 (_2!9124 lt!304760))) lt!304865)))

(declare-fun b!196123 () Bool)

(declare-fun res!164088 () Bool)

(assert (=> b!196123 (=> (not res!164088) (not e!134813))))

(assert (=> b!196123 (= res!164088 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304865))))

(declare-fun b!196124 () Bool)

(declare-fun lt!304866 () (_ BitVec 64))

(assert (=> b!196124 (= e!134813 (bvsle lt!304865 (bvmul lt!304866 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196124 (or (= lt!304866 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304866 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304866)))))

(assert (=> b!196124 (= lt!304866 ((_ sign_extend 32) (size!4438 (buf!4924 (_2!9124 lt!304760)))))))

(assert (= (and d!66355 res!164087) b!196123))

(assert (= (and b!196123 res!164088) b!196124))

(declare-fun m!303419 () Bool)

(assert (=> d!66355 m!303419))

(declare-fun m!303421 () Bool)

(assert (=> d!66355 m!303421))

(assert (=> b!196022 d!66355))

(declare-fun d!66365 () Bool)

(declare-fun e!134814 () Bool)

(assert (=> d!66365 e!134814))

(declare-fun res!164089 () Bool)

(assert (=> d!66365 (=> (not res!164089) (not e!134814))))

(declare-fun lt!304875 () (_ BitVec 64))

(declare-fun lt!304871 () (_ BitVec 64))

(declare-fun lt!304874 () (_ BitVec 64))

(assert (=> d!66365 (= res!164089 (= lt!304871 (bvsub lt!304874 lt!304875)))))

(assert (=> d!66365 (or (= (bvand lt!304874 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304875 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304874 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304874 lt!304875) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66365 (= lt!304875 (remainingBits!0 ((_ sign_extend 32) (size!4438 (buf!4924 thiss!1204))) ((_ sign_extend 32) (currentByte!9235 thiss!1204)) ((_ sign_extend 32) (currentBit!9230 thiss!1204))))))

(declare-fun lt!304876 () (_ BitVec 64))

(declare-fun lt!304873 () (_ BitVec 64))

(assert (=> d!66365 (= lt!304874 (bvmul lt!304876 lt!304873))))

(assert (=> d!66365 (or (= lt!304876 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304873 (bvsdiv (bvmul lt!304876 lt!304873) lt!304876)))))

(assert (=> d!66365 (= lt!304873 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66365 (= lt!304876 ((_ sign_extend 32) (size!4438 (buf!4924 thiss!1204))))))

(assert (=> d!66365 (= lt!304871 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9235 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9230 thiss!1204))))))

(assert (=> d!66365 (invariant!0 (currentBit!9230 thiss!1204) (currentByte!9235 thiss!1204) (size!4438 (buf!4924 thiss!1204)))))

(assert (=> d!66365 (= (bitIndex!0 (size!4438 (buf!4924 thiss!1204)) (currentByte!9235 thiss!1204) (currentBit!9230 thiss!1204)) lt!304871)))

(declare-fun b!196125 () Bool)

(declare-fun res!164090 () Bool)

(assert (=> b!196125 (=> (not res!164090) (not e!134814))))

(assert (=> b!196125 (= res!164090 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304871))))

(declare-fun b!196126 () Bool)

(declare-fun lt!304872 () (_ BitVec 64))

(assert (=> b!196126 (= e!134814 (bvsle lt!304871 (bvmul lt!304872 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196126 (or (= lt!304872 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304872 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304872)))))

(assert (=> b!196126 (= lt!304872 ((_ sign_extend 32) (size!4438 (buf!4924 thiss!1204))))))

(assert (= (and d!66365 res!164089) b!196125))

(assert (= (and b!196125 res!164090) b!196126))

(assert (=> d!66365 m!303409))

(assert (=> d!66365 m!303311))

(assert (=> b!196022 d!66365))

(declare-fun b!196180 () Bool)

(declare-fun res!164145 () Bool)

(declare-fun e!134845 () Bool)

(assert (=> b!196180 (=> (not res!164145) (not e!134845))))

(declare-fun lt!304940 () tuple2!16958)

(assert (=> b!196180 (= res!164145 (isPrefixOf!0 thiss!1204 (_2!9124 lt!304940)))))

(declare-fun d!66367 () Bool)

(assert (=> d!66367 e!134845))

(declare-fun res!164143 () Bool)

(assert (=> d!66367 (=> (not res!164143) (not e!134845))))

(assert (=> d!66367 (= res!164143 (= (size!4438 (buf!4924 thiss!1204)) (size!4438 (buf!4924 (_2!9124 lt!304940)))))))

(declare-fun choose!16 (BitStream!7984 Bool) tuple2!16958)

(assert (=> d!66367 (= lt!304940 (choose!16 thiss!1204 lt!304757))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!66367 (validate_offset_bit!0 ((_ sign_extend 32) (size!4438 (buf!4924 thiss!1204))) ((_ sign_extend 32) (currentByte!9235 thiss!1204)) ((_ sign_extend 32) (currentBit!9230 thiss!1204)))))

(assert (=> d!66367 (= (appendBit!0 thiss!1204 lt!304757) lt!304940)))

(declare-fun b!196179 () Bool)

(declare-fun res!164144 () Bool)

(assert (=> b!196179 (=> (not res!164144) (not e!134845))))

(declare-fun lt!304942 () (_ BitVec 64))

(declare-fun lt!304941 () (_ BitVec 64))

(assert (=> b!196179 (= res!164144 (= (bitIndex!0 (size!4438 (buf!4924 (_2!9124 lt!304940))) (currentByte!9235 (_2!9124 lt!304940)) (currentBit!9230 (_2!9124 lt!304940))) (bvadd lt!304942 lt!304941)))))

(assert (=> b!196179 (or (not (= (bvand lt!304942 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304941 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!304942 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!304942 lt!304941) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196179 (= lt!304941 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!196179 (= lt!304942 (bitIndex!0 (size!4438 (buf!4924 thiss!1204)) (currentByte!9235 thiss!1204) (currentBit!9230 thiss!1204)))))

(declare-fun b!196182 () Bool)

(declare-fun e!134844 () Bool)

(declare-fun lt!304939 () tuple2!16960)

(assert (=> b!196182 (= e!134844 (= (bitIndex!0 (size!4438 (buf!4924 (_1!9125 lt!304939))) (currentByte!9235 (_1!9125 lt!304939)) (currentBit!9230 (_1!9125 lt!304939))) (bitIndex!0 (size!4438 (buf!4924 (_2!9124 lt!304940))) (currentByte!9235 (_2!9124 lt!304940)) (currentBit!9230 (_2!9124 lt!304940)))))))

(declare-fun b!196181 () Bool)

(assert (=> b!196181 (= e!134845 e!134844)))

(declare-fun res!164142 () Bool)

(assert (=> b!196181 (=> (not res!164142) (not e!134844))))

(assert (=> b!196181 (= res!164142 (and (= (_2!9125 lt!304939) lt!304757) (= (_1!9125 lt!304939) (_2!9124 lt!304940))))))

(assert (=> b!196181 (= lt!304939 (readBitPure!0 (readerFrom!0 (_2!9124 lt!304940) (currentBit!9230 thiss!1204) (currentByte!9235 thiss!1204))))))

(assert (= (and d!66367 res!164143) b!196179))

(assert (= (and b!196179 res!164144) b!196180))

(assert (= (and b!196180 res!164145) b!196181))

(assert (= (and b!196181 res!164142) b!196182))

(declare-fun m!303461 () Bool)

(assert (=> d!66367 m!303461))

(declare-fun m!303463 () Bool)

(assert (=> d!66367 m!303463))

(declare-fun m!303465 () Bool)

(assert (=> b!196179 m!303465))

(assert (=> b!196179 m!303323))

(declare-fun m!303467 () Bool)

(assert (=> b!196181 m!303467))

(assert (=> b!196181 m!303467))

(declare-fun m!303469 () Bool)

(assert (=> b!196181 m!303469))

(declare-fun m!303471 () Bool)

(assert (=> b!196180 m!303471))

(declare-fun m!303473 () Bool)

(assert (=> b!196182 m!303473))

(assert (=> b!196182 m!303465))

(assert (=> b!196022 d!66367))

(declare-fun d!66395 () Bool)

(declare-fun e!134848 () Bool)

(assert (=> d!66395 e!134848))

(declare-fun res!164149 () Bool)

(assert (=> d!66395 (=> (not res!164149) (not e!134848))))

(declare-fun lt!304943 () (_ BitVec 64))

(declare-fun lt!304947 () (_ BitVec 64))

(declare-fun lt!304946 () (_ BitVec 64))

(assert (=> d!66395 (= res!164149 (= lt!304943 (bvsub lt!304946 lt!304947)))))

(assert (=> d!66395 (or (= (bvand lt!304946 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304947 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304946 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304946 lt!304947) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66395 (= lt!304947 (remainingBits!0 ((_ sign_extend 32) (size!4438 (buf!4924 (_1!9125 lt!304755)))) ((_ sign_extend 32) (currentByte!9235 (_1!9125 lt!304755))) ((_ sign_extend 32) (currentBit!9230 (_1!9125 lt!304755)))))))

(declare-fun lt!304948 () (_ BitVec 64))

(declare-fun lt!304945 () (_ BitVec 64))

(assert (=> d!66395 (= lt!304946 (bvmul lt!304948 lt!304945))))

(assert (=> d!66395 (or (= lt!304948 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304945 (bvsdiv (bvmul lt!304948 lt!304945) lt!304948)))))

(assert (=> d!66395 (= lt!304945 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66395 (= lt!304948 ((_ sign_extend 32) (size!4438 (buf!4924 (_1!9125 lt!304755)))))))

(assert (=> d!66395 (= lt!304943 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9235 (_1!9125 lt!304755))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9230 (_1!9125 lt!304755)))))))

(assert (=> d!66395 (invariant!0 (currentBit!9230 (_1!9125 lt!304755)) (currentByte!9235 (_1!9125 lt!304755)) (size!4438 (buf!4924 (_1!9125 lt!304755))))))

(assert (=> d!66395 (= (bitIndex!0 (size!4438 (buf!4924 (_1!9125 lt!304755))) (currentByte!9235 (_1!9125 lt!304755)) (currentBit!9230 (_1!9125 lt!304755))) lt!304943)))

(declare-fun b!196186 () Bool)

(declare-fun res!164150 () Bool)

(assert (=> b!196186 (=> (not res!164150) (not e!134848))))

(assert (=> b!196186 (= res!164150 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304943))))

(declare-fun b!196187 () Bool)

(declare-fun lt!304944 () (_ BitVec 64))

(assert (=> b!196187 (= e!134848 (bvsle lt!304943 (bvmul lt!304944 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196187 (or (= lt!304944 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304944 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304944)))))

(assert (=> b!196187 (= lt!304944 ((_ sign_extend 32) (size!4438 (buf!4924 (_1!9125 lt!304755)))))))

(assert (= (and d!66395 res!164149) b!196186))

(assert (= (and b!196186 res!164150) b!196187))

(declare-fun m!303475 () Bool)

(assert (=> d!66395 m!303475))

(declare-fun m!303477 () Bool)

(assert (=> d!66395 m!303477))

(assert (=> b!196027 d!66395))

(declare-fun d!66397 () Bool)

(declare-datatypes ((tuple2!16970 0))(
  ( (tuple2!16971 (_1!9130 Bool) (_2!9130 BitStream!7984)) )
))
(declare-fun lt!304951 () tuple2!16970)

(declare-fun readBit!0 (BitStream!7984) tuple2!16970)

(assert (=> d!66397 (= lt!304951 (readBit!0 (readerFrom!0 (_2!9124 lt!304760) (currentBit!9230 thiss!1204) (currentByte!9235 thiss!1204))))))

(assert (=> d!66397 (= (readBitPure!0 (readerFrom!0 (_2!9124 lt!304760) (currentBit!9230 thiss!1204) (currentByte!9235 thiss!1204))) (tuple2!16961 (_2!9130 lt!304951) (_1!9130 lt!304951)))))

(declare-fun bs!16503 () Bool)

(assert (= bs!16503 d!66397))

(assert (=> bs!16503 m!303339))

(declare-fun m!303481 () Bool)

(assert (=> bs!16503 m!303481))

(assert (=> b!196021 d!66397))

(declare-fun d!66401 () Bool)

(declare-fun e!134851 () Bool)

(assert (=> d!66401 e!134851))

(declare-fun res!164154 () Bool)

(assert (=> d!66401 (=> (not res!164154) (not e!134851))))

(assert (=> d!66401 (= res!164154 (invariant!0 (currentBit!9230 (_2!9124 lt!304760)) (currentByte!9235 (_2!9124 lt!304760)) (size!4438 (buf!4924 (_2!9124 lt!304760)))))))

(assert (=> d!66401 (= (readerFrom!0 (_2!9124 lt!304760) (currentBit!9230 thiss!1204) (currentByte!9235 thiss!1204)) (BitStream!7985 (buf!4924 (_2!9124 lt!304760)) (currentByte!9235 thiss!1204) (currentBit!9230 thiss!1204)))))

(declare-fun b!196190 () Bool)

(assert (=> b!196190 (= e!134851 (invariant!0 (currentBit!9230 thiss!1204) (currentByte!9235 thiss!1204) (size!4438 (buf!4924 (_2!9124 lt!304760)))))))

(assert (= (and d!66401 res!164154) b!196190))

(assert (=> d!66401 m!303421))

(declare-fun m!303485 () Bool)

(assert (=> b!196190 m!303485))

(assert (=> b!196021 d!66401))

(declare-fun d!66405 () Bool)

(assert (=> d!66405 (= (invariant!0 (currentBit!9230 thiss!1204) (currentByte!9235 thiss!1204) (size!4438 (buf!4924 thiss!1204))) (and (bvsge (currentBit!9230 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9230 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9235 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9235 thiss!1204) (size!4438 (buf!4924 thiss!1204))) (and (= (currentBit!9230 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9235 thiss!1204) (size!4438 (buf!4924 thiss!1204)))))))))

(assert (=> b!196026 d!66405))

(declare-fun d!66407 () Bool)

(assert (=> d!66407 (= (invariant!0 (currentBit!9230 (_2!9124 lt!304758)) (currentByte!9235 (_2!9124 lt!304758)) (size!4438 (buf!4924 (_2!9124 lt!304758)))) (and (bvsge (currentBit!9230 (_2!9124 lt!304758)) #b00000000000000000000000000000000) (bvslt (currentBit!9230 (_2!9124 lt!304758)) #b00000000000000000000000000001000) (bvsge (currentByte!9235 (_2!9124 lt!304758)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9235 (_2!9124 lt!304758)) (size!4438 (buf!4924 (_2!9124 lt!304758)))) (and (= (currentBit!9230 (_2!9124 lt!304758)) #b00000000000000000000000000000000) (= (currentByte!9235 (_2!9124 lt!304758)) (size!4438 (buf!4924 (_2!9124 lt!304758))))))))))

(assert (=> b!196025 d!66407))

(declare-fun d!66409 () Bool)

(assert (=> d!66409 (= (array_inv!4179 (buf!4924 thiss!1204)) (bvsge (size!4438 (buf!4924 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!196030 d!66409))

(assert (=> b!196024 d!66355))

(assert (=> b!196024 d!66365))

(declare-fun d!66411 () Bool)

(declare-fun e!134852 () Bool)

(assert (=> d!66411 e!134852))

(declare-fun res!164155 () Bool)

(assert (=> d!66411 (=> (not res!164155) (not e!134852))))

(declare-fun lt!304958 () (_ BitVec 64))

(declare-fun lt!304955 () (_ BitVec 64))

(declare-fun lt!304959 () (_ BitVec 64))

(assert (=> d!66411 (= res!164155 (= lt!304955 (bvsub lt!304958 lt!304959)))))

(assert (=> d!66411 (or (= (bvand lt!304958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304959 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304958 lt!304959) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66411 (= lt!304959 (remainingBits!0 ((_ sign_extend 32) (size!4438 (buf!4924 (_2!9124 lt!304758)))) ((_ sign_extend 32) (currentByte!9235 (_2!9124 lt!304758))) ((_ sign_extend 32) (currentBit!9230 (_2!9124 lt!304758)))))))

(declare-fun lt!304960 () (_ BitVec 64))

(declare-fun lt!304957 () (_ BitVec 64))

(assert (=> d!66411 (= lt!304958 (bvmul lt!304960 lt!304957))))

(assert (=> d!66411 (or (= lt!304960 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304957 (bvsdiv (bvmul lt!304960 lt!304957) lt!304960)))))

(assert (=> d!66411 (= lt!304957 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66411 (= lt!304960 ((_ sign_extend 32) (size!4438 (buf!4924 (_2!9124 lt!304758)))))))

(assert (=> d!66411 (= lt!304955 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9235 (_2!9124 lt!304758))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9230 (_2!9124 lt!304758)))))))

(assert (=> d!66411 (invariant!0 (currentBit!9230 (_2!9124 lt!304758)) (currentByte!9235 (_2!9124 lt!304758)) (size!4438 (buf!4924 (_2!9124 lt!304758))))))

(assert (=> d!66411 (= (bitIndex!0 (size!4438 (buf!4924 (_2!9124 lt!304758))) (currentByte!9235 (_2!9124 lt!304758)) (currentBit!9230 (_2!9124 lt!304758))) lt!304955)))

(declare-fun b!196191 () Bool)

(declare-fun res!164156 () Bool)

(assert (=> b!196191 (=> (not res!164156) (not e!134852))))

(assert (=> b!196191 (= res!164156 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304955))))

(declare-fun b!196192 () Bool)

(declare-fun lt!304956 () (_ BitVec 64))

(assert (=> b!196192 (= e!134852 (bvsle lt!304955 (bvmul lt!304956 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196192 (or (= lt!304956 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304956 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304956)))))

(assert (=> b!196192 (= lt!304956 ((_ sign_extend 32) (size!4438 (buf!4924 (_2!9124 lt!304758)))))))

(assert (= (and d!66411 res!164155) b!196191))

(assert (= (and b!196191 res!164156) b!196192))

(declare-fun m!303487 () Bool)

(assert (=> d!66411 m!303487))

(assert (=> d!66411 m!303329))

(assert (=> b!196029 d!66411))

(declare-fun d!66413 () Bool)

(declare-fun res!164157 () Bool)

(declare-fun e!134854 () Bool)

(assert (=> d!66413 (=> (not res!164157) (not e!134854))))

(assert (=> d!66413 (= res!164157 (= (size!4438 (buf!4924 thiss!1204)) (size!4438 (buf!4924 (_2!9124 lt!304758)))))))

(assert (=> d!66413 (= (isPrefixOf!0 thiss!1204 (_2!9124 lt!304758)) e!134854)))

(declare-fun b!196193 () Bool)

(declare-fun res!164159 () Bool)

(assert (=> b!196193 (=> (not res!164159) (not e!134854))))

(assert (=> b!196193 (= res!164159 (bvsle (bitIndex!0 (size!4438 (buf!4924 thiss!1204)) (currentByte!9235 thiss!1204) (currentBit!9230 thiss!1204)) (bitIndex!0 (size!4438 (buf!4924 (_2!9124 lt!304758))) (currentByte!9235 (_2!9124 lt!304758)) (currentBit!9230 (_2!9124 lt!304758)))))))

(declare-fun b!196194 () Bool)

(declare-fun e!134853 () Bool)

(assert (=> b!196194 (= e!134854 e!134853)))

(declare-fun res!164158 () Bool)

(assert (=> b!196194 (=> res!164158 e!134853)))

(assert (=> b!196194 (= res!164158 (= (size!4438 (buf!4924 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!196195 () Bool)

(assert (=> b!196195 (= e!134853 (arrayBitRangesEq!0 (buf!4924 thiss!1204) (buf!4924 (_2!9124 lt!304758)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4438 (buf!4924 thiss!1204)) (currentByte!9235 thiss!1204) (currentBit!9230 thiss!1204))))))

(assert (= (and d!66413 res!164157) b!196193))

(assert (= (and b!196193 res!164159) b!196194))

(assert (= (and b!196194 (not res!164158)) b!196195))

(assert (=> b!196193 m!303323))

(assert (=> b!196193 m!303313))

(assert (=> b!196195 m!303323))

(assert (=> b!196195 m!303323))

(declare-fun m!303489 () Bool)

(assert (=> b!196195 m!303489))

(assert (=> b!196029 d!66413))

(declare-fun d!66415 () Bool)

(assert (=> d!66415 (isPrefixOf!0 thiss!1204 (_2!9124 lt!304758))))

(declare-fun lt!304963 () Unit!13852)

(declare-fun choose!30 (BitStream!7984 BitStream!7984 BitStream!7984) Unit!13852)

(assert (=> d!66415 (= lt!304963 (choose!30 thiss!1204 (_2!9124 lt!304760) (_2!9124 lt!304758)))))

(assert (=> d!66415 (isPrefixOf!0 thiss!1204 (_2!9124 lt!304760))))

(assert (=> d!66415 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9124 lt!304760) (_2!9124 lt!304758)) lt!304963)))

(declare-fun bs!16505 () Bool)

(assert (= bs!16505 d!66415))

(assert (=> bs!16505 m!303315))

(declare-fun m!303491 () Bool)

(assert (=> bs!16505 m!303491))

(assert (=> bs!16505 m!303335))

(assert (=> b!196029 d!66415))

(declare-fun b!196276 () Bool)

(declare-fun e!134904 () Bool)

(declare-datatypes ((tuple2!16972 0))(
  ( (tuple2!16973 (_1!9131 BitStream!7984) (_2!9131 (_ BitVec 64))) )
))
(declare-fun lt!305262 () tuple2!16972)

(declare-datatypes ((tuple2!16974 0))(
  ( (tuple2!16975 (_1!9132 BitStream!7984) (_2!9132 BitStream!7984)) )
))
(declare-fun lt!305256 () tuple2!16974)

(assert (=> b!196276 (= e!134904 (= (_1!9131 lt!305262) (_2!9132 lt!305256)))))

(declare-fun d!66417 () Bool)

(declare-fun e!134900 () Bool)

(assert (=> d!66417 e!134900))

(declare-fun res!164227 () Bool)

(assert (=> d!66417 (=> (not res!164227) (not e!134900))))

(declare-fun lt!305294 () tuple2!16958)

(assert (=> d!66417 (= res!164227 (invariant!0 (currentBit!9230 (_2!9124 lt!305294)) (currentByte!9235 (_2!9124 lt!305294)) (size!4438 (buf!4924 (_2!9124 lt!305294)))))))

(declare-fun e!134907 () tuple2!16958)

(assert (=> d!66417 (= lt!305294 e!134907)))

(declare-fun c!9768 () Bool)

(assert (=> d!66417 (= c!9768 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!66417 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!66417 (= (appendBitsLSBFirstLoopTR!0 (_2!9124 lt!304760) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!305294)))

(declare-fun b!196277 () Bool)

(declare-fun e!134905 () Bool)

(assert (=> b!196277 (= e!134900 e!134905)))

(declare-fun res!164220 () Bool)

(assert (=> b!196277 (=> (not res!164220) (not e!134905))))

(declare-fun lt!305282 () tuple2!16972)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!196277 (= res!164220 (= (_2!9131 lt!305282) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!305268 () tuple2!16974)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7984 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16972)

(assert (=> b!196277 (= lt!305282 (readNBitsLSBFirstsLoopPure!0 (_1!9132 lt!305268) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!305259 () Unit!13852)

(declare-fun lt!305283 () Unit!13852)

(assert (=> b!196277 (= lt!305259 lt!305283)))

(declare-fun lt!305264 () (_ BitVec 64))

(assert (=> b!196277 (validate_offset_bits!1 ((_ sign_extend 32) (size!4438 (buf!4924 (_2!9124 lt!305294)))) ((_ sign_extend 32) (currentByte!9235 (_2!9124 lt!304760))) ((_ sign_extend 32) (currentBit!9230 (_2!9124 lt!304760))) lt!305264)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7984 array!10064 (_ BitVec 64)) Unit!13852)

(assert (=> b!196277 (= lt!305283 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9124 lt!304760) (buf!4924 (_2!9124 lt!305294)) lt!305264))))

(declare-fun e!134906 () Bool)

(assert (=> b!196277 e!134906))

(declare-fun res!164228 () Bool)

(assert (=> b!196277 (=> (not res!164228) (not e!134906))))

(assert (=> b!196277 (= res!164228 (and (= (size!4438 (buf!4924 (_2!9124 lt!304760))) (size!4438 (buf!4924 (_2!9124 lt!305294)))) (bvsge lt!305264 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196277 (= lt!305264 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!196277 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!7984 BitStream!7984) tuple2!16974)

(assert (=> b!196277 (= lt!305268 (reader!0 (_2!9124 lt!304760) (_2!9124 lt!305294)))))

(declare-fun b!196278 () Bool)

(declare-fun res!164221 () Bool)

(assert (=> b!196278 (=> (not res!164221) (not e!134900))))

(assert (=> b!196278 (= res!164221 (isPrefixOf!0 (_2!9124 lt!304760) (_2!9124 lt!305294)))))

(declare-fun b!196279 () Bool)

(declare-fun e!134901 () (_ BitVec 64))

(assert (=> b!196279 (= e!134901 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!196280 () Bool)

(declare-fun res!164225 () Bool)

(declare-fun lt!305272 () tuple2!16958)

(assert (=> b!196280 (= res!164225 (= (bitIndex!0 (size!4438 (buf!4924 (_2!9124 lt!305272))) (currentByte!9235 (_2!9124 lt!305272)) (currentBit!9230 (_2!9124 lt!305272))) (bvadd (bitIndex!0 (size!4438 (buf!4924 (_2!9124 lt!304760))) (currentByte!9235 (_2!9124 lt!304760)) (currentBit!9230 (_2!9124 lt!304760))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!134908 () Bool)

(assert (=> b!196280 (=> (not res!164225) (not e!134908))))

(declare-fun b!196281 () Bool)

(declare-fun res!164226 () Bool)

(declare-fun call!3080 () Bool)

(assert (=> b!196281 (= res!164226 call!3080)))

(assert (=> b!196281 (=> (not res!164226) (not e!134908))))

(declare-fun b!196282 () Bool)

(assert (=> b!196282 (= e!134901 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!196283 () Bool)

(declare-fun Unit!13858 () Unit!13852)

(assert (=> b!196283 (= e!134907 (tuple2!16959 Unit!13858 (_2!9124 lt!304760)))))

(declare-fun lt!305245 () Unit!13852)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7984) Unit!13852)

(assert (=> b!196283 (= lt!305245 (lemmaIsPrefixRefl!0 (_2!9124 lt!304760)))))

(assert (=> b!196283 call!3080))

(declare-fun lt!305255 () Unit!13852)

(assert (=> b!196283 (= lt!305255 lt!305245)))

(declare-fun bm!3077 () Bool)

(assert (=> bm!3077 (= call!3080 (isPrefixOf!0 (_2!9124 lt!304760) (ite c!9768 (_2!9124 lt!304760) (_2!9124 lt!305272))))))

(declare-fun b!196284 () Bool)

(declare-fun lt!305290 () tuple2!16960)

(assert (=> b!196284 (= lt!305290 (readBitPure!0 (readerFrom!0 (_2!9124 lt!305272) (currentBit!9230 (_2!9124 lt!304760)) (currentByte!9235 (_2!9124 lt!304760)))))))

(declare-fun res!164231 () Bool)

(declare-fun lt!305247 () Bool)

(assert (=> b!196284 (= res!164231 (and (= (_2!9125 lt!305290) lt!305247) (= (_1!9125 lt!305290) (_2!9124 lt!305272))))))

(declare-fun e!134903 () Bool)

(assert (=> b!196284 (=> (not res!164231) (not e!134903))))

(assert (=> b!196284 (= e!134908 e!134903)))

(declare-fun b!196285 () Bool)

(declare-fun res!164223 () Bool)

(assert (=> b!196285 (=> (not res!164223) (not e!134900))))

(declare-fun lt!305277 () (_ BitVec 64))

(declare-fun lt!305270 () (_ BitVec 64))

(assert (=> b!196285 (= res!164223 (= (bitIndex!0 (size!4438 (buf!4924 (_2!9124 lt!305294))) (currentByte!9235 (_2!9124 lt!305294)) (currentBit!9230 (_2!9124 lt!305294))) (bvsub lt!305270 lt!305277)))))

(assert (=> b!196285 (or (= (bvand lt!305270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!305277 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!305270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!305270 lt!305277) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196285 (= lt!305277 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!305278 () (_ BitVec 64))

(declare-fun lt!305254 () (_ BitVec 64))

(assert (=> b!196285 (= lt!305270 (bvadd lt!305278 lt!305254))))

(assert (=> b!196285 (or (not (= (bvand lt!305278 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!305254 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!305278 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!305278 lt!305254) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196285 (= lt!305254 ((_ sign_extend 32) nBits!348))))

(assert (=> b!196285 (= lt!305278 (bitIndex!0 (size!4438 (buf!4924 (_2!9124 lt!304760))) (currentByte!9235 (_2!9124 lt!304760)) (currentBit!9230 (_2!9124 lt!304760))))))

(declare-fun b!196286 () Bool)

(declare-fun res!164229 () Bool)

(assert (=> b!196286 (=> (not res!164229) (not e!134900))))

(assert (=> b!196286 (= res!164229 (= (size!4438 (buf!4924 (_2!9124 lt!304760))) (size!4438 (buf!4924 (_2!9124 lt!305294)))))))

(declare-fun b!196287 () Bool)

(assert (=> b!196287 (= e!134905 (= (_1!9131 lt!305282) (_2!9132 lt!305268)))))

(declare-fun b!196288 () Bool)

(declare-fun lt!305291 () tuple2!16958)

(assert (=> b!196288 (= e!134907 (tuple2!16959 (_1!9124 lt!305291) (_2!9124 lt!305291)))))

(assert (=> b!196288 (= lt!305247 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196288 (= lt!305272 (appendBit!0 (_2!9124 lt!304760) lt!305247))))

(declare-fun res!164224 () Bool)

(assert (=> b!196288 (= res!164224 (= (size!4438 (buf!4924 (_2!9124 lt!304760))) (size!4438 (buf!4924 (_2!9124 lt!305272)))))))

(assert (=> b!196288 (=> (not res!164224) (not e!134908))))

(assert (=> b!196288 e!134908))

(declare-fun lt!305253 () tuple2!16958)

(assert (=> b!196288 (= lt!305253 lt!305272)))

(assert (=> b!196288 (= lt!305291 (appendBitsLSBFirstLoopTR!0 (_2!9124 lt!305253) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!305292 () Unit!13852)

(assert (=> b!196288 (= lt!305292 (lemmaIsPrefixTransitive!0 (_2!9124 lt!304760) (_2!9124 lt!305253) (_2!9124 lt!305291)))))

(assert (=> b!196288 (isPrefixOf!0 (_2!9124 lt!304760) (_2!9124 lt!305291))))

(declare-fun lt!305271 () Unit!13852)

(assert (=> b!196288 (= lt!305271 lt!305292)))

(assert (=> b!196288 (invariant!0 (currentBit!9230 (_2!9124 lt!304760)) (currentByte!9235 (_2!9124 lt!304760)) (size!4438 (buf!4924 (_2!9124 lt!305253))))))

(declare-fun lt!305273 () BitStream!7984)

(assert (=> b!196288 (= lt!305273 (BitStream!7985 (buf!4924 (_2!9124 lt!305253)) (currentByte!9235 (_2!9124 lt!304760)) (currentBit!9230 (_2!9124 lt!304760))))))

(assert (=> b!196288 (invariant!0 (currentBit!9230 lt!305273) (currentByte!9235 lt!305273) (size!4438 (buf!4924 (_2!9124 lt!305291))))))

(declare-fun lt!305275 () BitStream!7984)

(assert (=> b!196288 (= lt!305275 (BitStream!7985 (buf!4924 (_2!9124 lt!305291)) (currentByte!9235 lt!305273) (currentBit!9230 lt!305273)))))

(declare-fun lt!305248 () tuple2!16960)

(assert (=> b!196288 (= lt!305248 (readBitPure!0 lt!305273))))

(declare-fun lt!305295 () tuple2!16960)

(assert (=> b!196288 (= lt!305295 (readBitPure!0 lt!305275))))

(declare-fun lt!305285 () Unit!13852)

(declare-fun readBitPrefixLemma!0 (BitStream!7984 BitStream!7984) Unit!13852)

(assert (=> b!196288 (= lt!305285 (readBitPrefixLemma!0 lt!305273 (_2!9124 lt!305291)))))

(declare-fun res!164230 () Bool)

(assert (=> b!196288 (= res!164230 (= (bitIndex!0 (size!4438 (buf!4924 (_1!9125 lt!305248))) (currentByte!9235 (_1!9125 lt!305248)) (currentBit!9230 (_1!9125 lt!305248))) (bitIndex!0 (size!4438 (buf!4924 (_1!9125 lt!305295))) (currentByte!9235 (_1!9125 lt!305295)) (currentBit!9230 (_1!9125 lt!305295)))))))

(declare-fun e!134902 () Bool)

(assert (=> b!196288 (=> (not res!164230) (not e!134902))))

(assert (=> b!196288 e!134902))

(declare-fun lt!305297 () Unit!13852)

(assert (=> b!196288 (= lt!305297 lt!305285)))

(declare-fun lt!305289 () tuple2!16974)

(assert (=> b!196288 (= lt!305289 (reader!0 (_2!9124 lt!304760) (_2!9124 lt!305291)))))

(declare-fun lt!305252 () tuple2!16974)

(assert (=> b!196288 (= lt!305252 (reader!0 (_2!9124 lt!305253) (_2!9124 lt!305291)))))

(declare-fun lt!305286 () tuple2!16960)

(assert (=> b!196288 (= lt!305286 (readBitPure!0 (_1!9132 lt!305289)))))

(assert (=> b!196288 (= (_2!9125 lt!305286) lt!305247)))

(declare-fun lt!305266 () Unit!13852)

(declare-fun Unit!13859 () Unit!13852)

(assert (=> b!196288 (= lt!305266 Unit!13859)))

(declare-fun lt!305293 () (_ BitVec 64))

(assert (=> b!196288 (= lt!305293 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!305251 () (_ BitVec 64))

(assert (=> b!196288 (= lt!305251 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!305276 () Unit!13852)

(assert (=> b!196288 (= lt!305276 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9124 lt!304760) (buf!4924 (_2!9124 lt!305291)) lt!305251))))

(assert (=> b!196288 (validate_offset_bits!1 ((_ sign_extend 32) (size!4438 (buf!4924 (_2!9124 lt!305291)))) ((_ sign_extend 32) (currentByte!9235 (_2!9124 lt!304760))) ((_ sign_extend 32) (currentBit!9230 (_2!9124 lt!304760))) lt!305251)))

(declare-fun lt!305287 () Unit!13852)

(assert (=> b!196288 (= lt!305287 lt!305276)))

(declare-fun lt!305299 () tuple2!16972)

(assert (=> b!196288 (= lt!305299 (readNBitsLSBFirstsLoopPure!0 (_1!9132 lt!305289) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!305293))))

(declare-fun lt!305269 () (_ BitVec 64))

(assert (=> b!196288 (= lt!305269 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!305284 () Unit!13852)

(assert (=> b!196288 (= lt!305284 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9124 lt!305253) (buf!4924 (_2!9124 lt!305291)) lt!305269))))

(assert (=> b!196288 (validate_offset_bits!1 ((_ sign_extend 32) (size!4438 (buf!4924 (_2!9124 lt!305291)))) ((_ sign_extend 32) (currentByte!9235 (_2!9124 lt!305253))) ((_ sign_extend 32) (currentBit!9230 (_2!9124 lt!305253))) lt!305269)))

(declare-fun lt!305281 () Unit!13852)

(assert (=> b!196288 (= lt!305281 lt!305284)))

(declare-fun lt!305246 () tuple2!16972)

(assert (=> b!196288 (= lt!305246 (readNBitsLSBFirstsLoopPure!0 (_1!9132 lt!305252) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!305293 (ite (_2!9125 lt!305286) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!305250 () tuple2!16972)

(assert (=> b!196288 (= lt!305250 (readNBitsLSBFirstsLoopPure!0 (_1!9132 lt!305289) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!305293))))

(declare-fun c!9769 () Bool)

(assert (=> b!196288 (= c!9769 (_2!9125 (readBitPure!0 (_1!9132 lt!305289))))))

(declare-fun lt!305279 () tuple2!16972)

(declare-fun withMovedBitIndex!0 (BitStream!7984 (_ BitVec 64)) BitStream!7984)

(assert (=> b!196288 (= lt!305279 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9132 lt!305289) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!305293 e!134901)))))

(declare-fun lt!305265 () Unit!13852)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7984 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13852)

(assert (=> b!196288 (= lt!305265 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9132 lt!305289) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!305293))))

(assert (=> b!196288 (and (= (_2!9131 lt!305250) (_2!9131 lt!305279)) (= (_1!9131 lt!305250) (_1!9131 lt!305279)))))

(declare-fun lt!305288 () Unit!13852)

(assert (=> b!196288 (= lt!305288 lt!305265)))

(assert (=> b!196288 (= (_1!9132 lt!305289) (withMovedBitIndex!0 (_2!9132 lt!305289) (bvsub (bitIndex!0 (size!4438 (buf!4924 (_2!9124 lt!304760))) (currentByte!9235 (_2!9124 lt!304760)) (currentBit!9230 (_2!9124 lt!304760))) (bitIndex!0 (size!4438 (buf!4924 (_2!9124 lt!305291))) (currentByte!9235 (_2!9124 lt!305291)) (currentBit!9230 (_2!9124 lt!305291))))))))

(declare-fun lt!305267 () Unit!13852)

(declare-fun Unit!13861 () Unit!13852)

(assert (=> b!196288 (= lt!305267 Unit!13861)))

(assert (=> b!196288 (= (_1!9132 lt!305252) (withMovedBitIndex!0 (_2!9132 lt!305252) (bvsub (bitIndex!0 (size!4438 (buf!4924 (_2!9124 lt!305253))) (currentByte!9235 (_2!9124 lt!305253)) (currentBit!9230 (_2!9124 lt!305253))) (bitIndex!0 (size!4438 (buf!4924 (_2!9124 lt!305291))) (currentByte!9235 (_2!9124 lt!305291)) (currentBit!9230 (_2!9124 lt!305291))))))))

(declare-fun lt!305260 () Unit!13852)

(declare-fun Unit!13862 () Unit!13852)

(assert (=> b!196288 (= lt!305260 Unit!13862)))

(assert (=> b!196288 (= (bitIndex!0 (size!4438 (buf!4924 (_2!9124 lt!304760))) (currentByte!9235 (_2!9124 lt!304760)) (currentBit!9230 (_2!9124 lt!304760))) (bvsub (bitIndex!0 (size!4438 (buf!4924 (_2!9124 lt!305253))) (currentByte!9235 (_2!9124 lt!305253)) (currentBit!9230 (_2!9124 lt!305253))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!305263 () Unit!13852)

(declare-fun Unit!13863 () Unit!13852)

(assert (=> b!196288 (= lt!305263 Unit!13863)))

(assert (=> b!196288 (= (_2!9131 lt!305299) (_2!9131 lt!305246))))

(declare-fun lt!305244 () Unit!13852)

(declare-fun Unit!13864 () Unit!13852)

(assert (=> b!196288 (= lt!305244 Unit!13864)))

(assert (=> b!196288 (invariant!0 (currentBit!9230 (_2!9124 lt!305291)) (currentByte!9235 (_2!9124 lt!305291)) (size!4438 (buf!4924 (_2!9124 lt!305291))))))

(declare-fun lt!305296 () Unit!13852)

(declare-fun Unit!13865 () Unit!13852)

(assert (=> b!196288 (= lt!305296 Unit!13865)))

(assert (=> b!196288 (= (size!4438 (buf!4924 (_2!9124 lt!304760))) (size!4438 (buf!4924 (_2!9124 lt!305291))))))

(declare-fun lt!305298 () Unit!13852)

(declare-fun Unit!13866 () Unit!13852)

(assert (=> b!196288 (= lt!305298 Unit!13866)))

(assert (=> b!196288 (= (bitIndex!0 (size!4438 (buf!4924 (_2!9124 lt!305291))) (currentByte!9235 (_2!9124 lt!305291)) (currentBit!9230 (_2!9124 lt!305291))) (bvsub (bvadd (bitIndex!0 (size!4438 (buf!4924 (_2!9124 lt!304760))) (currentByte!9235 (_2!9124 lt!304760)) (currentBit!9230 (_2!9124 lt!304760))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!305261 () Unit!13852)

(declare-fun Unit!13867 () Unit!13852)

(assert (=> b!196288 (= lt!305261 Unit!13867)))

(declare-fun lt!305280 () Unit!13852)

(declare-fun Unit!13868 () Unit!13852)

(assert (=> b!196288 (= lt!305280 Unit!13868)))

(assert (=> b!196288 (= lt!305256 (reader!0 (_2!9124 lt!304760) (_2!9124 lt!305291)))))

(declare-fun lt!305258 () (_ BitVec 64))

(assert (=> b!196288 (= lt!305258 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!305249 () Unit!13852)

(assert (=> b!196288 (= lt!305249 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9124 lt!304760) (buf!4924 (_2!9124 lt!305291)) lt!305258))))

(assert (=> b!196288 (validate_offset_bits!1 ((_ sign_extend 32) (size!4438 (buf!4924 (_2!9124 lt!305291)))) ((_ sign_extend 32) (currentByte!9235 (_2!9124 lt!304760))) ((_ sign_extend 32) (currentBit!9230 (_2!9124 lt!304760))) lt!305258)))

(declare-fun lt!305274 () Unit!13852)

(assert (=> b!196288 (= lt!305274 lt!305249)))

(assert (=> b!196288 (= lt!305262 (readNBitsLSBFirstsLoopPure!0 (_1!9132 lt!305256) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!164222 () Bool)

(assert (=> b!196288 (= res!164222 (= (_2!9131 lt!305262) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!196288 (=> (not res!164222) (not e!134904))))

(assert (=> b!196288 e!134904))

(declare-fun lt!305257 () Unit!13852)

(declare-fun Unit!13869 () Unit!13852)

(assert (=> b!196288 (= lt!305257 Unit!13869)))

(declare-fun b!196289 () Bool)

(assert (=> b!196289 (= e!134903 (= (bitIndex!0 (size!4438 (buf!4924 (_1!9125 lt!305290))) (currentByte!9235 (_1!9125 lt!305290)) (currentBit!9230 (_1!9125 lt!305290))) (bitIndex!0 (size!4438 (buf!4924 (_2!9124 lt!305272))) (currentByte!9235 (_2!9124 lt!305272)) (currentBit!9230 (_2!9124 lt!305272)))))))

(declare-fun b!196290 () Bool)

(assert (=> b!196290 (= e!134906 (validate_offset_bits!1 ((_ sign_extend 32) (size!4438 (buf!4924 (_2!9124 lt!304760)))) ((_ sign_extend 32) (currentByte!9235 (_2!9124 lt!304760))) ((_ sign_extend 32) (currentBit!9230 (_2!9124 lt!304760))) lt!305264))))

(declare-fun b!196291 () Bool)

(assert (=> b!196291 (= e!134902 (= (_2!9125 lt!305248) (_2!9125 lt!305295)))))

(assert (= (and d!66417 c!9768) b!196283))

(assert (= (and d!66417 (not c!9768)) b!196288))

(assert (= (and b!196288 res!164224) b!196280))

(assert (= (and b!196280 res!164225) b!196281))

(assert (= (and b!196281 res!164226) b!196284))

(assert (= (and b!196284 res!164231) b!196289))

(assert (= (and b!196288 res!164230) b!196291))

(assert (= (and b!196288 c!9769) b!196279))

(assert (= (and b!196288 (not c!9769)) b!196282))

(assert (= (and b!196288 res!164222) b!196276))

(assert (= (or b!196283 b!196281) bm!3077))

(assert (= (and d!66417 res!164227) b!196286))

(assert (= (and b!196286 res!164229) b!196285))

(assert (= (and b!196285 res!164223) b!196278))

(assert (= (and b!196278 res!164221) b!196277))

(assert (= (and b!196277 res!164228) b!196290))

(assert (= (and b!196277 res!164220) b!196287))

(declare-fun m!303587 () Bool)

(assert (=> b!196280 m!303587))

(assert (=> b!196280 m!303321))

(declare-fun m!303589 () Bool)

(assert (=> b!196289 m!303589))

(assert (=> b!196289 m!303587))

(declare-fun m!303591 () Bool)

(assert (=> b!196283 m!303591))

(declare-fun m!303593 () Bool)

(assert (=> bm!3077 m!303593))

(declare-fun m!303595 () Bool)

(assert (=> b!196290 m!303595))

(declare-fun m!303597 () Bool)

(assert (=> b!196285 m!303597))

(assert (=> b!196285 m!303321))

(declare-fun m!303599 () Bool)

(assert (=> b!196288 m!303599))

(declare-fun m!303601 () Bool)

(assert (=> b!196288 m!303601))

(declare-fun m!303603 () Bool)

(assert (=> b!196288 m!303603))

(declare-fun m!303605 () Bool)

(assert (=> b!196288 m!303605))

(declare-fun m!303607 () Bool)

(assert (=> b!196288 m!303607))

(declare-fun m!303609 () Bool)

(assert (=> b!196288 m!303609))

(declare-fun m!303611 () Bool)

(assert (=> b!196288 m!303611))

(declare-fun m!303613 () Bool)

(assert (=> b!196288 m!303613))

(assert (=> b!196288 m!303321))

(declare-fun m!303615 () Bool)

(assert (=> b!196288 m!303615))

(declare-fun m!303617 () Bool)

(assert (=> b!196288 m!303617))

(declare-fun m!303619 () Bool)

(assert (=> b!196288 m!303619))

(declare-fun m!303621 () Bool)

(assert (=> b!196288 m!303621))

(declare-fun m!303623 () Bool)

(assert (=> b!196288 m!303623))

(declare-fun m!303625 () Bool)

(assert (=> b!196288 m!303625))

(declare-fun m!303627 () Bool)

(assert (=> b!196288 m!303627))

(declare-fun m!303629 () Bool)

(assert (=> b!196288 m!303629))

(declare-fun m!303631 () Bool)

(assert (=> b!196288 m!303631))

(declare-fun m!303633 () Bool)

(assert (=> b!196288 m!303633))

(declare-fun m!303635 () Bool)

(assert (=> b!196288 m!303635))

(assert (=> b!196288 m!303601))

(declare-fun m!303637 () Bool)

(assert (=> b!196288 m!303637))

(declare-fun m!303639 () Bool)

(assert (=> b!196288 m!303639))

(declare-fun m!303641 () Bool)

(assert (=> b!196288 m!303641))

(declare-fun m!303643 () Bool)

(assert (=> b!196288 m!303643))

(declare-fun m!303645 () Bool)

(assert (=> b!196288 m!303645))

(declare-fun m!303647 () Bool)

(assert (=> b!196288 m!303647))

(declare-fun m!303649 () Bool)

(assert (=> b!196288 m!303649))

(declare-fun m!303651 () Bool)

(assert (=> b!196288 m!303651))

(declare-fun m!303653 () Bool)

(assert (=> b!196288 m!303653))

(declare-fun m!303655 () Bool)

(assert (=> b!196288 m!303655))

(declare-fun m!303657 () Bool)

(assert (=> b!196288 m!303657))

(declare-fun m!303661 () Bool)

(assert (=> b!196288 m!303661))

(declare-fun m!303663 () Bool)

(assert (=> b!196288 m!303663))

(declare-fun m!303669 () Bool)

(assert (=> b!196288 m!303669))

(declare-fun m!303671 () Bool)

(assert (=> b!196277 m!303671))

(declare-fun m!303675 () Bool)

(assert (=> b!196277 m!303675))

(declare-fun m!303681 () Bool)

(assert (=> b!196277 m!303681))

(declare-fun m!303685 () Bool)

(assert (=> b!196277 m!303685))

(assert (=> b!196277 m!303655))

(assert (=> b!196277 m!303657))

(declare-fun m!303687 () Bool)

(assert (=> b!196284 m!303687))

(assert (=> b!196284 m!303687))

(declare-fun m!303689 () Bool)

(assert (=> b!196284 m!303689))

(declare-fun m!303691 () Bool)

(assert (=> b!196278 m!303691))

(declare-fun m!303693 () Bool)

(assert (=> d!66417 m!303693))

(assert (=> b!196029 d!66417))

(declare-fun d!66425 () Bool)

(assert (=> d!66425 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9230 thiss!1204) (currentByte!9235 thiss!1204) (size!4438 (buf!4924 thiss!1204))))))

(declare-fun bs!16506 () Bool)

(assert (= bs!16506 d!66425))

(assert (=> bs!16506 m!303311))

(assert (=> start!41690 d!66425))

(push 1)

(assert (not b!196190))

(assert (not b!196179))

(assert (not d!66411))

(assert (not d!66365))

(assert (not d!66395))

(assert (not b!196110))

(assert (not b!196284))

(assert (not d!66415))

(assert (not d!66417))

(assert (not d!66425))

(assert (not b!196277))

(assert (not b!196290))

(assert (not b!196180))

(assert (not b!196283))

(assert (not b!196285))

(assert (not b!196181))

(assert (not d!66397))

(assert (not bm!3077))

(assert (not b!196288))

(assert (not b!196280))

(assert (not d!66351))

(assert (not b!196278))

(assert (not b!196289))

(assert (not b!196195))

(assert (not d!66367))

(assert (not b!196182))

(assert (not d!66355))

(assert (not b!196108))

(assert (not d!66401))

(assert (not b!196193))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

