; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71792 () Bool)

(assert start!71792)

(declare-fun b!322192 () Bool)

(declare-fun e!232184 () Bool)

(declare-fun e!232182 () Bool)

(assert (=> b!322192 (= e!232184 e!232182)))

(declare-fun res!264473 () Bool)

(assert (=> b!322192 (=> (not res!264473) (not e!232182))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> b!322192 (= res!264473 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsle (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(declare-datatypes ((array!20554 0))(
  ( (array!20555 (arr!10039 (Array (_ BitVec 32) (_ BitVec 8))) (size!8947 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14056 0))(
  ( (BitStream!14057 (buf!8089 array!20554) (currentByte!14921 (_ BitVec 32)) (currentBit!14916 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23532 0))(
  ( (tuple2!23533 (_1!13395 Bool) (_2!13395 BitStream!14056)) )
))
(declare-fun lt!444908 () tuple2!23532)

(declare-fun thiss!1793 () BitStream!14056)

(declare-fun readBit!0 (BitStream!14056) tuple2!23532)

(assert (=> b!322192 (= lt!444908 (readBit!0 thiss!1793))))

(declare-fun b!322193 () Bool)

(declare-fun res!264475 () Bool)

(assert (=> b!322193 (=> (not res!264475) (not e!232184))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322193 (= res!264475 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!264474 () Bool)

(assert (=> start!71792 (=> (not res!264474) (not e!232184))))

(assert (=> start!71792 (= res!264474 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71792 e!232184))

(assert (=> start!71792 true))

(declare-fun e!232183 () Bool)

(declare-fun inv!12 (BitStream!14056) Bool)

(assert (=> start!71792 (and (inv!12 thiss!1793) e!232183)))

(declare-fun b!322194 () Bool)

(declare-fun res!264478 () Bool)

(assert (=> b!322194 (=> (not res!264478) (not e!232182))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322194 (= res!264478 (validate_offset_bits!1 ((_ sign_extend 32) (size!8947 (buf!8089 (_2!13395 lt!444908)))) ((_ sign_extend 32) (currentByte!14921 (_2!13395 lt!444908))) ((_ sign_extend 32) (currentBit!14916 (_2!13395 lt!444908))) ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun b!322195 () Bool)

(declare-fun array_inv!8499 (array!20554) Bool)

(assert (=> b!322195 (= e!232183 (array_inv!8499 (buf!8089 thiss!1793)))))

(declare-fun b!322196 () Bool)

(assert (=> b!322196 (= e!232182 (not (= (bvand (bvor acc!161 (ite (_1!13395 lt!444908) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!743)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322197 () Bool)

(declare-fun res!264477 () Bool)

(assert (=> b!322197 (=> (not res!264477) (not e!232184))))

(assert (=> b!322197 (= res!264477 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!322198 () Bool)

(declare-fun res!264476 () Bool)

(assert (=> b!322198 (=> (not res!264476) (not e!232184))))

(assert (=> b!322198 (= res!264476 (validate_offset_bits!1 ((_ sign_extend 32) (size!8947 (buf!8089 thiss!1793))) ((_ sign_extend 32) (currentByte!14921 thiss!1793)) ((_ sign_extend 32) (currentBit!14916 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(assert (= (and start!71792 res!264474) b!322198))

(assert (= (and b!322198 res!264476) b!322193))

(assert (= (and b!322193 res!264475) b!322197))

(assert (= (and b!322197 res!264477) b!322192))

(assert (= (and b!322192 res!264473) b!322194))

(assert (= (and b!322194 res!264478) b!322196))

(assert (= start!71792 b!322195))

(declare-fun m!460437 () Bool)

(assert (=> start!71792 m!460437))

(declare-fun m!460439 () Bool)

(assert (=> b!322196 m!460439))

(declare-fun m!460441 () Bool)

(assert (=> b!322193 m!460441))

(declare-fun m!460443 () Bool)

(assert (=> b!322195 m!460443))

(declare-fun m!460445 () Bool)

(assert (=> b!322198 m!460445))

(declare-fun m!460447 () Bool)

(assert (=> b!322194 m!460447))

(declare-fun m!460449 () Bool)

(assert (=> b!322192 m!460449))

(push 1)

(assert (not start!71792))

(assert (not b!322192))

(assert (not b!322198))

(assert (not b!322194))

(assert (not b!322195))

(assert (not b!322193))

(assert (not b!322196))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105724 () Bool)

(assert (=> d!105724 (= (array_inv!8499 (buf!8089 thiss!1793)) (bvsge (size!8947 (buf!8089 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!322195 d!105724))

(declare-fun d!105726 () Bool)

(assert (=> d!105726 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!743))) (ite (= (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!743)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!743)))))))))

(assert (=> b!322196 d!105726))

(declare-fun d!105728 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105728 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8947 (buf!8089 thiss!1793))) ((_ sign_extend 32) (currentByte!14921 thiss!1793)) ((_ sign_extend 32) (currentBit!14916 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8947 (buf!8089 thiss!1793))) ((_ sign_extend 32) (currentByte!14921 thiss!1793)) ((_ sign_extend 32) (currentBit!14916 thiss!1793))) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun bs!27851 () Bool)

(assert (= bs!27851 d!105728))

(declare-fun m!460483 () Bool)

(assert (=> bs!27851 m!460483))

(assert (=> b!322198 d!105728))

(declare-fun d!105730 () Bool)

(declare-fun e!232229 () Bool)

(assert (=> d!105730 e!232229))

(declare-fun res!264522 () Bool)

(assert (=> d!105730 (=> (not res!264522) (not e!232229))))

(declare-datatypes ((Unit!22012 0))(
  ( (Unit!22013) )
))
(declare-datatypes ((tuple2!23540 0))(
  ( (tuple2!23541 (_1!13399 Unit!22012) (_2!13399 BitStream!14056)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14056) tuple2!23540)

(assert (=> d!105730 (= res!264522 (= (buf!8089 (_2!13399 (increaseBitIndex!0 thiss!1793))) (buf!8089 thiss!1793)))))

(declare-fun lt!444952 () Bool)

(assert (=> d!105730 (= lt!444952 (not (= (bvand ((_ sign_extend 24) (select (arr!10039 (buf!8089 thiss!1793)) (currentByte!14921 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14916 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444955 () tuple2!23532)

(assert (=> d!105730 (= lt!444955 (tuple2!23533 (not (= (bvand ((_ sign_extend 24) (select (arr!10039 (buf!8089 thiss!1793)) (currentByte!14921 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14916 thiss!1793)))) #b00000000000000000000000000000000)) (_2!13399 (increaseBitIndex!0 thiss!1793))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!105730 (validate_offset_bit!0 ((_ sign_extend 32) (size!8947 (buf!8089 thiss!1793))) ((_ sign_extend 32) (currentByte!14921 thiss!1793)) ((_ sign_extend 32) (currentBit!14916 thiss!1793)))))

(assert (=> d!105730 (= (readBit!0 thiss!1793) lt!444955)))

(declare-fun lt!444956 () (_ BitVec 64))

(declare-fun b!322246 () Bool)

(declare-fun lt!444953 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322246 (= e!232229 (= (bitIndex!0 (size!8947 (buf!8089 (_2!13399 (increaseBitIndex!0 thiss!1793)))) (currentByte!14921 (_2!13399 (increaseBitIndex!0 thiss!1793))) (currentBit!14916 (_2!13399 (increaseBitIndex!0 thiss!1793)))) (bvadd lt!444953 lt!444956)))))

(assert (=> b!322246 (or (not (= (bvand lt!444953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444956 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444953 lt!444956) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322246 (= lt!444956 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!322246 (= lt!444953 (bitIndex!0 (size!8947 (buf!8089 thiss!1793)) (currentByte!14921 thiss!1793) (currentBit!14916 thiss!1793)))))

(declare-fun lt!444954 () Bool)

(assert (=> b!322246 (= lt!444954 (not (= (bvand ((_ sign_extend 24) (select (arr!10039 (buf!8089 thiss!1793)) (currentByte!14921 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14916 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444958 () Bool)

(assert (=> b!322246 (= lt!444958 (not (= (bvand ((_ sign_extend 24) (select (arr!10039 (buf!8089 thiss!1793)) (currentByte!14921 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14916 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444957 () Bool)

(assert (=> b!322246 (= lt!444957 (not (= (bvand ((_ sign_extend 24) (select (arr!10039 (buf!8089 thiss!1793)) (currentByte!14921 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14916 thiss!1793)))) #b00000000000000000000000000000000)))))

(assert (= (and d!105730 res!264522) b!322246))

(declare-fun m!460503 () Bool)

(assert (=> d!105730 m!460503))

(declare-fun m!460505 () Bool)

(assert (=> d!105730 m!460505))

(declare-fun m!460507 () Bool)

(assert (=> d!105730 m!460507))

(declare-fun m!460509 () Bool)

(assert (=> d!105730 m!460509))

(assert (=> b!322246 m!460507))

(declare-fun m!460511 () Bool)

(assert (=> b!322246 m!460511))

(assert (=> b!322246 m!460505))

(declare-fun m!460513 () Bool)

(assert (=> b!322246 m!460513))

(assert (=> b!322246 m!460503))

(assert (=> b!322192 d!105730))

(declare-fun d!105750 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105750 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14916 thiss!1793) (currentByte!14921 thiss!1793) (size!8947 (buf!8089 thiss!1793))))))

(declare-fun bs!27855 () Bool)

(assert (= bs!27855 d!105750))

(declare-fun m!460515 () Bool)

(assert (=> bs!27855 m!460515))

(assert (=> start!71792 d!105750))

(declare-fun d!105752 () Bool)

(assert (=> d!105752 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8947 (buf!8089 (_2!13395 lt!444908)))) ((_ sign_extend 32) (currentByte!14921 (_2!13395 lt!444908))) ((_ sign_extend 32) (currentBit!14916 (_2!13395 lt!444908))) ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8947 (buf!8089 (_2!13395 lt!444908)))) ((_ sign_extend 32) (currentByte!14921 (_2!13395 lt!444908))) ((_ sign_extend 32) (currentBit!14916 (_2!13395 lt!444908)))) ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun bs!27856 () Bool)

(assert (= bs!27856 d!105752))

(declare-fun m!460517 () Bool)

(assert (=> bs!27856 m!460517))

(assert (=> b!322194 d!105752))

(declare-fun d!105754 () Bool)

(assert (=> d!105754 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!322193 d!105754))

(push 1)

(assert (not b!322246))

(assert (not d!105750))

(assert (not d!105752))

(assert (not d!105730))

(assert (not d!105728))

(check-sat)

(pop 1)

(push 1)

(check-sat)

