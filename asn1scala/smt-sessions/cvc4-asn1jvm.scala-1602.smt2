; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45506 () Bool)

(assert start!45506)

(declare-fun e!149658 () Bool)

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun b!220378 () Bool)

(declare-fun i!541 () (_ BitVec 32))

(declare-datatypes ((array!10745 0))(
  ( (array!10746 (arr!5649 (Array (_ BitVec 32) (_ BitVec 8))) (size!4719 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8546 0))(
  ( (BitStream!8547 (buf!5266 array!10745) (currentByte!9887 (_ BitVec 32)) (currentBit!9882 (_ BitVec 32))) )
))
(declare-fun lt!348175 () BitStream!8546)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220378 (= e!149658 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4719 (buf!5266 lt!348175))) ((_ sign_extend 32) (currentByte!9887 lt!348175)) ((_ sign_extend 32) (currentBit!9882 lt!348175)) ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541))))))))

(declare-fun b!220379 () Bool)

(declare-fun res!185643 () Bool)

(declare-fun e!149659 () Bool)

(assert (=> b!220379 (=> (not res!185643) (not e!149659))))

(declare-fun bs!62 () BitStream!8546)

(assert (=> b!220379 (= res!185643 (validate_offset_bits!1 ((_ sign_extend 32) (size!4719 (buf!5266 bs!62))) ((_ sign_extend 32) (currentByte!9887 bs!62)) ((_ sign_extend 32) (currentBit!9882 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220380 () Bool)

(declare-fun e!149660 () Bool)

(declare-fun array_inv!4460 (array!10745) Bool)

(assert (=> b!220380 (= e!149660 (array_inv!4460 (buf!5266 bs!62)))))

(declare-fun b!220381 () Bool)

(declare-fun res!185645 () Bool)

(assert (=> b!220381 (=> (not res!185645) (not e!149659))))

(declare-fun acc!113 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220381 (= res!185645 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!185641 () Bool)

(assert (=> start!45506 (=> (not res!185641) (not e!149659))))

(assert (=> start!45506 (= res!185641 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45506 e!149659))

(assert (=> start!45506 true))

(declare-fun inv!12 (BitStream!8546) Bool)

(assert (=> start!45506 (and (inv!12 bs!62) e!149660)))

(declare-fun b!220382 () Bool)

(assert (=> b!220382 (= e!149659 e!149658)))

(declare-fun res!185644 () Bool)

(assert (=> b!220382 (=> (not res!185644) (not e!149658))))

(assert (=> b!220382 (= res!185644 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!541)))))

(declare-fun withMovedBitIndex!0 (BitStream!8546 (_ BitVec 64)) BitStream!8546)

(assert (=> b!220382 (= lt!348175 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!18844 0))(
  ( (tuple2!18845 (_1!10080 BitStream!8546) (_2!10080 Bool)) )
))
(declare-fun lt!348174 () tuple2!18844)

(declare-fun readBitPure!0 (BitStream!8546) tuple2!18844)

(assert (=> b!220382 (= lt!348174 (readBitPure!0 bs!62))))

(declare-datatypes ((tuple2!18846 0))(
  ( (tuple2!18847 (_1!10081 BitStream!8546) (_2!10081 (_ BitVec 64))) )
))
(declare-fun lt!348176 () tuple2!18846)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8546 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18846)

(assert (=> b!220382 (= lt!348176 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun b!220383 () Bool)

(declare-fun res!185642 () Bool)

(assert (=> b!220383 (=> (not res!185642) (not e!149659))))

(assert (=> b!220383 (= res!185642 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(assert (= (and start!45506 res!185641) b!220379))

(assert (= (and b!220379 res!185643) b!220381))

(assert (= (and b!220381 res!185645) b!220383))

(assert (= (and b!220383 res!185642) b!220382))

(assert (= (and b!220382 res!185644) b!220378))

(assert (= start!45506 b!220380))

(declare-fun m!339069 () Bool)

(assert (=> b!220379 m!339069))

(declare-fun m!339071 () Bool)

(assert (=> b!220381 m!339071))

(declare-fun m!339073 () Bool)

(assert (=> b!220382 m!339073))

(declare-fun m!339075 () Bool)

(assert (=> b!220382 m!339075))

(declare-fun m!339077 () Bool)

(assert (=> b!220382 m!339077))

(declare-fun m!339079 () Bool)

(assert (=> start!45506 m!339079))

(declare-fun m!339081 () Bool)

(assert (=> b!220378 m!339081))

(declare-fun m!339083 () Bool)

(assert (=> b!220380 m!339083))

(push 1)

(assert (not b!220379))

(assert (not b!220380))

(assert (not b!220378))

(assert (not b!220382))

(assert (not b!220381))

(assert (not start!45506))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!74193 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!74193 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4719 (buf!5266 bs!62))) ((_ sign_extend 32) (currentByte!9887 bs!62)) ((_ sign_extend 32) (currentBit!9882 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4719 (buf!5266 bs!62))) ((_ sign_extend 32) (currentByte!9887 bs!62)) ((_ sign_extend 32) (currentBit!9882 bs!62))) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun bs!18143 () Bool)

(assert (= bs!18143 d!74193))

(declare-fun m!339091 () Bool)

(assert (=> bs!18143 m!339091))

(assert (=> b!220379 d!74193))

(declare-fun d!74195 () Bool)

(assert (=> d!74195 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4719 (buf!5266 lt!348175))) ((_ sign_extend 32) (currentByte!9887 lt!348175)) ((_ sign_extend 32) (currentBit!9882 lt!348175)) ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4719 (buf!5266 lt!348175))) ((_ sign_extend 32) (currentByte!9887 lt!348175)) ((_ sign_extend 32) (currentBit!9882 lt!348175))) ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541)))))))

