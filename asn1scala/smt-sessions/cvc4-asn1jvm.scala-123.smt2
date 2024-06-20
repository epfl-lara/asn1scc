; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2982 () Bool)

(assert start!2982)

(declare-fun b!13749 () Bool)

(declare-fun res!13043 () Bool)

(declare-fun e!8444 () Bool)

(assert (=> b!13749 (=> res!13043 e!8444)))

(declare-datatypes ((array!772 0))(
  ( (array!773 (arr!762 (Array (_ BitVec 32) (_ BitVec 8))) (size!333 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!626 0))(
  ( (BitStream!627 (buf!684 array!772) (currentByte!1801 (_ BitVec 32)) (currentBit!1796 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1131 0))(
  ( (Unit!1132) )
))
(declare-datatypes ((tuple2!1624 0))(
  ( (tuple2!1625 (_1!867 Unit!1131) (_2!867 BitStream!626)) )
))
(declare-fun lt!21383 () tuple2!1624)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!13749 (= res!13043 (not (invariant!0 (currentBit!1796 (_2!867 lt!21383)) (currentByte!1801 (_2!867 lt!21383)) (size!333 (buf!684 (_2!867 lt!21383))))))))

(declare-fun b!13750 () Bool)

(declare-fun res!13047 () Bool)

(declare-fun e!8449 () Bool)

(assert (=> b!13750 (=> (not res!13047) (not e!8449))))

(declare-fun thiss!957 () BitStream!626)

(declare-fun isPrefixOf!0 (BitStream!626 BitStream!626) Bool)

(assert (=> b!13750 (= res!13047 (isPrefixOf!0 thiss!957 (_2!867 lt!21383)))))

(declare-fun b!13751 () Bool)

(declare-fun e!8450 () Bool)

(declare-datatypes ((tuple2!1626 0))(
  ( (tuple2!1627 (_1!868 BitStream!626) (_2!868 Bool)) )
))
(declare-fun lt!21381 () tuple2!1626)

(declare-fun lt!21382 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!13751 (= e!8450 (= (bitIndex!0 (size!333 (buf!684 (_1!868 lt!21381))) (currentByte!1801 (_1!868 lt!21381)) (currentBit!1796 (_1!868 lt!21381))) lt!21382))))

(declare-fun b!13752 () Bool)

(declare-fun e!8446 () Bool)

(declare-fun array_inv!322 (array!772) Bool)

(assert (=> b!13752 (= e!8446 (array_inv!322 (buf!684 thiss!957)))))

(declare-fun res!13041 () Bool)

(declare-fun e!8448 () Bool)

(assert (=> start!2982 (=> (not res!13041) (not e!8448))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!2982 (= res!13041 (validate_offset_bit!0 ((_ sign_extend 32) (size!333 (buf!684 thiss!957))) ((_ sign_extend 32) (currentByte!1801 thiss!957)) ((_ sign_extend 32) (currentBit!1796 thiss!957))))))

(assert (=> start!2982 e!8448))

(declare-fun inv!12 (BitStream!626) Bool)

(assert (=> start!2982 (and (inv!12 thiss!957) e!8446)))

(declare-fun b!13753 () Bool)

(declare-fun res!13048 () Bool)

(assert (=> b!13753 (=> res!13048 e!8444)))

(assert (=> b!13753 (= res!13048 (not (isPrefixOf!0 thiss!957 (_2!867 lt!21383))))))

(declare-fun b!13754 () Bool)

(assert (=> b!13754 (= e!8444 (invariant!0 (currentBit!1796 thiss!957) (currentByte!1801 thiss!957) (size!333 (buf!684 (_2!867 lt!21383)))))))

(declare-fun b!13755 () Bool)

(assert (=> b!13755 (= e!8448 (not e!8444))))

(declare-fun res!13045 () Bool)

(assert (=> b!13755 (=> res!13045 e!8444)))

(assert (=> b!13755 (= res!13045 (not (= (size!333 (buf!684 (_2!867 lt!21383))) (size!333 (buf!684 thiss!957)))))))

(declare-fun e!8447 () Bool)

(assert (=> b!13755 e!8447))

(declare-fun res!13046 () Bool)

(assert (=> b!13755 (=> (not res!13046) (not e!8447))))

(assert (=> b!13755 (= res!13046 (= (size!333 (buf!684 thiss!957)) (size!333 (buf!684 (_2!867 lt!21383)))))))

(declare-fun appendBit!0 (BitStream!626 Bool) tuple2!1624)

(assert (=> b!13755 (= lt!21383 (appendBit!0 thiss!957 false))))

(declare-fun b!13756 () Bool)

(assert (=> b!13756 (= e!8449 e!8450)))

(declare-fun res!13042 () Bool)

(assert (=> b!13756 (=> (not res!13042) (not e!8450))))

(assert (=> b!13756 (= res!13042 (and (not (_2!868 lt!21381)) (= (_1!868 lt!21381) (_2!867 lt!21383))))))

(declare-fun readBitPure!0 (BitStream!626) tuple2!1626)

(declare-fun readerFrom!0 (BitStream!626 (_ BitVec 32) (_ BitVec 32)) BitStream!626)

(assert (=> b!13756 (= lt!21381 (readBitPure!0 (readerFrom!0 (_2!867 lt!21383) (currentBit!1796 thiss!957) (currentByte!1801 thiss!957))))))

(declare-fun b!13757 () Bool)

(declare-fun res!13040 () Bool)

(assert (=> b!13757 (=> res!13040 e!8444)))

(assert (=> b!13757 (= res!13040 (not (= (bitIndex!0 (size!333 (buf!684 (_2!867 lt!21383))) (currentByte!1801 (_2!867 lt!21383)) (currentBit!1796 (_2!867 lt!21383))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!333 (buf!684 thiss!957)) (currentByte!1801 thiss!957) (currentBit!1796 thiss!957))))))))

