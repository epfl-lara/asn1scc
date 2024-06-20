; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71918 () Bool)

(assert start!71918)

(declare-fun b!322538 () Bool)

(declare-fun res!264768 () Bool)

(declare-fun e!232410 () Bool)

(assert (=> b!322538 (=> (not res!264768) (not e!232410))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!322538 (= res!264768 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun res!264770 () Bool)

(assert (=> start!71918 (=> (not res!264770) (not e!232410))))

(assert (=> start!71918 (= res!264770 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71918 e!232410))

(assert (=> start!71918 true))

(declare-datatypes ((array!20578 0))(
  ( (array!20579 (arr!10048 (Array (_ BitVec 32) (_ BitVec 8))) (size!8956 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14074 0))(
  ( (BitStream!14075 (buf!8098 array!20578) (currentByte!14948 (_ BitVec 32)) (currentBit!14943 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14074)

(declare-fun e!232408 () Bool)

(declare-fun inv!12 (BitStream!14074) Bool)

(assert (=> start!71918 (and (inv!12 thiss!1793) e!232408)))

(declare-fun b!322539 () Bool)

(declare-fun res!264771 () Bool)

(assert (=> b!322539 (=> (not res!264771) (not e!232410))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322539 (= res!264771 (validate_offset_bits!1 ((_ sign_extend 32) (size!8956 (buf!8098 thiss!1793))) ((_ sign_extend 32) (currentByte!14948 thiss!1793)) ((_ sign_extend 32) (currentBit!14943 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!322540 () Bool)

(declare-fun array_inv!8508 (array!20578) Bool)

(assert (=> b!322540 (= e!232408 (array_inv!8508 (buf!8098 thiss!1793)))))

(declare-fun b!322541 () Bool)

(declare-fun e!232409 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!322541 (= e!232409 (not (invariant!0 (currentBit!14943 thiss!1793) (currentByte!14948 thiss!1793) (size!8956 (buf!8098 thiss!1793)))))))

(declare-fun b!322542 () Bool)

(assert (=> b!322542 (= e!232410 e!232409)))

(declare-fun res!264772 () Bool)

(assert (=> b!322542 (=> (not res!264772) (not e!232409))))

(declare-datatypes ((tuple2!23574 0))(
  ( (tuple2!23575 (_1!13416 Bool) (_2!13416 BitStream!14074)) )
))
(declare-fun lt!445343 () tuple2!23574)

(declare-datatypes ((tuple2!23576 0))(
  ( (tuple2!23577 (_1!13417 (_ BitVec 64)) (_2!13417 BitStream!14074)) )
))
(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14074 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23576)

(assert (=> b!322542 (= res!264772 (= (buf!8098 (_2!13417 (readNBitsLSBFirstsLoop!0 (_2!13416 lt!445343) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13416 lt!445343) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))) (buf!8098 thiss!1793)))))

(declare-fun readBit!0 (BitStream!14074) tuple2!23574)

(assert (=> b!322542 (= lt!445343 (readBit!0 thiss!1793))))

(declare-fun b!322543 () Bool)

(declare-fun res!264769 () Bool)

(assert (=> b!322543 (=> (not res!264769) (not e!232410))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322543 (= res!264769 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!71918 res!264770) b!322539))

(assert (= (and b!322539 res!264771) b!322543))

(assert (= (and b!322543 res!264769) b!322538))

(assert (= (and b!322538 res!264768) b!322542))

(assert (= (and b!322542 res!264772) b!322541))

(assert (= start!71918 b!322540))

(declare-fun m!460821 () Bool)

(assert (=> start!71918 m!460821))

(declare-fun m!460823 () Bool)

(assert (=> b!322542 m!460823))

(declare-fun m!460825 () Bool)

(assert (=> b!322542 m!460825))

(declare-fun m!460827 () Bool)

(assert (=> b!322539 m!460827))

(declare-fun m!460829 () Bool)

(assert (=> b!322540 m!460829))

(declare-fun m!460831 () Bool)

(assert (=> b!322543 m!460831))

(declare-fun m!460833 () Bool)

(assert (=> b!322541 m!460833))

(push 1)

(assert (not b!322539))

(assert (not start!71918))

(assert (not b!322542))

(assert (not b!322540))

(assert (not b!322543))

(assert (not b!322541))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105898 () Bool)

(assert (=> d!105898 (= (array_inv!8508 (buf!8098 thiss!1793)) (bvsge (size!8956 (buf!8098 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!322540 d!105898))

(declare-fun d!105900 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105900 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8956 (buf!8098 thiss!1793))) ((_ sign_extend 32) (currentByte!14948 thiss!1793)) ((_ sign_extend 32) (currentBit!14943 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8956 (buf!8098 thiss!1793))) ((_ sign_extend 32) (currentByte!14948 thiss!1793)) ((_ sign_extend 32) (currentBit!14943 thiss!1793))) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun bs!27881 () Bool)

(assert (= bs!27881 d!105900))

(declare-fun m!460865 () Bool)

(assert (=> bs!27881 m!460865))

(assert (=> b!322539 d!105900))

(declare-fun d!105902 () Bool)

(assert (=> d!105902 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!322543 d!105902))

(declare-fun d!105906 () Bool)

(assert (=> d!105906 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14943 thiss!1793) (currentByte!14948 thiss!1793) (size!8956 (buf!8098 thiss!1793))))))

(declare-fun bs!27882 () Bool)

(assert (= bs!27882 d!105906))

(assert (=> bs!27882 m!460833))

(assert (=> start!71918 d!105906))

(declare-fun b!322615 () Bool)

(declare-fun e!232450 () Bool)

(declare-fun e!232452 () Bool)

(assert (=> b!322615 (= e!232450 e!232452)))

(declare-fun res!264829 () Bool)

(assert (=> b!322615 (=> res!264829 e!232452)))

(assert (=> b!322615 (= res!264829 (not (bvslt (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(declare-fun lt!445382 () tuple2!23576)

(declare-fun lt!445380 () (_ BitVec 64))

(declare-fun b!322616 () Bool)

(declare-datatypes ((tuple2!23586 0))(
  ( (tuple2!23587 (_1!13422 BitStream!14074) (_2!13422 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!14074) tuple2!23586)

(assert (=> b!322616 (= e!232452 (= (= (bvand (bvlshr (_1!13417 lt!445382) lt!445380) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13422 (readBitPure!0 (_2!13416 lt!445343)))))))

(assert (=> b!322616 (and (bvsge lt!445380 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!445380 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!322616 (= lt!445380 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743)))))

(declare-fun d!105908 () Bool)

(assert (=> d!105908 e!232450))

(declare-fun res!264828 () Bool)

(assert (=> d!105908 (=> (not res!264828) (not e!232450))))

(assert (=> d!105908 (= res!264828 (= (buf!8098 (_2!13417 lt!445382)) (buf!8098 (_2!13416 lt!445343))))))

(declare-fun e!232451 () tuple2!23576)

(assert (=> d!105908 (= lt!445382 e!232451)))

(declare-fun c!15430 () Bool)

(assert (=> d!105908 (= c!15430 (= nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))

(assert (=> d!105908 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsle (bvadd #b00000000000000000000000000000001 i!743) nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000))))

(assert (=> d!105908 (= (readNBitsLSBFirstsLoop!0 (_2!13416 lt!445343) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13416 lt!445343) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!445382)))

(declare-fun b!322617 () Bool)

(assert (=> b!322617 (= e!232451 (tuple2!23577 (bvor acc!161 (ite (_1!13416 lt!445343) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!13416 lt!445343)))))

(declare-fun b!322618 () Bool)

(declare-fun res!264831 () Bool)

(assert (=> b!322618 (=> (not res!264831) (not e!232450))))

(declare-fun lt!445385 () (_ BitVec 64))

(declare-fun lt!445383 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322618 (= res!264831 (= (bitIndex!0 (size!8956 (buf!8098 (_2!13417 lt!445382))) (currentByte!14948 (_2!13417 lt!445382)) (currentBit!14943 (_2!13417 lt!445382))) (bvadd lt!445383 lt!445385)))))

(assert (=> b!322618 (or (not (= (bvand lt!445383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445385 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!445383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!445383 lt!445385) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322618 (= lt!445385 ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743))))))

(assert (=> b!322618 (or (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!743) #b10000000000000000000000000000000)) (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)) #b10000000000000000000000000000000)))))

(assert (=> b!322618 (= lt!445383 (bitIndex!0 (size!8956 (buf!8098 (_2!13416 lt!445343))) (currentByte!14948 (_2!13416 lt!445343)) (currentBit!14943 (_2!13416 lt!445343))))))

(declare-fun b!322619 () Bool)

(declare-fun lt!445384 () tuple2!23576)

(assert (=> b!322619 (= e!232451 (tuple2!23577 (_1!13417 lt!445384) (_2!13417 lt!445384)))))

(declare-fun lt!445381 () tuple2!23574)

(assert (=> b!322619 (= lt!445381 (readBit!0 (_2!13416 lt!445343)))))

(assert (=> b!322619 (= lt!445384 (readNBitsLSBFirstsLoop!0 (_2!13416 lt!445381) nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) (bvor (bvor acc!161 (ite (_1!13416 lt!445343) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13416 lt!445381) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!322620 () Bool)

(declare-fun res!264830 () Bool)

(assert (=> b!322620 (=> (not res!264830) (not e!232450))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322620 (= res!264830 (= (bvand (_1!13417 lt!445382) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743))) (bvand (bvor acc!161 (ite (_1!13416 lt!445343) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun b!322621 () Bool)

(declare-fun res!264832 () Bool)

(assert (=> b!322621 (=> (not res!264832) (not e!232450))))

(assert (=> b!322621 (= res!264832 (= (bvand (_1!13417 lt!445382) (onesLSBLong!0 nBits!548)) (_1!13417 lt!445382)))))

(assert (= (and d!105908 c!15430) b!322617))

(assert (= (and d!105908 (not c!15430)) b!322619))

(assert (= (and d!105908 res!264828) b!322618))

(assert (= (and b!322618 res!264831) b!322620))

(assert (= (and b!322620 res!264830) b!322621))

(assert (= (and b!322621 res!264832) b!322615))

(assert (= (and b!322615 (not res!264829)) b!322616))

(declare-fun m!460883 () Bool)

(assert (=> b!322616 m!460883))

(declare-fun m!460885 () Bool)

(assert (=> b!322621 m!460885))

(declare-fun m!460887 () Bool)

(assert (=> b!322619 m!460887))

(declare-fun m!460889 () Bool)

(assert (=> b!322619 m!460889))

(declare-fun m!460891 () Bool)

(assert (=> b!322618 m!460891))

(declare-fun m!460893 () Bool)

(assert (=> b!322618 m!460893))

(declare-fun m!460895 () Bool)

(assert (=> b!322620 m!460895))

(assert (=> b!322542 d!105908))

(declare-fun d!105922 () Bool)

(declare-fun e!232471 () Bool)

(assert (=> d!105922 e!232471))

(declare-fun res!264847 () Bool)

(assert (=> d!105922 (=> (not res!264847) (not e!232471))))

(declare-datatypes ((Unit!22028 0))(
  ( (Unit!22029) )
))
(declare-datatypes ((tuple2!23588 0))(
  ( (tuple2!23589 (_1!13423 Unit!22028) (_2!13423 BitStream!14074)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14074) tuple2!23588)

(assert (=> d!105922 (= res!264847 (= (buf!8098 (_2!13423 (increaseBitIndex!0 thiss!1793))) (buf!8098 thiss!1793)))))

(declare-fun lt!445425 () Bool)

(assert (=> d!105922 (= lt!445425 (not (= (bvand ((_ sign_extend 24) (select (arr!10048 (buf!8098 thiss!1793)) (currentByte!14948 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14943 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!445426 () tuple2!23574)

(assert (=> d!105922 (= lt!445426 (tuple2!23575 (not (= (bvand ((_ sign_extend 24) (select (arr!10048 (buf!8098 thiss!1793)) (currentByte!14948 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14943 thiss!1793)))) #b00000000000000000000000000000000)) (_2!13423 (increaseBitIndex!0 thiss!1793))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!105922 (validate_offset_bit!0 ((_ sign_extend 32) (size!8956 (buf!8098 thiss!1793))) ((_ sign_extend 32) (currentByte!14948 thiss!1793)) ((_ sign_extend 32) (currentBit!14943 thiss!1793)))))

(assert (=> d!105922 (= (readBit!0 thiss!1793) lt!445426)))

(declare-fun b!322640 () Bool)

(declare-fun lt!445422 () (_ BitVec 64))

(declare-fun lt!445428 () (_ BitVec 64))

(assert (=> b!322640 (= e!232471 (= (bitIndex!0 (size!8956 (buf!8098 (_2!13423 (increaseBitIndex!0 thiss!1793)))) (currentByte!14948 (_2!13423 (increaseBitIndex!0 thiss!1793))) (currentBit!14943 (_2!13423 (increaseBitIndex!0 thiss!1793)))) (bvadd lt!445422 lt!445428)))))

(assert (=> b!322640 (or (not (= (bvand lt!445422 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445428 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!445422 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!445422 lt!445428) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322640 (= lt!445428 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!322640 (= lt!445422 (bitIndex!0 (size!8956 (buf!8098 thiss!1793)) (currentByte!14948 thiss!1793) (currentBit!14943 thiss!1793)))))

(declare-fun lt!445423 () Bool)

(assert (=> b!322640 (= lt!445423 (not (= (bvand ((_ sign_extend 24) (select (arr!10048 (buf!8098 thiss!1793)) (currentByte!14948 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14943 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!445424 () Bool)

(assert (=> b!322640 (= lt!445424 (not (= (bvand ((_ sign_extend 24) (select (arr!10048 (buf!8098 thiss!1793)) (currentByte!14948 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14943 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!445427 () Bool)

(assert (=> b!322640 (= lt!445427 (not (= (bvand ((_ sign_extend 24) (select (arr!10048 (buf!8098 thiss!1793)) (currentByte!14948 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14943 thiss!1793)))) #b00000000000000000000000000000000)))))

(assert (= (and d!105922 res!264847) b!322640))

(declare-fun m!460897 () Bool)

(assert (=> d!105922 m!460897))

(declare-fun m!460899 () Bool)

(assert (=> d!105922 m!460899))

(declare-fun m!460901 () Bool)

(assert (=> d!105922 m!460901))

(declare-fun m!460903 () Bool)

(assert (=> d!105922 m!460903))

(declare-fun m!460905 () Bool)

(assert (=> b!322640 m!460905))

(assert (=> b!322640 m!460899))

(assert (=> b!322640 m!460901))

(declare-fun m!460907 () Bool)

(assert (=> b!322640 m!460907))

(assert (=> b!322640 m!460897))

(assert (=> b!322542 d!105922))

(declare-fun d!105924 () Bool)

(assert (=> d!105924 (= (invariant!0 (currentBit!14943 thiss!1793) (currentByte!14948 thiss!1793) (size!8956 (buf!8098 thiss!1793))) (and (bvsge (currentBit!14943 thiss!1793) #b00000000000000000000000000000000) (bvslt (currentBit!14943 thiss!1793) #b00000000000000000000000000001000) (bvsge (currentByte!14948 thiss!1793) #b00000000000000000000000000000000) (or (bvslt (currentByte!14948 thiss!1793) (size!8956 (buf!8098 thiss!1793))) (and (= (currentBit!14943 thiss!1793) #b00000000000000000000000000000000) (= (currentByte!14948 thiss!1793) (size!8956 (buf!8098 thiss!1793)))))))))

(assert (=> b!322541 d!105924))

(push 1)

(assert (not b!322616))

(assert (not b!322618))

(assert (not d!105906))

(assert (not b!322640))

(assert (not d!105922))

(assert (not b!322619))

(assert (not b!322620))

(assert (not d!105900))

(assert (not b!322621))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

