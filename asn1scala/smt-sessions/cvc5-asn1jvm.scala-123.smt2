; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2978 () Bool)

(assert start!2978)

(declare-fun b!13690 () Bool)

(declare-fun e!8408 () Bool)

(declare-datatypes ((array!768 0))(
  ( (array!769 (arr!760 (Array (_ BitVec 32) (_ BitVec 8))) (size!331 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!622 0))(
  ( (BitStream!623 (buf!682 array!768) (currentByte!1799 (_ BitVec 32)) (currentBit!1794 (_ BitVec 32))) )
))
(declare-fun thiss!957 () BitStream!622)

(declare-datatypes ((Unit!1127 0))(
  ( (Unit!1128) )
))
(declare-datatypes ((tuple2!1616 0))(
  ( (tuple2!1617 (_1!863 Unit!1127) (_2!863 BitStream!622)) )
))
(declare-fun lt!21357 () tuple2!1616)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!13690 (= e!8408 (invariant!0 (currentBit!1794 thiss!957) (currentByte!1799 thiss!957) (size!331 (buf!682 (_2!863 lt!21357)))))))

(declare-fun b!13691 () Bool)

(declare-fun e!8407 () Bool)

(declare-fun array_inv!320 (array!768) Bool)

(assert (=> b!13691 (= e!8407 (array_inv!320 (buf!682 thiss!957)))))

(declare-fun b!13692 () Bool)

(declare-fun e!8405 () Bool)

(declare-datatypes ((tuple2!1618 0))(
  ( (tuple2!1619 (_1!864 BitStream!622) (_2!864 Bool)) )
))
(declare-fun lt!21358 () tuple2!1618)

(declare-fun lt!21359 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!13692 (= e!8405 (= (bitIndex!0 (size!331 (buf!682 (_1!864 lt!21358))) (currentByte!1799 (_1!864 lt!21358)) (currentBit!1794 (_1!864 lt!21358))) lt!21359))))

(declare-fun b!13693 () Bool)

(declare-fun e!8403 () Bool)

(declare-fun e!8406 () Bool)

(assert (=> b!13693 (= e!8403 e!8406)))

(declare-fun res!12991 () Bool)

(assert (=> b!13693 (=> (not res!12991) (not e!8406))))

(declare-fun lt!21356 () (_ BitVec 64))

(assert (=> b!13693 (= res!12991 (= lt!21359 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21356)))))

(assert (=> b!13693 (= lt!21359 (bitIndex!0 (size!331 (buf!682 (_2!863 lt!21357))) (currentByte!1799 (_2!863 lt!21357)) (currentBit!1794 (_2!863 lt!21357))))))

(assert (=> b!13693 (= lt!21356 (bitIndex!0 (size!331 (buf!682 thiss!957)) (currentByte!1799 thiss!957) (currentBit!1794 thiss!957)))))

(declare-fun b!13694 () Bool)

(assert (=> b!13694 (= e!8406 e!8405)))

(declare-fun res!12988 () Bool)

(assert (=> b!13694 (=> (not res!12988) (not e!8405))))

(assert (=> b!13694 (= res!12988 (and (not (_2!864 lt!21358)) (= (_1!864 lt!21358) (_2!863 lt!21357))))))

(declare-fun readBitPure!0 (BitStream!622) tuple2!1618)

(declare-fun readerFrom!0 (BitStream!622 (_ BitVec 32) (_ BitVec 32)) BitStream!622)

(assert (=> b!13694 (= lt!21358 (readBitPure!0 (readerFrom!0 (_2!863 lt!21357) (currentBit!1794 thiss!957) (currentByte!1799 thiss!957))))))

(declare-fun b!13695 () Bool)

(declare-fun res!12987 () Bool)

(assert (=> b!13695 (=> (not res!12987) (not e!8406))))

(declare-fun isPrefixOf!0 (BitStream!622 BitStream!622) Bool)

(assert (=> b!13695 (= res!12987 (isPrefixOf!0 thiss!957 (_2!863 lt!21357)))))

(declare-fun b!13696 () Bool)

(declare-fun res!12992 () Bool)

(assert (=> b!13696 (=> res!12992 e!8408)))

(assert (=> b!13696 (= res!12992 (not (isPrefixOf!0 thiss!957 (_2!863 lt!21357))))))

(declare-fun b!13697 () Bool)