(declare-fun bs!18144 () Bool)

(assert (= bs!18144 d!74195))

(declare-fun m!339093 () Bool)

(assert (=> bs!18144 m!339093))

(assert (=> b!220378 d!74195))

(declare-fun d!74197 () Bool)

(declare-fun e!149670 () Bool)

(assert (=> d!74197 e!149670))

(declare-fun res!185654 () Bool)

(assert (=> d!74197 (=> (not res!185654) (not e!149670))))

(declare-fun lt!348206 () (_ BitVec 64))

(declare-fun lt!348205 () BitStream!8546)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!74197 (= res!185654 (= (bvadd lt!348206 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4719 (buf!5266 lt!348205)) (currentByte!9887 lt!348205) (currentBit!9882 lt!348205))))))

(assert (=> d!74197 (or (not (= (bvand lt!348206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348206 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74197 (= lt!348206 (bitIndex!0 (size!4719 (buf!5266 bs!62)) (currentByte!9887 bs!62) (currentBit!9882 bs!62)))))

(declare-datatypes ((Unit!15587 0))(
  ( (Unit!15588) )
))
(declare-datatypes ((tuple2!18860 0))(
  ( (tuple2!18861 (_1!10088 Unit!15587) (_2!10088 BitStream!8546)) )
))
(declare-fun moveBitIndex!0 (BitStream!8546 (_ BitVec 64)) tuple2!18860)

(assert (=> d!74197 (= lt!348205 (_2!10088 (moveBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8546 (_ BitVec 64)) Bool)

(assert (=> d!74197 (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!74197 (= (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) lt!348205)))

(declare-fun b!220392 () Bool)

(assert (=> b!220392 (= e!149670 (= (size!4719 (buf!5266 bs!62)) (size!4719 (buf!5266 lt!348205))))))

(assert (= (and d!74197 res!185654) b!220392))

(declare-fun m!339125 () Bool)

(assert (=> d!74197 m!339125))

(declare-fun m!339127 () Bool)

(assert (=> d!74197 m!339127))

(declare-fun m!339129 () Bool)

(assert (=> d!74197 m!339129))

(declare-fun m!339131 () Bool)

(assert (=> d!74197 m!339131))

(assert (=> b!220382 d!74197))

(declare-fun d!74215 () Bool)

(declare-datatypes ((tuple2!18862 0))(
  ( (tuple2!18863 (_1!10089 Bool) (_2!10089 BitStream!8546)) )
))
(declare-fun lt!348209 () tuple2!18862)

(declare-fun readBit!0 (BitStream!8546) tuple2!18862)

(assert (=> d!74215 (= lt!348209 (readBit!0 bs!62))))

(assert (=> d!74215 (= (readBitPure!0 bs!62) (tuple2!18845 (_2!10089 lt!348209) (_1!10089 lt!348209)))))

(declare-fun bs!18152 () Bool)

(assert (= bs!18152 d!74215))

(declare-fun m!339133 () Bool)

(assert (=> bs!18152 m!339133))

(assert (=> b!220382 d!74215))

(declare-datatypes ((tuple2!18864 0))(
  ( (tuple2!18865 (_1!10090 (_ BitVec 64)) (_2!10090 BitStream!8546)) )
))
(declare-fun lt!348212 () tuple2!18864)

(declare-fun d!74217 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8546 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18864)

(assert (=> d!74217 (= lt!348212 (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113))))

(assert (=> d!74217 (= (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113) (tuple2!18847 (_2!10090 lt!348212) (_1!10090 lt!348212)))))

(declare-fun bs!18153 () Bool)

(assert (= bs!18153 d!74217))

(declare-fun m!339135 () Bool)

(assert (=> bs!18153 m!339135))

(assert (=> b!220382 d!74217))

(declare-fun d!74219 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!74219 (= (inv!12 bs!62) (invariant!0 (currentBit!9882 bs!62) (currentByte!9887 bs!62) (size!4719 (buf!5266 bs!62))))))

(declare-fun bs!18154 () Bool)

(assert (= bs!18154 d!74219))

(declare-fun m!339137 () Bool)

(assert (=> bs!18154 m!339137))

(assert (=> start!45506 d!74219))

(declare-fun d!74221 () Bool)

(assert (=> d!74221 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541)) (ite (= (bvsub #b00000000000000000000000001000000 i!541) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!541))))))))

(assert (=> b!220381 d!74221))

(declare-fun d!74223 () Bool)

(assert (=> d!74223 (= (array_inv!4460 (buf!5266 bs!62)) (bvsge (size!4719 (buf!5266 bs!62)) #b00000000000000000000000000000000))))

(assert (=> b!220380 d!74223))

(push 1)

(assert (not d!74219))

(assert (not d!74197))

(assert (not d!74195))

(assert (not d!74215))

(assert (not d!74193))

(assert (not d!74217))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!74253 () Bool)

(declare-fun e!149717 () Bool)

(assert (=> d!74253 e!149717))

(declare-fun res!185703 () Bool)

(assert (=> d!74253 (=> (not res!185703) (not e!149717))))

(declare-fun increaseBitIndex!0 (BitStream!8546) tuple2!18860)

(assert (=> d!74253 (= res!185703 (= (buf!5266 (_2!10088 (increaseBitIndex!0 bs!62))) (buf!5266 bs!62)))))

(declare-fun lt!348359 () Bool)

(assert (=> d!74253 (= lt!348359 (not (= (bvand ((_ sign_extend 24) (select (arr!5649 (buf!5266 bs!62)) (currentByte!9887 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9882 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348360 () tuple2!18862)

(assert (=> d!74253 (= lt!348360 (tuple2!18863 (not (= (bvand ((_ sign_extend 24) (select (arr!5649 (buf!5266 bs!62)) (currentByte!9887 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9882 bs!62)))) #b00000000000000000000000000000000)) (_2!10088 (increaseBitIndex!0 bs!62))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!74253 (validate_offset_bit!0 ((_ sign_extend 32) (size!4719 (buf!5266 bs!62))) ((_ sign_extend 32) (currentByte!9887 bs!62)) ((_ sign_extend 32) (currentBit!9882 bs!62)))))

(assert (=> d!74253 (= (readBit!0 bs!62) lt!348360)))

(declare-fun lt!348356 () (_ BitVec 64))

(declare-fun lt!348362 () (_ BitVec 64))

(declare-fun b!220448 () Bool)

(assert (=> b!220448 (= e!149717 (= (bitIndex!0 (size!4719 (buf!5266 (_2!10088 (increaseBitIndex!0 bs!62)))) (currentByte!9887 (_2!10088 (increaseBitIndex!0 bs!62))) (currentBit!9882 (_2!10088 (increaseBitIndex!0 bs!62)))) (bvadd lt!348362 lt!348356)))))

(assert (=> b!220448 (or (not (= (bvand lt!348362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348356 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348362 lt!348356) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!220448 (= lt!348356 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!220448 (= lt!348362 (bitIndex!0 (size!4719 (buf!5266 bs!62)) (currentByte!9887 bs!62) (currentBit!9882 bs!62)))))

(declare-fun lt!348361 () Bool)

(assert (=> b!220448 (= lt!348361 (not (= (bvand ((_ sign_extend 24) (select (arr!5649 (buf!5266 bs!62)) (currentByte!9887 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9882 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348357 () Bool)

(assert (=> b!220448 (= lt!348357 (not (= (bvand ((_ sign_extend 24) (select (arr!5649 (buf!5266 bs!62)) (currentByte!9887 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9882 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348358 () Bool)

(assert (=> b!220448 (= lt!348358 (not (= (bvand ((_ sign_extend 24) (select (arr!5649 (buf!5266 bs!62)) (currentByte!9887 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9882 bs!62)))) #b00000000000000000000000000000000)))))

(assert (= (and d!74253 res!185703) b!220448))

(declare-fun m!339177 () Bool)

(assert (=> d!74253 m!339177))

(declare-fun m!339179 () Bool)

(assert (=> d!74253 m!339179))

(declare-fun m!339181 () Bool)

(assert (=> d!74253 m!339181))

(declare-fun m!339183 () Bool)

(assert (=> d!74253 m!339183))

(assert (=> b!220448 m!339181))

(assert (=> b!220448 m!339179))

(assert (=> b!220448 m!339177))

(declare-fun m!339185 () Bool)

(assert (=> b!220448 m!339185))

(assert (=> b!220448 m!339127))

(assert (=> d!74215 d!74253))

(declare-fun d!74257 () Bool)

(assert (=> d!74257 (= (invariant!0 (currentBit!9882 bs!62) (currentByte!9887 bs!62) (size!4719 (buf!5266 bs!62))) (and (bvsge (currentBit!9882 bs!62) #b00000000000000000000000000000000) (bvslt (currentBit!9882 bs!62) #b00000000000000000000000000001000) (bvsge (currentByte!9887 bs!62) #b00000000000000000000000000000000) (or (bvslt (currentByte!9887 bs!62) (size!4719 (buf!5266 bs!62))) (and (= (currentBit!9882 bs!62) #b00000000000000000000000000000000) (= (currentByte!9887 bs!62) (size!4719 (buf!5266 bs!62)))))))))

(assert (=> d!74219 d!74257))

(declare-fun d!74259 () Bool)

(declare-fun e!149726 () Bool)

(assert (=> d!74259 e!149726))

(declare-fun res!185714 () Bool)

(assert (=> d!74259 (=> (not res!185714) (not e!149726))))

(declare-fun lt!348396 () (_ BitVec 64))

(declare-fun lt!348398 () (_ BitVec 64))

(declare-fun lt!348394 () (_ BitVec 64))

(assert (=> d!74259 (= res!185714 (= lt!348394 (bvsub lt!348396 lt!348398)))))

(assert (=> d!74259 (or (= (bvand lt!348396 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348398 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!348396 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!348396 lt!348398) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74259 (= lt!348398 (remainingBits!0 ((_ sign_extend 32) (size!4719 (buf!5266 lt!348205))) ((_ sign_extend 32) (currentByte!9887 lt!348205)) ((_ sign_extend 32) (currentBit!9882 lt!348205))))))

(declare-fun lt!348393 () (_ BitVec 64))

(declare-fun lt!348397 () (_ BitVec 64))

(assert (=> d!74259 (= lt!348396 (bvmul lt!348393 lt!348397))))

(assert (=> d!74259 (or (= lt!348393 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!348397 (bvsdiv (bvmul lt!348393 lt!348397) lt!348393)))))

(assert (=> d!74259 (= lt!348397 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74259 (= lt!348393 ((_ sign_extend 32) (size!4719 (buf!5266 lt!348205))))))

(assert (=> d!74259 (= lt!348394 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9887 lt!348205)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9882 lt!348205))))))

(assert (=> d!74259 (invariant!0 (currentBit!9882 lt!348205) (currentByte!9887 lt!348205) (size!4719 (buf!5266 lt!348205)))))

(assert (=> d!74259 (= (bitIndex!0 (size!4719 (buf!5266 lt!348205)) (currentByte!9887 lt!348205) (currentBit!9882 lt!348205)) lt!348394)))

(declare-fun b!220459 () Bool)

(declare-fun res!185715 () Bool)

(assert (=> b!220459 (=> (not res!185715) (not e!149726))))

(assert (=> b!220459 (= res!185715 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!348394))))

(declare-fun b!220460 () Bool)

(declare-fun lt!348395 () (_ BitVec 64))

(assert (=> b!220460 (= e!149726 (bvsle lt!348394 (bvmul lt!348395 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!220460 (or (= lt!348395 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!348395 #b0000000000000000000000000000000000000000000000000000000000001000) lt!348395)))))

(assert (=> b!220460 (= lt!348395 ((_ sign_extend 32) (size!4719 (buf!5266 lt!348205))))))

(assert (= (and d!74259 res!185714) b!220459))

(assert (= (and b!220459 res!185715) b!220460))

(declare-fun m!339189 () Bool)

(assert (=> d!74259 m!339189))

(declare-fun m!339191 () Bool)

(assert (=> d!74259 m!339191))

(assert (=> d!74197 d!74259))

(declare-fun d!74263 () Bool)

(declare-fun e!149727 () Bool)

(assert (=> d!74263 e!149727))

(declare-fun res!185716 () Bool)

(assert (=> d!74263 (=> (not res!185716) (not e!149727))))

(declare-fun lt!348404 () (_ BitVec 64))

(declare-fun lt!348400 () (_ BitVec 64))

(declare-fun lt!348402 () (_ BitVec 64))

(assert (=> d!74263 (= res!185716 (= lt!348400 (bvsub lt!348402 lt!348404)))))

(assert (=> d!74263 (or (= (bvand lt!348402 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348404 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!348402 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!348402 lt!348404) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74263 (= lt!348404 (remainingBits!0 ((_ sign_extend 32) (size!4719 (buf!5266 bs!62))) ((_ sign_extend 32) (currentByte!9887 bs!62)) ((_ sign_extend 32) (currentBit!9882 bs!62))))))

(declare-fun lt!348399 () (_ BitVec 64))

(declare-fun lt!348403 () (_ BitVec 64))

(assert (=> d!74263 (= lt!348402 (bvmul lt!348399 lt!348403))))

(assert (=> d!74263 (or (= lt!348399 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!348403 (bvsdiv (bvmul lt!348399 lt!348403) lt!348399)))))

(assert (=> d!74263 (= lt!348403 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74263 (= lt!348399 ((_ sign_extend 32) (size!4719 (buf!5266 bs!62))))))

(assert (=> d!74263 (= lt!348400 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9887 bs!62)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9882 bs!62))))))

(assert (=> d!74263 (invariant!0 (currentBit!9882 bs!62) (currentByte!9887 bs!62) (size!4719 (buf!5266 bs!62)))))

(assert (=> d!74263 (= (bitIndex!0 (size!4719 (buf!5266 bs!62)) (currentByte!9887 bs!62) (currentBit!9882 bs!62)) lt!348400)))

(declare-fun b!220461 () Bool)

(declare-fun res!185717 () Bool)

(assert (=> b!220461 (=> (not res!185717) (not e!149727))))

(assert (=> b!220461 (= res!185717 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!348400))))

(declare-fun b!220462 () Bool)

(declare-fun lt!348401 () (_ BitVec 64))

(assert (=> b!220462 (= e!149727 (bvsle lt!348400 (bvmul lt!348401 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!220462 (or (= lt!348401 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!348401 #b0000000000000000000000000000000000000000000000000000000000001000) lt!348401)))))

(assert (=> b!220462 (= lt!348401 ((_ sign_extend 32) (size!4719 (buf!5266 bs!62))))))

(assert (= (and d!74263 res!185716) b!220461))

(assert (= (and b!220461 res!185717) b!220462))

(assert (=> d!74263 m!339091))

(assert (=> d!74263 m!339137))

(assert (=> d!74197 d!74263))

(declare-fun d!74265 () Bool)

(declare-fun lt!348440 () (_ BitVec 32))

(assert (=> d!74265 (= lt!348440 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!348441 () (_ BitVec 32))

(assert (=> d!74265 (= lt!348441 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!149745 () Bool)

(assert (=> d!74265 e!149745))

(declare-fun res!185740 () Bool)

(assert (=> d!74265 (=> (not res!185740) (not e!149745))))

(assert (=> d!74265 (= res!185740 (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!15601 () Unit!15587)

(declare-fun Unit!15602 () Unit!15587)

(declare-fun Unit!15603 () Unit!15587)

(assert (=> d!74265 (= (moveBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!9882 bs!62) lt!348440) #b00000000000000000000000000000000) (tuple2!18861 Unit!15601 (BitStream!8547 (buf!5266 bs!62) (bvsub (bvadd (currentByte!9887 bs!62) lt!348441) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!348440 (currentBit!9882 bs!62)))) (ite (bvsge (bvadd (currentBit!9882 bs!62) lt!348440) #b00000000000000000000000000001000) (tuple2!18861 Unit!15602 (BitStream!8547 (buf!5266 bs!62) (bvadd (currentByte!9887 bs!62) lt!348441 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9882 bs!62) lt!348440) #b00000000000000000000000000001000))) (tuple2!18861 Unit!15603 (BitStream!8547 (buf!5266 bs!62) (bvadd (currentByte!9887 bs!62) lt!348441) (bvadd (currentBit!9882 bs!62) lt!348440))))))))

(declare-fun b!220492 () Bool)

(declare-fun e!149744 () Bool)

(assert (=> b!220492 (= e!149745 e!149744)))

(declare-fun res!185741 () Bool)

(assert (=> b!220492 (=> (not res!185741) (not e!149744))))

(declare-fun lt!348443 () (_ BitVec 64))

(declare-fun lt!348438 () tuple2!18860)

(assert (=> b!220492 (= res!185741 (= (bvadd lt!348443 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4719 (buf!5266 (_2!10088 lt!348438))) (currentByte!9887 (_2!10088 lt!348438)) (currentBit!9882 (_2!10088 lt!348438)))))))

(assert (=> b!220492 (or (not (= (bvand lt!348443 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348443 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348443 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!220492 (= lt!348443 (bitIndex!0 (size!4719 (buf!5266 bs!62)) (currentByte!9887 bs!62) (currentBit!9882 bs!62)))))

(declare-fun lt!348439 () (_ BitVec 32))

(declare-fun lt!348442 () (_ BitVec 32))

(declare-fun Unit!15604 () Unit!15587)

(declare-fun Unit!15605 () Unit!15587)

(declare-fun Unit!15606 () Unit!15587)

(assert (=> b!220492 (= lt!348438 (ite (bvslt (bvadd (currentBit!9882 bs!62) lt!348442) #b00000000000000000000000000000000) (tuple2!18861 Unit!15604 (BitStream!8547 (buf!5266 bs!62) (bvsub (bvadd (currentByte!9887 bs!62) lt!348439) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!348442 (currentBit!9882 bs!62)))) (ite (bvsge (bvadd (currentBit!9882 bs!62) lt!348442) #b00000000000000000000000000001000) (tuple2!18861 Unit!15605 (BitStream!8547 (buf!5266 bs!62) (bvadd (currentByte!9887 bs!62) lt!348439 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9882 bs!62) lt!348442) #b00000000000000000000000000001000))) (tuple2!18861 Unit!15606 (BitStream!8547 (buf!5266 bs!62) (bvadd (currentByte!9887 bs!62) lt!348439) (bvadd (currentBit!9882 bs!62) lt!348442))))))))

(assert (=> b!220492 (= lt!348442 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!220492 (= lt!348439 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!220493 () Bool)

(assert (=> b!220493 (= e!149744 (and (= (size!4719 (buf!5266 bs!62)) (size!4719 (buf!5266 (_2!10088 lt!348438)))) (= (buf!5266 bs!62) (buf!5266 (_2!10088 lt!348438)))))))

(assert (= (and d!74265 res!185740) b!220492))

(assert (= (and b!220492 res!185741) b!220493))

(assert (=> d!74265 m!339131))

(declare-fun m!339201 () Bool)

(assert (=> b!220492 m!339201))

(assert (=> b!220492 m!339127))

(assert (=> d!74197 d!74265))

(declare-fun d!74277 () Bool)

(declare-fun res!185744 () Bool)

(declare-fun e!149748 () Bool)

(assert (=> d!74277 (=> (not res!185744) (not e!149748))))

(assert (=> d!74277 (= res!185744 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4719 (buf!5266 bs!62)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4719 (buf!5266 bs!62)))))))))

(assert (=> d!74277 (= (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) e!149748)))

(declare-fun b!220497 () Bool)

(declare-fun lt!348446 () (_ BitVec 64))

(assert (=> b!220497 (= e!149748 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!348446) (bvsle lt!348446 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4719 (buf!5266 bs!62)))))))))

(assert (=> b!220497 (= lt!348446 (bvadd (bitIndex!0 (size!4719 (buf!5266 bs!62)) (currentByte!9887 bs!62) (currentBit!9882 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!74277 res!185744) b!220497))

(assert (=> b!220497 m!339127))

(assert (=> d!74197 d!74277))

(declare-fun d!74279 () Bool)

(assert (=> d!74279 (= (remainingBits!0 ((_ sign_extend 32) (size!4719 (buf!5266 bs!62))) ((_ sign_extend 32) (currentByte!9887 bs!62)) ((_ sign_extend 32) (currentBit!9882 bs!62))) (bvsub (bvmul ((_ sign_extend 32) (size!4719 (buf!5266 bs!62))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9887 bs!62)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9882 bs!62)))))))

(assert (=> d!74193 d!74279))

(declare-fun d!74281 () Bool)

(assert (=> d!74281 (= (remainingBits!0 ((_ sign_extend 32) (size!4719 (buf!5266 lt!348175))) ((_ sign_extend 32) (currentByte!9887 lt!348175)) ((_ sign_extend 32) (currentBit!9882 lt!348175))) (bvsub (bvmul ((_ sign_extend 32) (size!4719 (buf!5266 lt!348175))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9887 lt!348175)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9882 lt!348175)))))))

(assert (=> d!74195 d!74281))

(declare-fun b!220512 () Bool)

(declare-fun e!149756 () Bool)

(declare-fun e!149755 () Bool)

(assert (=> b!220512 (= e!149756 e!149755)))

(declare-fun res!185755 () Bool)

(assert (=> b!220512 (=> res!185755 e!149755)))

(assert (=> b!220512 (= res!185755 (not (bvslt i!541 nBits!265)))))

(declare-fun b!220513 () Bool)

(declare-fun e!149757 () tuple2!18864)

(assert (=> b!220513 (= e!149757 (tuple2!18865 acc!113 bs!62))))

(declare-fun b!220514 () Bool)

(declare-fun res!185757 () Bool)

(assert (=> b!220514 (=> (not res!185757) (not e!149756))))

(declare-fun lt!348462 () (_ BitVec 64))

(declare-fun lt!348464 () tuple2!18864)

(declare-fun lt!348460 () (_ BitVec 64))

(assert (=> b!220514 (= res!185757 (= (bitIndex!0 (size!4719 (buf!5266 (_2!10090 lt!348464))) (currentByte!9887 (_2!10090 lt!348464)) (currentBit!9882 (_2!10090 lt!348464))) (bvadd lt!348460 lt!348462)))))

(assert (=> b!220514 (or (not (= (bvand lt!348460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348462 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348460 lt!348462) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!220514 (= lt!348462 ((_ sign_extend 32) (bvsub nBits!265 i!541)))))

(assert (=> b!220514 (or (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand i!541 #b10000000000000000000000000000000)) (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 i!541) #b10000000000000000000000000000000)))))

(assert (=> b!220514 (= lt!348460 (bitIndex!0 (size!4719 (buf!5266 bs!62)) (currentByte!9887 bs!62) (currentBit!9882 bs!62)))))

(declare-fun b!220515 () Bool)

(declare-fun res!185758 () Bool)

(assert (=> b!220515 (=> (not res!185758) (not e!149756))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220515 (= res!185758 (= (bvand (_1!10090 lt!348464) (onesLSBLong!0 i!541)) (bvand acc!113 (onesLSBLong!0 i!541))))))

(declare-fun d!74283 () Bool)

(assert (=> d!74283 e!149756))

(declare-fun res!185756 () Bool)

(assert (=> d!74283 (=> (not res!185756) (not e!149756))))

(assert (=> d!74283 (= res!185756 (= (buf!5266 (_2!10090 lt!348464)) (buf!5266 bs!62)))))

(assert (=> d!74283 (= lt!348464 e!149757)))

(declare-fun c!10676 () Bool)

(assert (=> d!74283 (= c!10676 (= nBits!265 i!541))))

(assert (=> d!74283 (and (bvsle #b00000000000000000000000000000000 i!541) (bvsle i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000))))

(assert (=> d!74283 (= (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113) lt!348464)))

(declare-fun b!220516 () Bool)

(declare-fun lt!348461 () tuple2!18864)

(assert (=> b!220516 (= e!149757 (tuple2!18865 (_1!10090 lt!348461) (_2!10090 lt!348461)))))

(declare-fun lt!348463 () tuple2!18862)

(assert (=> b!220516 (= lt!348463 (readBit!0 bs!62))))

(assert (=> b!220516 (= lt!348461 (readNBitsLSBFirstsLoop!0 (_2!10089 lt!348463) nBits!265 (bvadd i!541 #b00000000000000000000000000000001) (bvor acc!113 (ite (_1!10089 lt!348463) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220517 () Bool)

(declare-fun res!185759 () Bool)

(assert (=> b!220517 (=> (not res!185759) (not e!149756))))

(assert (=> b!220517 (= res!185759 (= (bvand (_1!10090 lt!348464) (onesLSBLong!0 nBits!265)) (_1!10090 lt!348464)))))

(declare-fun lt!348459 () (_ BitVec 64))

(declare-fun b!220518 () Bool)

(assert (=> b!220518 (= e!149755 (= (= (bvand (bvlshr (_1!10090 lt!348464) lt!348459) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10080 (readBitPure!0 bs!62))))))

(assert (=> b!220518 (and (bvsge lt!348459 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!348459 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!220518 (= lt!348459 ((_ sign_extend 32) i!541))))

(assert (= (and d!74283 c!10676) b!220513))

(assert (= (and d!74283 (not c!10676)) b!220516))

(assert (= (and d!74283 res!185756) b!220514))

(assert (= (and b!220514 res!185757) b!220515))

(assert (= (and b!220515 res!185758) b!220517))

(assert (= (and b!220517 res!185759) b!220512))

(assert (= (and b!220512 (not res!185755)) b!220518))

(assert (=> b!220516 m!339133))

(declare-fun m!339203 () Bool)

(assert (=> b!220516 m!339203))

(assert (=> b!220518 m!339075))

(declare-fun m!339205 () Bool)

(assert (=> b!220517 m!339205))

(declare-fun m!339207 () Bool)

(assert (=> b!220514 m!339207))

(assert (=> b!220514 m!339127))

(declare-fun m!339209 () Bool)

(assert (=> b!220515 m!339209))

(assert (=> d!74217 d!74283))

(push 1)

(assert (not d!74263))

(assert (not d!74259))

(assert (not d!74253))

(assert (not b!220514))

(assert (not b!220497))

(assert (not b!220448))

(assert (not d!74265))

(assert (not b!220517))

(assert (not b!220518))

(assert (not b!220516))

(assert (not b!220492))

(assert (not b!220515))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

