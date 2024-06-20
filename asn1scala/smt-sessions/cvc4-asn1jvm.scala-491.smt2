; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14530 () Bool)

(assert start!14530)

(declare-fun b!75133 () Bool)

(declare-fun e!49156 () Bool)

(declare-datatypes ((array!3068 0))(
  ( (array!3069 (arr!2030 (Array (_ BitVec 32) (_ BitVec 8))) (size!1432 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2438 0))(
  ( (BitStream!2439 (buf!1813 array!3068) (currentByte!3577 (_ BitVec 32)) (currentBit!3572 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2438)

(declare-fun array_inv!1278 (array!3068) Bool)

(assert (=> b!75133 (= e!49156 (array_inv!1278 (buf!1813 thiss!1379)))))

(declare-fun b!75134 () Bool)

(declare-fun e!49155 () Bool)

(declare-fun e!49154 () Bool)

(assert (=> b!75134 (= e!49155 e!49154)))

(declare-fun res!62093 () Bool)

(assert (=> b!75134 (=> res!62093 e!49154)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!75134 (= res!62093 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6486 0))(
  ( (tuple2!6487 (_1!3365 BitStream!2438) (_2!3365 BitStream!2438)) )
))
(declare-fun lt!120804 () tuple2!6486)

(declare-datatypes ((tuple2!6488 0))(
  ( (tuple2!6489 (_1!3366 array!3068) (_2!3366 BitStream!2438)) )
))
(declare-fun lt!120805 () tuple2!6488)

(declare-fun readBits!0 (BitStream!2438 (_ BitVec 64)) tuple2!6488)

(assert (=> b!75134 (= lt!120805 (readBits!0 (_1!3365 lt!120804) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!2438 BitStream!2438) tuple2!6486)

(assert (=> b!75134 (= lt!120804 (reader!0 thiss!1379 thiss!1379))))

(declare-fun b!75135 () Bool)

(declare-fun e!49158 () Bool)

(assert (=> b!75135 (= e!49158 (not e!49155))))

(declare-fun res!62095 () Bool)

(assert (=> b!75135 (=> res!62095 e!49155)))

(declare-fun lt!120806 () (_ BitVec 64))

(assert (=> b!75135 (= res!62095 (or (bvslt i!635 to!314) (not (= lt!120806 (bvsub (bvadd lt!120806 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2438 BitStream!2438) Bool)

(assert (=> b!75135 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4955 0))(
  ( (Unit!4956) )
))
(declare-fun lt!120807 () Unit!4955)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2438) Unit!4955)

(assert (=> b!75135 (= lt!120807 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75135 (= lt!120806 (bitIndex!0 (size!1432 (buf!1813 thiss!1379)) (currentByte!3577 thiss!1379) (currentBit!3572 thiss!1379)))))

(declare-fun res!62094 () Bool)

(assert (=> start!14530 (=> (not res!62094) (not e!49158))))

(declare-fun srcBuffer!2 () array!3068)

(assert (=> start!14530 (= res!62094 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1432 srcBuffer!2))))))))

(assert (=> start!14530 e!49158))

(assert (=> start!14530 true))

(assert (=> start!14530 (array_inv!1278 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2438) Bool)

(assert (=> start!14530 (and (inv!12 thiss!1379) e!49156)))

(declare-fun b!75136 () Bool)

(declare-fun res!62091 () Bool)

(assert (=> b!75136 (=> (not res!62091) (not e!49158))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75136 (= res!62091 (validate_offset_bits!1 ((_ sign_extend 32) (size!1432 (buf!1813 thiss!1379))) ((_ sign_extend 32) (currentByte!3577 thiss!1379)) ((_ sign_extend 32) (currentBit!3572 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75137 () Bool)

(assert (=> b!75137 (= e!49154 (inv!12 (BitStream!2439 (buf!1813 (_1!3365 lt!120804)) (currentByte!3577 (_2!3366 lt!120805)) (currentBit!3572 (_2!3366 lt!120805)))))))

(declare-fun checkByteArrayBitContent!0 (BitStream!2438 array!3068 array!3068 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75137 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3366 lt!120805) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!75138 () Bool)

(declare-fun res!62092 () Bool)

(assert (=> b!75138 (=> res!62092 e!49155)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75138 (= res!62092 (not (invariant!0 (currentBit!3572 thiss!1379) (currentByte!3577 thiss!1379) (size!1432 (buf!1813 thiss!1379)))))))

(assert (= (and start!14530 res!62094) b!75136))

(assert (= (and b!75136 res!62091) b!75135))

(assert (= (and b!75135 (not res!62095)) b!75138))

(assert (= (and b!75138 (not res!62092)) b!75134))

(assert (= (and b!75134 (not res!62093)) b!75137))

(assert (= start!14530 b!75133))

(declare-fun m!120227 () Bool)

(assert (=> b!75138 m!120227))

(declare-fun m!120229 () Bool)

(assert (=> b!75134 m!120229))

(declare-fun m!120231 () Bool)

(assert (=> b!75134 m!120231))

(declare-fun m!120233 () Bool)

(assert (=> b!75137 m!120233))

(declare-fun m!120235 () Bool)

(assert (=> b!75137 m!120235))

(declare-fun m!120237 () Bool)

(assert (=> b!75136 m!120237))

(declare-fun m!120239 () Bool)

(assert (=> start!14530 m!120239))

(declare-fun m!120241 () Bool)

(assert (=> start!14530 m!120241))

(declare-fun m!120243 () Bool)

(assert (=> b!75133 m!120243))

(declare-fun m!120245 () Bool)

(assert (=> b!75135 m!120245))

(declare-fun m!120247 () Bool)

(assert (=> b!75135 m!120247))

(declare-fun m!120249 () Bool)

(assert (=> b!75135 m!120249))

(push 1)

(assert (not b!75133))

(assert (not b!75137))

(assert (not b!75138))

(assert (not start!14530))

(assert (not b!75135))

(assert (not b!75136))

(assert (not b!75134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!23886 () Bool)

(declare-fun res!62108 () Bool)

(declare-fun e!49170 () Bool)

(assert (=> d!23886 (=> (not res!62108) (not e!49170))))

(assert (=> d!23886 (= res!62108 (= (size!1432 (buf!1813 thiss!1379)) (size!1432 (buf!1813 thiss!1379))))))

(assert (=> d!23886 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!49170)))

(declare-fun b!75151 () Bool)

(declare-fun res!62109 () Bool)

(assert (=> b!75151 (=> (not res!62109) (not e!49170))))

(assert (=> b!75151 (= res!62109 (bvsle (bitIndex!0 (size!1432 (buf!1813 thiss!1379)) (currentByte!3577 thiss!1379) (currentBit!3572 thiss!1379)) (bitIndex!0 (size!1432 (buf!1813 thiss!1379)) (currentByte!3577 thiss!1379) (currentBit!3572 thiss!1379))))))

(declare-fun b!75152 () Bool)

(declare-fun e!49169 () Bool)

(assert (=> b!75152 (= e!49170 e!49169)))

(declare-fun res!62110 () Bool)

(assert (=> b!75152 (=> res!62110 e!49169)))

(assert (=> b!75152 (= res!62110 (= (size!1432 (buf!1813 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!75153 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3068 array!3068 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75153 (= e!49169 (arrayBitRangesEq!0 (buf!1813 thiss!1379) (buf!1813 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1432 (buf!1813 thiss!1379)) (currentByte!3577 thiss!1379) (currentBit!3572 thiss!1379))))))

(assert (= (and d!23886 res!62108) b!75151))

(assert (= (and b!75151 res!62109) b!75152))

(assert (= (and b!75152 (not res!62110)) b!75153))

(assert (=> b!75151 m!120249))

(assert (=> b!75151 m!120249))

(assert (=> b!75153 m!120249))

(assert (=> b!75153 m!120249))

(declare-fun m!120265 () Bool)

(assert (=> b!75153 m!120265))

(assert (=> b!75135 d!23886))

(declare-fun d!23892 () Bool)

(assert (=> d!23892 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!120810 () Unit!4955)

(declare-fun choose!11 (BitStream!2438) Unit!4955)

(assert (=> d!23892 (= lt!120810 (choose!11 thiss!1379))))

(assert (=> d!23892 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!120810)))

(declare-fun bs!5743 () Bool)

(assert (= bs!5743 d!23892))

(assert (=> bs!5743 m!120245))

(declare-fun m!120267 () Bool)

(assert (=> bs!5743 m!120267))

(assert (=> b!75135 d!23892))

(declare-fun d!23894 () Bool)

(declare-fun e!49173 () Bool)

(assert (=> d!23894 e!49173))

(declare-fun res!62115 () Bool)

(assert (=> d!23894 (=> (not res!62115) (not e!49173))))

(declare-fun lt!120823 () (_ BitVec 64))

(declare-fun lt!120827 () (_ BitVec 64))

(declare-fun lt!120825 () (_ BitVec 64))

(assert (=> d!23894 (= res!62115 (= lt!120827 (bvsub lt!120825 lt!120823)))))

(assert (=> d!23894 (or (= (bvand lt!120825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120823 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!120825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120825 lt!120823) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23894 (= lt!120823 (remainingBits!0 ((_ sign_extend 32) (size!1432 (buf!1813 thiss!1379))) ((_ sign_extend 32) (currentByte!3577 thiss!1379)) ((_ sign_extend 32) (currentBit!3572 thiss!1379))))))

(declare-fun lt!120824 () (_ BitVec 64))

(declare-fun lt!120826 () (_ BitVec 64))

(assert (=> d!23894 (= lt!120825 (bvmul lt!120824 lt!120826))))

(assert (=> d!23894 (or (= lt!120824 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!120826 (bvsdiv (bvmul lt!120824 lt!120826) lt!120824)))))

(assert (=> d!23894 (= lt!120826 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23894 (= lt!120824 ((_ sign_extend 32) (size!1432 (buf!1813 thiss!1379))))))

(assert (=> d!23894 (= lt!120827 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3577 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3572 thiss!1379))))))

(assert (=> d!23894 (invariant!0 (currentBit!3572 thiss!1379) (currentByte!3577 thiss!1379) (size!1432 (buf!1813 thiss!1379)))))

(assert (=> d!23894 (= (bitIndex!0 (size!1432 (buf!1813 thiss!1379)) (currentByte!3577 thiss!1379) (currentBit!3572 thiss!1379)) lt!120827)))

(declare-fun b!75158 () Bool)

(declare-fun res!62116 () Bool)

(assert (=> b!75158 (=> (not res!62116) (not e!49173))))

(assert (=> b!75158 (= res!62116 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!120827))))

(declare-fun b!75159 () Bool)

(declare-fun lt!120828 () (_ BitVec 64))

(assert (=> b!75159 (= e!49173 (bvsle lt!120827 (bvmul lt!120828 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!75159 (or (= lt!120828 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!120828 #b0000000000000000000000000000000000000000000000000000000000001000) lt!120828)))))

(assert (=> b!75159 (= lt!120828 ((_ sign_extend 32) (size!1432 (buf!1813 thiss!1379))))))

(assert (= (and d!23894 res!62115) b!75158))

(assert (= (and b!75158 res!62116) b!75159))

(declare-fun m!120269 () Bool)

(assert (=> d!23894 m!120269))

(assert (=> d!23894 m!120227))

(assert (=> b!75135 d!23894))

(declare-fun d!23896 () Bool)

(assert (=> d!23896 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1432 (buf!1813 thiss!1379))) ((_ sign_extend 32) (currentByte!3577 thiss!1379)) ((_ sign_extend 32) (currentBit!3572 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1432 (buf!1813 thiss!1379))) ((_ sign_extend 32) (currentByte!3577 thiss!1379)) ((_ sign_extend 32) (currentBit!3572 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5744 () Bool)

(assert (= bs!5744 d!23896))

(assert (=> bs!5744 m!120269))

(assert (=> b!75136 d!23896))

(declare-fun d!23898 () Bool)

(assert (=> d!23898 (= (inv!12 (BitStream!2439 (buf!1813 (_1!3365 lt!120804)) (currentByte!3577 (_2!3366 lt!120805)) (currentBit!3572 (_2!3366 lt!120805)))) (invariant!0 (currentBit!3572 (BitStream!2439 (buf!1813 (_1!3365 lt!120804)) (currentByte!3577 (_2!3366 lt!120805)) (currentBit!3572 (_2!3366 lt!120805)))) (currentByte!3577 (BitStream!2439 (buf!1813 (_1!3365 lt!120804)) (currentByte!3577 (_2!3366 lt!120805)) (currentBit!3572 (_2!3366 lt!120805)))) (size!1432 (buf!1813 (BitStream!2439 (buf!1813 (_1!3365 lt!120804)) (currentByte!3577 (_2!3366 lt!120805)) (currentBit!3572 (_2!3366 lt!120805)))))))))

(declare-fun bs!5745 () Bool)

(assert (= bs!5745 d!23898))

(declare-fun m!120271 () Bool)

(assert (=> bs!5745 m!120271))

(assert (=> b!75137 d!23898))

(declare-fun d!23900 () Bool)

(declare-fun res!62136 () Bool)

(declare-fun e!49181 () Bool)

(assert (=> d!23900 (=> res!62136 e!49181)))

(assert (=> d!23900 (= res!62136 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23900 (= (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3366 lt!120805) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) e!49181)))

(declare-fun b!75179 () Bool)

(declare-fun e!49182 () Bool)

(assert (=> b!75179 (= e!49181 e!49182)))

(declare-fun res!62137 () Bool)

(assert (=> b!75179 (=> (not res!62137) (not e!49182))))

(assert (=> b!75179 (= res!62137 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!2030 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!2030 (_1!3366 lt!120805)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!75180 () Bool)

(assert (=> b!75180 (= e!49182 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3366 lt!120805) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!23900 (not res!62136)) b!75179))

(assert (= (and b!75179 res!62137) b!75180))

(declare-fun m!120285 () Bool)

(assert (=> b!75179 m!120285))

(declare-fun m!120287 () Bool)

(assert (=> b!75179 m!120287))

(declare-fun m!120289 () Bool)

(assert (=> b!75179 m!120289))

(declare-fun m!120291 () Bool)

(assert (=> b!75179 m!120291))

(declare-fun m!120293 () Bool)

(assert (=> b!75180 m!120293))

(assert (=> b!75137 d!23900))

(declare-fun d!23904 () Bool)

(assert (=> d!23904 (= (array_inv!1278 (buf!1813 thiss!1379)) (bvsge (size!1432 (buf!1813 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!75133 d!23904))

(declare-fun d!23906 () Bool)

(assert (=> d!23906 (= (invariant!0 (currentBit!3572 thiss!1379) (currentByte!3577 thiss!1379) (size!1432 (buf!1813 thiss!1379))) (and (bvsge (currentBit!3572 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!3572 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!3577 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!3577 thiss!1379) (size!1432 (buf!1813 thiss!1379))) (and (= (currentBit!3572 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!3577 thiss!1379) (size!1432 (buf!1813 thiss!1379)))))))))

(assert (=> b!75138 d!23906))

(declare-fun d!23908 () Bool)

(assert (=> d!23908 (= (array_inv!1278 srcBuffer!2) (bvsge (size!1432 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14530 d!23908))

(declare-fun d!23910 () Bool)

(assert (=> d!23910 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3572 thiss!1379) (currentByte!3577 thiss!1379) (size!1432 (buf!1813 thiss!1379))))))

(declare-fun bs!5746 () Bool)

(assert (= bs!5746 d!23910))

(assert (=> bs!5746 m!120227))

(assert (=> start!14530 d!23910))

(declare-fun d!23912 () Bool)

(declare-fun e!49200 () Bool)

(assert (=> d!23912 e!49200))

(declare-fun res!62180 () Bool)

(assert (=> d!23912 (=> (not res!62180) (not e!49200))))

(declare-fun lt!120984 () tuple2!6488)

(assert (=> d!23912 (= res!62180 (= (buf!1813 (_2!3366 lt!120984)) (buf!1813 (_1!3365 lt!120804))))))

(declare-datatypes ((tuple3!206 0))(
  ( (tuple3!207 (_1!3369 Unit!4955) (_2!3369 BitStream!2438) (_3!124 array!3068)) )
))
(declare-fun lt!120980 () tuple3!206)

(assert (=> d!23912 (= lt!120984 (tuple2!6489 (_3!124 lt!120980) (_2!3369 lt!120980)))))

(declare-fun readBitsLoop!0 (BitStream!2438 (_ BitVec 64) array!3068 (_ BitVec 64) (_ BitVec 64)) tuple3!206)

(assert (=> d!23912 (= lt!120980 (readBitsLoop!0 (_1!3365 lt!120804) (bvsub to!314 i!635) (array!3069 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!23912 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!23912 (= (readBits!0 (_1!3365 lt!120804) (bvsub to!314 i!635)) lt!120984)))

(declare-fun b!75227 () Bool)

(declare-datatypes ((List!776 0))(
  ( (Nil!773) (Cons!772 (h!891 Bool) (t!1526 List!776)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!2438 array!3068 (_ BitVec 64) (_ BitVec 64)) List!776)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2438 BitStream!2438 (_ BitVec 64)) List!776)

(assert (=> b!75227 (= e!49200 (= (byteArrayBitContentToList!0 (_2!3366 lt!120984) (_1!3366 lt!120984) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!3366 lt!120984) (_1!3365 lt!120804) (bvsub to!314 i!635))))))

(declare-fun b!75228 () Bool)

(declare-fun res!62182 () Bool)

(assert (=> b!75228 (=> (not res!62182) (not e!49200))))

(declare-fun lt!120978 () (_ BitVec 64))

(assert (=> b!75228 (= res!62182 (= (size!1432 (_1!3366 lt!120984)) ((_ extract 31 0) lt!120978)))))

(assert (=> b!75228 (and (bvslt lt!120978 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!120978 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!120979 () (_ BitVec 64))

(declare-fun lt!120985 () (_ BitVec 64))

(assert (=> b!75228 (= lt!120978 (bvsdiv lt!120979 lt!120985))))

(assert (=> b!75228 (and (not (= lt!120985 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!120979 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!120985 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!75228 (= lt!120985 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!120977 () (_ BitVec 64))

(declare-fun lt!120981 () (_ BitVec 64))

(assert (=> b!75228 (= lt!120979 (bvsub lt!120977 lt!120981))))

(assert (=> b!75228 (or (= (bvand lt!120977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120981 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!120977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120977 lt!120981) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75228 (= lt!120981 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!120982 () (_ BitVec 64))

(assert (=> b!75228 (= lt!120977 (bvadd (bvsub to!314 i!635) lt!120982))))

(assert (=> b!75228 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120982 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!120982) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75228 (= lt!120982 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!75229 () Bool)

(declare-fun res!62179 () Bool)

(assert (=> b!75229 (=> (not res!62179) (not e!49200))))

(declare-fun lt!120983 () (_ BitVec 64))

(assert (=> b!75229 (= res!62179 (= (bvadd lt!120983 (bvsub to!314 i!635)) (bitIndex!0 (size!1432 (buf!1813 (_2!3366 lt!120984))) (currentByte!3577 (_2!3366 lt!120984)) (currentBit!3572 (_2!3366 lt!120984)))))))

(assert (=> b!75229 (or (not (= (bvand lt!120983 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!120983 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!120983 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75229 (= lt!120983 (bitIndex!0 (size!1432 (buf!1813 (_1!3365 lt!120804))) (currentByte!3577 (_1!3365 lt!120804)) (currentBit!3572 (_1!3365 lt!120804))))))

(declare-fun b!75230 () Bool)

(declare-fun res!62181 () Bool)

(assert (=> b!75230 (=> (not res!62181) (not e!49200))))

(assert (=> b!75230 (= res!62181 (bvsle (currentByte!3577 (_1!3365 lt!120804)) (currentByte!3577 (_2!3366 lt!120984))))))

(declare-fun b!75231 () Bool)

(declare-fun res!62178 () Bool)

(assert (=> b!75231 (=> (not res!62178) (not e!49200))))

(assert (=> b!75231 (= res!62178 (invariant!0 (currentBit!3572 (_2!3366 lt!120984)) (currentByte!3577 (_2!3366 lt!120984)) (size!1432 (buf!1813 (_2!3366 lt!120984)))))))

(assert (= (and d!23912 res!62180) b!75229))

(assert (= (and b!75229 res!62179) b!75231))

(assert (= (and b!75231 res!62178) b!75228))

(assert (= (and b!75228 res!62182) b!75230))

(assert (= (and b!75230 res!62181) b!75227))

(declare-fun m!120339 () Bool)

(assert (=> d!23912 m!120339))

(declare-fun m!120341 () Bool)

(assert (=> b!75227 m!120341))

(declare-fun m!120343 () Bool)

(assert (=> b!75227 m!120343))

(declare-fun m!120345 () Bool)

(assert (=> b!75229 m!120345))

(declare-fun m!120347 () Bool)

(assert (=> b!75229 m!120347))

(declare-fun m!120349 () Bool)

(assert (=> b!75231 m!120349))

(assert (=> b!75134 d!23912))

(declare-fun b!75287 () Bool)

(declare-fun e!49229 () Unit!4955)

(declare-fun Unit!4959 () Unit!4955)

(assert (=> b!75287 (= e!49229 Unit!4959)))

(declare-fun b!75288 () Bool)

(declare-fun lt!121120 () Unit!4955)

(assert (=> b!75288 (= e!49229 lt!121120)))

(declare-fun lt!121116 () (_ BitVec 64))

(assert (=> b!75288 (= lt!121116 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121118 () (_ BitVec 64))

(assert (=> b!75288 (= lt!121118 (bitIndex!0 (size!1432 (buf!1813 thiss!1379)) (currentByte!3577 thiss!1379) (currentBit!3572 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3068 array!3068 (_ BitVec 64) (_ BitVec 64)) Unit!4955)

(assert (=> b!75288 (= lt!121120 (arrayBitRangesEqSymmetric!0 (buf!1813 thiss!1379) (buf!1813 thiss!1379) lt!121116 lt!121118))))

(assert (=> b!75288 (arrayBitRangesEq!0 (buf!1813 thiss!1379) (buf!1813 thiss!1379) lt!121116 lt!121118)))

(declare-fun b!75289 () Bool)

(declare-fun res!62230 () Bool)

(declare-fun e!49230 () Bool)

(assert (=> b!75289 (=> (not res!62230) (not e!49230))))

(declare-fun lt!121128 () tuple2!6486)

(assert (=> b!75289 (= res!62230 (isPrefixOf!0 (_1!3365 lt!121128) thiss!1379))))

(declare-fun lt!121124 () (_ BitVec 64))

(declare-fun lt!121123 () (_ BitVec 64))

(declare-fun b!75290 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2438 (_ BitVec 64)) BitStream!2438)

(assert (=> b!75290 (= e!49230 (= (_1!3365 lt!121128) (withMovedBitIndex!0 (_2!3365 lt!121128) (bvsub lt!121123 lt!121124))))))

(assert (=> b!75290 (or (= (bvand lt!121123 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121124 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!121123 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!121123 lt!121124) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75290 (= lt!121124 (bitIndex!0 (size!1432 (buf!1813 thiss!1379)) (currentByte!3577 thiss!1379) (currentBit!3572 thiss!1379)))))

(assert (=> b!75290 (= lt!121123 (bitIndex!0 (size!1432 (buf!1813 thiss!1379)) (currentByte!3577 thiss!1379) (currentBit!3572 thiss!1379)))))

(declare-fun b!75291 () Bool)

(declare-fun res!62229 () Bool)

(assert (=> b!75291 (=> (not res!62229) (not e!49230))))

(assert (=> b!75291 (= res!62229 (isPrefixOf!0 (_2!3365 lt!121128) thiss!1379))))

(declare-fun d!23928 () Bool)

(assert (=> d!23928 e!49230))

(declare-fun res!62228 () Bool)

(assert (=> d!23928 (=> (not res!62228) (not e!49230))))

(assert (=> d!23928 (= res!62228 (isPrefixOf!0 (_1!3365 lt!121128) (_2!3365 lt!121128)))))

(declare-fun lt!121126 () BitStream!2438)

(assert (=> d!23928 (= lt!121128 (tuple2!6487 lt!121126 thiss!1379))))

(declare-fun lt!121121 () Unit!4955)

(declare-fun lt!121113 () Unit!4955)

(assert (=> d!23928 (= lt!121121 lt!121113)))

(assert (=> d!23928 (isPrefixOf!0 lt!121126 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2438 BitStream!2438 BitStream!2438) Unit!4955)

(assert (=> d!23928 (= lt!121113 (lemmaIsPrefixTransitive!0 lt!121126 thiss!1379 thiss!1379))))

(declare-fun lt!121122 () Unit!4955)

(declare-fun lt!121112 () Unit!4955)

(assert (=> d!23928 (= lt!121122 lt!121112)))

(assert (=> d!23928 (isPrefixOf!0 lt!121126 thiss!1379)))

(assert (=> d!23928 (= lt!121112 (lemmaIsPrefixTransitive!0 lt!121126 thiss!1379 thiss!1379))))

(declare-fun lt!121114 () Unit!4955)

(assert (=> d!23928 (= lt!121114 e!49229)))

(declare-fun c!5522 () Bool)

(assert (=> d!23928 (= c!5522 (not (= (size!1432 (buf!1813 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!121117 () Unit!4955)

(declare-fun lt!121119 () Unit!4955)

(assert (=> d!23928 (= lt!121117 lt!121119)))

(assert (=> d!23928 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23928 (= lt!121119 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!121115 () Unit!4955)

(declare-fun lt!121125 () Unit!4955)

(assert (=> d!23928 (= lt!121115 lt!121125)))

(assert (=> d!23928 (= lt!121125 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!121129 () Unit!4955)

(declare-fun lt!121131 () Unit!4955)

(assert (=> d!23928 (= lt!121129 lt!121131)))

(assert (=> d!23928 (isPrefixOf!0 lt!121126 lt!121126)))

(assert (=> d!23928 (= lt!121131 (lemmaIsPrefixRefl!0 lt!121126))))

(declare-fun lt!121127 () Unit!4955)

(declare-fun lt!121130 () Unit!4955)

(assert (=> d!23928 (= lt!121127 lt!121130)))

(assert (=> d!23928 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23928 (= lt!121130 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23928 (= lt!121126 (BitStream!2439 (buf!1813 thiss!1379) (currentByte!3577 thiss!1379) (currentBit!3572 thiss!1379)))))

(assert (=> d!23928 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23928 (= (reader!0 thiss!1379 thiss!1379) lt!121128)))

(assert (= (and d!23928 c!5522) b!75288))

(assert (= (and d!23928 (not c!5522)) b!75287))

(assert (= (and d!23928 res!62228) b!75289))

(assert (= (and b!75289 res!62230) b!75291))

(assert (= (and b!75291 res!62229) b!75290))

(declare-fun m!120381 () Bool)

(assert (=> b!75289 m!120381))

(assert (=> b!75288 m!120249))

(declare-fun m!120383 () Bool)

(assert (=> b!75288 m!120383))

(declare-fun m!120385 () Bool)

(assert (=> b!75288 m!120385))

(declare-fun m!120387 () Bool)

(assert (=> b!75291 m!120387))

(declare-fun m!120389 () Bool)

(assert (=> b!75290 m!120389))

(assert (=> b!75290 m!120249))

(assert (=> b!75290 m!120249))

(declare-fun m!120391 () Bool)

(assert (=> d!23928 m!120391))

(declare-fun m!120393 () Bool)

(assert (=> d!23928 m!120393))

(assert (=> d!23928 m!120245))

(declare-fun m!120395 () Bool)

(assert (=> d!23928 m!120395))

(assert (=> d!23928 m!120247))

(assert (=> d!23928 m!120245))

(assert (=> d!23928 m!120395))

(declare-fun m!120397 () Bool)

(assert (=> d!23928 m!120397))

(assert (=> d!23928 m!120247))

(declare-fun m!120399 () Bool)

(assert (=> d!23928 m!120399))

(assert (=> d!23928 m!120245))

(assert (=> b!75134 d!23928))

(push 1)