(declare-fun res!12994 () Bool)

(assert (=> b!13697 (=> res!12994 e!8408)))

(assert (=> b!13697 (= res!12994 (not (invariant!0 (currentBit!1794 (_2!863 lt!21357)) (currentByte!1799 (_2!863 lt!21357)) (size!331 (buf!682 (_2!863 lt!21357))))))))

(declare-fun b!13698 () Bool)

(declare-fun res!12993 () Bool)

(assert (=> b!13698 (=> res!12993 e!8408)))

(assert (=> b!13698 (= res!12993 (not (= (bitIndex!0 (size!331 (buf!682 (_2!863 lt!21357))) (currentByte!1799 (_2!863 lt!21357)) (currentBit!1794 (_2!863 lt!21357))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!331 (buf!682 thiss!957)) (currentByte!1799 thiss!957) (currentBit!1794 thiss!957))))))))

(declare-fun res!12989 () Bool)

(declare-fun e!8404 () Bool)

(assert (=> start!2978 (=> (not res!12989) (not e!8404))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!2978 (= res!12989 (validate_offset_bit!0 ((_ sign_extend 32) (size!331 (buf!682 thiss!957))) ((_ sign_extend 32) (currentByte!1799 thiss!957)) ((_ sign_extend 32) (currentBit!1794 thiss!957))))))

(assert (=> start!2978 e!8404))

(declare-fun inv!12 (BitStream!622) Bool)

(assert (=> start!2978 (and (inv!12 thiss!957) e!8407)))

(declare-fun b!13689 () Bool)

(assert (=> b!13689 (= e!8404 (not e!8408))))

(declare-fun res!12986 () Bool)

(assert (=> b!13689 (=> res!12986 e!8408)))

(assert (=> b!13689 (= res!12986 (not (= (size!331 (buf!682 (_2!863 lt!21357))) (size!331 (buf!682 thiss!957)))))))

(assert (=> b!13689 e!8403))

(declare-fun res!12990 () Bool)

(assert (=> b!13689 (=> (not res!12990) (not e!8403))))

(assert (=> b!13689 (= res!12990 (= (size!331 (buf!682 thiss!957)) (size!331 (buf!682 (_2!863 lt!21357)))))))

(declare-fun appendBit!0 (BitStream!622 Bool) tuple2!1616)

(assert (=> b!13689 (= lt!21357 (appendBit!0 thiss!957 false))))

(assert (= (and start!2978 res!12989) b!13689))

(assert (= (and b!13689 res!12990) b!13693))

(assert (= (and b!13693 res!12991) b!13695))

(assert (= (and b!13695 res!12987) b!13694))

(assert (= (and b!13694 res!12988) b!13692))

(assert (= (and b!13689 (not res!12986)) b!13698))

(assert (= (and b!13698 (not res!12993)) b!13696))

(assert (= (and b!13696 (not res!12992)) b!13697))

(assert (= (and b!13697 (not res!12994)) b!13690))

(assert (= start!2978 b!13691))

(declare-fun m!20265 () Bool)

(assert (=> b!13698 m!20265))

(declare-fun m!20267 () Bool)

(assert (=> b!13698 m!20267))

(declare-fun m!20269 () Bool)

(assert (=> b!13689 m!20269))

(declare-fun m!20271 () Bool)

(assert (=> b!13691 m!20271))

(declare-fun m!20273 () Bool)

(assert (=> b!13694 m!20273))

(assert (=> b!13694 m!20273))

(declare-fun m!20275 () Bool)

(assert (=> b!13694 m!20275))

(declare-fun m!20277 () Bool)

(assert (=> b!13696 m!20277))

(declare-fun m!20279 () Bool)

(assert (=> b!13692 m!20279))

(declare-fun m!20281 () Bool)

(assert (=> b!13697 m!20281))

(assert (=> b!13693 m!20265))

(assert (=> b!13693 m!20267))

(declare-fun m!20283 () Bool)

(assert (=> b!13690 m!20283))

(assert (=> b!13695 m!20277))

(declare-fun m!20285 () Bool)

(assert (=> start!2978 m!20285))

(declare-fun m!20287 () Bool)

(assert (=> start!2978 m!20287))

(push 1)

(assert (not start!2978))

(assert (not b!13692))

(assert (not b!13691))

(assert (not b!13693))

(assert (not b!13696))

