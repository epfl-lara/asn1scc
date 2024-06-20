; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72580 () Bool)

(assert start!72580)

(declare-fun res!266109 () Bool)

(declare-fun e!233671 () Bool)

(assert (=> start!72580 (=> (not res!266109) (not e!233671))))

(declare-datatypes ((array!20796 0))(
  ( (array!20797 (arr!10136 (Array (_ BitVec 32) (_ BitVec 8))) (size!9044 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14250 0))(
  ( (BitStream!14251 (buf!8186 array!20796) (currentByte!15126 (_ BitVec 32)) (currentBit!15121 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14250)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!72580 (= res!266109 (validate_offset_bit!0 ((_ sign_extend 32) (size!9044 (buf!8186 thiss!1702))) ((_ sign_extend 32) (currentByte!15126 thiss!1702)) ((_ sign_extend 32) (currentBit!15121 thiss!1702))))))

(assert (=> start!72580 e!233671))

(declare-fun e!233673 () Bool)

(declare-fun inv!12 (BitStream!14250) Bool)

(assert (=> start!72580 (and (inv!12 thiss!1702) e!233673)))

(declare-fun b!324221 () Bool)

(declare-fun res!266110 () Bool)

(assert (=> b!324221 (=> (not res!266110) (not e!233671))))

(declare-datatypes ((Unit!22082 0))(
  ( (Unit!22083) )
))
(declare-datatypes ((tuple2!23758 0))(
  ( (tuple2!23759 (_1!13508 Unit!22082) (_2!13508 BitStream!14250)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14250) tuple2!23758)

(assert (=> b!324221 (= res!266110 (= (buf!8186 (_2!13508 (increaseBitIndex!0 thiss!1702))) (buf!8186 thiss!1702)))))

(declare-fun b!324222 () Bool)

(declare-fun lt!446734 () (_ BitVec 64))

(declare-fun lt!446735 () (_ BitVec 64))

(assert (=> b!324222 (= e!233671 (and (= lt!446734 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!446734 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!446735) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!324222 (= lt!446734 (bvand lt!446735 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324222 (= lt!446735 (bitIndex!0 (size!9044 (buf!8186 thiss!1702)) (currentByte!15126 thiss!1702) (currentBit!15121 thiss!1702)))))

(declare-fun b!324223 () Bool)

(declare-fun array_inv!8596 (array!20796) Bool)

(assert (=> b!324223 (= e!233673 (array_inv!8596 (buf!8186 thiss!1702)))))

(assert (= (and start!72580 res!266109) b!324221))

(assert (= (and b!324221 res!266110) b!324222))

(assert (= start!72580 b!324223))

(declare-fun m!462339 () Bool)

(assert (=> start!72580 m!462339))

(declare-fun m!462341 () Bool)

(assert (=> start!72580 m!462341))

(declare-fun m!462343 () Bool)

(assert (=> b!324221 m!462343))

(declare-fun m!462345 () Bool)

(assert (=> b!324222 m!462345))

(declare-fun m!462347 () Bool)

(assert (=> b!324223 m!462347))

(check-sat (not b!324222) (not b!324223) (not start!72580) (not b!324221))
(check-sat)
(get-model)

(declare-fun d!106514 () Bool)

(declare-fun e!233688 () Bool)

(assert (=> d!106514 e!233688))

(declare-fun res!266127 () Bool)

(assert (=> d!106514 (=> (not res!266127) (not e!233688))))

(declare-fun lt!446773 () (_ BitVec 64))

(declare-fun lt!446772 () (_ BitVec 64))

(declare-fun lt!446774 () (_ BitVec 64))

(assert (=> d!106514 (= res!266127 (= lt!446774 (bvsub lt!446772 lt!446773)))))

(assert (=> d!106514 (or (= (bvand lt!446772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446773 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446772 lt!446773) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106514 (= lt!446773 (remainingBits!0 ((_ sign_extend 32) (size!9044 (buf!8186 thiss!1702))) ((_ sign_extend 32) (currentByte!15126 thiss!1702)) ((_ sign_extend 32) (currentBit!15121 thiss!1702))))))

(declare-fun lt!446776 () (_ BitVec 64))

(declare-fun lt!446777 () (_ BitVec 64))

(assert (=> d!106514 (= lt!446772 (bvmul lt!446776 lt!446777))))

(assert (=> d!106514 (or (= lt!446776 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446777 (bvsdiv (bvmul lt!446776 lt!446777) lt!446776)))))

(assert (=> d!106514 (= lt!446777 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106514 (= lt!446776 ((_ sign_extend 32) (size!9044 (buf!8186 thiss!1702))))))

(assert (=> d!106514 (= lt!446774 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15126 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15121 thiss!1702))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106514 (invariant!0 (currentBit!15121 thiss!1702) (currentByte!15126 thiss!1702) (size!9044 (buf!8186 thiss!1702)))))

(assert (=> d!106514 (= (bitIndex!0 (size!9044 (buf!8186 thiss!1702)) (currentByte!15126 thiss!1702) (currentBit!15121 thiss!1702)) lt!446774)))

(declare-fun b!324243 () Bool)

(declare-fun res!266128 () Bool)

(assert (=> b!324243 (=> (not res!266128) (not e!233688))))

(assert (=> b!324243 (= res!266128 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446774))))

(declare-fun b!324244 () Bool)

(declare-fun lt!446775 () (_ BitVec 64))

(assert (=> b!324244 (= e!233688 (bvsle lt!446774 (bvmul lt!446775 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324244 (or (= lt!446775 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446775 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446775)))))

(assert (=> b!324244 (= lt!446775 ((_ sign_extend 32) (size!9044 (buf!8186 thiss!1702))))))

(assert (= (and d!106514 res!266127) b!324243))

(assert (= (and b!324243 res!266128) b!324244))

(declare-fun m!462367 () Bool)

(assert (=> d!106514 m!462367))

(declare-fun m!462369 () Bool)

(assert (=> d!106514 m!462369))

(assert (=> b!324222 d!106514))

(declare-fun d!106534 () Bool)

(assert (=> d!106534 (= (array_inv!8596 (buf!8186 thiss!1702)) (bvsge (size!9044 (buf!8186 thiss!1702)) #b00000000000000000000000000000000))))

(assert (=> b!324223 d!106534))

(declare-fun d!106536 () Bool)

(assert (=> d!106536 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9044 (buf!8186 thiss!1702))) ((_ sign_extend 32) (currentByte!15126 thiss!1702)) ((_ sign_extend 32) (currentBit!15121 thiss!1702))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9044 (buf!8186 thiss!1702))) ((_ sign_extend 32) (currentByte!15126 thiss!1702)) ((_ sign_extend 32) (currentBit!15121 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!28061 () Bool)

(assert (= bs!28061 d!106536))

(assert (=> bs!28061 m!462367))

(assert (=> start!72580 d!106536))

(declare-fun d!106538 () Bool)

(assert (=> d!106538 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15121 thiss!1702) (currentByte!15126 thiss!1702) (size!9044 (buf!8186 thiss!1702))))))

(declare-fun bs!28062 () Bool)

(assert (= bs!28062 d!106538))

(assert (=> bs!28062 m!462369))

(assert (=> start!72580 d!106538))

(declare-fun d!106540 () Bool)

(declare-fun e!233697 () Bool)

(assert (=> d!106540 e!233697))

(declare-fun res!266145 () Bool)

(assert (=> d!106540 (=> (not res!266145) (not e!233697))))

(declare-fun lt!446821 () (_ BitVec 64))

(declare-fun lt!446822 () tuple2!23758)

(declare-fun lt!446820 () (_ BitVec 64))

(assert (=> d!106540 (= res!266145 (= (bvadd lt!446820 lt!446821) (bitIndex!0 (size!9044 (buf!8186 (_2!13508 lt!446822))) (currentByte!15126 (_2!13508 lt!446822)) (currentBit!15121 (_2!13508 lt!446822)))))))

(assert (=> d!106540 (or (not (= (bvand lt!446820 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446821 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446820 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446820 lt!446821) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106540 (= lt!446821 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!106540 (= lt!446820 (bitIndex!0 (size!9044 (buf!8186 thiss!1702)) (currentByte!15126 thiss!1702) (currentBit!15121 thiss!1702)))))

(declare-fun Unit!22089 () Unit!22082)

(declare-fun Unit!22091 () Unit!22082)

(assert (=> d!106540 (= lt!446822 (ite (bvslt (currentBit!15121 thiss!1702) #b00000000000000000000000000000111) (tuple2!23759 Unit!22089 (BitStream!14251 (buf!8186 thiss!1702) (currentByte!15126 thiss!1702) (bvadd (currentBit!15121 thiss!1702) #b00000000000000000000000000000001))) (tuple2!23759 Unit!22091 (BitStream!14251 (buf!8186 thiss!1702) (bvadd (currentByte!15126 thiss!1702) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!106540 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9044 (buf!8186 thiss!1702))) ((_ sign_extend 32) (currentByte!15126 thiss!1702)) ((_ sign_extend 32) (currentBit!15121 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!106540 (= (increaseBitIndex!0 thiss!1702) lt!446822)))

(declare-fun b!324261 () Bool)

(declare-fun res!266146 () Bool)

(assert (=> b!324261 (=> (not res!266146) (not e!233697))))

(declare-fun lt!446819 () (_ BitVec 64))

(declare-fun lt!446818 () (_ BitVec 64))

(assert (=> b!324261 (= res!266146 (= (bvsub lt!446819 lt!446818) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!324261 (or (= (bvand lt!446819 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446818 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446819 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446819 lt!446818) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!324261 (= lt!446818 (remainingBits!0 ((_ sign_extend 32) (size!9044 (buf!8186 (_2!13508 lt!446822)))) ((_ sign_extend 32) (currentByte!15126 (_2!13508 lt!446822))) ((_ sign_extend 32) (currentBit!15121 (_2!13508 lt!446822)))))))

(assert (=> b!324261 (= lt!446819 (remainingBits!0 ((_ sign_extend 32) (size!9044 (buf!8186 thiss!1702))) ((_ sign_extend 32) (currentByte!15126 thiss!1702)) ((_ sign_extend 32) (currentBit!15121 thiss!1702))))))

(declare-fun b!324262 () Bool)

(assert (=> b!324262 (= e!233697 (= (size!9044 (buf!8186 thiss!1702)) (size!9044 (buf!8186 (_2!13508 lt!446822)))))))

(assert (= (and d!106540 res!266145) b!324261))

(assert (= (and b!324261 res!266146) b!324262))

(declare-fun m!462379 () Bool)

(assert (=> d!106540 m!462379))

(assert (=> d!106540 m!462345))

(assert (=> d!106540 m!462367))

(declare-fun m!462381 () Bool)

(assert (=> b!324261 m!462381))

(assert (=> b!324261 m!462367))

(assert (=> b!324221 d!106540))

(check-sat (not d!106538) (not b!324261) (not d!106536) (not d!106540) (not d!106514))
