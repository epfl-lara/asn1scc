; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50058 () Bool)

(assert start!50058)

(declare-fun b!235403 () Bool)

(declare-fun res!196818 () Bool)

(declare-fun e!162701 () Bool)

(assert (=> b!235403 (=> (not res!196818) (not e!162701))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-datatypes ((array!12387 0))(
  ( (array!12388 (arr!6429 (Array (_ BitVec 32) (_ BitVec 8))) (size!5442 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9848 0))(
  ( (BitStream!9849 (buf!5917 array!12387) (currentByte!11008 (_ BitVec 32)) (currentBit!11003 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9848)

(declare-fun i!546 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235403 (= res!196818 (validate_offset_bits!1 ((_ sign_extend 32) (size!5442 (buf!5917 bs!63))) ((_ sign_extend 32) (currentByte!11008 bs!63)) ((_ sign_extend 32) (currentBit!11003 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!235404 () Bool)

(declare-fun res!196815 () Bool)

(assert (=> b!235404 (=> (not res!196815) (not e!162701))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235404 (= res!196815 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!196817 () Bool)

(assert (=> start!50058 (=> (not res!196817) (not e!162701))))

(assert (=> start!50058 (= res!196817 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50058 e!162701))

(assert (=> start!50058 true))

(declare-fun e!162704 () Bool)

(declare-fun inv!12 (BitStream!9848) Bool)

(assert (=> start!50058 (and (inv!12 bs!63) e!162704)))

(declare-fun b!235405 () Bool)

(declare-fun array_inv!5183 (array!12387) Bool)

(assert (=> b!235405 (= e!162704 (array_inv!5183 (buf!5917 bs!63)))))

(declare-fun b!235406 () Bool)

(declare-fun e!162702 () (_ BitVec 64))

(assert (=> b!235406 (= e!162702 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))))))

(declare-fun b!235407 () Bool)

(declare-fun res!196816 () Bool)

(assert (=> b!235407 (=> (not res!196816) (not e!162701))))

(assert (=> b!235407 (= res!196816 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!235408 () Bool)

(assert (=> b!235408 (= e!162702 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!235409 () Bool)

(declare-datatypes ((tuple2!19900 0))(
  ( (tuple2!19901 (_1!10854 BitStream!9848) (_2!10854 (_ BitVec 64))) )
))
(declare-fun lt!370983 () tuple2!19900)

(declare-fun lt!370982 () tuple2!19900)

(assert (=> b!235409 (= e!162701 (or (not (= (_2!10854 lt!370983) (_2!10854 lt!370982))) (not (= (_1!10854 lt!370983) (_1!10854 lt!370982)))))))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19900)

(declare-fun withMovedBitIndex!0 (BitStream!9848 (_ BitVec 64)) BitStream!9848)

(assert (=> b!235409 (= lt!370982 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!274 (bvadd #b00000000000000000000000000000001 i!546) (bvor acc!118 e!162702)))))

(declare-fun c!11302 () Bool)

(declare-datatypes ((tuple2!19902 0))(
  ( (tuple2!19903 (_1!10855 BitStream!9848) (_2!10855 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!9848) tuple2!19902)

(assert (=> b!235409 (= c!11302 (_2!10855 (readBitPure!0 bs!63)))))

(assert (=> b!235409 (= lt!370983 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(assert (= (and start!50058 res!196817) b!235403))

(assert (= (and b!235403 res!196818) b!235404))

(assert (= (and b!235404 res!196815) b!235407))

(assert (= (and b!235407 res!196816) b!235409))

(assert (= (and b!235409 c!11302) b!235406))

(assert (= (and b!235409 (not c!11302)) b!235408))

(assert (= start!50058 b!235405))

(declare-fun m!358021 () Bool)

(assert (=> b!235409 m!358021))

(assert (=> b!235409 m!358021))

(declare-fun m!358023 () Bool)

(assert (=> b!235409 m!358023))

(declare-fun m!358025 () Bool)

(assert (=> b!235409 m!358025))

(declare-fun m!358027 () Bool)

(assert (=> b!235409 m!358027))

(declare-fun m!358029 () Bool)

(assert (=> start!50058 m!358029))

(declare-fun m!358031 () Bool)

(assert (=> b!235404 m!358031))

(declare-fun m!358033 () Bool)

(assert (=> b!235405 m!358033))

(declare-fun m!358035 () Bool)

(assert (=> b!235407 m!358035))

(declare-fun m!358037 () Bool)

(assert (=> b!235403 m!358037))

(push 1)

(assert (not b!235403))

(assert (not b!235409))

(assert (not start!50058))

(assert (not b!235407))

(assert (not b!235404))

(assert (not b!235405))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79364 () Bool)

(assert (=> d!79364 (= (onesLSBLong!0 (bvsub nBits!274 i!546)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!274 i!546)))))))

(assert (=> b!235404 d!79364))

(declare-fun d!79366 () Bool)

(assert (=> d!79366 (= (array_inv!5183 (buf!5917 bs!63)) (bvsge (size!5442 (buf!5917 bs!63)) #b00000000000000000000000000000000))))

(assert (=> b!235405 d!79366))

(declare-fun d!79368 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79368 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5442 (buf!5917 bs!63))) ((_ sign_extend 32) (currentByte!11008 bs!63)) ((_ sign_extend 32) (currentBit!11003 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5442 (buf!5917 bs!63))) ((_ sign_extend 32) (currentByte!11008 bs!63)) ((_ sign_extend 32) (currentBit!11003 bs!63))) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun bs!19807 () Bool)

(assert (= bs!19807 d!79368))

(declare-fun m!358059 () Bool)

(assert (=> bs!19807 m!358059))

(assert (=> b!235403 d!79368))

(declare-fun d!79370 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79370 (= (inv!12 bs!63) (invariant!0 (currentBit!11003 bs!63) (currentByte!11008 bs!63) (size!5442 (buf!5917 bs!63))))))

(declare-fun bs!19808 () Bool)

(assert (= bs!19808 d!79370))

(declare-fun m!358061 () Bool)

(assert (=> bs!19808 m!358061))

(assert (=> start!50058 d!79370))

(declare-fun d!79372 () Bool)

(declare-datatypes ((tuple2!19916 0))(
  ( (tuple2!19917 (_1!10862 (_ BitVec 64)) (_2!10862 BitStream!9848)) )
))
(declare-fun lt!371006 () tuple2!19916)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19916)

(assert (=> d!79372 (= lt!371006 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!274 (bvadd #b00000000000000000000000000000001 i!546) (bvor acc!118 e!162702)))))

(assert (=> d!79372 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!274 (bvadd #b00000000000000000000000000000001 i!546) (bvor acc!118 e!162702)) (tuple2!19901 (_2!10862 lt!371006) (_1!10862 lt!371006)))))

(declare-fun bs!19809 () Bool)

(assert (= bs!19809 d!79372))

(assert (=> bs!19809 m!358021))

(declare-fun m!358063 () Bool)

(assert (=> bs!19809 m!358063))

(assert (=> b!235409 d!79372))

(declare-fun d!79374 () Bool)

(declare-fun e!162713 () Bool)

(assert (=> d!79374 e!162713))

(declare-fun res!196827 () Bool)

(assert (=> d!79374 (=> (not res!196827) (not e!162713))))

(declare-fun lt!371018 () (_ BitVec 64))

(declare-fun lt!371017 () BitStream!9848)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!79374 (= res!196827 (= (bvadd lt!371018 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5442 (buf!5917 lt!371017)) (currentByte!11008 lt!371017) (currentBit!11003 lt!371017))))))

(assert (=> d!79374 (or (not (= (bvand lt!371018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371018 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79374 (= lt!371018 (bitIndex!0 (size!5442 (buf!5917 bs!63)) (currentByte!11008 bs!63) (currentBit!11003 bs!63)))))

(declare-datatypes ((Unit!17325 0))(
  ( (Unit!17326) )
))
(declare-datatypes ((tuple2!19918 0))(
  ( (tuple2!19919 (_1!10863 Unit!17325) (_2!10863 BitStream!9848)) )
))
(declare-fun moveBitIndex!0 (BitStream!9848 (_ BitVec 64)) tuple2!19918)

(assert (=> d!79374 (= lt!371017 (_2!10863 (moveBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!9848 (_ BitVec 64)) Bool)

(assert (=> d!79374 (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!79374 (= (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) lt!371017)))

(declare-fun b!235418 () Bool)

(assert (=> b!235418 (= e!162713 (= (size!5442 (buf!5917 bs!63)) (size!5442 (buf!5917 lt!371017))))))

(assert (= (and d!79374 res!196827) b!235418))

(declare-fun m!358081 () Bool)

(assert (=> d!79374 m!358081))

(declare-fun m!358083 () Bool)

(assert (=> d!79374 m!358083))

(declare-fun m!358085 () Bool)

(assert (=> d!79374 m!358085))

(declare-fun m!358087 () Bool)

(assert (=> d!79374 m!358087))

(assert (=> b!235409 d!79374))

(declare-fun d!79390 () Bool)

(declare-datatypes ((tuple2!19920 0))(
  ( (tuple2!19921 (_1!10864 Bool) (_2!10864 BitStream!9848)) )
))
(declare-fun lt!371021 () tuple2!19920)

(declare-fun readBit!0 (BitStream!9848) tuple2!19920)

(assert (=> d!79390 (= lt!371021 (readBit!0 bs!63))))

(assert (=> d!79390 (= (readBitPure!0 bs!63) (tuple2!19903 (_2!10864 lt!371021) (_1!10864 lt!371021)))))

(declare-fun bs!19814 () Bool)

(assert (= bs!19814 d!79390))

(declare-fun m!358089 () Bool)

(assert (=> bs!19814 m!358089))

(assert (=> b!235409 d!79390))

(declare-fun lt!371022 () tuple2!19916)

(declare-fun d!79392 () Bool)

(assert (=> d!79392 (= lt!371022 (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118))))

(assert (=> d!79392 (= (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118) (tuple2!19901 (_2!10862 lt!371022) (_1!10862 lt!371022)))))

(declare-fun bs!19815 () Bool)

(assert (= bs!19815 d!79392))

(declare-fun m!358091 () Bool)

(assert (=> bs!19815 m!358091))

(assert (=> b!235409 d!79392))

(declare-fun d!79394 () Bool)

(assert (=> d!79394 (= (onesLSBLong!0 nBits!274) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!274))))))

(assert (=> b!235407 d!79394))

(push 1)

(assert (not d!79372))

(assert (not d!79368))

(assert (not d!79374))

(assert (not d!79390))

(assert (not d!79392))

(assert (not d!79370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79418 () Bool)

(declare-fun e!162749 () Bool)

(assert (=> d!79418 e!162749))

(declare-fun res!196865 () Bool)

(assert (=> d!79418 (=> (not res!196865) (not e!162749))))

(declare-fun increaseBitIndex!0 (BitStream!9848) tuple2!19918)

(assert (=> d!79418 (= res!196865 (= (buf!5917 (_2!10863 (increaseBitIndex!0 bs!63))) (buf!5917 bs!63)))))

(declare-fun lt!371135 () Bool)

(assert (=> d!79418 (= lt!371135 (not (= (bvand ((_ sign_extend 24) (select (arr!6429 (buf!5917 bs!63)) (currentByte!11008 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11003 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371131 () tuple2!19920)

(assert (=> d!79418 (= lt!371131 (tuple2!19921 (not (= (bvand ((_ sign_extend 24) (select (arr!6429 (buf!5917 bs!63)) (currentByte!11008 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11003 bs!63)))) #b00000000000000000000000000000000)) (_2!10863 (increaseBitIndex!0 bs!63))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!79418 (validate_offset_bit!0 ((_ sign_extend 32) (size!5442 (buf!5917 bs!63))) ((_ sign_extend 32) (currentByte!11008 bs!63)) ((_ sign_extend 32) (currentBit!11003 bs!63)))))

(assert (=> d!79418 (= (readBit!0 bs!63) lt!371131)))

(declare-fun b!235463 () Bool)

(declare-fun lt!371130 () (_ BitVec 64))

(declare-fun lt!371134 () (_ BitVec 64))

(assert (=> b!235463 (= e!162749 (= (bitIndex!0 (size!5442 (buf!5917 (_2!10863 (increaseBitIndex!0 bs!63)))) (currentByte!11008 (_2!10863 (increaseBitIndex!0 bs!63))) (currentBit!11003 (_2!10863 (increaseBitIndex!0 bs!63)))) (bvadd lt!371130 lt!371134)))))

(assert (=> b!235463 (or (not (= (bvand lt!371130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371134 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371130 lt!371134) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235463 (= lt!371134 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!235463 (= lt!371130 (bitIndex!0 (size!5442 (buf!5917 bs!63)) (currentByte!11008 bs!63) (currentBit!11003 bs!63)))))

(declare-fun lt!371132 () Bool)

(assert (=> b!235463 (= lt!371132 (not (= (bvand ((_ sign_extend 24) (select (arr!6429 (buf!5917 bs!63)) (currentByte!11008 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11003 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371136 () Bool)

(assert (=> b!235463 (= lt!371136 (not (= (bvand ((_ sign_extend 24) (select (arr!6429 (buf!5917 bs!63)) (currentByte!11008 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11003 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371133 () Bool)

(assert (=> b!235463 (= lt!371133 (not (= (bvand ((_ sign_extend 24) (select (arr!6429 (buf!5917 bs!63)) (currentByte!11008 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11003 bs!63)))) #b00000000000000000000000000000000)))))

(assert (= (and d!79418 res!196865) b!235463))

(declare-fun m!358119 () Bool)

(assert (=> d!79418 m!358119))

(declare-fun m!358121 () Bool)

(assert (=> d!79418 m!358121))

(declare-fun m!358123 () Bool)

(assert (=> d!79418 m!358123))

(declare-fun m!358125 () Bool)

(assert (=> d!79418 m!358125))

(assert (=> b!235463 m!358121))

(assert (=> b!235463 m!358083))

(assert (=> b!235463 m!358119))

(declare-fun m!358127 () Bool)

(assert (=> b!235463 m!358127))

(assert (=> b!235463 m!358123))

(assert (=> d!79390 d!79418))

(declare-fun lt!371250 () tuple2!19916)

(declare-fun b!235524 () Bool)

(declare-fun lt!371248 () (_ BitVec 64))

(declare-fun e!162783 () Bool)

(assert (=> b!235524 (= e!162783 (= (= (bvand (bvlshr (_1!10862 lt!371250) lt!371248) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10855 (readBitPure!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!235524 (and (bvsge lt!371248 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371248 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!371253 () (_ BitVec 32))

(assert (=> b!235524 (= lt!371248 ((_ sign_extend 32) (bvsub lt!371253 (bvadd #b00000000000000000000000000000001 i!546))))))

(assert (=> b!235524 (or (= (bvand lt!371253 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546) #b10000000000000000000000000000000)) (= (bvand lt!371253 #b10000000000000000000000000000000) (bvand (bvsub lt!371253 (bvadd #b00000000000000000000000000000001 i!546)) #b10000000000000000000000000000000)))))

(assert (=> b!235524 (= lt!371253 (bvsub nBits!274 #b00000000000000000000000000000001))))

(assert (=> b!235524 (or (= (bvand nBits!274 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!235525 () Bool)

(declare-fun e!162782 () tuple2!19916)

(declare-fun lt!371249 () tuple2!19916)

(assert (=> b!235525 (= e!162782 (tuple2!19917 (_1!10862 lt!371249) (_2!10862 lt!371249)))))

(declare-fun lt!371246 () tuple2!19920)

(assert (=> b!235525 (= lt!371246 (readBit!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!235525 (= lt!371249 (readNLeastSignificantBitsLoop!0 (_2!10864 lt!371246) nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) (bvor (bvor acc!118 e!162702) (ite (_1!10864 lt!371246) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!546)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!79422 () Bool)

(declare-fun e!162784 () Bool)

(assert (=> d!79422 e!162784))

(declare-fun res!196915 () Bool)

(assert (=> d!79422 (=> (not res!196915) (not e!162784))))

(assert (=> d!79422 (= res!196915 (= (buf!5917 (_2!10862 lt!371250)) (buf!5917 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!79422 (= lt!371250 e!162782)))

(declare-fun c!11313 () Bool)

(assert (=> d!79422 (= c!11313 (= nBits!274 (bvadd #b00000000000000000000000000000001 i!546)))))

(assert (=> d!79422 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!546)) (bvsle (bvadd #b00000000000000000000000000000001 i!546) nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000))))

(assert (=> d!79422 (= (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!274 (bvadd #b00000000000000000000000000000001 i!546) (bvor acc!118 e!162702)) lt!371250)))

(declare-fun b!235526 () Bool)

(assert (=> b!235526 (= e!162782 (tuple2!19917 (bvor acc!118 e!162702) (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!235527 () Bool)

(declare-fun res!196912 () Bool)

(assert (=> b!235527 (=> (not res!196912) (not e!162784))))

(assert (=> b!235527 (= res!196912 (= (bvand (_1!10862 lt!371250) (onesLSBLong!0 nBits!274)) (_1!10862 lt!371250)))))

(declare-fun b!235528 () Bool)

(declare-fun res!196914 () Bool)

(assert (=> b!235528 (=> (not res!196914) (not e!162784))))

(declare-fun lt!371252 () (_ BitVec 64))

(declare-fun lt!371247 () (_ BitVec 64))

(assert (=> b!235528 (= res!196914 (= (bitIndex!0 (size!5442 (buf!5917 (_2!10862 lt!371250))) (currentByte!11008 (_2!10862 lt!371250)) (currentBit!11003 (_2!10862 lt!371250))) (bvadd lt!371247 lt!371252)))))

(assert (=> b!235528 (or (not (= (bvand lt!371247 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371252 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371247 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371247 lt!371252) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235528 (= lt!371252 ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546))))))

(assert (=> b!235528 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546)) #b10000000000000000000000000000000)))))

(assert (=> b!235528 (= lt!371247 (bitIndex!0 (size!5442 (buf!5917 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11008 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!11003 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!235529 () Bool)

(declare-fun res!196913 () Bool)

(assert (=> b!235529 (=> (not res!196913) (not e!162784))))

(declare-fun lt!371245 () (_ BitVec 64))

(declare-fun lt!371251 () (_ BitVec 64))

(assert (=> b!235529 (= res!196913 (= (bvlshr (_1!10862 lt!371250) lt!371251) (bvlshr (bvor acc!118 e!162702) lt!371245)))))

(assert (=> b!235529 (and (bvsge lt!371245 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371245 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235529 (= lt!371245 ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546))))))

(assert (=> b!235529 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546)) #b10000000000000000000000000000000)))))

(assert (=> b!235529 (and (bvsge lt!371251 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371251 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235529 (= lt!371251 ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546))))))

(assert (=> b!235529 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546)) #b10000000000000000000000000000000)))))

(declare-fun b!235530 () Bool)

(assert (=> b!235530 (= e!162784 e!162783)))

(declare-fun res!196916 () Bool)

(assert (=> b!235530 (=> res!196916 e!162783)))

(assert (=> b!235530 (= res!196916 (bvsge (bvadd #b00000000000000000000000000000001 i!546) nBits!274))))

(assert (= (and d!79422 c!11313) b!235526))

(assert (= (and d!79422 (not c!11313)) b!235525))

(assert (= (and d!79422 res!196915) b!235528))

(assert (= (and b!235528 res!196914) b!235529))

(assert (= (and b!235529 res!196913) b!235527))

(assert (= (and b!235527 res!196912) b!235530))

(assert (= (and b!235530 (not res!196916)) b!235524))

(assert (=> b!235524 m!358021))

(declare-fun m!358161 () Bool)

(assert (=> b!235524 m!358161))

(assert (=> b!235525 m!358021))

(declare-fun m!358163 () Bool)

(assert (=> b!235525 m!358163))

(declare-fun m!358165 () Bool)

(assert (=> b!235525 m!358165))

(assert (=> b!235527 m!358035))

(declare-fun m!358167 () Bool)

(assert (=> b!235528 m!358167))

(declare-fun m!358169 () Bool)

(assert (=> b!235528 m!358169))

(assert (=> d!79372 d!79422))

(declare-fun d!79438 () Bool)

(assert (=> d!79438 (= (invariant!0 (currentBit!11003 bs!63) (currentByte!11008 bs!63) (size!5442 (buf!5917 bs!63))) (and (bvsge (currentBit!11003 bs!63) #b00000000000000000000000000000000) (bvslt (currentBit!11003 bs!63) #b00000000000000000000000000001000) (bvsge (currentByte!11008 bs!63) #b00000000000000000000000000000000) (or (bvslt (currentByte!11008 bs!63) (size!5442 (buf!5917 bs!63))) (and (= (currentBit!11003 bs!63) #b00000000000000000000000000000000) (= (currentByte!11008 bs!63) (size!5442 (buf!5917 bs!63)))))))))

(assert (=> d!79370 d!79438))

(declare-fun d!79440 () Bool)

(assert (=> d!79440 (= (remainingBits!0 ((_ sign_extend 32) (size!5442 (buf!5917 bs!63))) ((_ sign_extend 32) (currentByte!11008 bs!63)) ((_ sign_extend 32) (currentBit!11003 bs!63))) (bvsub (bvmul ((_ sign_extend 32) (size!5442 (buf!5917 bs!63))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11008 bs!63)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11003 bs!63)))))))

(assert (=> d!79368 d!79440))

(declare-fun lt!371259 () tuple2!19916)

(declare-fun lt!371257 () (_ BitVec 64))

(declare-fun b!235531 () Bool)

(declare-fun e!162786 () Bool)

(assert (=> b!235531 (= e!162786 (= (= (bvand (bvlshr (_1!10862 lt!371259) lt!371257) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10855 (readBitPure!0 bs!63))))))

(assert (=> b!235531 (and (bvsge lt!371257 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371257 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!371262 () (_ BitVec 32))

(assert (=> b!235531 (= lt!371257 ((_ sign_extend 32) (bvsub lt!371262 i!546)))))

(assert (=> b!235531 (or (= (bvand lt!371262 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand lt!371262 #b10000000000000000000000000000000) (bvand (bvsub lt!371262 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!235531 (= lt!371262 (bvsub nBits!274 #b00000000000000000000000000000001))))

(assert (=> b!235531 (or (= (bvand nBits!274 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!235532 () Bool)

(declare-fun e!162785 () tuple2!19916)

(declare-fun lt!371258 () tuple2!19916)

(assert (=> b!235532 (= e!162785 (tuple2!19917 (_1!10862 lt!371258) (_2!10862 lt!371258)))))

(declare-fun lt!371255 () tuple2!19920)

(assert (=> b!235532 (= lt!371255 (readBit!0 bs!63))))

(assert (=> b!235532 (= lt!371258 (readNLeastSignificantBitsLoop!0 (_2!10864 lt!371255) nBits!274 (bvadd i!546 #b00000000000000000000000000000001) (bvor acc!118 (ite (_1!10864 lt!371255) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!79442 () Bool)

(declare-fun e!162787 () Bool)

(assert (=> d!79442 e!162787))

(declare-fun res!196920 () Bool)

(assert (=> d!79442 (=> (not res!196920) (not e!162787))))

(assert (=> d!79442 (= res!196920 (= (buf!5917 (_2!10862 lt!371259)) (buf!5917 bs!63)))))

(assert (=> d!79442 (= lt!371259 e!162785)))

(declare-fun c!11314 () Bool)

(assert (=> d!79442 (= c!11314 (= nBits!274 i!546))))

(assert (=> d!79442 (and (bvsle #b00000000000000000000000000000000 i!546) (bvsle i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000))))

(assert (=> d!79442 (= (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118) lt!371259)))

(declare-fun b!235533 () Bool)

(assert (=> b!235533 (= e!162785 (tuple2!19917 acc!118 bs!63))))

(declare-fun b!235534 () Bool)

(declare-fun res!196917 () Bool)

(assert (=> b!235534 (=> (not res!196917) (not e!162787))))

(assert (=> b!235534 (= res!196917 (= (bvand (_1!10862 lt!371259) (onesLSBLong!0 nBits!274)) (_1!10862 lt!371259)))))

(declare-fun b!235535 () Bool)

(declare-fun res!196919 () Bool)

(assert (=> b!235535 (=> (not res!196919) (not e!162787))))

(declare-fun lt!371256 () (_ BitVec 64))

(declare-fun lt!371261 () (_ BitVec 64))

(assert (=> b!235535 (= res!196919 (= (bitIndex!0 (size!5442 (buf!5917 (_2!10862 lt!371259))) (currentByte!11008 (_2!10862 lt!371259)) (currentBit!11003 (_2!10862 lt!371259))) (bvadd lt!371256 lt!371261)))))

(assert (=> b!235535 (or (not (= (bvand lt!371256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371261 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371256 lt!371261) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235535 (= lt!371261 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!235535 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!235535 (= lt!371256 (bitIndex!0 (size!5442 (buf!5917 bs!63)) (currentByte!11008 bs!63) (currentBit!11003 bs!63)))))

(declare-fun b!235536 () Bool)

(declare-fun res!196918 () Bool)

(assert (=> b!235536 (=> (not res!196918) (not e!162787))))

(declare-fun lt!371254 () (_ BitVec 64))

(declare-fun lt!371260 () (_ BitVec 64))

(assert (=> b!235536 (= res!196918 (= (bvlshr (_1!10862 lt!371259) lt!371260) (bvlshr acc!118 lt!371254)))))

(assert (=> b!235536 (and (bvsge lt!371254 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371254 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235536 (= lt!371254 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!235536 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!235536 (and (bvsge lt!371260 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371260 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235536 (= lt!371260 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!235536 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(declare-fun b!235537 () Bool)

(assert (=> b!235537 (= e!162787 e!162786)))

(declare-fun res!196921 () Bool)

(assert (=> b!235537 (=> res!196921 e!162786)))

(assert (=> b!235537 (= res!196921 (bvsge i!546 nBits!274))))

(assert (= (and d!79442 c!11314) b!235533))

(assert (= (and d!79442 (not c!11314)) b!235532))

(assert (= (and d!79442 res!196920) b!235535))

(assert (= (and b!235535 res!196919) b!235536))

(assert (= (and b!235536 res!196918) b!235534))

(assert (= (and b!235534 res!196917) b!235537))

(assert (= (and b!235537 (not res!196921)) b!235531))

(assert (=> b!235531 m!358025))

(assert (=> b!235532 m!358089))

(declare-fun m!358171 () Bool)

(assert (=> b!235532 m!358171))

(assert (=> b!235534 m!358035))

(declare-fun m!358173 () Bool)

(assert (=> b!235535 m!358173))

(assert (=> b!235535 m!358083))

(assert (=> d!79392 d!79442))

(declare-fun d!79444 () Bool)

(declare-fun e!162790 () Bool)

(assert (=> d!79444 e!162790))

(declare-fun res!196926 () Bool)

(assert (=> d!79444 (=> (not res!196926) (not e!162790))))

(declare-fun lt!371275 () (_ BitVec 64))

(declare-fun lt!371276 () (_ BitVec 64))

(declare-fun lt!371278 () (_ BitVec 64))

(assert (=> d!79444 (= res!196926 (= lt!371275 (bvsub lt!371278 lt!371276)))))

(assert (=> d!79444 (or (= (bvand lt!371278 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371276 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371278 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371278 lt!371276) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79444 (= lt!371276 (remainingBits!0 ((_ sign_extend 32) (size!5442 (buf!5917 lt!371017))) ((_ sign_extend 32) (currentByte!11008 lt!371017)) ((_ sign_extend 32) (currentBit!11003 lt!371017))))))

(declare-fun lt!371277 () (_ BitVec 64))

(declare-fun lt!371279 () (_ BitVec 64))

(assert (=> d!79444 (= lt!371278 (bvmul lt!371277 lt!371279))))

(assert (=> d!79444 (or (= lt!371277 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371279 (bvsdiv (bvmul lt!371277 lt!371279) lt!371277)))))

(assert (=> d!79444 (= lt!371279 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79444 (= lt!371277 ((_ sign_extend 32) (size!5442 (buf!5917 lt!371017))))))

(assert (=> d!79444 (= lt!371275 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11008 lt!371017)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11003 lt!371017))))))

(assert (=> d!79444 (invariant!0 (currentBit!11003 lt!371017) (currentByte!11008 lt!371017) (size!5442 (buf!5917 lt!371017)))))

(assert (=> d!79444 (= (bitIndex!0 (size!5442 (buf!5917 lt!371017)) (currentByte!11008 lt!371017) (currentBit!11003 lt!371017)) lt!371275)))

(declare-fun b!235542 () Bool)

(declare-fun res!196927 () Bool)

(assert (=> b!235542 (=> (not res!196927) (not e!162790))))

(assert (=> b!235542 (= res!196927 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371275))))

(declare-fun b!235543 () Bool)

(declare-fun lt!371280 () (_ BitVec 64))

(assert (=> b!235543 (= e!162790 (bvsle lt!371275 (bvmul lt!371280 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235543 (or (= lt!371280 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371280 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371280)))))

(assert (=> b!235543 (= lt!371280 ((_ sign_extend 32) (size!5442 (buf!5917 lt!371017))))))

(assert (= (and d!79444 res!196926) b!235542))

(assert (= (and b!235542 res!196927) b!235543))

(declare-fun m!358175 () Bool)

(assert (=> d!79444 m!358175))

(declare-fun m!358177 () Bool)

(assert (=> d!79444 m!358177))

(assert (=> d!79374 d!79444))

(declare-fun d!79446 () Bool)

(declare-fun e!162791 () Bool)

(assert (=> d!79446 e!162791))

(declare-fun res!196928 () Bool)

(assert (=> d!79446 (=> (not res!196928) (not e!162791))))

(declare-fun lt!371281 () (_ BitVec 64))

(declare-fun lt!371282 () (_ BitVec 64))

(declare-fun lt!371284 () (_ BitVec 64))

(assert (=> d!79446 (= res!196928 (= lt!371281 (bvsub lt!371284 lt!371282)))))

(assert (=> d!79446 (or (= (bvand lt!371284 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371282 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371284 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371284 lt!371282) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79446 (= lt!371282 (remainingBits!0 ((_ sign_extend 32) (size!5442 (buf!5917 bs!63))) ((_ sign_extend 32) (currentByte!11008 bs!63)) ((_ sign_extend 32) (currentBit!11003 bs!63))))))

(declare-fun lt!371283 () (_ BitVec 64))

(declare-fun lt!371285 () (_ BitVec 64))

(assert (=> d!79446 (= lt!371284 (bvmul lt!371283 lt!371285))))

(assert (=> d!79446 (or (= lt!371283 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371285 (bvsdiv (bvmul lt!371283 lt!371285) lt!371283)))))

(assert (=> d!79446 (= lt!371285 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79446 (= lt!371283 ((_ sign_extend 32) (size!5442 (buf!5917 bs!63))))))

(assert (=> d!79446 (= lt!371281 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11008 bs!63)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11003 bs!63))))))

(assert (=> d!79446 (invariant!0 (currentBit!11003 bs!63) (currentByte!11008 bs!63) (size!5442 (buf!5917 bs!63)))))

(assert (=> d!79446 (= (bitIndex!0 (size!5442 (buf!5917 bs!63)) (currentByte!11008 bs!63) (currentBit!11003 bs!63)) lt!371281)))

(declare-fun b!235544 () Bool)

(declare-fun res!196929 () Bool)

(assert (=> b!235544 (=> (not res!196929) (not e!162791))))

(assert (=> b!235544 (= res!196929 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371281))))

(declare-fun b!235545 () Bool)

(declare-fun lt!371286 () (_ BitVec 64))

(assert (=> b!235545 (= e!162791 (bvsle lt!371281 (bvmul lt!371286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235545 (or (= lt!371286 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371286 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371286)))))

(assert (=> b!235545 (= lt!371286 ((_ sign_extend 32) (size!5442 (buf!5917 bs!63))))))

(assert (= (and d!79446 res!196928) b!235544))

(assert (= (and b!235544 res!196929) b!235545))

(assert (=> d!79446 m!358059))

(assert (=> d!79446 m!358061))

(assert (=> d!79374 d!79446))

(declare-fun d!79448 () Bool)

(declare-fun lt!371325 () (_ BitVec 32))

(assert (=> d!79448 (= lt!371325 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!371323 () (_ BitVec 32))

(assert (=> d!79448 (= lt!371323 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!162806 () Bool)

(assert (=> d!79448 e!162806))

(declare-fun res!196944 () Bool)

(assert (=> d!79448 (=> (not res!196944) (not e!162806))))

(assert (=> d!79448 (= res!196944 (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!17339 () Unit!17325)

(declare-fun Unit!17340 () Unit!17325)

(declare-fun Unit!17341 () Unit!17325)

(assert (=> d!79448 (= (moveBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!11003 bs!63) lt!371325) #b00000000000000000000000000000000) (tuple2!19919 Unit!17339 (BitStream!9849 (buf!5917 bs!63) (bvsub (bvadd (currentByte!11008 bs!63) lt!371323) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!371325 (currentBit!11003 bs!63)))) (ite (bvsge (bvadd (currentBit!11003 bs!63) lt!371325) #b00000000000000000000000000001000) (tuple2!19919 Unit!17340 (BitStream!9849 (buf!5917 bs!63) (bvadd (currentByte!11008 bs!63) lt!371323 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!11003 bs!63) lt!371325) #b00000000000000000000000000001000))) (tuple2!19919 Unit!17341 (BitStream!9849 (buf!5917 bs!63) (bvadd (currentByte!11008 bs!63) lt!371323) (bvadd (currentBit!11003 bs!63) lt!371325))))))))

(declare-fun b!235560 () Bool)

(declare-fun e!162805 () Bool)

(assert (=> b!235560 (= e!162806 e!162805)))

(declare-fun res!196943 () Bool)

(assert (=> b!235560 (=> (not res!196943) (not e!162805))))

(declare-fun lt!371324 () (_ BitVec 64))

(declare-fun lt!371322 () tuple2!19918)

(assert (=> b!235560 (= res!196943 (= (bvadd lt!371324 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5442 (buf!5917 (_2!10863 lt!371322))) (currentByte!11008 (_2!10863 lt!371322)) (currentBit!11003 (_2!10863 lt!371322)))))))

(assert (=> b!235560 (or (not (= (bvand lt!371324 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371324 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371324 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235560 (= lt!371324 (bitIndex!0 (size!5442 (buf!5917 bs!63)) (currentByte!11008 bs!63) (currentBit!11003 bs!63)))))

(declare-fun lt!371320 () (_ BitVec 32))

(declare-fun lt!371321 () (_ BitVec 32))

(declare-fun Unit!17342 () Unit!17325)

(declare-fun Unit!17343 () Unit!17325)

(declare-fun Unit!17344 () Unit!17325)

(assert (=> b!235560 (= lt!371322 (ite (bvslt (bvadd (currentBit!11003 bs!63) lt!371320) #b00000000000000000000000000000000) (tuple2!19919 Unit!17342 (BitStream!9849 (buf!5917 bs!63) (bvsub (bvadd (currentByte!11008 bs!63) lt!371321) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!371320 (currentBit!11003 bs!63)))) (ite (bvsge (bvadd (currentBit!11003 bs!63) lt!371320) #b00000000000000000000000000001000) (tuple2!19919 Unit!17343 (BitStream!9849 (buf!5917 bs!63) (bvadd (currentByte!11008 bs!63) lt!371321 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!11003 bs!63) lt!371320) #b00000000000000000000000000001000))) (tuple2!19919 Unit!17344 (BitStream!9849 (buf!5917 bs!63) (bvadd (currentByte!11008 bs!63) lt!371321) (bvadd (currentBit!11003 bs!63) lt!371320))))))))

(assert (=> b!235560 (= lt!371320 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235560 (= lt!371321 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!235561 () Bool)

(assert (=> b!235561 (= e!162805 (and (= (size!5442 (buf!5917 bs!63)) (size!5442 (buf!5917 (_2!10863 lt!371322)))) (= (buf!5917 bs!63) (buf!5917 (_2!10863 lt!371322)))))))

(assert (= (and d!79448 res!196944) b!235560))

(assert (= (and b!235560 res!196943) b!235561))

(assert (=> d!79448 m!358087))

(declare-fun m!358181 () Bool)

(assert (=> b!235560 m!358181))

(assert (=> b!235560 m!358083))

(assert (=> d!79374 d!79448))

(declare-fun d!79454 () Bool)

(declare-fun res!196947 () Bool)

(declare-fun e!162809 () Bool)

(assert (=> d!79454 (=> (not res!196947) (not e!162809))))

(assert (=> d!79454 (= res!196947 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!5442 (buf!5917 bs!63)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5442 (buf!5917 bs!63)))))))))

(assert (=> d!79454 (= (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) e!162809)))

(declare-fun b!235565 () Bool)

(declare-fun lt!371328 () (_ BitVec 64))

(assert (=> b!235565 (= e!162809 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371328) (bvsle lt!371328 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5442 (buf!5917 bs!63)))))))))

(assert (=> b!235565 (= lt!371328 (bvadd (bitIndex!0 (size!5442 (buf!5917 bs!63)) (currentByte!11008 bs!63) (currentBit!11003 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!79454 res!196947) b!235565))

(assert (=> b!235565 m!358083))

(assert (=> d!79374 d!79454))

(push 1)

(assert (not b!235535))

(assert (not b!235527))

(assert (not b!235463))

(assert (not b!235524))

(assert (not b!235560))

(assert (not d!79446))

(assert (not b!235531))

(assert (not d!79448))

(assert (not b!235532))

(assert (not d!79444))

(assert (not d!79418))

(assert (not b!235528))

(assert (not b!235534))

(assert (not b!235565))

(assert (not b!235525))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79456 () Bool)

(declare-fun e!162810 () Bool)

(assert (=> d!79456 e!162810))

(declare-fun res!196948 () Bool)

(assert (=> d!79456 (=> (not res!196948) (not e!162810))))

(declare-fun lt!371330 () (_ BitVec 64))

(declare-fun lt!371332 () (_ BitVec 64))

(declare-fun lt!371329 () (_ BitVec 64))

(assert (=> d!79456 (= res!196948 (= lt!371329 (bvsub lt!371332 lt!371330)))))

(assert (=> d!79456 (or (= (bvand lt!371332 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371330 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371332 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371332 lt!371330) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79456 (= lt!371330 (remainingBits!0 ((_ sign_extend 32) (size!5442 (buf!5917 (_2!10863 (increaseBitIndex!0 bs!63))))) ((_ sign_extend 32) (currentByte!11008 (_2!10863 (increaseBitIndex!0 bs!63)))) ((_ sign_extend 32) (currentBit!11003 (_2!10863 (increaseBitIndex!0 bs!63))))))))

(declare-fun lt!371331 () (_ BitVec 64))

(declare-fun lt!371333 () (_ BitVec 64))

(assert (=> d!79456 (= lt!371332 (bvmul lt!371331 lt!371333))))

(assert (=> d!79456 (or (= lt!371331 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371333 (bvsdiv (bvmul lt!371331 lt!371333) lt!371331)))))

(assert (=> d!79456 (= lt!371333 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79456 (= lt!371331 ((_ sign_extend 32) (size!5442 (buf!5917 (_2!10863 (increaseBitIndex!0 bs!63))))))))

(assert (=> d!79456 (= lt!371329 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11008 (_2!10863 (increaseBitIndex!0 bs!63)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11003 (_2!10863 (increaseBitIndex!0 bs!63))))))))

(assert (=> d!79456 (invariant!0 (currentBit!11003 (_2!10863 (increaseBitIndex!0 bs!63))) (currentByte!11008 (_2!10863 (increaseBitIndex!0 bs!63))) (size!5442 (buf!5917 (_2!10863 (increaseBitIndex!0 bs!63)))))))

(assert (=> d!79456 (= (bitIndex!0 (size!5442 (buf!5917 (_2!10863 (increaseBitIndex!0 bs!63)))) (currentByte!11008 (_2!10863 (increaseBitIndex!0 bs!63))) (currentBit!11003 (_2!10863 (increaseBitIndex!0 bs!63)))) lt!371329)))

(declare-fun b!235566 () Bool)

(declare-fun res!196949 () Bool)

(assert (=> b!235566 (=> (not res!196949) (not e!162810))))

(assert (=> b!235566 (= res!196949 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371329))))

(declare-fun b!235567 () Bool)

(declare-fun lt!371334 () (_ BitVec 64))

(assert (=> b!235567 (= e!162810 (bvsle lt!371329 (bvmul lt!371334 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235567 (or (= lt!371334 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371334 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371334)))))

(assert (=> b!235567 (= lt!371334 ((_ sign_extend 32) (size!5442 (buf!5917 (_2!10863 (increaseBitIndex!0 bs!63))))))))

(assert (= (and d!79456 res!196948) b!235566))

(assert (= (and b!235566 res!196949) b!235567))

(declare-fun m!358183 () Bool)

(assert (=> d!79456 m!358183))

(declare-fun m!358185 () Bool)

(assert (=> d!79456 m!358185))

(assert (=> b!235463 d!79456))

(declare-fun d!79458 () Bool)

(declare-fun e!162813 () Bool)

(assert (=> d!79458 e!162813))

(declare-fun res!196954 () Bool)

(assert (=> d!79458 (=> (not res!196954) (not e!162813))))

(declare-fun lt!371348 () (_ BitVec 64))

(declare-fun lt!371349 () (_ BitVec 64))

(declare-fun lt!371347 () tuple2!19918)

(assert (=> d!79458 (= res!196954 (= (bvadd lt!371349 lt!371348) (bitIndex!0 (size!5442 (buf!5917 (_2!10863 lt!371347))) (currentByte!11008 (_2!10863 lt!371347)) (currentBit!11003 (_2!10863 lt!371347)))))))

(assert (=> d!79458 (or (not (= (bvand lt!371349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371348 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371349 lt!371348) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79458 (= lt!371348 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!79458 (= lt!371349 (bitIndex!0 (size!5442 (buf!5917 bs!63)) (currentByte!11008 bs!63) (currentBit!11003 bs!63)))))

(declare-fun Unit!17345 () Unit!17325)

(declare-fun Unit!17346 () Unit!17325)

(assert (=> d!79458 (= lt!371347 (ite (bvslt (currentBit!11003 bs!63) #b00000000000000000000000000000111) (tuple2!19919 Unit!17345 (BitStream!9849 (buf!5917 bs!63) (currentByte!11008 bs!63) (bvadd (currentBit!11003 bs!63) #b00000000000000000000000000000001))) (tuple2!19919 Unit!17346 (BitStream!9849 (buf!5917 bs!63) (bvadd (currentByte!11008 bs!63) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!79458 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!5442 (buf!5917 bs!63))) ((_ sign_extend 32) (currentByte!11008 bs!63)) ((_ sign_extend 32) (currentBit!11003 bs!63))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!79458 (= (increaseBitIndex!0 bs!63) lt!371347)))

(declare-fun b!235572 () Bool)

(declare-fun res!196955 () Bool)

(assert (=> b!235572 (=> (not res!196955) (not e!162813))))

(declare-fun lt!371345 () (_ BitVec 64))

(declare-fun lt!371346 () (_ BitVec 64))

(assert (=> b!235572 (= res!196955 (= (bvsub lt!371345 lt!371346) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!235572 (or (= (bvand lt!371345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371346 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371345 lt!371346) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235572 (= lt!371346 (remainingBits!0 ((_ sign_extend 32) (size!5442 (buf!5917 (_2!10863 lt!371347)))) ((_ sign_extend 32) (currentByte!11008 (_2!10863 lt!371347))) ((_ sign_extend 32) (currentBit!11003 (_2!10863 lt!371347)))))))

(assert (=> b!235572 (= lt!371345 (remainingBits!0 ((_ sign_extend 32) (size!5442 (buf!5917 bs!63))) ((_ sign_extend 32) (currentByte!11008 bs!63)) ((_ sign_extend 32) (currentBit!11003 bs!63))))))

(declare-fun b!235573 () Bool)

(assert (=> b!235573 (= e!162813 (= (size!5442 (buf!5917 bs!63)) (size!5442 (buf!5917 (_2!10863 lt!371347)))))))

(assert (= (and d!79458 res!196954) b!235572))

(assert (= (and b!235572 res!196955) b!235573))

(declare-fun m!358187 () Bool)

(assert (=> d!79458 m!358187))

(assert (=> d!79458 m!358083))

(assert (=> d!79458 m!358059))

(declare-fun m!358189 () Bool)

(assert (=> b!235572 m!358189))

(assert (=> b!235572 m!358059))

(assert (=> b!235463 d!79458))

(assert (=> b!235463 d!79446))

(assert (=> b!235527 d!79394))

(assert (=> d!79418 d!79458))

(declare-fun d!79460 () Bool)

(assert (=> d!79460 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5442 (buf!5917 bs!63))) ((_ sign_extend 32) (currentByte!11008 bs!63)) ((_ sign_extend 32) (currentBit!11003 bs!63))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5442 (buf!5917 bs!63))) ((_ sign_extend 32) (currentByte!11008 bs!63)) ((_ sign_extend 32) (currentBit!11003 bs!63))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!19816 () Bool)

(assert (= bs!19816 d!79460))

(assert (=> bs!19816 m!358059))

(assert (=> d!79418 d!79460))

(assert (=> b!235565 d!79446))

(declare-fun d!79462 () Bool)

(declare-fun e!162814 () Bool)

(assert (=> d!79462 e!162814))

(declare-fun res!196956 () Bool)

(assert (=> d!79462 (=> (not res!196956) (not e!162814))))

(declare-fun lt!371350 () (_ BitVec 64))

(declare-fun lt!371351 () (_ BitVec 64))

(declare-fun lt!371353 () (_ BitVec 64))

(assert (=> d!79462 (= res!196956 (= lt!371350 (bvsub lt!371353 lt!371351)))))

(assert (=> d!79462 (or (= (bvand lt!371353 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371351 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371353 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371353 lt!371351) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79462 (= lt!371351 (remainingBits!0 ((_ sign_extend 32) (size!5442 (buf!5917 (_2!10863 lt!371322)))) ((_ sign_extend 32) (currentByte!11008 (_2!10863 lt!371322))) ((_ sign_extend 32) (currentBit!11003 (_2!10863 lt!371322)))))))

(declare-fun lt!371352 () (_ BitVec 64))

(declare-fun lt!371354 () (_ BitVec 64))

(assert (=> d!79462 (= lt!371353 (bvmul lt!371352 lt!371354))))

(assert (=> d!79462 (or (= lt!371352 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371354 (bvsdiv (bvmul lt!371352 lt!371354) lt!371352)))))

(assert (=> d!79462 (= lt!371354 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79462 (= lt!371352 ((_ sign_extend 32) (size!5442 (buf!5917 (_2!10863 lt!371322)))))))

(assert (=> d!79462 (= lt!371350 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11008 (_2!10863 lt!371322))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11003 (_2!10863 lt!371322)))))))

(assert (=> d!79462 (invariant!0 (currentBit!11003 (_2!10863 lt!371322)) (currentByte!11008 (_2!10863 lt!371322)) (size!5442 (buf!5917 (_2!10863 lt!371322))))))

(assert (=> d!79462 (= (bitIndex!0 (size!5442 (buf!5917 (_2!10863 lt!371322))) (currentByte!11008 (_2!10863 lt!371322)) (currentBit!11003 (_2!10863 lt!371322))) lt!371350)))

(declare-fun b!235574 () Bool)

(declare-fun res!196957 () Bool)

(assert (=> b!235574 (=> (not res!196957) (not e!162814))))

(assert (=> b!235574 (= res!196957 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371350))))

(declare-fun b!235575 () Bool)

(declare-fun lt!371355 () (_ BitVec 64))

(assert (=> b!235575 (= e!162814 (bvsle lt!371350 (bvmul lt!371355 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235575 (or (= lt!371355 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371355 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371355)))))

(assert (=> b!235575 (= lt!371355 ((_ sign_extend 32) (size!5442 (buf!5917 (_2!10863 lt!371322)))))))

(assert (= (and d!79462 res!196956) b!235574))

(assert (= (and b!235574 res!196957) b!235575))

(declare-fun m!358191 () Bool)

(assert (=> d!79462 m!358191))

(declare-fun m!358193 () Bool)

(assert (=> d!79462 m!358193))

(assert (=> b!235560 d!79462))

(assert (=> b!235560 d!79446))

(declare-fun d!79464 () Bool)

(declare-fun e!162815 () Bool)

(assert (=> d!79464 e!162815))

(declare-fun res!196958 () Bool)

(assert (=> d!79464 (=> (not res!196958) (not e!162815))))

(declare-fun lt!371359 () (_ BitVec 64))

(declare-fun lt!371356 () (_ BitVec 64))

(declare-fun lt!371357 () (_ BitVec 64))

(assert (=> d!79464 (= res!196958 (= lt!371356 (bvsub lt!371359 lt!371357)))))

(assert (=> d!79464 (or (= (bvand lt!371359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371357 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371359 lt!371357) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79464 (= lt!371357 (remainingBits!0 ((_ sign_extend 32) (size!5442 (buf!5917 (_2!10862 lt!371250)))) ((_ sign_extend 32) (currentByte!11008 (_2!10862 lt!371250))) ((_ sign_extend 32) (currentBit!11003 (_2!10862 lt!371250)))))))

(declare-fun lt!371358 () (_ BitVec 64))

(declare-fun lt!371360 () (_ BitVec 64))

(assert (=> d!79464 (= lt!371359 (bvmul lt!371358 lt!371360))))

(assert (=> d!79464 (or (= lt!371358 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371360 (bvsdiv (bvmul lt!371358 lt!371360) lt!371358)))))

(assert (=> d!79464 (= lt!371360 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79464 (= lt!371358 ((_ sign_extend 32) (size!5442 (buf!5917 (_2!10862 lt!371250)))))))

(assert (=> d!79464 (= lt!371356 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11008 (_2!10862 lt!371250))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11003 (_2!10862 lt!371250)))))))

(assert (=> d!79464 (invariant!0 (currentBit!11003 (_2!10862 lt!371250)) (currentByte!11008 (_2!10862 lt!371250)) (size!5442 (buf!5917 (_2!10862 lt!371250))))))

(assert (=> d!79464 (= (bitIndex!0 (size!5442 (buf!5917 (_2!10862 lt!371250))) (currentByte!11008 (_2!10862 lt!371250)) (currentBit!11003 (_2!10862 lt!371250))) lt!371356)))

(declare-fun b!235576 () Bool)

(declare-fun res!196959 () Bool)

(assert (=> b!235576 (=> (not res!196959) (not e!162815))))

(assert (=> b!235576 (= res!196959 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371356))))

(declare-fun b!235577 () Bool)

(declare-fun lt!371361 () (_ BitVec 64))

(assert (=> b!235577 (= e!162815 (bvsle lt!371356 (bvmul lt!371361 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235577 (or (= lt!371361 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371361 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371361)))))

(assert (=> b!235577 (= lt!371361 ((_ sign_extend 32) (size!5442 (buf!5917 (_2!10862 lt!371250)))))))

(assert (= (and d!79464 res!196958) b!235576))

(assert (= (and b!235576 res!196959) b!235577))

(declare-fun m!358195 () Bool)

(assert (=> d!79464 m!358195))

(declare-fun m!358197 () Bool)

(assert (=> d!79464 m!358197))

(assert (=> b!235528 d!79464))

(declare-fun d!79466 () Bool)

(declare-fun e!162816 () Bool)

(assert (=> d!79466 e!162816))

(declare-fun res!196960 () Bool)

(assert (=> d!79466 (=> (not res!196960) (not e!162816))))

(declare-fun lt!371365 () (_ BitVec 64))

(declare-fun lt!371362 () (_ BitVec 64))

(declare-fun lt!371363 () (_ BitVec 64))

(assert (=> d!79466 (= res!196960 (= lt!371362 (bvsub lt!371365 lt!371363)))))

(assert (=> d!79466 (or (= (bvand lt!371365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371363 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371365 lt!371363) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79466 (= lt!371363 (remainingBits!0 ((_ sign_extend 32) (size!5442 (buf!5917 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 32) (currentByte!11008 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) ((_ sign_extend 32) (currentBit!11003 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(declare-fun lt!371364 () (_ BitVec 64))

(declare-fun lt!371366 () (_ BitVec 64))

(assert (=> d!79466 (= lt!371365 (bvmul lt!371364 lt!371366))))

(assert (=> d!79466 (or (= lt!371364 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371366 (bvsdiv (bvmul lt!371364 lt!371366) lt!371364)))))

(assert (=> d!79466 (= lt!371366 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79466 (= lt!371364 ((_ sign_extend 32) (size!5442 (buf!5917 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!79466 (= lt!371362 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11008 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11003 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!79466 (invariant!0 (currentBit!11003 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentByte!11008 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)) (size!5442 (buf!5917 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!79466 (= (bitIndex!0 (size!5442 (buf!5917 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11008 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!11003 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) lt!371362)))

(declare-fun b!235578 () Bool)

(declare-fun res!196961 () Bool)

(assert (=> b!235578 (=> (not res!196961) (not e!162816))))

(assert (=> b!235578 (= res!196961 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371362))))

(declare-fun b!235579 () Bool)

(declare-fun lt!371367 () (_ BitVec 64))

(assert (=> b!235579 (= e!162816 (bvsle lt!371362 (bvmul lt!371367 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235579 (or (= lt!371367 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371367 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371367)))))

(assert (=> b!235579 (= lt!371367 ((_ sign_extend 32) (size!5442 (buf!5917 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (= (and d!79466 res!196960) b!235578))

(assert (= (and b!235578 res!196961) b!235579))

(declare-fun m!358199 () Bool)

(assert (=> d!79466 m!358199))

(declare-fun m!358201 () Bool)

(assert (=> d!79466 m!358201))

(assert (=> b!235528 d!79466))

(declare-fun d!79468 () Bool)

(declare-fun e!162817 () Bool)

(assert (=> d!79468 e!162817))

(declare-fun res!196962 () Bool)

(assert (=> d!79468 (=> (not res!196962) (not e!162817))))

(declare-fun lt!371369 () (_ BitVec 64))

(declare-fun lt!371368 () (_ BitVec 64))

(declare-fun lt!371371 () (_ BitVec 64))

(assert (=> d!79468 (= res!196962 (= lt!371368 (bvsub lt!371371 lt!371369)))))

(assert (=> d!79468 (or (= (bvand lt!371371 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371369 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371371 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371371 lt!371369) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79468 (= lt!371369 (remainingBits!0 ((_ sign_extend 32) (size!5442 (buf!5917 (_2!10862 lt!371259)))) ((_ sign_extend 32) (currentByte!11008 (_2!10862 lt!371259))) ((_ sign_extend 32) (currentBit!11003 (_2!10862 lt!371259)))))))

(declare-fun lt!371370 () (_ BitVec 64))

(declare-fun lt!371372 () (_ BitVec 64))

(assert (=> d!79468 (= lt!371371 (bvmul lt!371370 lt!371372))))

(assert (=> d!79468 (or (= lt!371370 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371372 (bvsdiv (bvmul lt!371370 lt!371372) lt!371370)))))

(assert (=> d!79468 (= lt!371372 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79468 (= lt!371370 ((_ sign_extend 32) (size!5442 (buf!5917 (_2!10862 lt!371259)))))))

(assert (=> d!79468 (= lt!371368 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11008 (_2!10862 lt!371259))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11003 (_2!10862 lt!371259)))))))

(assert (=> d!79468 (invariant!0 (currentBit!11003 (_2!10862 lt!371259)) (currentByte!11008 (_2!10862 lt!371259)) (size!5442 (buf!5917 (_2!10862 lt!371259))))))

(assert (=> d!79468 (= (bitIndex!0 (size!5442 (buf!5917 (_2!10862 lt!371259))) (currentByte!11008 (_2!10862 lt!371259)) (currentBit!11003 (_2!10862 lt!371259))) lt!371368)))

(declare-fun b!235580 () Bool)

(declare-fun res!196963 () Bool)

(assert (=> b!235580 (=> (not res!196963) (not e!162817))))

(assert (=> b!235580 (= res!196963 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371368))))

(declare-fun b!235581 () Bool)

(declare-fun lt!371373 () (_ BitVec 64))

(assert (=> b!235581 (= e!162817 (bvsle lt!371368 (bvmul lt!371373 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235581 (or (= lt!371373 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371373 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371373)))))

(assert (=> b!235581 (= lt!371373 ((_ sign_extend 32) (size!5442 (buf!5917 (_2!10862 lt!371259)))))))

(assert (= (and d!79468 res!196962) b!235580))

(assert (= (and b!235580 res!196963) b!235581))

(declare-fun m!358203 () Bool)

(assert (=> d!79468 m!358203))

(declare-fun m!358205 () Bool)

(assert (=> d!79468 m!358205))

(assert (=> b!235535 d!79468))

(assert (=> b!235535 d!79446))

(assert (=> d!79448 d!79454))

(assert (=> d!79446 d!79440))

(assert (=> d!79446 d!79438))

(assert (=> b!235534 d!79394))

(declare-fun d!79470 () Bool)

(declare-fun e!162818 () Bool)

(assert (=> d!79470 e!162818))

(declare-fun res!196964 () Bool)

(assert (=> d!79470 (=> (not res!196964) (not e!162818))))

(assert (=> d!79470 (= res!196964 (= (buf!5917 (_2!10863 (increaseBitIndex!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) (buf!5917 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!371379 () Bool)

(assert (=> d!79470 (= lt!371379 (not (= (bvand ((_ sign_extend 24) (select (arr!6429 (buf!5917 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11008 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11003 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!371375 () tuple2!19920)

(assert (=> d!79470 (= lt!371375 (tuple2!19921 (not (= (bvand ((_ sign_extend 24) (select (arr!6429 (buf!5917 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11008 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11003 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)) (_2!10863 (increaseBitIndex!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!79470 (validate_offset_bit!0 ((_ sign_extend 32) (size!5442 (buf!5917 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 32) (currentByte!11008 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) ((_ sign_extend 32) (currentBit!11003 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!79470 (= (readBit!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!371375)))

(declare-fun b!235582 () Bool)

(declare-fun lt!371374 () (_ BitVec 64))

(declare-fun lt!371378 () (_ BitVec 64))

(assert (=> b!235582 (= e!162818 (= (bitIndex!0 (size!5442 (buf!5917 (_2!10863 (increaseBitIndex!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))) (currentByte!11008 (_2!10863 (increaseBitIndex!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) (currentBit!11003 (_2!10863 (increaseBitIndex!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))) (bvadd lt!371374 lt!371378)))))

(assert (=> b!235582 (or (not (= (bvand lt!371374 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371378 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371374 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371374 lt!371378) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235582 (= lt!371378 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!235582 (= lt!371374 (bitIndex!0 (size!5442 (buf!5917 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11008 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!11003 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!371376 () Bool)

(assert (=> b!235582 (= lt!371376 (not (= (bvand ((_ sign_extend 24) (select (arr!6429 (buf!5917 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11008 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11003 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!371380 () Bool)

(assert (=> b!235582 (= lt!371380 (not (= (bvand ((_ sign_extend 24) (select (arr!6429 (buf!5917 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11008 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11003 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!371377 () Bool)

(assert (=> b!235582 (= lt!371377 (not (= (bvand ((_ sign_extend 24) (select (arr!6429 (buf!5917 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11008 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11003 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(assert (= (and d!79470 res!196964) b!235582))

(assert (=> d!79470 m!358021))

(declare-fun m!358207 () Bool)

(assert (=> d!79470 m!358207))

(declare-fun m!358209 () Bool)

(assert (=> d!79470 m!358209))

(declare-fun m!358211 () Bool)

(assert (=> d!79470 m!358211))

(declare-fun m!358213 () Bool)

(assert (=> d!79470 m!358213))

(assert (=> b!235582 m!358209))

(assert (=> b!235582 m!358169))

(assert (=> b!235582 m!358021))

(assert (=> b!235582 m!358207))

(declare-fun m!358215 () Bool)

(assert (=> b!235582 m!358215))

(assert (=> b!235582 m!358211))

(assert (=> b!235525 d!79470))

(declare-fun lt!371386 () tuple2!19916)

(declare-fun e!162820 () Bool)

(declare-fun b!235583 () Bool)

(declare-fun lt!371384 () (_ BitVec 64))

(assert (=> b!235583 (= e!162820 (= (= (bvand (bvlshr (_1!10862 lt!371386) lt!371384) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10855 (readBitPure!0 (_2!10864 lt!371246)))))))

(assert (=> b!235583 (and (bvsge lt!371384 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371384 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!371389 () (_ BitVec 32))

(assert (=> b!235583 (= lt!371384 ((_ sign_extend 32) (bvsub lt!371389 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235583 (or (= (bvand lt!371389 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand lt!371389 #b10000000000000000000000000000000) (bvand (bvsub lt!371389 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!235583 (= lt!371389 (bvsub nBits!274 #b00000000000000000000000000000001))))

(assert (=> b!235583 (or (= (bvand nBits!274 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!235584 () Bool)

(declare-fun e!162819 () tuple2!19916)

(declare-fun lt!371385 () tuple2!19916)

(assert (=> b!235584 (= e!162819 (tuple2!19917 (_1!10862 lt!371385) (_2!10862 lt!371385)))))

(declare-fun lt!371382 () tuple2!19920)

(assert (=> b!235584 (= lt!371382 (readBit!0 (_2!10864 lt!371246)))))

(assert (=> b!235584 (= lt!371385 (readNLeastSignificantBitsLoop!0 (_2!10864 lt!371382) nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor (bvor (bvor acc!118 e!162702) (ite (_1!10864 lt!371246) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!546)))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10864 lt!371382) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!79472 () Bool)

(declare-fun e!162821 () Bool)

(assert (=> d!79472 e!162821))

(declare-fun res!196968 () Bool)

(assert (=> d!79472 (=> (not res!196968) (not e!162821))))

(assert (=> d!79472 (= res!196968 (= (buf!5917 (_2!10862 lt!371386)) (buf!5917 (_2!10864 lt!371246))))))

(assert (=> d!79472 (= lt!371386 e!162819)))

(declare-fun c!11315 () Bool)

(assert (=> d!79472 (= c!11315 (= nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001)))))

(assert (=> d!79472 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000))))

(assert (=> d!79472 (= (readNLeastSignificantBitsLoop!0 (_2!10864 lt!371246) nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) (bvor (bvor acc!118 e!162702) (ite (_1!10864 lt!371246) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!546)))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!371386)))

(declare-fun b!235585 () Bool)

(assert (=> b!235585 (= e!162819 (tuple2!19917 (bvor (bvor acc!118 e!162702) (ite (_1!10864 lt!371246) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!546)))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10864 lt!371246)))))

(declare-fun b!235586 () Bool)

(declare-fun res!196965 () Bool)

(assert (=> b!235586 (=> (not res!196965) (not e!162821))))

(assert (=> b!235586 (= res!196965 (= (bvand (_1!10862 lt!371386) (onesLSBLong!0 nBits!274)) (_1!10862 lt!371386)))))

(declare-fun b!235587 () Bool)

(declare-fun res!196967 () Bool)

(assert (=> b!235587 (=> (not res!196967) (not e!162821))))

(declare-fun lt!371383 () (_ BitVec 64))

(declare-fun lt!371388 () (_ BitVec 64))

(assert (=> b!235587 (= res!196967 (= (bitIndex!0 (size!5442 (buf!5917 (_2!10862 lt!371386))) (currentByte!11008 (_2!10862 lt!371386)) (currentBit!11003 (_2!10862 lt!371386))) (bvadd lt!371383 lt!371388)))))

(assert (=> b!235587 (or (not (= (bvand lt!371383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371388 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371383 lt!371388) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235587 (= lt!371388 ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235587 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!235587 (= lt!371383 (bitIndex!0 (size!5442 (buf!5917 (_2!10864 lt!371246))) (currentByte!11008 (_2!10864 lt!371246)) (currentBit!11003 (_2!10864 lt!371246))))))

(declare-fun b!235588 () Bool)

(declare-fun res!196966 () Bool)

(assert (=> b!235588 (=> (not res!196966) (not e!162821))))

(declare-fun lt!371381 () (_ BitVec 64))

(declare-fun lt!371387 () (_ BitVec 64))

(assert (=> b!235588 (= res!196966 (= (bvlshr (_1!10862 lt!371386) lt!371387) (bvlshr (bvor (bvor acc!118 e!162702) (ite (_1!10864 lt!371246) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!546)))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!371381)))))

(assert (=> b!235588 (and (bvsge lt!371381 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371381 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235588 (= lt!371381 ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235588 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!235588 (and (bvsge lt!371387 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371387 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235588 (= lt!371387 ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235588 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(declare-fun b!235589 () Bool)

(assert (=> b!235589 (= e!162821 e!162820)))

(declare-fun res!196969 () Bool)

(assert (=> b!235589 (=> res!196969 e!162820)))

(assert (=> b!235589 (= res!196969 (bvsge (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) nBits!274))))

(assert (= (and d!79472 c!11315) b!235585))

(assert (= (and d!79472 (not c!11315)) b!235584))

(assert (= (and d!79472 res!196968) b!235587))

(assert (= (and b!235587 res!196967) b!235588))

(assert (= (and b!235588 res!196966) b!235586))

(assert (= (and b!235586 res!196965) b!235589))

(assert (= (and b!235589 (not res!196969)) b!235583))

(declare-fun m!358217 () Bool)

(assert (=> b!235583 m!358217))

(declare-fun m!358219 () Bool)

(assert (=> b!235584 m!358219))

(declare-fun m!358221 () Bool)

(assert (=> b!235584 m!358221))

(assert (=> b!235586 m!358035))

(declare-fun m!358223 () Bool)

(assert (=> b!235587 m!358223))

(declare-fun m!358225 () Bool)

(assert (=> b!235587 m!358225))

(assert (=> b!235525 d!79472))

(declare-fun d!79474 () Bool)

(assert (=> d!79474 (= (remainingBits!0 ((_ sign_extend 32) (size!5442 (buf!5917 lt!371017))) ((_ sign_extend 32) (currentByte!11008 lt!371017)) ((_ sign_extend 32) (currentBit!11003 lt!371017))) (bvsub (bvmul ((_ sign_extend 32) (size!5442 (buf!5917 lt!371017))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11008 lt!371017)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11003 lt!371017)))))))

(assert (=> d!79444 d!79474))

(declare-fun d!79476 () Bool)

(assert (=> d!79476 (= (invariant!0 (currentBit!11003 lt!371017) (currentByte!11008 lt!371017) (size!5442 (buf!5917 lt!371017))) (and (bvsge (currentBit!11003 lt!371017) #b00000000000000000000000000000000) (bvslt (currentBit!11003 lt!371017) #b00000000000000000000000000001000) (bvsge (currentByte!11008 lt!371017) #b00000000000000000000000000000000) (or (bvslt (currentByte!11008 lt!371017) (size!5442 (buf!5917 lt!371017))) (and (= (currentBit!11003 lt!371017) #b00000000000000000000000000000000) (= (currentByte!11008 lt!371017) (size!5442 (buf!5917 lt!371017)))))))))

(assert (=> d!79444 d!79476))

(declare-fun d!79478 () Bool)

(declare-fun lt!371390 () tuple2!19920)

(assert (=> d!79478 (= lt!371390 (readBit!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!79478 (= (readBitPure!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)) (tuple2!19903 (_2!10864 lt!371390) (_1!10864 lt!371390)))))

(declare-fun bs!19817 () Bool)

(assert (= bs!19817 d!79478))

(assert (=> bs!19817 m!358021))

(assert (=> bs!19817 m!358163))

(assert (=> b!235524 d!79478))

(assert (=> b!235531 d!79390))

(assert (=> b!235532 d!79418))

(declare-fun lt!371394 () (_ BitVec 64))

(declare-fun e!162823 () Bool)

(declare-fun lt!371396 () tuple2!19916)

(declare-fun b!235590 () Bool)

(assert (=> b!235590 (= e!162823 (= (= (bvand (bvlshr (_1!10862 lt!371396) lt!371394) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10855 (readBitPure!0 (_2!10864 lt!371255)))))))

(assert (=> b!235590 (and (bvsge lt!371394 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371394 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!371399 () (_ BitVec 32))

(assert (=> b!235590 (= lt!371394 ((_ sign_extend 32) (bvsub lt!371399 (bvadd i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235590 (or (= (bvand lt!371399 #b10000000000000000000000000000000) (bvand (bvadd i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand lt!371399 #b10000000000000000000000000000000) (bvand (bvsub lt!371399 (bvadd i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!235590 (= lt!371399 (bvsub nBits!274 #b00000000000000000000000000000001))))

(assert (=> b!235590 (or (= (bvand nBits!274 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!235591 () Bool)

(declare-fun e!162822 () tuple2!19916)

(declare-fun lt!371395 () tuple2!19916)

(assert (=> b!235591 (= e!162822 (tuple2!19917 (_1!10862 lt!371395) (_2!10862 lt!371395)))))

(declare-fun lt!371392 () tuple2!19920)

(assert (=> b!235591 (= lt!371392 (readBit!0 (_2!10864 lt!371255)))))

(assert (=> b!235591 (= lt!371395 (readNLeastSignificantBitsLoop!0 (_2!10864 lt!371392) nBits!274 (bvadd i!546 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor (bvor acc!118 (ite (_1!10864 lt!371255) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10864 lt!371392) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) (bvadd i!546 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!79480 () Bool)

(declare-fun e!162824 () Bool)

(assert (=> d!79480 e!162824))

(declare-fun res!196973 () Bool)

(assert (=> d!79480 (=> (not res!196973) (not e!162824))))

(assert (=> d!79480 (= res!196973 (= (buf!5917 (_2!10862 lt!371396)) (buf!5917 (_2!10864 lt!371255))))))

(assert (=> d!79480 (= lt!371396 e!162822)))

(declare-fun c!11316 () Bool)

(assert (=> d!79480 (= c!11316 (= nBits!274 (bvadd i!546 #b00000000000000000000000000000001)))))

(assert (=> d!79480 (and (bvsle #b00000000000000000000000000000000 (bvadd i!546 #b00000000000000000000000000000001)) (bvsle (bvadd i!546 #b00000000000000000000000000000001) nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000))))

(assert (=> d!79480 (= (readNLeastSignificantBitsLoop!0 (_2!10864 lt!371255) nBits!274 (bvadd i!546 #b00000000000000000000000000000001) (bvor acc!118 (ite (_1!10864 lt!371255) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!371396)))

(declare-fun b!235592 () Bool)

(assert (=> b!235592 (= e!162822 (tuple2!19917 (bvor acc!118 (ite (_1!10864 lt!371255) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10864 lt!371255)))))

(declare-fun b!235593 () Bool)

(declare-fun res!196970 () Bool)

(assert (=> b!235593 (=> (not res!196970) (not e!162824))))

(assert (=> b!235593 (= res!196970 (= (bvand (_1!10862 lt!371396) (onesLSBLong!0 nBits!274)) (_1!10862 lt!371396)))))

(declare-fun b!235594 () Bool)

(declare-fun res!196972 () Bool)

(assert (=> b!235594 (=> (not res!196972) (not e!162824))))

(declare-fun lt!371393 () (_ BitVec 64))

(declare-fun lt!371398 () (_ BitVec 64))

(assert (=> b!235594 (= res!196972 (= (bitIndex!0 (size!5442 (buf!5917 (_2!10862 lt!371396))) (currentByte!11008 (_2!10862 lt!371396)) (currentBit!11003 (_2!10862 lt!371396))) (bvadd lt!371393 lt!371398)))))

(assert (=> b!235594 (or (not (= (bvand lt!371393 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371398 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371393 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371393 lt!371398) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235594 (= lt!371398 ((_ sign_extend 32) (bvsub nBits!274 (bvadd i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235594 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!235594 (= lt!371393 (bitIndex!0 (size!5442 (buf!5917 (_2!10864 lt!371255))) (currentByte!11008 (_2!10864 lt!371255)) (currentBit!11003 (_2!10864 lt!371255))))))

(declare-fun b!235595 () Bool)

(declare-fun res!196971 () Bool)

(assert (=> b!235595 (=> (not res!196971) (not e!162824))))

(declare-fun lt!371391 () (_ BitVec 64))

(declare-fun lt!371397 () (_ BitVec 64))

(assert (=> b!235595 (= res!196971 (= (bvlshr (_1!10862 lt!371396) lt!371397) (bvlshr (bvor acc!118 (ite (_1!10864 lt!371255) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!371391)))))

(assert (=> b!235595 (and (bvsge lt!371391 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371391 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235595 (= lt!371391 ((_ sign_extend 32) (bvsub nBits!274 (bvadd i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235595 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!235595 (and (bvsge lt!371397 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371397 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235595 (= lt!371397 ((_ sign_extend 32) (bvsub nBits!274 (bvadd i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235595 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(declare-fun b!235596 () Bool)

(assert (=> b!235596 (= e!162824 e!162823)))

(declare-fun res!196974 () Bool)

(assert (=> b!235596 (=> res!196974 e!162823)))

(assert (=> b!235596 (= res!196974 (bvsge (bvadd i!546 #b00000000000000000000000000000001) nBits!274))))

(assert (= (and d!79480 c!11316) b!235592))

(assert (= (and d!79480 (not c!11316)) b!235591))

(assert (= (and d!79480 res!196973) b!235594))

(assert (= (and b!235594 res!196972) b!235595))

(assert (= (and b!235595 res!196971) b!235593))

(assert (= (and b!235593 res!196970) b!235596))

(assert (= (and b!235596 (not res!196974)) b!235590))

(declare-fun m!358227 () Bool)

(assert (=> b!235590 m!358227))

(declare-fun m!358229 () Bool)

(assert (=> b!235591 m!358229))

(declare-fun m!358231 () Bool)

(assert (=> b!235591 m!358231))

(assert (=> b!235593 m!358035))

(declare-fun m!358233 () Bool)

(assert (=> b!235594 m!358233))

(declare-fun m!358235 () Bool)

(assert (=> b!235594 m!358235))

(assert (=> b!235532 d!79480))

(push 1)

(assert (not d!79470))

(assert (not b!235582))

(assert (not b!235594))

(assert (not b!235586))

(assert (not b!235572))

(assert (not b!235591))

(assert (not d!79466))

(assert (not b!235590))

(assert (not b!235583))

(assert (not d!79478))

(assert (not d!79460))

(assert (not b!235587))

(assert (not b!235593))

(assert (not d!79458))

(assert (not b!235584))

(assert (not d!79462))

(assert (not d!79464))

(assert (not d!79468))

(assert (not d!79456))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

