; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45502 () Bool)

(assert start!45502)

(declare-fun res!185613 () Bool)

(declare-fun e!149635 () Bool)

(assert (=> start!45502 (=> (not res!185613) (not e!149635))))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun nBits!265 () (_ BitVec 32))

(assert (=> start!45502 (= res!185613 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45502 e!149635))

(assert (=> start!45502 true))

(declare-datatypes ((array!10741 0))(
  ( (array!10742 (arr!5647 (Array (_ BitVec 32) (_ BitVec 8))) (size!4717 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8542 0))(
  ( (BitStream!8543 (buf!5264 array!10741) (currentByte!9885 (_ BitVec 32)) (currentBit!9880 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8542)

(declare-fun e!149634 () Bool)

(declare-fun inv!12 (BitStream!8542) Bool)

(assert (=> start!45502 (and (inv!12 bs!62) e!149634)))

(declare-fun b!220342 () Bool)

(declare-fun array_inv!4458 (array!10741) Bool)

(assert (=> b!220342 (= e!149634 (array_inv!4458 (buf!5264 bs!62)))))

(declare-fun b!220343 () Bool)

(declare-fun res!185615 () Bool)

(assert (=> b!220343 (=> (not res!185615) (not e!149635))))

(declare-fun acc!113 () (_ BitVec 64))

(assert (=> b!220343 (= res!185615 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun b!220344 () Bool)

(declare-fun e!149636 () Bool)

(assert (=> b!220344 (= e!149635 e!149636)))

(declare-fun res!185614 () Bool)

(assert (=> b!220344 (=> (not res!185614) (not e!149636))))

(assert (=> b!220344 (= res!185614 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!541)))))

(declare-fun lt!348157 () BitStream!8542)

(declare-fun withMovedBitIndex!0 (BitStream!8542 (_ BitVec 64)) BitStream!8542)

(assert (=> b!220344 (= lt!348157 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!18836 0))(
  ( (tuple2!18837 (_1!10076 BitStream!8542) (_2!10076 Bool)) )
))
(declare-fun lt!348156 () tuple2!18836)

(declare-fun readBitPure!0 (BitStream!8542) tuple2!18836)

(assert (=> b!220344 (= lt!348156 (readBitPure!0 bs!62))))

(declare-datatypes ((tuple2!18838 0))(
  ( (tuple2!18839 (_1!10077 BitStream!8542) (_2!10077 (_ BitVec 64))) )
))
(declare-fun lt!348158 () tuple2!18838)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8542 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18838)

(assert (=> b!220344 (= lt!348158 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun b!220345 () Bool)

(declare-fun res!185612 () Bool)

(assert (=> b!220345 (=> (not res!185612) (not e!149635))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220345 (= res!185612 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220346 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220346 (= e!149636 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4717 (buf!5264 lt!348157))) ((_ sign_extend 32) (currentByte!9885 lt!348157)) ((_ sign_extend 32) (currentBit!9880 lt!348157)) ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541))))))))

(declare-fun b!220347 () Bool)

(declare-fun res!185611 () Bool)

(assert (=> b!220347 (=> (not res!185611) (not e!149635))))

(assert (=> b!220347 (= res!185611 (validate_offset_bits!1 ((_ sign_extend 32) (size!4717 (buf!5264 bs!62))) ((_ sign_extend 32) (currentByte!9885 bs!62)) ((_ sign_extend 32) (currentBit!9880 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(assert (= (and start!45502 res!185613) b!220347))

(assert (= (and b!220347 res!185611) b!220345))

(assert (= (and b!220345 res!185612) b!220343))

(assert (= (and b!220343 res!185615) b!220344))

(assert (= (and b!220344 res!185614) b!220346))

(assert (= start!45502 b!220342))

(declare-fun m!339037 () Bool)

(assert (=> b!220346 m!339037))

(declare-fun m!339039 () Bool)

(assert (=> start!45502 m!339039))

(declare-fun m!339041 () Bool)

(assert (=> b!220342 m!339041))

(declare-fun m!339043 () Bool)

(assert (=> b!220347 m!339043))

(declare-fun m!339045 () Bool)

(assert (=> b!220344 m!339045))

(declare-fun m!339047 () Bool)

(assert (=> b!220344 m!339047))

(declare-fun m!339049 () Bool)

(assert (=> b!220344 m!339049))

(declare-fun m!339051 () Bool)

(assert (=> b!220345 m!339051))

(push 1)

(assert (not b!220346))

(assert (not start!45502))

(assert (not b!220344))

(assert (not b!220347))

(assert (not b!220342))

(assert (not b!220345))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!74177 () Bool)

(assert (=> d!74177 (= (array_inv!4458 (buf!5264 bs!62)) (bvsge (size!4717 (buf!5264 bs!62)) #b00000000000000000000000000000000))))

(assert (=> b!220342 d!74177))

(declare-fun d!74179 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!74179 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4717 (buf!5264 bs!62))) ((_ sign_extend 32) (currentByte!9885 bs!62)) ((_ sign_extend 32) (currentBit!9880 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4717 (buf!5264 bs!62))) ((_ sign_extend 32) (currentByte!9885 bs!62)) ((_ sign_extend 32) (currentBit!9880 bs!62))) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun bs!18140 () Bool)

(assert (= bs!18140 d!74179))

(declare-fun m!339085 () Bool)

(assert (=> bs!18140 m!339085))

(assert (=> b!220347 d!74179))

(declare-fun d!74181 () Bool)

(assert (=> d!74181 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4717 (buf!5264 lt!348157))) ((_ sign_extend 32) (currentByte!9885 lt!348157)) ((_ sign_extend 32) (currentBit!9880 lt!348157)) ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4717 (buf!5264 lt!348157))) ((_ sign_extend 32) (currentByte!9885 lt!348157)) ((_ sign_extend 32) (currentBit!9880 lt!348157))) ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541)))))))

