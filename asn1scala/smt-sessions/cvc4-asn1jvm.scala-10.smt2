; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!182 () Bool)

(assert start!182)

(declare-fun b!469 () Bool)

(declare-fun e!231 () Bool)

(declare-datatypes ((array!76 0))(
  ( (array!77 (arr!417 (Array (_ BitVec 32) (_ BitVec 8))) (size!30 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!44 0))(
  ( (BitStream!45 (buf!342 array!76) (currentByte!1240 (_ BitVec 32)) (currentBit!1235 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8 0))(
  ( (tuple2!9 (_1!4 BitStream!44) (_2!4 Bool)) )
))
(declare-fun lt!35 () tuple2!8)

(declare-fun lt!32 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!469 (= e!231 (= (bitIndex!0 (size!30 (buf!342 (_1!4 lt!35))) (currentByte!1240 (_1!4 lt!35)) (currentBit!1235 (_1!4 lt!35))) lt!32))))

(declare-fun b!470 () Bool)

(declare-fun e!232 () Bool)

(declare-fun thiss!932 () BitStream!44)

(declare-fun array_inv!27 (array!76) Bool)

(assert (=> b!470 (= e!232 (array_inv!27 (buf!342 thiss!932)))))

(declare-fun b!471 () Bool)

(declare-fun e!229 () Bool)

(declare-fun e!230 () Bool)

(assert (=> b!471 (= e!229 e!230)))

(declare-fun res!2570 () Bool)

(assert (=> b!471 (=> (not res!2570) (not e!230))))

(declare-fun lt!34 () (_ BitVec 64))

(assert (=> b!471 (= res!2570 (= lt!32 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!34)))))

(declare-datatypes ((Unit!5 0))(
  ( (Unit!6) )
))
(declare-datatypes ((tuple2!10 0))(
  ( (tuple2!11 (_1!5 Unit!5) (_2!5 BitStream!44)) )
))
(declare-fun lt!33 () tuple2!10)

(assert (=> b!471 (= lt!32 (bitIndex!0 (size!30 (buf!342 (_2!5 lt!33))) (currentByte!1240 (_2!5 lt!33)) (currentBit!1235 (_2!5 lt!33))))))

(assert (=> b!471 (= lt!34 (bitIndex!0 (size!30 (buf!342 thiss!932)) (currentByte!1240 thiss!932) (currentBit!1235 thiss!932)))))

(declare-fun res!2568 () Bool)

(declare-fun e!233 () Bool)

(assert (=> start!182 (=> (not res!2568) (not e!233))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!182 (= res!2568 (validate_offset_bit!0 ((_ sign_extend 32) (size!30 (buf!342 thiss!932))) ((_ sign_extend 32) (currentByte!1240 thiss!932)) ((_ sign_extend 32) (currentBit!1235 thiss!932))))))

(assert (=> start!182 e!233))

(declare-fun inv!12 (BitStream!44) Bool)

(assert (=> start!182 (and (inv!12 thiss!932) e!232)))

(declare-fun b!472 () Bool)

(declare-fun res!2571 () Bool)

(assert (=> b!472 (=> (not res!2571) (not e!230))))

(declare-fun isPrefixOf!0 (BitStream!44 BitStream!44) Bool)

(assert (=> b!472 (= res!2571 (isPrefixOf!0 thiss!932 (_2!5 lt!33)))))

(declare-fun b!473 () Bool)

(declare-fun e!227 () Bool)

(assert (=> b!473 (= e!233 (not e!227))))

(declare-fun res!2569 () Bool)

(assert (=> b!473 (=> res!2569 e!227)))

(assert (=> b!473 (= res!2569 (not (= (size!30 (buf!342 (_2!5 lt!33))) (size!30 (buf!342 thiss!932)))))))

(assert (=> b!473 e!229))

(declare-fun res!2572 () Bool)

(assert (=> b!473 (=> (not res!2572) (not e!229))))

(assert (=> b!473 (= res!2572 (= (size!30 (buf!342 thiss!932)) (size!30 (buf!342 (_2!5 lt!33)))))))

(declare-fun appendBit!0 (BitStream!44 Bool) tuple2!10)

(assert (=> b!473 (= lt!33 (appendBit!0 thiss!932 true))))

(declare-fun b!474 () Bool)

(assert (=> b!474 (= e!230 e!231)))

(declare-fun res!2567 () Bool)

(assert (=> b!474 (=> (not res!2567) (not e!231))))

(assert (=> b!474 (= res!2567 (and (_2!4 lt!35) (= (_1!4 lt!35) (_2!5 lt!33))))))

(declare-fun readBitPure!0 (BitStream!44) tuple2!8)

(declare-fun readerFrom!0 (BitStream!44 (_ BitVec 32) (_ BitVec 32)) BitStream!44)

(assert (=> b!474 (= lt!35 (readBitPure!0 (readerFrom!0 (_2!5 lt!33) (currentBit!1235 thiss!932) (currentByte!1240 thiss!932))))))

(declare-fun b!475 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!475 (= e!227 (invariant!0 (currentBit!1235 (_2!5 lt!33)) (currentByte!1240 (_2!5 lt!33)) (size!30 (buf!342 (_2!5 lt!33)))))))

(assert (= (and start!182 res!2568) b!473))

(assert (= (and b!473 res!2572) b!471))

(assert (= (and b!471 res!2570) b!472))

(assert (= (and b!472 res!2571) b!474))

(assert (= (and b!474 res!2567) b!469))

(assert (= (and b!473 (not res!2569)) b!475))

(assert (= start!182 b!470))

(declare-fun m!219 () Bool)

(assert (=> b!473 m!219))

(declare-fun m!221 () Bool)

(assert (=> b!471 m!221))

(declare-fun m!223 () Bool)

(assert (=> b!471 m!223))

(declare-fun m!225 () Bool)

(assert (=> b!475 m!225))

(declare-fun m!227 () Bool)

(assert (=> b!470 m!227))

(declare-fun m!229 () Bool)

(assert (=> start!182 m!229))

(declare-fun m!231 () Bool)

(assert (=> start!182 m!231))

(declare-fun m!233 () Bool)

(assert (=> b!472 m!233))

(declare-fun m!235 () Bool)

(assert (=> b!474 m!235))

(assert (=> b!474 m!235))

(declare-fun m!237 () Bool)

(assert (=> b!474 m!237))

(declare-fun m!239 () Bool)

(assert (=> b!469 m!239))

(push 1)

(assert (not b!473))

(assert (not b!474))

(assert (not b!471))

(assert (not b!475))

(assert (not start!182))

(assert (not b!470))

(assert (not b!472))

(assert (not b!469))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!848 () Bool)

