; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3042 () Bool)

(assert start!3042)

(declare-fun res!13219 () Bool)

(declare-fun e!8567 () Bool)

(assert (=> start!3042 (=> (not res!13219) (not e!8567))))

(declare-datatypes ((array!781 0))(
  ( (array!782 (arr!765 (Array (_ BitVec 32) (_ BitVec 8))) (size!336 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!632 0))(
  ( (BitStream!633 (buf!687 array!781) (currentByte!1813 (_ BitVec 32)) (currentBit!1808 (_ BitVec 32))) )
))
(declare-fun thiss!957 () BitStream!632)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!3042 (= res!13219 (validate_offset_bit!0 ((_ sign_extend 32) (size!336 (buf!687 thiss!957))) ((_ sign_extend 32) (currentByte!1813 thiss!957)) ((_ sign_extend 32) (currentBit!1808 thiss!957))))))

(assert (=> start!3042 e!8567))

(declare-fun e!8572 () Bool)

(declare-fun inv!12 (BitStream!632) Bool)

(assert (=> start!3042 (and (inv!12 thiss!957) e!8572)))

(declare-fun b!13936 () Bool)

(declare-fun e!8570 () Bool)

(assert (=> b!13936 (= e!8567 (not e!8570))))

(declare-fun res!13222 () Bool)

(assert (=> b!13936 (=> res!13222 e!8570)))

(declare-datatypes ((Unit!1137 0))(
  ( (Unit!1138) )
))
(declare-datatypes ((tuple2!1642 0))(
  ( (tuple2!1643 (_1!876 Unit!1137) (_2!876 BitStream!632)) )
))
(declare-fun lt!21559 () tuple2!1642)

(assert (=> b!13936 (= res!13222 (not (= (size!336 (buf!687 (_2!876 lt!21559))) (size!336 (buf!687 thiss!957)))))))

(declare-fun e!8571 () Bool)

(assert (=> b!13936 e!8571))

(declare-fun res!13224 () Bool)

(assert (=> b!13936 (=> (not res!13224) (not e!8571))))

(assert (=> b!13936 (= res!13224 (= (size!336 (buf!687 thiss!957)) (size!336 (buf!687 (_2!876 lt!21559)))))))

(declare-fun appendBit!0 (BitStream!632 Bool) tuple2!1642)

(assert (=> b!13936 (= lt!21559 (appendBit!0 thiss!957 false))))

(declare-fun b!13937 () Bool)

(declare-fun e!8573 () Bool)

(declare-datatypes ((tuple2!1644 0))(
  ( (tuple2!1645 (_1!877 BitStream!632) (_2!877 Bool)) )
))
(declare-fun lt!21562 () tuple2!1644)

(declare-fun lt!21560 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!13937 (= e!8573 (= (bitIndex!0 (size!336 (buf!687 (_1!877 lt!21562))) (currentByte!1813 (_1!877 lt!21562)) (currentBit!1808 (_1!877 lt!21562))) lt!21560))))

(declare-fun b!13938 () Bool)

(declare-fun e!8568 () Bool)

(assert (=> b!13938 (= e!8571 e!8568)))

(declare-fun res!13220 () Bool)

(assert (=> b!13938 (=> (not res!13220) (not e!8568))))

(declare-fun lt!21563 () (_ BitVec 64))

(assert (=> b!13938 (= res!13220 (= lt!21560 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21563)))))

(assert (=> b!13938 (= lt!21560 (bitIndex!0 (size!336 (buf!687 (_2!876 lt!21559))) (currentByte!1813 (_2!876 lt!21559)) (currentBit!1808 (_2!876 lt!21559))))))

(assert (=> b!13938 (= lt!21563 (bitIndex!0 (size!336 (buf!687 thiss!957)) (currentByte!1813 thiss!957) (currentBit!1808 thiss!957)))))

(declare-fun b!13939 () Bool)

(declare-fun res!13221 () Bool)

(assert (=> b!13939 (=> (not res!13221) (not e!8568))))

(declare-fun isPrefixOf!0 (BitStream!632 BitStream!632) Bool)

(assert (=> b!13939 (= res!13221 (isPrefixOf!0 thiss!957 (_2!876 lt!21559)))))

