; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71726 () Bool)

(assert start!71726)

(declare-fun res!264375 () Bool)

(declare-fun e!232106 () Bool)

(assert (=> start!71726 (=> (not res!264375) (not e!232106))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!71726 (= res!264375 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71726 e!232106))

(assert (=> start!71726 true))

(declare-datatypes ((array!20545 0))(
  ( (array!20546 (arr!10036 (Array (_ BitVec 32) (_ BitVec 8))) (size!8944 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14050 0))(
  ( (BitStream!14051 (buf!8086 array!20545) (currentByte!14903 (_ BitVec 32)) (currentBit!14898 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14050)

(declare-fun e!232104 () Bool)

(declare-fun inv!12 (BitStream!14050) Bool)

(assert (=> start!71726 (and (inv!12 thiss!1793) e!232104)))

(declare-fun b!322085 () Bool)

(declare-fun e!232105 () Bool)

(assert (=> b!322085 (= e!232106 e!232105)))

(declare-fun res!264379 () Bool)

(assert (=> b!322085 (=> (not res!264379) (not e!232105))))

(assert (=> b!322085 (= res!264379 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsle (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(declare-datatypes ((tuple2!23520 0))(
  ( (tuple2!23521 (_1!13389 Bool) (_2!13389 BitStream!14050)) )
))
(declare-fun lt!444719 () tuple2!23520)

(declare-fun readBit!0 (BitStream!14050) tuple2!23520)

(assert (=> b!322085 (= lt!444719 (readBit!0 thiss!1793))))

(declare-fun b!322086 () Bool)

(declare-fun array_inv!8496 (array!20545) Bool)

(assert (=> b!322086 (= e!232104 (array_inv!8496 (buf!8086 thiss!1793)))))

(declare-fun b!322087 () Bool)

(declare-fun res!264376 () Bool)

(assert (=> b!322087 (=> (not res!264376) (not e!232106))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322087 (= res!264376 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322088 () Bool)

(declare-fun res!264378 () Bool)

(assert (=> b!322088 (=> (not res!264378) (not e!232106))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322088 (= res!264378 (validate_offset_bits!1 ((_ sign_extend 32) (size!8944 (buf!8086 thiss!1793))) ((_ sign_extend 32) (currentByte!14903 thiss!1793)) ((_ sign_extend 32) (currentBit!14898 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!322089 () Bool)

(declare-fun res!264377 () Bool)

(assert (=> b!322089 (=> (not res!264377) (not e!232106))))

(assert (=> b!322089 (= res!264377 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!322090 () Bool)

(assert (=> b!322090 (= e!232105 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!8944 (buf!8086 (_2!13389 lt!444719)))) ((_ sign_extend 32) (currentByte!14903 (_2!13389 lt!444719))) ((_ sign_extend 32) (currentBit!14898 (_2!13389 lt!444719))) ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743))))))))

(assert (= (and start!71726 res!264375) b!322088))

(assert (= (and b!322088 res!264378) b!322087))

(assert (= (and b!322087 res!264376) b!322089))

(assert (= (and b!322089 res!264377) b!322085))

(assert (= (and b!322085 res!264379) b!322090))

(assert (= start!71726 b!322086))

(declare-fun m!460323 () Bool)

(assert (=> b!322085 m!460323))

(declare-fun m!460325 () Bool)

(assert (=> b!322090 m!460325))

(declare-fun m!460327 () Bool)

(assert (=> start!71726 m!460327))

(declare-fun m!460329 () Bool)

(assert (=> b!322087 m!460329))

(declare-fun m!460331 () Bool)

(assert (=> b!322086 m!460331))

(declare-fun m!460333 () Bool)

(assert (=> b!322088 m!460333))

(push 1)

(assert (not b!322085))

(assert (not b!322090))

(assert (not start!71726))

(assert (not b!322086))

(assert (not b!322088))

(assert (not b!322087))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105642 () Bool)

(declare-fun e!232151 () Bool)

(assert (=> d!105642 e!232151))

(declare-fun res!264417 () Bool)

(assert (=> d!105642 (=> (not res!264417) (not e!232151))))

(declare-datatypes ((Unit!22000 0))(
  ( (Unit!22001) )
))
(declare-datatypes ((tuple2!23528 0))(
  ( (tuple2!23529 (_1!13393 Unit!22000) (_2!13393 BitStream!14050)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14050) tuple2!23528)

(assert (=> d!105642 (= res!264417 (= (buf!8086 (_2!13393 (increaseBitIndex!0 thiss!1793))) (buf!8086 thiss!1793)))))

(declare-fun lt!444775 () Bool)

(assert (=> d!105642 (= lt!444775 (not (= (bvand ((_ sign_extend 24) (select (arr!10036 (buf!8086 thiss!1793)) (currentByte!14903 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14898 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444777 () tuple2!23520)

(assert (=> d!105642 (= lt!444777 (tuple2!23521 (not (= (bvand ((_ sign_extend 24) (select (arr!10036 (buf!8086 thiss!1793)) (currentByte!14903 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14898 thiss!1793)))) #b00000000000000000000000000000000)) (_2!13393 (increaseBitIndex!0 thiss!1793))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!105642 (validate_offset_bit!0 ((_ sign_extend 32) (size!8944 (buf!8086 thiss!1793))) ((_ sign_extend 32) (currentByte!14903 thiss!1793)) ((_ sign_extend 32) (currentBit!14898 thiss!1793)))))

(assert (=> d!105642 (= (readBit!0 thiss!1793) lt!444777)))

(declare-fun lt!444781 () (_ BitVec 64))

(declare-fun lt!444779 () (_ BitVec 64))

(declare-fun b!322134 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322134 (= e!232151 (= (bitIndex!0 (size!8944 (buf!8086 (_2!13393 (increaseBitIndex!0 thiss!1793)))) (currentByte!14903 (_2!13393 (increaseBitIndex!0 thiss!1793))) (currentBit!14898 (_2!13393 (increaseBitIndex!0 thiss!1793)))) (bvadd lt!444779 lt!444781)))))

(assert (=> b!322134 (or (not (= (bvand lt!444779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444781 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444779 lt!444781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322134 (= lt!444781 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!322134 (= lt!444779 (bitIndex!0 (size!8944 (buf!8086 thiss!1793)) (currentByte!14903 thiss!1793) (currentBit!14898 thiss!1793)))))

(declare-fun lt!444780 () Bool)

(assert (=> b!322134 (= lt!444780 (not (= (bvand ((_ sign_extend 24) (select (arr!10036 (buf!8086 thiss!1793)) (currentByte!14903 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14898 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444776 () Bool)

(assert (=> b!322134 (= lt!444776 (not (= (bvand ((_ sign_extend 24) (select (arr!10036 (buf!8086 thiss!1793)) (currentByte!14903 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14898 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444778 () Bool)

(assert (=> b!322134 (= lt!444778 (not (= (bvand ((_ sign_extend 24) (select (arr!10036 (buf!8086 thiss!1793)) (currentByte!14903 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14898 thiss!1793)))) #b00000000000000000000000000000000)))))

(assert (= (and d!105642 res!264417) b!322134))

(declare-fun m!460379 () Bool)

(assert (=> d!105642 m!460379))

(declare-fun m!460381 () Bool)

(assert (=> d!105642 m!460381))

(declare-fun m!460383 () Bool)

(assert (=> d!105642 m!460383))

(declare-fun m!460385 () Bool)

(assert (=> d!105642 m!460385))

(assert (=> b!322134 m!460379))

(declare-fun m!460387 () Bool)

(assert (=> b!322134 m!460387))

(declare-fun m!460389 () Bool)

(assert (=> b!322134 m!460389))

(assert (=> b!322134 m!460381))

(assert (=> b!322134 m!460383))

(assert (=> b!322085 d!105642))

(declare-fun d!105656 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105656 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8944 (buf!8086 (_2!13389 lt!444719)))) ((_ sign_extend 32) (currentByte!14903 (_2!13389 lt!444719))) ((_ sign_extend 32) (currentBit!14898 (_2!13389 lt!444719))) ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8944 (buf!8086 (_2!13389 lt!444719)))) ((_ sign_extend 32) (currentByte!14903 (_2!13389 lt!444719))) ((_ sign_extend 32) (currentBit!14898 (_2!13389 lt!444719)))) ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun bs!27838 () Bool)

(assert (= bs!27838 d!105656))

(declare-fun m!460391 () Bool)

(assert (=> bs!27838 m!460391))

(assert (=> b!322090 d!105656))

(declare-fun d!105658 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105658 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14898 thiss!1793) (currentByte!14903 thiss!1793) (size!8944 (buf!8086 thiss!1793))))))

(declare-fun bs!27839 () Bool)

(assert (= bs!27839 d!105658))

(declare-fun m!460397 () Bool)

(assert (=> bs!27839 m!460397))

(assert (=> start!71726 d!105658))

(declare-fun d!105660 () Bool)

(assert (=> d!105660 (= (array_inv!8496 (buf!8086 thiss!1793)) (bvsge (size!8944 (buf!8086 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!322086 d!105660))

(declare-fun d!105664 () Bool)

(assert (=> d!105664 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!322087 d!105664))

(declare-fun d!105668 () Bool)

(assert (=> d!105668 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8944 (buf!8086 thiss!1793))) ((_ sign_extend 32) (currentByte!14903 thiss!1793)) ((_ sign_extend 32) (currentBit!14898 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8944 (buf!8086 thiss!1793))) ((_ sign_extend 32) (currentByte!14903 thiss!1793)) ((_ sign_extend 32) (currentBit!14898 thiss!1793))) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun bs!27841 () Bool)

(assert (= bs!27841 d!105668))

(declare-fun m!460409 () Bool)

(assert (=> bs!27841 m!460409))

(assert (=> b!322088 d!105668))

(push 1)

(assert (not b!322134))

(assert (not d!105642))

(assert (not d!105658))

(assert (not d!105656))

(assert (not d!105668))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105684 () Bool)

(assert (=> d!105684 (= (remainingBits!0 ((_ sign_extend 32) (size!8944 (buf!8086 thiss!1793))) ((_ sign_extend 32) (currentByte!14903 thiss!1793)) ((_ sign_extend 32) (currentBit!14898 thiss!1793))) (bvsub (bvmul ((_ sign_extend 32) (size!8944 (buf!8086 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14903 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14898 thiss!1793)))))))

(assert (=> d!105668 d!105684))

(declare-fun d!105690 () Bool)

(declare-fun e!232162 () Bool)

(assert (=> d!105690 e!232162))

(declare-fun res!264437 () Bool)

(assert (=> d!105690 (=> (not res!264437) (not e!232162))))

(declare-fun lt!444840 () (_ BitVec 64))

(declare-fun lt!444839 () tuple2!23528)

(declare-fun lt!444841 () (_ BitVec 64))

(assert (=> d!105690 (= res!264437 (= (bvadd lt!444840 lt!444841) (bitIndex!0 (size!8944 (buf!8086 (_2!13393 lt!444839))) (currentByte!14903 (_2!13393 lt!444839)) (currentBit!14898 (_2!13393 lt!444839)))))))

(assert (=> d!105690 (or (not (= (bvand lt!444840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444841 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444840 lt!444841) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105690 (= lt!444841 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!105690 (= lt!444840 (bitIndex!0 (size!8944 (buf!8086 thiss!1793)) (currentByte!14903 thiss!1793) (currentBit!14898 thiss!1793)))))

(declare-fun Unit!22006 () Unit!22000)

(declare-fun Unit!22007 () Unit!22000)

(assert (=> d!105690 (= lt!444839 (ite (bvslt (currentBit!14898 thiss!1793) #b00000000000000000000000000000111) (tuple2!23529 Unit!22006 (BitStream!14051 (buf!8086 thiss!1793) (currentByte!14903 thiss!1793) (bvadd (currentBit!14898 thiss!1793) #b00000000000000000000000000000001))) (tuple2!23529 Unit!22007 (BitStream!14051 (buf!8086 thiss!1793) (bvadd (currentByte!14903 thiss!1793) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!105690 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!8944 (buf!8086 thiss!1793))) ((_ sign_extend 32) (currentByte!14903 thiss!1793)) ((_ sign_extend 32) (currentBit!14898 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!105690 (= (increaseBitIndex!0 thiss!1793) lt!444839)))

(declare-fun b!322154 () Bool)

(declare-fun res!264438 () Bool)

(assert (=> b!322154 (=> (not res!264438) (not e!232162))))

(declare-fun lt!444842 () (_ BitVec 64))

(declare-fun lt!444838 () (_ BitVec 64))

(assert (=> b!322154 (= res!264438 (= (bvsub lt!444842 lt!444838) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!322154 (or (= (bvand lt!444842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444838 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444842 lt!444838) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!322154 (= lt!444838 (remainingBits!0 ((_ sign_extend 32) (size!8944 (buf!8086 (_2!13393 lt!444839)))) ((_ sign_extend 32) (currentByte!14903 (_2!13393 lt!444839))) ((_ sign_extend 32) (currentBit!14898 (_2!13393 lt!444839)))))))

(assert (=> b!322154 (= lt!444842 (remainingBits!0 ((_ sign_extend 32) (size!8944 (buf!8086 thiss!1793))) ((_ sign_extend 32) (currentByte!14903 thiss!1793)) ((_ sign_extend 32) (currentBit!14898 thiss!1793))))))

(declare-fun b!322155 () Bool)

(assert (=> b!322155 (= e!232162 (= (size!8944 (buf!8086 thiss!1793)) (size!8944 (buf!8086 (_2!13393 lt!444839)))))))

(assert (= (and d!105690 res!264437) b!322154))

(assert (= (and b!322154 res!264438) b!322155))

(declare-fun m!460421 () Bool)

(assert (=> d!105690 m!460421))

(assert (=> d!105690 m!460389))

(assert (=> d!105690 m!460409))

(declare-fun m!460423 () Bool)

(assert (=> b!322154 m!460423))

(assert (=> b!322154 m!460409))

(assert (=> d!105642 d!105690))

(declare-fun d!105698 () Bool)

(assert (=> d!105698 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8944 (buf!8086 thiss!1793))) ((_ sign_extend 32) (currentByte!14903 thiss!1793)) ((_ sign_extend 32) (currentBit!14898 thiss!1793))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8944 (buf!8086 thiss!1793))) ((_ sign_extend 32) (currentByte!14903 thiss!1793)) ((_ sign_extend 32) (currentBit!14898 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!27844 () Bool)

(assert (= bs!27844 d!105698))

(assert (=> bs!27844 m!460409))

(assert (=> d!105642 d!105698))

(declare-fun d!105700 () Bool)

(assert (=> d!105700 (= (remainingBits!0 ((_ sign_extend 32) (size!8944 (buf!8086 (_2!13389 lt!444719)))) ((_ sign_extend 32) (currentByte!14903 (_2!13389 lt!444719))) ((_ sign_extend 32) (currentBit!14898 (_2!13389 lt!444719)))) (bvsub (bvmul ((_ sign_extend 32) (size!8944 (buf!8086 (_2!13389 lt!444719)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14903 (_2!13389 lt!444719))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14898 (_2!13389 lt!444719))))))))

(assert (=> d!105656 d!105700))

(declare-fun d!105702 () Bool)

(declare-fun e!232168 () Bool)

(assert (=> d!105702 e!232168))

(declare-fun res!264449 () Bool)

(assert (=> d!105702 (=> (not res!264449) (not e!232168))))

(declare-fun lt!444874 () (_ BitVec 64))

(declare-fun lt!444877 () (_ BitVec 64))

(declare-fun lt!444873 () (_ BitVec 64))

(assert (=> d!105702 (= res!264449 (= lt!444877 (bvsub lt!444873 lt!444874)))))

(assert (=> d!105702 (or (= (bvand lt!444873 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444874 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444873 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444873 lt!444874) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105702 (= lt!444874 (remainingBits!0 ((_ sign_extend 32) (size!8944 (buf!8086 (_2!13393 (increaseBitIndex!0 thiss!1793))))) ((_ sign_extend 32) (currentByte!14903 (_2!13393 (increaseBitIndex!0 thiss!1793)))) ((_ sign_extend 32) (currentBit!14898 (_2!13393 (increaseBitIndex!0 thiss!1793))))))))

(declare-fun lt!444876 () (_ BitVec 64))

(declare-fun lt!444878 () (_ BitVec 64))

(assert (=> d!105702 (= lt!444873 (bvmul lt!444876 lt!444878))))

(assert (=> d!105702 (or (= lt!444876 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!444878 (bvsdiv (bvmul lt!444876 lt!444878) lt!444876)))))

(assert (=> d!105702 (= lt!444878 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105702 (= lt!444876 ((_ sign_extend 32) (size!8944 (buf!8086 (_2!13393 (increaseBitIndex!0 thiss!1793))))))))

(assert (=> d!105702 (= lt!444877 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14903 (_2!13393 (increaseBitIndex!0 thiss!1793)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14898 (_2!13393 (increaseBitIndex!0 thiss!1793))))))))

(assert (=> d!105702 (invariant!0 (currentBit!14898 (_2!13393 (increaseBitIndex!0 thiss!1793))) (currentByte!14903 (_2!13393 (increaseBitIndex!0 thiss!1793))) (size!8944 (buf!8086 (_2!13393 (increaseBitIndex!0 thiss!1793)))))))

(assert (=> d!105702 (= (bitIndex!0 (size!8944 (buf!8086 (_2!13393 (increaseBitIndex!0 thiss!1793)))) (currentByte!14903 (_2!13393 (increaseBitIndex!0 thiss!1793))) (currentBit!14898 (_2!13393 (increaseBitIndex!0 thiss!1793)))) lt!444877)))

(declare-fun b!322166 () Bool)

(declare-fun res!264450 () Bool)

(assert (=> b!322166 (=> (not res!264450) (not e!232168))))

(assert (=> b!322166 (= res!264450 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444877))))

(declare-fun b!322167 () Bool)

(declare-fun lt!444875 () (_ BitVec 64))

(assert (=> b!322167 (= e!232168 (bvsle lt!444877 (bvmul lt!444875 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!322167 (or (= lt!444875 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!444875 #b0000000000000000000000000000000000000000000000000000000000001000) lt!444875)))))

(assert (=> b!322167 (= lt!444875 ((_ sign_extend 32) (size!8944 (buf!8086 (_2!13393 (increaseBitIndex!0 thiss!1793))))))))

(assert (= (and d!105702 res!264449) b!322166))

(assert (= (and b!322166 res!264450) b!322167))

(declare-fun m!460429 () Bool)

(assert (=> d!105702 m!460429))

(declare-fun m!460431 () Bool)

(assert (=> d!105702 m!460431))

(assert (=> b!322134 d!105702))

(assert (=> b!322134 d!105690))

(declare-fun d!105706 () Bool)

(declare-fun e!232169 () Bool)

(assert (=> d!105706 e!232169))

(declare-fun res!264451 () Bool)

(assert (=> d!105706 (=> (not res!264451) (not e!232169))))

(declare-fun lt!444880 () (_ BitVec 64))

(declare-fun lt!444879 () (_ BitVec 64))

(declare-fun lt!444883 () (_ BitVec 64))

(assert (=> d!105706 (= res!264451 (= lt!444883 (bvsub lt!444879 lt!444880)))))

(assert (=> d!105706 (or (= (bvand lt!444879 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444880 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444879 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444879 lt!444880) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105706 (= lt!444880 (remainingBits!0 ((_ sign_extend 32) (size!8944 (buf!8086 thiss!1793))) ((_ sign_extend 32) (currentByte!14903 thiss!1793)) ((_ sign_extend 32) (currentBit!14898 thiss!1793))))))

(declare-fun lt!444882 () (_ BitVec 64))

(declare-fun lt!444884 () (_ BitVec 64))

(assert (=> d!105706 (= lt!444879 (bvmul lt!444882 lt!444884))))

(assert (=> d!105706 (or (= lt!444882 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!444884 (bvsdiv (bvmul lt!444882 lt!444884) lt!444882)))))

(assert (=> d!105706 (= lt!444884 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105706 (= lt!444882 ((_ sign_extend 32) (size!8944 (buf!8086 thiss!1793))))))

(assert (=> d!105706 (= lt!444883 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14903 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14898 thiss!1793))))))

(assert (=> d!105706 (invariant!0 (currentBit!14898 thiss!1793) (currentByte!14903 thiss!1793) (size!8944 (buf!8086 thiss!1793)))))

(assert (=> d!105706 (= (bitIndex!0 (size!8944 (buf!8086 thiss!1793)) (currentByte!14903 thiss!1793) (currentBit!14898 thiss!1793)) lt!444883)))

(declare-fun b!322168 () Bool)

(declare-fun res!264452 () Bool)

(assert (=> b!322168 (=> (not res!264452) (not e!232169))))

(assert (=> b!322168 (= res!264452 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444883))))

(declare-fun b!322169 () Bool)

(declare-fun lt!444881 () (_ BitVec 64))

(assert (=> b!322169 (= e!232169 (bvsle lt!444883 (bvmul lt!444881 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!322169 (or (= lt!444881 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!444881 #b0000000000000000000000000000000000000000000000000000000000001000) lt!444881)))))

(assert (=> b!322169 (= lt!444881 ((_ sign_extend 32) (size!8944 (buf!8086 thiss!1793))))))

(assert (= (and d!105706 res!264451) b!322168))

(assert (= (and b!322168 res!264452) b!322169))

(assert (=> d!105706 m!460409))

(assert (=> d!105706 m!460397))

(assert (=> b!322134 d!105706))

(declare-fun d!105708 () Bool)

(assert (=> d!105708 (= (invariant!0 (currentBit!14898 thiss!1793) (currentByte!14903 thiss!1793) (size!8944 (buf!8086 thiss!1793))) (and (bvsge (currentBit!14898 thiss!1793) #b00000000000000000000000000000000) (bvslt (currentBit!14898 thiss!1793) #b00000000000000000000000000001000) (bvsge (currentByte!14903 thiss!1793) #b00000000000000000000000000000000) (or (bvslt (currentByte!14903 thiss!1793) (size!8944 (buf!8086 thiss!1793))) (and (= (currentBit!14898 thiss!1793) #b00000000000000000000000000000000) (= (currentByte!14903 thiss!1793) (size!8944 (buf!8086 thiss!1793)))))))))

(assert (=> d!105658 d!105708))

(push 1)

(assert (not d!105702))

(assert (not b!322154))

(assert (not d!105706))

(assert (not d!105698))

(assert (not d!105690))

(check-sat)

(pop 1)

(push 1)

(check-sat)

