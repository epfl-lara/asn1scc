; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72426 () Bool)

(assert start!72426)

(declare-fun res!266002 () Bool)

(declare-fun e!233541 () Bool)

(assert (=> start!72426 (=> (not res!266002) (not e!233541))))

(declare-datatypes ((array!20762 0))(
  ( (array!20763 (arr!10125 (Array (_ BitVec 32) (_ BitVec 8))) (size!9033 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14228 0))(
  ( (BitStream!14229 (buf!8175 array!20762) (currentByte!15079 (_ BitVec 32)) (currentBit!15074 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14228)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!72426 (= res!266002 (validate_offset_bit!0 ((_ sign_extend 32) (size!9033 (buf!8175 thiss!1702))) ((_ sign_extend 32) (currentByte!15079 thiss!1702)) ((_ sign_extend 32) (currentBit!15074 thiss!1702))))))

(assert (=> start!72426 e!233541))

(declare-fun e!233543 () Bool)

(declare-fun inv!12 (BitStream!14228) Bool)

(assert (=> start!72426 (and (inv!12 thiss!1702) e!233543)))

(declare-fun b!324080 () Bool)

(declare-fun e!233544 () Bool)

(assert (=> b!324080 (= e!233541 e!233544)))

(declare-fun res!266001 () Bool)

(assert (=> b!324080 (=> (not res!266001) (not e!233544))))

(declare-datatypes ((Unit!22060 0))(
  ( (Unit!22061) )
))
(declare-datatypes ((tuple2!23748 0))(
  ( (tuple2!23749 (_1!13503 Unit!22060) (_2!13503 BitStream!14228)) )
))
(declare-fun lt!446561 () tuple2!23748)

(assert (=> b!324080 (= res!266001 (= (buf!8175 (_2!13503 lt!446561)) (buf!8175 thiss!1702)))))

(declare-fun increaseBitIndex!0 (BitStream!14228) tuple2!23748)

(assert (=> b!324080 (= lt!446561 (increaseBitIndex!0 thiss!1702))))

(declare-fun b!324081 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324081 (= e!233544 (not (invariant!0 (currentBit!15074 (_2!13503 lt!446561)) (currentByte!15079 (_2!13503 lt!446561)) (size!9033 (buf!8175 (_2!13503 lt!446561))))))))

(declare-fun b!324082 () Bool)

(declare-fun array_inv!8585 (array!20762) Bool)

(assert (=> b!324082 (= e!233543 (array_inv!8585 (buf!8175 thiss!1702)))))

(assert (= (and start!72426 res!266002) b!324080))

(assert (= (and b!324080 res!266001) b!324081))

(assert (= start!72426 b!324082))

(declare-fun m!462169 () Bool)

(assert (=> start!72426 m!462169))

(declare-fun m!462171 () Bool)

(assert (=> start!72426 m!462171))

(declare-fun m!462173 () Bool)

(assert (=> b!324080 m!462173))

(declare-fun m!462175 () Bool)

(assert (=> b!324081 m!462175))

(declare-fun m!462177 () Bool)

(assert (=> b!324082 m!462177))

(push 1)

(assert (not b!324082))

(assert (not start!72426))

(assert (not b!324080))

(assert (not b!324081))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106356 () Bool)

(assert (=> d!106356 (= (array_inv!8585 (buf!8175 thiss!1702)) (bvsge (size!9033 (buf!8175 thiss!1702)) #b00000000000000000000000000000000))))

(assert (=> b!324082 d!106356))

(declare-fun d!106358 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106358 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9033 (buf!8175 thiss!1702))) ((_ sign_extend 32) (currentByte!15079 thiss!1702)) ((_ sign_extend 32) (currentBit!15074 thiss!1702))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9033 (buf!8175 thiss!1702))) ((_ sign_extend 32) (currentByte!15079 thiss!1702)) ((_ sign_extend 32) (currentBit!15074 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!28021 () Bool)

(assert (= bs!28021 d!106358))

(declare-fun m!462179 () Bool)

(assert (=> bs!28021 m!462179))

(assert (=> start!72426 d!106358))

(declare-fun d!106362 () Bool)

(assert (=> d!106362 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15074 thiss!1702) (currentByte!15079 thiss!1702) (size!9033 (buf!8175 thiss!1702))))))

(declare-fun bs!28022 () Bool)

(assert (= bs!28022 d!106362))

(declare-fun m!462181 () Bool)

(assert (=> bs!28022 m!462181))

(assert (=> start!72426 d!106362))

(declare-fun d!106366 () Bool)

(declare-fun e!233549 () Bool)

(assert (=> d!106366 e!233549))

(declare-fun res!266011 () Bool)

(assert (=> d!106366 (=> (not res!266011) (not e!233549))))

(declare-fun lt!446585 () tuple2!23748)

(declare-fun lt!446584 () (_ BitVec 64))

(declare-fun lt!446586 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!106366 (= res!266011 (= (bvadd lt!446584 lt!446586) (bitIndex!0 (size!9033 (buf!8175 (_2!13503 lt!446585))) (currentByte!15079 (_2!13503 lt!446585)) (currentBit!15074 (_2!13503 lt!446585)))))))