(declare-fun b!13758 () Bool)

(assert (=> b!13758 (= e!8447 e!8449)))

(declare-fun res!13044 () Bool)

(assert (=> b!13758 (=> (not res!13044) (not e!8449))))

(declare-fun lt!21380 () (_ BitVec 64))

(assert (=> b!13758 (= res!13044 (= lt!21382 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21380)))))

(assert (=> b!13758 (= lt!21382 (bitIndex!0 (size!333 (buf!684 (_2!867 lt!21383))) (currentByte!1801 (_2!867 lt!21383)) (currentBit!1796 (_2!867 lt!21383))))))

(assert (=> b!13758 (= lt!21380 (bitIndex!0 (size!333 (buf!684 thiss!957)) (currentByte!1801 thiss!957) (currentBit!1796 thiss!957)))))

(assert (= (and start!2982 res!13041) b!13755))

(assert (= (and b!13755 res!13046) b!13758))

(assert (= (and b!13758 res!13044) b!13750))

(assert (= (and b!13750 res!13047) b!13756))

(assert (= (and b!13756 res!13042) b!13751))

(assert (= (and b!13755 (not res!13045)) b!13757))

(assert (= (and b!13757 (not res!13040)) b!13753))

(assert (= (and b!13753 (not res!13048)) b!13749))

(assert (= (and b!13749 (not res!13043)) b!13754))

(assert (= start!2982 b!13752))

(declare-fun m!20313 () Bool)

(assert (=> b!13751 m!20313))

(declare-fun m!20315 () Bool)

(assert (=> b!13757 m!20315))

(declare-fun m!20317 () Bool)

(assert (=> b!13757 m!20317))

(assert (=> b!13758 m!20315))

(assert (=> b!13758 m!20317))

(declare-fun m!20319 () Bool)

(assert (=> start!2982 m!20319))

(declare-fun m!20321 () Bool)

(assert (=> start!2982 m!20321))

(declare-fun m!20323 () Bool)

(assert (=> b!13755 m!20323))

(declare-fun m!20325 () Bool)

(assert (=> b!13756 m!20325))

(assert (=> b!13756 m!20325))

(declare-fun m!20327 () Bool)

(assert (=> b!13756 m!20327))

(declare-fun m!20329 () Bool)

(assert (=> b!13752 m!20329))

(declare-fun m!20331 () Bool)

(assert (=> b!13753 m!20331))

