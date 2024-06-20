; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71794 () Bool)

(assert start!71794)

(declare-fun b!322213 () Bool)

(declare-fun res!264493 () Bool)

(declare-fun e!232195 () Bool)

(assert (=> b!322213 (=> (not res!264493) (not e!232195))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20556 0))(
  ( (array!20557 (arr!10040 (Array (_ BitVec 32) (_ BitVec 8))) (size!8948 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14058 0))(
  ( (BitStream!14059 (buf!8090 array!20556) (currentByte!14922 (_ BitVec 32)) (currentBit!14917 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14058)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322213 (= res!264493 (validate_offset_bits!1 ((_ sign_extend 32) (size!8948 (buf!8090 thiss!1793))) ((_ sign_extend 32) (currentByte!14922 thiss!1793)) ((_ sign_extend 32) (currentBit!14917 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!322214 () Bool)

(declare-fun res!264491 () Bool)

(assert (=> b!322214 (=> (not res!264491) (not e!232195))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322214 (= res!264491 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322215 () Bool)

(declare-fun e!232196 () Bool)

(declare-fun array_inv!8500 (array!20556) Bool)

(assert (=> b!322215 (= e!232196 (array_inv!8500 (buf!8090 thiss!1793)))))

(declare-fun res!264492 () Bool)

(assert (=> start!71794 (=> (not res!264492) (not e!232195))))

(assert (=> start!71794 (= res!264492 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71794 e!232195))

(assert (=> start!71794 true))

(declare-fun inv!12 (BitStream!14058) Bool)

(assert (=> start!71794 (and (inv!12 thiss!1793) e!232196)))

(declare-fun b!322216 () Bool)

(declare-datatypes ((tuple2!23534 0))(
  ( (tuple2!23535 (_1!13396 Bool) (_2!13396 BitStream!14058)) )
))
(declare-fun lt!444911 () tuple2!23534)

(declare-fun e!232194 () Bool)

(assert (=> b!322216 (= e!232194 (not (= (bvand (bvor acc!161 (ite (_1!13396 lt!444911) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!743)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322217 () Bool)

(declare-fun res!264495 () Bool)

(assert (=> b!322217 (=> (not res!264495) (not e!232194))))

(assert (=> b!322217 (= res!264495 (validate_offset_bits!1 ((_ sign_extend 32) (size!8948 (buf!8090 (_2!13396 lt!444911)))) ((_ sign_extend 32) (currentByte!14922 (_2!13396 lt!444911))) ((_ sign_extend 32) (currentBit!14917 (_2!13396 lt!444911))) ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun b!322218 () Bool)

(assert (=> b!322218 (= e!232195 e!232194)))

(declare-fun res!264496 () Bool)

(assert (=> b!322218 (=> (not res!264496) (not e!232194))))

(assert (=> b!322218 (= res!264496 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsle (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(declare-fun readBit!0 (BitStream!14058) tuple2!23534)

(assert (=> b!322218 (= lt!444911 (readBit!0 thiss!1793))))

(declare-fun b!322219 () Bool)

(declare-fun res!264494 () Bool)

(assert (=> b!322219 (=> (not res!264494) (not e!232195))))

(assert (=> b!322219 (= res!264494 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(assert (= (and start!71794 res!264492) b!322213))

(assert (= (and b!322213 res!264493) b!322214))

(assert (= (and b!322214 res!264491) b!322219))

(assert (= (and b!322219 res!264494) b!322218))

(assert (= (and b!322218 res!264496) b!322217))

(assert (= (and b!322217 res!264495) b!322216))

(assert (= start!71794 b!322215))

(declare-fun m!460451 () Bool)

(assert (=> b!322214 m!460451))

(declare-fun m!460453 () Bool)

(assert (=> b!322217 m!460453))

(declare-fun m!460455 () Bool)

(assert (=> b!322215 m!460455))

(declare-fun m!460457 () Bool)

(assert (=> b!322218 m!460457))

(declare-fun m!460459 () Bool)

(assert (=> start!71794 m!460459))

(declare-fun m!460461 () Bool)

(assert (=> b!322216 m!460461))

(declare-fun m!460463 () Bool)

(assert (=> b!322213 m!460463))

(check-sat (not b!322218) (not b!322213) (not b!322216) (not start!71794) (not b!322214) (not b!322215) (not b!322217))
(check-sat)
(get-model)

(declare-fun d!105718 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105718 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8948 (buf!8090 (_2!13396 lt!444911)))) ((_ sign_extend 32) (currentByte!14922 (_2!13396 lt!444911))) ((_ sign_extend 32) (currentBit!14917 (_2!13396 lt!444911))) ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8948 (buf!8090 (_2!13396 lt!444911)))) ((_ sign_extend 32) (currentByte!14922 (_2!13396 lt!444911))) ((_ sign_extend 32) (currentBit!14917 (_2!13396 lt!444911)))) ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun bs!27849 () Bool)

(assert (= bs!27849 d!105718))

(declare-fun m!460479 () Bool)

(assert (=> bs!27849 m!460479))

(assert (=> b!322217 d!105718))

(declare-fun d!105720 () Bool)

(assert (=> d!105720 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8948 (buf!8090 thiss!1793))) ((_ sign_extend 32) (currentByte!14922 thiss!1793)) ((_ sign_extend 32) (currentBit!14917 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8948 (buf!8090 thiss!1793))) ((_ sign_extend 32) (currentByte!14922 thiss!1793)) ((_ sign_extend 32) (currentBit!14917 thiss!1793))) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun bs!27850 () Bool)

(assert (= bs!27850 d!105720))

(declare-fun m!460481 () Bool)

(assert (=> bs!27850 m!460481))

(assert (=> b!322213 d!105720))

(declare-fun d!105722 () Bool)

(declare-fun e!232216 () Bool)

(assert (=> d!105722 e!232216))

(declare-fun res!264517 () Bool)

(assert (=> d!105722 (=> (not res!264517) (not e!232216))))

(declare-datatypes ((Unit!22010 0))(
  ( (Unit!22011) )
))
(declare-datatypes ((tuple2!23538 0))(
  ( (tuple2!23539 (_1!13398 Unit!22010) (_2!13398 BitStream!14058)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14058) tuple2!23538)

(assert (=> d!105722 (= res!264517 (= (buf!8090 (_2!13398 (increaseBitIndex!0 thiss!1793))) (buf!8090 thiss!1793)))))

(declare-fun lt!444934 () Bool)

(assert (=> d!105722 (= lt!444934 (not (= (bvand ((_ sign_extend 24) (select (arr!10040 (buf!8090 thiss!1793)) (currentByte!14922 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14917 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444935 () tuple2!23534)

(assert (=> d!105722 (= lt!444935 (tuple2!23535 (not (= (bvand ((_ sign_extend 24) (select (arr!10040 (buf!8090 thiss!1793)) (currentByte!14922 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14917 thiss!1793)))) #b00000000000000000000000000000000)) (_2!13398 (increaseBitIndex!0 thiss!1793))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!105722 (validate_offset_bit!0 ((_ sign_extend 32) (size!8948 (buf!8090 thiss!1793))) ((_ sign_extend 32) (currentByte!14922 thiss!1793)) ((_ sign_extend 32) (currentBit!14917 thiss!1793)))))

(assert (=> d!105722 (= (readBit!0 thiss!1793) lt!444935)))

(declare-fun lt!444932 () (_ BitVec 64))

(declare-fun b!322243 () Bool)

(declare-fun lt!444929 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322243 (= e!232216 (= (bitIndex!0 (size!8948 (buf!8090 (_2!13398 (increaseBitIndex!0 thiss!1793)))) (currentByte!14922 (_2!13398 (increaseBitIndex!0 thiss!1793))) (currentBit!14917 (_2!13398 (increaseBitIndex!0 thiss!1793)))) (bvadd lt!444929 lt!444932)))))

(assert (=> b!322243 (or (not (= (bvand lt!444929 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444932 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444929 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444929 lt!444932) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322243 (= lt!444932 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!322243 (= lt!444929 (bitIndex!0 (size!8948 (buf!8090 thiss!1793)) (currentByte!14922 thiss!1793) (currentBit!14917 thiss!1793)))))

(declare-fun lt!444931 () Bool)

(assert (=> b!322243 (= lt!444931 (not (= (bvand ((_ sign_extend 24) (select (arr!10040 (buf!8090 thiss!1793)) (currentByte!14922 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14917 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444933 () Bool)

(assert (=> b!322243 (= lt!444933 (not (= (bvand ((_ sign_extend 24) (select (arr!10040 (buf!8090 thiss!1793)) (currentByte!14922 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14917 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444930 () Bool)

(assert (=> b!322243 (= lt!444930 (not (= (bvand ((_ sign_extend 24) (select (arr!10040 (buf!8090 thiss!1793)) (currentByte!14922 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14917 thiss!1793)))) #b00000000000000000000000000000000)))))

(assert (= (and d!105722 res!264517) b!322243))

(declare-fun m!460489 () Bool)

(assert (=> d!105722 m!460489))

(declare-fun m!460491 () Bool)

(assert (=> d!105722 m!460491))

(declare-fun m!460493 () Bool)

(assert (=> d!105722 m!460493))

(declare-fun m!460495 () Bool)

(assert (=> d!105722 m!460495))

(assert (=> b!322243 m!460491))

(declare-fun m!460497 () Bool)

(assert (=> b!322243 m!460497))

(assert (=> b!322243 m!460489))

(assert (=> b!322243 m!460493))

(declare-fun m!460499 () Bool)

(assert (=> b!322243 m!460499))

(assert (=> b!322218 d!105722))

(declare-fun d!105738 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105738 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14917 thiss!1793) (currentByte!14922 thiss!1793) (size!8948 (buf!8090 thiss!1793))))))

(declare-fun bs!27854 () Bool)

(assert (= bs!27854 d!105738))

(declare-fun m!460501 () Bool)

(assert (=> bs!27854 m!460501))

(assert (=> start!71794 d!105738))

(declare-fun d!105744 () Bool)

(assert (=> d!105744 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!322214 d!105744))

(declare-fun d!105746 () Bool)

(assert (=> d!105746 (= (array_inv!8500 (buf!8090 thiss!1793)) (bvsge (size!8948 (buf!8090 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!322215 d!105746))

(declare-fun d!105748 () Bool)

(assert (=> d!105748 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!743))) (ite (= (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!743)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!743)))))))))

(assert (=> b!322216 d!105748))

(check-sat (not d!105722) (not b!322243) (not d!105720) (not d!105718) (not d!105738))
(check-sat)