(assert (not b!13698))

(assert (not b!13690))

(assert (not b!13697))

(assert (not b!13695))

(assert (not b!13689))

(assert (not b!13694))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4434 () Bool)

(declare-fun e!8464 () Bool)

(assert (=> d!4434 e!8464))

(declare-fun res!13072 () Bool)

(assert (=> d!4434 (=> (not res!13072) (not e!8464))))

(declare-fun lt!21426 () (_ BitVec 64))

(declare-fun lt!21430 () (_ BitVec 64))

(declare-fun lt!21431 () (_ BitVec 64))

(assert (=> d!4434 (= res!13072 (= lt!21426 (bvsub lt!21430 lt!21431)))))

(assert (=> d!4434 (or (= (bvand lt!21430 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21431 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21430 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21430 lt!21431) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4434 (= lt!21431 (remainingBits!0 ((_ sign_extend 32) (size!331 (buf!682 (_2!863 lt!21357)))) ((_ sign_extend 32) (currentByte!1799 (_2!863 lt!21357))) ((_ sign_extend 32) (currentBit!1794 (_2!863 lt!21357)))))))

(declare-fun lt!21427 () (_ BitVec 64))

(declare-fun lt!21429 () (_ BitVec 64))

(assert (=> d!4434 (= lt!21430 (bvmul lt!21427 lt!21429))))

(assert (=> d!4434 (or (= lt!21427 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21429 (bvsdiv (bvmul lt!21427 lt!21429) lt!21427)))))

(assert (=> d!4434 (= lt!21429 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4434 (= lt!21427 ((_ sign_extend 32) (size!331 (buf!682 (_2!863 lt!21357)))))))

(assert (=> d!4434 (= lt!21426 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1799 (_2!863 lt!21357))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1794 (_2!863 lt!21357)))))))

(assert (=> d!4434 (invariant!0 (currentBit!1794 (_2!863 lt!21357)) (currentByte!1799 (_2!863 lt!21357)) (size!331 (buf!682 (_2!863 lt!21357))))))

(assert (=> d!4434 (= (bitIndex!0 (size!331 (buf!682 (_2!863 lt!21357))) (currentByte!1799 (_2!863 lt!21357)) (currentBit!1794 (_2!863 lt!21357))) lt!21426)))

(declare-fun b!13782 () Bool)

(declare-fun res!13073 () Bool)

(assert (=> b!13782 (=> (not res!13073) (not e!8464))))

(assert (=> b!13782 (= res!13073 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21426))))

(declare-fun b!13783 () Bool)

(declare-fun lt!21428 () (_ BitVec 64))