(declare-fun b!13940 () Bool)

(declare-fun lt!21561 () BitStream!632)

(assert (=> b!13940 (= e!8570 (validate_offset_bit!0 ((_ sign_extend 32) (size!336 (buf!687 lt!21561))) ((_ sign_extend 32) (currentByte!1813 lt!21561)) ((_ sign_extend 32) (currentBit!1808 lt!21561))))))

(declare-fun readerFrom!0 (BitStream!632 (_ BitVec 32) (_ BitVec 32)) BitStream!632)

(assert (=> b!13940 (= lt!21561 (readerFrom!0 (_2!876 lt!21559) (currentBit!1808 thiss!957) (currentByte!1813 thiss!957)))))

(declare-fun b!13941 () Bool)

(assert (=> b!13941 (= e!8568 e!8573)))

(declare-fun res!13218 () Bool)

(assert (=> b!13941 (=> (not res!13218) (not e!8573))))

(assert (=> b!13941 (= res!13218 (and (not (_2!877 lt!21562)) (= (_1!877 lt!21562) (_2!876 lt!21559))))))

(declare-fun readBitPure!0 (BitStream!632) tuple2!1644)

(assert (=> b!13941 (= lt!21562 (readBitPure!0 (readerFrom!0 (_2!876 lt!21559) (currentBit!1808 thiss!957) (currentByte!1813 thiss!957))))))

(declare-fun b!13942 () Bool)

(declare-fun res!13223 () Bool)

(assert (=> b!13942 (=> res!13223 e!8570)))

(assert (=> b!13942 (= res!13223 (not (isPrefixOf!0 thiss!957 (_2!876 lt!21559))))))

(declare-fun b!13943 () Bool)

(declare-fun res!13225 () Bool)

(assert (=> b!13943 (=> res!13225 e!8570)))

(assert (=> b!13943 (= res!13225 (not (= (bitIndex!0 (size!336 (buf!687 (_2!876 lt!21559))) (currentByte!1813 (_2!876 lt!21559)) (currentBit!1808 (_2!876 lt!21559))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!336 (buf!687 thiss!957)) (currentByte!1813 thiss!957) (currentBit!1808 thiss!957))))))))

(declare-fun b!13944 () Bool)

(declare-fun array_inv!325 (array!781) Bool)

(assert (=> b!13944 (= e!8572 (array_inv!325 (buf!687 thiss!957)))))

(assert (= (and start!3042 res!13219) b!13936))

(assert (= (and b!13936 res!13224) b!13938))

(assert (= (and b!13938 res!13220) b!13939))

(assert (= (and b!13939 res!13221) b!13941))

(assert (= (and b!13941 res!13218) b!13937))

(assert (= (and b!13936 (not res!13222)) b!13943))

(assert (= (and b!13943 (not res!13225)) b!13942))

(assert (= (and b!13942 (not res!13223)) b!13940))

(assert (= start!3042 b!13944))

(declare-fun m!20459 () Bool)

(assert (=> b!13941 m!20459))

(assert (=> b!13941 m!20459))

(declare-fun m!20461 () Bool)

(assert (=> b!13941 m!20461))

(declare-fun m!20463 () Bool)

(assert (=> b!13943 m!20463))

(declare-fun m!20465 () Bool)

(assert (=> b!13943 m!20465))

(declare-fun m!20467 () Bool)

(assert (=> b!13944 m!20467))

(declare-fun m!20469 () Bool)

(assert (=> b!13937 m!20469))

(declare-fun m!20471 () Bool)

(assert (=> start!3042 m!20471))

(declare-fun m!20473 () Bool)

(assert (=> start!3042 m!20473))

(declare-fun m!20475 () Bool)

(assert (=> b!13939 m!20475))

(assert (=> b!13938 m!20463))

(assert (=> b!13938 m!20465))

(assert (=> b!13942 m!20475))

(declare-fun m!20477 () Bool)

(assert (=> b!13936 m!20477))

(declare-fun m!20479 () Bool)

(assert (=> b!13940 m!20479))

(assert (=> b!13940 m!20459))

(push 1)

(assert (not b!13941))

