; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47442 () Bool)

(assert start!47442)

(declare-fun b!226196 () Bool)

(declare-fun e!154586 () Bool)

(declare-datatypes ((array!11304 0))(
  ( (array!11305 (arr!5919 (Array (_ BitVec 32) (_ BitVec 8))) (size!4959 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9014 0))(
  ( (BitStream!9015 (buf!5500 array!11304) (currentByte!10308 (_ BitVec 32)) (currentBit!10303 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19380 0))(
  ( (tuple2!19381 (_1!10482 (_ BitVec 8)) (_2!10482 BitStream!9014)) )
))
(declare-fun lt!359672 () tuple2!19380)

(declare-fun thiss!1870 () BitStream!9014)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226196 (= e!154586 (not (= (bitIndex!0 (size!4959 (buf!5500 (_2!10482 lt!359672))) (currentByte!10308 (_2!10482 lt!359672)) (currentBit!10303 (_2!10482 lt!359672))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4959 (buf!5500 thiss!1870)) (currentByte!10308 thiss!1870) (currentBit!10303 thiss!1870))))))))

(declare-fun arr!308 () array!11304)

(declare-datatypes ((Unit!16696 0))(
  ( (Unit!16697) )
))
(declare-datatypes ((tuple3!1300 0))(
  ( (tuple3!1301 (_1!10483 Unit!16696) (_2!10483 BitStream!9014) (_3!792 array!11304)) )
))
(declare-fun lt!359671 () tuple3!1300)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun readByteArrayLoop!0 (BitStream!9014 array!11304 (_ BitVec 32) (_ BitVec 32)) tuple3!1300)

(assert (=> b!226196 (= lt!359671 (readByteArrayLoop!0 (_2!10482 lt!359672) (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226196 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4959 (buf!5500 (_2!10482 lt!359672)))) ((_ sign_extend 32) (currentByte!10308 (_2!10482 lt!359672))) ((_ sign_extend 32) (currentBit!10303 (_2!10482 lt!359672))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!359673 () Unit!16696)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9014 BitStream!9014 (_ BitVec 64) (_ BitVec 32)) Unit!16696)

(assert (=> b!226196 (= lt!359673 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10482 lt!359672) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9014) tuple2!19380)

(assert (=> b!226196 (= lt!359672 (readByte!0 thiss!1870))))

(declare-fun res!189807 () Bool)

(assert (=> start!47442 (=> (not res!189807) (not e!154586))))

(assert (=> start!47442 (= res!189807 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4959 arr!308))))))

(assert (=> start!47442 e!154586))

(assert (=> start!47442 true))

(declare-fun array_inv!4700 (array!11304) Bool)

(assert (=> start!47442 (array_inv!4700 arr!308)))

(declare-fun e!154588 () Bool)

(declare-fun inv!12 (BitStream!9014) Bool)

(assert (=> start!47442 (and (inv!12 thiss!1870) e!154588)))

(declare-fun b!226197 () Bool)

(assert (=> b!226197 (= e!154588 (array_inv!4700 (buf!5500 thiss!1870)))))

(declare-fun b!226194 () Bool)

(declare-fun res!189808 () Bool)

(assert (=> b!226194 (=> (not res!189808) (not e!154586))))