(declare-fun m!20333 () Bool)

(assert (=> b!13749 m!20333))

(assert (=> b!13750 m!20331))

(declare-fun m!20335 () Bool)

(assert (=> b!13754 m!20335))

(push 1)

(assert (not b!13752))

(assert (not b!13755))

(assert (not b!13749))

(assert (not b!13751))

(assert (not b!13757))

(assert (not b!13753))

(assert (not b!13750))

(assert (not b!13754))

(assert (not b!13758))

(assert (not start!2982))

(assert (not b!13756))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4436 () Bool)

(declare-fun res!13061 () Bool)

(declare-fun e!8459 () Bool)

(assert (=> d!4436 (=> (not res!13061) (not e!8459))))

(assert (=> d!4436 (= res!13061 (= (size!333 (buf!684 thiss!957)) (size!333 (buf!684 (_2!867 lt!21383)))))))

(assert (=> d!4436 (= (isPrefixOf!0 thiss!957 (_2!867 lt!21383)) e!8459)))

(declare-fun b!13771 () Bool)

(declare-fun res!13062 () Bool)

(assert (=> b!13771 (=> (not res!13062) (not e!8459))))

(assert (=> b!13771 (= res!13062 (bvsle (bitIndex!0 (size!333 (buf!684 thiss!957)) (currentByte!1801 thiss!957) (currentBit!1796 thiss!957)) (bitIndex!0 (size!333 (buf!684 (_2!867 lt!21383))) (currentByte!1801 (_2!867 lt!21383)) (currentBit!1796 (_2!867 lt!21383)))))))

(declare-fun b!13772 () Bool)

(declare-fun e!8458 () Bool)

(assert (=> b!13772 (= e!8459 e!8458)))

(declare-fun res!13063 () Bool)

(assert (=> b!13772 (=> res!13063 e!8458)))

(assert (=> b!13772 (= res!13063 (= (size!333 (buf!684 thiss!957)) #b00000000000000000000000000000000))))

(declare-fun b!13773 () Bool)

(declare-fun arrayBitRangesEq!0 (array!772 array!772 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!13773 (= e!8458 (arrayBitRangesEq!0 (buf!684 thiss!957) (buf!684 (_2!867 lt!21383)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!333 (buf!684 thiss!957)) (currentByte!1801 thiss!957) (currentBit!1796 thiss!957))))))

(assert (= (and d!4436 res!13061) b!13771))

(assert (= (and b!13771 res!13062) b!13772))

(assert (= (and b!13772 (not res!13063)) b!13773))

(assert (=> b!13771 m!20317))

(assert (=> b!13771 m!20315))

(assert (=> b!13773 m!20317))

(assert (=> b!13773 m!20317))

(declare-fun m!20341 () Bool)

(assert (=> b!13773 m!20341))

(assert (=> b!13753 d!4436))

(declare-fun d!4440 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4440 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!333 (buf!684 thiss!957))) ((_ sign_extend 32) (currentByte!1801 thiss!957)) ((_ sign_extend 32) (currentBit!1796 thiss!957))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!333 (buf!684 thiss!957))) ((_ sign_extend 32) (currentByte!1801 thiss!957)) ((_ sign_extend 32) (currentBit!1796 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1228 () Bool)

(assert (= bs!1228 d!4440))

(declare-fun m!20349 () Bool)

(assert (=> bs!1228 m!20349))

(assert (=> start!2982 d!4440))

(declare-fun d!4446 () Bool)

(assert (=> d!4446 (= (inv!12 thiss!957) (invariant!0 (currentBit!1796 thiss!957) (currentByte!1801 thiss!957) (size!333 (buf!684 thiss!957))))))

(declare-fun bs!1230 () Bool)

(assert (= bs!1230 d!4446))

(declare-fun m!20351 () Bool)

(assert (=> bs!1230 m!20351))

(assert (=> start!2982 d!4446))

(declare-fun d!4450 () Bool)

(declare-fun e!8474 () Bool)

(assert (=> d!4450 e!8474))

(declare-fun res!13089 () Bool)

(assert (=> d!4450 (=> (not res!13089) (not e!8474))))

(declare-fun lt!21452 () (_ BitVec 64))

(declare-fun lt!21450 () (_ BitVec 64))

(declare-fun lt!21453 () (_ BitVec 64))

(assert (=> d!4450 (= res!13089 (= lt!21453 (bvsub lt!21450 lt!21452)))))

(assert (=> d!4450 (or (= (bvand lt!21450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21452 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21450 lt!21452) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4450 (= lt!21452 (remainingBits!0 ((_ sign_extend 32) (size!333 (buf!684 (_2!867 lt!21383)))) ((_ sign_extend 32) (currentByte!1801 (_2!867 lt!21383))) ((_ sign_extend 32) (currentBit!1796 (_2!867 lt!21383)))))))

(declare-fun lt!21454 () (_ BitVec 64))

(declare-fun lt!21455 () (_ BitVec 64))

(assert (=> d!4450 (= lt!21450 (bvmul lt!21454 lt!21455))))

(assert (=> d!4450 (or (= lt!21454 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21455 (bvsdiv (bvmul lt!21454 lt!21455) lt!21454)))))

(assert (=> d!4450 (= lt!21455 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4450 (= lt!21454 ((_ sign_extend 32) (size!333 (buf!684 (_2!867 lt!21383)))))))

(assert (=> d!4450 (= lt!21453 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1801 (_2!867 lt!21383))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1796 (_2!867 lt!21383)))))))

