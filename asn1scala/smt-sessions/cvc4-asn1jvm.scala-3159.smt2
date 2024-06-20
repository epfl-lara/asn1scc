; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72582 () Bool)

(assert start!72582)

(declare-fun res!266116 () Bool)

(declare-fun e!233682 () Bool)

(assert (=> start!72582 (=> (not res!266116) (not e!233682))))

(declare-datatypes ((array!20798 0))(
  ( (array!20799 (arr!10137 (Array (_ BitVec 32) (_ BitVec 8))) (size!9045 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14252 0))(
  ( (BitStream!14253 (buf!8187 array!20798) (currentByte!15127 (_ BitVec 32)) (currentBit!15122 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14252)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!72582 (= res!266116 (validate_offset_bit!0 ((_ sign_extend 32) (size!9045 (buf!8187 thiss!1702))) ((_ sign_extend 32) (currentByte!15127 thiss!1702)) ((_ sign_extend 32) (currentBit!15122 thiss!1702))))))

(assert (=> start!72582 e!233682))

(declare-fun e!233681 () Bool)

(declare-fun inv!12 (BitStream!14252) Bool)

(assert (=> start!72582 (and (inv!12 thiss!1702) e!233681)))

(declare-fun b!324230 () Bool)

(declare-fun res!266115 () Bool)

(assert (=> b!324230 (=> (not res!266115) (not e!233682))))

(declare-datatypes ((Unit!22084 0))(
  ( (Unit!22085) )
))
(declare-datatypes ((tuple2!23760 0))(
  ( (tuple2!23761 (_1!13509 Unit!22084) (_2!13509 BitStream!14252)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14252) tuple2!23760)

(assert (=> b!324230 (= res!266115 (= (buf!8187 (_2!13509 (increaseBitIndex!0 thiss!1702))) (buf!8187 thiss!1702)))))

(declare-fun b!324231 () Bool)

(declare-fun lt!446740 () (_ BitVec 64))

(declare-fun lt!446741 () (_ BitVec 64))

(assert (=> b!324231 (= e!233682 (and (= lt!446740 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!446740 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!446741) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!324231 (= lt!446740 (bvand lt!446741 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324231 (= lt!446741 (bitIndex!0 (size!9045 (buf!8187 thiss!1702)) (currentByte!15127 thiss!1702) (currentBit!15122 thiss!1702)))))

(declare-fun b!324232 () Bool)

(declare-fun array_inv!8597 (array!20798) Bool)

(assert (=> b!324232 (= e!233681 (array_inv!8597 (buf!8187 thiss!1702)))))

(assert (= (and start!72582 res!266116) b!324230))

(assert (= (and b!324230 res!266115) b!324231))

(assert (= start!72582 b!324232))

(declare-fun m!462349 () Bool)

(assert (=> start!72582 m!462349))

(declare-fun m!462351 () Bool)

(assert (=> start!72582 m!462351))

(declare-fun m!462353 () Bool)

(assert (=> b!324230 m!462353))

(declare-fun m!462355 () Bool)

(assert (=> b!324231 m!462355))

(declare-fun m!462357 () Bool)

(assert (=> b!324232 m!462357))

(push 1)

(assert (not b!324232))

(assert (not start!72582))

(assert (not b!324230))

(assert (not b!324231))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106518 () Bool)

(assert (=> d!106518 (= (array_inv!8597 (buf!8187 thiss!1702)) (bvsge (size!9045 (buf!8187 thiss!1702)) #b00000000000000000000000000000000))))

(assert (=> b!324232 d!106518))

(declare-fun d!106520 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106520 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9045 (buf!8187 thiss!1702))) ((_ sign_extend 32) (currentByte!15127 thiss!1702)) ((_ sign_extend 32) (currentBit!15122 thiss!1702))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9045 (buf!8187 thiss!1702))) ((_ sign_extend 32) (currentByte!15127 thiss!1702)) ((_ sign_extend 32) (currentBit!15122 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!28057 () Bool)

(assert (= bs!28057 d!106520))

(declare-fun m!462359 () Bool)

(assert (=> bs!28057 m!462359))

(assert (=> start!72582 d!106520))

(declare-fun d!106522 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106522 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15122 thiss!1702) (currentByte!15127 thiss!1702) (size!9045 (buf!8187 thiss!1702))))))

(declare-fun bs!28058 () Bool)

(assert (= bs!28058 d!106522))

(declare-fun m!462361 () Bool)

(assert (=> bs!28058 m!462361))

(assert (=> start!72582 d!106522))

(declare-fun d!106524 () Bool)

(declare-fun e!233694 () Bool)

(assert (=> d!106524 e!233694))

(declare-fun res!266139 () Bool)

(assert (=> d!106524 (=> (not res!266139) (not e!233694))))

(declare-fun lt!446804 () (_ BitVec 64))

(declare-fun lt!446805 () (_ BitVec 64))

(declare-fun lt!446806 () tuple2!23760)

(assert (=> d!106524 (= res!266139 (= (bvadd lt!446804 lt!446805) (bitIndex!0 (size!9045 (buf!8187 (_2!13509 lt!446806))) (currentByte!15127 (_2!13509 lt!446806)) (currentBit!15122 (_2!13509 lt!446806)))))))

(assert (=> d!106524 (or (not (= (bvand lt!446804 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446805 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446804 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446804 lt!446805) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106524 (= lt!446805 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!106524 (= lt!446804 (bitIndex!0 (size!9045 (buf!8187 thiss!1702)) (currentByte!15127 thiss!1702) (currentBit!15122 thiss!1702)))))

(declare-fun Unit!22088 () Unit!22084)

(declare-fun Unit!22090 () Unit!22084)

(assert (=> d!106524 (= lt!446806 (ite (bvslt (currentBit!15122 thiss!1702) #b00000000000000000000000000000111) (tuple2!23761 Unit!22088 (BitStream!14253 (buf!8187 thiss!1702) (currentByte!15127 thiss!1702) (bvadd (currentBit!15122 thiss!1702) #b00000000000000000000000000000001))) (tuple2!23761 Unit!22090 (BitStream!14253 (buf!8187 thiss!1702) (bvadd (currentByte!15127 thiss!1702) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!106524 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9045 (buf!8187 thiss!1702))) ((_ sign_extend 32) (currentByte!15127 thiss!1702)) ((_ sign_extend 32) (currentBit!15122 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!106524 (= (increaseBitIndex!0 thiss!1702) lt!446806)))

(declare-fun b!324255 () Bool)

(declare-fun res!266140 () Bool)

(assert (=> b!324255 (=> (not res!266140) (not e!233694))))

(declare-fun lt!446807 () (_ BitVec 64))

(declare-fun lt!446803 () (_ BitVec 64))

(assert (=> b!324255 (= res!266140 (= (bvsub lt!446807 lt!446803) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!324255 (or (= (bvand lt!446807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446803 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446807 lt!446803) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!324255 (= lt!446803 (remainingBits!0 ((_ sign_extend 32) (size!9045 (buf!8187 (_2!13509 lt!446806)))) ((_ sign_extend 32) (currentByte!15127 (_2!13509 lt!446806))) ((_ sign_extend 32) (currentBit!15122 (_2!13509 lt!446806)))))))

(assert (=> b!324255 (= lt!446807 (remainingBits!0 ((_ sign_extend 32) (size!9045 (buf!8187 thiss!1702))) ((_ sign_extend 32) (currentByte!15127 thiss!1702)) ((_ sign_extend 32) (currentBit!15122 thiss!1702))))))

(declare-fun b!324256 () Bool)

(assert (=> b!324256 (= e!233694 (= (size!9045 (buf!8187 thiss!1702)) (size!9045 (buf!8187 (_2!13509 lt!446806)))))))

(assert (= (and d!106524 res!266139) b!324255))

(assert (= (and b!324255 res!266140) b!324256))

(declare-fun m!462375 () Bool)

(assert (=> d!106524 m!462375))

(assert (=> d!106524 m!462355))

(assert (=> d!106524 m!462359))

(declare-fun m!462377 () Bool)

(assert (=> b!324255 m!462377))

(assert (=> b!324255 m!462359))

(assert (=> b!324230 d!106524))

(declare-fun d!106542 () Bool)

(declare-fun e!233700 () Bool)

(assert (=> d!106542 e!233700))

(declare-fun res!266152 () Bool)

(assert (=> d!106542 (=> (not res!266152) (not e!233700))))

(declare-fun lt!446835 () (_ BitVec 64))

(declare-fun lt!446840 () (_ BitVec 64))

(declare-fun lt!446838 () (_ BitVec 64))

(assert (=> d!106542 (= res!266152 (= lt!446840 (bvsub lt!446838 lt!446835)))))

(assert (=> d!106542 (or (= (bvand lt!446838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446835 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446838 lt!446835) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106542 (= lt!446835 (remainingBits!0 ((_ sign_extend 32) (size!9045 (buf!8187 thiss!1702))) ((_ sign_extend 32) (currentByte!15127 thiss!1702)) ((_ sign_extend 32) (currentBit!15122 thiss!1702))))))

(declare-fun lt!446836 () (_ BitVec 64))

(declare-fun lt!446837 () (_ BitVec 64))

(assert (=> d!106542 (= lt!446838 (bvmul lt!446836 lt!446837))))

(assert (=> d!106542 (or (= lt!446836 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446837 (bvsdiv (bvmul lt!446836 lt!446837) lt!446836)))))

(assert (=> d!106542 (= lt!446837 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106542 (= lt!446836 ((_ sign_extend 32) (size!9045 (buf!8187 thiss!1702))))))

(assert (=> d!106542 (= lt!446840 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15127 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15122 thiss!1702))))))

(assert (=> d!106542 (invariant!0 (currentBit!15122 thiss!1702) (currentByte!15127 thiss!1702) (size!9045 (buf!8187 thiss!1702)))))

(assert (=> d!106542 (= (bitIndex!0 (size!9045 (buf!8187 thiss!1702)) (currentByte!15127 thiss!1702) (currentBit!15122 thiss!1702)) lt!446840)))

(declare-fun b!324267 () Bool)

(declare-fun res!266151 () Bool)

(assert (=> b!324267 (=> (not res!266151) (not e!233700))))

(assert (=> b!324267 (= res!266151 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446840))))

(declare-fun b!324268 () Bool)

(declare-fun lt!446839 () (_ BitVec 64))

(assert (=> b!324268 (= e!233700 (bvsle lt!446840 (bvmul lt!446839 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324268 (or (= lt!446839 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446839 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446839)))))

(assert (=> b!324268 (= lt!446839 ((_ sign_extend 32) (size!9045 (buf!8187 thiss!1702))))))

(assert (= (and d!106542 res!266152) b!324267))

(assert (= (and b!324267 res!266151) b!324268))

(assert (=> d!106542 m!462359))

(assert (=> d!106542 m!462361))

(assert (=> b!324231 d!106542))

(push 1)

(assert (not d!106520))

(assert (not d!106524))

(assert (not d!106542))

(assert (not d!106522))

(assert (not b!324255))

(check-sat)

(pop 1)

(push 1)

(check-sat)

