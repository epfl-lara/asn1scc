; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71728 () Bool)

(assert start!71728)

(declare-fun b!322103 () Bool)

(declare-fun e!232116 () Bool)

(declare-datatypes ((array!20547 0))(
  ( (array!20548 (arr!10037 (Array (_ BitVec 32) (_ BitVec 8))) (size!8945 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14052 0))(
  ( (BitStream!14053 (buf!8087 array!20547) (currentByte!14904 (_ BitVec 32)) (currentBit!14899 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14052)

(declare-fun array_inv!8497 (array!20547) Bool)

(assert (=> b!322103 (= e!232116 (array_inv!8497 (buf!8087 thiss!1793)))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun b!322104 () Bool)

(declare-fun e!232119 () Bool)

(declare-datatypes ((tuple2!23522 0))(
  ( (tuple2!23523 (_1!13390 Bool) (_2!13390 BitStream!14052)) )
))
(declare-fun lt!444722 () tuple2!23522)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322104 (= e!232119 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!8945 (buf!8087 (_2!13390 lt!444722)))) ((_ sign_extend 32) (currentByte!14904 (_2!13390 lt!444722))) ((_ sign_extend 32) (currentBit!14899 (_2!13390 lt!444722))) ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743))))))))

(declare-fun res!264391 () Bool)

(declare-fun e!232118 () Bool)

(assert (=> start!71728 (=> (not res!264391) (not e!232118))))