(assert (=> b!226194 (= res!189808 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4959 (buf!5500 thiss!1870))) ((_ sign_extend 32) (currentByte!10308 thiss!1870)) ((_ sign_extend 32) (currentBit!10303 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!226195 () Bool)

(declare-fun res!189806 () Bool)

(assert (=> b!226195 (=> (not res!189806) (not e!154586))))

(assert (=> b!226195 (= res!189806 (bvslt i!761 to!496))))

(assert (= (and start!47442 res!189807) b!226194))

(assert (= (and b!226194 res!189808) b!226195))

(assert (= (and b!226195 res!189806) b!226196))

(assert (= start!47442 b!226197))

(declare-fun m!347379 () Bool)

(assert (=> b!226196 m!347379))

(declare-fun m!347381 () Bool)

(assert (=> b!226196 m!347381))

(declare-fun m!347383 () Bool)

(assert (=> b!226196 m!347383))

(declare-fun m!347385 () Bool)

(assert (=> b!226196 m!347385))

(declare-fun m!347387 () Bool)

(assert (=> b!226196 m!347387))

(declare-fun m!347389 () Bool)

(assert (=> b!226196 m!347389))

(declare-fun m!347391 () Bool)

(assert (=> b!226196 m!347391))

(declare-fun m!347393 () Bool)

(assert (=> start!47442 m!347393))

(declare-fun m!347395 () Bool)

(assert (=> start!47442 m!347395))

(declare-fun m!347397 () Bool)

(assert (=> b!226197 m!347397))

(declare-fun m!347399 () Bool)

(assert (=> b!226194 m!347399))

(push 1)

(assert (not b!226196))

(assert (not b!226197))

(assert (not start!47442))

(assert (not b!226194))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76765 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76765 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4959 (buf!5500 (_2!10482 lt!359672)))) ((_ sign_extend 32) (currentByte!10308 (_2!10482 lt!359672))) ((_ sign_extend 32) (currentBit!10303 (_2!10482 lt!359672))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4959 (buf!5500 (_2!10482 lt!359672)))) ((_ sign_extend 32) (currentByte!10308 (_2!10482 lt!359672))) ((_ sign_extend 32) (currentBit!10303 (_2!10482 lt!359672)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18767 () Bool)

(assert (= bs!18767 d!76765))

(declare-fun m!347405 () Bool)

(assert (=> bs!18767 m!347405))

(assert (=> b!226196 d!76765))

(declare-fun d!76767 () Bool)

(declare-fun lt!359712 () (_ BitVec 8))

(declare-fun lt!359714 () (_ BitVec 8))

(assert (=> d!76767 (= lt!359712 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5919 (buf!5500 thiss!1870)) (currentByte!10308 thiss!1870))) ((_ sign_extend 24) lt!359714))))))

(assert (=> d!76767 (= lt!359714 ((_ extract 7 0) (currentBit!10303 thiss!1870)))))

(declare-fun e!154600 () Bool)

(assert (=> d!76767 e!154600))

(declare-fun res!189821 () Bool)

