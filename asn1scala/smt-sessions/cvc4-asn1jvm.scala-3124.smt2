; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71796 () Bool)

(assert start!71796)

(declare-fun res!264514 () Bool)

(declare-fun e!232209 () Bool)

(assert (=> start!71796 (=> (not res!264514) (not e!232209))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!71796 (= res!264514 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71796 e!232209))

(assert (=> start!71796 true))

(declare-datatypes ((array!20558 0))(
  ( (array!20559 (arr!10041 (Array (_ BitVec 32) (_ BitVec 8))) (size!8949 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14060 0))(
  ( (BitStream!14061 (buf!8091 array!20558) (currentByte!14923 (_ BitVec 32)) (currentBit!14918 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14060)

(declare-fun e!232207 () Bool)

(declare-fun inv!12 (BitStream!14060) Bool)

(assert (=> start!71796 (and (inv!12 thiss!1793) e!232207)))

(declare-fun b!322234 () Bool)

(declare-fun res!264511 () Bool)

(assert (=> b!322234 (=> (not res!264511) (not e!232209))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322234 (= res!264511 (validate_offset_bits!1 ((_ sign_extend 32) (size!8949 (buf!8091 thiss!1793))) ((_ sign_extend 32) (currentByte!14923 thiss!1793)) ((_ sign_extend 32) (currentBit!14918 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!322235 () Bool)

(declare-fun array_inv!8501 (array!20558) Bool)

(assert (=> b!322235 (= e!232207 (array_inv!8501 (buf!8091 thiss!1793)))))

(declare-fun b!322236 () Bool)

(declare-fun e!232206 () Bool)

(assert (=> b!322236 (= e!232209 e!232206)))

(declare-fun res!264509 () Bool)

(assert (=> b!322236 (=> (not res!264509) (not e!232206))))

(assert (=> b!322236 (= res!264509 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsle (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(declare-datatypes ((tuple2!23536 0))(
  ( (tuple2!23537 (_1!13397 Bool) (_2!13397 BitStream!14060)) )
))
(declare-fun lt!444914 () tuple2!23536)

(declare-fun readBit!0 (BitStream!14060) tuple2!23536)

(assert (=> b!322236 (= lt!444914 (readBit!0 thiss!1793))))

(declare-fun b!322237 () Bool)

(declare-fun res!264512 () Bool)

(assert (=> b!322237 (=> (not res!264512) (not e!232206))))

(assert (=> b!322237 (= res!264512 (validate_offset_bits!1 ((_ sign_extend 32) (size!8949 (buf!8091 (_2!13397 lt!444914)))) ((_ sign_extend 32) (currentByte!14923 (_2!13397 lt!444914))) ((_ sign_extend 32) (currentBit!14918 (_2!13397 lt!444914))) ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun b!322238 () Bool)

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322238 (= e!232206 (not (= (bvand (bvor acc!161 (ite (_1!13397 lt!444914) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!743)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322239 () Bool)

(declare-fun res!264510 () Bool)

(assert (=> b!322239 (=> (not res!264510) (not e!232209))))

(assert (=> b!322239 (= res!264510 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322240 () Bool)

(declare-fun res!264513 () Bool)

(assert (=> b!322240 (=> (not res!264513) (not e!232209))))

(assert (=> b!322240 (= res!264513 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(assert (= (and start!71796 res!264514) b!322234))

(assert (= (and b!322234 res!264511) b!322239))

(assert (= (and b!322239 res!264510) b!322240))

(assert (= (and b!322240 res!264513) b!322236))

(assert (= (and b!322236 res!264509) b!322237))

(assert (= (and b!322237 res!264512) b!322238))

(assert (= start!71796 b!322235))

(declare-fun m!460465 () Bool)

(assert (=> b!322236 m!460465))

(declare-fun m!460467 () Bool)

(assert (=> b!322238 m!460467))

(declare-fun m!460469 () Bool)

(assert (=> start!71796 m!460469))

(declare-fun m!460471 () Bool)

(assert (=> b!322234 m!460471))

(declare-fun m!460473 () Bool)

(assert (=> b!322235 m!460473))

(declare-fun m!460475 () Bool)

(assert (=> b!322237 m!460475))

(declare-fun m!460477 () Bool)

(assert (=> b!322239 m!460477))

(push 1)

(assert (not b!322237))

(assert (not b!322234))

(assert (not b!322239))

(assert (not b!322238))

(assert (not b!322236))

(assert (not start!71796))

(assert (not b!322235))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105732 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105732 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14918 thiss!1793) (currentByte!14923 thiss!1793) (size!8949 (buf!8091 thiss!1793))))))

(declare-fun bs!27852 () Bool)

(assert (= bs!27852 d!105732))

(declare-fun m!460485 () Bool)

(assert (=> bs!27852 m!460485))

(assert (=> start!71796 d!105732))

(declare-fun d!105734 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105734 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8949 (buf!8091 thiss!1793))) ((_ sign_extend 32) (currentByte!14923 thiss!1793)) ((_ sign_extend 32) (currentBit!14918 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8949 (buf!8091 thiss!1793))) ((_ sign_extend 32) (currentByte!14923 thiss!1793)) ((_ sign_extend 32) (currentBit!14918 thiss!1793))) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun bs!27853 () Bool)

(assert (= bs!27853 d!105734))

(declare-fun m!460487 () Bool)

(assert (=> bs!27853 m!460487))

(assert (=> b!322234 d!105734))

(declare-fun d!105736 () Bool)

(assert (=> d!105736 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!322239 d!105736))

(declare-fun d!105740 () Bool)

(assert (=> d!105740 (= (array_inv!8501 (buf!8091 thiss!1793)) (bvsge (size!8949 (buf!8091 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!322235 d!105740))

(declare-fun d!105742 () Bool)

(declare-fun e!232230 () Bool)

(assert (=> d!105742 e!232230))

(declare-fun res!264523 () Bool)

(assert (=> d!105742 (=> (not res!264523) (not e!232230))))

(declare-datatypes ((Unit!22014 0))(
  ( (Unit!22015) )
))
(declare-datatypes ((tuple2!23542 0))(
  ( (tuple2!23543 (_1!13400 Unit!22014) (_2!13400 BitStream!14060)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14060) tuple2!23542)

(assert (=> d!105742 (= res!264523 (= (buf!8091 (_2!13400 (increaseBitIndex!0 thiss!1793))) (buf!8091 thiss!1793)))))

(declare-fun lt!444976 () Bool)

(assert (=> d!105742 (= lt!444976 (not (= (bvand ((_ sign_extend 24) (select (arr!10041 (buf!8091 thiss!1793)) (currentByte!14923 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14918 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444977 () tuple2!23536)

(assert (=> d!105742 (= lt!444977 (tuple2!23537 (not (= (bvand ((_ sign_extend 24) (select (arr!10041 (buf!8091 thiss!1793)) (currentByte!14923 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14918 thiss!1793)))) #b00000000000000000000000000000000)) (_2!13400 (increaseBitIndex!0 thiss!1793))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!105742 (validate_offset_bit!0 ((_ sign_extend 32) (size!8949 (buf!8091 thiss!1793))) ((_ sign_extend 32) (currentByte!14923 thiss!1793)) ((_ sign_extend 32) (currentBit!14918 thiss!1793)))))

(assert (=> d!105742 (= (readBit!0 thiss!1793) lt!444977)))

(declare-fun lt!444971 () (_ BitVec 64))

(declare-fun b!322249 () Bool)

(declare-fun lt!444975 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322249 (= e!232230 (= (bitIndex!0 (size!8949 (buf!8091 (_2!13400 (increaseBitIndex!0 thiss!1793)))) (currentByte!14923 (_2!13400 (increaseBitIndex!0 thiss!1793))) (currentBit!14918 (_2!13400 (increaseBitIndex!0 thiss!1793)))) (bvadd lt!444975 lt!444971)))))

(assert (=> b!322249 (or (not (= (bvand lt!444975 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444971 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444975 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444975 lt!444971) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322249 (= lt!444971 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!322249 (= lt!444975 (bitIndex!0 (size!8949 (buf!8091 thiss!1793)) (currentByte!14923 thiss!1793) (currentBit!14918 thiss!1793)))))

(declare-fun lt!444973 () Bool)

(assert (=> b!322249 (= lt!444973 (not (= (bvand ((_ sign_extend 24) (select (arr!10041 (buf!8091 thiss!1793)) (currentByte!14923 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14918 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444974 () Bool)

(assert (=> b!322249 (= lt!444974 (not (= (bvand ((_ sign_extend 24) (select (arr!10041 (buf!8091 thiss!1793)) (currentByte!14923 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14918 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444972 () Bool)

(assert (=> b!322249 (= lt!444972 (not (= (bvand ((_ sign_extend 24) (select (arr!10041 (buf!8091 thiss!1793)) (currentByte!14923 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14918 thiss!1793)))) #b00000000000000000000000000000000)))))

(assert (= (and d!105742 res!264523) b!322249))

(declare-fun m!460519 () Bool)

(assert (=> d!105742 m!460519))

(declare-fun m!460521 () Bool)

(assert (=> d!105742 m!460521))

(declare-fun m!460523 () Bool)

(assert (=> d!105742 m!460523))

(declare-fun m!460525 () Bool)

(assert (=> d!105742 m!460525))

(assert (=> b!322249 m!460521))

(assert (=> b!322249 m!460523))

(declare-fun m!460527 () Bool)

(assert (=> b!322249 m!460527))

(declare-fun m!460529 () Bool)

(assert (=> b!322249 m!460529))

(assert (=> b!322249 m!460519))

(assert (=> b!322236 d!105742))

(declare-fun d!105756 () Bool)

(assert (=> d!105756 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8949 (buf!8091 (_2!13397 lt!444914)))) ((_ sign_extend 32) (currentByte!14923 (_2!13397 lt!444914))) ((_ sign_extend 32) (currentBit!14918 (_2!13397 lt!444914))) ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8949 (buf!8091 (_2!13397 lt!444914)))) ((_ sign_extend 32) (currentByte!14923 (_2!13397 lt!444914))) ((_ sign_extend 32) (currentBit!14918 (_2!13397 lt!444914)))) ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun bs!27857 () Bool)

(assert (= bs!27857 d!105756))

(declare-fun m!460531 () Bool)

(assert (=> bs!27857 m!460531))

(assert (=> b!322237 d!105756))

(declare-fun d!105758 () Bool)

(assert (=> d!105758 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!743))) (ite (= (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!743)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!743)))))))))

(assert (=> b!322238 d!105758))

(push 1)

(assert (not d!105732))

(assert (not b!322249))

(assert (not d!105756))

(assert (not d!105742))

(assert (not d!105734))

(check-sat)

(pop 1)

(push 1)

(check-sat)