(assert (not b!13943))

(assert (not b!13942))

(assert (not b!13940))

(assert (not b!13937))

(assert (not b!13939))

(assert (not b!13944))

(assert (not b!13936))

(assert (not b!13938))

(assert (not start!3042))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4520 () Bool)

(declare-fun e!8597 () Bool)

(assert (=> d!4520 e!8597))

(declare-fun res!13265 () Bool)

(assert (=> d!4520 (=> (not res!13265) (not e!8597))))

(declare-fun lt!21641 () (_ BitVec 64))

(declare-fun lt!21640 () (_ BitVec 64))

(declare-fun lt!21636 () (_ BitVec 64))

(assert (=> d!4520 (= res!13265 (= lt!21640 (bvsub lt!21636 lt!21641)))))

(assert (=> d!4520 (or (= (bvand lt!21636 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21641 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21636 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21636 lt!21641) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4520 (= lt!21641 (remainingBits!0 ((_ sign_extend 32) (size!336 (buf!687 (_2!876 lt!21559)))) ((_ sign_extend 32) (currentByte!1813 (_2!876 lt!21559))) ((_ sign_extend 32) (currentBit!1808 (_2!876 lt!21559)))))))

(declare-fun lt!21637 () (_ BitVec 64))

(declare-fun lt!21639 () (_ BitVec 64))

(assert (=> d!4520 (= lt!21636 (bvmul lt!21637 lt!21639))))

(assert (=> d!4520 (or (= lt!21637 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21639 (bvsdiv (bvmul lt!21637 lt!21639) lt!21637)))))

(assert (=> d!4520 (= lt!21639 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4520 (= lt!21637 ((_ sign_extend 32) (size!336 (buf!687 (_2!876 lt!21559)))))))

(assert (=> d!4520 (= lt!21640 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1813 (_2!876 lt!21559))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1808 (_2!876 lt!21559)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!4520 (invariant!0 (currentBit!1808 (_2!876 lt!21559)) (currentByte!1813 (_2!876 lt!21559)) (size!336 (buf!687 (_2!876 lt!21559))))))

(assert (=> d!4520 (= (bitIndex!0 (size!336 (buf!687 (_2!876 lt!21559))) (currentByte!1813 (_2!876 lt!21559)) (currentBit!1808 (_2!876 lt!21559))) lt!21640)))

(declare-fun b!13982 () Bool)

(declare-fun res!13266 () Bool)

(assert (=> b!13982 (=> (not res!13266) (not e!8597))))

(assert (=> b!13982 (= res!13266 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21640))))

(declare-fun b!13983 () Bool)

(declare-fun lt!21638 () (_ BitVec 64))

(assert (=> b!13983 (= e!8597 (bvsle lt!21640 (bvmul lt!21638 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13983 (or (= lt!21638 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21638 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21638)))))

(assert (=> b!13983 (= lt!21638 ((_ sign_extend 32) (size!336 (buf!687 (_2!876 lt!21559)))))))

(assert (= (and d!4520 res!13265) b!13982))

(assert (= (and b!13982 res!13266) b!13983))

(declare-fun m!20515 () Bool)

(assert (=> d!4520 m!20515))

(declare-fun m!20517 () Bool)

(assert (=> d!4520 m!20517))

(assert (=> b!13938 d!4520))

(declare-fun d!4546 () Bool)

(declare-fun e!8598 () Bool)

(assert (=> d!4546 e!8598))

(declare-fun res!13267 () Bool)

(assert (=> d!4546 (=> (not res!13267) (not e!8598))))

(declare-fun lt!21642 () (_ BitVec 64))

(declare-fun lt!21646 () (_ BitVec 64))

(declare-fun lt!21647 () (_ BitVec 64))

(assert (=> d!4546 (= res!13267 (= lt!21646 (bvsub lt!21642 lt!21647)))))

(assert (=> d!4546 (or (= (bvand lt!21642 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21647 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21642 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21642 lt!21647) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4546 (= lt!21647 (remainingBits!0 ((_ sign_extend 32) (size!336 (buf!687 thiss!957))) ((_ sign_extend 32) (currentByte!1813 thiss!957)) ((_ sign_extend 32) (currentBit!1808 thiss!957))))))

(declare-fun lt!21643 () (_ BitVec 64))

(declare-fun lt!21645 () (_ BitVec 64))

(assert (=> d!4546 (= lt!21642 (bvmul lt!21643 lt!21645))))

(assert (=> d!4546 (or (= lt!21643 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21645 (bvsdiv (bvmul lt!21643 lt!21645) lt!21643)))))

(assert (=> d!4546 (= lt!21645 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4546 (= lt!21643 ((_ sign_extend 32) (size!336 (buf!687 thiss!957))))))

(assert (=> d!4546 (= lt!21646 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1813 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1808 thiss!957))))))

(assert (=> d!4546 (invariant!0 (currentBit!1808 thiss!957) (currentByte!1813 thiss!957) (size!336 (buf!687 thiss!957)))))

(assert (=> d!4546 (= (bitIndex!0 (size!336 (buf!687 thiss!957)) (currentByte!1813 thiss!957) (currentBit!1808 thiss!957)) lt!21646)))

(declare-fun b!13984 () Bool)

(declare-fun res!13268 () Bool)

(assert (=> b!13984 (=> (not res!13268) (not e!8598))))

(assert (=> b!13984 (= res!13268 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21646))))

(declare-fun b!13985 () Bool)

(declare-fun lt!21644 () (_ BitVec 64))

(assert (=> b!13985 (= e!8598 (bvsle lt!21646 (bvmul lt!21644 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13985 (or (= lt!21644 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21644 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21644)))))

(assert (=> b!13985 (= lt!21644 ((_ sign_extend 32) (size!336 (buf!687 thiss!957))))))

(assert (= (and d!4546 res!13267) b!13984))

(assert (= (and b!13984 res!13268) b!13985))

(declare-fun m!20519 () Bool)

(assert (=> d!4546 m!20519))

(declare-fun m!20521 () Bool)

(assert (=> d!4546 m!20521))

(assert (=> b!13938 d!4546))

(assert (=> b!13943 d!4520))

(assert (=> b!13943 d!4546))

(declare-fun d!4550 () Bool)

(assert (=> d!4550 (= (array_inv!325 (buf!687 thiss!957)) (bvsge (size!336 (buf!687 thiss!957)) #b00000000000000000000000000000000))))

(assert (=> b!13944 d!4550))

(declare-fun d!4552 () Bool)

(declare-fun res!13276 () Bool)

(declare-fun e!8604 () Bool)

(assert (=> d!4552 (=> (not res!13276) (not e!8604))))

(assert (=> d!4552 (= res!13276 (= (size!336 (buf!687 thiss!957)) (size!336 (buf!687 (_2!876 lt!21559)))))))

(assert (=> d!4552 (= (isPrefixOf!0 thiss!957 (_2!876 lt!21559)) e!8604)))

(declare-fun b!13992 () Bool)

(declare-fun res!13275 () Bool)

(assert (=> b!13992 (=> (not res!13275) (not e!8604))))

(assert (=> b!13992 (= res!13275 (bvsle (bitIndex!0 (size!336 (buf!687 thiss!957)) (currentByte!1813 thiss!957) (currentBit!1808 thiss!957)) (bitIndex!0 (size!336 (buf!687 (_2!876 lt!21559))) (currentByte!1813 (_2!876 lt!21559)) (currentBit!1808 (_2!876 lt!21559)))))))

(declare-fun b!13993 () Bool)

(declare-fun e!8603 () Bool)

(assert (=> b!13993 (= e!8604 e!8603)))

(declare-fun res!13277 () Bool)

(assert (=> b!13993 (=> res!13277 e!8603)))

(assert (=> b!13993 (= res!13277 (= (size!336 (buf!687 thiss!957)) #b00000000000000000000000000000000))))

(declare-fun b!13994 () Bool)

(declare-fun arrayBitRangesEq!0 (array!781 array!781 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!13994 (= e!8603 (arrayBitRangesEq!0 (buf!687 thiss!957) (buf!687 (_2!876 lt!21559)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!336 (buf!687 thiss!957)) (currentByte!1813 thiss!957) (currentBit!1808 thiss!957))))))

(assert (= (and d!4552 res!13276) b!13992))

(assert (= (and b!13992 res!13275) b!13993))

(assert (= (and b!13993 (not res!13277)) b!13994))

(assert (=> b!13992 m!20465))

(assert (=> b!13992 m!20463))

(assert (=> b!13994 m!20465))

(assert (=> b!13994 m!20465))

(declare-fun m!20523 () Bool)

(assert (=> b!13994 m!20523))

(assert (=> b!13942 d!4552))

(declare-fun d!4554 () Bool)

(assert (=> d!4554 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!336 (buf!687 thiss!957))) ((_ sign_extend 32) (currentByte!1813 thiss!957)) ((_ sign_extend 32) (currentBit!1808 thiss!957))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!336 (buf!687 thiss!957))) ((_ sign_extend 32) (currentByte!1813 thiss!957)) ((_ sign_extend 32) (currentBit!1808 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1248 () Bool)

(assert (= bs!1248 d!4554))

(assert (=> bs!1248 m!20519))

(assert (=> start!3042 d!4554))

(declare-fun d!4556 () Bool)

(assert (=> d!4556 (= (inv!12 thiss!957) (invariant!0 (currentBit!1808 thiss!957) (currentByte!1813 thiss!957) (size!336 (buf!687 thiss!957))))))

(declare-fun bs!1249 () Bool)

(assert (= bs!1249 d!4556))

(assert (=> bs!1249 m!20521))

(assert (=> start!3042 d!4556))

(declare-fun d!4558 () Bool)

(declare-fun e!8605 () Bool)

(assert (=> d!4558 e!8605))

(declare-fun res!13278 () Bool)

(assert (=> d!4558 (=> (not res!13278) (not e!8605))))

(declare-fun lt!21652 () (_ BitVec 64))

(declare-fun lt!21648 () (_ BitVec 64))

(declare-fun lt!21653 () (_ BitVec 64))

(assert (=> d!4558 (= res!13278 (= lt!21652 (bvsub lt!21648 lt!21653)))))

(assert (=> d!4558 (or (= (bvand lt!21648 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21653 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21648 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21648 lt!21653) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4558 (= lt!21653 (remainingBits!0 ((_ sign_extend 32) (size!336 (buf!687 (_1!877 lt!21562)))) ((_ sign_extend 32) (currentByte!1813 (_1!877 lt!21562))) ((_ sign_extend 32) (currentBit!1808 (_1!877 lt!21562)))))))

(declare-fun lt!21649 () (_ BitVec 64))

(declare-fun lt!21651 () (_ BitVec 64))

(assert (=> d!4558 (= lt!21648 (bvmul lt!21649 lt!21651))))

(assert (=> d!4558 (or (= lt!21649 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21651 (bvsdiv (bvmul lt!21649 lt!21651) lt!21649)))))

(assert (=> d!4558 (= lt!21651 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4558 (= lt!21649 ((_ sign_extend 32) (size!336 (buf!687 (_1!877 lt!21562)))))))

(assert (=> d!4558 (= lt!21652 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1813 (_1!877 lt!21562))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1808 (_1!877 lt!21562)))))))

(assert (=> d!4558 (invariant!0 (currentBit!1808 (_1!877 lt!21562)) (currentByte!1813 (_1!877 lt!21562)) (size!336 (buf!687 (_1!877 lt!21562))))))

(assert (=> d!4558 (= (bitIndex!0 (size!336 (buf!687 (_1!877 lt!21562))) (currentByte!1813 (_1!877 lt!21562)) (currentBit!1808 (_1!877 lt!21562))) lt!21652)))

(declare-fun b!13995 () Bool)

(declare-fun res!13279 () Bool)

(assert (=> b!13995 (=> (not res!13279) (not e!8605))))

(assert (=> b!13995 (= res!13279 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21652))))

(declare-fun b!13996 () Bool)

(declare-fun lt!21650 () (_ BitVec 64))

(assert (=> b!13996 (= e!8605 (bvsle lt!21652 (bvmul lt!21650 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13996 (or (= lt!21650 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21650 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21650)))))

(assert (=> b!13996 (= lt!21650 ((_ sign_extend 32) (size!336 (buf!687 (_1!877 lt!21562)))))))

(assert (= (and d!4558 res!13278) b!13995))

(assert (= (and b!13995 res!13279) b!13996))

(declare-fun m!20525 () Bool)

(assert (=> d!4558 m!20525))

(declare-fun m!20527 () Bool)

(assert (=> d!4558 m!20527))

(assert (=> b!13937 d!4558))

(declare-fun d!4560 () Bool)

(declare-fun e!8630 () Bool)

(assert (=> d!4560 e!8630))

(declare-fun res!13323 () Bool)

(assert (=> d!4560 (=> (not res!13323) (not e!8630))))

(declare-fun lt!21692 () tuple2!1642)

(assert (=> d!4560 (= res!13323 (= (size!336 (buf!687 thiss!957)) (size!336 (buf!687 (_2!876 lt!21692)))))))

(declare-fun choose!16 (BitStream!632 Bool) tuple2!1642)

(assert (=> d!4560 (= lt!21692 (choose!16 thiss!957 false))))

(assert (=> d!4560 (validate_offset_bit!0 ((_ sign_extend 32) (size!336 (buf!687 thiss!957))) ((_ sign_extend 32) (currentByte!1813 thiss!957)) ((_ sign_extend 32) (currentBit!1808 thiss!957)))))

(assert (=> d!4560 (= (appendBit!0 thiss!957 false) lt!21692)))

(declare-fun b!14043 () Bool)

(declare-fun res!13324 () Bool)

(assert (=> b!14043 (=> (not res!13324) (not e!8630))))

(declare-fun lt!21695 () (_ BitVec 64))

(declare-fun lt!21693 () (_ BitVec 64))

(assert (=> b!14043 (= res!13324 (= (bitIndex!0 (size!336 (buf!687 (_2!876 lt!21692))) (currentByte!1813 (_2!876 lt!21692)) (currentBit!1808 (_2!876 lt!21692))) (bvadd lt!21693 lt!21695)))))

(assert (=> b!14043 (or (not (= (bvand lt!21693 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21695 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!21693 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!21693 lt!21695) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!14043 (= lt!21695 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!14043 (= lt!21693 (bitIndex!0 (size!336 (buf!687 thiss!957)) (currentByte!1813 thiss!957) (currentBit!1808 thiss!957)))))

(declare-fun b!14045 () Bool)

(declare-fun e!8629 () Bool)

(assert (=> b!14045 (= e!8630 e!8629)))

(declare-fun res!13326 () Bool)

(assert (=> b!14045 (=> (not res!13326) (not e!8629))))

(declare-fun lt!21694 () tuple2!1644)

(assert (=> b!14045 (= res!13326 (and (= (_2!877 lt!21694) false) (= (_1!877 lt!21694) (_2!876 lt!21692))))))

(assert (=> b!14045 (= lt!21694 (readBitPure!0 (readerFrom!0 (_2!876 lt!21692) (currentBit!1808 thiss!957) (currentByte!1813 thiss!957))))))

(declare-fun b!14046 () Bool)

(assert (=> b!14046 (= e!8629 (= (bitIndex!0 (size!336 (buf!687 (_1!877 lt!21694))) (currentByte!1813 (_1!877 lt!21694)) (currentBit!1808 (_1!877 lt!21694))) (bitIndex!0 (size!336 (buf!687 (_2!876 lt!21692))) (currentByte!1813 (_2!876 lt!21692)) (currentBit!1808 (_2!876 lt!21692)))))))

(declare-fun b!14044 () Bool)

(declare-fun res!13325 () Bool)

(assert (=> b!14044 (=> (not res!13325) (not e!8630))))

(assert (=> b!14044 (= res!13325 (isPrefixOf!0 thiss!957 (_2!876 lt!21692)))))

(assert (= (and d!4560 res!13323) b!14043))

(assert (= (and b!14043 res!13324) b!14044))

(assert (= (and b!14044 res!13325) b!14045))

(assert (= (and b!14045 res!13326) b!14046))

(declare-fun m!20559 () Bool)

(assert (=> b!14043 m!20559))

(assert (=> b!14043 m!20465))

(declare-fun m!20561 () Bool)

(assert (=> b!14044 m!20561))

(declare-fun m!20563 () Bool)

(assert (=> d!4560 m!20563))

(assert (=> d!4560 m!20471))

(declare-fun m!20565 () Bool)

(assert (=> b!14046 m!20565))

(assert (=> b!14046 m!20559))

(declare-fun m!20567 () Bool)

(assert (=> b!14045 m!20567))

(assert (=> b!14045 m!20567))

(declare-fun m!20569 () Bool)

(assert (=> b!14045 m!20569))

(assert (=> b!13936 d!4560))

(declare-fun d!4566 () Bool)

(declare-datatypes ((tuple2!1650 0))(
  ( (tuple2!1651 (_1!880 Bool) (_2!880 BitStream!632)) )
))
(declare-fun lt!21698 () tuple2!1650)

(declare-fun readBit!0 (BitStream!632) tuple2!1650)

(assert (=> d!4566 (= lt!21698 (readBit!0 (readerFrom!0 (_2!876 lt!21559) (currentBit!1808 thiss!957) (currentByte!1813 thiss!957))))))

(assert (=> d!4566 (= (readBitPure!0 (readerFrom!0 (_2!876 lt!21559) (currentBit!1808 thiss!957) (currentByte!1813 thiss!957))) (tuple2!1645 (_2!880 lt!21698) (_1!880 lt!21698)))))

(declare-fun bs!1250 () Bool)

(assert (= bs!1250 d!4566))

(assert (=> bs!1250 m!20459))

(declare-fun m!20571 () Bool)

(assert (=> bs!1250 m!20571))

(assert (=> b!13941 d!4566))

(declare-fun d!4568 () Bool)

(declare-fun e!8633 () Bool)

(assert (=> d!4568 e!8633))

(declare-fun res!13330 () Bool)

(assert (=> d!4568 (=> (not res!13330) (not e!8633))))

(assert (=> d!4568 (= res!13330 (invariant!0 (currentBit!1808 (_2!876 lt!21559)) (currentByte!1813 (_2!876 lt!21559)) (size!336 (buf!687 (_2!876 lt!21559)))))))

(assert (=> d!4568 (= (readerFrom!0 (_2!876 lt!21559) (currentBit!1808 thiss!957) (currentByte!1813 thiss!957)) (BitStream!633 (buf!687 (_2!876 lt!21559)) (currentByte!1813 thiss!957) (currentBit!1808 thiss!957)))))

(declare-fun b!14049 () Bool)

(assert (=> b!14049 (= e!8633 (invariant!0 (currentBit!1808 thiss!957) (currentByte!1813 thiss!957) (size!336 (buf!687 (_2!876 lt!21559)))))))

(assert (= (and d!4568 res!13330) b!14049))

(assert (=> d!4568 m!20517))

(declare-fun m!20573 () Bool)

(assert (=> b!14049 m!20573))

(assert (=> b!13941 d!4568))

(assert (=> b!13939 d!4552))

(declare-fun d!4570 () Bool)

(assert (=> d!4570 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!336 (buf!687 lt!21561))) ((_ sign_extend 32) (currentByte!1813 lt!21561)) ((_ sign_extend 32) (currentBit!1808 lt!21561))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!336 (buf!687 lt!21561))) ((_ sign_extend 32) (currentByte!1813 lt!21561)) ((_ sign_extend 32) (currentBit!1808 lt!21561))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1251 () Bool)

(assert (= bs!1251 d!4570))

(declare-fun m!20575 () Bool)

(assert (=> bs!1251 m!20575))

(assert (=> b!13940 d!4570))

(assert (=> b!13940 d!4568))

(push 1)

(assert (not d!4558))

(assert (not d!4520))

(assert (not d!4560))

(assert (not b!14049))

(assert (not d!4570))

(assert (not d!4566))

(assert (not b!13994))

(assert (not b!14045))

(assert (not d!4554))

(assert (not d!4568))

(assert (not b!14044))

(assert (not d!4556))

(assert (not b!14046))

(assert (not b!13992))

(assert (not b!14043))

(assert (not d!4546))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