(declare-fun bs!18141 () Bool)

(assert (= bs!18141 d!74181))

(declare-fun m!339087 () Bool)

(assert (=> bs!18141 m!339087))

(assert (=> b!220346 d!74181))

(declare-fun d!74183 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!74183 (= (inv!12 bs!62) (invariant!0 (currentBit!9880 bs!62) (currentByte!9885 bs!62) (size!4717 (buf!5264 bs!62))))))

(declare-fun bs!18142 () Bool)

(assert (= bs!18142 d!74183))

(declare-fun m!339089 () Bool)

(assert (=> bs!18142 m!339089))

(assert (=> start!45502 d!74183))

(declare-fun d!74185 () Bool)

(assert (=> d!74185 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541)) (ite (= (bvsub #b00000000000000000000000001000000 i!541) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!541))))))))

(assert (=> b!220345 d!74185))

(declare-fun d!74187 () Bool)

(declare-fun e!149664 () Bool)

(assert (=> d!74187 e!149664))

(declare-fun res!185648 () Bool)

(assert (=> d!74187 (=> (not res!185648) (not e!149664))))

(declare-fun lt!348182 () (_ BitVec 64))

(declare-fun lt!348181 () BitStream!8542)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!74187 (= res!185648 (= (bvadd lt!348182 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4717 (buf!5264 lt!348181)) (currentByte!9885 lt!348181) (currentBit!9880 lt!348181))))))