(declare-fun e!254 () Bool)

(assert (=> d!848 e!254))

(declare-fun res!2604 () Bool)

(assert (=> d!848 (=> (not res!2604) (not e!254))))

(declare-fun lt!58 () (_ BitVec 64))

(declare-fun lt!55 () (_ BitVec 64))

(declare-fun lt!54 () (_ BitVec 64))

(assert (=> d!848 (= res!2604 (= lt!58 (bvsub lt!54 lt!55)))))

(assert (=> d!848 (or (= (bvand lt!54 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!55 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!54 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!54 lt!55) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!848 (= lt!55 (remainingBits!0 ((_ sign_extend 32) (size!30 (buf!342 (_2!5 lt!33)))) ((_ sign_extend 32) (currentByte!1240 (_2!5 lt!33))) ((_ sign_extend 32) (currentBit!1235 (_2!5 lt!33)))))))

(declare-fun lt!56 () (_ BitVec 64))

(declare-fun lt!57 () (_ BitVec 64))

(assert (=> d!848 (= lt!54 (bvmul lt!56 lt!57))))

(assert (=> d!848 (or (= lt!56 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!57 (bvsdiv (bvmul lt!56 lt!57) lt!56)))))

(assert (=> d!848 (= lt!57 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!848 (= lt!56 ((_ sign_extend 32) (size!30 (buf!342 (_2!5 lt!33)))))))

(assert (=> d!848 (= lt!58 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1240 (_2!5 lt!33))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1235 (_2!5 lt!33)))))))

