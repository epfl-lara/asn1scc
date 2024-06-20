; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42906 () Bool)

(assert start!42906)

(declare-fun b!202196 () Bool)

(declare-fun res!169347 () Bool)

(declare-fun e!138657 () Bool)

(assert (=> b!202196 (=> (not res!169347) (not e!138657))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!10280 0))(
  ( (array!10281 (arr!5455 (Array (_ BitVec 32) (_ BitVec 8))) (size!4525 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8158 0))(
  ( (BitStream!8159 (buf!5030 array!10280) (currentByte!9461 (_ BitVec 32)) (currentBit!9456 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8158)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202196 (= res!169347 (validate_offset_bits!1 ((_ sign_extend 32) (size!4525 (buf!5030 thiss!1204))) ((_ sign_extend 32) (currentByte!9461 thiss!1204)) ((_ sign_extend 32) (currentBit!9456 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!202197 () Bool)

(declare-fun res!169350 () Bool)

(declare-fun e!138656 () Bool)

(assert (=> b!202197 (=> (not res!169350) (not e!138656))))

(declare-datatypes ((Unit!14343 0))(
  ( (Unit!14344) )
))
(declare-datatypes ((tuple2!17300 0))(
  ( (tuple2!17301 (_1!9302 Unit!14343) (_2!9302 BitStream!8158)) )
))
(declare-fun lt!314917 () tuple2!17300)

(declare-fun isPrefixOf!0 (BitStream!8158 BitStream!8158) Bool)

(assert (=> b!202197 (= res!169350 (isPrefixOf!0 thiss!1204 (_2!9302 lt!314917)))))

(declare-fun b!202198 () Bool)

(declare-fun e!138651 () Bool)

(declare-fun lt!314915 () tuple2!17300)

(assert (=> b!202198 (= e!138651 (isPrefixOf!0 (_2!9302 lt!314917) (_2!9302 lt!314915)))))

(declare-fun b!202199 () Bool)

(declare-fun e!138653 () Bool)

(declare-fun array_inv!4266 (array!10280) Bool)

(assert (=> b!202199 (= e!138653 (array_inv!4266 (buf!5030 thiss!1204)))))

(declare-fun b!202201 () Bool)

(declare-fun e!138652 () Bool)

(assert (=> b!202201 (= e!138652 e!138651)))

(declare-fun res!169349 () Bool)

(assert (=> b!202201 (=> res!169349 e!138651)))

(assert (=> b!202201 (= res!169349 (not (isPrefixOf!0 thiss!1204 (_2!9302 lt!314917))))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8158 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17300)

(assert (=> b!202201 (= lt!314915 (appendBitsLSBFirstLoopTR!0 (_2!9302 lt!314917) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!202202 () Bool)

(declare-fun e!138655 () Bool)

(declare-datatypes ((tuple2!17302 0))(
  ( (tuple2!17303 (_1!9303 BitStream!8158) (_2!9303 Bool)) )
))
(declare-fun lt!314918 () tuple2!17302)

(declare-fun lt!314916 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!202202 (= e!138655 (= (bitIndex!0 (size!4525 (buf!5030 (_1!9303 lt!314918))) (currentByte!9461 (_1!9303 lt!314918)) (currentBit!9456 (_1!9303 lt!314918))) lt!314916))))

(declare-fun b!202203 () Bool)

(declare-fun res!169346 () Bool)

(assert (=> b!202203 (=> (not res!169346) (not e!138657))))

(assert (=> b!202203 (= res!169346 (not (= i!590 nBits!348)))))

(declare-fun b!202204 () Bool)

(declare-fun res!169344 () Bool)

(assert (=> b!202204 (=> (not res!169344) (not e!138657))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!202204 (= res!169344 (invariant!0 (currentBit!9456 thiss!1204) (currentByte!9461 thiss!1204) (size!4525 (buf!5030 thiss!1204))))))

(declare-fun b!202205 () Bool)

(assert (=> b!202205 (= e!138656 e!138655)))

(declare-fun res!169345 () Bool)

(assert (=> b!202205 (=> (not res!169345) (not e!138655))))

(declare-fun lt!314914 () Bool)

(assert (=> b!202205 (= res!169345 (and (= (_2!9303 lt!314918) lt!314914) (= (_1!9303 lt!314918) (_2!9302 lt!314917))))))

(declare-fun readBitPure!0 (BitStream!8158) tuple2!17302)

(declare-fun readerFrom!0 (BitStream!8158 (_ BitVec 32) (_ BitVec 32)) BitStream!8158)

(assert (=> b!202205 (= lt!314918 (readBitPure!0 (readerFrom!0 (_2!9302 lt!314917) (currentBit!9456 thiss!1204) (currentByte!9461 thiss!1204))))))

(declare-fun b!202206 () Bool)

(declare-fun e!138654 () Bool)

(assert (=> b!202206 (= e!138654 e!138656)))

(declare-fun res!169348 () Bool)

(assert (=> b!202206 (=> (not res!169348) (not e!138656))))

(declare-fun lt!314913 () (_ BitVec 64))

(assert (=> b!202206 (= res!169348 (= lt!314916 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314913)))))

(assert (=> b!202206 (= lt!314916 (bitIndex!0 (size!4525 (buf!5030 (_2!9302 lt!314917))) (currentByte!9461 (_2!9302 lt!314917)) (currentBit!9456 (_2!9302 lt!314917))))))

(assert (=> b!202206 (= lt!314913 (bitIndex!0 (size!4525 (buf!5030 thiss!1204)) (currentByte!9461 thiss!1204) (currentBit!9456 thiss!1204)))))

(declare-fun b!202200 () Bool)

(assert (=> b!202200 (= e!138657 (not e!138652))))

(declare-fun res!169352 () Bool)

(assert (=> b!202200 (=> res!169352 e!138652)))

(assert (=> b!202200 (= res!169352 (not (= (bitIndex!0 (size!4525 (buf!5030 (_2!9302 lt!314917))) (currentByte!9461 (_2!9302 lt!314917)) (currentBit!9456 (_2!9302 lt!314917))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4525 (buf!5030 thiss!1204)) (currentByte!9461 thiss!1204) (currentBit!9456 thiss!1204))))))))

(assert (=> b!202200 e!138654))

(declare-fun res!169343 () Bool)

(assert (=> b!202200 (=> (not res!169343) (not e!138654))))

(assert (=> b!202200 (= res!169343 (= (size!4525 (buf!5030 thiss!1204)) (size!4525 (buf!5030 (_2!9302 lt!314917)))))))

(declare-fun appendBit!0 (BitStream!8158 Bool) tuple2!17300)

(assert (=> b!202200 (= lt!314917 (appendBit!0 thiss!1204 lt!314914))))

(assert (=> b!202200 (= lt!314914 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!169351 () Bool)

(assert (=> start!42906 (=> (not res!169351) (not e!138657))))

(assert (=> start!42906 (= res!169351 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42906 e!138657))

(assert (=> start!42906 true))

(declare-fun inv!12 (BitStream!8158) Bool)

(assert (=> start!42906 (and (inv!12 thiss!1204) e!138653)))

(assert (= (and start!42906 res!169351) b!202196))

(assert (= (and b!202196 res!169347) b!202204))

(assert (= (and b!202204 res!169344) b!202203))

(assert (= (and b!202203 res!169346) b!202200))

(assert (= (and b!202200 res!169343) b!202206))

(assert (= (and b!202206 res!169348) b!202197))

(assert (= (and b!202197 res!169350) b!202205))

(assert (= (and b!202205 res!169345) b!202202))

(assert (= (and b!202200 (not res!169352)) b!202201))

(assert (= (and b!202201 (not res!169349)) b!202198))

(assert (= start!42906 b!202199))

(declare-fun m!312639 () Bool)

(assert (=> b!202205 m!312639))

(assert (=> b!202205 m!312639))

(declare-fun m!312641 () Bool)

(assert (=> b!202205 m!312641))

(declare-fun m!312643 () Bool)

(assert (=> b!202196 m!312643))

(declare-fun m!312645 () Bool)

(assert (=> b!202200 m!312645))

(declare-fun m!312647 () Bool)

(assert (=> b!202200 m!312647))

(declare-fun m!312649 () Bool)

(assert (=> b!202200 m!312649))

(declare-fun m!312651 () Bool)

(assert (=> b!202201 m!312651))

(declare-fun m!312653 () Bool)

(assert (=> b!202201 m!312653))

(assert (=> b!202197 m!312651))

(declare-fun m!312655 () Bool)

(assert (=> start!42906 m!312655))

(declare-fun m!312657 () Bool)

(assert (=> b!202204 m!312657))

(assert (=> b!202206 m!312645))

(assert (=> b!202206 m!312647))

(declare-fun m!312659 () Bool)

(assert (=> b!202202 m!312659))

(declare-fun m!312661 () Bool)

(assert (=> b!202199 m!312661))

(declare-fun m!312663 () Bool)

(assert (=> b!202198 m!312663))

(push 1)

(assert (not b!202196))

(assert (not b!202204))

(assert (not b!202206))

(assert (not b!202205))

(assert (not b!202201))

(assert (not b!202197))

(assert (not b!202200))

(assert (not start!42906))

(assert (not b!202199))

(assert (not b!202202))

(assert (not b!202198))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69225 () Bool)

(assert (=> d!69225 (= (array_inv!4266 (buf!5030 thiss!1204)) (bvsge (size!4525 (buf!5030 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!202199 d!69225))

(declare-fun d!69227 () Bool)

(assert (=> d!69227 (= (invariant!0 (currentBit!9456 thiss!1204) (currentByte!9461 thiss!1204) (size!4525 (buf!5030 thiss!1204))) (and (bvsge (currentBit!9456 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9456 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9461 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9461 thiss!1204) (size!4525 (buf!5030 thiss!1204))) (and (= (currentBit!9456 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9461 thiss!1204) (size!4525 (buf!5030 thiss!1204)))))))))

(assert (=> b!202204 d!69227))

(declare-fun d!69229 () Bool)

(declare-fun res!169445 () Bool)

(declare-fun e!138725 () Bool)

(assert (=> d!69229 (=> (not res!169445) (not e!138725))))

(assert (=> d!69229 (= res!169445 (= (size!4525 (buf!5030 (_2!9302 lt!314917))) (size!4525 (buf!5030 (_2!9302 lt!314915)))))))

(assert (=> d!69229 (= (isPrefixOf!0 (_2!9302 lt!314917) (_2!9302 lt!314915)) e!138725)))

(declare-fun b!202302 () Bool)

(declare-fun res!169443 () Bool)

(assert (=> b!202302 (=> (not res!169443) (not e!138725))))

(assert (=> b!202302 (= res!169443 (bvsle (bitIndex!0 (size!4525 (buf!5030 (_2!9302 lt!314917))) (currentByte!9461 (_2!9302 lt!314917)) (currentBit!9456 (_2!9302 lt!314917))) (bitIndex!0 (size!4525 (buf!5030 (_2!9302 lt!314915))) (currentByte!9461 (_2!9302 lt!314915)) (currentBit!9456 (_2!9302 lt!314915)))))))

(declare-fun b!202303 () Bool)

(declare-fun e!138726 () Bool)

(assert (=> b!202303 (= e!138725 e!138726)))

(declare-fun res!169444 () Bool)

(assert (=> b!202303 (=> res!169444 e!138726)))

(assert (=> b!202303 (= res!169444 (= (size!4525 (buf!5030 (_2!9302 lt!314917))) #b00000000000000000000000000000000))))

(declare-fun b!202304 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10280 array!10280 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202304 (= e!138726 (arrayBitRangesEq!0 (buf!5030 (_2!9302 lt!314917)) (buf!5030 (_2!9302 lt!314915)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4525 (buf!5030 (_2!9302 lt!314917))) (currentByte!9461 (_2!9302 lt!314917)) (currentBit!9456 (_2!9302 lt!314917)))))))

(assert (= (and d!69229 res!169445) b!202302))

(assert (= (and b!202302 res!169443) b!202303))

(assert (= (and b!202303 (not res!169444)) b!202304))

(assert (=> b!202302 m!312645))

(declare-fun m!312733 () Bool)

(assert (=> b!202302 m!312733))

(assert (=> b!202304 m!312645))

(assert (=> b!202304 m!312645))

(declare-fun m!312735 () Bool)

(assert (=> b!202304 m!312735))

(assert (=> b!202198 d!69229))

(declare-fun d!69233 () Bool)

(declare-fun e!138735 () Bool)

(assert (=> d!69233 e!138735))

(declare-fun res!169459 () Bool)

(assert (=> d!69233 (=> (not res!169459) (not e!138735))))

(declare-fun lt!314997 () (_ BitVec 64))

(declare-fun lt!314998 () (_ BitVec 64))

(declare-fun lt!314994 () (_ BitVec 64))

(assert (=> d!69233 (= res!169459 (= lt!314998 (bvsub lt!314994 lt!314997)))))

(assert (=> d!69233 (or (= (bvand lt!314994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314997 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314994 lt!314997) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69233 (= lt!314997 (remainingBits!0 ((_ sign_extend 32) (size!4525 (buf!5030 (_2!9302 lt!314917)))) ((_ sign_extend 32) (currentByte!9461 (_2!9302 lt!314917))) ((_ sign_extend 32) (currentBit!9456 (_2!9302 lt!314917)))))))

(declare-fun lt!314999 () (_ BitVec 64))

(declare-fun lt!314996 () (_ BitVec 64))

(assert (=> d!69233 (= lt!314994 (bvmul lt!314999 lt!314996))))

(assert (=> d!69233 (or (= lt!314999 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314996 (bvsdiv (bvmul lt!314999 lt!314996) lt!314999)))))

(assert (=> d!69233 (= lt!314996 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69233 (= lt!314999 ((_ sign_extend 32) (size!4525 (buf!5030 (_2!9302 lt!314917)))))))

(assert (=> d!69233 (= lt!314998 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9461 (_2!9302 lt!314917))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9456 (_2!9302 lt!314917)))))))

(assert (=> d!69233 (invariant!0 (currentBit!9456 (_2!9302 lt!314917)) (currentByte!9461 (_2!9302 lt!314917)) (size!4525 (buf!5030 (_2!9302 lt!314917))))))

(assert (=> d!69233 (= (bitIndex!0 (size!4525 (buf!5030 (_2!9302 lt!314917))) (currentByte!9461 (_2!9302 lt!314917)) (currentBit!9456 (_2!9302 lt!314917))) lt!314998)))

(declare-fun b!202318 () Bool)

(declare-fun res!169460 () Bool)

(assert (=> b!202318 (=> (not res!169460) (not e!138735))))

(assert (=> b!202318 (= res!169460 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314998))))

(declare-fun b!202319 () Bool)

(declare-fun lt!314995 () (_ BitVec 64))

(assert (=> b!202319 (= e!138735 (bvsle lt!314998 (bvmul lt!314995 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!202319 (or (= lt!314995 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314995 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314995)))))

(assert (=> b!202319 (= lt!314995 ((_ sign_extend 32) (size!4525 (buf!5030 (_2!9302 lt!314917)))))))

(assert (= (and d!69233 res!169459) b!202318))

(assert (= (and b!202318 res!169460) b!202319))

(declare-fun m!312739 () Bool)

(assert (=> d!69233 m!312739))

(declare-fun m!312741 () Bool)

(assert (=> d!69233 m!312741))

(assert (=> b!202200 d!69233))

(declare-fun d!69237 () Bool)

(declare-fun e!138736 () Bool)

(assert (=> d!69237 e!138736))

(declare-fun res!169461 () Bool)

(assert (=> d!69237 (=> (not res!169461) (not e!138736))))

(declare-fun lt!315000 () (_ BitVec 64))

(declare-fun lt!315003 () (_ BitVec 64))

(declare-fun lt!315004 () (_ BitVec 64))

(assert (=> d!69237 (= res!169461 (= lt!315004 (bvsub lt!315000 lt!315003)))))

(assert (=> d!69237 (or (= (bvand lt!315000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315003 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!315000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!315000 lt!315003) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69237 (= lt!315003 (remainingBits!0 ((_ sign_extend 32) (size!4525 (buf!5030 thiss!1204))) ((_ sign_extend 32) (currentByte!9461 thiss!1204)) ((_ sign_extend 32) (currentBit!9456 thiss!1204))))))

(declare-fun lt!315005 () (_ BitVec 64))

(declare-fun lt!315002 () (_ BitVec 64))

(assert (=> d!69237 (= lt!315000 (bvmul lt!315005 lt!315002))))

(assert (=> d!69237 (or (= lt!315005 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!315002 (bvsdiv (bvmul lt!315005 lt!315002) lt!315005)))))

(assert (=> d!69237 (= lt!315002 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69237 (= lt!315005 ((_ sign_extend 32) (size!4525 (buf!5030 thiss!1204))))))

(assert (=> d!69237 (= lt!315004 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9461 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9456 thiss!1204))))))

(assert (=> d!69237 (invariant!0 (currentBit!9456 thiss!1204) (currentByte!9461 thiss!1204) (size!4525 (buf!5030 thiss!1204)))))

(assert (=> d!69237 (= (bitIndex!0 (size!4525 (buf!5030 thiss!1204)) (currentByte!9461 thiss!1204) (currentBit!9456 thiss!1204)) lt!315004)))

(declare-fun b!202320 () Bool)

(declare-fun res!169462 () Bool)

(assert (=> b!202320 (=> (not res!169462) (not e!138736))))

(assert (=> b!202320 (= res!169462 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!315004))))

(declare-fun b!202321 () Bool)

(declare-fun lt!315001 () (_ BitVec 64))

(assert (=> b!202321 (= e!138736 (bvsle lt!315004 (bvmul lt!315001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!202321 (or (= lt!315001 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!315001 #b0000000000000000000000000000000000000000000000000000000000001000) lt!315001)))))

(assert (=> b!202321 (= lt!315001 ((_ sign_extend 32) (size!4525 (buf!5030 thiss!1204))))))

(assert (= (and d!69237 res!169461) b!202320))

(assert (= (and b!202320 res!169462) b!202321))

(declare-fun m!312743 () Bool)

(assert (=> d!69237 m!312743))

(assert (=> d!69237 m!312657))

(assert (=> b!202200 d!69237))

(declare-fun b!202331 () Bool)

(declare-fun res!169473 () Bool)

(declare-fun e!138742 () Bool)

(assert (=> b!202331 (=> (not res!169473) (not e!138742))))

(declare-fun lt!315015 () (_ BitVec 64))

(declare-fun lt!315017 () tuple2!17300)

(declare-fun lt!315014 () (_ BitVec 64))

(assert (=> b!202331 (= res!169473 (= (bitIndex!0 (size!4525 (buf!5030 (_2!9302 lt!315017))) (currentByte!9461 (_2!9302 lt!315017)) (currentBit!9456 (_2!9302 lt!315017))) (bvadd lt!315015 lt!315014)))))

(assert (=> b!202331 (or (not (= (bvand lt!315015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315014 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!315015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!315015 lt!315014) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202331 (= lt!315014 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!202331 (= lt!315015 (bitIndex!0 (size!4525 (buf!5030 thiss!1204)) (currentByte!9461 thiss!1204) (currentBit!9456 thiss!1204)))))

(declare-fun d!69239 () Bool)

(assert (=> d!69239 e!138742))

(declare-fun res!169472 () Bool)

(assert (=> d!69239 (=> (not res!169472) (not e!138742))))

(assert (=> d!69239 (= res!169472 (= (size!4525 (buf!5030 thiss!1204)) (size!4525 (buf!5030 (_2!9302 lt!315017)))))))

(declare-fun choose!16 (BitStream!8158 Bool) tuple2!17300)

(assert (=> d!69239 (= lt!315017 (choose!16 thiss!1204 lt!314914))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69239 (validate_offset_bit!0 ((_ sign_extend 32) (size!4525 (buf!5030 thiss!1204))) ((_ sign_extend 32) (currentByte!9461 thiss!1204)) ((_ sign_extend 32) (currentBit!9456 thiss!1204)))))

(assert (=> d!69239 (= (appendBit!0 thiss!1204 lt!314914) lt!315017)))

(declare-fun b!202334 () Bool)

(declare-fun e!138741 () Bool)

(declare-fun lt!315016 () tuple2!17302)

(assert (=> b!202334 (= e!138741 (= (bitIndex!0 (size!4525 (buf!5030 (_1!9303 lt!315016))) (currentByte!9461 (_1!9303 lt!315016)) (currentBit!9456 (_1!9303 lt!315016))) (bitIndex!0 (size!4525 (buf!5030 (_2!9302 lt!315017))) (currentByte!9461 (_2!9302 lt!315017)) (currentBit!9456 (_2!9302 lt!315017)))))))

(declare-fun b!202333 () Bool)

(assert (=> b!202333 (= e!138742 e!138741)))

(declare-fun res!169471 () Bool)

(assert (=> b!202333 (=> (not res!169471) (not e!138741))))

(assert (=> b!202333 (= res!169471 (and (= (_2!9303 lt!315016) lt!314914) (= (_1!9303 lt!315016) (_2!9302 lt!315017))))))

(assert (=> b!202333 (= lt!315016 (readBitPure!0 (readerFrom!0 (_2!9302 lt!315017) (currentBit!9456 thiss!1204) (currentByte!9461 thiss!1204))))))

(declare-fun b!202332 () Bool)

(declare-fun res!169474 () Bool)

(assert (=> b!202332 (=> (not res!169474) (not e!138742))))

(assert (=> b!202332 (= res!169474 (isPrefixOf!0 thiss!1204 (_2!9302 lt!315017)))))

(assert (= (and d!69239 res!169472) b!202331))

(assert (= (and b!202331 res!169473) b!202332))

(assert (= (and b!202332 res!169474) b!202333))

(assert (= (and b!202333 res!169471) b!202334))

(declare-fun m!312745 () Bool)

(assert (=> d!69239 m!312745))

(declare-fun m!312747 () Bool)

(assert (=> d!69239 m!312747))

(declare-fun m!312749 () Bool)

(assert (=> b!202331 m!312749))

(assert (=> b!202331 m!312647))

(declare-fun m!312751 () Bool)

(assert (=> b!202332 m!312751))

(declare-fun m!312753 () Bool)

(assert (=> b!202333 m!312753))

(assert (=> b!202333 m!312753))

(declare-fun m!312755 () Bool)

(assert (=> b!202333 m!312755))

(declare-fun m!312757 () Bool)

(assert (=> b!202334 m!312757))

(assert (=> b!202334 m!312749))

(assert (=> b!202200 d!69239))

(declare-fun d!69241 () Bool)

(declare-datatypes ((tuple2!17316 0))(
  ( (tuple2!17317 (_1!9310 Bool) (_2!9310 BitStream!8158)) )
))
(declare-fun lt!315020 () tuple2!17316)

(declare-fun readBit!0 (BitStream!8158) tuple2!17316)

(assert (=> d!69241 (= lt!315020 (readBit!0 (readerFrom!0 (_2!9302 lt!314917) (currentBit!9456 thiss!1204) (currentByte!9461 thiss!1204))))))

(assert (=> d!69241 (= (readBitPure!0 (readerFrom!0 (_2!9302 lt!314917) (currentBit!9456 thiss!1204) (currentByte!9461 thiss!1204))) (tuple2!17303 (_2!9310 lt!315020) (_1!9310 lt!315020)))))

(declare-fun bs!17083 () Bool)

(assert (= bs!17083 d!69241))

(assert (=> bs!17083 m!312639))

(declare-fun m!312759 () Bool)

(assert (=> bs!17083 m!312759))

(assert (=> b!202205 d!69241))

(declare-fun d!69243 () Bool)

(declare-fun e!138745 () Bool)

(assert (=> d!69243 e!138745))

(declare-fun res!169478 () Bool)

(assert (=> d!69243 (=> (not res!169478) (not e!138745))))

(assert (=> d!69243 (= res!169478 (invariant!0 (currentBit!9456 (_2!9302 lt!314917)) (currentByte!9461 (_2!9302 lt!314917)) (size!4525 (buf!5030 (_2!9302 lt!314917)))))))

(assert (=> d!69243 (= (readerFrom!0 (_2!9302 lt!314917) (currentBit!9456 thiss!1204) (currentByte!9461 thiss!1204)) (BitStream!8159 (buf!5030 (_2!9302 lt!314917)) (currentByte!9461 thiss!1204) (currentBit!9456 thiss!1204)))))

(declare-fun b!202337 () Bool)

(assert (=> b!202337 (= e!138745 (invariant!0 (currentBit!9456 thiss!1204) (currentByte!9461 thiss!1204) (size!4525 (buf!5030 (_2!9302 lt!314917)))))))

(assert (= (and d!69243 res!169478) b!202337))

(assert (=> d!69243 m!312741))

(declare-fun m!312761 () Bool)

(assert (=> b!202337 m!312761))

(assert (=> b!202205 d!69243))

(declare-fun d!69245 () Bool)

(assert (=> d!69245 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4525 (buf!5030 thiss!1204))) ((_ sign_extend 32) (currentByte!9461 thiss!1204)) ((_ sign_extend 32) (currentBit!9456 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4525 (buf!5030 thiss!1204))) ((_ sign_extend 32) (currentByte!9461 thiss!1204)) ((_ sign_extend 32) (currentBit!9456 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17084 () Bool)

(assert (= bs!17084 d!69245))

(assert (=> bs!17084 m!312743))

(assert (=> b!202196 d!69245))

(declare-fun d!69247 () Bool)

(declare-fun res!169481 () Bool)

(declare-fun e!138746 () Bool)

(assert (=> d!69247 (=> (not res!169481) (not e!138746))))

(assert (=> d!69247 (= res!169481 (= (size!4525 (buf!5030 thiss!1204)) (size!4525 (buf!5030 (_2!9302 lt!314917)))))))

(assert (=> d!69247 (= (isPrefixOf!0 thiss!1204 (_2!9302 lt!314917)) e!138746)))

(declare-fun b!202338 () Bool)

(declare-fun res!169479 () Bool)

(assert (=> b!202338 (=> (not res!169479) (not e!138746))))

(assert (=> b!202338 (= res!169479 (bvsle (bitIndex!0 (size!4525 (buf!5030 thiss!1204)) (currentByte!9461 thiss!1204) (currentBit!9456 thiss!1204)) (bitIndex!0 (size!4525 (buf!5030 (_2!9302 lt!314917))) (currentByte!9461 (_2!9302 lt!314917)) (currentBit!9456 (_2!9302 lt!314917)))))))

(declare-fun b!202339 () Bool)

(declare-fun e!138747 () Bool)

(assert (=> b!202339 (= e!138746 e!138747)))

(declare-fun res!169480 () Bool)

(assert (=> b!202339 (=> res!169480 e!138747)))

(assert (=> b!202339 (= res!169480 (= (size!4525 (buf!5030 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!202340 () Bool)

(assert (=> b!202340 (= e!138747 (arrayBitRangesEq!0 (buf!5030 thiss!1204) (buf!5030 (_2!9302 lt!314917)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4525 (buf!5030 thiss!1204)) (currentByte!9461 thiss!1204) (currentBit!9456 thiss!1204))))))

(assert (= (and d!69247 res!169481) b!202338))

(assert (= (and b!202338 res!169479) b!202339))

(assert (= (and b!202339 (not res!169480)) b!202340))

(assert (=> b!202338 m!312647))

(assert (=> b!202338 m!312645))

(assert (=> b!202340 m!312647))

(assert (=> b!202340 m!312647))

(declare-fun m!312763 () Bool)

(assert (=> b!202340 m!312763))

(assert (=> b!202201 d!69247))

(declare-fun b!202482 () Bool)

(declare-fun e!138833 () Bool)

(declare-fun lt!315468 () tuple2!17302)

(declare-fun lt!315496 () tuple2!17300)

(assert (=> b!202482 (= e!138833 (= (bitIndex!0 (size!4525 (buf!5030 (_1!9303 lt!315468))) (currentByte!9461 (_1!9303 lt!315468)) (currentBit!9456 (_1!9303 lt!315468))) (bitIndex!0 (size!4525 (buf!5030 (_2!9302 lt!315496))) (currentByte!9461 (_2!9302 lt!315496)) (currentBit!9456 (_2!9302 lt!315496)))))))

(declare-fun b!202483 () Bool)

(declare-fun e!138831 () Bool)

(declare-fun lt!315501 () (_ BitVec 64))

(assert (=> b!202483 (= e!138831 (validate_offset_bits!1 ((_ sign_extend 32) (size!4525 (buf!5030 (_2!9302 lt!314917)))) ((_ sign_extend 32) (currentByte!9461 (_2!9302 lt!314917))) ((_ sign_extend 32) (currentBit!9456 (_2!9302 lt!314917))) lt!315501))))

(declare-fun b!202484 () Bool)

(declare-fun e!138830 () Bool)

(declare-fun e!138828 () Bool)

(assert (=> b!202484 (= e!138830 e!138828)))

(declare-fun res!169601 () Bool)

(assert (=> b!202484 (=> (not res!169601) (not e!138828))))

(declare-datatypes ((tuple2!17320 0))(
  ( (tuple2!17321 (_1!9312 BitStream!8158) (_2!9312 (_ BitVec 64))) )
))
(declare-fun lt!315490 () tuple2!17320)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!202484 (= res!169601 (= (_2!9312 lt!315490) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-datatypes ((tuple2!17322 0))(
  ( (tuple2!17323 (_1!9313 BitStream!8158) (_2!9313 BitStream!8158)) )
))
(declare-fun lt!315488 () tuple2!17322)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8158 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17320)

(assert (=> b!202484 (= lt!315490 (readNBitsLSBFirstsLoopPure!0 (_1!9313 lt!315488) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!315508 () Unit!14343)

(declare-fun lt!315478 () Unit!14343)

(assert (=> b!202484 (= lt!315508 lt!315478)))

(declare-fun lt!315461 () tuple2!17300)

(assert (=> b!202484 (validate_offset_bits!1 ((_ sign_extend 32) (size!4525 (buf!5030 (_2!9302 lt!315461)))) ((_ sign_extend 32) (currentByte!9461 (_2!9302 lt!314917))) ((_ sign_extend 32) (currentBit!9456 (_2!9302 lt!314917))) lt!315501)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8158 array!10280 (_ BitVec 64)) Unit!14343)

(assert (=> b!202484 (= lt!315478 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9302 lt!314917) (buf!5030 (_2!9302 lt!315461)) lt!315501))))

(assert (=> b!202484 e!138831))

(declare-fun res!169604 () Bool)

(assert (=> b!202484 (=> (not res!169604) (not e!138831))))

(assert (=> b!202484 (= res!169604 (and (= (size!4525 (buf!5030 (_2!9302 lt!314917))) (size!4525 (buf!5030 (_2!9302 lt!315461)))) (bvsge lt!315501 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202484 (= lt!315501 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!202484 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!8158 BitStream!8158) tuple2!17322)

(assert (=> b!202484 (= lt!315488 (reader!0 (_2!9302 lt!314917) (_2!9302 lt!315461)))))

(declare-fun b!202485 () Bool)

(declare-fun e!138829 () Bool)

(declare-fun lt!315466 () tuple2!17302)

(declare-fun lt!315459 () tuple2!17302)

(assert (=> b!202485 (= e!138829 (= (_2!9303 lt!315466) (_2!9303 lt!315459)))))

(declare-fun b!202487 () Bool)

(declare-fun e!138832 () (_ BitVec 64))

(assert (=> b!202487 (= e!138832 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!202488 () Bool)

(assert (=> b!202488 (= lt!315468 (readBitPure!0 (readerFrom!0 (_2!9302 lt!315496) (currentBit!9456 (_2!9302 lt!314917)) (currentByte!9461 (_2!9302 lt!314917)))))))

(declare-fun lt!315513 () Bool)

(declare-fun res!169603 () Bool)

(assert (=> b!202488 (= res!169603 (and (= (_2!9303 lt!315468) lt!315513) (= (_1!9303 lt!315468) (_2!9302 lt!315496))))))

(assert (=> b!202488 (=> (not res!169603) (not e!138833))))

(declare-fun e!138834 () Bool)

(assert (=> b!202488 (= e!138834 e!138833)))

(declare-fun b!202489 () Bool)

(assert (=> b!202489 (= e!138828 (= (_1!9312 lt!315490) (_2!9313 lt!315488)))))

(declare-fun b!202490 () Bool)

(declare-fun res!169597 () Bool)

(assert (=> b!202490 (= res!169597 (isPrefixOf!0 (_2!9302 lt!314917) (_2!9302 lt!315496)))))

(assert (=> b!202490 (=> (not res!169597) (not e!138834))))

(declare-fun b!202491 () Bool)

(declare-fun res!169606 () Bool)

(assert (=> b!202491 (=> (not res!169606) (not e!138830))))

(assert (=> b!202491 (= res!169606 (isPrefixOf!0 (_2!9302 lt!314917) (_2!9302 lt!315461)))))

(declare-fun c!10040 () Bool)

(declare-fun lt!315493 () tuple2!17300)

(declare-fun bm!3185 () Bool)

(declare-fun call!3188 () Bool)

(assert (=> bm!3185 (= call!3188 (isPrefixOf!0 (_2!9302 lt!314917) (ite c!10040 (_2!9302 lt!314917) (_2!9302 lt!315493))))))

(declare-fun b!202492 () Bool)

(declare-fun res!169596 () Bool)

(assert (=> b!202492 (=> (not res!169596) (not e!138830))))

(assert (=> b!202492 (= res!169596 (= (size!4525 (buf!5030 (_2!9302 lt!314917))) (size!4525 (buf!5030 (_2!9302 lt!315461)))))))

(declare-fun b!202493 () Bool)

(declare-fun res!169598 () Bool)

(assert (=> b!202493 (= res!169598 (= (bitIndex!0 (size!4525 (buf!5030 (_2!9302 lt!315496))) (currentByte!9461 (_2!9302 lt!315496)) (currentBit!9456 (_2!9302 lt!315496))) (bvadd (bitIndex!0 (size!4525 (buf!5030 (_2!9302 lt!314917))) (currentByte!9461 (_2!9302 lt!314917)) (currentBit!9456 (_2!9302 lt!314917))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!202493 (=> (not res!169598) (not e!138834))))

(declare-fun d!69249 () Bool)

(assert (=> d!69249 e!138830))

(declare-fun res!169605 () Bool)

(assert (=> d!69249 (=> (not res!169605) (not e!138830))))

(assert (=> d!69249 (= res!169605 (invariant!0 (currentBit!9456 (_2!9302 lt!315461)) (currentByte!9461 (_2!9302 lt!315461)) (size!4525 (buf!5030 (_2!9302 lt!315461)))))))

(declare-fun e!138835 () tuple2!17300)

(assert (=> d!69249 (= lt!315461 e!138835)))

(assert (=> d!69249 (= c!10040 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69249 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69249 (= (appendBitsLSBFirstLoopTR!0 (_2!9302 lt!314917) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!315461)))

(declare-fun b!202486 () Bool)

(assert (=> b!202486 (= e!138832 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!202494 () Bool)

(declare-fun e!138827 () Bool)

(declare-fun lt!315484 () tuple2!17320)

(declare-fun lt!315511 () tuple2!17322)

(assert (=> b!202494 (= e!138827 (= (_1!9312 lt!315484) (_2!9313 lt!315511)))))

(declare-fun b!202495 () Bool)

(assert (=> b!202495 (= e!138835 (tuple2!17301 (_1!9302 lt!315493) (_2!9302 lt!315493)))))

(assert (=> b!202495 (= lt!315513 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202495 (= lt!315496 (appendBit!0 (_2!9302 lt!314917) lt!315513))))

(declare-fun res!169599 () Bool)

(assert (=> b!202495 (= res!169599 (= (size!4525 (buf!5030 (_2!9302 lt!314917))) (size!4525 (buf!5030 (_2!9302 lt!315496)))))))

(assert (=> b!202495 (=> (not res!169599) (not e!138834))))

(assert (=> b!202495 e!138834))

(declare-fun lt!315506 () tuple2!17300)

(assert (=> b!202495 (= lt!315506 lt!315496)))

(assert (=> b!202495 (= lt!315493 (appendBitsLSBFirstLoopTR!0 (_2!9302 lt!315506) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!315512 () Unit!14343)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8158 BitStream!8158 BitStream!8158) Unit!14343)

(assert (=> b!202495 (= lt!315512 (lemmaIsPrefixTransitive!0 (_2!9302 lt!314917) (_2!9302 lt!315506) (_2!9302 lt!315493)))))

(assert (=> b!202495 call!3188))

(declare-fun lt!315499 () Unit!14343)

(assert (=> b!202495 (= lt!315499 lt!315512)))

(assert (=> b!202495 (invariant!0 (currentBit!9456 (_2!9302 lt!314917)) (currentByte!9461 (_2!9302 lt!314917)) (size!4525 (buf!5030 (_2!9302 lt!315506))))))

(declare-fun lt!315462 () BitStream!8158)

(assert (=> b!202495 (= lt!315462 (BitStream!8159 (buf!5030 (_2!9302 lt!315506)) (currentByte!9461 (_2!9302 lt!314917)) (currentBit!9456 (_2!9302 lt!314917))))))

(assert (=> b!202495 (invariant!0 (currentBit!9456 lt!315462) (currentByte!9461 lt!315462) (size!4525 (buf!5030 (_2!9302 lt!315493))))))

(declare-fun lt!315498 () BitStream!8158)

(assert (=> b!202495 (= lt!315498 (BitStream!8159 (buf!5030 (_2!9302 lt!315493)) (currentByte!9461 lt!315462) (currentBit!9456 lt!315462)))))

(assert (=> b!202495 (= lt!315466 (readBitPure!0 lt!315462))))

(assert (=> b!202495 (= lt!315459 (readBitPure!0 lt!315498))))

(declare-fun lt!315479 () Unit!14343)

(declare-fun readBitPrefixLemma!0 (BitStream!8158 BitStream!8158) Unit!14343)

(assert (=> b!202495 (= lt!315479 (readBitPrefixLemma!0 lt!315462 (_2!9302 lt!315493)))))

(declare-fun res!169595 () Bool)

(assert (=> b!202495 (= res!169595 (= (bitIndex!0 (size!4525 (buf!5030 (_1!9303 lt!315466))) (currentByte!9461 (_1!9303 lt!315466)) (currentBit!9456 (_1!9303 lt!315466))) (bitIndex!0 (size!4525 (buf!5030 (_1!9303 lt!315459))) (currentByte!9461 (_1!9303 lt!315459)) (currentBit!9456 (_1!9303 lt!315459)))))))

(assert (=> b!202495 (=> (not res!169595) (not e!138829))))

(assert (=> b!202495 e!138829))

(declare-fun lt!315460 () Unit!14343)

(assert (=> b!202495 (= lt!315460 lt!315479)))

(declare-fun lt!315502 () tuple2!17322)

(assert (=> b!202495 (= lt!315502 (reader!0 (_2!9302 lt!314917) (_2!9302 lt!315493)))))

(declare-fun lt!315470 () tuple2!17322)

(assert (=> b!202495 (= lt!315470 (reader!0 (_2!9302 lt!315506) (_2!9302 lt!315493)))))

(declare-fun lt!315469 () tuple2!17302)

(assert (=> b!202495 (= lt!315469 (readBitPure!0 (_1!9313 lt!315502)))))

(assert (=> b!202495 (= (_2!9303 lt!315469) lt!315513)))

(declare-fun lt!315504 () Unit!14343)

(declare-fun Unit!14360 () Unit!14343)

(assert (=> b!202495 (= lt!315504 Unit!14360)))

(declare-fun lt!315489 () (_ BitVec 64))

(assert (=> b!202495 (= lt!315489 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!315458 () (_ BitVec 64))

(assert (=> b!202495 (= lt!315458 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!315476 () Unit!14343)

(assert (=> b!202495 (= lt!315476 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9302 lt!314917) (buf!5030 (_2!9302 lt!315493)) lt!315458))))

(assert (=> b!202495 (validate_offset_bits!1 ((_ sign_extend 32) (size!4525 (buf!5030 (_2!9302 lt!315493)))) ((_ sign_extend 32) (currentByte!9461 (_2!9302 lt!314917))) ((_ sign_extend 32) (currentBit!9456 (_2!9302 lt!314917))) lt!315458)))

(declare-fun lt!315497 () Unit!14343)

(assert (=> b!202495 (= lt!315497 lt!315476)))

(declare-fun lt!315467 () tuple2!17320)

(assert (=> b!202495 (= lt!315467 (readNBitsLSBFirstsLoopPure!0 (_1!9313 lt!315502) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!315489))))

(declare-fun lt!315463 () (_ BitVec 64))

(assert (=> b!202495 (= lt!315463 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!315485 () Unit!14343)

(assert (=> b!202495 (= lt!315485 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9302 lt!315506) (buf!5030 (_2!9302 lt!315493)) lt!315463))))

(assert (=> b!202495 (validate_offset_bits!1 ((_ sign_extend 32) (size!4525 (buf!5030 (_2!9302 lt!315493)))) ((_ sign_extend 32) (currentByte!9461 (_2!9302 lt!315506))) ((_ sign_extend 32) (currentBit!9456 (_2!9302 lt!315506))) lt!315463)))

(declare-fun lt!315474 () Unit!14343)

(assert (=> b!202495 (= lt!315474 lt!315485)))

(declare-fun lt!315472 () tuple2!17320)

(assert (=> b!202495 (= lt!315472 (readNBitsLSBFirstsLoopPure!0 (_1!9313 lt!315470) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!315489 (ite (_2!9303 lt!315469) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!315481 () tuple2!17320)

(assert (=> b!202495 (= lt!315481 (readNBitsLSBFirstsLoopPure!0 (_1!9313 lt!315502) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!315489))))

(declare-fun c!10041 () Bool)

(assert (=> b!202495 (= c!10041 (_2!9303 (readBitPure!0 (_1!9313 lt!315502))))))

(declare-fun lt!315495 () tuple2!17320)

(declare-fun withMovedBitIndex!0 (BitStream!8158 (_ BitVec 64)) BitStream!8158)

(assert (=> b!202495 (= lt!315495 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9313 lt!315502) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!315489 e!138832)))))

(declare-fun lt!315500 () Unit!14343)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8158 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14343)

(assert (=> b!202495 (= lt!315500 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9313 lt!315502) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!315489))))

(assert (=> b!202495 (and (= (_2!9312 lt!315481) (_2!9312 lt!315495)) (= (_1!9312 lt!315481) (_1!9312 lt!315495)))))

(declare-fun lt!315507 () Unit!14343)

(assert (=> b!202495 (= lt!315507 lt!315500)))

(assert (=> b!202495 (= (_1!9313 lt!315502) (withMovedBitIndex!0 (_2!9313 lt!315502) (bvsub (bitIndex!0 (size!4525 (buf!5030 (_2!9302 lt!314917))) (currentByte!9461 (_2!9302 lt!314917)) (currentBit!9456 (_2!9302 lt!314917))) (bitIndex!0 (size!4525 (buf!5030 (_2!9302 lt!315493))) (currentByte!9461 (_2!9302 lt!315493)) (currentBit!9456 (_2!9302 lt!315493))))))))

(declare-fun lt!315486 () Unit!14343)

(declare-fun Unit!14361 () Unit!14343)

(assert (=> b!202495 (= lt!315486 Unit!14361)))

(assert (=> b!202495 (= (_1!9313 lt!315470) (withMovedBitIndex!0 (_2!9313 lt!315470) (bvsub (bitIndex!0 (size!4525 (buf!5030 (_2!9302 lt!315506))) (currentByte!9461 (_2!9302 lt!315506)) (currentBit!9456 (_2!9302 lt!315506))) (bitIndex!0 (size!4525 (buf!5030 (_2!9302 lt!315493))) (currentByte!9461 (_2!9302 lt!315493)) (currentBit!9456 (_2!9302 lt!315493))))))))

(declare-fun lt!315487 () Unit!14343)

(declare-fun Unit!14363 () Unit!14343)

(assert (=> b!202495 (= lt!315487 Unit!14363)))

(assert (=> b!202495 (= (bitIndex!0 (size!4525 (buf!5030 (_2!9302 lt!314917))) (currentByte!9461 (_2!9302 lt!314917)) (currentBit!9456 (_2!9302 lt!314917))) (bvsub (bitIndex!0 (size!4525 (buf!5030 (_2!9302 lt!315506))) (currentByte!9461 (_2!9302 lt!315506)) (currentBit!9456 (_2!9302 lt!315506))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!315494 () Unit!14343)

(declare-fun Unit!14364 () Unit!14343)

(assert (=> b!202495 (= lt!315494 Unit!14364)))

(assert (=> b!202495 (= (_2!9312 lt!315467) (_2!9312 lt!315472))))

(declare-fun lt!315492 () Unit!14343)

(declare-fun Unit!14365 () Unit!14343)

(assert (=> b!202495 (= lt!315492 Unit!14365)))

(assert (=> b!202495 (invariant!0 (currentBit!9456 (_2!9302 lt!315493)) (currentByte!9461 (_2!9302 lt!315493)) (size!4525 (buf!5030 (_2!9302 lt!315493))))))

(declare-fun lt!315477 () Unit!14343)

(declare-fun Unit!14366 () Unit!14343)

(assert (=> b!202495 (= lt!315477 Unit!14366)))

(assert (=> b!202495 (= (size!4525 (buf!5030 (_2!9302 lt!314917))) (size!4525 (buf!5030 (_2!9302 lt!315493))))))

(declare-fun lt!315480 () Unit!14343)

(declare-fun Unit!14367 () Unit!14343)

(assert (=> b!202495 (= lt!315480 Unit!14367)))

(assert (=> b!202495 (= (bitIndex!0 (size!4525 (buf!5030 (_2!9302 lt!315493))) (currentByte!9461 (_2!9302 lt!315493)) (currentBit!9456 (_2!9302 lt!315493))) (bvsub (bvadd (bitIndex!0 (size!4525 (buf!5030 (_2!9302 lt!314917))) (currentByte!9461 (_2!9302 lt!314917)) (currentBit!9456 (_2!9302 lt!314917))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!315510 () Unit!14343)

(declare-fun Unit!14368 () Unit!14343)

(assert (=> b!202495 (= lt!315510 Unit!14368)))

(declare-fun lt!315503 () Unit!14343)

(declare-fun Unit!14369 () Unit!14343)

(assert (=> b!202495 (= lt!315503 Unit!14369)))

(assert (=> b!202495 (= lt!315511 (reader!0 (_2!9302 lt!314917) (_2!9302 lt!315493)))))

(declare-fun lt!315483 () (_ BitVec 64))

(assert (=> b!202495 (= lt!315483 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!315473 () Unit!14343)

(assert (=> b!202495 (= lt!315473 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9302 lt!314917) (buf!5030 (_2!9302 lt!315493)) lt!315483))))

(assert (=> b!202495 (validate_offset_bits!1 ((_ sign_extend 32) (size!4525 (buf!5030 (_2!9302 lt!315493)))) ((_ sign_extend 32) (currentByte!9461 (_2!9302 lt!314917))) ((_ sign_extend 32) (currentBit!9456 (_2!9302 lt!314917))) lt!315483)))

(declare-fun lt!315482 () Unit!14343)

(assert (=> b!202495 (= lt!315482 lt!315473)))

(assert (=> b!202495 (= lt!315484 (readNBitsLSBFirstsLoopPure!0 (_1!9313 lt!315511) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!169600 () Bool)

(assert (=> b!202495 (= res!169600 (= (_2!9312 lt!315484) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!202495 (=> (not res!169600) (not e!138827))))

(assert (=> b!202495 e!138827))

(declare-fun lt!315475 () Unit!14343)

(declare-fun Unit!14370 () Unit!14343)

(assert (=> b!202495 (= lt!315475 Unit!14370)))

(declare-fun b!202496 () Bool)

(declare-fun Unit!14371 () Unit!14343)

(assert (=> b!202496 (= e!138835 (tuple2!17301 Unit!14371 (_2!9302 lt!314917)))))

(declare-fun lt!315509 () Unit!14343)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8158) Unit!14343)

(assert (=> b!202496 (= lt!315509 (lemmaIsPrefixRefl!0 (_2!9302 lt!314917)))))

(assert (=> b!202496 call!3188))

(declare-fun lt!315491 () Unit!14343)

(assert (=> b!202496 (= lt!315491 lt!315509)))

(declare-fun b!202497 () Bool)

(declare-fun res!169602 () Bool)

(assert (=> b!202497 (=> (not res!169602) (not e!138830))))

(declare-fun lt!315471 () (_ BitVec 64))

(declare-fun lt!315464 () (_ BitVec 64))

(assert (=> b!202497 (= res!169602 (= (bitIndex!0 (size!4525 (buf!5030 (_2!9302 lt!315461))) (currentByte!9461 (_2!9302 lt!315461)) (currentBit!9456 (_2!9302 lt!315461))) (bvsub lt!315471 lt!315464)))))

(assert (=> b!202497 (or (= (bvand lt!315471 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315464 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!315471 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!315471 lt!315464) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202497 (= lt!315464 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!315505 () (_ BitVec 64))

(declare-fun lt!315465 () (_ BitVec 64))

(assert (=> b!202497 (= lt!315471 (bvadd lt!315505 lt!315465))))

(assert (=> b!202497 (or (not (= (bvand lt!315505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315465 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!315505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!315505 lt!315465) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202497 (= lt!315465 ((_ sign_extend 32) nBits!348))))

(assert (=> b!202497 (= lt!315505 (bitIndex!0 (size!4525 (buf!5030 (_2!9302 lt!314917))) (currentByte!9461 (_2!9302 lt!314917)) (currentBit!9456 (_2!9302 lt!314917))))))

(assert (= (and d!69249 c!10040) b!202496))

(assert (= (and d!69249 (not c!10040)) b!202495))

(assert (= (and b!202495 res!169599) b!202493))

(assert (= (and b!202493 res!169598) b!202490))

(assert (= (and b!202490 res!169597) b!202488))

(assert (= (and b!202488 res!169603) b!202482))

(assert (= (and b!202495 res!169595) b!202485))

(assert (= (and b!202495 c!10041) b!202486))

(assert (= (and b!202495 (not c!10041)) b!202487))

(assert (= (and b!202495 res!169600) b!202494))

(assert (= (or b!202496 b!202495) bm!3185))

(assert (= (and d!69249 res!169605) b!202492))

(assert (= (and b!202492 res!169596) b!202497))

(assert (= (and b!202497 res!169602) b!202491))

(assert (= (and b!202491 res!169606) b!202484))

(assert (= (and b!202484 res!169604) b!202483))

(assert (= (and b!202484 res!169601) b!202489))

(declare-fun m!312891 () Bool)

(assert (=> b!202482 m!312891))

(declare-fun m!312893 () Bool)

(assert (=> b!202482 m!312893))

(declare-fun m!312895 () Bool)

(assert (=> b!202497 m!312895))

(assert (=> b!202497 m!312645))

(declare-fun m!312897 () Bool)

(assert (=> d!69249 m!312897))

(declare-fun m!312899 () Bool)

(assert (=> b!202483 m!312899))

(declare-fun m!312901 () Bool)

(assert (=> b!202496 m!312901))

(declare-fun m!312903 () Bool)

(assert (=> bm!3185 m!312903))

(declare-fun m!312905 () Bool)

(assert (=> b!202490 m!312905))

(assert (=> b!202493 m!312893))

(assert (=> b!202493 m!312645))

(declare-fun m!312907 () Bool)

(assert (=> b!202495 m!312907))

(declare-fun m!312909 () Bool)

(assert (=> b!202495 m!312909))

(declare-fun m!312911 () Bool)

(assert (=> b!202495 m!312911))

(declare-fun m!312913 () Bool)

(assert (=> b!202495 m!312913))

(declare-fun m!312915 () Bool)

(assert (=> b!202495 m!312915))

(declare-fun m!312917 () Bool)

(assert (=> b!202495 m!312917))

(declare-fun m!312919 () Bool)

(assert (=> b!202495 m!312919))

(declare-fun m!312921 () Bool)

(assert (=> b!202495 m!312921))

(declare-fun m!312923 () Bool)

(assert (=> b!202495 m!312923))

(declare-fun m!312925 () Bool)

(assert (=> b!202495 m!312925))

(declare-fun m!312927 () Bool)

(assert (=> b!202495 m!312927))

(declare-fun m!312929 () Bool)

(assert (=> b!202495 m!312929))

(declare-fun m!312931 () Bool)

(assert (=> b!202495 m!312931))

(declare-fun m!312933 () Bool)

(assert (=> b!202495 m!312933))

(declare-fun m!312935 () Bool)

(assert (=> b!202495 m!312935))

(declare-fun m!312937 () Bool)

(assert (=> b!202495 m!312937))

(declare-fun m!312939 () Bool)

(assert (=> b!202495 m!312939))

(declare-fun m!312941 () Bool)

(assert (=> b!202495 m!312941))

(declare-fun m!312943 () Bool)

(assert (=> b!202495 m!312943))

(declare-fun m!312945 () Bool)

(assert (=> b!202495 m!312945))

(declare-fun m!312947 () Bool)

(assert (=> b!202495 m!312947))

(declare-fun m!312949 () Bool)

(assert (=> b!202495 m!312949))

(declare-fun m!312951 () Bool)

(assert (=> b!202495 m!312951))

(declare-fun m!312953 () Bool)

(assert (=> b!202495 m!312953))

(assert (=> b!202495 m!312909))

(declare-fun m!312955 () Bool)

(assert (=> b!202495 m!312955))

(declare-fun m!312957 () Bool)

(assert (=> b!202495 m!312957))

(declare-fun m!312959 () Bool)

(assert (=> b!202495 m!312959))

(declare-fun m!312961 () Bool)

(assert (=> b!202495 m!312961))

(assert (=> b!202495 m!312645))

(declare-fun m!312963 () Bool)

(assert (=> b!202495 m!312963))

(declare-fun m!312965 () Bool)

(assert (=> b!202495 m!312965))

(declare-fun m!312967 () Bool)

(assert (=> b!202495 m!312967))

(declare-fun m!312969 () Bool)

(assert (=> b!202495 m!312969))

(declare-fun m!312971 () Bool)

(assert (=> b!202488 m!312971))

(assert (=> b!202488 m!312971))

(declare-fun m!312973 () Bool)

(assert (=> b!202488 m!312973))

(assert (=> b!202484 m!312915))

(assert (=> b!202484 m!312953))

(declare-fun m!312975 () Bool)

(assert (=> b!202484 m!312975))

(declare-fun m!312977 () Bool)

(assert (=> b!202484 m!312977))

(declare-fun m!312979 () Bool)

(assert (=> b!202484 m!312979))

(declare-fun m!312981 () Bool)

(assert (=> b!202484 m!312981))

(declare-fun m!312983 () Bool)

(assert (=> b!202491 m!312983))

(assert (=> b!202201 d!69249))

(assert (=> b!202206 d!69233))

(assert (=> b!202206 d!69237))

(assert (=> b!202197 d!69247))

(declare-fun d!69273 () Bool)

(assert (=> d!69273 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9456 thiss!1204) (currentByte!9461 thiss!1204) (size!4525 (buf!5030 thiss!1204))))))

(declare-fun bs!17088 () Bool)

(assert (= bs!17088 d!69273))

(assert (=> bs!17088 m!312657))

(assert (=> start!42906 d!69273))

(declare-fun d!69275 () Bool)

(declare-fun e!138845 () Bool)

(assert (=> d!69275 e!138845))

(declare-fun res!169619 () Bool)

(assert (=> d!69275 (=> (not res!169619) (not e!138845))))

(declare-fun lt!315573 () (_ BitVec 64))

(declare-fun lt!315574 () (_ BitVec 64))

(declare-fun lt!315570 () (_ BitVec 64))

(assert (=> d!69275 (= res!169619 (= lt!315574 (bvsub lt!315570 lt!315573)))))

(assert (=> d!69275 (or (= (bvand lt!315570 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315573 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!315570 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!315570 lt!315573) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69275 (= lt!315573 (remainingBits!0 ((_ sign_extend 32) (size!4525 (buf!5030 (_1!9303 lt!314918)))) ((_ sign_extend 32) (currentByte!9461 (_1!9303 lt!314918))) ((_ sign_extend 32) (currentBit!9456 (_1!9303 lt!314918)))))))

(declare-fun lt!315575 () (_ BitVec 64))

(declare-fun lt!315572 () (_ BitVec 64))

(assert (=> d!69275 (= lt!315570 (bvmul lt!315575 lt!315572))))

(assert (=> d!69275 (or (= lt!315575 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!315572 (bvsdiv (bvmul lt!315575 lt!315572) lt!315575)))))

(assert (=> d!69275 (= lt!315572 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69275 (= lt!315575 ((_ sign_extend 32) (size!4525 (buf!5030 (_1!9303 lt!314918)))))))

(assert (=> d!69275 (= lt!315574 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9461 (_1!9303 lt!314918))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9456 (_1!9303 lt!314918)))))))

(assert (=> d!69275 (invariant!0 (currentBit!9456 (_1!9303 lt!314918)) (currentByte!9461 (_1!9303 lt!314918)) (size!4525 (buf!5030 (_1!9303 lt!314918))))))

(assert (=> d!69275 (= (bitIndex!0 (size!4525 (buf!5030 (_1!9303 lt!314918))) (currentByte!9461 (_1!9303 lt!314918)) (currentBit!9456 (_1!9303 lt!314918))) lt!315574)))

(declare-fun b!202514 () Bool)

(declare-fun res!169620 () Bool)

(assert (=> b!202514 (=> (not res!169620) (not e!138845))))

(assert (=> b!202514 (= res!169620 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!315574))))

(declare-fun b!202515 () Bool)

(declare-fun lt!315571 () (_ BitVec 64))

(assert (=> b!202515 (= e!138845 (bvsle lt!315574 (bvmul lt!315571 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!202515 (or (= lt!315571 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!315571 #b0000000000000000000000000000000000000000000000000000000000001000) lt!315571)))))

(assert (=> b!202515 (= lt!315571 ((_ sign_extend 32) (size!4525 (buf!5030 (_1!9303 lt!314918)))))))

(assert (= (and d!69275 res!169619) b!202514))

(assert (= (and b!202514 res!169620) b!202515))

(declare-fun m!312985 () Bool)

(assert (=> d!69275 m!312985))

(declare-fun m!312987 () Bool)

(assert (=> d!69275 m!312987))

(assert (=> b!202202 d!69275))

(push 1)