(assert (=> d!4450 (invariant!0 (currentBit!1796 (_2!867 lt!21383)) (currentByte!1801 (_2!867 lt!21383)) (size!333 (buf!684 (_2!867 lt!21383))))))

(assert (=> d!4450 (= (bitIndex!0 (size!333 (buf!684 (_2!867 lt!21383))) (currentByte!1801 (_2!867 lt!21383)) (currentBit!1796 (_2!867 lt!21383))) lt!21453)))

(declare-fun b!13799 () Bool)

(declare-fun res!13090 () Bool)

(assert (=> b!13799 (=> (not res!13090) (not e!8474))))

(assert (=> b!13799 (= res!13090 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21453))))

(declare-fun b!13800 () Bool)

(declare-fun lt!21451 () (_ BitVec 64))

(assert (=> b!13800 (= e!8474 (bvsle lt!21453 (bvmul lt!21451 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13800 (or (= lt!21451 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21451 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21451)))))

(assert (=> b!13800 (= lt!21451 ((_ sign_extend 32) (size!333 (buf!684 (_2!867 lt!21383)))))))

(assert (= (and d!4450 res!13089) b!13799))

(assert (= (and b!13799 res!13090) b!13800))

(declare-fun m!20361 () Bool)

(assert (=> d!4450 m!20361))

(assert (=> d!4450 m!20333))

(assert (=> b!13758 d!4450))

(declare-fun d!4468 () Bool)

(declare-fun e!8475 () Bool)

(assert (=> d!4468 e!8475))

(declare-fun res!13091 () Bool)

(assert (=> d!4468 (=> (not res!13091) (not e!8475))))

(declare-fun lt!21456 () (_ BitVec 64))

(declare-fun lt!21458 () (_ BitVec 64))

(declare-fun lt!21459 () (_ BitVec 64))

(assert (=> d!4468 (= res!13091 (= lt!21459 (bvsub lt!21456 lt!21458)))))

(assert (=> d!4468 (or (= (bvand lt!21456 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21458 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21456 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21456 lt!21458) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4468 (= lt!21458 (remainingBits!0 ((_ sign_extend 32) (size!333 (buf!684 thiss!957))) ((_ sign_extend 32) (currentByte!1801 thiss!957)) ((_ sign_extend 32) (currentBit!1796 thiss!957))))))

(declare-fun lt!21460 () (_ BitVec 64))

(declare-fun lt!21461 () (_ BitVec 64))

(assert (=> d!4468 (= lt!21456 (bvmul lt!21460 lt!21461))))

(assert (=> d!4468 (or (= lt!21460 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21461 (bvsdiv (bvmul lt!21460 lt!21461) lt!21460)))))

(assert (=> d!4468 (= lt!21461 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4468 (= lt!21460 ((_ sign_extend 32) (size!333 (buf!684 thiss!957))))))

(assert (=> d!4468 (= lt!21459 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1801 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1796 thiss!957))))))

(assert (=> d!4468 (invariant!0 (currentBit!1796 thiss!957) (currentByte!1801 thiss!957) (size!333 (buf!684 thiss!957)))))

(assert (=> d!4468 (= (bitIndex!0 (size!333 (buf!684 thiss!957)) (currentByte!1801 thiss!957) (currentBit!1796 thiss!957)) lt!21459)))

(declare-fun b!13801 () Bool)

(declare-fun res!13092 () Bool)

(assert (=> b!13801 (=> (not res!13092) (not e!8475))))

(assert (=> b!13801 (= res!13092 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21459))))

(declare-fun b!13802 () Bool)

(declare-fun lt!21457 () (_ BitVec 64))

(assert (=> b!13802 (= e!8475 (bvsle lt!21459 (bvmul lt!21457 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13802 (or (= lt!21457 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21457 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21457)))))

(assert (=> b!13802 (= lt!21457 ((_ sign_extend 32) (size!333 (buf!684 thiss!957))))))

(assert (= (and d!4468 res!13091) b!13801))

(assert (= (and b!13801 res!13092) b!13802))

(assert (=> d!4468 m!20349))

(assert (=> d!4468 m!20351))

(assert (=> b!13758 d!4468))

(assert (=> b!13757 d!4450))

(assert (=> b!13757 d!4468))

(declare-fun d!4470 () Bool)

(assert (=> d!4470 (= (array_inv!322 (buf!684 thiss!957)) (bvsge (size!333 (buf!684 thiss!957)) #b00000000000000000000000000000000))))

(assert (=> b!13752 d!4470))

(declare-fun d!4472 () Bool)

(declare-fun e!8476 () Bool)

(assert (=> d!4472 e!8476))

(declare-fun res!13093 () Bool)

(assert (=> d!4472 (=> (not res!13093) (not e!8476))))

(declare-fun lt!21464 () (_ BitVec 64))

(declare-fun lt!21462 () (_ BitVec 64))

(declare-fun lt!21465 () (_ BitVec 64))

(assert (=> d!4472 (= res!13093 (= lt!21465 (bvsub lt!21462 lt!21464)))))

(assert (=> d!4472 (or (= (bvand lt!21462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21464 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21462 lt!21464) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4472 (= lt!21464 (remainingBits!0 ((_ sign_extend 32) (size!333 (buf!684 (_1!868 lt!21381)))) ((_ sign_extend 32) (currentByte!1801 (_1!868 lt!21381))) ((_ sign_extend 32) (currentBit!1796 (_1!868 lt!21381)))))))

(declare-fun lt!21466 () (_ BitVec 64))

(declare-fun lt!21467 () (_ BitVec 64))

(assert (=> d!4472 (= lt!21462 (bvmul lt!21466 lt!21467))))

(assert (=> d!4472 (or (= lt!21466 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21467 (bvsdiv (bvmul lt!21466 lt!21467) lt!21466)))))

(assert (=> d!4472 (= lt!21467 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4472 (= lt!21466 ((_ sign_extend 32) (size!333 (buf!684 (_1!868 lt!21381)))))))

(assert (=> d!4472 (= lt!21465 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1801 (_1!868 lt!21381))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1796 (_1!868 lt!21381)))))))

(assert (=> d!4472 (invariant!0 (currentBit!1796 (_1!868 lt!21381)) (currentByte!1801 (_1!868 lt!21381)) (size!333 (buf!684 (_1!868 lt!21381))))))

(assert (=> d!4472 (= (bitIndex!0 (size!333 (buf!684 (_1!868 lt!21381))) (currentByte!1801 (_1!868 lt!21381)) (currentBit!1796 (_1!868 lt!21381))) lt!21465)))

(declare-fun b!13803 () Bool)

(declare-fun res!13094 () Bool)

(assert (=> b!13803 (=> (not res!13094) (not e!8476))))

(assert (=> b!13803 (= res!13094 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21465))))

(declare-fun b!13804 () Bool)

(declare-fun lt!21463 () (_ BitVec 64))

(assert (=> b!13804 (= e!8476 (bvsle lt!21465 (bvmul lt!21463 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13804 (or (= lt!21463 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21463 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21463)))))

(assert (=> b!13804 (= lt!21463 ((_ sign_extend 32) (size!333 (buf!684 (_1!868 lt!21381)))))))

(assert (= (and d!4472 res!13093) b!13803))

(assert (= (and b!13803 res!13094) b!13804))

(declare-fun m!20363 () Bool)

(assert (=> d!4472 m!20363))

(declare-fun m!20365 () Bool)

(assert (=> d!4472 m!20365))

(assert (=> b!13751 d!4472))

(declare-fun d!4474 () Bool)

(declare-datatypes ((tuple2!1632 0))(
  ( (tuple2!1633 (_1!871 Bool) (_2!871 BitStream!626)) )
))
(declare-fun lt!21470 () tuple2!1632)

(declare-fun readBit!0 (BitStream!626) tuple2!1632)

(assert (=> d!4474 (= lt!21470 (readBit!0 (readerFrom!0 (_2!867 lt!21383) (currentBit!1796 thiss!957) (currentByte!1801 thiss!957))))))

(assert (=> d!4474 (= (readBitPure!0 (readerFrom!0 (_2!867 lt!21383) (currentBit!1796 thiss!957) (currentByte!1801 thiss!957))) (tuple2!1627 (_2!871 lt!21470) (_1!871 lt!21470)))))

(declare-fun bs!1232 () Bool)

(assert (= bs!1232 d!4474))

(assert (=> bs!1232 m!20325))

(declare-fun m!20367 () Bool)

(assert (=> bs!1232 m!20367))

(assert (=> b!13756 d!4474))

(declare-fun d!4476 () Bool)

(declare-fun e!8479 () Bool)

(assert (=> d!4476 e!8479))

(declare-fun res!13098 () Bool)

(assert (=> d!4476 (=> (not res!13098) (not e!8479))))

(assert (=> d!4476 (= res!13098 (invariant!0 (currentBit!1796 (_2!867 lt!21383)) (currentByte!1801 (_2!867 lt!21383)) (size!333 (buf!684 (_2!867 lt!21383)))))))

(assert (=> d!4476 (= (readerFrom!0 (_2!867 lt!21383) (currentBit!1796 thiss!957) (currentByte!1801 thiss!957)) (BitStream!627 (buf!684 (_2!867 lt!21383)) (currentByte!1801 thiss!957) (currentBit!1796 thiss!957)))))

(declare-fun b!13807 () Bool)

(assert (=> b!13807 (= e!8479 (invariant!0 (currentBit!1796 thiss!957) (currentByte!1801 thiss!957) (size!333 (buf!684 (_2!867 lt!21383)))))))

(assert (= (and d!4476 res!13098) b!13807))

(assert (=> d!4476 m!20333))

(assert (=> b!13807 m!20335))

(assert (=> b!13756 d!4476))

(declare-fun d!4478 () Bool)

(declare-fun e!8507 () Bool)

(assert (=> d!4478 e!8507))

(declare-fun res!13146 () Bool)

(assert (=> d!4478 (=> (not res!13146) (not e!8507))))

(declare-fun lt!21515 () tuple2!1624)

(assert (=> d!4478 (= res!13146 (= (size!333 (buf!684 thiss!957)) (size!333 (buf!684 (_2!867 lt!21515)))))))

(declare-fun choose!16 (BitStream!626 Bool) tuple2!1624)

(assert (=> d!4478 (= lt!21515 (choose!16 thiss!957 false))))

(assert (=> d!4478 (validate_offset_bit!0 ((_ sign_extend 32) (size!333 (buf!684 thiss!957))) ((_ sign_extend 32) (currentByte!1801 thiss!957)) ((_ sign_extend 32) (currentBit!1796 thiss!957)))))

(assert (=> d!4478 (= (appendBit!0 thiss!957 false) lt!21515)))

(declare-fun b!13859 () Bool)

(declare-fun e!8506 () Bool)

(assert (=> b!13859 (= e!8507 e!8506)))

(declare-fun res!13148 () Bool)

(assert (=> b!13859 (=> (not res!13148) (not e!8506))))

(declare-fun lt!21512 () tuple2!1626)

(assert (=> b!13859 (= res!13148 (and (= (_2!868 lt!21512) false) (= (_1!868 lt!21512) (_2!867 lt!21515))))))

(assert (=> b!13859 (= lt!21512 (readBitPure!0 (readerFrom!0 (_2!867 lt!21515) (currentBit!1796 thiss!957) (currentByte!1801 thiss!957))))))

(declare-fun b!13857 () Bool)

(declare-fun res!13149 () Bool)

(assert (=> b!13857 (=> (not res!13149) (not e!8507))))

(declare-fun lt!21514 () (_ BitVec 64))

(declare-fun lt!21513 () (_ BitVec 64))

(assert (=> b!13857 (= res!13149 (= (bitIndex!0 (size!333 (buf!684 (_2!867 lt!21515))) (currentByte!1801 (_2!867 lt!21515)) (currentBit!1796 (_2!867 lt!21515))) (bvadd lt!21513 lt!21514)))))

(assert (=> b!13857 (or (not (= (bvand lt!21513 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21514 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!21513 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!21513 lt!21514) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!13857 (= lt!21514 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!13857 (= lt!21513 (bitIndex!0 (size!333 (buf!684 thiss!957)) (currentByte!1801 thiss!957) (currentBit!1796 thiss!957)))))

(declare-fun b!13858 () Bool)

(declare-fun res!13147 () Bool)

(assert (=> b!13858 (=> (not res!13147) (not e!8507))))

(assert (=> b!13858 (= res!13147 (isPrefixOf!0 thiss!957 (_2!867 lt!21515)))))

(declare-fun b!13860 () Bool)

(assert (=> b!13860 (= e!8506 (= (bitIndex!0 (size!333 (buf!684 (_1!868 lt!21512))) (currentByte!1801 (_1!868 lt!21512)) (currentBit!1796 (_1!868 lt!21512))) (bitIndex!0 (size!333 (buf!684 (_2!867 lt!21515))) (currentByte!1801 (_2!867 lt!21515)) (currentBit!1796 (_2!867 lt!21515)))))))

(assert (= (and d!4478 res!13146) b!13857))

(assert (= (and b!13857 res!13149) b!13858))

(assert (= (and b!13858 res!13147) b!13859))

(assert (= (and b!13859 res!13148) b!13860))

(declare-fun m!20401 () Bool)

(assert (=> d!4478 m!20401))

(assert (=> d!4478 m!20319))

(declare-fun m!20403 () Bool)

(assert (=> b!13860 m!20403))

(declare-fun m!20405 () Bool)

(assert (=> b!13860 m!20405))

(assert (=> b!13857 m!20405))

(assert (=> b!13857 m!20317))

(declare-fun m!20407 () Bool)

(assert (=> b!13859 m!20407))

(assert (=> b!13859 m!20407))

(declare-fun m!20409 () Bool)

(assert (=> b!13859 m!20409))

(declare-fun m!20411 () Bool)

(assert (=> b!13858 m!20411))

(assert (=> b!13755 d!4478))

(assert (=> b!13750 d!4436))

(declare-fun d!4498 () Bool)

(assert (=> d!4498 (= (invariant!0 (currentBit!1796 (_2!867 lt!21383)) (currentByte!1801 (_2!867 lt!21383)) (size!333 (buf!684 (_2!867 lt!21383)))) (and (bvsge (currentBit!1796 (_2!867 lt!21383)) #b00000000000000000000000000000000) (bvslt (currentBit!1796 (_2!867 lt!21383)) #b00000000000000000000000000001000) (bvsge (currentByte!1801 (_2!867 lt!21383)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1801 (_2!867 lt!21383)) (size!333 (buf!684 (_2!867 lt!21383)))) (and (= (currentBit!1796 (_2!867 lt!21383)) #b00000000000000000000000000000000) (= (currentByte!1801 (_2!867 lt!21383)) (size!333 (buf!684 (_2!867 lt!21383))))))))))

