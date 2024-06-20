; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72578 () Bool)

(assert start!72578)

(declare-fun res!266103 () Bool)

(declare-fun e!233663 () Bool)

(assert (=> start!72578 (=> (not res!266103) (not e!233663))))

(declare-datatypes ((array!20794 0))(
  ( (array!20795 (arr!10135 (Array (_ BitVec 32) (_ BitVec 8))) (size!9043 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14248 0))(
  ( (BitStream!14249 (buf!8185 array!20794) (currentByte!15125 (_ BitVec 32)) (currentBit!15120 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14248)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!72578 (= res!266103 (validate_offset_bit!0 ((_ sign_extend 32) (size!9043 (buf!8185 thiss!1702))) ((_ sign_extend 32) (currentByte!15125 thiss!1702)) ((_ sign_extend 32) (currentBit!15120 thiss!1702))))))

(assert (=> start!72578 e!233663))

(declare-fun e!233664 () Bool)

(declare-fun inv!12 (BitStream!14248) Bool)

(assert (=> start!72578 (and (inv!12 thiss!1702) e!233664)))

(declare-fun b!324212 () Bool)

(declare-fun res!266104 () Bool)

(assert (=> b!324212 (=> (not res!266104) (not e!233663))))

(declare-datatypes ((Unit!22080 0))(
  ( (Unit!22081) )
))
(declare-datatypes ((tuple2!23756 0))(
  ( (tuple2!23757 (_1!13507 Unit!22080) (_2!13507 BitStream!14248)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14248) tuple2!23756)

(assert (=> b!324212 (= res!266104 (= (buf!8185 (_2!13507 (increaseBitIndex!0 thiss!1702))) (buf!8185 thiss!1702)))))

(declare-fun b!324213 () Bool)

(declare-fun lt!446728 () (_ BitVec 64))

(declare-fun lt!446729 () (_ BitVec 64))

(assert (=> b!324213 (= e!233663 (and (= lt!446728 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!446728 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!446729) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!324213 (= lt!446728 (bvand lt!446729 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324213 (= lt!446729 (bitIndex!0 (size!9043 (buf!8185 thiss!1702)) (currentByte!15125 thiss!1702) (currentBit!15120 thiss!1702)))))

(declare-fun b!324214 () Bool)

(declare-fun array_inv!8595 (array!20794) Bool)

(assert (=> b!324214 (= e!233664 (array_inv!8595 (buf!8185 thiss!1702)))))

(assert (= (and start!72578 res!266103) b!324212))

(assert (= (and b!324212 res!266104) b!324213))

(assert (= start!72578 b!324214))

(declare-fun m!462329 () Bool)

(assert (=> start!72578 m!462329))

(declare-fun m!462331 () Bool)

(assert (=> start!72578 m!462331))

(declare-fun m!462333 () Bool)

(assert (=> b!324212 m!462333))

(declare-fun m!462335 () Bool)

(assert (=> b!324213 m!462335))

(declare-fun m!462337 () Bool)

(assert (=> b!324214 m!462337))

(push 1)

(assert (not b!324213))

(assert (not b!324214))

(assert (not start!72578))

(assert (not b!324212))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106516 () Bool)

(declare-fun e!233685 () Bool)

(assert (=> d!106516 e!233685))

(declare-fun res!266122 () Bool)

(assert (=> d!106516 (=> (not res!266122) (not e!233685))))

(declare-fun lt!446755 () (_ BitVec 64))

(declare-fun lt!446758 () (_ BitVec 64))

(declare-fun lt!446759 () (_ BitVec 64))

(assert (=> d!106516 (= res!266122 (= lt!446755 (bvsub lt!446758 lt!446759)))))

(assert (=> d!106516 (or (= (bvand lt!446758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446759 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446758 lt!446759) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106516 (= lt!446759 (remainingBits!0 ((_ sign_extend 32) (size!9043 (buf!8185 thiss!1702))) ((_ sign_extend 32) (currentByte!15125 thiss!1702)) ((_ sign_extend 32) (currentBit!15120 thiss!1702))))))

(declare-fun lt!446756 () (_ BitVec 64))

(declare-fun lt!446754 () (_ BitVec 64))

(assert (=> d!106516 (= lt!446758 (bvmul lt!446756 lt!446754))))

(assert (=> d!106516 (or (= lt!446756 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446754 (bvsdiv (bvmul lt!446756 lt!446754) lt!446756)))))

(assert (=> d!106516 (= lt!446754 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106516 (= lt!446756 ((_ sign_extend 32) (size!9043 (buf!8185 thiss!1702))))))

(assert (=> d!106516 (= lt!446755 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15125 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15120 thiss!1702))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106516 (invariant!0 (currentBit!15120 thiss!1702) (currentByte!15125 thiss!1702) (size!9043 (buf!8185 thiss!1702)))))

(assert (=> d!106516 (= (bitIndex!0 (size!9043 (buf!8185 thiss!1702)) (currentByte!15125 thiss!1702) (currentBit!15120 thiss!1702)) lt!446755)))

(declare-fun b!324237 () Bool)

(declare-fun res!266121 () Bool)

(assert (=> b!324237 (=> (not res!266121) (not e!233685))))

(assert (=> b!324237 (= res!266121 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446755))))

(declare-fun b!324238 () Bool)

(declare-fun lt!446757 () (_ BitVec 64))

(assert (=> b!324238 (= e!233685 (bvsle lt!446755 (bvmul lt!446757 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324238 (or (= lt!446757 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446757 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446757)))))

(assert (=> b!324238 (= lt!446757 ((_ sign_extend 32) (size!9043 (buf!8185 thiss!1702))))))

(assert (= (and d!106516 res!266122) b!324237))

(assert (= (and b!324237 res!266121) b!324238))

(declare-fun m!462363 () Bool)

(assert (=> d!106516 m!462363))

(declare-fun m!462365 () Bool)

(assert (=> d!106516 m!462365))

(assert (=> b!324213 d!106516))

(declare-fun d!106526 () Bool)

(assert (=> d!106526 (= (array_inv!8595 (buf!8185 thiss!1702)) (bvsge (size!9043 (buf!8185 thiss!1702)) #b00000000000000000000000000000000))))

(assert (=> b!324214 d!106526))

(declare-fun d!106528 () Bool)

(assert (=> d!106528 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9043 (buf!8185 thiss!1702))) ((_ sign_extend 32) (currentByte!15125 thiss!1702)) ((_ sign_extend 32) (currentBit!15120 thiss!1702))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9043 (buf!8185 thiss!1702))) ((_ sign_extend 32) (currentByte!15125 thiss!1702)) ((_ sign_extend 32) (currentBit!15120 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!28059 () Bool)

(assert (= bs!28059 d!106528))

(assert (=> bs!28059 m!462363))

(assert (=> start!72578 d!106528))

(declare-fun d!106530 () Bool)

(assert (=> d!106530 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15120 thiss!1702) (currentByte!15125 thiss!1702) (size!9043 (buf!8185 thiss!1702))))))

(declare-fun bs!28060 () Bool)

(assert (= bs!28060 d!106530))

(assert (=> bs!28060 m!462365))

(assert (=> start!72578 d!106530))

(declare-fun d!106532 () Bool)

(declare-fun e!233693 () Bool)

(assert (=> d!106532 e!233693))

(declare-fun res!266137 () Bool)

(assert (=> d!106532 (=> (not res!266137) (not e!233693))))

(declare-fun lt!446802 () tuple2!23756)

(declare-fun lt!446801 () (_ BitVec 64))

(declare-fun lt!446799 () (_ BitVec 64))

(assert (=> d!106532 (= res!266137 (= (bvadd lt!446799 lt!446801) (bitIndex!0 (size!9043 (buf!8185 (_2!13507 lt!446802))) (currentByte!15125 (_2!13507 lt!446802)) (currentBit!15120 (_2!13507 lt!446802)))))))

(assert (=> d!106532 (or (not (= (bvand lt!446799 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446801 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446799 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446799 lt!446801) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106532 (= lt!446801 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!106532 (= lt!446799 (bitIndex!0 (size!9043 (buf!8185 thiss!1702)) (currentByte!15125 thiss!1702) (currentBit!15120 thiss!1702)))))

(declare-fun Unit!22086 () Unit!22080)

(declare-fun Unit!22087 () Unit!22080)

(assert (=> d!106532 (= lt!446802 (ite (bvslt (currentBit!15120 thiss!1702) #b00000000000000000000000000000111) (tuple2!23757 Unit!22086 (BitStream!14249 (buf!8185 thiss!1702) (currentByte!15125 thiss!1702) (bvadd (currentBit!15120 thiss!1702) #b00000000000000000000000000000001))) (tuple2!23757 Unit!22087 (BitStream!14249 (buf!8185 thiss!1702) (bvadd (currentByte!15125 thiss!1702) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!106532 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9043 (buf!8185 thiss!1702))) ((_ sign_extend 32) (currentByte!15125 thiss!1702)) ((_ sign_extend 32) (currentBit!15120 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!106532 (= (increaseBitIndex!0 thiss!1702) lt!446802)))

(declare-fun b!324253 () Bool)

(declare-fun res!266138 () Bool)

(assert (=> b!324253 (=> (not res!266138) (not e!233693))))

(declare-fun lt!446800 () (_ BitVec 64))

(declare-fun lt!446798 () (_ BitVec 64))

(assert (=> b!324253 (= res!266138 (= (bvsub lt!446800 lt!446798) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!324253 (or (= (bvand lt!446800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446798 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446800 lt!446798) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!324253 (= lt!446798 (remainingBits!0 ((_ sign_extend 32) (size!9043 (buf!8185 (_2!13507 lt!446802)))) ((_ sign_extend 32) (currentByte!15125 (_2!13507 lt!446802))) ((_ sign_extend 32) (currentBit!15120 (_2!13507 lt!446802)))))))

(assert (=> b!324253 (= lt!446800 (remainingBits!0 ((_ sign_extend 32) (size!9043 (buf!8185 thiss!1702))) ((_ sign_extend 32) (currentByte!15125 thiss!1702)) ((_ sign_extend 32) (currentBit!15120 thiss!1702))))))

(declare-fun b!324254 () Bool)

(assert (=> b!324254 (= e!233693 (= (size!9043 (buf!8185 thiss!1702)) (size!9043 (buf!8185 (_2!13507 lt!446802)))))))

(assert (= (and d!106532 res!266137) b!324253))

(assert (= (and b!324253 res!266138) b!324254))

(declare-fun m!462371 () Bool)

(assert (=> d!106532 m!462371))

(assert (=> d!106532 m!462335))

(assert (=> d!106532 m!462363))

(declare-fun m!462373 () Bool)

(assert (=> b!324253 m!462373))

(assert (=> b!324253 m!462363))

(assert (=> b!324212 d!106532))

(push 1)

(assert (not d!106528))

(assert (not b!324253))

(assert (not d!106532))

(assert (not d!106516))

(assert (not d!106530))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

