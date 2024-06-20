; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71834 () Bool)

(assert start!71834)

(declare-fun b!322335 () Bool)

(declare-fun res!264597 () Bool)

(declare-fun e!232286 () Bool)

(assert (=> b!322335 (=> (not res!264597) (not e!232286))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!322335 (= res!264597 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!322336 () Bool)

(declare-fun e!232284 () Bool)

(assert (=> b!322336 (= e!232286 e!232284)))

(declare-fun res!264600 () Bool)

(assert (=> b!322336 (=> (not res!264600) (not e!232284))))

(declare-datatypes ((array!20569 0))(
  ( (array!20570 (arr!10045 (Array (_ BitVec 32) (_ BitVec 8))) (size!8953 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14068 0))(
  ( (BitStream!14069 (buf!8095 array!20569) (currentByte!14930 (_ BitVec 32)) (currentBit!14925 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23550 0))(
  ( (tuple2!23551 (_1!13404 (_ BitVec 64)) (_2!13404 BitStream!14068)) )
))
(declare-fun lt!445010 () tuple2!23550)

(declare-fun thiss!1793 () BitStream!14068)

(assert (=> b!322336 (= res!264600 (= (buf!8095 (_2!13404 lt!445010)) (buf!8095 thiss!1793)))))

(declare-datatypes ((tuple2!23552 0))(
  ( (tuple2!23553 (_1!13405 Bool) (_2!13405 BitStream!14068)) )
))
(declare-fun lt!445009 () tuple2!23552)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14068 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23550)

(assert (=> b!322336 (= lt!445010 (readNBitsLSBFirstsLoop!0 (_2!13405 lt!445009) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13405 lt!445009) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!14068) tuple2!23552)

(assert (=> b!322336 (= lt!445009 (readBit!0 thiss!1793))))

(declare-fun b!322337 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!322337 (= e!232284 (not (invariant!0 (currentBit!14925 (_2!13404 lt!445010)) (currentByte!14930 (_2!13404 lt!445010)) (size!8953 (buf!8095 (_2!13404 lt!445010))))))))

(declare-fun b!322338 () Bool)

(declare-fun res!264599 () Bool)

(assert (=> b!322338 (=> (not res!264599) (not e!232286))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322338 (= res!264599 (validate_offset_bits!1 ((_ sign_extend 32) (size!8953 (buf!8095 thiss!1793))) ((_ sign_extend 32) (currentByte!14930 thiss!1793)) ((_ sign_extend 32) (currentBit!14925 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!322339 () Bool)

(declare-fun e!232285 () Bool)

(declare-fun array_inv!8505 (array!20569) Bool)

(assert (=> b!322339 (= e!232285 (array_inv!8505 (buf!8095 thiss!1793)))))

(declare-fun b!322334 () Bool)

(declare-fun res!264601 () Bool)

(assert (=> b!322334 (=> (not res!264601) (not e!232286))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322334 (= res!264601 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!264598 () Bool)

(assert (=> start!71834 (=> (not res!264598) (not e!232286))))

(assert (=> start!71834 (= res!264598 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71834 e!232286))

(assert (=> start!71834 true))

(declare-fun inv!12 (BitStream!14068) Bool)

(assert (=> start!71834 (and (inv!12 thiss!1793) e!232285)))

(assert (= (and start!71834 res!264598) b!322338))

(assert (= (and b!322338 res!264599) b!322334))

(assert (= (and b!322334 res!264601) b!322335))

(assert (= (and b!322335 res!264597) b!322336))

(assert (= (and b!322336 res!264600) b!322337))

(assert (= start!71834 b!322339))

(declare-fun m!460575 () Bool)

(assert (=> b!322338 m!460575))

(declare-fun m!460577 () Bool)

(assert (=> b!322336 m!460577))

(declare-fun m!460579 () Bool)

(assert (=> b!322336 m!460579))

(declare-fun m!460581 () Bool)

(assert (=> b!322339 m!460581))

(declare-fun m!460583 () Bool)

(assert (=> b!322334 m!460583))

(declare-fun m!460585 () Bool)

(assert (=> start!71834 m!460585))

(declare-fun m!460587 () Bool)

(assert (=> b!322337 m!460587))

(push 1)

(assert (not b!322337))

(assert (not b!322339))

(assert (not b!322336))

(assert (not b!322338))

(assert (not b!322334))

(assert (not start!71834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105774 () Bool)

(assert (=> d!105774 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14925 thiss!1793) (currentByte!14930 thiss!1793) (size!8953 (buf!8095 thiss!1793))))))

(declare-fun bs!27866 () Bool)

(assert (= bs!27866 d!105774))

(declare-fun m!460621 () Bool)

(assert (=> bs!27866 m!460621))

(assert (=> start!71834 d!105774))

(declare-fun b!322404 () Bool)

(declare-fun e!232325 () tuple2!23550)

(assert (=> b!322404 (= e!232325 (tuple2!23551 (bvor acc!161 (ite (_1!13405 lt!445009) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!13405 lt!445009)))))

(declare-fun b!322405 () Bool)

(declare-fun lt!445050 () tuple2!23550)

(assert (=> b!322405 (= e!232325 (tuple2!23551 (_1!13404 lt!445050) (_2!13404 lt!445050)))))

(declare-fun lt!445047 () tuple2!23552)

(assert (=> b!322405 (= lt!445047 (readBit!0 (_2!13405 lt!445009)))))

(assert (=> b!322405 (= lt!445050 (readNBitsLSBFirstsLoop!0 (_2!13405 lt!445047) nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) (bvor (bvor acc!161 (ite (_1!13405 lt!445009) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13405 lt!445047) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!322406 () Bool)

(declare-fun res!264656 () Bool)

(declare-fun e!232326 () Bool)

(assert (=> b!322406 (=> (not res!264656) (not e!232326))))

(declare-fun lt!445048 () tuple2!23550)

(declare-fun lt!445049 () (_ BitVec 64))

(declare-fun lt!445051 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322406 (= res!264656 (= (bitIndex!0 (size!8953 (buf!8095 (_2!13404 lt!445048))) (currentByte!14930 (_2!13404 lt!445048)) (currentBit!14925 (_2!13404 lt!445048))) (bvadd lt!445051 lt!445049)))))

(assert (=> b!322406 (or (not (= (bvand lt!445051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445049 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!445051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!445051 lt!445049) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322406 (= lt!445049 ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743))))))

(assert (=> b!322406 (or (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!743) #b10000000000000000000000000000000)) (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)) #b10000000000000000000000000000000)))))

(assert (=> b!322406 (= lt!445051 (bitIndex!0 (size!8953 (buf!8095 (_2!13405 lt!445009))) (currentByte!14930 (_2!13405 lt!445009)) (currentBit!14925 (_2!13405 lt!445009))))))

(declare-fun b!322407 () Bool)

(declare-fun res!264653 () Bool)

(assert (=> b!322407 (=> (not res!264653) (not e!232326))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322407 (= res!264653 (= (bvand (_1!13404 lt!445048) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743))) (bvand (bvor acc!161 (ite (_1!13405 lt!445009) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun d!105776 () Bool)

(assert (=> d!105776 e!232326))

(declare-fun res!264655 () Bool)

(assert (=> d!105776 (=> (not res!264655) (not e!232326))))

(assert (=> d!105776 (= res!264655 (= (buf!8095 (_2!13404 lt!445048)) (buf!8095 (_2!13405 lt!445009))))))

(assert (=> d!105776 (= lt!445048 e!232325)))

(declare-fun c!15417 () Bool)

(assert (=> d!105776 (= c!15417 (= nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))

(assert (=> d!105776 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsle (bvadd #b00000000000000000000000000000001 i!743) nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000))))

(assert (=> d!105776 (= (readNBitsLSBFirstsLoop!0 (_2!13405 lt!445009) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13405 lt!445009) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!445048)))

(declare-fun b!322408 () Bool)

(declare-fun e!232324 () Bool)

(declare-fun lt!445052 () (_ BitVec 64))

(declare-datatypes ((tuple2!23562 0))(
  ( (tuple2!23563 (_1!13410 BitStream!14068) (_2!13410 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!14068) tuple2!23562)

(assert (=> b!322408 (= e!232324 (= (= (bvand (bvlshr (_1!13404 lt!445048) lt!445052) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13410 (readBitPure!0 (_2!13405 lt!445009)))))))

(assert (=> b!322408 (and (bvsge lt!445052 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!445052 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!322408 (= lt!445052 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743)))))

(declare-fun b!322409 () Bool)

(declare-fun res!264652 () Bool)

(assert (=> b!322409 (=> (not res!264652) (not e!232326))))

(assert (=> b!322409 (= res!264652 (= (bvand (_1!13404 lt!445048) (onesLSBLong!0 nBits!548)) (_1!13404 lt!445048)))))

(declare-fun b!322410 () Bool)

(assert (=> b!322410 (= e!232326 e!232324)))

(declare-fun res!264654 () Bool)

(assert (=> b!322410 (=> res!264654 e!232324)))

(assert (=> b!322410 (= res!264654 (not (bvslt (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(assert (= (and d!105776 c!15417) b!322404))

(assert (= (and d!105776 (not c!15417)) b!322405))

(assert (= (and d!105776 res!264655) b!322406))

(assert (= (and b!322406 res!264656) b!322407))

(assert (= (and b!322407 res!264653) b!322409))

(assert (= (and b!322409 res!264652) b!322410))

(assert (= (and b!322410 (not res!264654)) b!322408))

(declare-fun m!460627 () Bool)

(assert (=> b!322408 m!460627))

(declare-fun m!460629 () Bool)

(assert (=> b!322407 m!460629))

(declare-fun m!460631 () Bool)

(assert (=> b!322405 m!460631))

(declare-fun m!460633 () Bool)

(assert (=> b!322405 m!460633))

(declare-fun m!460635 () Bool)

(assert (=> b!322409 m!460635))

(declare-fun m!460637 () Bool)

(assert (=> b!322406 m!460637))

(declare-fun m!460639 () Bool)

(assert (=> b!322406 m!460639))

(assert (=> b!322336 d!105776))

(declare-fun d!105788 () Bool)

(declare-fun e!232346 () Bool)

(assert (=> d!105788 e!232346))

(declare-fun res!264674 () Bool)

(assert (=> d!105788 (=> (not res!264674) (not e!232346))))

(declare-datatypes ((Unit!22016 0))(
  ( (Unit!22017) )
))
(declare-datatypes ((tuple2!23564 0))(
  ( (tuple2!23565 (_1!13411 Unit!22016) (_2!13411 BitStream!14068)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14068) tuple2!23564)

(assert (=> d!105788 (= res!264674 (= (buf!8095 (_2!13411 (increaseBitIndex!0 thiss!1793))) (buf!8095 thiss!1793)))))

(declare-fun lt!445091 () Bool)

(assert (=> d!105788 (= lt!445091 (not (= (bvand ((_ sign_extend 24) (select (arr!10045 (buf!8095 thiss!1793)) (currentByte!14930 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14925 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!445085 () tuple2!23552)

(assert (=> d!105788 (= lt!445085 (tuple2!23553 (not (= (bvand ((_ sign_extend 24) (select (arr!10045 (buf!8095 thiss!1793)) (currentByte!14930 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14925 thiss!1793)))) #b00000000000000000000000000000000)) (_2!13411 (increaseBitIndex!0 thiss!1793))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!105788 (validate_offset_bit!0 ((_ sign_extend 32) (size!8953 (buf!8095 thiss!1793))) ((_ sign_extend 32) (currentByte!14930 thiss!1793)) ((_ sign_extend 32) (currentBit!14925 thiss!1793)))))

(assert (=> d!105788 (= (readBit!0 thiss!1793) lt!445085)))

(declare-fun b!322434 () Bool)

(declare-fun lt!445087 () (_ BitVec 64))

(declare-fun lt!445090 () (_ BitVec 64))

(assert (=> b!322434 (= e!232346 (= (bitIndex!0 (size!8953 (buf!8095 (_2!13411 (increaseBitIndex!0 thiss!1793)))) (currentByte!14930 (_2!13411 (increaseBitIndex!0 thiss!1793))) (currentBit!14925 (_2!13411 (increaseBitIndex!0 thiss!1793)))) (bvadd lt!445090 lt!445087)))))

(assert (=> b!322434 (or (not (= (bvand lt!445090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445087 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!445090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!445090 lt!445087) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322434 (= lt!445087 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!322434 (= lt!445090 (bitIndex!0 (size!8953 (buf!8095 thiss!1793)) (currentByte!14930 thiss!1793) (currentBit!14925 thiss!1793)))))

(declare-fun lt!445088 () Bool)

(assert (=> b!322434 (= lt!445088 (not (= (bvand ((_ sign_extend 24) (select (arr!10045 (buf!8095 thiss!1793)) (currentByte!14930 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14925 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!445086 () Bool)

(assert (=> b!322434 (= lt!445086 (not (= (bvand ((_ sign_extend 24) (select (arr!10045 (buf!8095 thiss!1793)) (currentByte!14930 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14925 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!445089 () Bool)

(assert (=> b!322434 (= lt!445089 (not (= (bvand ((_ sign_extend 24) (select (arr!10045 (buf!8095 thiss!1793)) (currentByte!14930 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14925 thiss!1793)))) #b00000000000000000000000000000000)))))

(assert (= (and d!105788 res!264674) b!322434))

(declare-fun m!460655 () Bool)

(assert (=> d!105788 m!460655))

(declare-fun m!460657 () Bool)

(assert (=> d!105788 m!460657))

(declare-fun m!460659 () Bool)

(assert (=> d!105788 m!460659))

(declare-fun m!460661 () Bool)

(assert (=> d!105788 m!460661))

(assert (=> b!322434 m!460657))

(declare-fun m!460663 () Bool)

(assert (=> b!322434 m!460663))

(assert (=> b!322434 m!460659))

(assert (=> b!322434 m!460655))

(declare-fun m!460665 () Bool)

(assert (=> b!322434 m!460665))

(assert (=> b!322336 d!105788))

(declare-fun d!105792 () Bool)

(assert (=> d!105792 (= (invariant!0 (currentBit!14925 (_2!13404 lt!445010)) (currentByte!14930 (_2!13404 lt!445010)) (size!8953 (buf!8095 (_2!13404 lt!445010)))) (and (bvsge (currentBit!14925 (_2!13404 lt!445010)) #b00000000000000000000000000000000) (bvslt (currentBit!14925 (_2!13404 lt!445010)) #b00000000000000000000000000001000) (bvsge (currentByte!14930 (_2!13404 lt!445010)) #b00000000000000000000000000000000) (or (bvslt (currentByte!14930 (_2!13404 lt!445010)) (size!8953 (buf!8095 (_2!13404 lt!445010)))) (and (= (currentBit!14925 (_2!13404 lt!445010)) #b00000000000000000000000000000000) (= (currentByte!14930 (_2!13404 lt!445010)) (size!8953 (buf!8095 (_2!13404 lt!445010))))))))))

(assert (=> b!322337 d!105792))

(declare-fun d!105794 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105794 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8953 (buf!8095 thiss!1793))) ((_ sign_extend 32) (currentByte!14930 thiss!1793)) ((_ sign_extend 32) (currentBit!14925 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8953 (buf!8095 thiss!1793))) ((_ sign_extend 32) (currentByte!14930 thiss!1793)) ((_ sign_extend 32) (currentBit!14925 thiss!1793))) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun bs!27869 () Bool)

(assert (= bs!27869 d!105794))

(declare-fun m!460667 () Bool)

(assert (=> bs!27869 m!460667))

(assert (=> b!322338 d!105794))

(declare-fun d!105796 () Bool)

(assert (=> d!105796 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!322334 d!105796))

(declare-fun d!105798 () Bool)

(assert (=> d!105798 (= (array_inv!8505 (buf!8095 thiss!1793)) (bvsge (size!8953 (buf!8095 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!322339 d!105798))

(push 1)

(assert (not d!105788))

(assert (not b!322434))

(assert (not b!322405))

(assert (not b!322409))

(assert (not d!105774))

(assert (not b!322406))

(assert (not d!105794))

(assert (not b!322407))

(assert (not b!322408))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105832 () Bool)

(declare-fun e!232375 () Bool)

(assert (=> d!105832 e!232375))

(declare-fun res!264715 () Bool)

(assert (=> d!105832 (=> (not res!264715) (not e!232375))))

(declare-fun lt!445219 () tuple2!23564)

(declare-fun lt!445220 () (_ BitVec 64))

(declare-fun lt!445221 () (_ BitVec 64))

(assert (=> d!105832 (= res!264715 (= (bvadd lt!445221 lt!445220) (bitIndex!0 (size!8953 (buf!8095 (_2!13411 lt!445219))) (currentByte!14930 (_2!13411 lt!445219)) (currentBit!14925 (_2!13411 lt!445219)))))))

(assert (=> d!105832 (or (not (= (bvand lt!445221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445220 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!445221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!445221 lt!445220) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105832 (= lt!445220 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!105832 (= lt!445221 (bitIndex!0 (size!8953 (buf!8095 thiss!1793)) (currentByte!14930 thiss!1793) (currentBit!14925 thiss!1793)))))

(declare-fun Unit!22024 () Unit!22016)

(declare-fun Unit!22025 () Unit!22016)

(assert (=> d!105832 (= lt!445219 (ite (bvslt (currentBit!14925 thiss!1793) #b00000000000000000000000000000111) (tuple2!23565 Unit!22024 (BitStream!14069 (buf!8095 thiss!1793) (currentByte!14930 thiss!1793) (bvadd (currentBit!14925 thiss!1793) #b00000000000000000000000000000001))) (tuple2!23565 Unit!22025 (BitStream!14069 (buf!8095 thiss!1793) (bvadd (currentByte!14930 thiss!1793) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!105832 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!8953 (buf!8095 thiss!1793))) ((_ sign_extend 32) (currentByte!14930 thiss!1793)) ((_ sign_extend 32) (currentBit!14925 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!105832 (= (increaseBitIndex!0 thiss!1793) lt!445219)))

(declare-fun b!322478 () Bool)

(declare-fun res!264714 () Bool)

(assert (=> b!322478 (=> (not res!264714) (not e!232375))))

(declare-fun lt!445218 () (_ BitVec 64))

(declare-fun lt!445217 () (_ BitVec 64))

(assert (=> b!322478 (= res!264714 (= (bvsub lt!445218 lt!445217) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!322478 (or (= (bvand lt!445218 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445217 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!445218 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!445218 lt!445217) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322478 (= lt!445217 (remainingBits!0 ((_ sign_extend 32) (size!8953 (buf!8095 (_2!13411 lt!445219)))) ((_ sign_extend 32) (currentByte!14930 (_2!13411 lt!445219))) ((_ sign_extend 32) (currentBit!14925 (_2!13411 lt!445219)))))))

(assert (=> b!322478 (= lt!445218 (remainingBits!0 ((_ sign_extend 32) (size!8953 (buf!8095 thiss!1793))) ((_ sign_extend 32) (currentByte!14930 thiss!1793)) ((_ sign_extend 32) (currentBit!14925 thiss!1793))))))

(declare-fun b!322479 () Bool)

(assert (=> b!322479 (= e!232375 (= (size!8953 (buf!8095 thiss!1793)) (size!8953 (buf!8095 (_2!13411 lt!445219)))))))

(assert (= (and d!105832 res!264715) b!322478))

(assert (= (and b!322478 res!264714) b!322479))

(declare-fun m!460745 () Bool)

(assert (=> d!105832 m!460745))

(assert (=> d!105832 m!460665))

(assert (=> d!105832 m!460667))

(declare-fun m!460747 () Bool)

(assert (=> b!322478 m!460747))

(assert (=> b!322478 m!460667))

(assert (=> d!105788 d!105832))

(declare-fun d!105834 () Bool)

(assert (=> d!105834 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8953 (buf!8095 thiss!1793))) ((_ sign_extend 32) (currentByte!14930 thiss!1793)) ((_ sign_extend 32) (currentBit!14925 thiss!1793))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8953 (buf!8095 thiss!1793))) ((_ sign_extend 32) (currentByte!14930 thiss!1793)) ((_ sign_extend 32) (currentBit!14925 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!27872 () Bool)

(assert (= bs!27872 d!105834))

(assert (=> bs!27872 m!460667))

(assert (=> d!105788 d!105834))

(declare-fun d!105836 () Bool)

(declare-fun e!232376 () Bool)

(assert (=> d!105836 e!232376))

(declare-fun res!264716 () Bool)

(assert (=> d!105836 (=> (not res!264716) (not e!232376))))

(assert (=> d!105836 (= res!264716 (= (buf!8095 (_2!13411 (increaseBitIndex!0 (_2!13405 lt!445009)))) (buf!8095 (_2!13405 lt!445009))))))

(declare-fun lt!445228 () Bool)

(assert (=> d!105836 (= lt!445228 (not (= (bvand ((_ sign_extend 24) (select (arr!10045 (buf!8095 (_2!13405 lt!445009))) (currentByte!14930 (_2!13405 lt!445009)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14925 (_2!13405 lt!445009))))) #b00000000000000000000000000000000)))))

(declare-fun lt!445222 () tuple2!23552)

(assert (=> d!105836 (= lt!445222 (tuple2!23553 (not (= (bvand ((_ sign_extend 24) (select (arr!10045 (buf!8095 (_2!13405 lt!445009))) (currentByte!14930 (_2!13405 lt!445009)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14925 (_2!13405 lt!445009))))) #b00000000000000000000000000000000)) (_2!13411 (increaseBitIndex!0 (_2!13405 lt!445009)))))))

(assert (=> d!105836 (validate_offset_bit!0 ((_ sign_extend 32) (size!8953 (buf!8095 (_2!13405 lt!445009)))) ((_ sign_extend 32) (currentByte!14930 (_2!13405 lt!445009))) ((_ sign_extend 32) (currentBit!14925 (_2!13405 lt!445009))))))

(assert (=> d!105836 (= (readBit!0 (_2!13405 lt!445009)) lt!445222)))

(declare-fun b!322480 () Bool)

(declare-fun lt!445227 () (_ BitVec 64))

(declare-fun lt!445224 () (_ BitVec 64))

(assert (=> b!322480 (= e!232376 (= (bitIndex!0 (size!8953 (buf!8095 (_2!13411 (increaseBitIndex!0 (_2!13405 lt!445009))))) (currentByte!14930 (_2!13411 (increaseBitIndex!0 (_2!13405 lt!445009)))) (currentBit!14925 (_2!13411 (increaseBitIndex!0 (_2!13405 lt!445009))))) (bvadd lt!445227 lt!445224)))))

(assert (=> b!322480 (or (not (= (bvand lt!445227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445224 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!445227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!445227 lt!445224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322480 (= lt!445224 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!322480 (= lt!445227 (bitIndex!0 (size!8953 (buf!8095 (_2!13405 lt!445009))) (currentByte!14930 (_2!13405 lt!445009)) (currentBit!14925 (_2!13405 lt!445009))))))

(declare-fun lt!445225 () Bool)

(assert (=> b!322480 (= lt!445225 (not (= (bvand ((_ sign_extend 24) (select (arr!10045 (buf!8095 (_2!13405 lt!445009))) (currentByte!14930 (_2!13405 lt!445009)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14925 (_2!13405 lt!445009))))) #b00000000000000000000000000000000)))))

(declare-fun lt!445223 () Bool)

(assert (=> b!322480 (= lt!445223 (not (= (bvand ((_ sign_extend 24) (select (arr!10045 (buf!8095 (_2!13405 lt!445009))) (currentByte!14930 (_2!13405 lt!445009)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14925 (_2!13405 lt!445009))))) #b00000000000000000000000000000000)))))

(declare-fun lt!445226 () Bool)

(assert (=> b!322480 (= lt!445226 (not (= (bvand ((_ sign_extend 24) (select (arr!10045 (buf!8095 (_2!13405 lt!445009))) (currentByte!14930 (_2!13405 lt!445009)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14925 (_2!13405 lt!445009))))) #b00000000000000000000000000000000)))))

(assert (= (and d!105836 res!264716) b!322480))

(declare-fun m!460749 () Bool)

(assert (=> d!105836 m!460749))

(declare-fun m!460751 () Bool)

(assert (=> d!105836 m!460751))

(declare-fun m!460753 () Bool)

(assert (=> d!105836 m!460753))

(declare-fun m!460755 () Bool)

(assert (=> d!105836 m!460755))

(assert (=> b!322480 m!460751))

(declare-fun m!460757 () Bool)

(assert (=> b!322480 m!460757))

(assert (=> b!322480 m!460753))

(assert (=> b!322480 m!460749))

(assert (=> b!322480 m!460639))

(assert (=> b!322405 d!105836))

(declare-fun e!232378 () tuple2!23550)

(declare-fun b!322481 () Bool)

(assert (=> b!322481 (= e!232378 (tuple2!23551 (bvor (bvor acc!161 (ite (_1!13405 lt!445009) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13405 lt!445047) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!13405 lt!445047)))))

(declare-fun b!322482 () Bool)

(declare-fun lt!445232 () tuple2!23550)

(assert (=> b!322482 (= e!232378 (tuple2!23551 (_1!13404 lt!445232) (_2!13404 lt!445232)))))

(declare-fun lt!445229 () tuple2!23552)

(assert (=> b!322482 (= lt!445229 (readBit!0 (_2!13405 lt!445047)))))

(assert (=> b!322482 (= lt!445232 (readNBitsLSBFirstsLoop!0 (_2!13405 lt!445229) nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor (bvor (bvor acc!161 (ite (_1!13405 lt!445009) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13405 lt!445047) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13405 lt!445229) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!322483 () Bool)

(declare-fun res!264721 () Bool)

(declare-fun e!232379 () Bool)

(assert (=> b!322483 (=> (not res!264721) (not e!232379))))

(declare-fun lt!445231 () (_ BitVec 64))

(declare-fun lt!445233 () (_ BitVec 64))

(declare-fun lt!445230 () tuple2!23550)

(assert (=> b!322483 (= res!264721 (= (bitIndex!0 (size!8953 (buf!8095 (_2!13404 lt!445230))) (currentByte!14930 (_2!13404 lt!445230)) (currentBit!14925 (_2!13404 lt!445230))) (bvadd lt!445233 lt!445231)))))

(assert (=> b!322483 (or (not (= (bvand lt!445233 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445231 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!445233 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!445233 lt!445231) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322483 (= lt!445231 ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001))))))

(assert (=> b!322483 (or (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!322483 (= lt!445233 (bitIndex!0 (size!8953 (buf!8095 (_2!13405 lt!445047))) (currentByte!14930 (_2!13405 lt!445047)) (currentBit!14925 (_2!13405 lt!445047))))))

(declare-fun b!322484 () Bool)

(declare-fun res!264718 () Bool)

(assert (=> b!322484 (=> (not res!264718) (not e!232379))))

(assert (=> b!322484 (= res!264718 (= (bvand (_1!13404 lt!445230) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001))) (bvand (bvor (bvor acc!161 (ite (_1!13405 lt!445009) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13405 lt!445047) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001)))))))

(declare-fun d!105838 () Bool)

(assert (=> d!105838 e!232379))

(declare-fun res!264720 () Bool)

(assert (=> d!105838 (=> (not res!264720) (not e!232379))))

(assert (=> d!105838 (= res!264720 (= (buf!8095 (_2!13404 lt!445230)) (buf!8095 (_2!13405 lt!445047))))))

(assert (=> d!105838 (= lt!445230 e!232378)))

(declare-fun c!15423 () Bool)

(assert (=> d!105838 (= c!15423 (= nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001)))))

(assert (=> d!105838 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000))))

(assert (=> d!105838 (= (readNBitsLSBFirstsLoop!0 (_2!13405 lt!445047) nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) (bvor (bvor acc!161 (ite (_1!13405 lt!445009) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13405 lt!445047) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!445230)))

(declare-fun lt!445234 () (_ BitVec 64))

(declare-fun e!232377 () Bool)

(declare-fun b!322485 () Bool)

(assert (=> b!322485 (= e!232377 (= (= (bvand (bvlshr (_1!13404 lt!445230) lt!445234) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13410 (readBitPure!0 (_2!13405 lt!445047)))))))

(assert (=> b!322485 (and (bvsge lt!445234 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!445234 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!322485 (= lt!445234 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001)))))

(declare-fun b!322486 () Bool)

(declare-fun res!264717 () Bool)

(assert (=> b!322486 (=> (not res!264717) (not e!232379))))

(assert (=> b!322486 (= res!264717 (= (bvand (_1!13404 lt!445230) (onesLSBLong!0 nBits!548)) (_1!13404 lt!445230)))))

(declare-fun b!322487 () Bool)

(assert (=> b!322487 (= e!232379 e!232377)))

(declare-fun res!264719 () Bool)

(assert (=> b!322487 (=> res!264719 e!232377)))

(assert (=> b!322487 (= res!264719 (not (bvslt (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) nBits!548)))))

(assert (= (and d!105838 c!15423) b!322481))

(assert (= (and d!105838 (not c!15423)) b!322482))

(assert (= (and d!105838 res!264720) b!322483))

(assert (= (and b!322483 res!264721) b!322484))

(assert (= (and b!322484 res!264718) b!322486))

(assert (= (and b!322486 res!264717) b!322487))

(assert (= (and b!322487 (not res!264719)) b!322485))

(declare-fun m!460759 () Bool)

(assert (=> b!322485 m!460759))

(declare-fun m!460761 () Bool)

(assert (=> b!322484 m!460761))

(declare-fun m!460763 () Bool)

(assert (=> b!322482 m!460763))

(declare-fun m!460765 () Bool)

(assert (=> b!322482 m!460765))

(assert (=> b!322486 m!460635))

(declare-fun m!460767 () Bool)

(assert (=> b!322483 m!460767))

(declare-fun m!460769 () Bool)

(assert (=> b!322483 m!460769))

(assert (=> b!322405 d!105838))

(declare-fun d!105840 () Bool)

(declare-fun e!232382 () Bool)

(assert (=> d!105840 e!232382))

(declare-fun res!264727 () Bool)

(assert (=> d!105840 (=> (not res!264727) (not e!232382))))

(declare-fun lt!445247 () (_ BitVec 64))

(declare-fun lt!445249 () (_ BitVec 64))

(declare-fun lt!445252 () (_ BitVec 64))

(assert (=> d!105840 (= res!264727 (= lt!445249 (bvsub lt!445252 lt!445247)))))

(assert (=> d!105840 (or (= (bvand lt!445252 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445247 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!445252 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!445252 lt!445247) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105840 (= lt!445247 (remainingBits!0 ((_ sign_extend 32) (size!8953 (buf!8095 (_2!13411 (increaseBitIndex!0 thiss!1793))))) ((_ sign_extend 32) (currentByte!14930 (_2!13411 (increaseBitIndex!0 thiss!1793)))) ((_ sign_extend 32) (currentBit!14925 (_2!13411 (increaseBitIndex!0 thiss!1793))))))))

(declare-fun lt!445248 () (_ BitVec 64))

(declare-fun lt!445250 () (_ BitVec 64))

(assert (=> d!105840 (= lt!445252 (bvmul lt!445248 lt!445250))))

(assert (=> d!105840 (or (= lt!445248 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!445250 (bvsdiv (bvmul lt!445248 lt!445250) lt!445248)))))

(assert (=> d!105840 (= lt!445250 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105840 (= lt!445248 ((_ sign_extend 32) (size!8953 (buf!8095 (_2!13411 (increaseBitIndex!0 thiss!1793))))))))

(assert (=> d!105840 (= lt!445249 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14930 (_2!13411 (increaseBitIndex!0 thiss!1793)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14925 (_2!13411 (increaseBitIndex!0 thiss!1793))))))))

(assert (=> d!105840 (invariant!0 (currentBit!14925 (_2!13411 (increaseBitIndex!0 thiss!1793))) (currentByte!14930 (_2!13411 (increaseBitIndex!0 thiss!1793))) (size!8953 (buf!8095 (_2!13411 (increaseBitIndex!0 thiss!1793)))))))

(assert (=> d!105840 (= (bitIndex!0 (size!8953 (buf!8095 (_2!13411 (increaseBitIndex!0 thiss!1793)))) (currentByte!14930 (_2!13411 (increaseBitIndex!0 thiss!1793))) (currentBit!14925 (_2!13411 (increaseBitIndex!0 thiss!1793)))) lt!445249)))

(declare-fun b!322492 () Bool)

(declare-fun res!264726 () Bool)

(assert (=> b!322492 (=> (not res!264726) (not e!232382))))

(assert (=> b!322492 (= res!264726 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!445249))))

(declare-fun b!322493 () Bool)

(declare-fun lt!445251 () (_ BitVec 64))

(assert (=> b!322493 (= e!232382 (bvsle lt!445249 (bvmul lt!445251 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!322493 (or (= lt!445251 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!445251 #b0000000000000000000000000000000000000000000000000000000000001000) lt!445251)))))

(assert (=> b!322493 (= lt!445251 ((_ sign_extend 32) (size!8953 (buf!8095 (_2!13411 (increaseBitIndex!0 thiss!1793))))))))

(assert (= (and d!105840 res!264727) b!322492))

(assert (= (and b!322492 res!264726) b!322493))

(declare-fun m!460771 () Bool)

(assert (=> d!105840 m!460771))

(declare-fun m!460773 () Bool)

(assert (=> d!105840 m!460773))

(assert (=> b!322434 d!105840))

(assert (=> b!322434 d!105832))

(declare-fun d!105842 () Bool)

(declare-fun e!232383 () Bool)

(assert (=> d!105842 e!232383))

(declare-fun res!264729 () Bool)

(assert (=> d!105842 (=> (not res!264729) (not e!232383))))

(declare-fun lt!445255 () (_ BitVec 64))

(declare-fun lt!445253 () (_ BitVec 64))

(declare-fun lt!445258 () (_ BitVec 64))

(assert (=> d!105842 (= res!264729 (= lt!445255 (bvsub lt!445258 lt!445253)))))

(assert (=> d!105842 (or (= (bvand lt!445258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445253 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!445258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!445258 lt!445253) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105842 (= lt!445253 (remainingBits!0 ((_ sign_extend 32) (size!8953 (buf!8095 thiss!1793))) ((_ sign_extend 32) (currentByte!14930 thiss!1793)) ((_ sign_extend 32) (currentBit!14925 thiss!1793))))))

(declare-fun lt!445254 () (_ BitVec 64))

(declare-fun lt!445256 () (_ BitVec 64))

(assert (=> d!105842 (= lt!445258 (bvmul lt!445254 lt!445256))))

(assert (=> d!105842 (or (= lt!445254 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!445256 (bvsdiv (bvmul lt!445254 lt!445256) lt!445254)))))

(assert (=> d!105842 (= lt!445256 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105842 (= lt!445254 ((_ sign_extend 32) (size!8953 (buf!8095 thiss!1793))))))

(assert (=> d!105842 (= lt!445255 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14930 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14925 thiss!1793))))))

(assert (=> d!105842 (invariant!0 (currentBit!14925 thiss!1793) (currentByte!14930 thiss!1793) (size!8953 (buf!8095 thiss!1793)))))

(assert (=> d!105842 (= (bitIndex!0 (size!8953 (buf!8095 thiss!1793)) (currentByte!14930 thiss!1793) (currentBit!14925 thiss!1793)) lt!445255)))

(declare-fun b!322494 () Bool)

(declare-fun res!264728 () Bool)

(assert (=> b!322494 (=> (not res!264728) (not e!232383))))

(assert (=> b!322494 (= res!264728 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!445255))))

(declare-fun b!322495 () Bool)

(declare-fun lt!445257 () (_ BitVec 64))

(assert (=> b!322495 (= e!232383 (bvsle lt!445255 (bvmul lt!445257 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!322495 (or (= lt!445257 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!445257 #b0000000000000000000000000000000000000000000000000000000000001000) lt!445257)))))

(assert (=> b!322495 (= lt!445257 ((_ sign_extend 32) (size!8953 (buf!8095 thiss!1793))))))

(assert (= (and d!105842 res!264729) b!322494))

(assert (= (and b!322494 res!264728) b!322495))

(assert (=> d!105842 m!460667))

(assert (=> d!105842 m!460621))

(assert (=> b!322434 d!105842))

(declare-fun d!105844 () Bool)

(assert (=> d!105844 (= (remainingBits!0 ((_ sign_extend 32) (size!8953 (buf!8095 thiss!1793))) ((_ sign_extend 32) (currentByte!14930 thiss!1793)) ((_ sign_extend 32) (currentBit!14925 thiss!1793))) (bvsub (bvmul ((_ sign_extend 32) (size!8953 (buf!8095 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14930 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14925 thiss!1793)))))))

(assert (=> d!105794 d!105844))

(declare-fun d!105846 () Bool)

(declare-fun e!232384 () Bool)

(assert (=> d!105846 e!232384))

(declare-fun res!264731 () Bool)

(assert (=> d!105846 (=> (not res!264731) (not e!232384))))

(declare-fun lt!445264 () (_ BitVec 64))

(declare-fun lt!445261 () (_ BitVec 64))

(declare-fun lt!445259 () (_ BitVec 64))

(assert (=> d!105846 (= res!264731 (= lt!445261 (bvsub lt!445264 lt!445259)))))

(assert (=> d!105846 (or (= (bvand lt!445264 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445259 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!445264 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!445264 lt!445259) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105846 (= lt!445259 (remainingBits!0 ((_ sign_extend 32) (size!8953 (buf!8095 (_2!13404 lt!445048)))) ((_ sign_extend 32) (currentByte!14930 (_2!13404 lt!445048))) ((_ sign_extend 32) (currentBit!14925 (_2!13404 lt!445048)))))))

(declare-fun lt!445260 () (_ BitVec 64))

(declare-fun lt!445262 () (_ BitVec 64))

(assert (=> d!105846 (= lt!445264 (bvmul lt!445260 lt!445262))))

(assert (=> d!105846 (or (= lt!445260 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!445262 (bvsdiv (bvmul lt!445260 lt!445262) lt!445260)))))

(assert (=> d!105846 (= lt!445262 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105846 (= lt!445260 ((_ sign_extend 32) (size!8953 (buf!8095 (_2!13404 lt!445048)))))))

(assert (=> d!105846 (= lt!445261 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14930 (_2!13404 lt!445048))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14925 (_2!13404 lt!445048)))))))

(assert (=> d!105846 (invariant!0 (currentBit!14925 (_2!13404 lt!445048)) (currentByte!14930 (_2!13404 lt!445048)) (size!8953 (buf!8095 (_2!13404 lt!445048))))))

(assert (=> d!105846 (= (bitIndex!0 (size!8953 (buf!8095 (_2!13404 lt!445048))) (currentByte!14930 (_2!13404 lt!445048)) (currentBit!14925 (_2!13404 lt!445048))) lt!445261)))

(declare-fun b!322496 () Bool)

(declare-fun res!264730 () Bool)

(assert (=> b!322496 (=> (not res!264730) (not e!232384))))

(assert (=> b!322496 (= res!264730 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!445261))))

(declare-fun b!322497 () Bool)

(declare-fun lt!445263 () (_ BitVec 64))

(assert (=> b!322497 (= e!232384 (bvsle lt!445261 (bvmul lt!445263 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!322497 (or (= lt!445263 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!445263 #b0000000000000000000000000000000000000000000000000000000000001000) lt!445263)))))

(assert (=> b!322497 (= lt!445263 ((_ sign_extend 32) (size!8953 (buf!8095 (_2!13404 lt!445048)))))))

(assert (= (and d!105846 res!264731) b!322496))

(assert (= (and b!322496 res!264730) b!322497))

(declare-fun m!460775 () Bool)

(assert (=> d!105846 m!460775))

(declare-fun m!460777 () Bool)

(assert (=> d!105846 m!460777))

(assert (=> b!322406 d!105846))

(declare-fun d!105848 () Bool)

(declare-fun e!232385 () Bool)

(assert (=> d!105848 e!232385))

(declare-fun res!264733 () Bool)

(assert (=> d!105848 (=> (not res!264733) (not e!232385))))

(declare-fun lt!445270 () (_ BitVec 64))

(declare-fun lt!445267 () (_ BitVec 64))

(declare-fun lt!445265 () (_ BitVec 64))

(assert (=> d!105848 (= res!264733 (= lt!445267 (bvsub lt!445270 lt!445265)))))

(assert (=> d!105848 (or (= (bvand lt!445270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445265 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!445270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!445270 lt!445265) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105848 (= lt!445265 (remainingBits!0 ((_ sign_extend 32) (size!8953 (buf!8095 (_2!13405 lt!445009)))) ((_ sign_extend 32) (currentByte!14930 (_2!13405 lt!445009))) ((_ sign_extend 32) (currentBit!14925 (_2!13405 lt!445009)))))))

(declare-fun lt!445266 () (_ BitVec 64))

(declare-fun lt!445268 () (_ BitVec 64))

(assert (=> d!105848 (= lt!445270 (bvmul lt!445266 lt!445268))))

(assert (=> d!105848 (or (= lt!445266 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!445268 (bvsdiv (bvmul lt!445266 lt!445268) lt!445266)))))

(assert (=> d!105848 (= lt!445268 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105848 (= lt!445266 ((_ sign_extend 32) (size!8953 (buf!8095 (_2!13405 lt!445009)))))))

(assert (=> d!105848 (= lt!445267 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14930 (_2!13405 lt!445009))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14925 (_2!13405 lt!445009)))))))

(assert (=> d!105848 (invariant!0 (currentBit!14925 (_2!13405 lt!445009)) (currentByte!14930 (_2!13405 lt!445009)) (size!8953 (buf!8095 (_2!13405 lt!445009))))))

(assert (=> d!105848 (= (bitIndex!0 (size!8953 (buf!8095 (_2!13405 lt!445009))) (currentByte!14930 (_2!13405 lt!445009)) (currentBit!14925 (_2!13405 lt!445009))) lt!445267)))

(declare-fun b!322498 () Bool)

(declare-fun res!264732 () Bool)

(assert (=> b!322498 (=> (not res!264732) (not e!232385))))

(assert (=> b!322498 (= res!264732 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!445267))))

(declare-fun b!322499 () Bool)

(declare-fun lt!445269 () (_ BitVec 64))

(assert (=> b!322499 (= e!232385 (bvsle lt!445267 (bvmul lt!445269 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!322499 (or (= lt!445269 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!445269 #b0000000000000000000000000000000000000000000000000000000000001000) lt!445269)))))

(assert (=> b!322499 (= lt!445269 ((_ sign_extend 32) (size!8953 (buf!8095 (_2!13405 lt!445009)))))))

(assert (= (and d!105848 res!264733) b!322498))

(assert (= (and b!322498 res!264732) b!322499))

(declare-fun m!460779 () Bool)

(assert (=> d!105848 m!460779))

(declare-fun m!460781 () Bool)

(assert (=> d!105848 m!460781))

(assert (=> b!322406 d!105848))

(declare-fun d!105850 () Bool)

(assert (=> d!105850 (= (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!743)))))))

(assert (=> b!322407 d!105850))

(declare-fun d!105852 () Bool)

(declare-fun lt!445273 () tuple2!23552)

(assert (=> d!105852 (= lt!445273 (readBit!0 (_2!13405 lt!445009)))))

(assert (=> d!105852 (= (readBitPure!0 (_2!13405 lt!445009)) (tuple2!23563 (_2!13405 lt!445273) (_1!13405 lt!445273)))))

(declare-fun bs!27873 () Bool)

(assert (= bs!27873 d!105852))

(assert (=> bs!27873 m!460631))

(assert (=> b!322408 d!105852))

(declare-fun d!105854 () Bool)

(assert (=> d!105854 (= (onesLSBLong!0 nBits!548) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!548))))))

(assert (=> b!322409 d!105854))

(declare-fun d!105856 () Bool)

(assert (=> d!105856 (= (invariant!0 (currentBit!14925 thiss!1793) (currentByte!14930 thiss!1793) (size!8953 (buf!8095 thiss!1793))) (and (bvsge (currentBit!14925 thiss!1793) #b00000000000000000000000000000000) (bvslt (currentBit!14925 thiss!1793) #b00000000000000000000000000001000) (bvsge (currentByte!14930 thiss!1793) #b00000000000000000000000000000000) (or (bvslt (currentByte!14930 thiss!1793) (size!8953 (buf!8095 thiss!1793))) (and (= (currentBit!14925 thiss!1793) #b00000000000000000000000000000000) (= (currentByte!14930 thiss!1793) (size!8953 (buf!8095 thiss!1793)))))))))

(assert (=> d!105774 d!105856))

(push 1)

(assert (not b!322486))

(assert (not d!105840))

(assert (not b!322484))

(assert (not b!322480))

(assert (not d!105836))

(assert (not d!105852))

(assert (not d!105846))

(assert (not d!105842))

(assert (not b!322485))

(assert (not d!105832))

(assert (not b!322482))

(assert (not b!322483))

(assert (not d!105848))

(assert (not d!105834))

(assert (not b!322478))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