(assert (=> d!106366 (or (not (= (bvand lt!446584 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446586 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446584 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446584 lt!446586) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106366 (= lt!446586 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!106366 (= lt!446584 (bitIndex!0 (size!9033 (buf!8175 thiss!1702)) (currentByte!15079 thiss!1702) (currentBit!15074 thiss!1702)))))

(declare-fun Unit!22063 () Unit!22060)

(declare-fun Unit!22065 () Unit!22060)

(assert (=> d!106366 (= lt!446585 (ite (bvslt (currentBit!15074 thiss!1702) #b00000000000000000000000000000111) (tuple2!23749 Unit!22063 (BitStream!14229 (buf!8175 thiss!1702) (currentByte!15079 thiss!1702) (bvadd (currentBit!15074 thiss!1702) #b00000000000000000000000000000001))) (tuple2!23749 Unit!22065 (BitStream!14229 (buf!8175 thiss!1702) (bvadd (currentByte!15079 thiss!1702) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!106366 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9033 (buf!8175 thiss!1702))) ((_ sign_extend 32) (currentByte!15079 thiss!1702)) ((_ sign_extend 32) (currentBit!15074 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!106366 (= (increaseBitIndex!0 thiss!1702) lt!446585)))

(declare-fun b!324091 () Bool)

(declare-fun res!266012 () Bool)

(assert (=> b!324091 (=> (not res!266012) (not e!233549))))

(declare-fun lt!446587 () (_ BitVec 64))

(declare-fun lt!446588 () (_ BitVec 64))

(assert (=> b!324091 (= res!266012 (= (bvsub lt!446587 lt!446588) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!324091 (or (= (bvand lt!446587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446588 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446587 lt!446588) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!324091 (= lt!446588 (remainingBits!0 ((_ sign_extend 32) (size!9033 (buf!8175 (_2!13503 lt!446585)))) ((_ sign_extend 32) (currentByte!15079 (_2!13503 lt!446585))) ((_ sign_extend 32) (currentBit!15074 (_2!13503 lt!446585)))))))

(assert (=> b!324091 (= lt!446587 (remainingBits!0 ((_ sign_extend 32) (size!9033 (buf!8175 thiss!1702))) ((_ sign_extend 32) (currentByte!15079 thiss!1702)) ((_ sign_extend 32) (currentBit!15074 thiss!1702))))))

(declare-fun b!324092 () Bool)

(assert (=> b!324092 (= e!233549 (= (size!9033 (buf!8175 thiss!1702)) (size!9033 (buf!8175 (_2!13503 lt!446585)))))))

(assert (= (and d!106366 res!266011) b!324091))

(assert (= (and b!324091 res!266012) b!324092))

(declare-fun m!462191 () Bool)

(assert (=> d!106366 m!462191))

(declare-fun m!462193 () Bool)

(assert (=> d!106366 m!462193))

(assert (=> d!106366 m!462179))

(declare-fun m!462195 () Bool)

(assert (=> b!324091 m!462195))

(assert (=> b!324091 m!462179))

(assert (=> b!324080 d!106366))

(declare-fun d!106384 () Bool)

(assert (=> d!106384 (= (invariant!0 (currentBit!15074 (_2!13503 lt!446561)) (currentByte!15079 (_2!13503 lt!446561)) (size!9033 (buf!8175 (_2!13503 lt!446561)))) (and (bvsge (currentBit!15074 (_2!13503 lt!446561)) #b00000000000000000000000000000000) (bvslt (currentBit!15074 (_2!13503 lt!446561)) #b00000000000000000000000000001000) (bvsge (currentByte!15079 (_2!13503 lt!446561)) #b00000000000000000000000000000000) (or (bvslt (currentByte!15079 (_2!13503 lt!446561)) (size!9033 (buf!8175 (_2!13503 lt!446561)))) (and (= (currentBit!15074 (_2!13503 lt!446561)) #b00000000000000000000000000000000) (= (currentByte!15079 (_2!13503 lt!446561)) (size!9033 (buf!8175 (_2!13503 lt!446561))))))))))

(assert (=> b!324081 d!106384))

(push 1)

(assert (not d!106358))

(assert (not d!106362))

(assert (not b!324091))

(assert (not d!106366))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106406 () Bool)

(assert (=> d!106406 (= (remainingBits!0 ((_ sign_extend 32) (size!9033 (buf!8175 thiss!1702))) ((_ sign_extend 32) (currentByte!15079 thiss!1702)) ((_ sign_extend 32) (currentBit!15074 thiss!1702))) (bvsub (bvmul ((_ sign_extend 32) (size!9033 (buf!8175 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15079 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15074 thiss!1702)))))))

(assert (=> d!106358 d!106406))

(declare-fun d!106408 () Bool)

(assert (=> d!106408 (= (invariant!0 (currentBit!15074 thiss!1702) (currentByte!15079 thiss!1702) (size!9033 (buf!8175 thiss!1702))) (and (bvsge (currentBit!15074 thiss!1702) #b00000000000000000000000000000000) (bvslt (currentBit!15074 thiss!1702) #b00000000000000000000000000001000) (bvsge (currentByte!15079 thiss!1702) #b00000000000000000000000000000000) (or (bvslt (currentByte!15079 thiss!1702) (size!9033 (buf!8175 thiss!1702))) (and (= (currentBit!15074 thiss!1702) #b00000000000000000000000000000000) (= (currentByte!15079 thiss!1702) (size!9033 (buf!8175 thiss!1702)))))))))

(assert (=> d!106362 d!106408))

(declare-fun d!106410 () Bool)

(assert (=> d!106410 (= (remainingBits!0 ((_ sign_extend 32) (size!9033 (buf!8175 (_2!13503 lt!446585)))) ((_ sign_extend 32) (currentByte!15079 (_2!13503 lt!446585))) ((_ sign_extend 32) (currentBit!15074 (_2!13503 lt!446585)))) (bvsub (bvmul ((_ sign_extend 32) (size!9033 (buf!8175 (_2!13503 lt!446585)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15079 (_2!13503 lt!446585))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15074 (_2!13503 lt!446585))))))))

(assert (=> b!324091 d!106410))

(assert (=> b!324091 d!106406))

(declare-fun d!106412 () Bool)

(declare-fun e!233564 () Bool)

(assert (=> d!106412 e!233564))

(declare-fun res!266042 () Bool)

(assert (=> d!106412 (=> (not res!266042) (not e!233564))))

(declare-fun lt!446668 () (_ BitVec 64))

(declare-fun lt!446671 () (_ BitVec 64))

(declare-fun lt!446669 () (_ BitVec 64))

(assert (=> d!106412 (= res!266042 (= lt!446668 (bvsub lt!446669 lt!446671)))))

(assert (=> d!106412 (or (= (bvand lt!446669 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446671 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446669 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446669 lt!446671) #b1000000000000000000000000000000000000000000000000000000000000000)))))

