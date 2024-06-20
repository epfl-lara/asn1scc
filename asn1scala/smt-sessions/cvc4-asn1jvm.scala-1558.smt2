; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43648 () Bool)

(assert start!43648)

(declare-fun b!207520 () Bool)

(declare-fun res!174127 () Bool)

(declare-fun e!141852 () Bool)

(assert (=> b!207520 (=> res!174127 e!141852)))

(declare-datatypes ((array!10431 0))(
  ( (array!10432 (arr!5517 (Array (_ BitVec 32) (_ BitVec 8))) (size!4587 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8282 0))(
  ( (BitStream!8283 (buf!5092 array!10431) (currentByte!9610 (_ BitVec 32)) (currentBit!9605 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14768 0))(
  ( (Unit!14769) )
))
(declare-datatypes ((tuple2!17802 0))(
  ( (tuple2!17803 (_1!9556 Unit!14768) (_2!9556 BitStream!8282)) )
))
(declare-fun lt!323818 () tuple2!17802)

(declare-fun lt!323826 () tuple2!17802)

(declare-fun isPrefixOf!0 (BitStream!8282 BitStream!8282) Bool)

(assert (=> b!207520 (= res!174127 (not (isPrefixOf!0 (_2!9556 lt!323818) (_2!9556 lt!323826))))))

(declare-fun b!207521 () Bool)

(declare-fun res!174131 () Bool)

(assert (=> b!207521 (=> res!174131 e!141852)))

(declare-fun thiss!1204 () BitStream!8282)

(assert (=> b!207521 (= res!174131 (not (isPrefixOf!0 thiss!1204 (_2!9556 lt!323818))))))

(declare-fun b!207522 () Bool)

(declare-fun res!174124 () Bool)

(assert (=> b!207522 (=> res!174124 e!141852)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!323829 () (_ BitVec 64))

(declare-fun lt!323830 () (_ BitVec 64))

(assert (=> b!207522 (= res!174124 (or (not (= (size!4587 (buf!5092 (_2!9556 lt!323826))) (size!4587 (buf!5092 thiss!1204)))) (not (= lt!323829 (bvsub (bvadd lt!323830 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!207523 () Bool)

(declare-fun e!141850 () Bool)

(declare-fun e!141855 () Bool)

(assert (=> b!207523 (= e!141850 e!141855)))

(declare-fun res!174123 () Bool)

(assert (=> b!207523 (=> (not res!174123) (not e!141855))))

(declare-fun lt!323820 () (_ BitVec 64))

(declare-fun lt!323824 () (_ BitVec 64))

(assert (=> b!207523 (= res!174123 (= lt!323820 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323824)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207523 (= lt!323820 (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!323818))) (currentByte!9610 (_2!9556 lt!323818)) (currentBit!9605 (_2!9556 lt!323818))))))

(assert (=> b!207523 (= lt!323824 (bitIndex!0 (size!4587 (buf!5092 thiss!1204)) (currentByte!9610 thiss!1204) (currentBit!9605 thiss!1204)))))

(declare-fun b!207524 () Bool)

(declare-fun res!174122 () Bool)

(assert (=> b!207524 (=> (not res!174122) (not e!141855))))

(assert (=> b!207524 (= res!174122 (isPrefixOf!0 thiss!1204 (_2!9556 lt!323818)))))

(declare-fun b!207525 () Bool)

(declare-fun e!141854 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!207525 (= e!141854 (invariant!0 (currentBit!9605 thiss!1204) (currentByte!9610 thiss!1204) (size!4587 (buf!5092 (_2!9556 lt!323826)))))))

(declare-fun b!207526 () Bool)

(declare-fun e!141851 () Bool)

(assert (=> b!207526 (= e!141851 e!141852)))

(declare-fun res!174121 () Bool)

(assert (=> b!207526 (=> res!174121 e!141852)))

(declare-fun lt!323815 () (_ BitVec 64))

(assert (=> b!207526 (= res!174121 (not (= lt!323829 (bvsub (bvsub (bvadd lt!323815 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!207526 (= lt!323829 (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!323826))) (currentByte!9610 (_2!9556 lt!323826)) (currentBit!9605 (_2!9556 lt!323826))))))

(assert (=> b!207526 (isPrefixOf!0 thiss!1204 (_2!9556 lt!323826))))

(declare-fun lt!323816 () Unit!14768)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8282 BitStream!8282 BitStream!8282) Unit!14768)

(assert (=> b!207526 (= lt!323816 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9556 lt!323818) (_2!9556 lt!323826)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8282 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17802)

(assert (=> b!207526 (= lt!323826 (appendBitsLSBFirstLoopTR!0 (_2!9556 lt!323818) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!207527 () Bool)

(declare-fun e!141856 () Bool)

(declare-fun e!141857 () Bool)

(assert (=> b!207527 (= e!141856 e!141857)))

(declare-fun res!174128 () Bool)

(assert (=> b!207527 (=> (not res!174128) (not e!141857))))

(declare-fun lt!323821 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!207527 (= res!174128 (validate_offset_bits!1 ((_ sign_extend 32) (size!4587 (buf!5092 thiss!1204))) ((_ sign_extend 32) (currentByte!9610 thiss!1204)) ((_ sign_extend 32) (currentBit!9605 thiss!1204)) lt!323821))))

(assert (=> b!207527 (= lt!323821 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!207528 () Bool)

(declare-fun e!141853 () Bool)

(declare-datatypes ((tuple2!17804 0))(
  ( (tuple2!17805 (_1!9557 BitStream!8282) (_2!9557 Bool)) )
))
(declare-fun lt!323827 () tuple2!17804)

(assert (=> b!207528 (= e!141853 (= (bitIndex!0 (size!4587 (buf!5092 (_1!9557 lt!323827))) (currentByte!9610 (_1!9557 lt!323827)) (currentBit!9605 (_1!9557 lt!323827))) lt!323820))))

(declare-fun res!174129 () Bool)

(assert (=> start!43648 (=> (not res!174129) (not e!141856))))

(assert (=> start!43648 (= res!174129 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43648 e!141856))

(assert (=> start!43648 true))

(declare-fun e!141848 () Bool)

(declare-fun inv!12 (BitStream!8282) Bool)

(assert (=> start!43648 (and (inv!12 thiss!1204) e!141848)))

(declare-fun b!207529 () Bool)

(assert (=> b!207529 (= e!141857 (not e!141851))))

(declare-fun res!174115 () Bool)

(assert (=> b!207529 (=> res!174115 e!141851)))

(assert (=> b!207529 (= res!174115 (not (= lt!323815 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323830))))))

(assert (=> b!207529 (= lt!323815 (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!323818))) (currentByte!9610 (_2!9556 lt!323818)) (currentBit!9605 (_2!9556 lt!323818))))))

(assert (=> b!207529 (= lt!323830 (bitIndex!0 (size!4587 (buf!5092 thiss!1204)) (currentByte!9610 thiss!1204) (currentBit!9605 thiss!1204)))))

(assert (=> b!207529 e!141850))

(declare-fun res!174116 () Bool)

(assert (=> b!207529 (=> (not res!174116) (not e!141850))))

(assert (=> b!207529 (= res!174116 (= (size!4587 (buf!5092 thiss!1204)) (size!4587 (buf!5092 (_2!9556 lt!323818)))))))

(declare-fun lt!323833 () Bool)

(declare-fun appendBit!0 (BitStream!8282 Bool) tuple2!17802)

(assert (=> b!207529 (= lt!323818 (appendBit!0 thiss!1204 lt!323833))))

(assert (=> b!207529 (= lt!323833 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!207530 () Bool)

(declare-fun res!174118 () Bool)

(assert (=> b!207530 (=> (not res!174118) (not e!141857))))

(assert (=> b!207530 (= res!174118 (invariant!0 (currentBit!9605 thiss!1204) (currentByte!9610 thiss!1204) (size!4587 (buf!5092 thiss!1204))))))

(declare-fun b!207531 () Bool)

(declare-fun e!141858 () Bool)

(assert (=> b!207531 (= e!141852 e!141858)))

(declare-fun res!174119 () Bool)

(assert (=> b!207531 (=> res!174119 e!141858)))

(declare-fun lt!323819 () (_ BitVec 64))

(assert (=> b!207531 (= res!174119 (or (not (= (size!4587 (buf!5092 (_2!9556 lt!323818))) (size!4587 (buf!5092 (_2!9556 lt!323826))))) (bvslt lt!323819 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207531 (= lt!323819 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!17806 0))(
  ( (tuple2!17807 (_1!9558 BitStream!8282) (_2!9558 (_ BitVec 64))) )
))
(declare-fun lt!323817 () tuple2!17806)

(declare-datatypes ((tuple2!17808 0))(
  ( (tuple2!17809 (_1!9559 BitStream!8282) (_2!9559 BitStream!8282)) )
))
(declare-fun lt!323831 () tuple2!17808)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8282 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17806)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207531 (= lt!323817 (readNBitsLSBFirstsLoopPure!0 (_1!9559 lt!323831) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(assert (=> b!207531 (validate_offset_bits!1 ((_ sign_extend 32) (size!4587 (buf!5092 (_2!9556 lt!323826)))) ((_ sign_extend 32) (currentByte!9610 thiss!1204)) ((_ sign_extend 32) (currentBit!9605 thiss!1204)) lt!323821)))

(declare-fun lt!323832 () Unit!14768)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8282 array!10431 (_ BitVec 64)) Unit!14768)

(assert (=> b!207531 (= lt!323832 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5092 (_2!9556 lt!323826)) lt!323821))))

(declare-fun readBitPure!0 (BitStream!8282) tuple2!17804)

(assert (=> b!207531 (= (_2!9557 (readBitPure!0 (_1!9559 lt!323831))) lt!323833)))

(declare-fun lt!323828 () tuple2!17808)

(declare-fun reader!0 (BitStream!8282 BitStream!8282) tuple2!17808)

(assert (=> b!207531 (= lt!323828 (reader!0 (_2!9556 lt!323818) (_2!9556 lt!323826)))))

(assert (=> b!207531 (= lt!323831 (reader!0 thiss!1204 (_2!9556 lt!323826)))))

(declare-fun e!141849 () Bool)

(assert (=> b!207531 e!141849))

(declare-fun res!174130 () Bool)

(assert (=> b!207531 (=> (not res!174130) (not e!141849))))

(declare-fun lt!323834 () tuple2!17804)

(declare-fun lt!323823 () tuple2!17804)

(assert (=> b!207531 (= res!174130 (= (bitIndex!0 (size!4587 (buf!5092 (_1!9557 lt!323834))) (currentByte!9610 (_1!9557 lt!323834)) (currentBit!9605 (_1!9557 lt!323834))) (bitIndex!0 (size!4587 (buf!5092 (_1!9557 lt!323823))) (currentByte!9610 (_1!9557 lt!323823)) (currentBit!9605 (_1!9557 lt!323823)))))))

(declare-fun lt!323825 () Unit!14768)

(declare-fun lt!323822 () BitStream!8282)

(declare-fun readBitPrefixLemma!0 (BitStream!8282 BitStream!8282) Unit!14768)

(assert (=> b!207531 (= lt!323825 (readBitPrefixLemma!0 lt!323822 (_2!9556 lt!323826)))))

(assert (=> b!207531 (= lt!323823 (readBitPure!0 (BitStream!8283 (buf!5092 (_2!9556 lt!323826)) (currentByte!9610 thiss!1204) (currentBit!9605 thiss!1204))))))

(assert (=> b!207531 (= lt!323834 (readBitPure!0 lt!323822))))

(assert (=> b!207531 e!141854))

(declare-fun res!174117 () Bool)

(assert (=> b!207531 (=> (not res!174117) (not e!141854))))

(assert (=> b!207531 (= res!174117 (invariant!0 (currentBit!9605 thiss!1204) (currentByte!9610 thiss!1204) (size!4587 (buf!5092 (_2!9556 lt!323818)))))))

(assert (=> b!207531 (= lt!323822 (BitStream!8283 (buf!5092 (_2!9556 lt!323818)) (currentByte!9610 thiss!1204) (currentBit!9605 thiss!1204)))))

(declare-fun b!207532 () Bool)

(declare-fun array_inv!4328 (array!10431) Bool)

(assert (=> b!207532 (= e!141848 (array_inv!4328 (buf!5092 thiss!1204)))))

(declare-fun b!207533 () Bool)

(assert (=> b!207533 (= e!141849 (= (_2!9557 lt!323834) (_2!9557 lt!323823)))))

(declare-fun b!207534 () Bool)

(declare-fun res!174126 () Bool)

(assert (=> b!207534 (=> res!174126 e!141852)))

(assert (=> b!207534 (= res!174126 (not (invariant!0 (currentBit!9605 (_2!9556 lt!323826)) (currentByte!9610 (_2!9556 lt!323826)) (size!4587 (buf!5092 (_2!9556 lt!323826))))))))

(declare-fun b!207535 () Bool)

(assert (=> b!207535 (= e!141858 (validate_offset_bits!1 ((_ sign_extend 32) (size!4587 (buf!5092 (_2!9556 lt!323818)))) ((_ sign_extend 32) (currentByte!9610 (_2!9556 lt!323818))) ((_ sign_extend 32) (currentBit!9605 (_2!9556 lt!323818))) lt!323819))))

(declare-fun b!207536 () Bool)

(declare-fun res!174120 () Bool)

(assert (=> b!207536 (=> (not res!174120) (not e!141857))))

(assert (=> b!207536 (= res!174120 (not (= i!590 nBits!348)))))

(declare-fun b!207537 () Bool)

(assert (=> b!207537 (= e!141855 e!141853)))

(declare-fun res!174125 () Bool)

(assert (=> b!207537 (=> (not res!174125) (not e!141853))))

(assert (=> b!207537 (= res!174125 (and (= (_2!9557 lt!323827) lt!323833) (= (_1!9557 lt!323827) (_2!9556 lt!323818))))))

(declare-fun readerFrom!0 (BitStream!8282 (_ BitVec 32) (_ BitVec 32)) BitStream!8282)

(assert (=> b!207537 (= lt!323827 (readBitPure!0 (readerFrom!0 (_2!9556 lt!323818) (currentBit!9605 thiss!1204) (currentByte!9610 thiss!1204))))))

(assert (= (and start!43648 res!174129) b!207527))

(assert (= (and b!207527 res!174128) b!207530))

(assert (= (and b!207530 res!174118) b!207536))

(assert (= (and b!207536 res!174120) b!207529))

(assert (= (and b!207529 res!174116) b!207523))

(assert (= (and b!207523 res!174123) b!207524))

(assert (= (and b!207524 res!174122) b!207537))

(assert (= (and b!207537 res!174125) b!207528))

(assert (= (and b!207529 (not res!174115)) b!207526))

(assert (= (and b!207526 (not res!174121)) b!207534))

(assert (= (and b!207534 (not res!174126)) b!207522))

(assert (= (and b!207522 (not res!174124)) b!207520))

(assert (= (and b!207520 (not res!174127)) b!207521))

(assert (= (and b!207521 (not res!174131)) b!207531))

(assert (= (and b!207531 res!174117) b!207525))

(assert (= (and b!207531 res!174130) b!207533))

(assert (= (and b!207531 (not res!174119)) b!207535))

(assert (= start!43648 b!207532))

(declare-fun m!319277 () Bool)

(assert (=> b!207523 m!319277))

(declare-fun m!319279 () Bool)

(assert (=> b!207523 m!319279))

(declare-fun m!319281 () Bool)

(assert (=> b!207524 m!319281))

(declare-fun m!319283 () Bool)

(assert (=> b!207528 m!319283))

(declare-fun m!319285 () Bool)

(assert (=> b!207520 m!319285))

(assert (=> b!207521 m!319281))

(declare-fun m!319287 () Bool)

(assert (=> b!207534 m!319287))

(declare-fun m!319289 () Bool)

(assert (=> b!207525 m!319289))

(declare-fun m!319291 () Bool)

(assert (=> b!207537 m!319291))

(assert (=> b!207537 m!319291))

(declare-fun m!319293 () Bool)

(assert (=> b!207537 m!319293))

(declare-fun m!319295 () Bool)

(assert (=> b!207532 m!319295))

(declare-fun m!319297 () Bool)

(assert (=> b!207527 m!319297))

(declare-fun m!319299 () Bool)

(assert (=> b!207535 m!319299))

(declare-fun m!319301 () Bool)

(assert (=> b!207530 m!319301))

(declare-fun m!319303 () Bool)

(assert (=> b!207531 m!319303))

(declare-fun m!319305 () Bool)

(assert (=> b!207531 m!319305))

(declare-fun m!319307 () Bool)

(assert (=> b!207531 m!319307))

(declare-fun m!319309 () Bool)

(assert (=> b!207531 m!319309))

(declare-fun m!319311 () Bool)

(assert (=> b!207531 m!319311))

(declare-fun m!319313 () Bool)

(assert (=> b!207531 m!319313))

(declare-fun m!319315 () Bool)

(assert (=> b!207531 m!319315))

(declare-fun m!319317 () Bool)

(assert (=> b!207531 m!319317))

(declare-fun m!319319 () Bool)

(assert (=> b!207531 m!319319))

(declare-fun m!319321 () Bool)

(assert (=> b!207531 m!319321))

(declare-fun m!319323 () Bool)

(assert (=> b!207531 m!319323))

(declare-fun m!319325 () Bool)

(assert (=> b!207531 m!319325))

(declare-fun m!319327 () Bool)

(assert (=> b!207531 m!319327))

(declare-fun m!319329 () Bool)

(assert (=> start!43648 m!319329))

(declare-fun m!319331 () Bool)

(assert (=> b!207526 m!319331))

(declare-fun m!319333 () Bool)

(assert (=> b!207526 m!319333))

(declare-fun m!319335 () Bool)

(assert (=> b!207526 m!319335))

(declare-fun m!319337 () Bool)

(assert (=> b!207526 m!319337))

(assert (=> b!207529 m!319277))

(assert (=> b!207529 m!319279))

(declare-fun m!319339 () Bool)

(assert (=> b!207529 m!319339))

(push 1)

(assert (not b!207532))

(assert (not b!207525))

(assert (not b!207535))

(assert (not b!207520))

(assert (not b!207521))

(assert (not b!207530))

(assert (not b!207523))

(assert (not b!207534))

(assert (not b!207529))

(assert (not b!207524))

(assert (not b!207528))

(assert (not b!207526))

(assert (not b!207531))

(assert (not b!207537))

(assert (not start!43648))

(assert (not b!207527))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!70195 () Bool)

(declare-fun e!141886 () Bool)

(assert (=> d!70195 e!141886))

(declare-fun res!174178 () Bool)

(assert (=> d!70195 (=> (not res!174178) (not e!141886))))

(declare-fun lt!323906 () (_ BitVec 64))

(declare-fun lt!323902 () (_ BitVec 64))

(declare-fun lt!323904 () (_ BitVec 64))

(assert (=> d!70195 (= res!174178 (= lt!323904 (bvsub lt!323906 lt!323902)))))

(assert (=> d!70195 (or (= (bvand lt!323906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!323902 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!323906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!323906 lt!323902) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!70195 (= lt!323902 (remainingBits!0 ((_ sign_extend 32) (size!4587 (buf!5092 (_2!9556 lt!323826)))) ((_ sign_extend 32) (currentByte!9610 (_2!9556 lt!323826))) ((_ sign_extend 32) (currentBit!9605 (_2!9556 lt!323826)))))))

(declare-fun lt!323901 () (_ BitVec 64))

(declare-fun lt!323905 () (_ BitVec 64))

(assert (=> d!70195 (= lt!323906 (bvmul lt!323901 lt!323905))))

(assert (=> d!70195 (or (= lt!323901 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!323905 (bvsdiv (bvmul lt!323901 lt!323905) lt!323901)))))

(assert (=> d!70195 (= lt!323905 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70195 (= lt!323901 ((_ sign_extend 32) (size!4587 (buf!5092 (_2!9556 lt!323826)))))))

(assert (=> d!70195 (= lt!323904 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9610 (_2!9556 lt!323826))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9605 (_2!9556 lt!323826)))))))

(assert (=> d!70195 (invariant!0 (currentBit!9605 (_2!9556 lt!323826)) (currentByte!9610 (_2!9556 lt!323826)) (size!4587 (buf!5092 (_2!9556 lt!323826))))))

(assert (=> d!70195 (= (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!323826))) (currentByte!9610 (_2!9556 lt!323826)) (currentBit!9605 (_2!9556 lt!323826))) lt!323904)))

(declare-fun b!207582 () Bool)

(declare-fun res!174177 () Bool)

(assert (=> b!207582 (=> (not res!174177) (not e!141886))))

(assert (=> b!207582 (= res!174177 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!323904))))

(declare-fun b!207583 () Bool)

(declare-fun lt!323903 () (_ BitVec 64))

(assert (=> b!207583 (= e!141886 (bvsle lt!323904 (bvmul lt!323903 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!207583 (or (= lt!323903 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!323903 #b0000000000000000000000000000000000000000000000000000000000001000) lt!323903)))))

(assert (=> b!207583 (= lt!323903 ((_ sign_extend 32) (size!4587 (buf!5092 (_2!9556 lt!323826)))))))

(assert (= (and d!70195 res!174178) b!207582))

(assert (= (and b!207582 res!174177) b!207583))

(declare-fun m!319363 () Bool)

(assert (=> d!70195 m!319363))

(assert (=> d!70195 m!319287))

(assert (=> b!207526 d!70195))

(declare-fun d!70209 () Bool)

(declare-fun res!174187 () Bool)

(declare-fun e!141892 () Bool)

(assert (=> d!70209 (=> (not res!174187) (not e!141892))))

(assert (=> d!70209 (= res!174187 (= (size!4587 (buf!5092 thiss!1204)) (size!4587 (buf!5092 (_2!9556 lt!323826)))))))

(assert (=> d!70209 (= (isPrefixOf!0 thiss!1204 (_2!9556 lt!323826)) e!141892)))

(declare-fun b!207590 () Bool)

(declare-fun res!174186 () Bool)

(assert (=> b!207590 (=> (not res!174186) (not e!141892))))

(assert (=> b!207590 (= res!174186 (bvsle (bitIndex!0 (size!4587 (buf!5092 thiss!1204)) (currentByte!9610 thiss!1204) (currentBit!9605 thiss!1204)) (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!323826))) (currentByte!9610 (_2!9556 lt!323826)) (currentBit!9605 (_2!9556 lt!323826)))))))

(declare-fun b!207591 () Bool)

(declare-fun e!141891 () Bool)

(assert (=> b!207591 (= e!141892 e!141891)))

(declare-fun res!174185 () Bool)

(assert (=> b!207591 (=> res!174185 e!141891)))

(assert (=> b!207591 (= res!174185 (= (size!4587 (buf!5092 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!207592 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10431 array!10431 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!207592 (= e!141891 (arrayBitRangesEq!0 (buf!5092 thiss!1204) (buf!5092 (_2!9556 lt!323826)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4587 (buf!5092 thiss!1204)) (currentByte!9610 thiss!1204) (currentBit!9605 thiss!1204))))))

(assert (= (and d!70209 res!174187) b!207590))

(assert (= (and b!207590 res!174186) b!207591))

(assert (= (and b!207591 (not res!174185)) b!207592))

(assert (=> b!207590 m!319279))

(assert (=> b!207590 m!319331))

(assert (=> b!207592 m!319279))

(assert (=> b!207592 m!319279))

(declare-fun m!319365 () Bool)

(assert (=> b!207592 m!319365))

(assert (=> b!207526 d!70209))

(declare-fun d!70211 () Bool)

(assert (=> d!70211 (isPrefixOf!0 thiss!1204 (_2!9556 lt!323826))))

(declare-fun lt!323909 () Unit!14768)

(declare-fun choose!30 (BitStream!8282 BitStream!8282 BitStream!8282) Unit!14768)

(assert (=> d!70211 (= lt!323909 (choose!30 thiss!1204 (_2!9556 lt!323818) (_2!9556 lt!323826)))))

(assert (=> d!70211 (isPrefixOf!0 thiss!1204 (_2!9556 lt!323818))))

(assert (=> d!70211 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9556 lt!323818) (_2!9556 lt!323826)) lt!323909)))

(declare-fun bs!17265 () Bool)

(assert (= bs!17265 d!70211))

(assert (=> bs!17265 m!319333))

(declare-fun m!319367 () Bool)

(assert (=> bs!17265 m!319367))

(assert (=> bs!17265 m!319281))

(assert (=> b!207526 d!70211))

(declare-fun b!207773 () Bool)

(declare-fun e!141991 () (_ BitVec 64))

(assert (=> b!207773 (= e!141991 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!207774 () Bool)

(declare-fun e!141993 () tuple2!17802)

(declare-fun Unit!14783 () Unit!14768)

(assert (=> b!207774 (= e!141993 (tuple2!17803 Unit!14783 (_2!9556 lt!323818)))))

(declare-fun lt!324491 () Unit!14768)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8282) Unit!14768)

(assert (=> b!207774 (= lt!324491 (lemmaIsPrefixRefl!0 (_2!9556 lt!323818)))))

(declare-fun call!3276 () Bool)

(assert (=> b!207774 call!3276))

(declare-fun lt!324498 () Unit!14768)

(assert (=> b!207774 (= lt!324498 lt!324491)))

(declare-fun b!207776 () Bool)

(declare-fun res!174336 () Bool)

(declare-fun lt!324479 () tuple2!17802)

(assert (=> b!207776 (= res!174336 (= (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!324479))) (currentByte!9610 (_2!9556 lt!324479)) (currentBit!9605 (_2!9556 lt!324479))) (bvadd (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!323818))) (currentByte!9610 (_2!9556 lt!323818)) (currentBit!9605 (_2!9556 lt!323818))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!141994 () Bool)

(assert (=> b!207776 (=> (not res!174336) (not e!141994))))

(declare-fun lt!324503 () tuple2!17802)

(declare-fun c!10228 () Bool)

(declare-fun bm!3273 () Bool)

(assert (=> bm!3273 (= call!3276 (isPrefixOf!0 (_2!9556 lt!323818) (ite c!10228 (_2!9556 lt!323818) (_2!9556 lt!324503))))))

(declare-fun b!207777 () Bool)

(declare-fun e!141992 () Bool)

(declare-fun lt!324511 () tuple2!17806)

(declare-fun lt!324471 () tuple2!17808)

(assert (=> b!207777 (= e!141992 (= (_1!9558 lt!324511) (_2!9559 lt!324471)))))

(declare-fun b!207778 () Bool)

(declare-fun res!174342 () Bool)

(declare-fun e!141990 () Bool)

(assert (=> b!207778 (=> (not res!174342) (not e!141990))))

(declare-fun lt!324493 () tuple2!17802)

(declare-fun lt!324510 () (_ BitVec 64))

(declare-fun lt!324523 () (_ BitVec 64))

(assert (=> b!207778 (= res!174342 (= (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!324493))) (currentByte!9610 (_2!9556 lt!324493)) (currentBit!9605 (_2!9556 lt!324493))) (bvsub lt!324523 lt!324510)))))

(assert (=> b!207778 (or (= (bvand lt!324523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324510 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!324523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!324523 lt!324510) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207778 (= lt!324510 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!324500 () (_ BitVec 64))

(declare-fun lt!324487 () (_ BitVec 64))

(assert (=> b!207778 (= lt!324523 (bvadd lt!324500 lt!324487))))

(assert (=> b!207778 (or (not (= (bvand lt!324500 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324487 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!324500 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!324500 lt!324487) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207778 (= lt!324487 ((_ sign_extend 32) nBits!348))))

(assert (=> b!207778 (= lt!324500 (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!323818))) (currentByte!9610 (_2!9556 lt!323818)) (currentBit!9605 (_2!9556 lt!323818))))))

(declare-fun b!207779 () Bool)

(declare-fun res!174335 () Bool)

(assert (=> b!207779 (=> (not res!174335) (not e!141990))))

(assert (=> b!207779 (= res!174335 (isPrefixOf!0 (_2!9556 lt!323818) (_2!9556 lt!324493)))))

(declare-fun b!207780 () Bool)

(declare-fun lt!324478 () tuple2!17804)

(assert (=> b!207780 (= lt!324478 (readBitPure!0 (readerFrom!0 (_2!9556 lt!324479) (currentBit!9605 (_2!9556 lt!323818)) (currentByte!9610 (_2!9556 lt!323818)))))))

(declare-fun lt!324516 () Bool)

(declare-fun res!174338 () Bool)

(assert (=> b!207780 (= res!174338 (and (= (_2!9557 lt!324478) lt!324516) (= (_1!9557 lt!324478) (_2!9556 lt!324479))))))

(declare-fun e!141996 () Bool)

(assert (=> b!207780 (=> (not res!174338) (not e!141996))))

(assert (=> b!207780 (= e!141994 e!141996)))

(declare-fun b!207781 () Bool)

(declare-fun e!141995 () Bool)

(declare-fun lt!324484 () (_ BitVec 64))

(assert (=> b!207781 (= e!141995 (validate_offset_bits!1 ((_ sign_extend 32) (size!4587 (buf!5092 (_2!9556 lt!323818)))) ((_ sign_extend 32) (currentByte!9610 (_2!9556 lt!323818))) ((_ sign_extend 32) (currentBit!9605 (_2!9556 lt!323818))) lt!324484))))

(declare-fun b!207775 () Bool)

(declare-fun res!174340 () Bool)

(assert (=> b!207775 (=> (not res!174340) (not e!141990))))

(assert (=> b!207775 (= res!174340 (= (size!4587 (buf!5092 (_2!9556 lt!323818))) (size!4587 (buf!5092 (_2!9556 lt!324493)))))))

(declare-fun d!70213 () Bool)

(assert (=> d!70213 e!141990))

(declare-fun res!174341 () Bool)

(assert (=> d!70213 (=> (not res!174341) (not e!141990))))

(assert (=> d!70213 (= res!174341 (invariant!0 (currentBit!9605 (_2!9556 lt!324493)) (currentByte!9610 (_2!9556 lt!324493)) (size!4587 (buf!5092 (_2!9556 lt!324493)))))))

(assert (=> d!70213 (= lt!324493 e!141993)))

(assert (=> d!70213 (= c!10228 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!70213 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!70213 (= (appendBitsLSBFirstLoopTR!0 (_2!9556 lt!323818) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!324493)))

(declare-fun b!207782 () Bool)

(assert (=> b!207782 (= e!141996 (= (bitIndex!0 (size!4587 (buf!5092 (_1!9557 lt!324478))) (currentByte!9610 (_1!9557 lt!324478)) (currentBit!9605 (_1!9557 lt!324478))) (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!324479))) (currentByte!9610 (_2!9556 lt!324479)) (currentBit!9605 (_2!9556 lt!324479)))))))

(declare-fun b!207783 () Bool)

(declare-fun e!141989 () Bool)

(declare-fun lt!324501 () tuple2!17806)

(declare-fun lt!324476 () tuple2!17808)

(assert (=> b!207783 (= e!141989 (= (_1!9558 lt!324501) (_2!9559 lt!324476)))))

(declare-fun b!207784 () Bool)

(declare-fun res!174332 () Bool)

(assert (=> b!207784 (= res!174332 (isPrefixOf!0 (_2!9556 lt!323818) (_2!9556 lt!324479)))))

(assert (=> b!207784 (=> (not res!174332) (not e!141994))))

(declare-fun b!207785 () Bool)

(declare-fun e!141997 () Bool)

(declare-fun lt!324508 () tuple2!17804)

(declare-fun lt!324519 () tuple2!17804)

(assert (=> b!207785 (= e!141997 (= (_2!9557 lt!324508) (_2!9557 lt!324519)))))

(declare-fun b!207786 () Bool)

(assert (=> b!207786 (= e!141990 e!141989)))

(declare-fun res!174331 () Bool)

(assert (=> b!207786 (=> (not res!174331) (not e!141989))))

(assert (=> b!207786 (= res!174331 (= (_2!9558 lt!324501) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!207786 (= lt!324501 (readNBitsLSBFirstsLoopPure!0 (_1!9559 lt!324476) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!324495 () Unit!14768)

(declare-fun lt!324524 () Unit!14768)

(assert (=> b!207786 (= lt!324495 lt!324524)))

(assert (=> b!207786 (validate_offset_bits!1 ((_ sign_extend 32) (size!4587 (buf!5092 (_2!9556 lt!324493)))) ((_ sign_extend 32) (currentByte!9610 (_2!9556 lt!323818))) ((_ sign_extend 32) (currentBit!9605 (_2!9556 lt!323818))) lt!324484)))

(assert (=> b!207786 (= lt!324524 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9556 lt!323818) (buf!5092 (_2!9556 lt!324493)) lt!324484))))

(assert (=> b!207786 e!141995))

(declare-fun res!174339 () Bool)

(assert (=> b!207786 (=> (not res!174339) (not e!141995))))

(assert (=> b!207786 (= res!174339 (and (= (size!4587 (buf!5092 (_2!9556 lt!323818))) (size!4587 (buf!5092 (_2!9556 lt!324493)))) (bvsge lt!324484 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207786 (= lt!324484 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!207786 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!207786 (= lt!324476 (reader!0 (_2!9556 lt!323818) (_2!9556 lt!324493)))))

(declare-fun b!207787 () Bool)

(assert (=> b!207787 (= e!141993 (tuple2!17803 (_1!9556 lt!324503) (_2!9556 lt!324503)))))

(assert (=> b!207787 (= lt!324516 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207787 (= lt!324479 (appendBit!0 (_2!9556 lt!323818) lt!324516))))

(declare-fun res!174337 () Bool)

(assert (=> b!207787 (= res!174337 (= (size!4587 (buf!5092 (_2!9556 lt!323818))) (size!4587 (buf!5092 (_2!9556 lt!324479)))))))

(assert (=> b!207787 (=> (not res!174337) (not e!141994))))

(assert (=> b!207787 e!141994))

(declare-fun lt!324518 () tuple2!17802)

(assert (=> b!207787 (= lt!324518 lt!324479)))

(assert (=> b!207787 (= lt!324503 (appendBitsLSBFirstLoopTR!0 (_2!9556 lt!324518) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!324472 () Unit!14768)

(assert (=> b!207787 (= lt!324472 (lemmaIsPrefixTransitive!0 (_2!9556 lt!323818) (_2!9556 lt!324518) (_2!9556 lt!324503)))))

(assert (=> b!207787 call!3276))

(declare-fun lt!324507 () Unit!14768)

(assert (=> b!207787 (= lt!324507 lt!324472)))

(assert (=> b!207787 (invariant!0 (currentBit!9605 (_2!9556 lt!323818)) (currentByte!9610 (_2!9556 lt!323818)) (size!4587 (buf!5092 (_2!9556 lt!324518))))))

(declare-fun lt!324485 () BitStream!8282)

(assert (=> b!207787 (= lt!324485 (BitStream!8283 (buf!5092 (_2!9556 lt!324518)) (currentByte!9610 (_2!9556 lt!323818)) (currentBit!9605 (_2!9556 lt!323818))))))

(assert (=> b!207787 (invariant!0 (currentBit!9605 lt!324485) (currentByte!9610 lt!324485) (size!4587 (buf!5092 (_2!9556 lt!324503))))))

(declare-fun lt!324515 () BitStream!8282)

(assert (=> b!207787 (= lt!324515 (BitStream!8283 (buf!5092 (_2!9556 lt!324503)) (currentByte!9610 lt!324485) (currentBit!9605 lt!324485)))))

(assert (=> b!207787 (= lt!324508 (readBitPure!0 lt!324485))))

(assert (=> b!207787 (= lt!324519 (readBitPure!0 lt!324515))))

(declare-fun lt!324482 () Unit!14768)

(assert (=> b!207787 (= lt!324482 (readBitPrefixLemma!0 lt!324485 (_2!9556 lt!324503)))))

(declare-fun res!174333 () Bool)

(assert (=> b!207787 (= res!174333 (= (bitIndex!0 (size!4587 (buf!5092 (_1!9557 lt!324508))) (currentByte!9610 (_1!9557 lt!324508)) (currentBit!9605 (_1!9557 lt!324508))) (bitIndex!0 (size!4587 (buf!5092 (_1!9557 lt!324519))) (currentByte!9610 (_1!9557 lt!324519)) (currentBit!9605 (_1!9557 lt!324519)))))))

(assert (=> b!207787 (=> (not res!174333) (not e!141997))))

(assert (=> b!207787 e!141997))

(declare-fun lt!324512 () Unit!14768)

(assert (=> b!207787 (= lt!324512 lt!324482)))

(declare-fun lt!324475 () tuple2!17808)

(assert (=> b!207787 (= lt!324475 (reader!0 (_2!9556 lt!323818) (_2!9556 lt!324503)))))

(declare-fun lt!324496 () tuple2!17808)

(assert (=> b!207787 (= lt!324496 (reader!0 (_2!9556 lt!324518) (_2!9556 lt!324503)))))

(declare-fun lt!324477 () tuple2!17804)

(assert (=> b!207787 (= lt!324477 (readBitPure!0 (_1!9559 lt!324475)))))

(assert (=> b!207787 (= (_2!9557 lt!324477) lt!324516)))

(declare-fun lt!324494 () Unit!14768)

(declare-fun Unit!14784 () Unit!14768)

(assert (=> b!207787 (= lt!324494 Unit!14784)))

(declare-fun lt!324499 () (_ BitVec 64))

(assert (=> b!207787 (= lt!324499 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!324497 () (_ BitVec 64))

(assert (=> b!207787 (= lt!324497 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!324513 () Unit!14768)

(assert (=> b!207787 (= lt!324513 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9556 lt!323818) (buf!5092 (_2!9556 lt!324503)) lt!324497))))

(assert (=> b!207787 (validate_offset_bits!1 ((_ sign_extend 32) (size!4587 (buf!5092 (_2!9556 lt!324503)))) ((_ sign_extend 32) (currentByte!9610 (_2!9556 lt!323818))) ((_ sign_extend 32) (currentBit!9605 (_2!9556 lt!323818))) lt!324497)))

(declare-fun lt!324505 () Unit!14768)

(assert (=> b!207787 (= lt!324505 lt!324513)))

(declare-fun lt!324492 () tuple2!17806)

(assert (=> b!207787 (= lt!324492 (readNBitsLSBFirstsLoopPure!0 (_1!9559 lt!324475) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!324499))))

(declare-fun lt!324504 () (_ BitVec 64))

(assert (=> b!207787 (= lt!324504 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!324480 () Unit!14768)

(assert (=> b!207787 (= lt!324480 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9556 lt!324518) (buf!5092 (_2!9556 lt!324503)) lt!324504))))

(assert (=> b!207787 (validate_offset_bits!1 ((_ sign_extend 32) (size!4587 (buf!5092 (_2!9556 lt!324503)))) ((_ sign_extend 32) (currentByte!9610 (_2!9556 lt!324518))) ((_ sign_extend 32) (currentBit!9605 (_2!9556 lt!324518))) lt!324504)))

(declare-fun lt!324473 () Unit!14768)

(assert (=> b!207787 (= lt!324473 lt!324480)))

(declare-fun lt!324520 () tuple2!17806)

(assert (=> b!207787 (= lt!324520 (readNBitsLSBFirstsLoopPure!0 (_1!9559 lt!324496) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!324499 (ite (_2!9557 lt!324477) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!324509 () tuple2!17806)

(assert (=> b!207787 (= lt!324509 (readNBitsLSBFirstsLoopPure!0 (_1!9559 lt!324475) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!324499))))

(declare-fun c!10227 () Bool)

(assert (=> b!207787 (= c!10227 (_2!9557 (readBitPure!0 (_1!9559 lt!324475))))))

(declare-fun lt!324474 () tuple2!17806)

(declare-fun withMovedBitIndex!0 (BitStream!8282 (_ BitVec 64)) BitStream!8282)

(assert (=> b!207787 (= lt!324474 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9559 lt!324475) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!324499 e!141991)))))

(declare-fun lt!324502 () Unit!14768)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8282 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14768)

(assert (=> b!207787 (= lt!324502 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9559 lt!324475) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!324499))))

(assert (=> b!207787 (and (= (_2!9558 lt!324509) (_2!9558 lt!324474)) (= (_1!9558 lt!324509) (_1!9558 lt!324474)))))

(declare-fun lt!324470 () Unit!14768)

(assert (=> b!207787 (= lt!324470 lt!324502)))

(assert (=> b!207787 (= (_1!9559 lt!324475) (withMovedBitIndex!0 (_2!9559 lt!324475) (bvsub (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!323818))) (currentByte!9610 (_2!9556 lt!323818)) (currentBit!9605 (_2!9556 lt!323818))) (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!324503))) (currentByte!9610 (_2!9556 lt!324503)) (currentBit!9605 (_2!9556 lt!324503))))))))

(declare-fun lt!324525 () Unit!14768)

(declare-fun Unit!14785 () Unit!14768)

(assert (=> b!207787 (= lt!324525 Unit!14785)))

(assert (=> b!207787 (= (_1!9559 lt!324496) (withMovedBitIndex!0 (_2!9559 lt!324496) (bvsub (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!324518))) (currentByte!9610 (_2!9556 lt!324518)) (currentBit!9605 (_2!9556 lt!324518))) (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!324503))) (currentByte!9610 (_2!9556 lt!324503)) (currentBit!9605 (_2!9556 lt!324503))))))))

(declare-fun lt!324490 () Unit!14768)

(declare-fun Unit!14786 () Unit!14768)

(assert (=> b!207787 (= lt!324490 Unit!14786)))

(assert (=> b!207787 (= (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!323818))) (currentByte!9610 (_2!9556 lt!323818)) (currentBit!9605 (_2!9556 lt!323818))) (bvsub (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!324518))) (currentByte!9610 (_2!9556 lt!324518)) (currentBit!9605 (_2!9556 lt!324518))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!324517 () Unit!14768)

(declare-fun Unit!14787 () Unit!14768)

(assert (=> b!207787 (= lt!324517 Unit!14787)))

(assert (=> b!207787 (= (_2!9558 lt!324492) (_2!9558 lt!324520))))

(declare-fun lt!324481 () Unit!14768)

(declare-fun Unit!14788 () Unit!14768)

(assert (=> b!207787 (= lt!324481 Unit!14788)))

(assert (=> b!207787 (invariant!0 (currentBit!9605 (_2!9556 lt!324503)) (currentByte!9610 (_2!9556 lt!324503)) (size!4587 (buf!5092 (_2!9556 lt!324503))))))

(declare-fun lt!324514 () Unit!14768)

(declare-fun Unit!14789 () Unit!14768)

(assert (=> b!207787 (= lt!324514 Unit!14789)))

(assert (=> b!207787 (= (size!4587 (buf!5092 (_2!9556 lt!323818))) (size!4587 (buf!5092 (_2!9556 lt!324503))))))

(declare-fun lt!324506 () Unit!14768)

(declare-fun Unit!14790 () Unit!14768)

(assert (=> b!207787 (= lt!324506 Unit!14790)))

(assert (=> b!207787 (= (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!324503))) (currentByte!9610 (_2!9556 lt!324503)) (currentBit!9605 (_2!9556 lt!324503))) (bvsub (bvadd (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!323818))) (currentByte!9610 (_2!9556 lt!323818)) (currentBit!9605 (_2!9556 lt!323818))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!324488 () Unit!14768)

(declare-fun Unit!14791 () Unit!14768)

(assert (=> b!207787 (= lt!324488 Unit!14791)))

(declare-fun lt!324486 () Unit!14768)

(declare-fun Unit!14792 () Unit!14768)

(assert (=> b!207787 (= lt!324486 Unit!14792)))

(assert (=> b!207787 (= lt!324471 (reader!0 (_2!9556 lt!323818) (_2!9556 lt!324503)))))

(declare-fun lt!324489 () (_ BitVec 64))

(assert (=> b!207787 (= lt!324489 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!324522 () Unit!14768)

(assert (=> b!207787 (= lt!324522 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9556 lt!323818) (buf!5092 (_2!9556 lt!324503)) lt!324489))))

(assert (=> b!207787 (validate_offset_bits!1 ((_ sign_extend 32) (size!4587 (buf!5092 (_2!9556 lt!324503)))) ((_ sign_extend 32) (currentByte!9610 (_2!9556 lt!323818))) ((_ sign_extend 32) (currentBit!9605 (_2!9556 lt!323818))) lt!324489)))

(declare-fun lt!324483 () Unit!14768)

(assert (=> b!207787 (= lt!324483 lt!324522)))

(assert (=> b!207787 (= lt!324511 (readNBitsLSBFirstsLoopPure!0 (_1!9559 lt!324471) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!174334 () Bool)

(assert (=> b!207787 (= res!174334 (= (_2!9558 lt!324511) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!207787 (=> (not res!174334) (not e!141992))))

(assert (=> b!207787 e!141992))

(declare-fun lt!324521 () Unit!14768)

(declare-fun Unit!14793 () Unit!14768)

(assert (=> b!207787 (= lt!324521 Unit!14793)))

(declare-fun b!207788 () Bool)

(assert (=> b!207788 (= e!141991 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (= (and d!70213 c!10228) b!207774))

(assert (= (and d!70213 (not c!10228)) b!207787))

(assert (= (and b!207787 res!174337) b!207776))

(assert (= (and b!207776 res!174336) b!207784))

(assert (= (and b!207784 res!174332) b!207780))

(assert (= (and b!207780 res!174338) b!207782))

(assert (= (and b!207787 res!174333) b!207785))

(assert (= (and b!207787 c!10227) b!207788))

(assert (= (and b!207787 (not c!10227)) b!207773))

(assert (= (and b!207787 res!174334) b!207777))

(assert (= (or b!207774 b!207787) bm!3273))

(assert (= (and d!70213 res!174341) b!207775))

(assert (= (and b!207775 res!174340) b!207778))

(assert (= (and b!207778 res!174342) b!207779))

(assert (= (and b!207779 res!174335) b!207786))

(assert (= (and b!207786 res!174339) b!207781))

(assert (= (and b!207786 res!174331) b!207783))

(declare-fun m!319683 () Bool)

(assert (=> bm!3273 m!319683))

(declare-fun m!319685 () Bool)

(assert (=> b!207779 m!319685))

(declare-fun m!319687 () Bool)

(assert (=> b!207782 m!319687))

(declare-fun m!319689 () Bool)

(assert (=> b!207782 m!319689))

(declare-fun m!319691 () Bool)

(assert (=> b!207781 m!319691))

(declare-fun m!319693 () Bool)

(assert (=> b!207778 m!319693))

(assert (=> b!207778 m!319277))

(declare-fun m!319695 () Bool)

(assert (=> b!207774 m!319695))

(assert (=> b!207776 m!319689))

(assert (=> b!207776 m!319277))

(declare-fun m!319697 () Bool)

(assert (=> b!207786 m!319697))

(declare-fun m!319699 () Bool)

(assert (=> b!207786 m!319699))

(declare-fun m!319701 () Bool)

(assert (=> b!207786 m!319701))

(declare-fun m!319703 () Bool)

(assert (=> b!207786 m!319703))

(declare-fun m!319705 () Bool)

(assert (=> b!207786 m!319705))

(declare-fun m!319707 () Bool)

(assert (=> b!207786 m!319707))

(declare-fun m!319709 () Bool)

(assert (=> b!207780 m!319709))

(assert (=> b!207780 m!319709))

(declare-fun m!319711 () Bool)

(assert (=> b!207780 m!319711))

(declare-fun m!319713 () Bool)

(assert (=> b!207784 m!319713))

(declare-fun m!319715 () Bool)

(assert (=> d!70213 m!319715))

(declare-fun m!319717 () Bool)

(assert (=> b!207787 m!319717))

(declare-fun m!319719 () Bool)

(assert (=> b!207787 m!319719))

(declare-fun m!319721 () Bool)

(assert (=> b!207787 m!319721))

(declare-fun m!319723 () Bool)

(assert (=> b!207787 m!319723))

(declare-fun m!319725 () Bool)

(assert (=> b!207787 m!319725))

(declare-fun m!319727 () Bool)

(assert (=> b!207787 m!319727))

(declare-fun m!319729 () Bool)

(assert (=> b!207787 m!319729))

(declare-fun m!319731 () Bool)

(assert (=> b!207787 m!319731))

(assert (=> b!207787 m!319699))

(declare-fun m!319733 () Bool)

(assert (=> b!207787 m!319733))

(declare-fun m!319735 () Bool)

(assert (=> b!207787 m!319735))

(declare-fun m!319737 () Bool)

(assert (=> b!207787 m!319737))

(declare-fun m!319739 () Bool)

(assert (=> b!207787 m!319739))

(declare-fun m!319741 () Bool)

(assert (=> b!207787 m!319741))

(declare-fun m!319743 () Bool)

(assert (=> b!207787 m!319743))

(declare-fun m!319745 () Bool)

(assert (=> b!207787 m!319745))

(declare-fun m!319747 () Bool)

(assert (=> b!207787 m!319747))

(declare-fun m!319749 () Bool)

(assert (=> b!207787 m!319749))

(declare-fun m!319751 () Bool)

(assert (=> b!207787 m!319751))

(declare-fun m!319753 () Bool)

(assert (=> b!207787 m!319753))

(declare-fun m!319755 () Bool)

(assert (=> b!207787 m!319755))

(assert (=> b!207787 m!319277))

(declare-fun m!319757 () Bool)

(assert (=> b!207787 m!319757))

(declare-fun m!319759 () Bool)

(assert (=> b!207787 m!319759))

(declare-fun m!319761 () Bool)

(assert (=> b!207787 m!319761))

(assert (=> b!207787 m!319701))

(declare-fun m!319763 () Bool)

(assert (=> b!207787 m!319763))

(declare-fun m!319765 () Bool)

(assert (=> b!207787 m!319765))

(declare-fun m!319767 () Bool)

(assert (=> b!207787 m!319767))

(declare-fun m!319769 () Bool)

(assert (=> b!207787 m!319769))

(assert (=> b!207787 m!319753))

(declare-fun m!319771 () Bool)

(assert (=> b!207787 m!319771))

(declare-fun m!319773 () Bool)

(assert (=> b!207787 m!319773))

(declare-fun m!319775 () Bool)

(assert (=> b!207787 m!319775))

(assert (=> b!207526 d!70213))

(declare-fun d!70303 () Bool)

(declare-datatypes ((tuple2!17814 0))(
  ( (tuple2!17815 (_1!9562 Bool) (_2!9562 BitStream!8282)) )
))
(declare-fun lt!324528 () tuple2!17814)

(declare-fun readBit!0 (BitStream!8282) tuple2!17814)

(assert (=> d!70303 (= lt!324528 (readBit!0 (readerFrom!0 (_2!9556 lt!323818) (currentBit!9605 thiss!1204) (currentByte!9610 thiss!1204))))))

(assert (=> d!70303 (= (readBitPure!0 (readerFrom!0 (_2!9556 lt!323818) (currentBit!9605 thiss!1204) (currentByte!9610 thiss!1204))) (tuple2!17805 (_2!9562 lt!324528) (_1!9562 lt!324528)))))

(declare-fun bs!17283 () Bool)

(assert (= bs!17283 d!70303))

(assert (=> bs!17283 m!319291))

(declare-fun m!319777 () Bool)

(assert (=> bs!17283 m!319777))

(assert (=> b!207537 d!70303))

(declare-fun d!70305 () Bool)

(declare-fun e!142000 () Bool)

(assert (=> d!70305 e!142000))

(declare-fun res!174346 () Bool)

(assert (=> d!70305 (=> (not res!174346) (not e!142000))))

(assert (=> d!70305 (= res!174346 (invariant!0 (currentBit!9605 (_2!9556 lt!323818)) (currentByte!9610 (_2!9556 lt!323818)) (size!4587 (buf!5092 (_2!9556 lt!323818)))))))

(assert (=> d!70305 (= (readerFrom!0 (_2!9556 lt!323818) (currentBit!9605 thiss!1204) (currentByte!9610 thiss!1204)) (BitStream!8283 (buf!5092 (_2!9556 lt!323818)) (currentByte!9610 thiss!1204) (currentBit!9605 thiss!1204)))))

(declare-fun b!207791 () Bool)

(assert (=> b!207791 (= e!142000 (invariant!0 (currentBit!9605 thiss!1204) (currentByte!9610 thiss!1204) (size!4587 (buf!5092 (_2!9556 lt!323818)))))))

(assert (= (and d!70305 res!174346) b!207791))

(declare-fun m!319779 () Bool)

(assert (=> d!70305 m!319779))

(assert (=> b!207791 m!319311))

(assert (=> b!207537 d!70305))

(declare-fun d!70307 () Bool)

(assert (=> d!70307 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4587 (buf!5092 thiss!1204))) ((_ sign_extend 32) (currentByte!9610 thiss!1204)) ((_ sign_extend 32) (currentBit!9605 thiss!1204)) lt!323821) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4587 (buf!5092 thiss!1204))) ((_ sign_extend 32) (currentByte!9610 thiss!1204)) ((_ sign_extend 32) (currentBit!9605 thiss!1204))) lt!323821))))

(declare-fun bs!17284 () Bool)

(assert (= bs!17284 d!70307))

(declare-fun m!319781 () Bool)

(assert (=> bs!17284 m!319781))

(assert (=> b!207527 d!70307))

(declare-fun d!70309 () Bool)

(assert (=> d!70309 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9605 thiss!1204) (currentByte!9610 thiss!1204) (size!4587 (buf!5092 thiss!1204))))))

(declare-fun bs!17285 () Bool)

(assert (= bs!17285 d!70309))

(assert (=> bs!17285 m!319301))

(assert (=> start!43648 d!70309))

(declare-fun d!70311 () Bool)

(declare-fun e!142001 () Bool)

(assert (=> d!70311 e!142001))

(declare-fun res!174348 () Bool)

(assert (=> d!70311 (=> (not res!174348) (not e!142001))))

(declare-fun lt!324534 () (_ BitVec 64))

(declare-fun lt!324530 () (_ BitVec 64))

(declare-fun lt!324532 () (_ BitVec 64))

(assert (=> d!70311 (= res!174348 (= lt!324532 (bvsub lt!324534 lt!324530)))))

(assert (=> d!70311 (or (= (bvand lt!324534 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324530 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!324534 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!324534 lt!324530) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70311 (= lt!324530 (remainingBits!0 ((_ sign_extend 32) (size!4587 (buf!5092 (_1!9557 lt!323827)))) ((_ sign_extend 32) (currentByte!9610 (_1!9557 lt!323827))) ((_ sign_extend 32) (currentBit!9605 (_1!9557 lt!323827)))))))

(declare-fun lt!324529 () (_ BitVec 64))

(declare-fun lt!324533 () (_ BitVec 64))

(assert (=> d!70311 (= lt!324534 (bvmul lt!324529 lt!324533))))

(assert (=> d!70311 (or (= lt!324529 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!324533 (bvsdiv (bvmul lt!324529 lt!324533) lt!324529)))))

(assert (=> d!70311 (= lt!324533 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70311 (= lt!324529 ((_ sign_extend 32) (size!4587 (buf!5092 (_1!9557 lt!323827)))))))

(assert (=> d!70311 (= lt!324532 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9610 (_1!9557 lt!323827))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9605 (_1!9557 lt!323827)))))))

(assert (=> d!70311 (invariant!0 (currentBit!9605 (_1!9557 lt!323827)) (currentByte!9610 (_1!9557 lt!323827)) (size!4587 (buf!5092 (_1!9557 lt!323827))))))

(assert (=> d!70311 (= (bitIndex!0 (size!4587 (buf!5092 (_1!9557 lt!323827))) (currentByte!9610 (_1!9557 lt!323827)) (currentBit!9605 (_1!9557 lt!323827))) lt!324532)))

(declare-fun b!207792 () Bool)

(declare-fun res!174347 () Bool)

(assert (=> b!207792 (=> (not res!174347) (not e!142001))))

(assert (=> b!207792 (= res!174347 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!324532))))

(declare-fun b!207793 () Bool)

(declare-fun lt!324531 () (_ BitVec 64))

(assert (=> b!207793 (= e!142001 (bvsle lt!324532 (bvmul lt!324531 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!207793 (or (= lt!324531 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!324531 #b0000000000000000000000000000000000000000000000000000000000001000) lt!324531)))))

(assert (=> b!207793 (= lt!324531 ((_ sign_extend 32) (size!4587 (buf!5092 (_1!9557 lt!323827)))))))

(assert (= (and d!70311 res!174348) b!207792))

(assert (= (and b!207792 res!174347) b!207793))

(declare-fun m!319783 () Bool)

(assert (=> d!70311 m!319783))

(declare-fun m!319785 () Bool)

(assert (=> d!70311 m!319785))

(assert (=> b!207528 d!70311))

(declare-fun d!70313 () Bool)

(declare-fun e!142002 () Bool)

(assert (=> d!70313 e!142002))

(declare-fun res!174350 () Bool)

(assert (=> d!70313 (=> (not res!174350) (not e!142002))))

(declare-fun lt!324536 () (_ BitVec 64))

(declare-fun lt!324538 () (_ BitVec 64))

(declare-fun lt!324540 () (_ BitVec 64))

(assert (=> d!70313 (= res!174350 (= lt!324538 (bvsub lt!324540 lt!324536)))))

(assert (=> d!70313 (or (= (bvand lt!324540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324536 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!324540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!324540 lt!324536) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70313 (= lt!324536 (remainingBits!0 ((_ sign_extend 32) (size!4587 (buf!5092 (_2!9556 lt!323818)))) ((_ sign_extend 32) (currentByte!9610 (_2!9556 lt!323818))) ((_ sign_extend 32) (currentBit!9605 (_2!9556 lt!323818)))))))

(declare-fun lt!324535 () (_ BitVec 64))

(declare-fun lt!324539 () (_ BitVec 64))

(assert (=> d!70313 (= lt!324540 (bvmul lt!324535 lt!324539))))

(assert (=> d!70313 (or (= lt!324535 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!324539 (bvsdiv (bvmul lt!324535 lt!324539) lt!324535)))))

(assert (=> d!70313 (= lt!324539 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70313 (= lt!324535 ((_ sign_extend 32) (size!4587 (buf!5092 (_2!9556 lt!323818)))))))

(assert (=> d!70313 (= lt!324538 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9610 (_2!9556 lt!323818))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9605 (_2!9556 lt!323818)))))))

(assert (=> d!70313 (invariant!0 (currentBit!9605 (_2!9556 lt!323818)) (currentByte!9610 (_2!9556 lt!323818)) (size!4587 (buf!5092 (_2!9556 lt!323818))))))

(assert (=> d!70313 (= (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!323818))) (currentByte!9610 (_2!9556 lt!323818)) (currentBit!9605 (_2!9556 lt!323818))) lt!324538)))

(declare-fun b!207794 () Bool)

(declare-fun res!174349 () Bool)

(assert (=> b!207794 (=> (not res!174349) (not e!142002))))

(assert (=> b!207794 (= res!174349 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!324538))))

(declare-fun b!207795 () Bool)

(declare-fun lt!324537 () (_ BitVec 64))

(assert (=> b!207795 (= e!142002 (bvsle lt!324538 (bvmul lt!324537 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!207795 (or (= lt!324537 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!324537 #b0000000000000000000000000000000000000000000000000000000000001000) lt!324537)))))

(assert (=> b!207795 (= lt!324537 ((_ sign_extend 32) (size!4587 (buf!5092 (_2!9556 lt!323818)))))))

(assert (= (and d!70313 res!174350) b!207794))

(assert (= (and b!207794 res!174349) b!207795))

(declare-fun m!319787 () Bool)

(assert (=> d!70313 m!319787))

(assert (=> d!70313 m!319779))

(assert (=> b!207523 d!70313))

(declare-fun d!70315 () Bool)

(declare-fun e!142003 () Bool)

(assert (=> d!70315 e!142003))

(declare-fun res!174352 () Bool)

(assert (=> d!70315 (=> (not res!174352) (not e!142003))))

(declare-fun lt!324546 () (_ BitVec 64))

(declare-fun lt!324542 () (_ BitVec 64))

(declare-fun lt!324544 () (_ BitVec 64))

(assert (=> d!70315 (= res!174352 (= lt!324544 (bvsub lt!324546 lt!324542)))))

(assert (=> d!70315 (or (= (bvand lt!324546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324542 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!324546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!324546 lt!324542) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70315 (= lt!324542 (remainingBits!0 ((_ sign_extend 32) (size!4587 (buf!5092 thiss!1204))) ((_ sign_extend 32) (currentByte!9610 thiss!1204)) ((_ sign_extend 32) (currentBit!9605 thiss!1204))))))

(declare-fun lt!324541 () (_ BitVec 64))

(declare-fun lt!324545 () (_ BitVec 64))

(assert (=> d!70315 (= lt!324546 (bvmul lt!324541 lt!324545))))

(assert (=> d!70315 (or (= lt!324541 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!324545 (bvsdiv (bvmul lt!324541 lt!324545) lt!324541)))))

(assert (=> d!70315 (= lt!324545 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70315 (= lt!324541 ((_ sign_extend 32) (size!4587 (buf!5092 thiss!1204))))))

(assert (=> d!70315 (= lt!324544 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9610 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9605 thiss!1204))))))

(assert (=> d!70315 (invariant!0 (currentBit!9605 thiss!1204) (currentByte!9610 thiss!1204) (size!4587 (buf!5092 thiss!1204)))))

(assert (=> d!70315 (= (bitIndex!0 (size!4587 (buf!5092 thiss!1204)) (currentByte!9610 thiss!1204) (currentBit!9605 thiss!1204)) lt!324544)))

(declare-fun b!207796 () Bool)

(declare-fun res!174351 () Bool)

(assert (=> b!207796 (=> (not res!174351) (not e!142003))))

(assert (=> b!207796 (= res!174351 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!324544))))

(declare-fun b!207797 () Bool)

(declare-fun lt!324543 () (_ BitVec 64))

(assert (=> b!207797 (= e!142003 (bvsle lt!324544 (bvmul lt!324543 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!207797 (or (= lt!324543 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!324543 #b0000000000000000000000000000000000000000000000000000000000001000) lt!324543)))))

(assert (=> b!207797 (= lt!324543 ((_ sign_extend 32) (size!4587 (buf!5092 thiss!1204))))))

(assert (= (and d!70315 res!174352) b!207796))

(assert (= (and b!207796 res!174351) b!207797))

(assert (=> d!70315 m!319781))

(assert (=> d!70315 m!319301))

(assert (=> b!207523 d!70315))

(declare-fun d!70317 () Bool)

(assert (=> d!70317 (= (invariant!0 (currentBit!9605 (_2!9556 lt!323826)) (currentByte!9610 (_2!9556 lt!323826)) (size!4587 (buf!5092 (_2!9556 lt!323826)))) (and (bvsge (currentBit!9605 (_2!9556 lt!323826)) #b00000000000000000000000000000000) (bvslt (currentBit!9605 (_2!9556 lt!323826)) #b00000000000000000000000000001000) (bvsge (currentByte!9610 (_2!9556 lt!323826)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9610 (_2!9556 lt!323826)) (size!4587 (buf!5092 (_2!9556 lt!323826)))) (and (= (currentBit!9605 (_2!9556 lt!323826)) #b00000000000000000000000000000000) (= (currentByte!9610 (_2!9556 lt!323826)) (size!4587 (buf!5092 (_2!9556 lt!323826))))))))))

(assert (=> b!207534 d!70317))

(declare-fun d!70319 () Bool)

(declare-fun res!174355 () Bool)

(declare-fun e!142005 () Bool)

(assert (=> d!70319 (=> (not res!174355) (not e!142005))))

(assert (=> d!70319 (= res!174355 (= (size!4587 (buf!5092 thiss!1204)) (size!4587 (buf!5092 (_2!9556 lt!323818)))))))

(assert (=> d!70319 (= (isPrefixOf!0 thiss!1204 (_2!9556 lt!323818)) e!142005)))

(declare-fun b!207798 () Bool)

(declare-fun res!174354 () Bool)

(assert (=> b!207798 (=> (not res!174354) (not e!142005))))

(assert (=> b!207798 (= res!174354 (bvsle (bitIndex!0 (size!4587 (buf!5092 thiss!1204)) (currentByte!9610 thiss!1204) (currentBit!9605 thiss!1204)) (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!323818))) (currentByte!9610 (_2!9556 lt!323818)) (currentBit!9605 (_2!9556 lt!323818)))))))

(declare-fun b!207799 () Bool)

(declare-fun e!142004 () Bool)

(assert (=> b!207799 (= e!142005 e!142004)))

(declare-fun res!174353 () Bool)

(assert (=> b!207799 (=> res!174353 e!142004)))

(assert (=> b!207799 (= res!174353 (= (size!4587 (buf!5092 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!207800 () Bool)

(assert (=> b!207800 (= e!142004 (arrayBitRangesEq!0 (buf!5092 thiss!1204) (buf!5092 (_2!9556 lt!323818)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4587 (buf!5092 thiss!1204)) (currentByte!9610 thiss!1204) (currentBit!9605 thiss!1204))))))

(assert (= (and d!70319 res!174355) b!207798))

(assert (= (and b!207798 res!174354) b!207799))

(assert (= (and b!207799 (not res!174353)) b!207800))

(assert (=> b!207798 m!319279))

(assert (=> b!207798 m!319277))

(assert (=> b!207800 m!319279))

(assert (=> b!207800 m!319279))

(declare-fun m!319789 () Bool)

(assert (=> b!207800 m!319789))

(assert (=> b!207524 d!70319))

(declare-fun d!70321 () Bool)

(assert (=> d!70321 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4587 (buf!5092 (_2!9556 lt!323818)))) ((_ sign_extend 32) (currentByte!9610 (_2!9556 lt!323818))) ((_ sign_extend 32) (currentBit!9605 (_2!9556 lt!323818))) lt!323819) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4587 (buf!5092 (_2!9556 lt!323818)))) ((_ sign_extend 32) (currentByte!9610 (_2!9556 lt!323818))) ((_ sign_extend 32) (currentBit!9605 (_2!9556 lt!323818)))) lt!323819))))

(declare-fun bs!17286 () Bool)

(assert (= bs!17286 d!70321))

(assert (=> bs!17286 m!319787))

(assert (=> b!207535 d!70321))

(declare-fun d!70323 () Bool)

(assert (=> d!70323 (= (invariant!0 (currentBit!9605 thiss!1204) (currentByte!9610 thiss!1204) (size!4587 (buf!5092 (_2!9556 lt!323826)))) (and (bvsge (currentBit!9605 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9605 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9610 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9610 thiss!1204) (size!4587 (buf!5092 (_2!9556 lt!323826)))) (and (= (currentBit!9605 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9610 thiss!1204) (size!4587 (buf!5092 (_2!9556 lt!323826))))))))))

(assert (=> b!207525 d!70323))

(declare-datatypes ((tuple2!17818 0))(
  ( (tuple2!17819 (_1!9564 (_ BitVec 64)) (_2!9564 BitStream!8282)) )
))
(declare-fun lt!324549 () tuple2!17818)

(declare-fun d!70325 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8282 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17818)

(assert (=> d!70325 (= lt!324549 (readNBitsLSBFirstsLoop!0 (_1!9559 lt!323831) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(assert (=> d!70325 (= (readNBitsLSBFirstsLoopPure!0 (_1!9559 lt!323831) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))) (tuple2!17807 (_2!9564 lt!324549) (_1!9564 lt!324549)))))

(declare-fun bs!17287 () Bool)

(assert (= bs!17287 d!70325))

(declare-fun m!319791 () Bool)

(assert (=> bs!17287 m!319791))

(assert (=> b!207531 d!70325))

(declare-fun d!70327 () Bool)

(declare-fun e!142008 () Bool)

(assert (=> d!70327 e!142008))

(declare-fun res!174358 () Bool)

(assert (=> d!70327 (=> (not res!174358) (not e!142008))))

(declare-fun lt!324561 () tuple2!17804)

(declare-fun lt!324560 () tuple2!17804)

(assert (=> d!70327 (= res!174358 (= (bitIndex!0 (size!4587 (buf!5092 (_1!9557 lt!324561))) (currentByte!9610 (_1!9557 lt!324561)) (currentBit!9605 (_1!9557 lt!324561))) (bitIndex!0 (size!4587 (buf!5092 (_1!9557 lt!324560))) (currentByte!9610 (_1!9557 lt!324560)) (currentBit!9605 (_1!9557 lt!324560)))))))

(declare-fun lt!324558 () Unit!14768)

(declare-fun lt!324559 () BitStream!8282)

(declare-fun choose!50 (BitStream!8282 BitStream!8282 BitStream!8282 tuple2!17804 tuple2!17804 BitStream!8282 Bool tuple2!17804 tuple2!17804 BitStream!8282 Bool) Unit!14768)

(assert (=> d!70327 (= lt!324558 (choose!50 lt!323822 (_2!9556 lt!323826) lt!324559 lt!324561 (tuple2!17805 (_1!9557 lt!324561) (_2!9557 lt!324561)) (_1!9557 lt!324561) (_2!9557 lt!324561) lt!324560 (tuple2!17805 (_1!9557 lt!324560) (_2!9557 lt!324560)) (_1!9557 lt!324560) (_2!9557 lt!324560)))))

(assert (=> d!70327 (= lt!324560 (readBitPure!0 lt!324559))))

(assert (=> d!70327 (= lt!324561 (readBitPure!0 lt!323822))))

(assert (=> d!70327 (= lt!324559 (BitStream!8283 (buf!5092 (_2!9556 lt!323826)) (currentByte!9610 lt!323822) (currentBit!9605 lt!323822)))))

(assert (=> d!70327 (invariant!0 (currentBit!9605 lt!323822) (currentByte!9610 lt!323822) (size!4587 (buf!5092 (_2!9556 lt!323826))))))

(assert (=> d!70327 (= (readBitPrefixLemma!0 lt!323822 (_2!9556 lt!323826)) lt!324558)))

(declare-fun b!207803 () Bool)

(assert (=> b!207803 (= e!142008 (= (_2!9557 lt!324561) (_2!9557 lt!324560)))))

(assert (= (and d!70327 res!174358) b!207803))

(declare-fun m!319793 () Bool)

(assert (=> d!70327 m!319793))

(declare-fun m!319795 () Bool)

(assert (=> d!70327 m!319795))

(declare-fun m!319797 () Bool)

(assert (=> d!70327 m!319797))

(assert (=> d!70327 m!319303))

(declare-fun m!319799 () Bool)

(assert (=> d!70327 m!319799))

(declare-fun m!319801 () Bool)

(assert (=> d!70327 m!319801))

(assert (=> b!207531 d!70327))

(declare-fun d!70329 () Bool)

(assert (=> d!70329 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!207531 d!70329))

(declare-fun b!207814 () Bool)

(declare-fun e!142013 () Unit!14768)

(declare-fun lt!324603 () Unit!14768)

(assert (=> b!207814 (= e!142013 lt!324603)))

(declare-fun lt!324610 () (_ BitVec 64))

(assert (=> b!207814 (= lt!324610 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!324620 () (_ BitVec 64))

(assert (=> b!207814 (= lt!324620 (bitIndex!0 (size!4587 (buf!5092 thiss!1204)) (currentByte!9610 thiss!1204) (currentBit!9605 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10431 array!10431 (_ BitVec 64) (_ BitVec 64)) Unit!14768)

(assert (=> b!207814 (= lt!324603 (arrayBitRangesEqSymmetric!0 (buf!5092 thiss!1204) (buf!5092 (_2!9556 lt!323826)) lt!324610 lt!324620))))

(assert (=> b!207814 (arrayBitRangesEq!0 (buf!5092 (_2!9556 lt!323826)) (buf!5092 thiss!1204) lt!324610 lt!324620)))

(declare-fun b!207815 () Bool)

(declare-fun res!174366 () Bool)

(declare-fun e!142014 () Bool)

(assert (=> b!207815 (=> (not res!174366) (not e!142014))))

(declare-fun lt!324613 () tuple2!17808)

(assert (=> b!207815 (= res!174366 (isPrefixOf!0 (_1!9559 lt!324613) thiss!1204))))

(declare-fun d!70331 () Bool)

(assert (=> d!70331 e!142014))

(declare-fun res!174367 () Bool)

(assert (=> d!70331 (=> (not res!174367) (not e!142014))))

(assert (=> d!70331 (= res!174367 (isPrefixOf!0 (_1!9559 lt!324613) (_2!9559 lt!324613)))))

(declare-fun lt!324605 () BitStream!8282)

(assert (=> d!70331 (= lt!324613 (tuple2!17809 lt!324605 (_2!9556 lt!323826)))))

(declare-fun lt!324615 () Unit!14768)

(declare-fun lt!324607 () Unit!14768)

(assert (=> d!70331 (= lt!324615 lt!324607)))

(assert (=> d!70331 (isPrefixOf!0 lt!324605 (_2!9556 lt!323826))))

(assert (=> d!70331 (= lt!324607 (lemmaIsPrefixTransitive!0 lt!324605 (_2!9556 lt!323826) (_2!9556 lt!323826)))))

(declare-fun lt!324617 () Unit!14768)

(declare-fun lt!324602 () Unit!14768)

(assert (=> d!70331 (= lt!324617 lt!324602)))

(assert (=> d!70331 (isPrefixOf!0 lt!324605 (_2!9556 lt!323826))))

(assert (=> d!70331 (= lt!324602 (lemmaIsPrefixTransitive!0 lt!324605 thiss!1204 (_2!9556 lt!323826)))))

(declare-fun lt!324608 () Unit!14768)

(assert (=> d!70331 (= lt!324608 e!142013)))

(declare-fun c!10231 () Bool)

(assert (=> d!70331 (= c!10231 (not (= (size!4587 (buf!5092 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!324609 () Unit!14768)

(declare-fun lt!324606 () Unit!14768)

(assert (=> d!70331 (= lt!324609 lt!324606)))

(assert (=> d!70331 (isPrefixOf!0 (_2!9556 lt!323826) (_2!9556 lt!323826))))

(assert (=> d!70331 (= lt!324606 (lemmaIsPrefixRefl!0 (_2!9556 lt!323826)))))

(declare-fun lt!324611 () Unit!14768)

(declare-fun lt!324612 () Unit!14768)

(assert (=> d!70331 (= lt!324611 lt!324612)))

(assert (=> d!70331 (= lt!324612 (lemmaIsPrefixRefl!0 (_2!9556 lt!323826)))))

(declare-fun lt!324604 () Unit!14768)

(declare-fun lt!324618 () Unit!14768)

(assert (=> d!70331 (= lt!324604 lt!324618)))

(assert (=> d!70331 (isPrefixOf!0 lt!324605 lt!324605)))

(assert (=> d!70331 (= lt!324618 (lemmaIsPrefixRefl!0 lt!324605))))

(declare-fun lt!324614 () Unit!14768)

(declare-fun lt!324621 () Unit!14768)

(assert (=> d!70331 (= lt!324614 lt!324621)))

(assert (=> d!70331 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!70331 (= lt!324621 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!70331 (= lt!324605 (BitStream!8283 (buf!5092 (_2!9556 lt!323826)) (currentByte!9610 thiss!1204) (currentBit!9605 thiss!1204)))))

(assert (=> d!70331 (isPrefixOf!0 thiss!1204 (_2!9556 lt!323826))))

(assert (=> d!70331 (= (reader!0 thiss!1204 (_2!9556 lt!323826)) lt!324613)))

(declare-fun b!207816 () Bool)

(declare-fun Unit!14795 () Unit!14768)

(assert (=> b!207816 (= e!142013 Unit!14795)))

(declare-fun b!207817 () Bool)

(declare-fun res!174365 () Bool)

(assert (=> b!207817 (=> (not res!174365) (not e!142014))))

(assert (=> b!207817 (= res!174365 (isPrefixOf!0 (_2!9559 lt!324613) (_2!9556 lt!323826)))))

(declare-fun lt!324619 () (_ BitVec 64))

(declare-fun b!207818 () Bool)

(declare-fun lt!324616 () (_ BitVec 64))

(assert (=> b!207818 (= e!142014 (= (_1!9559 lt!324613) (withMovedBitIndex!0 (_2!9559 lt!324613) (bvsub lt!324616 lt!324619))))))

(assert (=> b!207818 (or (= (bvand lt!324616 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324619 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!324616 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!324616 lt!324619) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207818 (= lt!324619 (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!323826))) (currentByte!9610 (_2!9556 lt!323826)) (currentBit!9605 (_2!9556 lt!323826))))))

(assert (=> b!207818 (= lt!324616 (bitIndex!0 (size!4587 (buf!5092 thiss!1204)) (currentByte!9610 thiss!1204) (currentBit!9605 thiss!1204)))))

(assert (= (and d!70331 c!10231) b!207814))

(assert (= (and d!70331 (not c!10231)) b!207816))

(assert (= (and d!70331 res!174367) b!207815))

(assert (= (and b!207815 res!174366) b!207817))

(assert (= (and b!207817 res!174365) b!207818))

(declare-fun m!319803 () Bool)

(assert (=> b!207818 m!319803))

(assert (=> b!207818 m!319331))

(assert (=> b!207818 m!319279))

(declare-fun m!319805 () Bool)

(assert (=> b!207815 m!319805))

(declare-fun m!319807 () Bool)

(assert (=> d!70331 m!319807))

(declare-fun m!319809 () Bool)

(assert (=> d!70331 m!319809))

(declare-fun m!319811 () Bool)

(assert (=> d!70331 m!319811))

(declare-fun m!319813 () Bool)

(assert (=> d!70331 m!319813))

(declare-fun m!319815 () Bool)

(assert (=> d!70331 m!319815))

(declare-fun m!319817 () Bool)

(assert (=> d!70331 m!319817))

(declare-fun m!319819 () Bool)

(assert (=> d!70331 m!319819))

(assert (=> d!70331 m!319333))

(declare-fun m!319821 () Bool)

(assert (=> d!70331 m!319821))

(declare-fun m!319823 () Bool)

(assert (=> d!70331 m!319823))

(declare-fun m!319825 () Bool)

(assert (=> d!70331 m!319825))

(assert (=> b!207814 m!319279))

(declare-fun m!319827 () Bool)

(assert (=> b!207814 m!319827))

(declare-fun m!319829 () Bool)

(assert (=> b!207814 m!319829))

(declare-fun m!319831 () Bool)

(assert (=> b!207817 m!319831))

(assert (=> b!207531 d!70331))

(declare-fun d!70333 () Bool)

(assert (=> d!70333 (= (invariant!0 (currentBit!9605 thiss!1204) (currentByte!9610 thiss!1204) (size!4587 (buf!5092 (_2!9556 lt!323818)))) (and (bvsge (currentBit!9605 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9605 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9610 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9610 thiss!1204) (size!4587 (buf!5092 (_2!9556 lt!323818)))) (and (= (currentBit!9605 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9610 thiss!1204) (size!4587 (buf!5092 (_2!9556 lt!323818))))))))))

(assert (=> b!207531 d!70333))

(declare-fun d!70335 () Bool)

(declare-fun e!142015 () Bool)

(assert (=> d!70335 e!142015))

(declare-fun res!174369 () Bool)

(assert (=> d!70335 (=> (not res!174369) (not e!142015))))

(declare-fun lt!324623 () (_ BitVec 64))

(declare-fun lt!324627 () (_ BitVec 64))

(declare-fun lt!324625 () (_ BitVec 64))

(assert (=> d!70335 (= res!174369 (= lt!324625 (bvsub lt!324627 lt!324623)))))

(assert (=> d!70335 (or (= (bvand lt!324627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324623 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!324627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!324627 lt!324623) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70335 (= lt!324623 (remainingBits!0 ((_ sign_extend 32) (size!4587 (buf!5092 (_1!9557 lt!323834)))) ((_ sign_extend 32) (currentByte!9610 (_1!9557 lt!323834))) ((_ sign_extend 32) (currentBit!9605 (_1!9557 lt!323834)))))))

(declare-fun lt!324622 () (_ BitVec 64))

(declare-fun lt!324626 () (_ BitVec 64))

(assert (=> d!70335 (= lt!324627 (bvmul lt!324622 lt!324626))))

(assert (=> d!70335 (or (= lt!324622 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!324626 (bvsdiv (bvmul lt!324622 lt!324626) lt!324622)))))

(assert (=> d!70335 (= lt!324626 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70335 (= lt!324622 ((_ sign_extend 32) (size!4587 (buf!5092 (_1!9557 lt!323834)))))))

(assert (=> d!70335 (= lt!324625 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9610 (_1!9557 lt!323834))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9605 (_1!9557 lt!323834)))))))

(assert (=> d!70335 (invariant!0 (currentBit!9605 (_1!9557 lt!323834)) (currentByte!9610 (_1!9557 lt!323834)) (size!4587 (buf!5092 (_1!9557 lt!323834))))))

(assert (=> d!70335 (= (bitIndex!0 (size!4587 (buf!5092 (_1!9557 lt!323834))) (currentByte!9610 (_1!9557 lt!323834)) (currentBit!9605 (_1!9557 lt!323834))) lt!324625)))

(declare-fun b!207819 () Bool)

(declare-fun res!174368 () Bool)

(assert (=> b!207819 (=> (not res!174368) (not e!142015))))

(assert (=> b!207819 (= res!174368 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!324625))))

(declare-fun b!207820 () Bool)

(declare-fun lt!324624 () (_ BitVec 64))

(assert (=> b!207820 (= e!142015 (bvsle lt!324625 (bvmul lt!324624 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!207820 (or (= lt!324624 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!324624 #b0000000000000000000000000000000000000000000000000000000000001000) lt!324624)))))

(assert (=> b!207820 (= lt!324624 ((_ sign_extend 32) (size!4587 (buf!5092 (_1!9557 lt!323834)))))))

(assert (= (and d!70335 res!174369) b!207819))

(assert (= (and b!207819 res!174368) b!207820))

(declare-fun m!319833 () Bool)

(assert (=> d!70335 m!319833))

(declare-fun m!319835 () Bool)

(assert (=> d!70335 m!319835))

(assert (=> b!207531 d!70335))

(declare-fun d!70337 () Bool)

(declare-fun lt!324628 () tuple2!17814)

(assert (=> d!70337 (= lt!324628 (readBit!0 (_1!9559 lt!323831)))))

(assert (=> d!70337 (= (readBitPure!0 (_1!9559 lt!323831)) (tuple2!17805 (_2!9562 lt!324628) (_1!9562 lt!324628)))))

(declare-fun bs!17288 () Bool)

(assert (= bs!17288 d!70337))

(declare-fun m!319837 () Bool)

(assert (=> bs!17288 m!319837))

(assert (=> b!207531 d!70337))

(declare-fun d!70339 () Bool)

(declare-fun lt!324629 () tuple2!17814)

(assert (=> d!70339 (= lt!324629 (readBit!0 (BitStream!8283 (buf!5092 (_2!9556 lt!323826)) (currentByte!9610 thiss!1204) (currentBit!9605 thiss!1204))))))

(assert (=> d!70339 (= (readBitPure!0 (BitStream!8283 (buf!5092 (_2!9556 lt!323826)) (currentByte!9610 thiss!1204) (currentBit!9605 thiss!1204))) (tuple2!17805 (_2!9562 lt!324629) (_1!9562 lt!324629)))))

(declare-fun bs!17289 () Bool)

(assert (= bs!17289 d!70339))

(declare-fun m!319839 () Bool)

(assert (=> bs!17289 m!319839))

(assert (=> b!207531 d!70339))

(declare-fun d!70341 () Bool)

(assert (=> d!70341 (validate_offset_bits!1 ((_ sign_extend 32) (size!4587 (buf!5092 (_2!9556 lt!323826)))) ((_ sign_extend 32) (currentByte!9610 thiss!1204)) ((_ sign_extend 32) (currentBit!9605 thiss!1204)) lt!323821)))

(declare-fun lt!324632 () Unit!14768)

(declare-fun choose!9 (BitStream!8282 array!10431 (_ BitVec 64) BitStream!8282) Unit!14768)

(assert (=> d!70341 (= lt!324632 (choose!9 thiss!1204 (buf!5092 (_2!9556 lt!323826)) lt!323821 (BitStream!8283 (buf!5092 (_2!9556 lt!323826)) (currentByte!9610 thiss!1204) (currentBit!9605 thiss!1204))))))

(assert (=> d!70341 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5092 (_2!9556 lt!323826)) lt!323821) lt!324632)))

(declare-fun bs!17290 () Bool)

(assert (= bs!17290 d!70341))

(assert (=> bs!17290 m!319305))

(declare-fun m!319841 () Bool)

(assert (=> bs!17290 m!319841))

(assert (=> b!207531 d!70341))

(declare-fun b!207821 () Bool)

(declare-fun e!142016 () Unit!14768)

(declare-fun lt!324634 () Unit!14768)

(assert (=> b!207821 (= e!142016 lt!324634)))

(declare-fun lt!324641 () (_ BitVec 64))

(assert (=> b!207821 (= lt!324641 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!324651 () (_ BitVec 64))

(assert (=> b!207821 (= lt!324651 (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!323818))) (currentByte!9610 (_2!9556 lt!323818)) (currentBit!9605 (_2!9556 lt!323818))))))

(assert (=> b!207821 (= lt!324634 (arrayBitRangesEqSymmetric!0 (buf!5092 (_2!9556 lt!323818)) (buf!5092 (_2!9556 lt!323826)) lt!324641 lt!324651))))

(assert (=> b!207821 (arrayBitRangesEq!0 (buf!5092 (_2!9556 lt!323826)) (buf!5092 (_2!9556 lt!323818)) lt!324641 lt!324651)))

(declare-fun b!207822 () Bool)

(declare-fun res!174371 () Bool)

(declare-fun e!142017 () Bool)

(assert (=> b!207822 (=> (not res!174371) (not e!142017))))

(declare-fun lt!324644 () tuple2!17808)

(assert (=> b!207822 (= res!174371 (isPrefixOf!0 (_1!9559 lt!324644) (_2!9556 lt!323818)))))

(declare-fun d!70343 () Bool)

(assert (=> d!70343 e!142017))

(declare-fun res!174372 () Bool)

(assert (=> d!70343 (=> (not res!174372) (not e!142017))))

(assert (=> d!70343 (= res!174372 (isPrefixOf!0 (_1!9559 lt!324644) (_2!9559 lt!324644)))))

(declare-fun lt!324636 () BitStream!8282)

(assert (=> d!70343 (= lt!324644 (tuple2!17809 lt!324636 (_2!9556 lt!323826)))))

(declare-fun lt!324646 () Unit!14768)

(declare-fun lt!324638 () Unit!14768)

(assert (=> d!70343 (= lt!324646 lt!324638)))

(assert (=> d!70343 (isPrefixOf!0 lt!324636 (_2!9556 lt!323826))))

(assert (=> d!70343 (= lt!324638 (lemmaIsPrefixTransitive!0 lt!324636 (_2!9556 lt!323826) (_2!9556 lt!323826)))))

(declare-fun lt!324648 () Unit!14768)

(declare-fun lt!324633 () Unit!14768)

(assert (=> d!70343 (= lt!324648 lt!324633)))

(assert (=> d!70343 (isPrefixOf!0 lt!324636 (_2!9556 lt!323826))))

(assert (=> d!70343 (= lt!324633 (lemmaIsPrefixTransitive!0 lt!324636 (_2!9556 lt!323818) (_2!9556 lt!323826)))))

(declare-fun lt!324639 () Unit!14768)

(assert (=> d!70343 (= lt!324639 e!142016)))

(declare-fun c!10232 () Bool)

(assert (=> d!70343 (= c!10232 (not (= (size!4587 (buf!5092 (_2!9556 lt!323818))) #b00000000000000000000000000000000)))))

(declare-fun lt!324640 () Unit!14768)

(declare-fun lt!324637 () Unit!14768)

(assert (=> d!70343 (= lt!324640 lt!324637)))

(assert (=> d!70343 (isPrefixOf!0 (_2!9556 lt!323826) (_2!9556 lt!323826))))

(assert (=> d!70343 (= lt!324637 (lemmaIsPrefixRefl!0 (_2!9556 lt!323826)))))

(declare-fun lt!324642 () Unit!14768)

(declare-fun lt!324643 () Unit!14768)

(assert (=> d!70343 (= lt!324642 lt!324643)))

(assert (=> d!70343 (= lt!324643 (lemmaIsPrefixRefl!0 (_2!9556 lt!323826)))))

(declare-fun lt!324635 () Unit!14768)

(declare-fun lt!324649 () Unit!14768)

(assert (=> d!70343 (= lt!324635 lt!324649)))

(assert (=> d!70343 (isPrefixOf!0 lt!324636 lt!324636)))

(assert (=> d!70343 (= lt!324649 (lemmaIsPrefixRefl!0 lt!324636))))

(declare-fun lt!324645 () Unit!14768)

(declare-fun lt!324652 () Unit!14768)

(assert (=> d!70343 (= lt!324645 lt!324652)))

(assert (=> d!70343 (isPrefixOf!0 (_2!9556 lt!323818) (_2!9556 lt!323818))))

(assert (=> d!70343 (= lt!324652 (lemmaIsPrefixRefl!0 (_2!9556 lt!323818)))))

(assert (=> d!70343 (= lt!324636 (BitStream!8283 (buf!5092 (_2!9556 lt!323826)) (currentByte!9610 (_2!9556 lt!323818)) (currentBit!9605 (_2!9556 lt!323818))))))

(assert (=> d!70343 (isPrefixOf!0 (_2!9556 lt!323818) (_2!9556 lt!323826))))

(assert (=> d!70343 (= (reader!0 (_2!9556 lt!323818) (_2!9556 lt!323826)) lt!324644)))

(declare-fun b!207823 () Bool)

(declare-fun Unit!14797 () Unit!14768)

(assert (=> b!207823 (= e!142016 Unit!14797)))

(declare-fun b!207824 () Bool)

(declare-fun res!174370 () Bool)

(assert (=> b!207824 (=> (not res!174370) (not e!142017))))

(assert (=> b!207824 (= res!174370 (isPrefixOf!0 (_2!9559 lt!324644) (_2!9556 lt!323826)))))

(declare-fun lt!324647 () (_ BitVec 64))

(declare-fun b!207825 () Bool)

(declare-fun lt!324650 () (_ BitVec 64))

(assert (=> b!207825 (= e!142017 (= (_1!9559 lt!324644) (withMovedBitIndex!0 (_2!9559 lt!324644) (bvsub lt!324647 lt!324650))))))

(assert (=> b!207825 (or (= (bvand lt!324647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324650 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!324647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!324647 lt!324650) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207825 (= lt!324650 (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!323826))) (currentByte!9610 (_2!9556 lt!323826)) (currentBit!9605 (_2!9556 lt!323826))))))

(assert (=> b!207825 (= lt!324647 (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!323818))) (currentByte!9610 (_2!9556 lt!323818)) (currentBit!9605 (_2!9556 lt!323818))))))

(assert (= (and d!70343 c!10232) b!207821))

(assert (= (and d!70343 (not c!10232)) b!207823))

(assert (= (and d!70343 res!174372) b!207822))

(assert (= (and b!207822 res!174371) b!207824))

(assert (= (and b!207824 res!174370) b!207825))

(declare-fun m!319843 () Bool)

(assert (=> b!207825 m!319843))

(assert (=> b!207825 m!319331))

(assert (=> b!207825 m!319277))

(declare-fun m!319845 () Bool)

(assert (=> b!207822 m!319845))

(assert (=> d!70343 m!319807))

(declare-fun m!319847 () Bool)

(assert (=> d!70343 m!319847))

(declare-fun m!319849 () Bool)

(assert (=> d!70343 m!319849))

(declare-fun m!319851 () Bool)

(assert (=> d!70343 m!319851))

(assert (=> d!70343 m!319695))

(assert (=> d!70343 m!319817))

(declare-fun m!319853 () Bool)

(assert (=> d!70343 m!319853))

(assert (=> d!70343 m!319285))

(declare-fun m!319855 () Bool)

(assert (=> d!70343 m!319855))

(declare-fun m!319857 () Bool)

(assert (=> d!70343 m!319857))

(declare-fun m!319859 () Bool)

(assert (=> d!70343 m!319859))

(assert (=> b!207821 m!319277))

(declare-fun m!319861 () Bool)

(assert (=> b!207821 m!319861))

(declare-fun m!319863 () Bool)

(assert (=> b!207821 m!319863))

(declare-fun m!319865 () Bool)

(assert (=> b!207824 m!319865))

(assert (=> b!207531 d!70343))

(declare-fun d!70345 () Bool)

(declare-fun lt!324653 () tuple2!17814)

(assert (=> d!70345 (= lt!324653 (readBit!0 lt!323822))))

(assert (=> d!70345 (= (readBitPure!0 lt!323822) (tuple2!17805 (_2!9562 lt!324653) (_1!9562 lt!324653)))))

(declare-fun bs!17291 () Bool)

(assert (= bs!17291 d!70345))

(declare-fun m!319867 () Bool)

(assert (=> bs!17291 m!319867))

(assert (=> b!207531 d!70345))

(declare-fun d!70347 () Bool)

(assert (=> d!70347 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4587 (buf!5092 (_2!9556 lt!323826)))) ((_ sign_extend 32) (currentByte!9610 thiss!1204)) ((_ sign_extend 32) (currentBit!9605 thiss!1204)) lt!323821) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4587 (buf!5092 (_2!9556 lt!323826)))) ((_ sign_extend 32) (currentByte!9610 thiss!1204)) ((_ sign_extend 32) (currentBit!9605 thiss!1204))) lt!323821))))

(declare-fun bs!17292 () Bool)

(assert (= bs!17292 d!70347))

(declare-fun m!319869 () Bool)

(assert (=> bs!17292 m!319869))

(assert (=> b!207531 d!70347))

(declare-fun d!70349 () Bool)

(declare-fun e!142018 () Bool)

(assert (=> d!70349 e!142018))

(declare-fun res!174374 () Bool)

(assert (=> d!70349 (=> (not res!174374) (not e!142018))))

(declare-fun lt!324657 () (_ BitVec 64))

(declare-fun lt!324659 () (_ BitVec 64))

(declare-fun lt!324655 () (_ BitVec 64))

(assert (=> d!70349 (= res!174374 (= lt!324657 (bvsub lt!324659 lt!324655)))))

(assert (=> d!70349 (or (= (bvand lt!324659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324655 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!324659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!324659 lt!324655) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70349 (= lt!324655 (remainingBits!0 ((_ sign_extend 32) (size!4587 (buf!5092 (_1!9557 lt!323823)))) ((_ sign_extend 32) (currentByte!9610 (_1!9557 lt!323823))) ((_ sign_extend 32) (currentBit!9605 (_1!9557 lt!323823)))))))

(declare-fun lt!324654 () (_ BitVec 64))

(declare-fun lt!324658 () (_ BitVec 64))

(assert (=> d!70349 (= lt!324659 (bvmul lt!324654 lt!324658))))

(assert (=> d!70349 (or (= lt!324654 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!324658 (bvsdiv (bvmul lt!324654 lt!324658) lt!324654)))))

(assert (=> d!70349 (= lt!324658 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70349 (= lt!324654 ((_ sign_extend 32) (size!4587 (buf!5092 (_1!9557 lt!323823)))))))

(assert (=> d!70349 (= lt!324657 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9610 (_1!9557 lt!323823))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9605 (_1!9557 lt!323823)))))))

(assert (=> d!70349 (invariant!0 (currentBit!9605 (_1!9557 lt!323823)) (currentByte!9610 (_1!9557 lt!323823)) (size!4587 (buf!5092 (_1!9557 lt!323823))))))

(assert (=> d!70349 (= (bitIndex!0 (size!4587 (buf!5092 (_1!9557 lt!323823))) (currentByte!9610 (_1!9557 lt!323823)) (currentBit!9605 (_1!9557 lt!323823))) lt!324657)))

(declare-fun b!207826 () Bool)

(declare-fun res!174373 () Bool)

(assert (=> b!207826 (=> (not res!174373) (not e!142018))))

(assert (=> b!207826 (= res!174373 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!324657))))

(declare-fun b!207827 () Bool)

(declare-fun lt!324656 () (_ BitVec 64))

(assert (=> b!207827 (= e!142018 (bvsle lt!324657 (bvmul lt!324656 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!207827 (or (= lt!324656 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!324656 #b0000000000000000000000000000000000000000000000000000000000001000) lt!324656)))))

(assert (=> b!207827 (= lt!324656 ((_ sign_extend 32) (size!4587 (buf!5092 (_1!9557 lt!323823)))))))

(assert (= (and d!70349 res!174374) b!207826))

(assert (= (and b!207826 res!174373) b!207827))

(declare-fun m!319871 () Bool)

(assert (=> d!70349 m!319871))

(declare-fun m!319873 () Bool)

(assert (=> d!70349 m!319873))

(assert (=> b!207531 d!70349))

(assert (=> b!207521 d!70319))

(declare-fun d!70351 () Bool)

(assert (=> d!70351 (= (array_inv!4328 (buf!5092 thiss!1204)) (bvsge (size!4587 (buf!5092 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!207532 d!70351))

(assert (=> b!207529 d!70313))

(assert (=> b!207529 d!70315))

(declare-fun d!70353 () Bool)

(declare-fun e!142024 () Bool)

(assert (=> d!70353 e!142024))

(declare-fun res!174385 () Bool)

(assert (=> d!70353 (=> (not res!174385) (not e!142024))))

(declare-fun lt!324668 () tuple2!17802)

(assert (=> d!70353 (= res!174385 (= (size!4587 (buf!5092 thiss!1204)) (size!4587 (buf!5092 (_2!9556 lt!324668)))))))

(declare-fun choose!16 (BitStream!8282 Bool) tuple2!17802)

(assert (=> d!70353 (= lt!324668 (choose!16 thiss!1204 lt!323833))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!70353 (validate_offset_bit!0 ((_ sign_extend 32) (size!4587 (buf!5092 thiss!1204))) ((_ sign_extend 32) (currentByte!9610 thiss!1204)) ((_ sign_extend 32) (currentBit!9605 thiss!1204)))))

(assert (=> d!70353 (= (appendBit!0 thiss!1204 lt!323833) lt!324668)))

(declare-fun b!207840 () Bool)

(declare-fun e!142023 () Bool)

(declare-fun lt!324671 () tuple2!17804)

(assert (=> b!207840 (= e!142023 (= (bitIndex!0 (size!4587 (buf!5092 (_1!9557 lt!324671))) (currentByte!9610 (_1!9557 lt!324671)) (currentBit!9605 (_1!9557 lt!324671))) (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!324668))) (currentByte!9610 (_2!9556 lt!324668)) (currentBit!9605 (_2!9556 lt!324668)))))))

(declare-fun b!207838 () Bool)

(declare-fun res!174384 () Bool)

(assert (=> b!207838 (=> (not res!174384) (not e!142024))))

(assert (=> b!207838 (= res!174384 (isPrefixOf!0 thiss!1204 (_2!9556 lt!324668)))))

(declare-fun b!207839 () Bool)

(assert (=> b!207839 (= e!142024 e!142023)))

(declare-fun res!174383 () Bool)

(assert (=> b!207839 (=> (not res!174383) (not e!142023))))

(assert (=> b!207839 (= res!174383 (and (= (_2!9557 lt!324671) lt!323833) (= (_1!9557 lt!324671) (_2!9556 lt!324668))))))

(assert (=> b!207839 (= lt!324671 (readBitPure!0 (readerFrom!0 (_2!9556 lt!324668) (currentBit!9605 thiss!1204) (currentByte!9610 thiss!1204))))))

(declare-fun b!207837 () Bool)

(declare-fun res!174386 () Bool)

(assert (=> b!207837 (=> (not res!174386) (not e!142024))))

(declare-fun lt!324669 () (_ BitVec 64))

(declare-fun lt!324670 () (_ BitVec 64))

(assert (=> b!207837 (= res!174386 (= (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!324668))) (currentByte!9610 (_2!9556 lt!324668)) (currentBit!9605 (_2!9556 lt!324668))) (bvadd lt!324670 lt!324669)))))

(assert (=> b!207837 (or (not (= (bvand lt!324670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!324669 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!324670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!324670 lt!324669) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!207837 (= lt!324669 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!207837 (= lt!324670 (bitIndex!0 (size!4587 (buf!5092 thiss!1204)) (currentByte!9610 thiss!1204) (currentBit!9605 thiss!1204)))))

(assert (= (and d!70353 res!174385) b!207837))

(assert (= (and b!207837 res!174386) b!207838))

(assert (= (and b!207838 res!174384) b!207839))

(assert (= (and b!207839 res!174383) b!207840))

(declare-fun m!319875 () Bool)

(assert (=> d!70353 m!319875))

(declare-fun m!319877 () Bool)

(assert (=> d!70353 m!319877))

(declare-fun m!319879 () Bool)

(assert (=> b!207838 m!319879))

(declare-fun m!319881 () Bool)

(assert (=> b!207840 m!319881))

(declare-fun m!319883 () Bool)

(assert (=> b!207840 m!319883))

(assert (=> b!207837 m!319883))

(assert (=> b!207837 m!319279))

(declare-fun m!319885 () Bool)

(assert (=> b!207839 m!319885))

(assert (=> b!207839 m!319885))

(declare-fun m!319887 () Bool)

(assert (=> b!207839 m!319887))

(assert (=> b!207529 d!70353))

(declare-fun d!70355 () Bool)

(assert (=> d!70355 (= (invariant!0 (currentBit!9605 thiss!1204) (currentByte!9610 thiss!1204) (size!4587 (buf!5092 thiss!1204))) (and (bvsge (currentBit!9605 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9605 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9610 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9610 thiss!1204) (size!4587 (buf!5092 thiss!1204))) (and (= (currentBit!9605 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9610 thiss!1204) (size!4587 (buf!5092 thiss!1204)))))))))

(assert (=> b!207530 d!70355))

(declare-fun d!70357 () Bool)

(declare-fun res!174389 () Bool)

(declare-fun e!142026 () Bool)

(assert (=> d!70357 (=> (not res!174389) (not e!142026))))

(assert (=> d!70357 (= res!174389 (= (size!4587 (buf!5092 (_2!9556 lt!323818))) (size!4587 (buf!5092 (_2!9556 lt!323826)))))))

(assert (=> d!70357 (= (isPrefixOf!0 (_2!9556 lt!323818) (_2!9556 lt!323826)) e!142026)))

(declare-fun b!207841 () Bool)

(declare-fun res!174388 () Bool)

(assert (=> b!207841 (=> (not res!174388) (not e!142026))))

(assert (=> b!207841 (= res!174388 (bvsle (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!323818))) (currentByte!9610 (_2!9556 lt!323818)) (currentBit!9605 (_2!9556 lt!323818))) (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!323826))) (currentByte!9610 (_2!9556 lt!323826)) (currentBit!9605 (_2!9556 lt!323826)))))))

(declare-fun b!207842 () Bool)

(declare-fun e!142025 () Bool)

(assert (=> b!207842 (= e!142026 e!142025)))

(declare-fun res!174387 () Bool)

(assert (=> b!207842 (=> res!174387 e!142025)))

(assert (=> b!207842 (= res!174387 (= (size!4587 (buf!5092 (_2!9556 lt!323818))) #b00000000000000000000000000000000))))

(declare-fun b!207843 () Bool)

(assert (=> b!207843 (= e!142025 (arrayBitRangesEq!0 (buf!5092 (_2!9556 lt!323818)) (buf!5092 (_2!9556 lt!323826)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4587 (buf!5092 (_2!9556 lt!323818))) (currentByte!9610 (_2!9556 lt!323818)) (currentBit!9605 (_2!9556 lt!323818)))))))

(assert (= (and d!70357 res!174389) b!207841))

(assert (= (and b!207841 res!174388) b!207842))

(assert (= (and b!207842 (not res!174387)) b!207843))

(assert (=> b!207841 m!319277))

(assert (=> b!207841 m!319331))

(assert (=> b!207843 m!319277))

(assert (=> b!207843 m!319277))

(declare-fun m!319889 () Bool)

(assert (=> b!207843 m!319889))

(assert (=> b!207520 d!70357))

(push 1)

(assert (not d!70311))

(assert (not b!207822))

(assert (not b!207825))

(assert (not b!207818))

(assert (not b!207824))

(assert (not d!70195))

(assert (not b!207839))

(assert (not b!207774))

(assert (not b!207821))

(assert (not d!70345))

(assert (not d!70349))

(assert (not b!207776))

(assert (not d!70353))

(assert (not b!207592))

(assert (not b!207814))

(assert (not b!207786))

(assert (not d!70303))

(assert (not b!207841))

(assert (not b!207779))

(assert (not d!70337))

(assert (not b!207798))

(assert (not b!207781))

(assert (not b!207837))

(assert (not d!70309))

(assert (not b!207782))

(assert (not b!207787))

(assert (not b!207778))

(assert (not d!70305))

(assert (not d!70307))

(assert (not b!207815))

(assert (not bm!3273))

(assert (not d!70327))

(assert (not b!207780))

(assert (not d!70213))

(assert (not b!207843))

(assert (not b!207791))

(assert (not d!70313))

(assert (not b!207784))

(assert (not d!70341))

(assert (not d!70339))

(assert (not b!207838))

(assert (not d!70347))

(assert (not d!70325))

(assert (not d!70315))

(assert (not d!70331))

(assert (not b!207817))

(assert (not d!70335))

(assert (not b!207840))

(assert (not b!207590))

(assert (not b!207800))

(assert (not d!70321))

(assert (not d!70211))

(assert (not d!70343))

(check-sat)

(pop 1)

(push 1)

(check-sat)

