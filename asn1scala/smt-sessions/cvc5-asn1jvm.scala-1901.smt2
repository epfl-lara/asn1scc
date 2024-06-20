; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49736 () Bool)

(assert start!49736)

(declare-fun res!196110 () Bool)

(declare-fun e!162100 () Bool)

(assert (=> start!49736 (=> (not res!196110) (not e!162100))))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun nBits!274 () (_ BitVec 32))

(assert (=> start!49736 (= res!196110 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49736 e!162100))

(assert (=> start!49736 true))

(declare-datatypes ((array!12299 0))(
  ( (array!12300 (arr!6391 (Array (_ BitVec 32) (_ BitVec 8))) (size!5404 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9772 0))(
  ( (BitStream!9773 (buf!5879 array!12299) (currentByte!10940 (_ BitVec 32)) (currentBit!10935 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9772)

(declare-fun e!162099 () Bool)

(declare-fun inv!12 (BitStream!9772) Bool)

(assert (=> start!49736 (and (inv!12 bs!63) e!162099)))

(declare-fun b!234490 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!9772 (_ BitVec 64)) Bool)

(assert (=> b!234490 (= e!162100 (not (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((tuple2!19688 0))(
  ( (tuple2!19689 (_1!10748 BitStream!9772) (_2!10748 Bool)) )
))
(declare-fun lt!370052 () tuple2!19688)

(declare-fun readBitPure!0 (BitStream!9772) tuple2!19688)

(assert (=> b!234490 (= lt!370052 (readBitPure!0 bs!63))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-datatypes ((tuple2!19690 0))(
  ( (tuple2!19691 (_1!10749 BitStream!9772) (_2!10749 (_ BitVec 64))) )
))
(declare-fun lt!370053 () tuple2!19690)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9772 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19690)

(assert (=> b!234490 (= lt!370053 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!234491 () Bool)

(declare-fun array_inv!5145 (array!12299) Bool)

(assert (=> b!234491 (= e!162099 (array_inv!5145 (buf!5879 bs!63)))))

(declare-fun b!234492 () Bool)

(declare-fun res!196112 () Bool)

(assert (=> b!234492 (=> (not res!196112) (not e!162100))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234492 (= res!196112 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234493 () Bool)

(declare-fun res!196113 () Bool)

(assert (=> b!234493 (=> (not res!196113) (not e!162100))))

(assert (=> b!234493 (= res!196113 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!234494 () Bool)

(declare-fun res!196111 () Bool)

(assert (=> b!234494 (=> (not res!196111) (not e!162100))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234494 (= res!196111 (validate_offset_bits!1 ((_ sign_extend 32) (size!5404 (buf!5879 bs!63))) ((_ sign_extend 32) (currentByte!10940 bs!63)) ((_ sign_extend 32) (currentBit!10935 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(assert (= (and start!49736 res!196110) b!234494))

(assert (= (and b!234494 res!196111) b!234492))

(assert (= (and b!234492 res!196112) b!234493))

(assert (= (and b!234493 res!196113) b!234490))

(assert (= start!49736 b!234491))

(declare-fun m!357103 () Bool)

(assert (=> b!234493 m!357103))

(declare-fun m!357105 () Bool)

(assert (=> start!49736 m!357105))

(declare-fun m!357107 () Bool)

(assert (=> b!234494 m!357107))

(declare-fun m!357109 () Bool)

(assert (=> b!234492 m!357109))

(declare-fun m!357111 () Bool)

(assert (=> b!234491 m!357111))

(declare-fun m!357113 () Bool)

(assert (=> b!234490 m!357113))

(declare-fun m!357115 () Bool)

(assert (=> b!234490 m!357115))

(declare-fun m!357117 () Bool)

(assert (=> b!234490 m!357117))

(push 1)

(assert (not start!49736))

(assert (not b!234490))

(assert (not b!234494))

(assert (not b!234491))

(assert (not b!234493))

(assert (not b!234492))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79008 () Bool)

(assert (=> d!79008 (= (onesLSBLong!0 (bvsub nBits!274 i!546)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!274 i!546)))))))

(assert (=> b!234492 d!79008))

(declare-fun d!79010 () Bool)

(assert (=> d!79010 (= (array_inv!5145 (buf!5879 bs!63)) (bvsge (size!5404 (buf!5879 bs!63)) #b00000000000000000000000000000000))))

(assert (=> b!234491 d!79010))

(declare-fun d!79014 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79014 (= (inv!12 bs!63) (invariant!0 (currentBit!10935 bs!63) (currentByte!10940 bs!63) (size!5404 (buf!5879 bs!63))))))

(declare-fun bs!19706 () Bool)

(assert (= bs!19706 d!79014))

(declare-fun m!357153 () Bool)

(assert (=> bs!19706 m!357153))

(assert (=> start!49736 d!79014))

(declare-fun d!79016 () Bool)

(declare-fun res!196143 () Bool)

(declare-fun e!162125 () Bool)

(assert (=> d!79016 (=> (not res!196143) (not e!162125))))

(assert (=> d!79016 (= res!196143 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!5404 (buf!5879 bs!63)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5404 (buf!5879 bs!63)))))))))

(assert (=> d!79016 (= (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) e!162125)))

(declare-fun b!234532 () Bool)

(declare-fun lt!370071 () (_ BitVec 64))

(assert (=> b!234532 (= e!162125 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!370071) (bvsle lt!370071 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5404 (buf!5879 bs!63)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234532 (= lt!370071 (bvadd (bitIndex!0 (size!5404 (buf!5879 bs!63)) (currentByte!10940 bs!63) (currentBit!10935 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!79016 res!196143) b!234532))

(declare-fun m!357159 () Bool)

(assert (=> b!234532 m!357159))

(assert (=> b!234490 d!79016))

(declare-fun d!79028 () Bool)

(declare-datatypes ((tuple2!19700 0))(
  ( (tuple2!19701 (_1!10754 Bool) (_2!10754 BitStream!9772)) )
))
(declare-fun lt!370077 () tuple2!19700)

(declare-fun readBit!0 (BitStream!9772) tuple2!19700)

(assert (=> d!79028 (= lt!370077 (readBit!0 bs!63))))

(assert (=> d!79028 (= (readBitPure!0 bs!63) (tuple2!19689 (_2!10754 lt!370077) (_1!10754 lt!370077)))))

(declare-fun bs!19710 () Bool)

(assert (= bs!19710 d!79028))

(declare-fun m!357165 () Bool)

(assert (=> bs!19710 m!357165))

(assert (=> b!234490 d!79028))

(declare-fun d!79036 () Bool)

(declare-datatypes ((tuple2!19704 0))(
  ( (tuple2!19705 (_1!10756 (_ BitVec 64)) (_2!10756 BitStream!9772)) )
))
(declare-fun lt!370085 () tuple2!19704)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9772 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19704)

(assert (=> d!79036 (= lt!370085 (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118))))

(assert (=> d!79036 (= (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118) (tuple2!19691 (_2!10756 lt!370085) (_1!10756 lt!370085)))))

(declare-fun bs!19713 () Bool)

(assert (= bs!19713 d!79036))

(declare-fun m!357171 () Bool)

(assert (=> bs!19713 m!357171))

(assert (=> b!234490 d!79036))

(declare-fun d!79044 () Bool)

(assert (=> d!79044 (= (onesLSBLong!0 nBits!274) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!274))))))

(assert (=> b!234493 d!79044))

(declare-fun d!79046 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79046 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5404 (buf!5879 bs!63))) ((_ sign_extend 32) (currentByte!10940 bs!63)) ((_ sign_extend 32) (currentBit!10935 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5404 (buf!5879 bs!63))) ((_ sign_extend 32) (currentByte!10940 bs!63)) ((_ sign_extend 32) (currentBit!10935 bs!63))) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun bs!19714 () Bool)

(assert (= bs!19714 d!79046))

(declare-fun m!357175 () Bool)

(assert (=> bs!19714 m!357175))

(assert (=> b!234494 d!79046))

(push 1)

(assert (not d!79036))

(assert (not b!234532))

(assert (not d!79028))

(assert (not d!79046))

(assert (not d!79014))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79056 () Bool)

(declare-fun e!162145 () Bool)

(assert (=> d!79056 e!162145))

(declare-fun res!196158 () Bool)

(assert (=> d!79056 (=> (not res!196158) (not e!162145))))

(declare-datatypes ((Unit!17281 0))(
  ( (Unit!17282) )
))
(declare-datatypes ((tuple2!19714 0))(
  ( (tuple2!19715 (_1!10761 Unit!17281) (_2!10761 BitStream!9772)) )
))
(declare-fun increaseBitIndex!0 (BitStream!9772) tuple2!19714)

(assert (=> d!79056 (= res!196158 (= (buf!5879 (_2!10761 (increaseBitIndex!0 bs!63))) (buf!5879 bs!63)))))

(declare-fun lt!370148 () Bool)

(assert (=> d!79056 (= lt!370148 (not (= (bvand ((_ sign_extend 24) (select (arr!6391 (buf!5879 bs!63)) (currentByte!10940 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10935 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!370149 () tuple2!19700)

(assert (=> d!79056 (= lt!370149 (tuple2!19701 (not (= (bvand ((_ sign_extend 24) (select (arr!6391 (buf!5879 bs!63)) (currentByte!10940 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10935 bs!63)))) #b00000000000000000000000000000000)) (_2!10761 (increaseBitIndex!0 bs!63))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!79056 (validate_offset_bit!0 ((_ sign_extend 32) (size!5404 (buf!5879 bs!63))) ((_ sign_extend 32) (currentByte!10940 bs!63)) ((_ sign_extend 32) (currentBit!10935 bs!63)))))

(assert (=> d!79056 (= (readBit!0 bs!63) lt!370149)))

(declare-fun lt!370147 () (_ BitVec 64))

(declare-fun lt!370151 () (_ BitVec 64))

(declare-fun b!234548 () Bool)

(assert (=> b!234548 (= e!162145 (= (bitIndex!0 (size!5404 (buf!5879 (_2!10761 (increaseBitIndex!0 bs!63)))) (currentByte!10940 (_2!10761 (increaseBitIndex!0 bs!63))) (currentBit!10935 (_2!10761 (increaseBitIndex!0 bs!63)))) (bvadd lt!370151 lt!370147)))))

(assert (=> b!234548 (or (not (= (bvand lt!370151 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!370147 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370151 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370151 lt!370147) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234548 (= lt!370147 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!234548 (= lt!370151 (bitIndex!0 (size!5404 (buf!5879 bs!63)) (currentByte!10940 bs!63) (currentBit!10935 bs!63)))))

(declare-fun lt!370146 () Bool)

(assert (=> b!234548 (= lt!370146 (not (= (bvand ((_ sign_extend 24) (select (arr!6391 (buf!5879 bs!63)) (currentByte!10940 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10935 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!370150 () Bool)

(assert (=> b!234548 (= lt!370150 (not (= (bvand ((_ sign_extend 24) (select (arr!6391 (buf!5879 bs!63)) (currentByte!10940 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10935 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!370152 () Bool)

(assert (=> b!234548 (= lt!370152 (not (= (bvand ((_ sign_extend 24) (select (arr!6391 (buf!5879 bs!63)) (currentByte!10940 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10935 bs!63)))) #b00000000000000000000000000000000)))))

(assert (= (and d!79056 res!196158) b!234548))

(declare-fun m!357191 () Bool)

(assert (=> d!79056 m!357191))

(declare-fun m!357193 () Bool)

(assert (=> d!79056 m!357193))

(declare-fun m!357195 () Bool)

(assert (=> d!79056 m!357195))

(declare-fun m!357197 () Bool)

(assert (=> d!79056 m!357197))

(declare-fun m!357199 () Bool)

(assert (=> b!234548 m!357199))

(assert (=> b!234548 m!357159))

(assert (=> b!234548 m!357195))

(assert (=> b!234548 m!357193))

(assert (=> b!234548 m!357191))

(assert (=> d!79028 d!79056))

(declare-fun d!79064 () Bool)

(assert (=> d!79064 (= (invariant!0 (currentBit!10935 bs!63) (currentByte!10940 bs!63) (size!5404 (buf!5879 bs!63))) (and (bvsge (currentBit!10935 bs!63) #b00000000000000000000000000000000) (bvslt (currentBit!10935 bs!63) #b00000000000000000000000000001000) (bvsge (currentByte!10940 bs!63) #b00000000000000000000000000000000) (or (bvslt (currentByte!10940 bs!63) (size!5404 (buf!5879 bs!63))) (and (= (currentBit!10935 bs!63) #b00000000000000000000000000000000) (= (currentByte!10940 bs!63) (size!5404 (buf!5879 bs!63)))))))))

(assert (=> d!79014 d!79064))

(declare-fun d!79066 () Bool)

(declare-fun e!162151 () Bool)

(assert (=> d!79066 e!162151))

(declare-fun res!196169 () Bool)

(assert (=> d!79066 (=> (not res!196169) (not e!162151))))

(declare-fun lt!370183 () (_ BitVec 64))

(declare-fun lt!370188 () (_ BitVec 64))

(declare-fun lt!370185 () (_ BitVec 64))

(assert (=> d!79066 (= res!196169 (= lt!370185 (bvsub lt!370188 lt!370183)))))

(assert (=> d!79066 (or (= (bvand lt!370188 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!370183 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!370188 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!370188 lt!370183) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79066 (= lt!370183 (remainingBits!0 ((_ sign_extend 32) (size!5404 (buf!5879 bs!63))) ((_ sign_extend 32) (currentByte!10940 bs!63)) ((_ sign_extend 32) (currentBit!10935 bs!63))))))

(declare-fun lt!370184 () (_ BitVec 64))

(declare-fun lt!370187 () (_ BitVec 64))

(assert (=> d!79066 (= lt!370188 (bvmul lt!370184 lt!370187))))

(assert (=> d!79066 (or (= lt!370184 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!370187 (bvsdiv (bvmul lt!370184 lt!370187) lt!370184)))))

(assert (=> d!79066 (= lt!370187 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79066 (= lt!370184 ((_ sign_extend 32) (size!5404 (buf!5879 bs!63))))))

(assert (=> d!79066 (= lt!370185 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10940 bs!63)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10935 bs!63))))))

(assert (=> d!79066 (invariant!0 (currentBit!10935 bs!63) (currentByte!10940 bs!63) (size!5404 (buf!5879 bs!63)))))

(assert (=> d!79066 (= (bitIndex!0 (size!5404 (buf!5879 bs!63)) (currentByte!10940 bs!63) (currentBit!10935 bs!63)) lt!370185)))

(declare-fun b!234559 () Bool)

(declare-fun res!196170 () Bool)

(assert (=> b!234559 (=> (not res!196170) (not e!162151))))

(assert (=> b!234559 (= res!196170 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!370185))))

(declare-fun b!234560 () Bool)

(declare-fun lt!370186 () (_ BitVec 64))

(assert (=> b!234560 (= e!162151 (bvsle lt!370185 (bvmul lt!370186 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!234560 (or (= lt!370186 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!370186 #b0000000000000000000000000000000000000000000000000000000000001000) lt!370186)))))

(assert (=> b!234560 (= lt!370186 ((_ sign_extend 32) (size!5404 (buf!5879 bs!63))))))

(assert (= (and d!79066 res!196169) b!234559))

(assert (= (and b!234559 res!196170) b!234560))

(assert (=> d!79066 m!357175))

(assert (=> d!79066 m!357153))

(assert (=> b!234532 d!79066))

(declare-fun d!79070 () Bool)

(assert (=> d!79070 (= (remainingBits!0 ((_ sign_extend 32) (size!5404 (buf!5879 bs!63))) ((_ sign_extend 32) (currentByte!10940 bs!63)) ((_ sign_extend 32) (currentBit!10935 bs!63))) (bvsub (bvmul ((_ sign_extend 32) (size!5404 (buf!5879 bs!63))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10940 bs!63)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10935 bs!63)))))))

(assert (=> d!79046 d!79070))

(declare-fun d!79072 () Bool)

(declare-fun e!162179 () Bool)

(assert (=> d!79072 e!162179))

(declare-fun res!196212 () Bool)

(assert (=> d!79072 (=> (not res!196212) (not e!162179))))

(declare-fun lt!370262 () tuple2!19704)

(assert (=> d!79072 (= res!196212 (= (buf!5879 (_2!10756 lt!370262)) (buf!5879 bs!63)))))

(declare-fun e!162177 () tuple2!19704)

(assert (=> d!79072 (= lt!370262 e!162177)))

(declare-fun c!11266 () Bool)

(assert (=> d!79072 (= c!11266 (= nBits!274 i!546))))

(assert (=> d!79072 (and (bvsle #b00000000000000000000000000000000 i!546) (bvsle i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000))))

(assert (=> d!79072 (= (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118) lt!370262)))

(declare-fun b!234617 () Bool)

(declare-fun res!196214 () Bool)

(assert (=> b!234617 (=> (not res!196214) (not e!162179))))

(declare-fun lt!370261 () (_ BitVec 64))

(declare-fun lt!370263 () (_ BitVec 64))

(assert (=> b!234617 (= res!196214 (= (bitIndex!0 (size!5404 (buf!5879 (_2!10756 lt!370262))) (currentByte!10940 (_2!10756 lt!370262)) (currentBit!10935 (_2!10756 lt!370262))) (bvadd lt!370261 lt!370263)))))

(assert (=> b!234617 (or (not (= (bvand lt!370261 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!370263 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370261 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370261 lt!370263) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234617 (= lt!370263 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!234617 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!234617 (= lt!370261 (bitIndex!0 (size!5404 (buf!5879 bs!63)) (currentByte!10940 bs!63) (currentBit!10935 bs!63)))))

(declare-fun e!162178 () Bool)

(declare-fun lt!370264 () (_ BitVec 64))

(declare-fun b!234618 () Bool)

(assert (=> b!234618 (= e!162178 (= (= (bvand (bvlshr (_1!10756 lt!370262) lt!370264) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10748 (readBitPure!0 bs!63))))))

(assert (=> b!234618 (and (bvsge lt!370264 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!370264 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!370266 () (_ BitVec 32))

(assert (=> b!234618 (= lt!370264 ((_ sign_extend 32) (bvsub lt!370266 i!546)))))

(assert (=> b!234618 (or (= (bvand lt!370266 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand lt!370266 #b10000000000000000000000000000000) (bvand (bvsub lt!370266 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!234618 (= lt!370266 (bvsub nBits!274 #b00000000000000000000000000000001))))

(assert (=> b!234618 (or (= (bvand nBits!274 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!234619 () Bool)

(declare-fun res!196215 () Bool)

(assert (=> b!234619 (=> (not res!196215) (not e!162179))))

(assert (=> b!234619 (= res!196215 (= (bvand (_1!10756 lt!370262) (onesLSBLong!0 nBits!274)) (_1!10756 lt!370262)))))

(declare-fun b!234620 () Bool)

(declare-fun lt!370269 () tuple2!19704)

(assert (=> b!234620 (= e!162177 (tuple2!19705 (_1!10756 lt!370269) (_2!10756 lt!370269)))))

(declare-fun lt!370268 () tuple2!19700)

(assert (=> b!234620 (= lt!370268 (readBit!0 bs!63))))

(assert (=> b!234620 (= lt!370269 (readNLeastSignificantBitsLoop!0 (_2!10754 lt!370268) nBits!274 (bvadd i!546 #b00000000000000000000000000000001) (bvor acc!118 (ite (_1!10754 lt!370268) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!234621 () Bool)

(assert (=> b!234621 (= e!162179 e!162178)))

(declare-fun res!196213 () Bool)

(assert (=> b!234621 (=> res!196213 e!162178)))

(assert (=> b!234621 (= res!196213 (bvsge i!546 nBits!274))))

(declare-fun b!234622 () Bool)

(declare-fun res!196211 () Bool)

(assert (=> b!234622 (=> (not res!196211) (not e!162179))))

(declare-fun lt!370265 () (_ BitVec 64))

(declare-fun lt!370267 () (_ BitVec 64))

(assert (=> b!234622 (= res!196211 (= (bvlshr (_1!10756 lt!370262) lt!370265) (bvlshr acc!118 lt!370267)))))

(assert (=> b!234622 (and (bvsge lt!370267 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!370267 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!234622 (= lt!370267 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!234622 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!234622 (and (bvsge lt!370265 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!370265 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!234622 (= lt!370265 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!234622 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(declare-fun b!234623 () Bool)

(assert (=> b!234623 (= e!162177 (tuple2!19705 acc!118 bs!63))))

(assert (= (and d!79072 c!11266) b!234623))

(assert (= (and d!79072 (not c!11266)) b!234620))

(assert (= (and d!79072 res!196212) b!234617))

(assert (= (and b!234617 res!196214) b!234622))

(assert (= (and b!234622 res!196211) b!234619))

(assert (= (and b!234619 res!196215) b!234621))

(assert (= (and b!234621 (not res!196213)) b!234618))

(declare-fun m!357209 () Bool)

(assert (=> b!234617 m!357209))

(assert (=> b!234617 m!357159))

(assert (=> b!234618 m!357115))

(assert (=> b!234619 m!357103))

(assert (=> b!234620 m!357165))

(declare-fun m!357211 () Bool)

(assert (=> b!234620 m!357211))

(assert (=> d!79036 d!79072))

(push 1)

(assert (not b!234618))

(assert (not d!79056))

(assert (not b!234620))

(assert (not b!234548))

(assert (not d!79066))

(assert (not b!234617))

(assert (not b!234619))

(check-sat)

(pop 1)

(push 1)

(check-sat)