(assert (=> d!76767 (=> (not res!189821) (not e!154600))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76767 (= res!189821 (validate_offset_bits!1 ((_ sign_extend 32) (size!4959 (buf!5500 thiss!1870))) ((_ sign_extend 32) (currentByte!10308 thiss!1870)) ((_ sign_extend 32) (currentBit!10303 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19384 0))(
  ( (tuple2!19385 (_1!10485 Unit!16696) (_2!10485 (_ BitVec 8))) )
))
(declare-fun Unit!16702 () Unit!16696)

(declare-fun Unit!16703 () Unit!16696)

(assert (=> d!76767 (= (readByte!0 thiss!1870) (tuple2!19381 (_2!10485 (ite (bvsgt ((_ sign_extend 24) lt!359714) #b00000000000000000000000000000000) (tuple2!19385 Unit!16702 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!359712) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5919 (buf!5500 thiss!1870)) (bvadd (currentByte!10308 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!359714)))))))) (tuple2!19385 Unit!16703 lt!359712))) (BitStream!9015 (buf!5500 thiss!1870) (bvadd (currentByte!10308 thiss!1870) #b00000000000000000000000000000001) (currentBit!10303 thiss!1870))))))

(declare-fun b!226208 () Bool)

(declare-fun e!154599 () Bool)

(assert (=> b!226208 (= e!154600 e!154599)))

(declare-fun res!189822 () Bool)

(assert (=> b!226208 (=> (not res!189822) (not e!154599))))

(declare-fun lt!359709 () tuple2!19380)

(assert (=> b!226208 (= res!189822 (= (buf!5500 (_2!10482 lt!359709)) (buf!5500 thiss!1870)))))

(declare-fun lt!359713 () (_ BitVec 8))

(declare-fun lt!359710 () (_ BitVec 8))

(declare-fun Unit!16704 () Unit!16696)

(declare-fun Unit!16705 () Unit!16696)

(assert (=> b!226208 (= lt!359709 (tuple2!19381 (_2!10485 (ite (bvsgt ((_ sign_extend 24) lt!359710) #b00000000000000000000000000000000) (tuple2!19385 Unit!16704 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!359713) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5919 (buf!5500 thiss!1870)) (bvadd (currentByte!10308 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!359710)))))))) (tuple2!19385 Unit!16705 lt!359713))) (BitStream!9015 (buf!5500 thiss!1870) (bvadd (currentByte!10308 thiss!1870) #b00000000000000000000000000000001) (currentBit!10303 thiss!1870))))))

(assert (=> b!226208 (= lt!359713 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5919 (buf!5500 thiss!1870)) (currentByte!10308 thiss!1870))) ((_ sign_extend 24) lt!359710))))))

(assert (=> b!226208 (= lt!359710 ((_ extract 7 0) (currentBit!10303 thiss!1870)))))

(declare-fun lt!359715 () (_ BitVec 64))

(declare-fun b!226209 () Bool)

(declare-fun lt!359711 () (_ BitVec 64))

(assert (=> b!226209 (= e!154599 (= (bitIndex!0 (size!4959 (buf!5500 (_2!10482 lt!359709))) (currentByte!10308 (_2!10482 lt!359709)) (currentBit!10303 (_2!10482 lt!359709))) (bvadd lt!359711 lt!359715)))))

(assert (=> b!226209 (or (not (= (bvand lt!359711 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359715 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!359711 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!359711 lt!359715) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!226209 (= lt!359715 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!226209 (= lt!359711 (bitIndex!0 (size!4959 (buf!5500 thiss!1870)) (currentByte!10308 thiss!1870) (currentBit!10303 thiss!1870)))))

(assert (= (and d!76767 res!189821) b!226208))

(assert (= (and b!226208 res!189822) b!226209))

(declare-fun m!347415 () Bool)

(assert (=> d!76767 m!347415))

(declare-fun m!347417 () Bool)

(assert (=> d!76767 m!347417))

(declare-fun m!347419 () Bool)

(assert (=> d!76767 m!347419))

(assert (=> b!226208 m!347419))

(assert (=> b!226208 m!347415))

(declare-fun m!347421 () Bool)

(assert (=> b!226209 m!347421))

(assert (=> b!226209 m!347389))

(assert (=> b!226196 d!76767))

(declare-fun d!76771 () Bool)

(declare-fun e!154622 () Bool)

(assert (=> d!76771 e!154622))

(declare-fun res!189851 () Bool)

(assert (=> d!76771 (=> res!189851 e!154622)))

(assert (=> d!76771 (= res!189851 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!359884 () Bool)

(declare-fun e!154623 () Bool)

(assert (=> d!76771 (= lt!359884 e!154623)))

(declare-fun res!189853 () Bool)

(assert (=> d!76771 (=> (not res!189853) (not e!154623))))

(declare-fun lt!359860 () (_ BitVec 64))

(declare-fun lt!359872 () tuple3!1300)

(declare-fun lt!359858 () (_ BitVec 64))

(assert (=> d!76771 (= res!189853 (= (bvadd lt!359858 lt!359860) (bitIndex!0 (size!4959 (buf!5500 (_2!10483 lt!359872))) (currentByte!10308 (_2!10483 lt!359872)) (currentBit!10303 (_2!10483 lt!359872)))))))

(assert (=> d!76771 (or (not (= (bvand lt!359858 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359860 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!359858 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!359858 lt!359860) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!359863 () (_ BitVec 64))

(assert (=> d!76771 (= lt!359860 (bvmul lt!359863 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!76771 (or (= lt!359863 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!359863 #b0000000000000000000000000000000000000000000000000000000000001000) lt!359863)))))

(assert (=> d!76771 (= lt!359863 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!76771 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!76771 (= lt!359858 (bitIndex!0 (size!4959 (buf!5500 (_2!10482 lt!359672))) (currentByte!10308 (_2!10482 lt!359672)) (currentBit!10303 (_2!10482 lt!359672))))))

(declare-fun e!154624 () tuple3!1300)

(assert (=> d!76771 (= lt!359872 e!154624)))

(declare-fun c!11161 () Bool)

(assert (=> d!76771 (= c!11161 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!76771 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4959 (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308)))))))

(assert (=> d!76771 (= (readByteArrayLoop!0 (_2!10482 lt!359672) (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!359872)))

(declare-fun lt!359882 () Unit!16696)

(declare-fun b!226241 () Bool)

(assert (=> b!226241 (= e!154624 (tuple3!1301 lt!359882 (_2!10482 lt!359672) (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308))))))

(declare-fun call!3701 () (_ BitVec 64))

(assert (=> b!226241 (= call!3701 call!3701)))

(declare-fun lt!359888 () Unit!16696)

(declare-fun Unit!16706 () Unit!16696)

(assert (=> b!226241 (= lt!359888 Unit!16706)))

(declare-fun lt!359887 () Unit!16696)

(declare-fun arrayRangesEqReflexiveLemma!118 (array!11304) Unit!16696)

(assert (=> b!226241 (= lt!359887 (arrayRangesEqReflexiveLemma!118 (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308))))))

(declare-fun call!3702 () Bool)

(assert (=> b!226241 call!3702))

(declare-fun lt!359876 () Unit!16696)

(assert (=> b!226241 (= lt!359876 lt!359887)))

(declare-fun lt!359879 () array!11304)

(assert (=> b!226241 (= lt!359879 (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308)))))

(declare-fun lt!359889 () array!11304)

(assert (=> b!226241 (= lt!359889 (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308)))))

(declare-fun lt!359886 () (_ BitVec 32))

(assert (=> b!226241 (= lt!359886 #b00000000000000000000000000000000)))

(declare-fun lt!359862 () (_ BitVec 32))

(assert (=> b!226241 (= lt!359862 (size!4959 (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308))))))

(declare-fun lt!359878 () (_ BitVec 32))

(assert (=> b!226241 (= lt!359878 #b00000000000000000000000000000000)))

(declare-fun lt!359866 () (_ BitVec 32))

(assert (=> b!226241 (= lt!359866 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!103 (array!11304 array!11304 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16696)

(assert (=> b!226241 (= lt!359882 (arrayRangesEqSlicedLemma!103 lt!359879 lt!359889 lt!359886 lt!359862 lt!359878 lt!359866))))

(declare-fun call!3700 () Bool)

(assert (=> b!226241 call!3700))

(declare-fun bm!3697 () Bool)

(declare-fun lt!359864 () tuple2!19380)

(declare-fun arrayRangesEq!815 (array!11304 array!11304 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3697 (= call!3702 (arrayRangesEq!815 (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308)) (ite c!11161 (array!11305 (store (arr!5919 (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10482 lt!359864)) (size!4959 (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308)))) (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308))) #b00000000000000000000000000000000 (ite c!11161 (bvadd #b00000000000000000000000000000001 i!761) (size!4959 (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308))))))))

(declare-fun b!226242 () Bool)

(declare-fun res!189852 () Bool)

(assert (=> b!226242 (=> (not res!189852) (not e!154623))))

(assert (=> b!226242 (= res!189852 (and (= (buf!5500 (_2!10482 lt!359672)) (buf!5500 (_2!10483 lt!359872))) (= (size!4959 (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308))) (size!4959 (_3!792 lt!359872)))))))

(declare-fun bm!3698 () Bool)

(declare-fun lt!359875 () tuple3!1300)

(assert (=> bm!3698 (= call!3701 (bitIndex!0 (ite c!11161 (size!4959 (buf!5500 (_2!10483 lt!359875))) (size!4959 (buf!5500 (_2!10482 lt!359672)))) (ite c!11161 (currentByte!10308 (_2!10483 lt!359875)) (currentByte!10308 (_2!10482 lt!359672))) (ite c!11161 (currentBit!10303 (_2!10483 lt!359875)) (currentBit!10303 (_2!10482 lt!359672)))))))

(declare-fun b!226243 () Bool)

(declare-fun lt!359883 () Unit!16696)

(assert (=> b!226243 (= e!154624 (tuple3!1301 lt!359883 (_2!10483 lt!359875) (_3!792 lt!359875)))))

(assert (=> b!226243 (= lt!359864 (readByte!0 (_2!10482 lt!359672)))))

(declare-fun lt!359880 () array!11304)

(assert (=> b!226243 (= lt!359880 (array!11305 (store (arr!5919 (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10482 lt!359864)) (size!4959 (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308)))))))

(declare-fun lt!359867 () (_ BitVec 64))

(assert (=> b!226243 (= lt!359867 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!359871 () (_ BitVec 32))

(assert (=> b!226243 (= lt!359871 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!359873 () Unit!16696)

(assert (=> b!226243 (= lt!359873 (validateOffsetBytesFromBitIndexLemma!0 (_2!10482 lt!359672) (_2!10482 lt!359864) lt!359867 lt!359871))))

(assert (=> b!226243 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4959 (buf!5500 (_2!10482 lt!359864)))) ((_ sign_extend 32) (currentByte!10308 (_2!10482 lt!359864))) ((_ sign_extend 32) (currentBit!10303 (_2!10482 lt!359864))) (bvsub lt!359871 ((_ extract 31 0) (bvsdiv (bvadd lt!359867 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!359869 () Unit!16696)

(assert (=> b!226243 (= lt!359869 lt!359873)))

(assert (=> b!226243 (= lt!359875 (readByteArrayLoop!0 (_2!10482 lt!359864) lt!359880 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!226243 (= (bitIndex!0 (size!4959 (buf!5500 (_2!10482 lt!359864))) (currentByte!10308 (_2!10482 lt!359864)) (currentBit!10303 (_2!10482 lt!359864))) (bvadd (bitIndex!0 (size!4959 (buf!5500 (_2!10482 lt!359672))) (currentByte!10308 (_2!10482 lt!359672)) (currentBit!10303 (_2!10482 lt!359672))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!359857 () Unit!16696)

(declare-fun Unit!16713 () Unit!16696)

(assert (=> b!226243 (= lt!359857 Unit!16713)))

(assert (=> b!226243 (= (bvadd (bitIndex!0 (size!4959 (buf!5500 (_2!10482 lt!359864))) (currentByte!10308 (_2!10482 lt!359864)) (currentBit!10303 (_2!10482 lt!359864))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3701)))

(declare-fun lt!359865 () Unit!16696)

(declare-fun Unit!16715 () Unit!16696)

(assert (=> b!226243 (= lt!359865 Unit!16715)))

(assert (=> b!226243 (= (bvadd (bitIndex!0 (size!4959 (buf!5500 (_2!10482 lt!359672))) (currentByte!10308 (_2!10482 lt!359672)) (currentBit!10303 (_2!10482 lt!359672))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3701)))

(declare-fun lt!359881 () Unit!16696)

(declare-fun Unit!16716 () Unit!16696)

(assert (=> b!226243 (= lt!359881 Unit!16716)))

(assert (=> b!226243 (and (= (buf!5500 (_2!10482 lt!359672)) (buf!5500 (_2!10483 lt!359875))) (= (size!4959 (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308))) (size!4959 (_3!792 lt!359875))))))

(declare-fun lt!359877 () Unit!16696)

(declare-fun Unit!16717 () Unit!16696)

(assert (=> b!226243 (= lt!359877 Unit!16717)))

(declare-fun lt!359859 () Unit!16696)

(declare-fun arrayUpdatedAtPrefixLemma!374 (array!11304 (_ BitVec 32) (_ BitVec 8)) Unit!16696)

(assert (=> b!226243 (= lt!359859 (arrayUpdatedAtPrefixLemma!374 (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10482 lt!359864)))))

(assert (=> b!226243 call!3702))

(declare-fun lt!359874 () Unit!16696)

(assert (=> b!226243 (= lt!359874 lt!359859)))

(declare-fun lt!359868 () (_ BitVec 32))

(assert (=> b!226243 (= lt!359868 #b00000000000000000000000000000000)))

(declare-fun lt!359885 () Unit!16696)

(declare-fun arrayRangesEqTransitive!253 (array!11304 array!11304 array!11304 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16696)

(assert (=> b!226243 (= lt!359885 (arrayRangesEqTransitive!253 (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308)) lt!359880 (_3!792 lt!359875) lt!359868 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226243 (arrayRangesEq!815 (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308)) (_3!792 lt!359875) lt!359868 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!359854 () Unit!16696)

(assert (=> b!226243 (= lt!359854 lt!359885)))

(assert (=> b!226243 call!3700))

(declare-fun lt!359856 () Unit!16696)

(declare-fun Unit!16718 () Unit!16696)

(assert (=> b!226243 (= lt!359856 Unit!16718)))

(declare-fun lt!359870 () Unit!16696)

(declare-fun arrayRangesEqImpliesEq!104 (array!11304 array!11304 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16696)

(assert (=> b!226243 (= lt!359870 (arrayRangesEqImpliesEq!104 lt!359880 (_3!792 lt!359875) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226243 (= (select (store (arr!5919 (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10482 lt!359864)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5919 (_3!792 lt!359875)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!359861 () Unit!16696)

(assert (=> b!226243 (= lt!359861 lt!359870)))

(declare-fun lt!359855 () Bool)

(assert (=> b!226243 (= lt!359855 (= (select (arr!5919 (_3!792 lt!359875)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10482 lt!359864)))))

(declare-fun Unit!16719 () Unit!16696)

(assert (=> b!226243 (= lt!359883 Unit!16719)))

(assert (=> b!226243 lt!359855))

(declare-fun b!226244 () Bool)

(assert (=> b!226244 (= e!154623 (arrayRangesEq!815 (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308)) (_3!792 lt!359872) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun b!226245 () Bool)

(declare-datatypes ((tuple2!19388 0))(
  ( (tuple2!19389 (_1!10487 BitStream!9014) (_2!10487 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9014) tuple2!19388)

(assert (=> b!226245 (= e!154622 (= (select (arr!5919 (_3!792 lt!359872)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10487 (readBytePure!0 (_2!10482 lt!359672)))))))

(assert (=> b!226245 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4959 (_3!792 lt!359872))))))

(declare-fun bm!3699 () Bool)

(assert (=> bm!3699 (= call!3700 (arrayRangesEq!815 (ite c!11161 (array!11305 (store (arr!5919 arr!308) i!761 (_1!10482 lt!359672)) (size!4959 arr!308)) lt!359879) (ite c!11161 (_3!792 lt!359875) lt!359889) (ite c!11161 #b00000000000000000000000000000000 lt!359878) (ite c!11161 (bvadd #b00000000000000000000000000000001 i!761) lt!359866)))))

(assert (= (and d!76771 c!11161) b!226243))

(assert (= (and d!76771 (not c!11161)) b!226241))

(assert (= (or b!226243 b!226241) bm!3699))

(assert (= (or b!226243 b!226241) bm!3697))

(assert (= (or b!226243 b!226241) bm!3698))

(assert (= (and d!76771 res!189853) b!226242))

(assert (= (and b!226242 res!189852) b!226244))

(assert (= (and d!76771 (not res!189851)) b!226245))

(declare-fun m!347445 () Bool)

(assert (=> b!226243 m!347445))

(declare-fun m!347447 () Bool)

(assert (=> b!226243 m!347447))

(declare-fun m!347449 () Bool)

(assert (=> b!226243 m!347449))

(declare-fun m!347451 () Bool)

(assert (=> b!226243 m!347451))

(declare-fun m!347453 () Bool)

(assert (=> b!226243 m!347453))

(declare-fun m!347455 () Bool)

(assert (=> b!226243 m!347455))

(declare-fun m!347457 () Bool)

(assert (=> b!226243 m!347457))

(declare-fun m!347459 () Bool)

(assert (=> b!226243 m!347459))

(declare-fun m!347461 () Bool)

(assert (=> b!226243 m!347461))

(declare-fun m!347463 () Bool)

(assert (=> b!226243 m!347463))

(assert (=> b!226243 m!347383))

(declare-fun m!347465 () Bool)

(assert (=> b!226243 m!347465))

(declare-fun m!347467 () Bool)

(assert (=> b!226243 m!347467))

(declare-fun m!347469 () Bool)

(assert (=> bm!3699 m!347469))

(declare-fun m!347471 () Bool)

(assert (=> b!226241 m!347471))

(declare-fun m!347473 () Bool)

(assert (=> b!226241 m!347473))

(declare-fun m!347475 () Bool)

(assert (=> b!226245 m!347475))

(declare-fun m!347477 () Bool)

(assert (=> b!226245 m!347477))

(assert (=> bm!3697 m!347459))

(declare-fun m!347479 () Bool)

(assert (=> bm!3697 m!347479))

(declare-fun m!347481 () Bool)

(assert (=> d!76771 m!347481))

(assert (=> d!76771 m!347383))

(declare-fun m!347483 () Bool)

(assert (=> bm!3698 m!347483))

(declare-fun m!347485 () Bool)

(assert (=> b!226244 m!347485))

(assert (=> b!226196 d!76771))

(declare-fun d!76792 () Bool)

(declare-fun e!154633 () Bool)

(assert (=> d!76792 e!154633))

(declare-fun res!189865 () Bool)

(assert (=> d!76792 (=> (not res!189865) (not e!154633))))

(declare-fun lt!359974 () (_ BitVec 64))

(declare-fun lt!359976 () (_ BitVec 64))

(declare-fun lt!359978 () (_ BitVec 64))

(assert (=> d!76792 (= res!189865 (= lt!359974 (bvsub lt!359978 lt!359976)))))

(assert (=> d!76792 (or (= (bvand lt!359978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359976 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!359978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!359978 lt!359976) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76792 (= lt!359976 (remainingBits!0 ((_ sign_extend 32) (size!4959 (buf!5500 thiss!1870))) ((_ sign_extend 32) (currentByte!10308 thiss!1870)) ((_ sign_extend 32) (currentBit!10303 thiss!1870))))))

(declare-fun lt!359979 () (_ BitVec 64))

(declare-fun lt!359975 () (_ BitVec 64))

(assert (=> d!76792 (= lt!359978 (bvmul lt!359979 lt!359975))))

(assert (=> d!76792 (or (= lt!359979 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!359975 (bvsdiv (bvmul lt!359979 lt!359975) lt!359979)))))

(assert (=> d!76792 (= lt!359975 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76792 (= lt!359979 ((_ sign_extend 32) (size!4959 (buf!5500 thiss!1870))))))

(assert (=> d!76792 (= lt!359974 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10308 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10303 thiss!1870))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76792 (invariant!0 (currentBit!10303 thiss!1870) (currentByte!10308 thiss!1870) (size!4959 (buf!5500 thiss!1870)))))

(assert (=> d!76792 (= (bitIndex!0 (size!4959 (buf!5500 thiss!1870)) (currentByte!10308 thiss!1870) (currentBit!10303 thiss!1870)) lt!359974)))

(declare-fun b!226260 () Bool)

(declare-fun res!189864 () Bool)

(assert (=> b!226260 (=> (not res!189864) (not e!154633))))

(assert (=> b!226260 (= res!189864 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!359974))))

(declare-fun b!226261 () Bool)

(declare-fun lt!359977 () (_ BitVec 64))

(assert (=> b!226261 (= e!154633 (bvsle lt!359974 (bvmul lt!359977 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226261 (or (= lt!359977 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!359977 #b0000000000000000000000000000000000000000000000000000000000001000) lt!359977)))))

(assert (=> b!226261 (= lt!359977 ((_ sign_extend 32) (size!4959 (buf!5500 thiss!1870))))))

(assert (= (and d!76792 res!189865) b!226260))

(assert (= (and b!226260 res!189864) b!226261))

(declare-fun m!347487 () Bool)

(assert (=> d!76792 m!347487))

(declare-fun m!347489 () Bool)

(assert (=> d!76792 m!347489))

(assert (=> b!226196 d!76792))

(declare-fun d!76794 () Bool)

(declare-fun e!154640 () Bool)

(assert (=> d!76794 e!154640))

(declare-fun res!189873 () Bool)

(assert (=> d!76794 (=> (not res!189873) (not e!154640))))

(assert (=> d!76794 (= res!189873 (and (or (let ((rhs!3863 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3863 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3863) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!76795 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!76795 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!76795 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3862 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3862 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3862) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!360030 () Unit!16696)

(declare-fun choose!57 (BitStream!9014 BitStream!9014 (_ BitVec 64) (_ BitVec 32)) Unit!16696)

(assert (=> d!76794 (= lt!360030 (choose!57 thiss!1870 (_2!10482 lt!359672) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!76794 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10482 lt!359672) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!360030)))

(declare-fun lt!360029 () (_ BitVec 32))

(declare-fun b!226271 () Bool)

(assert (=> b!226271 (= e!154640 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4959 (buf!5500 (_2!10482 lt!359672)))) ((_ sign_extend 32) (currentByte!10308 (_2!10482 lt!359672))) ((_ sign_extend 32) (currentBit!10303 (_2!10482 lt!359672))) (bvsub (bvsub to!496 i!761) lt!360029)))))

(assert (=> b!226271 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!360029 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!360029) #b10000000000000000000000000000000)))))

(declare-fun lt!360028 () (_ BitVec 64))

(assert (=> b!226271 (= lt!360029 ((_ extract 31 0) lt!360028))))

(assert (=> b!226271 (and (bvslt lt!360028 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!360028 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!226271 (= lt!360028 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!76794 res!189873) b!226271))

(declare-fun m!347535 () Bool)

(assert (=> d!76794 m!347535))

(declare-fun m!347537 () Bool)

(assert (=> b!226271 m!347537))

(assert (=> b!226196 d!76794))

(declare-fun d!76805 () Bool)

(declare-fun e!154641 () Bool)

(assert (=> d!76805 e!154641))

(declare-fun res!189875 () Bool)

(assert (=> d!76805 (=> (not res!189875) (not e!154641))))

(declare-fun lt!360035 () (_ BitVec 64))

(declare-fun lt!360031 () (_ BitVec 64))

(declare-fun lt!360033 () (_ BitVec 64))

(assert (=> d!76805 (= res!189875 (= lt!360031 (bvsub lt!360035 lt!360033)))))

(assert (=> d!76805 (or (= (bvand lt!360035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360033 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!360035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!360035 lt!360033) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76805 (= lt!360033 (remainingBits!0 ((_ sign_extend 32) (size!4959 (buf!5500 (_2!10482 lt!359672)))) ((_ sign_extend 32) (currentByte!10308 (_2!10482 lt!359672))) ((_ sign_extend 32) (currentBit!10303 (_2!10482 lt!359672)))))))

(declare-fun lt!360036 () (_ BitVec 64))

(declare-fun lt!360032 () (_ BitVec 64))

(assert (=> d!76805 (= lt!360035 (bvmul lt!360036 lt!360032))))

(assert (=> d!76805 (or (= lt!360036 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!360032 (bvsdiv (bvmul lt!360036 lt!360032) lt!360036)))))

(assert (=> d!76805 (= lt!360032 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76805 (= lt!360036 ((_ sign_extend 32) (size!4959 (buf!5500 (_2!10482 lt!359672)))))))

(assert (=> d!76805 (= lt!360031 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10308 (_2!10482 lt!359672))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10303 (_2!10482 lt!359672)))))))

(assert (=> d!76805 (invariant!0 (currentBit!10303 (_2!10482 lt!359672)) (currentByte!10308 (_2!10482 lt!359672)) (size!4959 (buf!5500 (_2!10482 lt!359672))))))

(assert (=> d!76805 (= (bitIndex!0 (size!4959 (buf!5500 (_2!10482 lt!359672))) (currentByte!10308 (_2!10482 lt!359672)) (currentBit!10303 (_2!10482 lt!359672))) lt!360031)))

(declare-fun b!226272 () Bool)

(declare-fun res!189874 () Bool)

(assert (=> b!226272 (=> (not res!189874) (not e!154641))))

(assert (=> b!226272 (= res!189874 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!360031))))

(declare-fun b!226273 () Bool)

(declare-fun lt!360034 () (_ BitVec 64))

(assert (=> b!226273 (= e!154641 (bvsle lt!360031 (bvmul lt!360034 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226273 (or (= lt!360034 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!360034 #b0000000000000000000000000000000000000000000000000000000000001000) lt!360034)))))

(assert (=> b!226273 (= lt!360034 ((_ sign_extend 32) (size!4959 (buf!5500 (_2!10482 lt!359672)))))))

(assert (= (and d!76805 res!189875) b!226272))

(assert (= (and b!226272 res!189874) b!226273))

(assert (=> d!76805 m!347405))

(declare-fun m!347539 () Bool)

(assert (=> d!76805 m!347539))

(assert (=> b!226196 d!76805))

(declare-fun d!76807 () Bool)

(assert (=> d!76807 (= (array_inv!4700 (buf!5500 thiss!1870)) (bvsge (size!4959 (buf!5500 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!226197 d!76807))

(declare-fun d!76809 () Bool)

(assert (=> d!76809 (= (array_inv!4700 arr!308) (bvsge (size!4959 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47442 d!76809))

(declare-fun d!76811 () Bool)

(assert (=> d!76811 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10303 thiss!1870) (currentByte!10308 thiss!1870) (size!4959 (buf!5500 thiss!1870))))))

(declare-fun bs!18771 () Bool)

(assert (= bs!18771 d!76811))

(assert (=> bs!18771 m!347489))

(assert (=> start!47442 d!76811))

(declare-fun d!76813 () Bool)

(assert (=> d!76813 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4959 (buf!5500 thiss!1870))) ((_ sign_extend 32) (currentByte!10308 thiss!1870)) ((_ sign_extend 32) (currentBit!10303 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4959 (buf!5500 thiss!1870))) ((_ sign_extend 32) (currentByte!10308 thiss!1870)) ((_ sign_extend 32) (currentBit!10303 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18772 () Bool)

(assert (= bs!18772 d!76813))

(assert (=> bs!18772 m!347487))

(assert (=> b!226194 d!76813))

(push 1)

(assert (not d!76767))

(assert (not d!76794))

(assert (not b!226244))

(assert (not bm!3699))

(assert (not d!76771))

(assert (not d!76811))

(assert (not b!226243))

(assert (not d!76813))

(assert (not bm!3697))

(assert (not bm!3698))

(assert (not d!76792))

(assert (not b!226271))

(assert (not b!226209))

(assert (not d!76765))

(assert (not b!226245))

(assert (not d!76805))

(assert (not b!226241))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