(assert (=> d!74187 (or (not (= (bvand lt!348182 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348182 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348182 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74187 (= lt!348182 (bitIndex!0 (size!4717 (buf!5264 bs!62)) (currentByte!9885 bs!62) (currentBit!9880 bs!62)))))

(declare-datatypes ((Unit!15583 0))(
  ( (Unit!15584) )
))
(declare-datatypes ((tuple2!18848 0))(
  ( (tuple2!18849 (_1!10082 Unit!15583) (_2!10082 BitStream!8542)) )
))
(declare-fun moveBitIndex!0 (BitStream!8542 (_ BitVec 64)) tuple2!18848)

(assert (=> d!74187 (= lt!348181 (_2!10082 (moveBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8542 (_ BitVec 64)) Bool)

(assert (=> d!74187 (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!74187 (= (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) lt!348181)))

(declare-fun b!220386 () Bool)

(assert (=> b!220386 (= e!149664 (= (size!4717 (buf!5264 bs!62)) (size!4717 (buf!5264 lt!348181))))))

(assert (= (and d!74187 res!185648) b!220386))

(declare-fun m!339095 () Bool)

(assert (=> d!74187 m!339095))

(declare-fun m!339097 () Bool)

(assert (=> d!74187 m!339097))

(declare-fun m!339099 () Bool)

(assert (=> d!74187 m!339099))

(declare-fun m!339101 () Bool)

(assert (=> d!74187 m!339101))

(assert (=> b!220344 d!74187))

(declare-fun d!74199 () Bool)

(declare-datatypes ((tuple2!18850 0))(
  ( (tuple2!18851 (_1!10083 Bool) (_2!10083 BitStream!8542)) )
))
(declare-fun lt!348187 () tuple2!18850)

(declare-fun readBit!0 (BitStream!8542) tuple2!18850)

(assert (=> d!74199 (= lt!348187 (readBit!0 bs!62))))

(assert (=> d!74199 (= (readBitPure!0 bs!62) (tuple2!18837 (_2!10083 lt!348187) (_1!10083 lt!348187)))))

(declare-fun bs!18145 () Bool)

(assert (= bs!18145 d!74199))

(declare-fun m!339103 () Bool)

(assert (=> bs!18145 m!339103))

(assert (=> b!220344 d!74199))

(declare-datatypes ((tuple2!18854 0))(
  ( (tuple2!18855 (_1!10085 (_ BitVec 64)) (_2!10085 BitStream!8542)) )
))
(declare-fun lt!348194 () tuple2!18854)

(declare-fun d!74201 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8542 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18854)

(assert (=> d!74201 (= lt!348194 (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113))))

(assert (=> d!74201 (= (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113) (tuple2!18839 (_2!10085 lt!348194) (_1!10085 lt!348194)))))

(declare-fun bs!18146 () Bool)

(assert (= bs!18146 d!74201))

(declare-fun m!339113 () Bool)

(assert (=> bs!18146 m!339113))

(assert (=> b!220344 d!74201))

(push 1)

(assert (not d!74199))

(assert (not d!74181))

(assert (not d!74201))

(assert (not d!74187))

(assert (not d!74183))

(assert (not d!74179))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!74241 () Bool)

(declare-fun e!149697 () Bool)

(assert (=> d!74241 e!149697))

(declare-fun res!185683 () Bool)

(assert (=> d!74241 (=> (not res!185683) (not e!149697))))

(declare-fun increaseBitIndex!0 (BitStream!8542) tuple2!18848)

(assert (=> d!74241 (= res!185683 (= (buf!5264 (_2!10082 (increaseBitIndex!0 bs!62))) (buf!5264 bs!62)))))

(declare-fun lt!348295 () Bool)

(assert (=> d!74241 (= lt!348295 (not (= (bvand ((_ sign_extend 24) (select (arr!5647 (buf!5264 bs!62)) (currentByte!9885 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9880 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348294 () tuple2!18850)

(assert (=> d!74241 (= lt!348294 (tuple2!18851 (not (= (bvand ((_ sign_extend 24) (select (arr!5647 (buf!5264 bs!62)) (currentByte!9885 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9880 bs!62)))) #b00000000000000000000000000000000)) (_2!10082 (increaseBitIndex!0 bs!62))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!74241 (validate_offset_bit!0 ((_ sign_extend 32) (size!4717 (buf!5264 bs!62))) ((_ sign_extend 32) (currentByte!9885 bs!62)) ((_ sign_extend 32) (currentBit!9880 bs!62)))))

(assert (=> d!74241 (= (readBit!0 bs!62) lt!348294)))

(declare-fun lt!348292 () (_ BitVec 64))

(declare-fun lt!348290 () (_ BitVec 64))

(declare-fun b!220427 () Bool)

(assert (=> b!220427 (= e!149697 (= (bitIndex!0 (size!4717 (buf!5264 (_2!10082 (increaseBitIndex!0 bs!62)))) (currentByte!9885 (_2!10082 (increaseBitIndex!0 bs!62))) (currentBit!9880 (_2!10082 (increaseBitIndex!0 bs!62)))) (bvadd lt!348292 lt!348290)))))

(assert (=> b!220427 (or (not (= (bvand lt!348292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348290 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348292 lt!348290) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!220427 (= lt!348290 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!220427 (= lt!348292 (bitIndex!0 (size!4717 (buf!5264 bs!62)) (currentByte!9885 bs!62) (currentBit!9880 bs!62)))))

(declare-fun lt!348296 () Bool)

(assert (=> b!220427 (= lt!348296 (not (= (bvand ((_ sign_extend 24) (select (arr!5647 (buf!5264 bs!62)) (currentByte!9885 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9880 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348293 () Bool)

(assert (=> b!220427 (= lt!348293 (not (= (bvand ((_ sign_extend 24) (select (arr!5647 (buf!5264 bs!62)) (currentByte!9885 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9880 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348291 () Bool)

(assert (=> b!220427 (= lt!348291 (not (= (bvand ((_ sign_extend 24) (select (arr!5647 (buf!5264 bs!62)) (currentByte!9885 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9880 bs!62)))) #b00000000000000000000000000000000)))))

(assert (= (and d!74241 res!185683) b!220427))

(declare-fun m!339161 () Bool)

(assert (=> d!74241 m!339161))

(declare-fun m!339163 () Bool)

(assert (=> d!74241 m!339163))

(declare-fun m!339165 () Bool)

(assert (=> d!74241 m!339165))

(declare-fun m!339167 () Bool)

(assert (=> d!74241 m!339167))

(assert (=> b!220427 m!339161))

(declare-fun m!339169 () Bool)

(assert (=> b!220427 m!339169))

(assert (=> b!220427 m!339097))

(assert (=> b!220427 m!339165))

(assert (=> b!220427 m!339163))

(assert (=> d!74199 d!74241))

(declare-fun d!74245 () Bool)

(declare-fun e!149706 () Bool)

(assert (=> d!74245 e!149706))

(declare-fun res!185694 () Bool)

(assert (=> d!74245 (=> (not res!185694) (not e!149706))))

(declare-fun lt!348331 () (_ BitVec 64))

(declare-fun lt!348327 () (_ BitVec 64))

(declare-fun lt!348329 () (_ BitVec 64))

(assert (=> d!74245 (= res!185694 (= lt!348329 (bvsub lt!348331 lt!348327)))))

(assert (=> d!74245 (or (= (bvand lt!348331 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348327 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!348331 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!348331 lt!348327) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74245 (= lt!348327 (remainingBits!0 ((_ sign_extend 32) (size!4717 (buf!5264 lt!348181))) ((_ sign_extend 32) (currentByte!9885 lt!348181)) ((_ sign_extend 32) (currentBit!9880 lt!348181))))))

(declare-fun lt!348328 () (_ BitVec 64))

(declare-fun lt!348330 () (_ BitVec 64))

(assert (=> d!74245 (= lt!348331 (bvmul lt!348328 lt!348330))))

(assert (=> d!74245 (or (= lt!348328 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!348330 (bvsdiv (bvmul lt!348328 lt!348330) lt!348328)))))

(assert (=> d!74245 (= lt!348330 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74245 (= lt!348328 ((_ sign_extend 32) (size!4717 (buf!5264 lt!348181))))))

(assert (=> d!74245 (= lt!348329 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9885 lt!348181)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9880 lt!348181))))))

(assert (=> d!74245 (invariant!0 (currentBit!9880 lt!348181) (currentByte!9885 lt!348181) (size!4717 (buf!5264 lt!348181)))))

(assert (=> d!74245 (= (bitIndex!0 (size!4717 (buf!5264 lt!348181)) (currentByte!9885 lt!348181) (currentBit!9880 lt!348181)) lt!348329)))

(declare-fun b!220438 () Bool)

(declare-fun res!185695 () Bool)

(assert (=> b!220438 (=> (not res!185695) (not e!149706))))

(assert (=> b!220438 (= res!185695 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!348329))))

(declare-fun b!220439 () Bool)

(declare-fun lt!348332 () (_ BitVec 64))

(assert (=> b!220439 (= e!149706 (bvsle lt!348329 (bvmul lt!348332 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!220439 (or (= lt!348332 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!348332 #b0000000000000000000000000000000000000000000000000000000000001000) lt!348332)))))

(assert (=> b!220439 (= lt!348332 ((_ sign_extend 32) (size!4717 (buf!5264 lt!348181))))))

(assert (= (and d!74245 res!185694) b!220438))

(assert (= (and b!220438 res!185695) b!220439))

(declare-fun m!339171 () Bool)

(assert (=> d!74245 m!339171))

(declare-fun m!339173 () Bool)

(assert (=> d!74245 m!339173))

(assert (=> d!74187 d!74245))

(declare-fun d!74247 () Bool)

(declare-fun e!149707 () Bool)

(assert (=> d!74247 e!149707))

(declare-fun res!185696 () Bool)

(assert (=> d!74247 (=> (not res!185696) (not e!149707))))

(declare-fun lt!348337 () (_ BitVec 64))

(declare-fun lt!348333 () (_ BitVec 64))

(declare-fun lt!348335 () (_ BitVec 64))

(assert (=> d!74247 (= res!185696 (= lt!348335 (bvsub lt!348337 lt!348333)))))

(assert (=> d!74247 (or (= (bvand lt!348337 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348333 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!348337 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!348337 lt!348333) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74247 (= lt!348333 (remainingBits!0 ((_ sign_extend 32) (size!4717 (buf!5264 bs!62))) ((_ sign_extend 32) (currentByte!9885 bs!62)) ((_ sign_extend 32) (currentBit!9880 bs!62))))))

(declare-fun lt!348334 () (_ BitVec 64))

(declare-fun lt!348336 () (_ BitVec 64))

(assert (=> d!74247 (= lt!348337 (bvmul lt!348334 lt!348336))))

(assert (=> d!74247 (or (= lt!348334 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!348336 (bvsdiv (bvmul lt!348334 lt!348336) lt!348334)))))

(assert (=> d!74247 (= lt!348336 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74247 (= lt!348334 ((_ sign_extend 32) (size!4717 (buf!5264 bs!62))))))

(assert (=> d!74247 (= lt!348335 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9885 bs!62)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9880 bs!62))))))

(assert (=> d!74247 (invariant!0 (currentBit!9880 bs!62) (currentByte!9885 bs!62) (size!4717 (buf!5264 bs!62)))))

(assert (=> d!74247 (= (bitIndex!0 (size!4717 (buf!5264 bs!62)) (currentByte!9885 bs!62) (currentBit!9880 bs!62)) lt!348335)))

(declare-fun b!220440 () Bool)

(declare-fun res!185697 () Bool)

(assert (=> b!220440 (=> (not res!185697) (not e!149707))))

(assert (=> b!220440 (= res!185697 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!348335))))

(declare-fun b!220441 () Bool)

(declare-fun lt!348338 () (_ BitVec 64))

(assert (=> b!220441 (= e!149707 (bvsle lt!348335 (bvmul lt!348338 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!220441 (or (= lt!348338 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!348338 #b0000000000000000000000000000000000000000000000000000000000001000) lt!348338)))))

(assert (=> b!220441 (= lt!348338 ((_ sign_extend 32) (size!4717 (buf!5264 bs!62))))))

(assert (= (and d!74247 res!185696) b!220440))

(assert (= (and b!220440 res!185697) b!220441))

(assert (=> d!74247 m!339085))

(assert (=> d!74247 m!339089))

(assert (=> d!74187 d!74247))

(declare-fun d!74251 () Bool)

(declare-fun lt!348379 () (_ BitVec 32))

(assert (=> d!74251 (= lt!348379 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!348375 () (_ BitVec 32))

(assert (=> d!74251 (= lt!348375 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!149723 () Bool)

(assert (=> d!74251 e!149723))

(declare-fun res!185708 () Bool)

(assert (=> d!74251 (=> (not res!185708) (not e!149723))))

(assert (=> d!74251 (= res!185708 (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!15595 () Unit!15583)

(declare-fun Unit!15596 () Unit!15583)

(declare-fun Unit!15597 () Unit!15583)

(assert (=> d!74251 (= (moveBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!9880 bs!62) lt!348379) #b00000000000000000000000000000000) (tuple2!18849 Unit!15595 (BitStream!8543 (buf!5264 bs!62) (bvsub (bvadd (currentByte!9885 bs!62) lt!348375) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!348379 (currentBit!9880 bs!62)))) (ite (bvsge (bvadd (currentBit!9880 bs!62) lt!348379) #b00000000000000000000000000001000) (tuple2!18849 Unit!15596 (BitStream!8543 (buf!5264 bs!62) (bvadd (currentByte!9885 bs!62) lt!348375 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9880 bs!62) lt!348379) #b00000000000000000000000000001000))) (tuple2!18849 Unit!15597 (BitStream!8543 (buf!5264 bs!62) (bvadd (currentByte!9885 bs!62) lt!348375) (bvadd (currentBit!9880 bs!62) lt!348379))))))))

(declare-fun b!220453 () Bool)

(declare-fun e!149722 () Bool)

(assert (=> b!220453 (= e!149723 e!149722)))

(declare-fun res!185709 () Bool)

(assert (=> b!220453 (=> (not res!185709) (not e!149722))))

(declare-fun lt!348377 () (_ BitVec 64))

(declare-fun lt!348380 () tuple2!18848)

(assert (=> b!220453 (= res!185709 (= (bvadd lt!348377 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4717 (buf!5264 (_2!10082 lt!348380))) (currentByte!9885 (_2!10082 lt!348380)) (currentBit!9880 (_2!10082 lt!348380)))))))

(assert (=> b!220453 (or (not (= (bvand lt!348377 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348377 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348377 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!220453 (= lt!348377 (bitIndex!0 (size!4717 (buf!5264 bs!62)) (currentByte!9885 bs!62) (currentBit!9880 bs!62)))))

(declare-fun lt!348378 () (_ BitVec 32))

(declare-fun lt!348376 () (_ BitVec 32))

(declare-fun Unit!15598 () Unit!15583)

(declare-fun Unit!15599 () Unit!15583)

(declare-fun Unit!15600 () Unit!15583)

(assert (=> b!220453 (= lt!348380 (ite (bvslt (bvadd (currentBit!9880 bs!62) lt!348376) #b00000000000000000000000000000000) (tuple2!18849 Unit!15598 (BitStream!8543 (buf!5264 bs!62) (bvsub (bvadd (currentByte!9885 bs!62) lt!348378) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!348376 (currentBit!9880 bs!62)))) (ite (bvsge (bvadd (currentBit!9880 bs!62) lt!348376) #b00000000000000000000000000001000) (tuple2!18849 Unit!15599 (BitStream!8543 (buf!5264 bs!62) (bvadd (currentByte!9885 bs!62) lt!348378 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9880 bs!62) lt!348376) #b00000000000000000000000000001000))) (tuple2!18849 Unit!15600 (BitStream!8543 (buf!5264 bs!62) (bvadd (currentByte!9885 bs!62) lt!348378) (bvadd (currentBit!9880 bs!62) lt!348376))))))))

(assert (=> b!220453 (= lt!348376 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!220453 (= lt!348378 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!220454 () Bool)

(assert (=> b!220454 (= e!149722 (and (= (size!4717 (buf!5264 bs!62)) (size!4717 (buf!5264 (_2!10082 lt!348380)))) (= (buf!5264 bs!62) (buf!5264 (_2!10082 lt!348380)))))))

(assert (= (and d!74251 res!185708) b!220453))

(assert (= (and b!220453 res!185709) b!220454))

(assert (=> d!74251 m!339101))

(declare-fun m!339187 () Bool)

(assert (=> b!220453 m!339187))

(assert (=> b!220453 m!339097))

(assert (=> d!74187 d!74251))

(declare-fun d!74261 () Bool)

(declare-fun res!185720 () Bool)

(declare-fun e!149730 () Bool)

(assert (=> d!74261 (=> (not res!185720) (not e!149730))))

(assert (=> d!74261 (= res!185720 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4717 (buf!5264 bs!62)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4717 (buf!5264 bs!62)))))))))

(assert (=> d!74261 (= (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) e!149730)))

(declare-fun b!220466 () Bool)

(declare-fun lt!348407 () (_ BitVec 64))

(assert (=> b!220466 (= e!149730 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!348407) (bvsle lt!348407 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4717 (buf!5264 bs!62)))))))))

(assert (=> b!220466 (= lt!348407 (bvadd (bitIndex!0 (size!4717 (buf!5264 bs!62)) (currentByte!9885 bs!62) (currentBit!9880 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!74261 res!185720) b!220466))

(assert (=> b!220466 m!339097))

(assert (=> d!74187 d!74261))

(declare-fun d!74267 () Bool)

(assert (=> d!74267 (= (invariant!0 (currentBit!9880 bs!62) (currentByte!9885 bs!62) (size!4717 (buf!5264 bs!62))) (and (bvsge (currentBit!9880 bs!62) #b00000000000000000000000000000000) (bvslt (currentBit!9880 bs!62) #b00000000000000000000000000001000) (bvsge (currentByte!9885 bs!62) #b00000000000000000000000000000000) (or (bvslt (currentByte!9885 bs!62) (size!4717 (buf!5264 bs!62))) (and (= (currentBit!9880 bs!62) #b00000000000000000000000000000000) (= (currentByte!9885 bs!62) (size!4717 (buf!5264 bs!62)))))))))

(assert (=> d!74183 d!74267))

(declare-fun d!74271 () Bool)

(assert (=> d!74271 (= (remainingBits!0 ((_ sign_extend 32) (size!4717 (buf!5264 bs!62))) ((_ sign_extend 32) (currentByte!9885 bs!62)) ((_ sign_extend 32) (currentBit!9880 bs!62))) (bvsub (bvmul ((_ sign_extend 32) (size!4717 (buf!5264 bs!62))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9885 bs!62)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9880 bs!62)))))))

(assert (=> d!74179 d!74271))

(declare-fun d!74273 () Bool)

(assert (=> d!74273 (= (remainingBits!0 ((_ sign_extend 32) (size!4717 (buf!5264 lt!348157))) ((_ sign_extend 32) (currentByte!9885 lt!348157)) ((_ sign_extend 32) (currentBit!9880 lt!348157))) (bvsub (bvmul ((_ sign_extend 32) (size!4717 (buf!5264 lt!348157))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9885 lt!348157)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9880 lt!348157)))))))

(assert (=> d!74181 d!74273))

(declare-fun b!220483 () Bool)

(declare-fun res!185737 () Bool)

(declare-fun e!149741 () Bool)

(assert (=> b!220483 (=> (not res!185737) (not e!149741))))

(declare-fun lt!348430 () tuple2!18854)

(declare-fun lt!348429 () (_ BitVec 64))

(declare-fun lt!348426 () (_ BitVec 64))

(assert (=> b!220483 (= res!185737 (= (bitIndex!0 (size!4717 (buf!5264 (_2!10085 lt!348430))) (currentByte!9885 (_2!10085 lt!348430)) (currentBit!9880 (_2!10085 lt!348430))) (bvadd lt!348426 lt!348429)))))

(assert (=> b!220483 (or (not (= (bvand lt!348426 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348429 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348426 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348426 lt!348429) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!220483 (= lt!348429 ((_ sign_extend 32) (bvsub nBits!265 i!541)))))

(assert (=> b!220483 (or (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand i!541 #b10000000000000000000000000000000)) (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 i!541) #b10000000000000000000000000000000)))))

(assert (=> b!220483 (= lt!348426 (bitIndex!0 (size!4717 (buf!5264 bs!62)) (currentByte!9885 bs!62) (currentBit!9880 bs!62)))))

(declare-fun b!220484 () Bool)

(declare-fun res!185739 () Bool)

(assert (=> b!220484 (=> (not res!185739) (not e!149741))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220484 (= res!185739 (= (bvand (_1!10085 lt!348430) (onesLSBLong!0 i!541)) (bvand acc!113 (onesLSBLong!0 i!541))))))

(declare-fun b!220485 () Bool)

(declare-fun e!149742 () Bool)

(assert (=> b!220485 (= e!149741 e!149742)))

(declare-fun res!185735 () Bool)

(assert (=> b!220485 (=> res!185735 e!149742)))

(assert (=> b!220485 (= res!185735 (not (bvslt i!541 nBits!265)))))

(declare-fun d!74275 () Bool)

(assert (=> d!74275 e!149741))

(declare-fun res!185736 () Bool)

(assert (=> d!74275 (=> (not res!185736) (not e!149741))))

(assert (=> d!74275 (= res!185736 (= (buf!5264 (_2!10085 lt!348430)) (buf!5264 bs!62)))))

(declare-fun e!149743 () tuple2!18854)

(assert (=> d!74275 (= lt!348430 e!149743)))

(declare-fun c!10673 () Bool)

(assert (=> d!74275 (= c!10673 (= nBits!265 i!541))))

(assert (=> d!74275 (and (bvsle #b00000000000000000000000000000000 i!541) (bvsle i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000))))

(assert (=> d!74275 (= (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113) lt!348430)))

(declare-fun b!220486 () Bool)

(declare-fun res!185738 () Bool)

(assert (=> b!220486 (=> (not res!185738) (not e!149741))))

(assert (=> b!220486 (= res!185738 (= (bvand (_1!10085 lt!348430) (onesLSBLong!0 nBits!265)) (_1!10085 lt!348430)))))

(declare-fun b!220487 () Bool)

(assert (=> b!220487 (= e!149743 (tuple2!18855 acc!113 bs!62))))

(declare-fun b!220488 () Bool)

(declare-fun lt!348431 () tuple2!18854)

(assert (=> b!220488 (= e!149743 (tuple2!18855 (_1!10085 lt!348431) (_2!10085 lt!348431)))))

(declare-fun lt!348428 () tuple2!18850)

(assert (=> b!220488 (= lt!348428 (readBit!0 bs!62))))

(assert (=> b!220488 (= lt!348431 (readNBitsLSBFirstsLoop!0 (_2!10083 lt!348428) nBits!265 (bvadd i!541 #b00000000000000000000000000000001) (bvor acc!113 (ite (_1!10083 lt!348428) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220489 () Bool)

(declare-fun lt!348427 () (_ BitVec 64))

(assert (=> b!220489 (= e!149742 (= (= (bvand (bvlshr (_1!10085 lt!348430) lt!348427) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10076 (readBitPure!0 bs!62))))))

(assert (=> b!220489 (and (bvsge lt!348427 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!348427 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!220489 (= lt!348427 ((_ sign_extend 32) i!541))))

(assert (= (and d!74275 c!10673) b!220487))

(assert (= (and d!74275 (not c!10673)) b!220488))

(assert (= (and d!74275 res!185736) b!220483))

(assert (= (and b!220483 res!185737) b!220484))

(assert (= (and b!220484 res!185739) b!220486))

(assert (= (and b!220486 res!185738) b!220485))

(assert (= (and b!220485 (not res!185735)) b!220489))

(assert (=> b!220488 m!339103))

(declare-fun m!339193 () Bool)

(assert (=> b!220488 m!339193))

(declare-fun m!339195 () Bool)

(assert (=> b!220483 m!339195))

(assert (=> b!220483 m!339097))

(declare-fun m!339197 () Bool)

(assert (=> b!220486 m!339197))

(declare-fun m!339199 () Bool)

(assert (=> b!220484 m!339199))

(assert (=> b!220489 m!339047))

(assert (=> d!74201 d!74275))

(push 1)

(assert (not d!74241))

(assert (not b!220483))

(assert (not b!220466))

(assert (not b!220489))

(assert (not b!220484))

(assert (not d!74251))

(assert (not b!220427))

(assert (not d!74245))

(assert (not d!74247))

(assert (not b!220486))

(assert (not b!220488))

(assert (not b!220453))

(check-sat)

(pop 1)

(push 1)

(check-sat)