(assert (=> b!13783 (= e!8464 (bvsle lt!21426 (bvmul lt!21428 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13783 (or (= lt!21428 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21428 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21428)))))

(assert (=> b!13783 (= lt!21428 ((_ sign_extend 32) (size!331 (buf!682 (_2!863 lt!21357)))))))

(assert (= (and d!4434 res!13072) b!13782))

(assert (= (and b!13782 res!13073) b!13783))

(declare-fun m!20353 () Bool)

(assert (=> d!4434 m!20353))

(assert (=> d!4434 m!20281))

(assert (=> b!13698 d!4434))

(declare-fun d!4458 () Bool)

(declare-fun e!8469 () Bool)

(assert (=> d!4458 e!8469))

(declare-fun res!13080 () Bool)

(assert (=> d!4458 (=> (not res!13080) (not e!8469))))

(declare-fun lt!21432 () (_ BitVec 64))

(declare-fun lt!21437 () (_ BitVec 64))

(declare-fun lt!21436 () (_ BitVec 64))

(assert (=> d!4458 (= res!13080 (= lt!21432 (bvsub lt!21436 lt!21437)))))

(assert (=> d!4458 (or (= (bvand lt!21436 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21437 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21436 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21436 lt!21437) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4458 (= lt!21437 (remainingBits!0 ((_ sign_extend 32) (size!331 (buf!682 thiss!957))) ((_ sign_extend 32) (currentByte!1799 thiss!957)) ((_ sign_extend 32) (currentBit!1794 thiss!957))))))

(declare-fun lt!21433 () (_ BitVec 64))

(declare-fun lt!21435 () (_ BitVec 64))

(assert (=> d!4458 (= lt!21436 (bvmul lt!21433 lt!21435))))

(assert (=> d!4458 (or (= lt!21433 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21435 (bvsdiv (bvmul lt!21433 lt!21435) lt!21433)))))

(assert (=> d!4458 (= lt!21435 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4458 (= lt!21433 ((_ sign_extend 32) (size!331 (buf!682 thiss!957))))))

(assert (=> d!4458 (= lt!21432 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1799 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1794 thiss!957))))))

(assert (=> d!4458 (invariant!0 (currentBit!1794 thiss!957) (currentByte!1799 thiss!957) (size!331 (buf!682 thiss!957)))))

(assert (=> d!4458 (= (bitIndex!0 (size!331 (buf!682 thiss!957)) (currentByte!1799 thiss!957) (currentBit!1794 thiss!957)) lt!21432)))

(declare-fun b!13790 () Bool)

(declare-fun res!13081 () Bool)

(assert (=> b!13790 (=> (not res!13081) (not e!8469))))

(assert (=> b!13790 (= res!13081 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21432))))

(declare-fun b!13791 () Bool)

(declare-fun lt!21434 () (_ BitVec 64))

(assert (=> b!13791 (= e!8469 (bvsle lt!21432 (bvmul lt!21434 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13791 (or (= lt!21434 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21434 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21434)))))

(assert (=> b!13791 (= lt!21434 ((_ sign_extend 32) (size!331 (buf!682 thiss!957))))))

(assert (= (and d!4458 res!13080) b!13790))

(assert (= (and b!13790 res!13081) b!13791))

(declare-fun m!20355 () Bool)

(assert (=> d!4458 m!20355))

(declare-fun m!20357 () Bool)

(assert (=> d!4458 m!20357))

(assert (=> b!13698 d!4458))

(declare-fun d!4460 () Bool)

(assert (=> d!4460 (= (invariant!0 (currentBit!1794 (_2!863 lt!21357)) (currentByte!1799 (_2!863 lt!21357)) (size!331 (buf!682 (_2!863 lt!21357)))) (and (bvsge (currentBit!1794 (_2!863 lt!21357)) #b00000000000000000000000000000000) (bvslt (currentBit!1794 (_2!863 lt!21357)) #b00000000000000000000000000001000) (bvsge (currentByte!1799 (_2!863 lt!21357)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1799 (_2!863 lt!21357)) (size!331 (buf!682 (_2!863 lt!21357)))) (and (= (currentBit!1794 (_2!863 lt!21357)) #b00000000000000000000000000000000) (= (currentByte!1799 (_2!863 lt!21357)) (size!331 (buf!682 (_2!863 lt!21357))))))))))

(assert (=> b!13697 d!4460))

(declare-fun d!4464 () Bool)

(assert (=> d!4464 (= (invariant!0 (currentBit!1794 thiss!957) (currentByte!1799 thiss!957) (size!331 (buf!682 (_2!863 lt!21357)))) (and (bvsge (currentBit!1794 thiss!957) #b00000000000000000000000000000000) (bvslt (currentBit!1794 thiss!957) #b00000000000000000000000000001000) (bvsge (currentByte!1799 thiss!957) #b00000000000000000000000000000000) (or (bvslt (currentByte!1799 thiss!957) (size!331 (buf!682 (_2!863 lt!21357)))) (and (= (currentBit!1794 thiss!957) #b00000000000000000000000000000000) (= (currentByte!1799 thiss!957) (size!331 (buf!682 (_2!863 lt!21357))))))))))

(assert (=> b!13690 d!4464))

(declare-fun b!13830 () Bool)

(declare-fun res!13119 () Bool)

(declare-fun e!8490 () Bool)

(assert (=> b!13830 (=> (not res!13119) (not e!8490))))

(declare-fun lt!21492 () (_ BitVec 64))

(declare-fun lt!21494 () (_ BitVec 64))

(declare-fun lt!21491 () tuple2!1616)

(assert (=> b!13830 (= res!13119 (= (bitIndex!0 (size!331 (buf!682 (_2!863 lt!21491))) (currentByte!1799 (_2!863 lt!21491)) (currentBit!1794 (_2!863 lt!21491))) (bvadd lt!21494 lt!21492)))))

(assert (=> b!13830 (or (not (= (bvand lt!21494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21492 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!21494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!21494 lt!21492) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!13830 (= lt!21492 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!13830 (= lt!21494 (bitIndex!0 (size!331 (buf!682 thiss!957)) (currentByte!1799 thiss!957) (currentBit!1794 thiss!957)))))

(declare-fun b!13833 () Bool)

(declare-fun e!8491 () Bool)

(declare-fun lt!21493 () tuple2!1618)

(assert (=> b!13833 (= e!8491 (= (bitIndex!0 (size!331 (buf!682 (_1!864 lt!21493))) (currentByte!1799 (_1!864 lt!21493)) (currentBit!1794 (_1!864 lt!21493))) (bitIndex!0 (size!331 (buf!682 (_2!863 lt!21491))) (currentByte!1799 (_2!863 lt!21491)) (currentBit!1794 (_2!863 lt!21491)))))))

(declare-fun d!4466 () Bool)

(assert (=> d!4466 e!8490))

(declare-fun res!13120 () Bool)

(assert (=> d!4466 (=> (not res!13120) (not e!8490))))

(assert (=> d!4466 (= res!13120 (= (size!331 (buf!682 thiss!957)) (size!331 (buf!682 (_2!863 lt!21491)))))))

(declare-fun choose!16 (BitStream!622 Bool) tuple2!1616)

(assert (=> d!4466 (= lt!21491 (choose!16 thiss!957 false))))

(assert (=> d!4466 (validate_offset_bit!0 ((_ sign_extend 32) (size!331 (buf!682 thiss!957))) ((_ sign_extend 32) (currentByte!1799 thiss!957)) ((_ sign_extend 32) (currentBit!1794 thiss!957)))))

(assert (=> d!4466 (= (appendBit!0 thiss!957 false) lt!21491)))

(declare-fun b!13831 () Bool)

(declare-fun res!13121 () Bool)

(assert (=> b!13831 (=> (not res!13121) (not e!8490))))

(assert (=> b!13831 (= res!13121 (isPrefixOf!0 thiss!957 (_2!863 lt!21491)))))

(declare-fun b!13832 () Bool)

(assert (=> b!13832 (= e!8490 e!8491)))

(declare-fun res!13122 () Bool)

(assert (=> b!13832 (=> (not res!13122) (not e!8491))))

(assert (=> b!13832 (= res!13122 (and (= (_2!864 lt!21493) false) (= (_1!864 lt!21493) (_2!863 lt!21491))))))

(assert (=> b!13832 (= lt!21493 (readBitPure!0 (readerFrom!0 (_2!863 lt!21491) (currentBit!1794 thiss!957) (currentByte!1799 thiss!957))))))

(assert (= (and d!4466 res!13120) b!13830))

(assert (= (and b!13830 res!13119) b!13831))

(assert (= (and b!13831 res!13121) b!13832))

(assert (= (and b!13832 res!13122) b!13833))

(declare-fun m!20381 () Bool)

(assert (=> b!13833 m!20381))

(declare-fun m!20383 () Bool)

(assert (=> b!13833 m!20383))

(assert (=> b!13830 m!20383))

(assert (=> b!13830 m!20267))

(declare-fun m!20385 () Bool)

(assert (=> d!4466 m!20385))

(assert (=> d!4466 m!20285))

(declare-fun m!20387 () Bool)

(assert (=> b!13832 m!20387))

(assert (=> b!13832 m!20387))

(declare-fun m!20389 () Bool)

(assert (=> b!13832 m!20389))

(declare-fun m!20391 () Bool)

(assert (=> b!13831 m!20391))

(assert (=> b!13689 d!4466))

(declare-fun d!4482 () Bool)

(assert (=> d!4482 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!331 (buf!682 thiss!957))) ((_ sign_extend 32) (currentByte!1799 thiss!957)) ((_ sign_extend 32) (currentBit!1794 thiss!957))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!331 (buf!682 thiss!957))) ((_ sign_extend 32) (currentByte!1799 thiss!957)) ((_ sign_extend 32) (currentBit!1794 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1233 () Bool)

(assert (= bs!1233 d!4482))

(assert (=> bs!1233 m!20355))

(assert (=> start!2978 d!4482))

(declare-fun d!4484 () Bool)

(assert (=> d!4484 (= (inv!12 thiss!957) (invariant!0 (currentBit!1794 thiss!957) (currentByte!1799 thiss!957) (size!331 (buf!682 thiss!957))))))

(declare-fun bs!1235 () Bool)

(assert (= bs!1235 d!4484))

(assert (=> bs!1235 m!20357))

(assert (=> start!2978 d!4484))

(assert (=> b!13693 d!4434))

(assert (=> b!13693 d!4458))

(declare-fun d!4488 () Bool)

(declare-fun e!8492 () Bool)

(assert (=> d!4488 e!8492))

(declare-fun res!13123 () Bool)

(assert (=> d!4488 (=> (not res!13123) (not e!8492))))

(declare-fun lt!21498 () (_ BitVec 64))

(declare-fun lt!21503 () (_ BitVec 64))

(declare-fun lt!21502 () (_ BitVec 64))

(assert (=> d!4488 (= res!13123 (= lt!21498 (bvsub lt!21502 lt!21503)))))

(assert (=> d!4488 (or (= (bvand lt!21502 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21503 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21502 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21502 lt!21503) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4488 (= lt!21503 (remainingBits!0 ((_ sign_extend 32) (size!331 (buf!682 (_1!864 lt!21358)))) ((_ sign_extend 32) (currentByte!1799 (_1!864 lt!21358))) ((_ sign_extend 32) (currentBit!1794 (_1!864 lt!21358)))))))

(declare-fun lt!21499 () (_ BitVec 64))

(declare-fun lt!21501 () (_ BitVec 64))

(assert (=> d!4488 (= lt!21502 (bvmul lt!21499 lt!21501))))

(assert (=> d!4488 (or (= lt!21499 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21501 (bvsdiv (bvmul lt!21499 lt!21501) lt!21499)))))

(assert (=> d!4488 (= lt!21501 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4488 (= lt!21499 ((_ sign_extend 32) (size!331 (buf!682 (_1!864 lt!21358)))))))

(assert (=> d!4488 (= lt!21498 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1799 (_1!864 lt!21358))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1794 (_1!864 lt!21358)))))))

(assert (=> d!4488 (invariant!0 (currentBit!1794 (_1!864 lt!21358)) (currentByte!1799 (_1!864 lt!21358)) (size!331 (buf!682 (_1!864 lt!21358))))))

(assert (=> d!4488 (= (bitIndex!0 (size!331 (buf!682 (_1!864 lt!21358))) (currentByte!1799 (_1!864 lt!21358)) (currentBit!1794 (_1!864 lt!21358))) lt!21498)))

(declare-fun b!13834 () Bool)

(declare-fun res!13124 () Bool)

(assert (=> b!13834 (=> (not res!13124) (not e!8492))))

(assert (=> b!13834 (= res!13124 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21498))))

(declare-fun b!13835 () Bool)

(declare-fun lt!21500 () (_ BitVec 64))

(assert (=> b!13835 (= e!8492 (bvsle lt!21498 (bvmul lt!21500 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13835 (or (= lt!21500 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21500 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21500)))))

(assert (=> b!13835 (= lt!21500 ((_ sign_extend 32) (size!331 (buf!682 (_1!864 lt!21358)))))))

(assert (= (and d!4488 res!13123) b!13834))

(assert (= (and b!13834 res!13124) b!13835))

(declare-fun m!20395 () Bool)

(assert (=> d!4488 m!20395))

(declare-fun m!20397 () Bool)

(assert (=> d!4488 m!20397))

(assert (=> b!13692 d!4488))

(declare-fun d!4490 () Bool)

(assert (=> d!4490 (= (array_inv!320 (buf!682 thiss!957)) (bvsge (size!331 (buf!682 thiss!957)) #b00000000000000000000000000000000))))

(assert (=> b!13691 d!4490))

(declare-fun d!4492 () Bool)

(declare-fun res!13145 () Bool)

(declare-fun e!8504 () Bool)

(assert (=> d!4492 (=> (not res!13145) (not e!8504))))

(assert (=> d!4492 (= res!13145 (= (size!331 (buf!682 thiss!957)) (size!331 (buf!682 (_2!863 lt!21357)))))))

(assert (=> d!4492 (= (isPrefixOf!0 thiss!957 (_2!863 lt!21357)) e!8504)))

(declare-fun b!13854 () Bool)

(declare-fun res!13144 () Bool)

(assert (=> b!13854 (=> (not res!13144) (not e!8504))))

(assert (=> b!13854 (= res!13144 (bvsle (bitIndex!0 (size!331 (buf!682 thiss!957)) (currentByte!1799 thiss!957) (currentBit!1794 thiss!957)) (bitIndex!0 (size!331 (buf!682 (_2!863 lt!21357))) (currentByte!1799 (_2!863 lt!21357)) (currentBit!1794 (_2!863 lt!21357)))))))

(declare-fun b!13855 () Bool)

(declare-fun e!8505 () Bool)

(assert (=> b!13855 (= e!8504 e!8505)))

(declare-fun res!13143 () Bool)

(assert (=> b!13855 (=> res!13143 e!8505)))

(assert (=> b!13855 (= res!13143 (= (size!331 (buf!682 thiss!957)) #b00000000000000000000000000000000))))

(declare-fun b!13856 () Bool)

(declare-fun arrayBitRangesEq!0 (array!768 array!768 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!13856 (= e!8505 (arrayBitRangesEq!0 (buf!682 thiss!957) (buf!682 (_2!863 lt!21357)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!331 (buf!682 thiss!957)) (currentByte!1799 thiss!957) (currentBit!1794 thiss!957))))))

(assert (= (and d!4492 res!13145) b!13854))

(assert (= (and b!13854 res!13144) b!13855))

(assert (= (and b!13855 (not res!13143)) b!13856))

(assert (=> b!13854 m!20267))

(assert (=> b!13854 m!20265))

(assert (=> b!13856 m!20267))

(assert (=> b!13856 m!20267))

(declare-fun m!20399 () Bool)

(assert (=> b!13856 m!20399))

(assert (=> b!13696 d!4492))

(assert (=> b!13695 d!4492))

(declare-fun d!4496 () Bool)

(declare-datatypes ((tuple2!1630 0))(
  ( (tuple2!1631 (_1!870 Bool) (_2!870 BitStream!622)) )
))
(declare-fun lt!21518 () tuple2!1630)

(declare-fun readBit!0 (BitStream!622) tuple2!1630)

(assert (=> d!4496 (= lt!21518 (readBit!0 (readerFrom!0 (_2!863 lt!21357) (currentBit!1794 thiss!957) (currentByte!1799 thiss!957))))))

(assert (=> d!4496 (= (readBitPure!0 (readerFrom!0 (_2!863 lt!21357) (currentBit!1794 thiss!957) (currentByte!1799 thiss!957))) (tuple2!1619 (_2!870 lt!21518) (_1!870 lt!21518)))))

(declare-fun bs!1236 () Bool)

(assert (= bs!1236 d!4496))

(assert (=> bs!1236 m!20273))

(declare-fun m!20413 () Bool)

(assert (=> bs!1236 m!20413))

(assert (=> b!13694 d!4496))

(declare-fun d!4500 () Bool)

(declare-fun e!8510 () Bool)

(assert (=> d!4500 e!8510))

(declare-fun res!13153 () Bool)

(assert (=> d!4500 (=> (not res!13153) (not e!8510))))

(assert (=> d!4500 (= res!13153 (invariant!0 (currentBit!1794 (_2!863 lt!21357)) (currentByte!1799 (_2!863 lt!21357)) (size!331 (buf!682 (_2!863 lt!21357)))))))

(assert (=> d!4500 (= (readerFrom!0 (_2!863 lt!21357) (currentBit!1794 thiss!957) (currentByte!1799 thiss!957)) (BitStream!623 (buf!682 (_2!863 lt!21357)) (currentByte!1799 thiss!957) (currentBit!1794 thiss!957)))))

(declare-fun b!13863 () Bool)

(assert (=> b!13863 (= e!8510 (invariant!0 (currentBit!1794 thiss!957) (currentByte!1799 thiss!957) (size!331 (buf!682 (_2!863 lt!21357)))))))

(assert (= (and d!4500 res!13153) b!13863))

(assert (=> d!4500 m!20281))

(assert (=> b!13863 m!20283))

(assert (=> b!13694 d!4500))

(push 1)

(assert (not b!13831))

(assert (not b!13863))

(assert (not b!13833))

(assert (not d!4434))

(assert (not d!4484))

(assert (not d!4488))

(assert (not b!13832))

(assert (not d!4482))

(assert (not b!13830))

(assert (not b!13854))

(assert (not d!4500))

(assert (not d!4496))

(assert (not d!4458))

(assert (not d!4466))

(assert (not b!13856))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