(assert (=> d!848 (invariant!0 (currentBit!1235 (_2!5 lt!33)) (currentByte!1240 (_2!5 lt!33)) (size!30 (buf!342 (_2!5 lt!33))))))

(assert (=> d!848 (= (bitIndex!0 (size!30 (buf!342 (_2!5 lt!33))) (currentByte!1240 (_2!5 lt!33)) (currentBit!1235 (_2!5 lt!33))) lt!58)))

(declare-fun b!504 () Bool)

(declare-fun res!2603 () Bool)

(assert (=> b!504 (=> (not res!2603) (not e!254))))

(assert (=> b!504 (= res!2603 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!58))))

(declare-fun b!505 () Bool)

(declare-fun lt!59 () (_ BitVec 64))

(assert (=> b!505 (= e!254 (bvsle lt!58 (bvmul lt!59 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!505 (or (= lt!59 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!59 #b0000000000000000000000000000000000000000000000000000000000001000) lt!59)))))

(assert (=> b!505 (= lt!59 ((_ sign_extend 32) (size!30 (buf!342 (_2!5 lt!33)))))))

(assert (= (and d!848 res!2604) b!504))

(assert (= (and b!504 res!2603) b!505))

(declare-fun m!257 () Bool)

(assert (=> d!848 m!257))

(assert (=> d!848 m!225))

(assert (=> b!471 d!848))

(declare-fun d!866 () Bool)

(declare-fun e!255 () Bool)

(assert (=> d!866 e!255))

(declare-fun res!2606 () Bool)

(assert (=> d!866 (=> (not res!2606) (not e!255))))

(declare-fun lt!64 () (_ BitVec 64))

(declare-fun lt!61 () (_ BitVec 64))

(declare-fun lt!60 () (_ BitVec 64))

(assert (=> d!866 (= res!2606 (= lt!64 (bvsub lt!60 lt!61)))))

(assert (=> d!866 (or (= (bvand lt!60 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!61 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!60 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!60 lt!61) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!866 (= lt!61 (remainingBits!0 ((_ sign_extend 32) (size!30 (buf!342 thiss!932))) ((_ sign_extend 32) (currentByte!1240 thiss!932)) ((_ sign_extend 32) (currentBit!1235 thiss!932))))))

(declare-fun lt!62 () (_ BitVec 64))

(declare-fun lt!63 () (_ BitVec 64))

(assert (=> d!866 (= lt!60 (bvmul lt!62 lt!63))))

(assert (=> d!866 (or (= lt!62 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!63 (bvsdiv (bvmul lt!62 lt!63) lt!62)))))

(assert (=> d!866 (= lt!63 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!866 (= lt!62 ((_ sign_extend 32) (size!30 (buf!342 thiss!932))))))

(assert (=> d!866 (= lt!64 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1240 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1235 thiss!932))))))

(assert (=> d!866 (invariant!0 (currentBit!1235 thiss!932) (currentByte!1240 thiss!932) (size!30 (buf!342 thiss!932)))))

(assert (=> d!866 (= (bitIndex!0 (size!30 (buf!342 thiss!932)) (currentByte!1240 thiss!932) (currentBit!1235 thiss!932)) lt!64)))

(declare-fun b!506 () Bool)

(declare-fun res!2605 () Bool)

(assert (=> b!506 (=> (not res!2605) (not e!255))))

(assert (=> b!506 (= res!2605 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!64))))

(declare-fun b!507 () Bool)

(declare-fun lt!65 () (_ BitVec 64))

(assert (=> b!507 (= e!255 (bvsle lt!64 (bvmul lt!65 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!507 (or (= lt!65 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!65 #b0000000000000000000000000000000000000000000000000000000000001000) lt!65)))))

(assert (=> b!507 (= lt!65 ((_ sign_extend 32) (size!30 (buf!342 thiss!932))))))

(assert (= (and d!866 res!2606) b!506))

(assert (= (and b!506 res!2605) b!507))

(declare-fun m!259 () Bool)

(assert (=> d!866 m!259))

(declare-fun m!261 () Bool)

(assert (=> d!866 m!261))

(assert (=> b!471 d!866))

(declare-fun d!868 () Bool)

(declare-fun e!256 () Bool)

(assert (=> d!868 e!256))

(declare-fun res!2608 () Bool)

(assert (=> d!868 (=> (not res!2608) (not e!256))))

(declare-fun lt!70 () (_ BitVec 64))

(declare-fun lt!66 () (_ BitVec 64))

(declare-fun lt!67 () (_ BitVec 64))

(assert (=> d!868 (= res!2608 (= lt!70 (bvsub lt!66 lt!67)))))

(assert (=> d!868 (or (= (bvand lt!66 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!67 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!66 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!66 lt!67) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!868 (= lt!67 (remainingBits!0 ((_ sign_extend 32) (size!30 (buf!342 (_1!4 lt!35)))) ((_ sign_extend 32) (currentByte!1240 (_1!4 lt!35))) ((_ sign_extend 32) (currentBit!1235 (_1!4 lt!35)))))))

(declare-fun lt!68 () (_ BitVec 64))

(declare-fun lt!69 () (_ BitVec 64))

(assert (=> d!868 (= lt!66 (bvmul lt!68 lt!69))))

(assert (=> d!868 (or (= lt!68 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!69 (bvsdiv (bvmul lt!68 lt!69) lt!68)))))

(assert (=> d!868 (= lt!69 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!868 (= lt!68 ((_ sign_extend 32) (size!30 (buf!342 (_1!4 lt!35)))))))

(assert (=> d!868 (= lt!70 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1240 (_1!4 lt!35))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1235 (_1!4 lt!35)))))))

(assert (=> d!868 (invariant!0 (currentBit!1235 (_1!4 lt!35)) (currentByte!1240 (_1!4 lt!35)) (size!30 (buf!342 (_1!4 lt!35))))))

(assert (=> d!868 (= (bitIndex!0 (size!30 (buf!342 (_1!4 lt!35))) (currentByte!1240 (_1!4 lt!35)) (currentBit!1235 (_1!4 lt!35))) lt!70)))

(declare-fun b!508 () Bool)

(declare-fun res!2607 () Bool)

(assert (=> b!508 (=> (not res!2607) (not e!256))))

(assert (=> b!508 (= res!2607 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!70))))

(declare-fun b!509 () Bool)

(declare-fun lt!71 () (_ BitVec 64))

(assert (=> b!509 (= e!256 (bvsle lt!70 (bvmul lt!71 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!509 (or (= lt!71 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!71 #b0000000000000000000000000000000000000000000000000000000000001000) lt!71)))))

(assert (=> b!509 (= lt!71 ((_ sign_extend 32) (size!30 (buf!342 (_1!4 lt!35)))))))

(assert (= (and d!868 res!2608) b!508))

(assert (= (and b!508 res!2607) b!509))

(declare-fun m!263 () Bool)

(assert (=> d!868 m!263))

(declare-fun m!265 () Bool)

(assert (=> d!868 m!265))

(assert (=> b!469 d!868))

(declare-fun d!870 () Bool)

(assert (=> d!870 (= (invariant!0 (currentBit!1235 (_2!5 lt!33)) (currentByte!1240 (_2!5 lt!33)) (size!30 (buf!342 (_2!5 lt!33)))) (and (bvsge (currentBit!1235 (_2!5 lt!33)) #b00000000000000000000000000000000) (bvslt (currentBit!1235 (_2!5 lt!33)) #b00000000000000000000000000001000) (bvsge (currentByte!1240 (_2!5 lt!33)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1240 (_2!5 lt!33)) (size!30 (buf!342 (_2!5 lt!33)))) (and (= (currentBit!1235 (_2!5 lt!33)) #b00000000000000000000000000000000) (= (currentByte!1240 (_2!5 lt!33)) (size!30 (buf!342 (_2!5 lt!33))))))))))

(assert (=> b!475 d!870))

(declare-fun d!872 () Bool)

(assert (=> d!872 (= (array_inv!27 (buf!342 thiss!932)) (bvsge (size!30 (buf!342 thiss!932)) #b00000000000000000000000000000000))))

(assert (=> b!470 d!872))

(declare-fun d!874 () Bool)

(declare-fun e!270 () Bool)

(assert (=> d!874 e!270))

(declare-fun res!2638 () Bool)

(assert (=> d!874 (=> (not res!2638) (not e!270))))

(declare-fun lt!134 () tuple2!10)

(assert (=> d!874 (= res!2638 (= (size!30 (buf!342 thiss!932)) (size!30 (buf!342 (_2!5 lt!134)))))))

(declare-fun choose!16 (BitStream!44 Bool) tuple2!10)

(assert (=> d!874 (= lt!134 (choose!16 thiss!932 true))))

(assert (=> d!874 (validate_offset_bit!0 ((_ sign_extend 32) (size!30 (buf!342 thiss!932))) ((_ sign_extend 32) (currentByte!1240 thiss!932)) ((_ sign_extend 32) (currentBit!1235 thiss!932)))))

(assert (=> d!874 (= (appendBit!0 thiss!932 true) lt!134)))

(declare-fun b!537 () Bool)

(declare-fun res!2637 () Bool)

(assert (=> b!537 (=> (not res!2637) (not e!270))))

(declare-fun lt!137 () (_ BitVec 64))

(declare-fun lt!135 () (_ BitVec 64))

(assert (=> b!537 (= res!2637 (= (bitIndex!0 (size!30 (buf!342 (_2!5 lt!134))) (currentByte!1240 (_2!5 lt!134)) (currentBit!1235 (_2!5 lt!134))) (bvadd lt!135 lt!137)))))

(assert (=> b!537 (or (not (= (bvand lt!135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!135 lt!137) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!537 (= lt!137 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!537 (= lt!135 (bitIndex!0 (size!30 (buf!342 thiss!932)) (currentByte!1240 thiss!932) (currentBit!1235 thiss!932)))))

(declare-fun b!538 () Bool)

(declare-fun res!2636 () Bool)

(assert (=> b!538 (=> (not res!2636) (not e!270))))

(assert (=> b!538 (= res!2636 (isPrefixOf!0 thiss!932 (_2!5 lt!134)))))

(declare-fun b!540 () Bool)

(declare-fun e!271 () Bool)

(declare-fun lt!136 () tuple2!8)

(assert (=> b!540 (= e!271 (= (bitIndex!0 (size!30 (buf!342 (_1!4 lt!136))) (currentByte!1240 (_1!4 lt!136)) (currentBit!1235 (_1!4 lt!136))) (bitIndex!0 (size!30 (buf!342 (_2!5 lt!134))) (currentByte!1240 (_2!5 lt!134)) (currentBit!1235 (_2!5 lt!134)))))))

(declare-fun b!539 () Bool)

(assert (=> b!539 (= e!270 e!271)))

(declare-fun res!2635 () Bool)

(assert (=> b!539 (=> (not res!2635) (not e!271))))

(assert (=> b!539 (= res!2635 (and (= (_2!4 lt!136) true) (= (_1!4 lt!136) (_2!5 lt!134))))))

(assert (=> b!539 (= lt!136 (readBitPure!0 (readerFrom!0 (_2!5 lt!134) (currentBit!1235 thiss!932) (currentByte!1240 thiss!932))))))

(assert (= (and d!874 res!2638) b!537))

(assert (= (and b!537 res!2637) b!538))

(assert (= (and b!538 res!2636) b!539))

(assert (= (and b!539 res!2635) b!540))

(declare-fun m!279 () Bool)

(assert (=> b!538 m!279))

(declare-fun m!281 () Bool)

(assert (=> b!540 m!281))