(assert (=> start!71728 (= res!264391 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71728 e!232118))

(assert (=> start!71728 true))

(declare-fun inv!12 (BitStream!14052) Bool)

(assert (=> start!71728 (and (inv!12 thiss!1793) e!232116)))

(declare-fun b!322105 () Bool)

(declare-fun res!264394 () Bool)

(assert (=> b!322105 (=> (not res!264394) (not e!232118))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322105 (= res!264394 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322106 () Bool)

(declare-fun res!264393 () Bool)

(assert (=> b!322106 (=> (not res!264393) (not e!232118))))

(assert (=> b!322106 (= res!264393 (validate_offset_bits!1 ((_ sign_extend 32) (size!8945 (buf!8087 thiss!1793))) ((_ sign_extend 32) (currentByte!14904 thiss!1793)) ((_ sign_extend 32) (currentBit!14899 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!322107 () Bool)

(declare-fun res!264392 () Bool)

(assert (=> b!322107 (=> (not res!264392) (not e!232118))))

(assert (=> b!322107 (= res!264392 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!322108 () Bool)

(assert (=> b!322108 (= e!232118 e!232119)))

(declare-fun res!264390 () Bool)

(assert (=> b!322108 (=> (not res!264390) (not e!232119))))

(assert (=> b!322108 (= res!264390 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsle (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(declare-fun readBit!0 (BitStream!14052) tuple2!23522)

(assert (=> b!322108 (= lt!444722 (readBit!0 thiss!1793))))

(assert (= (and start!71728 res!264391) b!322106))

(assert (= (and b!322106 res!264393) b!322105))

(assert (= (and b!322105 res!264394) b!322107))

(assert (= (and b!322107 res!264392) b!322108))

(assert (= (and b!322108 res!264390) b!322104))

(assert (= start!71728 b!322103))

(declare-fun m!460335 () Bool)

(assert (=> b!322106 m!460335))

(declare-fun m!460337 () Bool)

(assert (=> b!322104 m!460337))

(declare-fun m!460339 () Bool)

(assert (=> start!71728 m!460339))

(declare-fun m!460341 () Bool)

(assert (=> b!322105 m!460341))

(declare-fun m!460343 () Bool)

(assert (=> b!322108 m!460343))

(declare-fun m!460345 () Bool)

(assert (=> b!322103 m!460345))

(check-sat (not b!322106) (not start!71728) (not b!322103) (not b!322105) (not b!322104) (not b!322108))
(check-sat)
(get-model)

(declare-fun d!105638 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105638 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8945 (buf!8087 thiss!1793))) ((_ sign_extend 32) (currentByte!14904 thiss!1793)) ((_ sign_extend 32) (currentBit!14899 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8945 (buf!8087 thiss!1793))) ((_ sign_extend 32) (currentByte!14904 thiss!1793)) ((_ sign_extend 32) (currentBit!14899 thiss!1793))) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun bs!27834 () Bool)

(assert (= bs!27834 d!105638))

(declare-fun m!460359 () Bool)

(assert (=> bs!27834 m!460359))

(assert (=> b!322106 d!105638))

(declare-fun d!105640 () Bool)

(declare-fun e!232148 () Bool)

(assert (=> d!105640 e!232148))

(declare-fun res!264414 () Bool)

(assert (=> d!105640 (=> (not res!264414) (not e!232148))))

(declare-datatypes ((Unit!21998 0))(
  ( (Unit!21999) )
))
(declare-datatypes ((tuple2!23526 0))(
  ( (tuple2!23527 (_1!13392 Unit!21998) (_2!13392 BitStream!14052)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14052) tuple2!23526)

(assert (=> d!105640 (= res!264414 (= (buf!8087 (_2!13392 (increaseBitIndex!0 thiss!1793))) (buf!8087 thiss!1793)))))

(declare-fun lt!444762 () Bool)

(assert (=> d!105640 (= lt!444762 (not (= (bvand ((_ sign_extend 24) (select (arr!10037 (buf!8087 thiss!1793)) (currentByte!14904 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14899 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444758 () tuple2!23522)

(assert (=> d!105640 (= lt!444758 (tuple2!23523 (not (= (bvand ((_ sign_extend 24) (select (arr!10037 (buf!8087 thiss!1793)) (currentByte!14904 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14899 thiss!1793)))) #b00000000000000000000000000000000)) (_2!13392 (increaseBitIndex!0 thiss!1793))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!105640 (validate_offset_bit!0 ((_ sign_extend 32) (size!8945 (buf!8087 thiss!1793))) ((_ sign_extend 32) (currentByte!14904 thiss!1793)) ((_ sign_extend 32) (currentBit!14899 thiss!1793)))))

(assert (=> d!105640 (= (readBit!0 thiss!1793) lt!444758)))

(declare-fun b!322131 () Bool)

(declare-fun lt!444759 () (_ BitVec 64))

(declare-fun lt!444756 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322131 (= e!232148 (= (bitIndex!0 (size!8945 (buf!8087 (_2!13392 (increaseBitIndex!0 thiss!1793)))) (currentByte!14904 (_2!13392 (increaseBitIndex!0 thiss!1793))) (currentBit!14899 (_2!13392 (increaseBitIndex!0 thiss!1793)))) (bvadd lt!444759 lt!444756)))))

(assert (=> b!322131 (or (not (= (bvand lt!444759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444756 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444759 lt!444756) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322131 (= lt!444756 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!322131 (= lt!444759 (bitIndex!0 (size!8945 (buf!8087 thiss!1793)) (currentByte!14904 thiss!1793) (currentBit!14899 thiss!1793)))))

(declare-fun lt!444761 () Bool)

(assert (=> b!322131 (= lt!444761 (not (= (bvand ((_ sign_extend 24) (select (arr!10037 (buf!8087 thiss!1793)) (currentByte!14904 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14899 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444757 () Bool)

(assert (=> b!322131 (= lt!444757 (not (= (bvand ((_ sign_extend 24) (select (arr!10037 (buf!8087 thiss!1793)) (currentByte!14904 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14899 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444760 () Bool)

(assert (=> b!322131 (= lt!444760 (not (= (bvand ((_ sign_extend 24) (select (arr!10037 (buf!8087 thiss!1793)) (currentByte!14904 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14899 thiss!1793)))) #b00000000000000000000000000000000)))))

(assert (= (and d!105640 res!264414) b!322131))

(declare-fun m!460363 () Bool)

(assert (=> d!105640 m!460363))

(declare-fun m!460365 () Bool)

(assert (=> d!105640 m!460365))

(declare-fun m!460367 () Bool)

(assert (=> d!105640 m!460367))

(declare-fun m!460369 () Bool)

(assert (=> d!105640 m!460369))

(declare-fun m!460371 () Bool)

(assert (=> b!322131 m!460371))

(declare-fun m!460373 () Bool)

(assert (=> b!322131 m!460373))

(assert (=> b!322131 m!460363))

(assert (=> b!322131 m!460365))

(assert (=> b!322131 m!460367))

(assert (=> b!322108 d!105640))

(declare-fun d!105648 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105648 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14899 thiss!1793) (currentByte!14904 thiss!1793) (size!8945 (buf!8087 thiss!1793))))))

(declare-fun bs!27836 () Bool)

(assert (= bs!27836 d!105648))

(declare-fun m!460375 () Bool)

(assert (=> bs!27836 m!460375))

(assert (=> start!71728 d!105648))

(declare-fun d!105650 () Bool)

(assert (=> d!105650 (= (array_inv!8497 (buf!8087 thiss!1793)) (bvsge (size!8945 (buf!8087 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!322103 d!105650))

(declare-fun d!105652 () Bool)

(assert (=> d!105652 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8945 (buf!8087 (_2!13390 lt!444722)))) ((_ sign_extend 32) (currentByte!14904 (_2!13390 lt!444722))) ((_ sign_extend 32) (currentBit!14899 (_2!13390 lt!444722))) ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8945 (buf!8087 (_2!13390 lt!444722)))) ((_ sign_extend 32) (currentByte!14904 (_2!13390 lt!444722))) ((_ sign_extend 32) (currentBit!14899 (_2!13390 lt!444722)))) ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun bs!27837 () Bool)

(assert (= bs!27837 d!105652))

(declare-fun m!460377 () Bool)

(assert (=> bs!27837 m!460377))

(assert (=> b!322104 d!105652))

(declare-fun d!105654 () Bool)

(assert (=> d!105654 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!322105 d!105654))

(check-sat (not d!105652) (not d!105638) (not d!105640) (not d!105648) (not b!322131))
(check-sat)
(get-model)

(declare-fun d!105674 () Bool)

(declare-fun e!232155 () Bool)

(assert (=> d!105674 e!232155))

(declare-fun res!264424 () Bool)

(assert (=> d!105674 (=> (not res!264424) (not e!232155))))

(declare-fun lt!444806 () (_ BitVec 64))

(declare-fun lt!444801 () (_ BitVec 64))

(declare-fun lt!444803 () (_ BitVec 64))

(assert (=> d!105674 (= res!264424 (= lt!444806 (bvsub lt!444801 lt!444803)))))

(assert (=> d!105674 (or (= (bvand lt!444801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444803 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444801 lt!444803) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105674 (= lt!444803 (remainingBits!0 ((_ sign_extend 32) (size!8945 (buf!8087 (_2!13392 (increaseBitIndex!0 thiss!1793))))) ((_ sign_extend 32) (currentByte!14904 (_2!13392 (increaseBitIndex!0 thiss!1793)))) ((_ sign_extend 32) (currentBit!14899 (_2!13392 (increaseBitIndex!0 thiss!1793))))))))

(declare-fun lt!444804 () (_ BitVec 64))

(declare-fun lt!444805 () (_ BitVec 64))

(assert (=> d!105674 (= lt!444801 (bvmul lt!444804 lt!444805))))

(assert (=> d!105674 (or (= lt!444804 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!444805 (bvsdiv (bvmul lt!444804 lt!444805) lt!444804)))))

(assert (=> d!105674 (= lt!444805 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105674 (= lt!444804 ((_ sign_extend 32) (size!8945 (buf!8087 (_2!13392 (increaseBitIndex!0 thiss!1793))))))))

(assert (=> d!105674 (= lt!444806 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14904 (_2!13392 (increaseBitIndex!0 thiss!1793)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14899 (_2!13392 (increaseBitIndex!0 thiss!1793))))))))

(assert (=> d!105674 (invariant!0 (currentBit!14899 (_2!13392 (increaseBitIndex!0 thiss!1793))) (currentByte!14904 (_2!13392 (increaseBitIndex!0 thiss!1793))) (size!8945 (buf!8087 (_2!13392 (increaseBitIndex!0 thiss!1793)))))))

(assert (=> d!105674 (= (bitIndex!0 (size!8945 (buf!8087 (_2!13392 (increaseBitIndex!0 thiss!1793)))) (currentByte!14904 (_2!13392 (increaseBitIndex!0 thiss!1793))) (currentBit!14899 (_2!13392 (increaseBitIndex!0 thiss!1793)))) lt!444806)))

(declare-fun b!322140 () Bool)

(declare-fun res!264423 () Bool)

(assert (=> b!322140 (=> (not res!264423) (not e!232155))))

(assert (=> b!322140 (= res!264423 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444806))))

(declare-fun b!322141 () Bool)

(declare-fun lt!444802 () (_ BitVec 64))

(assert (=> b!322141 (= e!232155 (bvsle lt!444806 (bvmul lt!444802 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!322141 (or (= lt!444802 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!444802 #b0000000000000000000000000000000000000000000000000000000000001000) lt!444802)))))

(assert (=> b!322141 (= lt!444802 ((_ sign_extend 32) (size!8945 (buf!8087 (_2!13392 (increaseBitIndex!0 thiss!1793))))))))

(assert (= (and d!105674 res!264424) b!322140))

(assert (= (and b!322140 res!264423) b!322141))

(declare-fun m!460413 () Bool)

(assert (=> d!105674 m!460413))

(declare-fun m!460415 () Bool)

(assert (=> d!105674 m!460415))

(assert (=> b!322131 d!105674))

(declare-fun d!105676 () Bool)

(declare-fun e!232158 () Bool)

(assert (=> d!105676 e!232158))

(declare-fun res!264429 () Bool)

(assert (=> d!105676 (=> (not res!264429) (not e!232158))))

(declare-fun lt!444819 () (_ BitVec 64))

(declare-fun lt!444820 () tuple2!23526)

(declare-fun lt!444821 () (_ BitVec 64))

(assert (=> d!105676 (= res!264429 (= (bvadd lt!444819 lt!444821) (bitIndex!0 (size!8945 (buf!8087 (_2!13392 lt!444820))) (currentByte!14904 (_2!13392 lt!444820)) (currentBit!14899 (_2!13392 lt!444820)))))))

(assert (=> d!105676 (or (not (= (bvand lt!444819 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444821 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444819 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444819 lt!444821) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105676 (= lt!444821 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!105676 (= lt!444819 (bitIndex!0 (size!8945 (buf!8087 thiss!1793)) (currentByte!14904 thiss!1793) (currentBit!14899 thiss!1793)))))

(declare-fun Unit!22004 () Unit!21998)

(declare-fun Unit!22005 () Unit!21998)

(assert (=> d!105676 (= lt!444820 (ite (bvslt (currentBit!14899 thiss!1793) #b00000000000000000000000000000111) (tuple2!23527 Unit!22004 (BitStream!14053 (buf!8087 thiss!1793) (currentByte!14904 thiss!1793) (bvadd (currentBit!14899 thiss!1793) #b00000000000000000000000000000001))) (tuple2!23527 Unit!22005 (BitStream!14053 (buf!8087 thiss!1793) (bvadd (currentByte!14904 thiss!1793) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!105676 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!8945 (buf!8087 thiss!1793))) ((_ sign_extend 32) (currentByte!14904 thiss!1793)) ((_ sign_extend 32) (currentBit!14899 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!105676 (= (increaseBitIndex!0 thiss!1793) lt!444820)))

(declare-fun b!322146 () Bool)

(declare-fun res!264430 () Bool)

(assert (=> b!322146 (=> (not res!264430) (not e!232158))))

(declare-fun lt!444817 () (_ BitVec 64))

(declare-fun lt!444818 () (_ BitVec 64))

(assert (=> b!322146 (= res!264430 (= (bvsub lt!444817 lt!444818) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!322146 (or (= (bvand lt!444817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444818 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444817 lt!444818) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322146 (= lt!444818 (remainingBits!0 ((_ sign_extend 32) (size!8945 (buf!8087 (_2!13392 lt!444820)))) ((_ sign_extend 32) (currentByte!14904 (_2!13392 lt!444820))) ((_ sign_extend 32) (currentBit!14899 (_2!13392 lt!444820)))))))

(assert (=> b!322146 (= lt!444817 (remainingBits!0 ((_ sign_extend 32) (size!8945 (buf!8087 thiss!1793))) ((_ sign_extend 32) (currentByte!14904 thiss!1793)) ((_ sign_extend 32) (currentBit!14899 thiss!1793))))))

(declare-fun b!322147 () Bool)

(assert (=> b!322147 (= e!232158 (= (size!8945 (buf!8087 thiss!1793)) (size!8945 (buf!8087 (_2!13392 lt!444820)))))))

(assert (= (and d!105676 res!264429) b!322146))

(assert (= (and b!322146 res!264430) b!322147))

(declare-fun m!460417 () Bool)

(assert (=> d!105676 m!460417))

(assert (=> d!105676 m!460371))

(assert (=> d!105676 m!460359))

(declare-fun m!460419 () Bool)

(assert (=> b!322146 m!460419))

(assert (=> b!322146 m!460359))

(assert (=> b!322131 d!105676))

(declare-fun d!105678 () Bool)

(declare-fun e!232159 () Bool)

(assert (=> d!105678 e!232159))

(declare-fun res!264432 () Bool)

(assert (=> d!105678 (=> (not res!264432) (not e!232159))))

(declare-fun lt!444824 () (_ BitVec 64))

(declare-fun lt!444822 () (_ BitVec 64))

(declare-fun lt!444827 () (_ BitVec 64))

(assert (=> d!105678 (= res!264432 (= lt!444827 (bvsub lt!444822 lt!444824)))))

(assert (=> d!105678 (or (= (bvand lt!444822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444824 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444822 lt!444824) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105678 (= lt!444824 (remainingBits!0 ((_ sign_extend 32) (size!8945 (buf!8087 thiss!1793))) ((_ sign_extend 32) (currentByte!14904 thiss!1793)) ((_ sign_extend 32) (currentBit!14899 thiss!1793))))))

(declare-fun lt!444825 () (_ BitVec 64))

(declare-fun lt!444826 () (_ BitVec 64))

(assert (=> d!105678 (= lt!444822 (bvmul lt!444825 lt!444826))))

(assert (=> d!105678 (or (= lt!444825 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!444826 (bvsdiv (bvmul lt!444825 lt!444826) lt!444825)))))

(assert (=> d!105678 (= lt!444826 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105678 (= lt!444825 ((_ sign_extend 32) (size!8945 (buf!8087 thiss!1793))))))

(assert (=> d!105678 (= lt!444827 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14904 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14899 thiss!1793))))))

(assert (=> d!105678 (invariant!0 (currentBit!14899 thiss!1793) (currentByte!14904 thiss!1793) (size!8945 (buf!8087 thiss!1793)))))

(assert (=> d!105678 (= (bitIndex!0 (size!8945 (buf!8087 thiss!1793)) (currentByte!14904 thiss!1793) (currentBit!14899 thiss!1793)) lt!444827)))

(declare-fun b!322148 () Bool)

(declare-fun res!264431 () Bool)

(assert (=> b!322148 (=> (not res!264431) (not e!232159))))

(assert (=> b!322148 (= res!264431 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444827))))

(declare-fun b!322149 () Bool)

(declare-fun lt!444823 () (_ BitVec 64))

(assert (=> b!322149 (= e!232159 (bvsle lt!444827 (bvmul lt!444823 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!322149 (or (= lt!444823 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!444823 #b0000000000000000000000000000000000000000000000000000000000001000) lt!444823)))))

(assert (=> b!322149 (= lt!444823 ((_ sign_extend 32) (size!8945 (buf!8087 thiss!1793))))))

(assert (= (and d!105678 res!264432) b!322148))

(assert (= (and b!322148 res!264431) b!322149))

(assert (=> d!105678 m!460359))

(assert (=> d!105678 m!460375))

(assert (=> b!322131 d!105678))

(declare-fun d!105680 () Bool)

(assert (=> d!105680 (= (invariant!0 (currentBit!14899 thiss!1793) (currentByte!14904 thiss!1793) (size!8945 (buf!8087 thiss!1793))) (and (bvsge (currentBit!14899 thiss!1793) #b00000000000000000000000000000000) (bvslt (currentBit!14899 thiss!1793) #b00000000000000000000000000001000) (bvsge (currentByte!14904 thiss!1793) #b00000000000000000000000000000000) (or (bvslt (currentByte!14904 thiss!1793) (size!8945 (buf!8087 thiss!1793))) (and (= (currentBit!14899 thiss!1793) #b00000000000000000000000000000000) (= (currentByte!14904 thiss!1793) (size!8945 (buf!8087 thiss!1793)))))))))

(assert (=> d!105648 d!105680))

(declare-fun d!105682 () Bool)

(assert (=> d!105682 (= (remainingBits!0 ((_ sign_extend 32) (size!8945 (buf!8087 (_2!13390 lt!444722)))) ((_ sign_extend 32) (currentByte!14904 (_2!13390 lt!444722))) ((_ sign_extend 32) (currentBit!14899 (_2!13390 lt!444722)))) (bvsub (bvmul ((_ sign_extend 32) (size!8945 (buf!8087 (_2!13390 lt!444722)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14904 (_2!13390 lt!444722))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14899 (_2!13390 lt!444722))))))))

(assert (=> d!105652 d!105682))

(declare-fun d!105686 () Bool)

(assert (=> d!105686 (= (remainingBits!0 ((_ sign_extend 32) (size!8945 (buf!8087 thiss!1793))) ((_ sign_extend 32) (currentByte!14904 thiss!1793)) ((_ sign_extend 32) (currentBit!14899 thiss!1793))) (bvsub (bvmul ((_ sign_extend 32) (size!8945 (buf!8087 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14904 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14899 thiss!1793)))))))

(assert (=> d!105638 d!105686))

(assert (=> d!105640 d!105676))

(declare-fun d!105688 () Bool)

(assert (=> d!105688 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8945 (buf!8087 thiss!1793))) ((_ sign_extend 32) (currentByte!14904 thiss!1793)) ((_ sign_extend 32) (currentBit!14899 thiss!1793))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8945 (buf!8087 thiss!1793))) ((_ sign_extend 32) (currentByte!14904 thiss!1793)) ((_ sign_extend 32) (currentBit!14899 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!27843 () Bool)

(assert (= bs!27843 d!105688))

(assert (=> bs!27843 m!460359))

(assert (=> d!105640 d!105688))

(check-sat (not d!105674) (not d!105688) (not b!322146) (not d!105678) (not d!105676))
(check-sat)
