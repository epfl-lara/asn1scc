; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72424 () Bool)

(assert start!72424)

(declare-fun res!265995 () Bool)

(declare-fun e!233531 () Bool)

(assert (=> start!72424 (=> (not res!265995) (not e!233531))))

(declare-datatypes ((array!20760 0))(
  ( (array!20761 (arr!10124 (Array (_ BitVec 32) (_ BitVec 8))) (size!9032 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14226 0))(
  ( (BitStream!14227 (buf!8174 array!20760) (currentByte!15078 (_ BitVec 32)) (currentBit!15073 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14226)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!72424 (= res!265995 (validate_offset_bit!0 ((_ sign_extend 32) (size!9032 (buf!8174 thiss!1702))) ((_ sign_extend 32) (currentByte!15078 thiss!1702)) ((_ sign_extend 32) (currentBit!15073 thiss!1702))))))

(assert (=> start!72424 e!233531))

(declare-fun e!233529 () Bool)

(declare-fun inv!12 (BitStream!14226) Bool)

(assert (=> start!72424 (and (inv!12 thiss!1702) e!233529)))

(declare-fun b!324071 () Bool)

(declare-fun e!233532 () Bool)

(assert (=> b!324071 (= e!233531 e!233532)))

(declare-fun res!265996 () Bool)

(assert (=> b!324071 (=> (not res!265996) (not e!233532))))

(declare-datatypes ((Unit!22058 0))(
  ( (Unit!22059) )
))
(declare-datatypes ((tuple2!23746 0))(
  ( (tuple2!23747 (_1!13502 Unit!22058) (_2!13502 BitStream!14226)) )
))
(declare-fun lt!446558 () tuple2!23746)

(assert (=> b!324071 (= res!265996 (= (buf!8174 (_2!13502 lt!446558)) (buf!8174 thiss!1702)))))

(declare-fun increaseBitIndex!0 (BitStream!14226) tuple2!23746)

(assert (=> b!324071 (= lt!446558 (increaseBitIndex!0 thiss!1702))))

(declare-fun b!324072 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324072 (= e!233532 (not (invariant!0 (currentBit!15073 (_2!13502 lt!446558)) (currentByte!15078 (_2!13502 lt!446558)) (size!9032 (buf!8174 (_2!13502 lt!446558))))))))

(declare-fun b!324073 () Bool)

(declare-fun array_inv!8584 (array!20760) Bool)

(assert (=> b!324073 (= e!233529 (array_inv!8584 (buf!8174 thiss!1702)))))

(assert (= (and start!72424 res!265995) b!324071))

(assert (= (and b!324071 res!265996) b!324072))

(assert (= start!72424 b!324073))

(declare-fun m!462159 () Bool)

(assert (=> start!72424 m!462159))

(declare-fun m!462161 () Bool)

(assert (=> start!72424 m!462161))

(declare-fun m!462163 () Bool)

(assert (=> b!324071 m!462163))

(declare-fun m!462165 () Bool)

(assert (=> b!324072 m!462165))

(declare-fun m!462167 () Bool)

(assert (=> b!324073 m!462167))

(check-sat (not b!324073) (not b!324072) (not start!72424) (not b!324071))
(check-sat)
(get-model)

(declare-fun d!106364 () Bool)

(assert (=> d!106364 (= (array_inv!8584 (buf!8174 thiss!1702)) (bvsge (size!9032 (buf!8174 thiss!1702)) #b00000000000000000000000000000000))))

(assert (=> b!324073 d!106364))

(declare-fun d!106368 () Bool)

(assert (=> d!106368 (= (invariant!0 (currentBit!15073 (_2!13502 lt!446558)) (currentByte!15078 (_2!13502 lt!446558)) (size!9032 (buf!8174 (_2!13502 lt!446558)))) (and (bvsge (currentBit!15073 (_2!13502 lt!446558)) #b00000000000000000000000000000000) (bvslt (currentBit!15073 (_2!13502 lt!446558)) #b00000000000000000000000000001000) (bvsge (currentByte!15078 (_2!13502 lt!446558)) #b00000000000000000000000000000000) (or (bvslt (currentByte!15078 (_2!13502 lt!446558)) (size!9032 (buf!8174 (_2!13502 lt!446558)))) (and (= (currentBit!15073 (_2!13502 lt!446558)) #b00000000000000000000000000000000) (= (currentByte!15078 (_2!13502 lt!446558)) (size!9032 (buf!8174 (_2!13502 lt!446558))))))))))

(assert (=> b!324072 d!106368))

(declare-fun d!106374 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106374 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9032 (buf!8174 thiss!1702))) ((_ sign_extend 32) (currentByte!15078 thiss!1702)) ((_ sign_extend 32) (currentBit!15073 thiss!1702))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9032 (buf!8174 thiss!1702))) ((_ sign_extend 32) (currentByte!15078 thiss!1702)) ((_ sign_extend 32) (currentBit!15073 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!28024 () Bool)

(assert (= bs!28024 d!106374))

(declare-fun m!462185 () Bool)

(assert (=> bs!28024 m!462185))

(assert (=> start!72424 d!106374))

(declare-fun d!106378 () Bool)

(assert (=> d!106378 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15073 thiss!1702) (currentByte!15078 thiss!1702) (size!9032 (buf!8174 thiss!1702))))))

(declare-fun bs!28026 () Bool)

(assert (= bs!28026 d!106378))

(declare-fun m!462189 () Bool)

(assert (=> bs!28026 m!462189))

(assert (=> start!72424 d!106378))

(declare-fun d!106382 () Bool)

(declare-fun e!233553 () Bool)

(assert (=> d!106382 e!233553))

(declare-fun res!266020 () Bool)

(assert (=> d!106382 (=> (not res!266020) (not e!233553))))

(declare-fun lt!446605 () (_ BitVec 64))

(declare-fun lt!446604 () (_ BitVec 64))

(declare-fun lt!446602 () tuple2!23746)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!106382 (= res!266020 (= (bvadd lt!446605 lt!446604) (bitIndex!0 (size!9032 (buf!8174 (_2!13502 lt!446602))) (currentByte!15078 (_2!13502 lt!446602)) (currentBit!15073 (_2!13502 lt!446602)))))))

(assert (=> d!106382 (or (not (= (bvand lt!446605 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446605 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446605 lt!446604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106382 (= lt!446604 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!106382 (= lt!446605 (bitIndex!0 (size!9032 (buf!8174 thiss!1702)) (currentByte!15078 thiss!1702) (currentBit!15073 thiss!1702)))))

(declare-fun Unit!22066 () Unit!22058)

(declare-fun Unit!22067 () Unit!22058)

(assert (=> d!106382 (= lt!446602 (ite (bvslt (currentBit!15073 thiss!1702) #b00000000000000000000000000000111) (tuple2!23747 Unit!22066 (BitStream!14227 (buf!8174 thiss!1702) (currentByte!15078 thiss!1702) (bvadd (currentBit!15073 thiss!1702) #b00000000000000000000000000000001))) (tuple2!23747 Unit!22067 (BitStream!14227 (buf!8174 thiss!1702) (bvadd (currentByte!15078 thiss!1702) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!106382 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9032 (buf!8174 thiss!1702))) ((_ sign_extend 32) (currentByte!15078 thiss!1702)) ((_ sign_extend 32) (currentBit!15073 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!106382 (= (increaseBitIndex!0 thiss!1702) lt!446602)))

(declare-fun b!324099 () Bool)

(declare-fun res!266019 () Bool)

(assert (=> b!324099 (=> (not res!266019) (not e!233553))))

(declare-fun lt!446603 () (_ BitVec 64))

(declare-fun lt!446606 () (_ BitVec 64))

(assert (=> b!324099 (= res!266019 (= (bvsub lt!446603 lt!446606) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!324099 (or (= (bvand lt!446603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446606 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446603 lt!446606) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!324099 (= lt!446606 (remainingBits!0 ((_ sign_extend 32) (size!9032 (buf!8174 (_2!13502 lt!446602)))) ((_ sign_extend 32) (currentByte!15078 (_2!13502 lt!446602))) ((_ sign_extend 32) (currentBit!15073 (_2!13502 lt!446602)))))))

(assert (=> b!324099 (= lt!446603 (remainingBits!0 ((_ sign_extend 32) (size!9032 (buf!8174 thiss!1702))) ((_ sign_extend 32) (currentByte!15078 thiss!1702)) ((_ sign_extend 32) (currentBit!15073 thiss!1702))))))

(declare-fun b!324100 () Bool)

(assert (=> b!324100 (= e!233553 (= (size!9032 (buf!8174 thiss!1702)) (size!9032 (buf!8174 (_2!13502 lt!446602)))))))

(assert (= (and d!106382 res!266020) b!324099))

(assert (= (and b!324099 res!266019) b!324100))

(declare-fun m!462203 () Bool)

(assert (=> d!106382 m!462203))

(declare-fun m!462205 () Bool)

(assert (=> d!106382 m!462205))

(assert (=> d!106382 m!462185))

(declare-fun m!462207 () Bool)

(assert (=> b!324099 m!462207))

(assert (=> b!324099 m!462185))

(assert (=> b!324071 d!106382))

(check-sat (not d!106378) (not d!106382) (not b!324099) (not d!106374))
(check-sat)
(get-model)

(declare-fun d!106386 () Bool)

(assert (=> d!106386 (= (invariant!0 (currentBit!15073 thiss!1702) (currentByte!15078 thiss!1702) (size!9032 (buf!8174 thiss!1702))) (and (bvsge (currentBit!15073 thiss!1702) #b00000000000000000000000000000000) (bvslt (currentBit!15073 thiss!1702) #b00000000000000000000000000001000) (bvsge (currentByte!15078 thiss!1702) #b00000000000000000000000000000000) (or (bvslt (currentByte!15078 thiss!1702) (size!9032 (buf!8174 thiss!1702))) (and (= (currentBit!15073 thiss!1702) #b00000000000000000000000000000000) (= (currentByte!15078 thiss!1702) (size!9032 (buf!8174 thiss!1702)))))))))

(assert (=> d!106378 d!106386))

(declare-fun d!106388 () Bool)

(declare-fun e!233556 () Bool)

(assert (=> d!106388 e!233556))

(declare-fun res!266026 () Bool)

(assert (=> d!106388 (=> (not res!266026) (not e!233556))))

(declare-fun lt!446621 () (_ BitVec 64))

(declare-fun lt!446619 () (_ BitVec 64))

(declare-fun lt!446623 () (_ BitVec 64))

(assert (=> d!106388 (= res!266026 (= lt!446623 (bvsub lt!446619 lt!446621)))))

(assert (=> d!106388 (or (= (bvand lt!446619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446621 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446619 lt!446621) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106388 (= lt!446621 (remainingBits!0 ((_ sign_extend 32) (size!9032 (buf!8174 (_2!13502 lt!446602)))) ((_ sign_extend 32) (currentByte!15078 (_2!13502 lt!446602))) ((_ sign_extend 32) (currentBit!15073 (_2!13502 lt!446602)))))))

(declare-fun lt!446622 () (_ BitVec 64))

(declare-fun lt!446624 () (_ BitVec 64))

(assert (=> d!106388 (= lt!446619 (bvmul lt!446622 lt!446624))))

(assert (=> d!106388 (or (= lt!446622 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446624 (bvsdiv (bvmul lt!446622 lt!446624) lt!446622)))))

(assert (=> d!106388 (= lt!446624 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106388 (= lt!446622 ((_ sign_extend 32) (size!9032 (buf!8174 (_2!13502 lt!446602)))))))

(assert (=> d!106388 (= lt!446623 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15078 (_2!13502 lt!446602))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15073 (_2!13502 lt!446602)))))))

(assert (=> d!106388 (invariant!0 (currentBit!15073 (_2!13502 lt!446602)) (currentByte!15078 (_2!13502 lt!446602)) (size!9032 (buf!8174 (_2!13502 lt!446602))))))

(assert (=> d!106388 (= (bitIndex!0 (size!9032 (buf!8174 (_2!13502 lt!446602))) (currentByte!15078 (_2!13502 lt!446602)) (currentBit!15073 (_2!13502 lt!446602))) lt!446623)))

(declare-fun b!324105 () Bool)

(declare-fun res!266025 () Bool)

(assert (=> b!324105 (=> (not res!266025) (not e!233556))))

(assert (=> b!324105 (= res!266025 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446623))))

(declare-fun b!324106 () Bool)

(declare-fun lt!446620 () (_ BitVec 64))

(assert (=> b!324106 (= e!233556 (bvsle lt!446623 (bvmul lt!446620 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324106 (or (= lt!446620 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446620 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446620)))))

(assert (=> b!324106 (= lt!446620 ((_ sign_extend 32) (size!9032 (buf!8174 (_2!13502 lt!446602)))))))

(assert (= (and d!106388 res!266026) b!324105))

(assert (= (and b!324105 res!266025) b!324106))

(assert (=> d!106388 m!462207))

(declare-fun m!462209 () Bool)

(assert (=> d!106388 m!462209))

(assert (=> d!106382 d!106388))

(declare-fun d!106390 () Bool)

(declare-fun e!233557 () Bool)

(assert (=> d!106390 e!233557))

(declare-fun res!266028 () Bool)

(assert (=> d!106390 (=> (not res!266028) (not e!233557))))

(declare-fun lt!446625 () (_ BitVec 64))

(declare-fun lt!446629 () (_ BitVec 64))

(declare-fun lt!446627 () (_ BitVec 64))

(assert (=> d!106390 (= res!266028 (= lt!446629 (bvsub lt!446625 lt!446627)))))

(assert (=> d!106390 (or (= (bvand lt!446625 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446627 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446625 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446625 lt!446627) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106390 (= lt!446627 (remainingBits!0 ((_ sign_extend 32) (size!9032 (buf!8174 thiss!1702))) ((_ sign_extend 32) (currentByte!15078 thiss!1702)) ((_ sign_extend 32) (currentBit!15073 thiss!1702))))))

(declare-fun lt!446628 () (_ BitVec 64))

(declare-fun lt!446630 () (_ BitVec 64))

(assert (=> d!106390 (= lt!446625 (bvmul lt!446628 lt!446630))))

(assert (=> d!106390 (or (= lt!446628 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446630 (bvsdiv (bvmul lt!446628 lt!446630) lt!446628)))))

(assert (=> d!106390 (= lt!446630 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106390 (= lt!446628 ((_ sign_extend 32) (size!9032 (buf!8174 thiss!1702))))))

(assert (=> d!106390 (= lt!446629 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15078 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15073 thiss!1702))))))

(assert (=> d!106390 (invariant!0 (currentBit!15073 thiss!1702) (currentByte!15078 thiss!1702) (size!9032 (buf!8174 thiss!1702)))))

(assert (=> d!106390 (= (bitIndex!0 (size!9032 (buf!8174 thiss!1702)) (currentByte!15078 thiss!1702) (currentBit!15073 thiss!1702)) lt!446629)))

(declare-fun b!324107 () Bool)

(declare-fun res!266027 () Bool)

(assert (=> b!324107 (=> (not res!266027) (not e!233557))))

(assert (=> b!324107 (= res!266027 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446629))))

(declare-fun b!324108 () Bool)

(declare-fun lt!446626 () (_ BitVec 64))

(assert (=> b!324108 (= e!233557 (bvsle lt!446629 (bvmul lt!446626 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324108 (or (= lt!446626 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446626 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446626)))))

(assert (=> b!324108 (= lt!446626 ((_ sign_extend 32) (size!9032 (buf!8174 thiss!1702))))))

(assert (= (and d!106390 res!266028) b!324107))

(assert (= (and b!324107 res!266027) b!324108))

(assert (=> d!106390 m!462185))

(assert (=> d!106390 m!462189))

(assert (=> d!106382 d!106390))

(declare-fun d!106392 () Bool)

(assert (=> d!106392 (= (remainingBits!0 ((_ sign_extend 32) (size!9032 (buf!8174 thiss!1702))) ((_ sign_extend 32) (currentByte!15078 thiss!1702)) ((_ sign_extend 32) (currentBit!15073 thiss!1702))) (bvsub (bvmul ((_ sign_extend 32) (size!9032 (buf!8174 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15078 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15073 thiss!1702)))))))

(assert (=> d!106382 d!106392))

(declare-fun d!106394 () Bool)

(assert (=> d!106394 (= (remainingBits!0 ((_ sign_extend 32) (size!9032 (buf!8174 (_2!13502 lt!446602)))) ((_ sign_extend 32) (currentByte!15078 (_2!13502 lt!446602))) ((_ sign_extend 32) (currentBit!15073 (_2!13502 lt!446602)))) (bvsub (bvmul ((_ sign_extend 32) (size!9032 (buf!8174 (_2!13502 lt!446602)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15078 (_2!13502 lt!446602))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15073 (_2!13502 lt!446602))))))))

(assert (=> b!324099 d!106394))

(assert (=> b!324099 d!106392))

(assert (=> d!106374 d!106392))

(check-sat (not d!106390) (not d!106388))
